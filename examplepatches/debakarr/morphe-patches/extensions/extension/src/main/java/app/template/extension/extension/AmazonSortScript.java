package app.template.extension.extension;

/**
 * Page script injected into Amazon's WebView.
 *
 * <p>Safe to evaluate any number of times per page: the first evaluation
 * installs the UI and a MutationObserver, later ones only trigger a refresh.
 * It stays idle on pages without search result cards.
 *
 * <ul>
 *   <li>"Sort" cycles off / "Most rated" / "Top rated". Most rated orders every
 *       loaded organic result by number of ratings (ties: higher average), Top
 *       rated by average rating (ties: more ratings), across all infinite-scroll
 *       chunks, and keeps doing so as new results stream in. Sponsored cards keep
 *       their slots; products with no number to sort by go last.</li>
 *   <li>"4&#9733;+" hides products rated below 4. Unrated ones are unknown, not
 *       "below 4", so they stay.</li>
 *   <li>"Hide ads" hides sponsored results, including ones loaded later.</li>
 *   <li>"Ranked (N)" opens a list of every product seen so far, across pages, in
 *       either order; "Load 5 more pages" fetches the following result pages with
 *       the page's own session (same origin) and adds them, so the ranking is not
 *       limited to what has been scrolled. Each row opens the product.</li>
 *   <li>The toggles are remembered, so the next search is sorted / cleaned as
 *       soon as it renders.</li>
 * </ul>
 *
 * <p>Note: this is a Java text block, so every JS backslash is doubled.
 */
final class AmazonSortScript {

    private AmazonSortScript() {}

