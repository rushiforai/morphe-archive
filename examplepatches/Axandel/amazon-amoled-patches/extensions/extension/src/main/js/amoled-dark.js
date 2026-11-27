/*
 * AMOLED dark theme for Amazon's in-app web pages.
 *
 * This file is the readable source of WebAssets.DARK_JS. After editing it, run
 *     python3 scripts/embed_js.py
 * to regenerate extensions/extension/src/main/java/app/amazonamoled/extension/WebAssets.java.
 *
 * How it works: the whole page goes through a lightness inversion applied to the root
 * element (white #FFFFFF becomes pure black #000000, dark text becomes light, hues are kept),
 * then the content that must keep its real colors (product photos, videos, Amazon's
 * yellow/orange buttons, badges) goes through the same inversion a second time, which gives
 * the original colors back. It does not rely on Chromium's automatic darkening, which never
 * produces pure black and which pages can switch off.
 *
 * Called as: (function (cfg) {...})({b: 0.85, precise: true})
 *   b       brightness of photos and videos (0.3 to 1)
 *   precise true: exact SVG lightness inversion, false: cheaper CSS invert + hue-rotate
 * Safe to run many times on the same document: later runs only update the settings.
 */
(function (cfg) {
  try {
    var w = window;
    var d = document;
    // Sub-frames are drawn inside the inverted top document already: inverting them
    // again would make them light.
    if (w.top !== w) return;
    if (w.__amoledDark) {
      w.__amoledDark.on(cfg);
      return;
    }

    var STYLE_ID = 'amoled-dark-style';
    var SVG_ID = 'amoled-dark-svg';
    var FILTER_ID = 'amoled-dark-lightness';
    var ATTR = 'data-amoled';
    var NATIVE = 'data-amoled-native';
    var ICON = 'data-amoled-icon';
    var SEEN = 'data-amoled-seen';
    var SVG_NS = 'http://www.w3.org/2000/svg';

    // precise: for every pixel, out = x - min(r,g,b) + (1 - max(r,g,b)). White becomes pure
    //   black, hue and saturation are kept, every step stays inside [0,1], and applying it
    //   twice gives the original colors back exactly.
    // fast: the classic invert(1) hue-rotate(180deg). Cheaper on old phones, but saturated
    //   colors of photos and buttons come back a bit faded.
    var FAST_INV = 'invert(1) hue-rotate(180deg)';
    var PRECISE_INV = 'url(#' + FILTER_ID + ')';
    var INVERT_TABLE = '1 0';
    var FILTER_PRIMITIVES = [
      ['feColorMatrix', { 'in': 'SourceGraphic', result: 'r', type: 'matrix',
        values: '1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 1' }],
      ['feColorMatrix', { 'in': 'SourceGraphic', result: 'g', type: 'matrix',
        values: '0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 1' }],
      ['feColorMatrix', { 'in': 'SourceGraphic', result: 'b', type: 'matrix',
        values: '0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 1' }],
      ['feBlend', { 'in': 'r', in2: 'g', mode: 'lighten', result: 'mx1' }],
      ['feBlend', { 'in': 'mx1', in2: 'b', mode: 'lighten', result: 'mx' }],
      ['feBlend', { 'in': 'r', in2: 'g', mode: 'darken', result: 'mn1' }],
      ['feBlend', { 'in': 'mn1', in2: 'b', mode: 'darken', result: 'mn' }],
      // 1 - min
      ['feComponentTransfer', { 'in': 'mn', result: 'mninv' }, true],
      // x + (1 - min) - 1 = x - min. Coefficients add up to 1 so alpha stays 1.
      ['feComposite', { 'in': 'SourceGraphic', in2: 'mninv', operator: 'arithmetic',
        k1: '0', k2: '1', k3: '1', k4: '-1', result: 'shifted' }],
      // 1 - max
      ['feComponentTransfer', { 'in': 'mx', result: 'mxinv' }, true],
      // (x - min) + (1 - max)
      ['feComposite', { 'in': 'shifted', in2: 'mxinv', operator: 'arithmetic',
        k1: '0', k2: '1', k3: '1', k4: '0' }]
    ];

    // Elements that keep their original colors (inverted twice).
    var KEEP = [
      '.a-button-primary',
      '.a-button-oneclick',
      '.a-button-preorder',
      '.a-button-buybox',
      '.a-badge',
      '.a-badge-label',
      '[data-amoled-keep]'
    ];
    // Media that must look like the original (photos, videos, maps...).
    var MEDIA = [
      'img:not([' + ICON + '])',
      'picture',
      'video',
      'canvas',
      'embed',
      'object',
      'svg image',
      '[style*="background-image"]',
      '[style*="background:url"]',
      '[style*="background: url"]'
    ];

    function prefix(list) {
      return list.map(function (s) { return 'html[' + ATTR + '] ' + s; }).join(',');
    }

    function buildCss(b, precise) {
      var inv = precise ? PRECISE_INV : FAST_INV;
      var photo = inv + (b < 1 ? ' brightness(' + b + ')' : '');
      var containers = KEEP.concat(MEDIA).join(',');
      var inner = 'img,picture,video,canvas,embed,object,svg image,[style*="background-image"],' +
        '[style*="background:url"],[style*="background: url"],' + KEEP.join(',');
      return [
        // Invert everything. The root element is the one place where a filter does not
        // break position:fixed (sticky "Add to cart" bars, headers, bottom sheets).
        // min-height: the canvas below a short page is not filtered, so the root box must
        // always cover the viewport.
        'html[' + ATTR + ']{filter:' + inv + '!important;background-color:#fff!important;' +
          'min-height:100vh!important;color-scheme:only light!important}',
        // Re-invert photos and media so they look normal (optionally dimmed).
        prefix(MEDIA) + '{filter:' + photo + '!important}',
        // Re-invert Amazon's colored call-to-action buttons and badges.
        prefix(KEEP) + '{filter:' + inv + '!important}',
        // Never re-invert something that is already inside a re-inverted element.
        'html[' + ATTR + '] :is(' + containers + ') :is(' + inner + '){filter:none!important}',
        'html[' + ATTR + '] ::selection{background:#ffd814!important;color:#000!important}',
        // Pages that are already dark get a pure black background instead of the inversion.
        'html[' + NATIVE + '],html[' + NATIVE + '] body{background-color:#000!important}'
      ].join('\n');
    }

    var state = { b: 0.85, precise: true, active: false };
    var sheet = null;      // constructable stylesheet (not subject to CSP style-src)
    var styleEl = null;    // fallback <style> element
    var observer = null;
    var pending = false;

    function setCfg(c) {
      if (!c) return;
      if (typeof c.b === 'number' && c.b >= 0.3 && c.b <= 1) state.b = c.b;
      if (typeof c.precise === 'boolean') state.precise = c.precise;
    }

    function ensureFilter() {
      if (!state.precise || d.getElementById(SVG_ID)) return;
      var holder = d.body || d.documentElement;
      if (!holder) return;
      var svg = d.createElementNS(SVG_NS, 'svg');
      svg.setAttribute('id', SVG_ID);
      svg.setAttribute('aria-hidden', 'true');
      svg.setAttribute('width', '0');
      svg.setAttribute('height', '0');
      svg.style.position = 'absolute';
      svg.style.width = '0';
      svg.style.height = '0';
      svg.style.overflow = 'hidden';
      svg.style.pointerEvents = 'none';
      var filter = d.createElementNS(SVG_NS, 'filter');
      var fa = { id: FILTER_ID, x: '0', y: '0', width: '1', height: '1',
        filterUnits: 'objectBoundingBox', 'color-interpolation-filters': 'sRGB' };
      for (var k in fa) filter.setAttribute(k, fa[k]);
      FILTER_PRIMITIVES.forEach(function (p) {
        var el = d.createElementNS(SVG_NS, p[0]);
        for (var a in p[1]) el.setAttribute(a, p[1][a]);
        if (p[2]) {
          ['feFuncR', 'feFuncG', 'feFuncB'].forEach(function (f) {
            var fn = d.createElementNS(SVG_NS, f);
            fn.setAttribute('type', 'table');
            fn.setAttribute('tableValues', INVERT_TABLE);
            el.appendChild(fn);
          });
        }
        filter.appendChild(el);
      });
      svg.appendChild(filter);
      holder.appendChild(svg);
    }

    function ensureStyle() {
      var root = d.documentElement;
      if (!root) return;
      ensureFilter();
      var text = buildCss(state.b, state.precise);
      if (!sheet && !styleEl) {
        try {
          if ('adoptedStyleSheets' in d) {
            sheet = new CSSStyleSheet();
            sheet.__amoledText = '';
          }
        } catch (e) { sheet = null; }
      }
      if (sheet) {
        if (sheet.__amoledText !== text) {
          sheet.replaceSync(text);
          sheet.__amoledText = text;
        }
        var list = d.adoptedStyleSheets;
        if (list.indexOf(sheet) < 0) d.adoptedStyleSheets = list.concat([sheet]);
        return;
      }
      if (!styleEl || !styleEl.isConnected) {
        styleEl = d.getElementById(STYLE_ID) || d.createElement('style');
        styleEl.id = STYLE_ID;
        (d.head || root).appendChild(styleEl);
      }
      if (styleEl.textContent !== text) styleEl.textContent = text;
    }

    function setStyleDisabled(disabled) {
      if (sheet) sheet.disabled = disabled;
      else if (styleEl && styleEl.sheet) styleEl.sheet.disabled = disabled;
    }

    function luminance(color) {
      var m = /rgba?\(([^)]+)\)/.exec(color || '');
      if (!m) return null;
      var p = m[1].split(/[ ,\/]+/).filter(Boolean).map(parseFloat);
      if (p.length > 3 && p[3] === 0) return null; // transparent
      return (0.2126 * p[0] + 0.7152 * p[1] + 0.0722 * p[2]) / 255;
    }

    // Decide whether the page is light (invert it) or already dark (only blacken it).
    function checkNativeDark() {
      var root = d.documentElement;
      var body = d.body;
      if (!root || !body || !state.active) return;
      setStyleDisabled(true);
      var l = luminance(getComputedStyle(body).backgroundColor);
      if (l === null) l = luminance(getComputedStyle(root).backgroundColor);
      setStyleDisabled(false);
      if (l !== null && l < 0.3) {
        root.removeAttribute(ATTR);
        root.setAttribute(NATIVE, '');
      } else {
        root.removeAttribute(NATIVE);
        root.setAttribute(ATTR, '');
      }
    }

    // Small images and SVGs are icons: they stay inverted, so dark icons become light.
    function classify(img) {
      if (img.hasAttribute(SEEN)) return;
      var src = img.currentSrc || img.src || '';
      var icon = false;
      if (/\.svg([?#]|$)/i.test(src) || /^data:image\/svg/i.test(src)) {
        icon = true;
      } else {
        var nw = img.naturalWidth;
        var nh = img.naturalHeight;
        if ((!nw || !nh) && !img.complete) {
          img.addEventListener('load', function () { classify(img); }, { once: true });
          return;
        }
        var r = img.getBoundingClientRect();
        var natural = Math.max(nw || 0, nh || 0);
        var shown = Math.max(r.width, r.height);
        if ((natural > 0 && natural <= 40) || (shown > 0 && shown <= 28)) icon = true;
        // Amazon serves product and content photos from /images/I/: never icons.
        if (/\/images\/I\//.test(src)) icon = false;
      }
      img.setAttribute(SEEN, '');
      if (icon) img.setAttribute(ICON, '');
    }

    function scan() {
      pending = false;
      if (!state.active) return;
      var root = d.documentElement;
      if (!root) return;
      ensureStyle();
      if (!root.hasAttribute(ATTR) && !root.hasAttribute(NATIVE)) root.setAttribute(ATTR, '');
      var imgs = d.getElementsByTagName('img');
      for (var i = 0; i < imgs.length; i++) {
        if (!imgs[i].hasAttribute(SEEN)) classify(imgs[i]);
      }
    }

    function schedule() {
      if (pending) return;
      pending = true;
      if (w.requestAnimationFrame) w.requestAnimationFrame(scan);
      else setTimeout(scan, 16);
    }

    function on(c) {
      setCfg(c);
      state.active = true;
      var root = d.documentElement;
      if (!root) {
        // Injected before the document element exists: wait for it.
        if (w.MutationObserver) {
          var wait = new MutationObserver(function () {
            if (d.documentElement) { wait.disconnect(); on(); }
          });
          wait.observe(d, { childList: true });
        }
        return;
      }
      ensureStyle();
      if (!root.hasAttribute(NATIVE)) root.setAttribute(ATTR, '');
      if (!observer && w.MutationObserver) {
        observer = new MutationObserver(schedule);
        observer.observe(root, { childList: true, subtree: true });
      }
      if (d.readyState === 'loading') {
        d.addEventListener('DOMContentLoaded', function () { checkNativeDark(); scan(); }, { once: true });
      } else {
        checkNativeDark();
      }
      w.addEventListener('load', function () { checkNativeDark(); scan(); }, { once: true });
      schedule();
    }

    function off() {
      state.active = false;
      if (observer) { observer.disconnect(); observer = null; }
      var root = d.documentElement;
      if (root) { root.removeAttribute(ATTR); root.removeAttribute(NATIVE); }
      if (sheet) {
        d.adoptedStyleSheets = d.adoptedStyleSheets.filter(function (s) { return s !== sheet; });
      }
      if (styleEl && styleEl.parentNode) styleEl.parentNode.removeChild(styleEl);
      var svg = d.getElementById(SVG_ID);
      if (svg && svg.parentNode) svg.parentNode.removeChild(svg);
    }

    w.__amoledDark = { on: on, off: off };
    on(cfg);
  } catch (e) {
    // Never break the page.
  }
})
