package app.template.extension.extension;

/**
 * Page script injected into Amazon's WebView.
 *
 * <p>Safe to evaluate any number of times per page: the first evaluation
 * installs the UI and a MutationObserver, later ones only trigger a refresh.
 * It stays idle on pages without search result cards.
 *
 * <ul>
 *   <li>"Sort: Most rated" re-orders every loaded organic result by rating
 *       count, across all infinite-scroll chunks, and keeps doing so as new
 *       results stream in. Sponsored cards keep their slots.</li>
 *   <li>"Hide ads" hides sponsored results, including ones loaded later.</li>
 *   <li>Both toggles are remembered, so the next search is sorted / cleaned
 *       as soon as it renders.</li>
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

  var SORT_KEY = 'morphe.sortByRatings', ADS_KEY = 'morphe.hideAds';
  var SORT_BTN = 'morphe-sort-ratings', ADS_BTN = 'morphe-hide-ads';
  var ORDER = 'data-morphe-order', HIDDEN = 'data-morphe-ad';
  var COUNT_RE = /([0-9][0-9,]*(?:[.][0-9]+)?) ?([kKmM])?/;
  var LABELLED_RE = /([0-9][0-9,.]* ?[kKmM]?) ?(?:global )?(?:ratings?|reviews?)/i;
  var BARE_RE = /^[(]? ?([0-9][0-9,.]* ?[kKmM]?) ?[)]?$/;
  // Mobile cards render "4.3 4.3 out of 5 stars. 4,962₹1,499" - the count
  // follows the stars, optionally in brackets and after a repeated score.
  var AFTER_STARS_RE = /out of 5 stars[.]? ?(?:[0-5][.][0-9] ?)?[(]? ?([0-9][0-9,]*(?:[.][0-9]+)? ?[kKmM]?)/i;

  var seq = 0, timer = null, observer = null;
  var cache = new WeakMap();

  function pref(key) { try { return localStorage.getItem(key) === '1'; } catch (e) { return false; } }
  function setPref(key, on) { try { localStorage.setItem(key, on ? '1' : '0'); } catch (e) {} }
  var state = { sort: pref(SORT_KEY), ads: pref(ADS_KEY) };

  function text(el) {
    return String((el && el.textContent) || '').replace(/[\\s\\u00a0]+/g, ' ').trim();
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
    if (!c) { c = { ad: isSponsored(card), n: -1, tries: 0 }; cache.set(card, c); }
    if (c.n < 0 && c.tries < 5) { c.tries++; c.n = readCount(card); }
    return c;
  }

  function findCards() {
    var list = document.querySelectorAll('[data-component-type="s-search-result"]');
    if (!list.length) {
      list = document.querySelectorAll('.s-main-slot > [data-asin]:not([data-asin=""]), '
        + '.s-search-results > [data-asin]:not([data-asin=""])');
    }
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

  // Sorts the organic cards globally. Each card is dropped into one of the
  // slots the organic cards occupied before, so ads, headers and chunk
  // containers stay exactly where the page put them.
  function arrange(cards, byCount) {
    var organic = cards.filter(function (c) { return !info(c).ad; });
    if (organic.length < 2) return organic.length;
    var items = organic.map(function (c) {
      return { el: c, n: byCount ? info(c).n : 0, o: +c.getAttribute(ORDER) };
    });
    items.sort(function (a, b) { return (b.n - a.n) || (a.o - b.o); });
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
        c.removeAttribute(HIDDEN); c.style.removeProperty('display');
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

  function render(cards, sorted, hidden) {
    var show = cards.length >= 2;
    var sb = button(SORT_BTN, 76, function () {
      state.sort = !state.sort; setPref(SORT_KEY, state.sort);
      if (!state.sort) arrange(findCards(), false);
      refresh();
    });
    var ab = button(ADS_BTN, 132, function () {
      state.ads = !state.ads; setPref(ADS_KEY, state.ads);
      refresh();
    });
    sb.style.display = ab.style.display = show ? '' : 'none';
    sb.textContent = state.sort ? 'Most rated \\u2713 (' + sorted + ')' : 'Sort: Most rated';
    ab.textContent = state.ads ? 'Ads hidden (' + hidden + ')' : 'Hide ads';
    sb.style.background = state.sort ? '#067d62' : '#232f3e';
    ab.style.background = state.ads ? '#067d62' : '#232f3e';
  }

  // Debug builds only: what the script sees, read back by Java via evaluateJavascript.
  function refresh() {
    timer = null;
    var cards = findCards();
    var hidden = setAdsHidden(cards, state.ads);
    var sorted = state.sort ? arrange(cards, true) : 0;
    render(cards, sorted, hidden);
    // Drop the records our own DOM moves produced so they cannot re-trigger us.
    if (observer) observer.takeRecords();
  }

  // Throttled (not debounced): Amazon mutates the DOM constantly, a debounce
  // would never fire while carousels animate.
  function schedule() { if (!timer) timer = setTimeout(refresh, 350); }

  observer = new MutationObserver(schedule);
  observer.observe(document.documentElement, { childList: true, subtree: true });
  window.__morpheSort = { refresh: schedule };
  refresh();
})();
""";
}
