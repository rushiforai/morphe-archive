(function () {
  'use strict';
  var supported = Array.from(document.querySelectorAll('#site-language option'), function (option) { return option.value; });
  var catalogs = {}, loading = {}, language = 'es', sequence = 0, languageReady = false;
  var releases = [], filter = 'all', releaseStatus = 'loading', refreshed = null;
  var select = document.getElementById('site-language');
  var storageKey = 'tiktoklite.site.language';
  var REPO = 'KyVexo/tiktok-lite-patches';
  function $(id) { return document.getElementById(id); }

  function normalize(value) {
    var code = String(value || '').toLowerCase().replace(/_/g, '-').split('-')[0];
    return supported.indexOf(code) >= 0 ? code : null;
  }
  function initialLanguage() {
    var query = normalize(new URL(location.href).searchParams.get('lang'));
    if (query) return query;
    try { var saved = normalize(localStorage.getItem(storageKey)); if (saved) return saved; } catch (ignored) {}
    var preferred = navigator.languages || [navigator.language];
    for (var i = 0; i < preferred.length; i++) { var code = normalize(preferred[i]); if (code) return code; }
    return 'en';
  }
  function t(key, values) {
    var chosen = catalogs[language] || {}, fallback = catalogs.en || {};
    var value = typeof chosen[key] === 'string' ? chosen[key] : fallback[key];
    if (typeof value !== 'string') return key;
    return value.replace(/\{([a-zA-Z0-9_]+)\}/g, function (token, name) {
      return values && Object.prototype.hasOwnProperty.call(values, name) ? String(values[name]) : token;
    });
  }
  function loadCatalog(code) {
    if (!loading[code]) loading[code] = fetch('locales/' + code + '.json').then(function (response) {
      if (!response.ok) throw new Error('Translation HTTP ' + response.status);
      return response.json();
    }).then(function (catalog) { catalogs[code] = catalog; return catalog; }).catch(function (error) {
      delete loading[code]; throw error;
    });
    return loading[code];
  }

  // Catalogs may retain formatting, but never supply executable markup or arbitrary links.
  function translatedContent(node, value) {
    var template = document.createElement('template');
    template.innerHTML = value;
    var allowed = ['A', 'B', 'SPAN', 'CODE', 'BR'];
    template.content.querySelectorAll('*').forEach(function (element) {
      if (allowed.indexOf(element.tagName) === -1) {
        element.replaceWith(document.createTextNode(element.textContent)); return;
      }
      Array.from(element.attributes).forEach(function (attribute) {
        var safe = attribute.name === 'href' && element.tagName === 'A' && /^https:\/\//.test(attribute.value);
        safe = safe || attribute.name === 'id' && ['hero-target', 'hero-version', 'updated'].indexOf(attribute.value) >= 0;
        safe = safe || attribute.name === 'class' && ['tag', 'updated'].indexOf(attribute.value) >= 0;
        safe = safe || attribute.name === 'dir' && attribute.value === 'ltr';
        if (!safe) element.removeAttribute(attribute.name);
      });
    });
    node.replaceChildren(template.content);
  }
  function applyLanguage() {
    document.documentElement.lang = language;
    document.documentElement.dir = language === 'ar' || language === 'ur' ? 'rtl' : 'ltr';
    document.title = t('meta.title');
    document.querySelector('meta[name="description"]').content = t('meta.description');
    document.querySelector('meta[property="og:title"]').content = t('meta.title');
    document.querySelector('meta[property="og:description"]').content = t('meta.social');
    document.querySelectorAll('[data-i18n]').forEach(function (node) { translatedContent(node, t(node.dataset.i18n)); });
    document.querySelectorAll('[data-i18n-alt]').forEach(function (node) { node.alt = t(node.dataset.i18nAlt); });
    document.querySelectorAll('[data-i18n-aria]').forEach(function (node) { node.setAttribute('aria-label', t(node.dataset.i18nAria)); });
    document.querySelectorAll('[data-gallery-key]').forEach(function (button) {
      var title = t(button.dataset.galleryKey);
      button.setAttribute('aria-label', t('gallery.expand', { title: title }));
      button.querySelector('img').alt = title;
    });
    select.value = language;
    renderStatistics();
  }
  function changeLanguage(code, remember) {
    var request = ++sequence;
    select.setAttribute('aria-busy', 'true');
    return Promise.all([loadCatalog('en'), loadCatalog(code)]).then(function () {
      if (request !== sequence) return;
      language = code; languageReady = true;
      applyLanguage(); $('language-status').textContent = '';
      if (remember) {
        try { localStorage.setItem(storageKey, code); } catch (ignored) {}
        var url = new URL(location.href); url.searchParams.set('lang', code);
        history.replaceState(null, '', url);
      }
    }).catch(function () {
      if (request !== sequence) return;
      select.value = language;
      $('language-status').textContent = languageReady ? t('language.error') : 'No se pudo cambiar el idioma. / Could not change language.';
    }).finally(function () { if (request === sequence) select.removeAttribute('aria-busy'); });
  }
  select.addEventListener('change', function () { changeLanguage(select.value, true); });

  function ago(date) {
    var days = Math.max(0, Math.round((Date.now() - date.getTime()) / 86400000));
    if (!days) return t('stats.today');
    if (days === 1) return t('stats.yesterday');
    if (days < 30) return new Intl.RelativeTimeFormat(language, { numeric: 'auto' }).format(-days, 'day');
    return new Intl.DateTimeFormat(language, { day: 'numeric', month: 'short', year: 'numeric' }).format(date);
  }
  function message(key) {
    var paragraph = document.createElement('p'); paragraph.className = 'updated'; paragraph.textContent = t(key);
    $('bars').replaceChildren(paragraph);
  }
  function renderStatistics() {
    if (!languageReady) return;
    if (releaseStatus !== 'ready') { message(releaseStatus === 'error' ? 'stats.error' : 'stats.loading'); return; }
    var nf = new Intl.NumberFormat(language);
    var stable = releases.filter(function (r) { return !r.prerelease; });
    $('s-total').textContent = nf.format(releases.reduce(function (sum, r) { return sum + r.count; }, 0));
    $('s-releases').textContent = nf.format(stable.length);
    var current = stable[0] || releases[0];
    if (current) {
      $('s-latest').textContent = nf.format(current.count);
      $('s-latest-l').textContent = t('stats.currentVersion', { version: current.tag });
      $('s-updated').textContent = ago(current.date);
      $('hero-version').textContent = current.tag;
    }
    if (refreshed) $('updated').textContent = t('stats.refreshed', {
      time: new Intl.DateTimeFormat(language, { hour: '2-digit', minute: '2-digit' }).format(refreshed)
    });
    var list = releases.filter(function (r) { return filter === 'all' || (filter === 'dev' ? r.prerelease : !r.prerelease); });
    if (!list.length) { message('stats.empty'); return; }
    var max = Math.max.apply(null, list.map(function (r) { return r.count; }).concat([1]));
    $('bars').replaceChildren();
    list.forEach(function (r) {
      var row = document.createElement('div'); row.className = 'bar';
      var version = document.createElement('a'); version.className = 'v' + (current && r.tag === current.tag ? ' latest' : '');
      version.href = r.url; version.textContent = r.tag; version.dir = 'ltr';
      var track = document.createElement('div'); track.className = 'track';
      var fill = document.createElement('div'); fill.className = 'fill' + (r.prerelease ? ' dev' : '');
      fill.style.width = r.count / max * 100 + '%'; track.appendChild(fill);
      var count = document.createElement('div'); count.className = 'c'; count.textContent = nf.format(r.count);
      row.append(version, track, count); $('bars').appendChild(row);
    });
  }
  document.querySelectorAll('.seg button').forEach(function (button) {
    button.addEventListener('click', function () {
      filter = button.dataset.filter;
      document.querySelectorAll('.seg button').forEach(function (other) { other.setAttribute('aria-pressed', String(other === button)); });
      renderStatistics();
    });
  });
  fetch('https://api.github.com/repos/' + REPO + '/releases?per_page=100', { headers: { Accept: 'application/vnd.github+json' } })
    .then(function (response) { if (!response.ok) throw new Error('GitHub HTTP ' + response.status); return response.json(); })
    .then(function (data) {
      releases = data.filter(function (r) { return !r.draft; }).map(function (r) {
        return { tag: r.tag_name, prerelease: r.prerelease, url: r.html_url, date: new Date(r.published_at),
          count: (r.assets || []).filter(function (a) { return /\.mpp$/.test(a.name); }).reduce(function (sum, a) { return sum + a.download_count; }, 0) };
      }).sort(function (a, b) { return b.date - a.date; });
      releaseStatus = 'ready'; refreshed = new Date(); renderStatistics();
    }).catch(function () { releaseStatus = 'error'; renderStatistics(); });

  var lightbox = $('lightbox'), previousFocus;
  function closeLightbox() { lightbox.classList.remove('open'); if (previousFocus) previousFocus.focus(); }
  document.querySelectorAll('#gallery button').forEach(function (button) {
    button.addEventListener('click', function () {
      previousFocus = button;
      lightbox.querySelector('img').src = button.dataset.full;
      lightbox.querySelector('img').alt = button.querySelector('img').alt;
      lightbox.classList.add('open'); lightbox.querySelector('button').focus();
    });
  });
  lightbox.querySelector('button').addEventListener('click', closeLightbox);
  lightbox.addEventListener('click', function (event) { if (event.target === lightbox) closeLightbox(); });
  document.addEventListener('keydown', function (event) {
    if (!lightbox.classList.contains('open')) return;
    if (event.key === 'Escape') closeLightbox();
    if (event.key === 'Tab') { event.preventDefault(); lightbox.querySelector('button').focus(); }
  });
  changeLanguage(initialLanguage(), false);
})();