    static final String JS = """
(function () {
  'use strict';
  if (window.__morpheSort) { window.__morpheSort.refresh(); return; }

  var MODE_KEY = 'morphe.sortMode', LEGACY_SORT_KEY = 'morphe.sortByRatings';
  var FOUR_KEY = 'morphe.minFour', ADS_KEY = 'morphe.hideAds';
  var RANK_BTN = 'morphe-ranked', SORT_BTN = 'morphe-sort-ratings', FOUR_BTN = 'morphe-min-four', ADS_BTN = 'morphe-hide-ads';
  var PANEL = 'morphe-ranked-panel';
  var ORDER = 'data-morphe-order', HIDDEN = 'data-morphe-ad', LOW = 'data-morphe-low';
  var COUNT_RE = /([0-9][0-9,]*(?:[.][0-9]+)?) ?([kKmM])?/;
  var LABELLED_RE = /([0-9][0-9,.]* ?[kKmM]?) ?(?:global )?(?:ratings?|reviews?)/i;
  var BARE_RE = /^[(]? ?([0-9][0-9,.]* ?[kKmM]?) ?[)]?$/;
  // Mobile cards render "4.3 4.3 out of 5 stars. 4,962₹1,499" - the count
  // follows the stars, optionally in brackets and after a repeated score.
  var AFTER_STARS_RE = /out of 5 stars[.]? ?(?:[0-5][.][0-9] ?)?[(]? ?([0-9][0-9,]*(?:[.][0-9]+)? ?[kKmM]?)/i;
  var STARS_RE = /([0-5](?:[.][0-9]+)?) out of 5/i;
  var MIN_RATING = 4;
  var PAGE_CAP = 5;       // pages fetched per "load more" press

  var seq = 0, timer = null, observer = null;
  var cache = new WeakMap();
  var store = new Map();  // asin -> product, across every page seen or fetched

  function pref(key) { try { return localStorage.getItem(key) === '1'; } catch (e) { return false; } }
  function setPref(key, on) { try { localStorage.setItem(key, on ? '1' : '0'); } catch (e) {} }
  function loadMode() {
    try {
      var m = localStorage.getItem(MODE_KEY);
      if (m === 'off' || m === 'count' || m === 'rating') return m;
      return localStorage.getItem(LEGACY_SORT_KEY) === '1' ? 'count' : 'off';
    } catch (e) { return 'off'; }
  }
  function saveMode(m) { try { localStorage.setItem(MODE_KEY, m); } catch (e) {} }
  var state = { mode: loadMode(), four: pref(FOUR_KEY), ads: pref(ADS_KEY) };
  var panel = { mode: state.mode === 'rating' ? 'rating' : 'count', four: state.four, scanned: 0, scanning: false, note: '' };

  function text(el) {
    return String((el && el.textContent) || '').replace(/[\\s ]+/g, ' ').trim();
  }

  function parseCount(s) {
    var m = String(s || '').match(COUNT_RE);
    if (!m) return -1;
    var n = parseFloat(m[1].replace(/,/g, ''));
    if (!isFinite(n) || n <= 0) return -1;
    if (m[2]) n *= /k/i.test(m[2]) ? 1e3 : 1e6;
    return Math.round(n);
  }

  function readCount(card) {
    var i, m;
    var labelled = card.querySelectorAll('[aria-label]');
    for (i = 0; i < labelled.length; i++) {
      m = (labelled[i].getAttribute('aria-label') || '').match(LABELLED_RE);
      if (m) return parseCount(m[1]);
    }
    var holders = card.querySelectorAll('a[href*="customerReviews"], .s-underline-text');
    for (i = 0; i < holders.length; i++) {
      m = text(holders[i]).match(BARE_RE);
      if (m) return parseCount(m[1]);
    }
    var t = text(card);
    m = t.match(LABELLED_RE) || t.match(AFTER_STARS_RE);
    return m ? parseCount(m[1]) : -1;
  }

  // Average rating from "4.3 out of 5 stars"; -1 when the card shows none.
  function readRating(card) {
    var labelled = card.querySelectorAll('[aria-label]');
    for (var i = 0; i < labelled.length; i++) {
      var m = (labelled[i].getAttribute('aria-label') || '').match(STARS_RE);
      if (m) { var v = parseFloat(m[1]); if (v > 0 && v <= 5) return v; }
    }
    var t = text(card).match(STARS_RE);
    if (t) { var w = parseFloat(t[1]); if (w > 0 && w <= 5) return w; }
    return -1;
  }

  function isSponsored(card) {
    var h = String(card.className || '') + ' ' + (card.getAttribute('data-component-type') || '')
      + ' ' + (card.getAttribute('cel_widget_id') || '') + ' ' + (card.getAttribute('data-cel-widget') || '');
    if (/AdHolder|sponsored|sbv-ad|s-widget-sponsored/i.test(h)) return true;
    if (card.querySelector('.puis-sponsored-label-text, .s-sponsored-label-text, '
        + '.puis-sponsored-label-info-icon, [data-ad-feedback], [aria-label="Sponsored"]')) return true;
    return /^Sponsored/.test(text(card).slice(0, 40));
  }

  // Cards whose rating block has not rendered yet are re-read on later
  // passes (up to 5 times) instead of being stuck at "no ratings".
  function info(card) {
    var c = cache.get(card);
    if (!c) { c = { ad: isSponsored(card), n: -1, r: -1, tries: 0 }; cache.set(card, c); }
    if ((c.n < 0 || c.r < 0) && c.tries < 5) {
      c.tries++;
      if (c.n < 0) c.n = readCount(card);
      if (c.r < 0) c.r = readRating(card);
    }
    return c;
  }

  function cardList(root) {
    var list = root.querySelectorAll('[data-component-type="s-search-result"]');
    if (!list.length) {
      list = root.querySelectorAll('.s-main-slot > [data-asin]:not([data-asin=""]), '
        + '.s-search-results > [data-asin]:not([data-asin=""])');
    }
    return list;
  }

  function findCards() {
    var list = cardList(document);
    var out = [];
    for (var i = 0; i < list.length; i++) {
      var el = list[i];
      if (!el.parentNode || !el.parentElement) continue;
      // Skip cards nested in another result or inside a carousel widget:
      // only the main list is sorted, so nothing swaps into a carousel slot.
      if (el.parentElement.closest('[data-component-type="s-search-result"], .s-widget')) continue;
      if (!el.hasAttribute(ORDER)) el.setAttribute(ORDER, String(seq++));
      out.push(el);
    }
    return out;
  }

  // Everything the page says about a card, for the ranked list.
  function describe(card) {
    var asin = card.getAttribute('data-asin') || '';
    if (!asin) return null;
    var heads = card.querySelectorAll('h2'), parts = [];
    for (var i = 0; i < heads.length; i++) { var t = text(heads[i]); if (t) parts.push(t); }
    var price = text(card.querySelector('.a-price .a-offscreen')).replace(/[^0-9.]/g, '');
    var c = info(card);
    return { id: asin, title: parts.join(' ') || 'Product', price: parseFloat(price) || -1,
      r: c.r, n: c.n, url: '/dp/' + asin };
  }

  function remember(card) {
    if (info(card).ad) return;
    var p = describe(card);
    if (!p) return;
    var old = store.get(p.id);
    if (!old || (old.r < 0 && p.r > 0) || (old.n < 0 && p.n > 0)) store.set(p.id, p);
  }

  // Higher first; unknown (-1) last. Count mode ties go to the higher average, rating mode to more ratings.
  function cmp(mode, a, b) {
    var a1 = mode === 'rating' ? a.r : a.n, b1 = mode === 'rating' ? b.r : b.n;
    var a2 = mode === 'rating' ? a.n : a.r, b2 = mode === 'rating' ? b.n : b.r;
    return (b1 - a1) || (b2 - a2);
  }

  function isLow(r) { return r > 0 && r < MIN_RATING; }

  // Hides organic cards rated below 4 (unrated ones are unknown, not "below 4", and stay).
  function applyMinRating(cards, on) {
    var hidden = 0;
    cards.forEach(function (c) {
      var low = on && !info(c).ad && isLow(info(c).r);
      if (low) {
        if (!c.hasAttribute(LOW)) { c.setAttribute(LOW, '1'); c.style.setProperty('display', 'none', 'important'); }
        hidden++;
      } else if (c.hasAttribute(LOW)) {
        c.removeAttribute(LOW);
        if (!c.hasAttribute(HIDDEN)) c.style.removeProperty('display');
      }
    });
    return hidden;
  }

  // Sorts the organic cards globally. Each card is dropped into one of the
  // slots the organic cards occupied before, so ads, headers and chunk
  // containers stay exactly where the page put them.
  function arrange(cards, mode) {
    var organic = cards.filter(function (c) { return !info(c).ad && !c.hasAttribute(LOW); });
    if (organic.length < 2) return organic.length;
    var items = organic.map(function (c) {
      var i = info(c);
      return { el: c, n: i.n, r: i.r, o: +c.getAttribute(ORDER) };
    });
    items.sort(function (a, b) { return (mode === 'off' ? 0 : cmp(mode, a, b)) || (a.o - b.o); });
    var same = true;
    for (var i = 0; i < items.length && same; i++) same = items[i].el === organic[i];
    if (same) return organic.length;
    var marks = organic.map(function (c) {
      var m = document.createComment('morphe');
      c.parentNode.insertBefore(m, c);
      return m;
    });
    items.forEach(function (it, idx) { marks[idx].parentNode.insertBefore(it.el, marks[idx]); });
    marks.forEach(function (m) { m.parentNode.removeChild(m); });
    return organic.length;
  }

  // Sponsored carousels: a .s-widget whose header carries the sponsored label.
  function adWidgets() {
    var out = [], labels = document.querySelectorAll('.s-widget-sponsored-label-text');
    for (var i = 0; i < labels.length; i++) {
      var w = labels[i].closest('.s-widget');
      if (w && out.indexOf(w) < 0) out.push(w);
    }
    // Sponsored-brand / sponsored-video banners sit outside the results list
    // (data-cel-widget="sb-..." / "sbv-..."); hide the outermost one.
    var sb = document.querySelectorAll('[data-cel-widget^="sb-"], [data-cel-widget^="sbv-"]');
    for (var j = 0; j < sb.length; j++) {
      var outer = sb[j].parentElement && sb[j].parentElement.closest('[data-cel-widget^="sb-"], [data-cel-widget^="sbv-"]');
      if (!outer && out.indexOf(sb[j]) < 0) out.push(sb[j]);
    }
    return out;
  }

  function setAdsHidden(cards, hide) {
    var n = 0;
    var shown = document.querySelectorAll('[' + HIDDEN + '="w"]');
    for (var s = 0; s < shown.length; s++) {
      if (!hide) { shown[s].removeAttribute(HIDDEN); shown[s].style.removeProperty('display'); }
    }
    if (hide) {
      adWidgets().forEach(function (w) {
        if (w.getAttribute(HIDDEN) !== 'w') { w.setAttribute(HIDDEN, 'w'); w.style.setProperty('display', 'none', 'important'); }
        n++;
      });
    }
    cards.forEach(function (c) {
      if (hide && info(c).ad) {
        if (!c.hasAttribute(HIDDEN)) { c.setAttribute(HIDDEN, '1'); c.style.setProperty('display', 'none', 'important'); }
        n++;
      } else if (!hide && c.hasAttribute(HIDDEN)) {
        c.removeAttribute(HIDDEN);
        if (!c.hasAttribute(LOW)) c.style.removeProperty('display');
      }
    });
    return n;
  }

  function button(id, bottom, onTap) {
    var b = document.getElementById(id);
    if (b) return b;
    b = document.createElement('button');
    b.id = id; b.type = 'button';
    b.style.cssText = 'position:fixed;right:12px;bottom:' + bottom + 'px;z-index:2147483647;'
      + 'padding:10px 14px;border-radius:20px;border:1px solid #888;background:#232f3e;color:#fff;'
      + 'font:bold 13px sans-serif;box-shadow:0 2px 8px rgba(0,0,0,.4)';
    b.addEventListener('click', function (e) { e.preventDefault(); e.stopPropagation(); onTap(); });
    document.documentElement.appendChild(b);
    return b;
  }

  function nextMode(m) { return m === 'off' ? 'count' : (m === 'count' ? 'rating' : 'off'); }

  function render(cards, sorted, hidden, low) {
    var show = cards.length >= 2;
    var rb = button(RANK_BTN, 244, function () { togglePanel(); });
    var sb = button(SORT_BTN, 76, function () {
      state.mode = nextMode(state.mode); saveMode(state.mode);
      if (state.mode !== 'off') panel.mode = state.mode;
      refresh();
    });
    var fb = button(FOUR_BTN, 188, function () {
      state.four = !state.four; setPref(FOUR_KEY, state.four); refresh();
    });
    var ab = button(ADS_BTN, 132, function () {
      state.ads = !state.ads; setPref(ADS_KEY, state.ads);
      refresh();
    });
    rb.style.display = sb.style.display = fb.style.display = ab.style.display = show ? '' : 'none';
    rb.textContent = 'Ranked (' + store.size + ')';
    sb.textContent = state.mode === 'count' ? 'Most rated ✓ (' + sorted + ')'
      : state.mode === 'rating' ? 'Top rated ✓ (' + sorted + ')' : 'Sort: Off';
    fb.textContent = state.four ? '4★+ ✓ (' + low + ' hidden)' : '4★+';
    ab.textContent = state.ads ? 'Ads hidden (' + hidden + ')' : 'Hide ads';
    sb.style.background = state.mode !== 'off' ? '#067d62' : '#232f3e';
    fb.style.background = state.four ? '#067d62' : '#232f3e';
    ab.style.background = state.ads ? '#067d62' : '#232f3e';
  }

  /* ------------------------------------------------------------------ ranked list */

  function fmt(n) { try { return Number(n).toLocaleString('en-IN'); } catch (e) { return String(n); } }

  function metaLine(p) {
    var parts = [];
    if (p.price > 0) parts.push('₹' + fmt(Math.round(p.price)));
    if (p.r > 0) parts.push('★ ' + p.r.toFixed(1));
    if (p.n > 0) parts.push(fmt(p.n) + (p.n === 1 ? ' rating' : ' ratings'));
    else if (p.r <= 0) parts.push('no rating shown');
    return parts.join('  ·  ');
  }

  function ranked() {
    var list = [];
    store.forEach(function (p) { if (!(panel.four && isLow(p.r))) list.push(p); });
    var i = 0;
    list.forEach(function (p) { p.o = i++; });
    list.sort(function (a, b) { return cmp(panel.mode, a, b) || (a.o - b.o); });
    return list;
  }

  function chip(label, on, onTap) {
    var c = document.createElement('button');
    c.type = 'button'; c.textContent = label;
    c.style.cssText = 'flex:1;margin:0 3px;padding:8px 4px;border-radius:16px;border:0;color:#fff;'
      + 'font:bold 13px sans-serif;background:' + (on ? '#067d62' : '#3b4651');
    c.addEventListener('click', function (e) { e.preventDefault(); e.stopPropagation(); onTap(); });
    return c;
  }

  function drawPanel() {
    var box = document.getElementById(PANEL);
    if (!box) return;
    var all = store.size, list = ranked();
    box.textContent = '';
    var head = document.createElement('div');
    head.style.cssText = 'background:#232f3e;color:#fff;padding:14px 16px 4px;font:bold 16px sans-serif';
    head.textContent = 'Ranked: ' + (list.length === all ? all : list.length + ' of ' + all) + ' products';
    var sub = document.createElement('div');
    sub.style.cssText = 'background:#232f3e;color:#c5ccd3;padding:0 16px 10px;font:12px sans-serif';
    sub.textContent = panel.scanning ? 'Loading more result pages… ' + panel.note
      : (panel.note || 'Everything loaded so far, across pages. Amazon’s own numbers, re-arranged.');
    var bar = document.createElement('div');
    bar.style.cssText = 'background:#232f3e;display:flex;padding:0 10px 10px';
    bar.appendChild(chip(panel.mode === 'rating' ? 'Top rated' : 'Most rated', true, function () {
      panel.mode = panel.mode === 'rating' ? 'count' : 'rating'; drawPanel();
    }));
    bar.appendChild(chip(panel.four ? '4★+ ✓' : '4★+', panel.four, function () { panel.four = !panel.four; drawPanel(); }));
    bar.appendChild(chip(panel.scanning ? 'Loading…' : 'Load ' + PAGE_CAP + ' more pages', false, function () { scanMore(); }));
    bar.appendChild(chip('Close', false, function () { togglePanel(); }));
    var body = document.createElement('div');
    body.style.cssText = 'flex:1;overflow:auto;-webkit-overflow-scrolling:touch;background:#fff';
    list.slice(0, 400).forEach(function (p, i) {
      var a = document.createElement('a');
      a.href = p.url;
      a.style.cssText = 'display:block;padding:10px 16px;border-bottom:1px solid #e5e5e5;text-decoration:none;color:#111';
      var t = document.createElement('div');
      t.style.cssText = 'font:bold 15px sans-serif';
      t.textContent = (i + 1) + '.  ' + p.title;
      var m = document.createElement('div');
      m.style.cssText = 'font:13px sans-serif;color:#55606b;margin-top:2px';
      m.textContent = metaLine(p);
      a.appendChild(t); a.appendChild(m);
      body.appendChild(a);
    });
    box.appendChild(head); box.appendChild(sub); box.appendChild(bar); box.appendChild(body);
  }

  function togglePanel() {
    var box = document.getElementById(PANEL);
    if (box) { box.parentNode.removeChild(box); return; }
    box = document.createElement('div');
    box.id = PANEL;
    // Same (maximum) z-index as the floating buttons, and added after them, so the list covers them.
    box.style.cssText = 'position:fixed;left:0;top:0;right:0;bottom:0;z-index:2147483647;display:flex;flex-direction:column;background:#fff';
    document.documentElement.appendChild(box);
    findCards().forEach(remember);
    if (state.mode !== 'off') panel.mode = state.mode;
    panel.four = state.four;
    drawPanel();
  }

  function currentPage() {
    try { var p = parseInt(new URL(location.href).searchParams.get('page') || '1', 10); return p > 0 ? p : 1; } catch (e) { return 1; }
  }

  // Fetches the next result pages with the page's own session (same origin) and adds
  // their products to the ranked list. Stops at the first page that has no results.
  function scanMore() {
    if (panel.scanning) return;
    panel.scanning = true;
    var done = Math.max(panel.scanned, currentPage()), target = done + PAGE_CAP;
    var added = 0;
    function step(page) {
      if (page > target) { finish('Loaded pages up to ' + (page - 1) + '.'); return; }
      panel.note = '(page ' + page + ')';
      drawPanel();
      var url;
      try { var u = new URL(location.href); u.searchParams.set('page', String(page)); url = u.toString(); }
      catch (e) { finish('Could not build the next page address.'); return; }
      fetch(url, { credentials: 'include' }).then(function (r) {
        if (!r.ok) throw new Error('HTTP ' + r.status);
        return r.text();
      }).then(function (html) {
        var doc = new DOMParser().parseFromString(html.replace(/<script[\\s\\S]*?<\\/script>/gi, ''), 'text/html');
        var found = 0;
        Array.prototype.forEach.call(cardList(doc), function (card) {
          if (!card.getAttribute('data-asin')) return;
          found++;
          var before = store.size;
          remember(card);
          if (store.size > before) added++;
        });
        if (!found) { finish(page === done + 1 ? 'No more result pages.' : 'Loaded pages up to ' + (page - 1) + ' (no more after that).'); return; }
        panel.scanned = page;
        step(page + 1);
      }).catch(function (e) { finish('Stopped: ' + (e && e.message ? e.message : 'request failed') + '.'); });
    }
    function finish(msg) { panel.scanning = false; panel.note = msg + ' (' + added + ' new products)'; drawPanel(); refresh(); }
    step(done + 1);
  }

  function refresh() {
    timer = null;
    var cards = findCards();
    cards.forEach(remember);
    var hidden = setAdsHidden(cards, state.ads);
    var low = applyMinRating(cards, state.four);
    var sorted = arrange(cards, state.mode);
    render(cards, state.mode === 'off' ? 0 : sorted, hidden, low);
    if (document.getElementById(PANEL) && !panel.scanning) drawPanel();
    // Drop the records our own DOM moves produced so they cannot re-trigger us.
    if (observer) observer.takeRecords();
  }

  // Throttled (not debounced): Amazon mutates the DOM constantly, a debounce
  // would never fire while carousels animate.
  function schedule() { if (!timer) timer = setTimeout(refresh, 350); }

  observer = new MutationObserver(schedule);
  observer.observe(document.documentElement, { childList: true, subtree: true });
  window.__morpheSort = { refresh: schedule, store: store, state: state, panel: panel };
  refresh();
})();
""";
}
