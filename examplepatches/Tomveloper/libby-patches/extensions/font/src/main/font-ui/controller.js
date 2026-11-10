(function () {
  'use strict';

  var SECTION_ID = 'morphe-font-settings';
  var OVERLAY_ID = 'morphe-font-overlay';
  var NAV_ID = 'morphe-font-nav-item';
  var SECTION_FLAG = 'data-morphe-font-ui';
  var ADD_DIALOG_ID = 'morphe-font-add-dialog';
  var ROOT_FLAG = 'data-morphe-font-root';
  var ROOT_SELECTOR = 'html[' + ROOT_FLAG + '][' + ROOT_FLAG + '][' + ROOT_FLAG + ']';
  // Family rule: swaps in the uploaded font without touching weight. The
  // reading weight is a separate, optional rule so "Default" can leave the
  // app's own typography (including bold emphasis) alone.
  function familyRuleCss() {
    return ROOT_SELECTOR + ',' +
      ROOT_SELECTOR + ' body,' +
      ROOT_SELECTOR + ' body *{' +
      'font-family:MorpheFont,serif !important}';
  }

  // Weight rule: applied whether or not the custom font is on, because the
  // selector also drives the app's own font. b/strong keep a heavier weight
  // than their surroundings instead of being flattened to the same one.
  function weightRuleCss() {
    if (!hasWeight()) {
      return '';
    }
    return ROOT_SELECTOR + ',' +
      ROOT_SELECTOR + ' body,' +
      ROOT_SELECTOR + ' body *{' +
      'font-weight:' + weight + ' !important}' +
      ROOT_SELECTOR + ' b,' +
      ROOT_SELECTOR + ' strong{' +
      'font-weight:bolder !important}';
  }
  var fontCss = '';
  var enabled = false;
  var hasFont = false;
  var fontName = '';
  // 0 means "Default": no weight rule is emitted, so the app decides.
  var weight = 0;
  var statusText = 'No font selected';
  var fonts = [];
  var selectedId = '';
  var searchQuery = '';
  var editingId = '';
  var addDialog = '';
  var addQuery = '';
  var eventsWired = false;

  var PEN_SVG = '<svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">' +
    '<path fill="currentColor" d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a1 1 0 0 0 0-1.41l-2.34-2.34a1 1 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/>' +
    '</svg>';

  function topDocument() {
    try {
      return window.top.document;
    } catch (e) {
      return document;
    }
  }

  function bridge() {
    return window.MorpheFontBridge || null;
  }

  function uiHtml() {
    try {
      var b = bridge();
      if (b && typeof b.getHtml === 'function') {
        return b.getHtml();
      }
    } catch (e) {
      // The bridge is missing or the call failed; render nothing.
    }
    return '';
  }

  function uiCss() {
    try {
      var b = bridge();
      if (b && typeof b.getCss === 'function') {
        return b.getCss();
      }
    } catch (e) {
      // The bridge is missing or the call failed; inject nothing.
    }
    return '';
  }

  // The custom family and the reading weight are independent: a weight can be
  // applied to the app's own font while the custom family is off.
  function activeCss() {
    return (enabled && hasFont ? fontCss : '') + weightRuleCss();
  }

  function applyTo(doc) {
    if (!doc || !doc.head) {
      return;
    }
    if (doc.documentElement) {
      doc.documentElement.setAttribute(ROOT_FLAG, '1');
    }
    var style = doc.getElementById('morphe-font-dynamic');
    if (!style) {
      style = doc.createElement('style');
      style.id = 'morphe-font-dynamic';
      doc.head.appendChild(style);
    }
    var next = activeCss();
    if (style.textContent !== next) {
      style.textContent = next;
    }
  }

  function apply() {
    var doc = topDocument();
    var frames = doc.querySelectorAll('iframe');
    for (var i = 0; i < frames.length; i++) {
      var child = null;
      try {
        child = frames[i].contentDocument;
      } catch (e) {
        // Cross-origin iframe; ignore it.
      }
      if (child) {
        applyTo(child);
      }
    }
  }

  function onFrameLoad(event) {
    var target = event.target;
    if (!target || target.tagName !== 'IFRAME') {
      return;
    }
    // Chapter changes are a cheap, natural checkpoint: if the reader rebuilt
    // its nav bar, put our item back.
    ensureNavButton(topDocument());
    var child = null;
    try {
      child = target.contentDocument;
    } catch (e) {
      // Cross-origin iframe; ignore it.
    }
    if (child) {
      applyTo(child);
    }
  }

  // The navigation bar is Libby's, so clone the Appearance item to inherit its
  // size, spacing and halo behavior. The clone gets our own label and click
  // handling; it opens the font sheet instead of the Appearance dialog.
  function ensureNavButton(doc) {
    if (!doc.body || doc.getElementById(NAV_ID)) {
      return;
    }
    var labels = doc.querySelectorAll('.nav-action-item-label');
    var appearance = null;
    for (var i = 0; i < labels.length; i++) {
      if (labels[i].textContent.trim() === 'Appearance') {
        appearance = labels[i];
        break;
      }
    }
    var item = appearance && appearance.closest
      ? appearance.closest('.nav-action-item')
      : null;
    if (!item || !item.parentNode) {
      return;
    }
    var clone = item.cloneNode(true);
    clone.id = NAV_ID;
    clone.removeAttribute('aria-hidden');
    var button = clone.querySelector('button');
    var label = clone.querySelector('.nav-action-item-label');
    if (!button || !label) {
      return;
    }
    label.id = 'morphe-font-nav-label';
    label.removeAttribute('aria-hidden');
    label.textContent = 'Fonts';
    button.removeAttribute('disabled');
    button.removeAttribute('aria-hidden');
    button.removeAttribute('tabindex');
    button.setAttribute('aria-labelledby', label.id);
    var description = clone.querySelector('.nav-action-item-description');
    if (description) {
      description.id = 'morphe-font-nav-description';
      description.removeAttribute('aria-hidden');
      button.setAttribute('aria-describedby', description.id);
    }
    // Direct listener: the button is ours, and its click must not reach the
    // reader's delegated nav handlers.
    button.addEventListener('click', function (event) {
      event.preventDefault();
      event.stopPropagation();
      openSheet();
    });
    // The clone inherits the Appearance icon; a plain "Aa" reads as fonts.
    var icon = clone.querySelector('.nav-action-item-icon');
    if (icon) {
      icon.innerHTML = '<span class="morphe-font-nav-glyph">Aa</span>';
    }
    item.parentNode.insertBefore(clone, item.nextSibling);
  }

  function openSheet() {
    inject();
    var doc = topDocument();
    var overlay = doc.getElementById(OVERLAY_ID);
    if (!overlay) {
      return;
    }
    overlay.hidden = false;
    fitSheet();
    syncSection();
  }

  function closeSheet() {
    var doc = topDocument();
    var overlay = doc.getElementById(OVERLAY_ID);
    if (!overlay) {
      return;
    }
    // Blur first so the keyboard goes away with the sheet.
    var active = doc.activeElement;
    if (active && active !== doc.body && overlay.contains(active) &&
        typeof active.blur === 'function') {
      active.blur();
    }
    overlay.hidden = true;
  }

  // Our sheet is fixed-position, so it can end exactly at the keyboard without
  // any of the reader's settings scroller being involved.
  function fitSheet() {
    var doc = topDocument();
    var overlay = doc.getElementById(OVERLAY_ID);
    var viewport = window.visualViewport;
    if (!overlay || overlay.hidden || !viewport) {
      return;
    }
    var top = viewport.offsetTop || 0;
    var height = Math.max(120, Math.round(viewport.height));
    overlay.style.top = top + 'px';
    overlay.style.bottom = 'auto';
    overlay.style.height = height + 'px';
    var panel = overlay.querySelector('.morphe-font-panel');
    if (panel) {
      // Half the visible area. The panel body is the scroller, so longer
      // content scrolls inside the sheet instead of growing it.
      var panelHeight = Math.max(Math.min(200, height), Math.round(height * 0.6));
      panel.style.height = panelHeight + 'px';
      panel.style.maxHeight = panelHeight + 'px';
    }
    // The add-face modal is fixed too; give it the same visible area. Its own
    // sheet body then scrolls inside that area.
    var add = doc.getElementById(ADD_DIALOG_ID);
    if (add) {
      add.style.top = top + 'px';
      add.style.bottom = 'auto';
      add.style.height = height + 'px';
    }
  }

  // The shibui switch is initialized by the reader's own JS. Our copy is created
  // later, so it misses the halo/background that the original switch gets at
  // startup. Copy the visible knob color from a real, checked switch.
  function copyKnobStyle(doc, helper) {
    var offFace = doc.querySelector(
      '.shibui-form-switch-control:not(:checked) + .shibui-form-switch-face'
    );
    var onFace = doc.querySelector(
      '.shibui-form-switch-control:checked + .shibui-form-switch-face'
    );

    var bg = null;
    var img = null;

    [offFace, onFace].forEach(function (face) {
      if (!face) {
        return;
      }
      var computed = getComputedStyle(face);
      if (!bg && computed.backgroundColor &&
          computed.backgroundColor !== 'rgba(0, 0, 0, 0)' &&
          computed.backgroundColor !== 'transparent') {
        bg = computed.backgroundColor;
      }
      if (!img && computed.backgroundImage && computed.backgroundImage !== 'none') {
        img = computed.backgroundImage;
      }
    });

    if (bg) {
      helper.textContent += '\n#' + SECTION_ID +
        ' #morphe-font-enabled:not(:checked) + .shibui-form-switch-face{' +
        'background-color:' + bg + ' !important;}';
    }

    if (img) {
      helper.textContent += '\n#' + SECTION_ID +
        ' #morphe-font-enabled:not(:checked) + .shibui-form-switch-face{' +
        'background-image:' + img + ' !important;}';
    }
  }

  function refreshHelper(doc) {
    var helper = doc.getElementById('morphe-font-helper-style');
    if (!helper) {
      return;
    }
    helper.textContent = uiCss();
    copyKnobStyle(doc, helper);
  }

  function baseStatus() {
    return hasFont ? (fontName || 'Custom font') : 'No font selected';
  }

  function setStatus(section, text) {
    statusText = text || '';
    var el = section && section.querySelector('#morphe-font-status');
    // Only write when the value changes; repeated writes cause needless DOM work.
    if (el && el.textContent !== statusText) {
      el.textContent = statusText;
    }
  }

  function setSwitch(section, value) {
    var toggle = section && section.querySelector('#morphe-font-enabled');
    if (!toggle) {
      return;
    }
    if (toggle.checked !== !!value) {
      toggle.checked = !!value;
    }
    if (toggle.disabled !== !hasFont) {
      toggle.disabled = !hasFont;
    }
  }

  function setWeightField(section) {
    var select = section && section.querySelector('#morphe-font-weight');
    if (!select) {
      return;
    }
    // Always enabled: the weight applies to the app's own font too.
    if (select.disabled) {
      select.disabled = false;
    }
    var value = String(weight);
    if (select.value !== value) {
      select.value = value;
    }
  }

  function cssFormat(format) {
    return format === 'ttf' ? 'truetype'
      : format === 'otf' ? 'opentype' : format;
  }

  function weightName(weight) {
    var names = {
      100: 'Thin', 200: 'ExtraLight', 300: 'Light', 400: 'Regular',
      500: 'Medium', 600: 'SemiBold', 700: 'Bold', 800: 'ExtraBold',
      900: 'Black', 950: 'ExtraBlack'
    };
    return names[weight] || '';
  }

  function clampWeight(value, fallback) {
    var n = typeof value === 'number' ? value : parseInt(value, 10);
    if (!isFinite(n)) {
      return fallback;
    }
    return Math.max(1, Math.min(1000, Math.round(n)));
  }

  // Reading weight: 0 (or less) is "Default" and emits no rule. Positive
  // values keep the 1..1000 clamp used by faces.
  function parseWeight(value, fallback) {
    var n = typeof value === 'number' ? value : parseInt(value, 10);
    if (!isFinite(n)) {
      return fallback;
    }
    return n <= 0 ? 0 : clampWeight(n, fallback);
  }

  function hasWeight() {
    return weight > 0;
  }

  // One @font-face per face, with the descriptor taken from the pair of
  // weights. A variable face therefore contributes a real range instead of
  // being treated as a single 400 face with browser-synthesized bold.
  function fontCssFor(font) {
    if (!font || !font.faces) {
      return '';
    }
    var css = '';
    for (var i = 0; i < font.faces.length; i++) {
      var face = font.faces[i];
      if (!face.url) {
        continue;
      }
      var format = cssFormat(face.format);
      var weight = face.weightMax > face.weightMin
        ? face.weightMin + ' ' + face.weightMax
        : String(face.weight);
      css += "@font-face{font-family:MorpheFont;src:url(" + face.url + ")" +
        (format ? " format('" + format + "')" : '') + ";" +
        "font-weight:" + weight + ";" +
        "font-style:" + (face.italic ? 'italic' : 'normal') + ";" +
        "font-display:swap}";
    }
    return css ? css + familyRuleCss() : '';
  }

  function hasUsableFace(font) {
    if (!font || !font.faces) {
      return false;
    }
    for (var i = 0; i < font.faces.length; i++) {
      if (font.faces[i].url) {
        return true;
      }
    }
    return false;
  }

  function parseState(json) {
    if (!json) {
      return null;
    }
    try {
      var state = typeof json === 'string' ? JSON.parse(json) : json;
      return state && typeof state === 'object' ? state : null;
    } catch (e) {
      return null;
    }
  }

  function facesOf(item) {
    var faces = [];
    var raw = item && item.variants;
    if (raw && raw.length) {
      for (var i = 0; i < raw.length; i++) {
        var variant = raw[i];
        if (!variant) {
          continue;
        }
        var weight = clampWeight(variant.weight, 400);
        var min = clampWeight(variant.weightMin, weight);
        var max = clampWeight(variant.weightMax, weight);
        if (min > max) {
          var swap = min;
          min = max;
          max = swap;
        }
        weight = Math.max(min, Math.min(max, weight));
        faces.push({
          face: typeof variant.face === 'number' ? variant.face : i,
          name: String(variant.name || ''),
          url: String(variant.url || ''),
          format: String(variant.format || (item && item.format) || ''),
          weight: weight,
          weightMin: min,
          weightMax: max,
          italic: !!variant.italic,
          auto: !!variant.auto
        });
      }
    }
    if (!faces.length && item) {
      var single = clampWeight(item.weight, 400);
      var singleMin = clampWeight(item.weightMin, single);
      var singleMax = clampWeight(item.weightMax, single);
      if (singleMin > singleMax) {
        var swap2 = singleMin;
        singleMin = singleMax;
        singleMax = swap2;
      }
      single = Math.max(singleMin, Math.min(singleMax, single));
      faces.push({
        face: 0,
        name: String(item.name || ''),
        url: String(item.url || ''),
        format: String(item.format || ''),
        weight: single,
        weightMin: singleMin,
        weightMax: singleMax,
        italic: !!item.italic,
        auto: !!item.auto
      });
    }
    return faces;
  }

  function normalizeFonts(list) {
    var out = [];
    if (!list || !list.length) {
      return out;
    }
    for (var i = 0; i < list.length; i++) {
      var item = list[i];
      if (!item || !item.id) {
        continue;
      }
      out.push({
        id: String(item.id),
        name: String(item.name || 'Custom font'),
        format: String(item.format || ''),
        size: typeof item.size === 'number' ? item.size : 0,
        weight: clampWeight(item.weight, 400),
        faces: facesOf(item)
      });
    }
    return out;
  }

  function findFont(id) {
    if (!id) {
      return null;
    }
    for (var i = 0; i < fonts.length; i++) {
      if (fonts[i].id === id) {
        return fonts[i];
      }
    }
    return null;
  }

  // Replaces the whole UI state from one bridge payload. Called on init, after
  // an upload, and after selecting or deleting a font.
  function applyState(state) {
    if (!state || !Array.isArray(state.fonts)) {
      return false;
    }
    if (state.weight !== undefined && state.weight !== null) {
      weight = parseWeight(state.weight, 0);
    }
    fonts = normalizeFonts(state.fonts);
    selectedId = state.selected ? String(state.selected) : '';

    var selected = findFont(selectedId);
    if (!selected) {
      selectedId = '';
    }
    hasFont = !!selected;
    enabled = hasFont && !!state.enabled;
    fontName = selected ? selected.name : '';
    // A font without a usable URL only happens in the console-based dev
    // injection; keep the CSS it was started with.
    if (selected && hasUsableFace(selected)) {
      fontCss = fontCssFor(selected);
    } else if (!selected) {
      fontCss = '';
    }
    if (editingId && !findFont(editingId)) {
      editingId = '';
    }
    statusText = baseStatus();
    return true;
  }

  function formatSize(bytes) {
    var units = ['B', 'KB', 'MB', 'GB'];
    var value = bytes;
    var unit = 0;
    while (value >= 1024 && unit < units.length - 1) {
      value = value / 1024;
      unit++;
    }
    return (unit === 0 ? String(Math.round(value)) : value.toFixed(1)) +
      ' ' + units[unit];
  }

  function metaFor(font) {
    var parts = [];
    if (font.format) {
      parts.push(font.format.toUpperCase());
    }
    if (font.size > 0) {
      parts.push(formatSize(font.size));
    }
    if (font.faces && font.faces.length > 1) {
      parts.push(font.faces.length + ' faces');
    } else if (font.faces && font.faces.length === 1) {
      var face = font.faces[0];
      if (face.weightMax > face.weightMin) {
        parts.push('Variable ' + face.weightMin + '\u2013' + face.weightMax);
      } else {
        parts.push(weightName(face.weight) || String(face.weight));
      }
    }
    return parts.join(' \u00b7 ');
  }

  function visibleFonts() {
    var query = searchQuery.toLowerCase();
    if (!query) {
      return fonts;
    }
    var out = [];
    for (var i = 0; i < fonts.length; i++) {
      if (fonts[i].name.toLowerCase().indexOf(query) >= 0) {
        out.push(fonts[i]);
      }
    }
    return out;
  }

  function choiceRow(doc, font) {
    var row = doc.createElement('div');
    row.className = 'morphe-font-row' + (font.id === selectedId ? ' is-selected' : '');

    var choice = doc.createElement('button');
    choice.type = 'button';
    choice.className = 'morphe-font-choice';
    choice.setAttribute('data-font-select', font.id);
    choice.setAttribute('aria-pressed', font.id === selectedId ? 'true' : 'false');

    var name = doc.createElement('span');
    name.className = 'morphe-font-choice-name';
    name.textContent = font.name;

    var meta = doc.createElement('span');
    meta.className = 'morphe-font-choice-meta';
    meta.textContent = metaFor(font);

    choice.appendChild(name);
    choice.appendChild(meta);

    var edit = doc.createElement('button');
    edit.type = 'button';
    edit.className = 'morphe-font-edit';
    edit.setAttribute('data-font-edit', font.id);
    edit.setAttribute('aria-label', 'Edit ' + font.name);
    edit.innerHTML = PEN_SVG;

    row.appendChild(choice);
    row.appendChild(edit);
    return row;
  }

  function renderList(section) {
    if (!section) {
      return;
    }
    var list = section.querySelector('#morphe-font-list');
    if (!list) {
      return;
    }
    var search = section.querySelector('#morphe-font-search');
    var empty = section.querySelector('#morphe-font-empty');

    // A search box is only useful with more than one font. Clear the query when
    // the library shrinks so the list cannot stay filtered by a hidden box.
    if (fonts.length <= 1) {
      searchQuery = '';
    }
    if (search) {
      if (search.value !== searchQuery) {
        search.value = searchQuery;
      }
      if (search.hidden !== (fonts.length <= 1)) {
        search.hidden = fonts.length <= 1;
      }
    }

    var items = visibleFonts();
    var signature = [fonts.length, selectedId, searchQuery].join('\u0001');
    for (var i = 0; i < items.length; i++) {
      var font = items[i];
      signature += '\u0002' + font.id + '\u0001' + font.name + '\u0001' +
        metaFor(font);
    }

    // Rebuild only when something visible changed. The signature lives on the
    // list element, so a freshly injected section always renders.
    if (list.getAttribute('data-morphe-font-signature') !== signature) {
      var doc = section.ownerDocument;
      var frag = doc.createDocumentFragment();
      for (var j = 0; j < items.length; j++) {
        frag.appendChild(choiceRow(doc, items[j]));
      }
      list.textContent = '';
      list.appendChild(frag);
      list.setAttribute('data-morphe-font-signature', signature);
    }

    if (empty) {
      var text = !fonts.length
        ? 'No fonts uploaded yet.'
        : (items.length ? '' : 'No font matches "' + searchQuery + '".');
      if (empty.textContent !== text) {
        empty.textContent = text;
      }
      if (empty.hidden !== !text) {
        empty.hidden = !text;
      }
    }
  }

  function el(doc, tag, className, text) {
    var node = doc.createElement(tag);
    if (className) {
      node.className = className;
    }
    if (text !== undefined && text !== null) {
      node.textContent = text;
    }
    return node;
  }

  var WEIGHT_TICKS = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  function weightLabel(value) {
    var name = weightName(value);
    return name ? value + ' ' + name : String(value);
  }

  function weightSummary(face) {
    if (face.weightMax > face.weightMin) {
      return 'Variable ' + face.weightMin + '\u2013' + face.weightMax;
    }
    return weightLabel(face.weight);
  }

  function setActiveTick(wrap, value) {
    if (!wrap) {
      return;
    }
    var nearest = Math.round(value / 100) * 100;
    var ticks = wrap.querySelectorAll('[data-weight-tick]');
    for (var i = 0; i < ticks.length; i++) {
      var active = ticks[i].getAttribute('data-weight-tick') === String(nearest);
      if (active) {
        ticks[i].classList.add('is-active');
      } else {
        ticks[i].classList.remove('is-active');
      }
      ticks[i].classList.remove('is-in-range');
    }
  }

  function setActiveRange(wrap, low, high) {
    if (!wrap) {
      return;
    }
    var ticks = wrap.querySelectorAll('[data-weight-tick]');
    for (var i = 0; i < ticks.length; i++) {
      var tick = parseInt(ticks[i].getAttribute('data-weight-tick'), 10);
      var active = tick === low || tick === high;
      var inRange = tick >= low && tick <= high;
      if (active) {
        ticks[i].classList.add('is-active');
      } else {
        ticks[i].classList.remove('is-active');
      }
      if (inRange) {
        ticks[i].classList.add('is-in-range');
      } else {
        ticks[i].classList.remove('is-in-range');
      }
    }
  }

  // The numbers sit on every tick and the names alternate above and below so a
  // 100..900 scale fits the dialog width without shrinking the text.
  function weightLabels(doc) {
    var above = el(doc, 'div', 'morphe-weight-labels');
    var below = el(doc, 'div', 'morphe-weight-labels');

    for (var i = 0; i < WEIGHT_TICKS.length; i++) {
      var tick = WEIGHT_TICKS[i];
      var label = el(doc, 'span', 'morphe-weight-tick');
      label.setAttribute('data-weight-tick', String(tick));
      label.appendChild(el(doc, 'span', 'morphe-weight-number', String(tick)));
      label.appendChild(el(doc, 'span', 'morphe-weight-name', weightName(tick)));

      if (i === 0) {
        label.style.left = '0';
        label.style.transform = 'none';
        label.style.alignItems = 'flex-start';
      } else if (i === WEIGHT_TICKS.length - 1) {
        label.style.left = 'auto';
        label.style.right = '0';
        label.style.transform = 'none';
        label.style.alignItems = 'flex-end';
      } else {
        label.style.left = (i / (WEIGHT_TICKS.length - 1) * 100) + '%';
      }
      (i % 2 === 0 ? above : below).appendChild(label);
    }
    return { above: above, below: below };
  }

  function weightRangeLabel(low, high) {
    return weightLabel(low) + ' \u2013 ' + weightLabel(high);
  }

  function valuePercent(value) {
    var first = WEIGHT_TICKS[0];
    var last = WEIGHT_TICKS[WEIGHT_TICKS.length - 1];
    return (value - first) / (last - first) * 100;
  }

  function sliderBase(doc, index, dual) {
    var slider = el(doc, 'div', 'morphe-weight-slider' + (dual ? ' is-dual' : ''));
    slider.setAttribute('data-weight-slider', dual ? 'range' : 'weight');
    slider.setAttribute('data-face-index', String(index));
    if (dual) {
      slider.setAttribute('role', 'group');
      slider.setAttribute('aria-label', 'Weight range');
    } else {
      slider.setAttribute('tabindex', '0');
      slider.setAttribute('role', 'slider');
      slider.setAttribute('aria-label', 'Weight');
      slider.setAttribute('aria-valuemin', '100');
      slider.setAttribute('aria-valuemax', '900');
    }

    var area = el(doc, 'div', 'morphe-weight-area');
    var rail = el(doc, 'div', 'morphe-weight-rail');
    rail.appendChild(el(doc, 'div', 'morphe-weight-fill'));
    area.appendChild(rail);
    slider.appendChild(area);
    return slider;
  }

  function handleEl(doc, field, label, focusable) {
    var handle = el(doc, 'span', 'morphe-weight-handle');
    handle.setAttribute('data-weight-handle', field);
    if (focusable) {
      handle.setAttribute('role', 'slider');
      handle.setAttribute('tabindex', '0');
      handle.setAttribute('aria-label', label);
      handle.setAttribute('aria-valuemin', '100');
      handle.setAttribute('aria-valuemax', '900');
    } else {
      // The single slider's handle is decoration; the track container is the
      // one focusable slider, so there is only one tab stop.
      handle.setAttribute('aria-hidden', 'true');
    }
    return handle;
  }

  function paintSingle(scale, value) {
    var slider = scale.querySelector('[data-weight-slider]');
    if (!slider) {
      return;
    }
    var pct = valuePercent(value);
    slider.setAttribute('data-value', String(value));
    slider.setAttribute('aria-valuenow', String(value));

    var fill = slider.querySelector('.morphe-weight-fill');
    fill.style.left = '0%';
    fill.style.right = (100 - pct) + '%';

    var handle = slider.querySelector('[data-weight-handle="weight"]');
    handle.style.left = pct + '%';
    handle.setAttribute('aria-valuenow', String(value));
    setActiveTick(scale, value);
  }

  function paintDual(scale, low, high) {
    var slider = scale.querySelector('[data-weight-slider]');
    if (!slider) {
      return;
    }
    var lowPct = valuePercent(low);
    var highPct = valuePercent(high);
    slider.setAttribute('data-low', String(low));
    slider.setAttribute('data-high', String(high));

    var fill = slider.querySelector('.morphe-weight-fill');
    fill.style.left = lowPct + '%';
    fill.style.right = (100 - highPct) + '%';

    var minHandle = slider.querySelector('[data-weight-handle="min"]');
    var maxHandle = slider.querySelector('[data-weight-handle="max"]');
    minHandle.style.left = lowPct + '%';
    minHandle.setAttribute('aria-valuenow', String(low));
    maxHandle.style.left = highPct + '%';
    maxHandle.setAttribute('aria-valuenow', String(high));
    setActiveRange(scale, low, high);
  }

  function weightScale(doc, index, field, value) {
    var wrap = el(doc, 'div', 'morphe-weight-scale');
    var labels = weightLabels(doc);
    var slider = sliderBase(doc, index, false);
    slider.querySelector('.morphe-weight-area')
      .appendChild(handleEl(doc, 'weight', 'Weight', false));

    wrap.appendChild(labels.above);
    wrap.appendChild(slider);
    wrap.appendChild(labels.below);
    paintSingle(wrap, value);
    return wrap;
  }

  // One track with one or two round handles. The filled part shows the value
  // (or the selected range), and every tick still carries its number.
  function dualWeightScale(doc, index, low, high) {
    var wrap = el(doc, 'div', 'morphe-weight-scale');
    var labels = weightLabels(doc);
    var slider = sliderBase(doc, index, true);
    var area = slider.querySelector('.morphe-weight-area');
    area.appendChild(handleEl(doc, 'min', 'Lowest weight', true));
    area.appendChild(handleEl(doc, 'max', 'Highest weight', true));

    wrap.appendChild(labels.above);
    wrap.appendChild(slider);
    wrap.appendChild(labels.below);
    paintDual(wrap, low, high);
    return wrap;
  }

  function weightField(doc, index, field, labelText, value) {
    var wrap = el(doc, 'div', 'morphe-weight-field');
    wrap.setAttribute('data-weight-field', field);

    var top = el(doc, 'div', 'morphe-weight-top');
    top.appendChild(el(doc, 'span', 'morphe-weight-label', labelText));
    top.appendChild(el(doc, 'span', 'morphe-weight-value', weightLabel(value)));
    wrap.appendChild(top);
    wrap.appendChild(weightScale(doc, index, field, value));
    return wrap;
  }

  function dualWeightField(doc, index, low, high) {
    var wrap = el(doc, 'div', 'morphe-weight-field');
    wrap.setAttribute('data-weight-field', 'range');

    var top = el(doc, 'div', 'morphe-weight-top');
    top.appendChild(el(doc, 'span', 'morphe-weight-label', 'Range'));
    top.appendChild(el(doc, 'span', 'morphe-weight-value', weightRangeLabel(low, high)));
    wrap.appendChild(top);
    wrap.appendChild(dualWeightScale(doc, index, low, high));
    return wrap;
  }

  function faceBlock(doc, font, position) {
    var face = font.faces[position];
    var index = face.face;
    var variable = face.weightMax > face.weightMin;

    var block = el(doc, 'div', 'morphe-font-face');
    block.setAttribute('data-face-block', String(index));

    var head = el(doc, 'div', 'morphe-font-face-head');
    head.appendChild(el(doc, 'span', 'morphe-font-face-title',
      font.faces.length > 1 ? 'Face ' + (position + 1) : 'Face'));
    head.appendChild(el(doc, 'span', 'morphe-font-face-summary', weightSummary(face)));

    if (font.faces.length > 1) {
      var remove = el(doc, 'button', 'morphe-font-link', 'Remove');
      remove.type = 'button';
      remove.setAttribute('data-face-remove', String(index));
      remove.setAttribute('aria-label', 'Remove face ' + (position + 1));
      head.appendChild(remove);
    }
    block.appendChild(head);

    var fileName = face.name || font.name;
    var file = el(doc, 'p', 'morphe-font-face-file', fileName);
    file.title = fileName;
    block.appendChild(file);

    var flags = el(doc, 'div', 'morphe-font-flags');

    var italic = el(doc, 'label', 'morphe-font-inline');
    var italicInput = doc.createElement('input');
    italicInput.type = 'checkbox';
    italicInput.checked = !!face.italic;
    italicInput.setAttribute('data-face-italic', String(index));
    italic.appendChild(italicInput);
    italic.appendChild(doc.createTextNode('Italic'));
    flags.appendChild(italic);

    var variableLabel = el(doc, 'label', 'morphe-font-inline');
    var variableInput = doc.createElement('input');
    variableInput.type = 'checkbox';
    variableInput.checked = variable;
    variableInput.setAttribute('data-face-variable', String(index));
    variableLabel.appendChild(variableInput);
    variableLabel.appendChild(doc.createTextNode('Variable weight range'));
    flags.appendChild(variableLabel);
    block.appendChild(flags);

    if (variable) {
      block.appendChild(dualWeightField(doc, index, face.weightMin, face.weightMax));
    } else {
      block.appendChild(weightField(doc, index, 'weight', 'Weight', face.weight));
    }

    // The hint slot is always present so showing or hiding the note never
    // shifts the sliders below it.
    var hint = face.auto ? '' : (face.format === 'woff2'
      ? 'WOFF2: set the range manually.'
      : 'Weight set manually.');
    block.appendChild(el(doc, 'p', 'morphe-font-hint', hint));
    return block;
  }

  function editorSignature(font) {
    // The name is deliberately excluded: a rename happens on blur, and
    // rebuilding the panel there would swallow the click that caused the blur
    // (for example the Back button).
    var signature = font.id;
    for (var i = 0; i < font.faces.length; i++) {
      var face = font.faces[i];
      signature += '\u0002' + [face.face, face.weight, face.weightMin,
        face.weightMax, face.italic ? 1 : 0, face.auto ? 1 : 0,
        face.format].join(',');
    }
    return signature;
  }

  function renderEditor(section) {
    if (!section) {
      return;
    }
    var main = section.querySelector('#morphe-font-main');
    var editor = section.querySelector('#morphe-font-editor');
    if (!main || !editor) {
      return;
    }

    var font = editingFont();
    if (!font) {
      editingId = '';
      if (main.hidden) {
        main.hidden = false;
      }
      if (!editor.hidden) {
        editor.hidden = true;
      }
      return;
    }

    if (!main.hidden) {
      main.hidden = true;
    }
    if (editor.hidden) {
      editor.hidden = false;
    }

    var signature = editorSignature(font);
    if (editor.getAttribute('data-morphe-editor-signature') === signature) {
      return;
    }

    var doc = section.ownerDocument;
    editor.textContent = '';

    var head = el(doc, 'div', 'morphe-font-editor-head');
    var back = el(doc, 'button', 'morphe-font-back', '\u2190 Back');
    back.type = 'button';
    back.setAttribute('data-font-back', '1');
    head.appendChild(back);
    head.appendChild(el(doc, 'span', 'morphe-font-editor-title', 'Edit font'));
    editor.appendChild(head);

    var nameField = el(doc, 'label', 'morphe-font-field');
    nameField.appendChild(el(doc, 'span', 'morphe-font-field-label', 'Name'));
    var nameInput = doc.createElement('input');
    nameInput.type = 'text';
    nameInput.className = 'morphe-font-name-input';
    nameInput.id = 'morphe-font-name-input';
    nameInput.maxLength = 80;
    nameInput.value = font.name;
    nameInput.setAttribute('autocomplete', 'off');
    nameInput.setAttribute('spellcheck', 'false');
    nameField.appendChild(nameInput);
    editor.appendChild(nameField);

    var faces = el(doc, 'div', 'morphe-font-faces');
    faces.appendChild(el(doc, 'div', 'morphe-font-faces-title', 'Faces'));
    for (var i = 0; i < font.faces.length; i++) {
      faces.appendChild(faceBlock(doc, font, i));
    }
    editor.appendChild(faces);

    var actions = el(doc, 'div', 'morphe-font-actions');
    var addFace = el(doc, 'button', 'morphe-font-action', 'Add face\u2026');
    addFace.type = 'button';
    addFace.setAttribute('data-face-add', '1');
    actions.appendChild(addFace);

    var detect = el(doc, 'button', 'morphe-font-action', 'Detect automatically');
    detect.type = 'button';
    detect.setAttribute('data-detect', '1');
    actions.appendChild(detect);
    editor.appendChild(actions);

    var status = el(doc, 'p', 'morphe-font-editor-status');
    status.id = 'morphe-font-editor-status';
    status.hidden = true;
    editor.appendChild(status);

    var danger = el(doc, 'div', 'morphe-font-danger-zone');
    var deleteButton = el(doc, 'button', 'morphe-font-delete', 'Delete font');
    deleteButton.type = 'button';
    deleteButton.setAttribute('data-font-delete', font.id);
    danger.appendChild(deleteButton);
    editor.appendChild(danger);

    editor.setAttribute('data-morphe-editor-signature', signature);
  }

  function editingFont() {
    return editingId ? findFont(editingId) : null;
  }

  function otherFonts(font) {
    var out = [];
    for (var i = 0; i < fonts.length; i++) {
      if (!font || fonts[i].id !== font.id) {
        out.push(fonts[i]);
      }
    }
    return out;
  }

  function addFontChoice(doc, font) {
    var row = el(doc, 'div', 'morphe-font-row');
    var choice = el(doc, 'button', 'morphe-font-choice');
    choice.type = 'button';
    choice.setAttribute('data-add-font', font.id);
    choice.appendChild(el(doc, 'span', 'morphe-font-choice-name', font.name));
    choice.appendChild(el(doc, 'span', 'morphe-font-choice-meta', metaFor(font)));
    row.appendChild(choice);
    return row;
  }

  function fillAddFontList(section) {
    if (!section || addDialog !== 'fonts') {
      return;
    }
    var list = section.querySelector('#morphe-font-add-list');
    var font = editingFont();
    if (!list || !font) {
      return;
    }
    list.textContent = '';
    var query = addQuery.trim().toLowerCase();
    var others = otherFonts(font);
    var shown = 0;
    for (var i = 0; i < others.length; i++) {
      if (query && others[i].name.toLowerCase().indexOf(query) < 0) {
        continue;
      }
      list.appendChild(addFontChoice(section.ownerDocument, others[i]));
      shown++;
    }
    var empty = section.querySelector('#morphe-font-add-empty');
    if (empty) {
      empty.hidden = shown > 0;
      empty.textContent = others.length
        ? 'No fonts match that name.'
        : 'No other fonts to merge.';
    }
  }

  // A single sheet for both ways of adding faces: upload one file, or pick an
  // existing family to merge. Built from the same rows as the main library list.
  function renderAddDialog(section) {
    if (!section) {
      return;
    }
    var doc = section.ownerDocument;
    var existing = section.querySelector('#' + ADD_DIALOG_ID);
    if (existing) {
      existing.parentNode.removeChild(existing);
    }
    if (!addDialog) {
      return;
    }
    var font = editingFont();
    if (!font) {
      addDialog = '';
      return;
    }

    var overlay = el(doc, 'div', 'morphe-font-modal');
    overlay.id = ADD_DIALOG_ID;
    overlay.setAttribute('data-add-backdrop', '1');
    var sheet = el(doc, 'div', 'morphe-font-modal-sheet');
    sheet.setAttribute('role', 'dialog');
    sheet.setAttribute('aria-modal', 'true');
    overlay.appendChild(sheet);
    section.appendChild(overlay);

    var title = el(doc, 'h4', 'morphe-font-modal-title',
      addDialog === 'fonts' ? 'Select a font' : 'Add a face');
    sheet.appendChild(title);

    if (addDialog === 'fonts') {
      var search = doc.createElement('input');
      search.type = 'search';
      search.id = 'morphe-font-add-search';
      search.className = 'morphe-font-search';
      search.placeholder = 'Search fonts';
      search.setAttribute('aria-label', 'Search fonts');
      search.setAttribute('autocomplete', 'off');
      search.setAttribute('spellcheck', 'false');
      search.value = addQuery;
      sheet.appendChild(search);

      var list = el(doc, 'div', 'morphe-font-list');
      list.id = 'morphe-font-add-list';
      list.setAttribute('role', 'group');
      list.setAttribute('aria-label', 'Fonts to merge');
      sheet.appendChild(list);

      var empty = el(doc, 'p', 'morphe-font-modal-note');
      empty.id = 'morphe-font-add-empty';
      sheet.appendChild(empty);

      var back = el(doc, 'button', 'morphe-font-link', '\u2190 Back');
      back.type = 'button';
      back.setAttribute('data-add-back', '1');
      sheet.appendChild(back);

      fillAddFontList(section);
      try {
        search.focus();
      } catch (e) {
        // Focus is a convenience.
      }
      return;
    }

    sheet.appendChild(el(doc, 'p', 'morphe-font-modal-note',
      'Add one font file to "' + font.name + '", or merge every face of ' +
      'another font from your library.'));

    var upload = el(doc, 'button', 'morphe-font-action', 'Upload font file\u2026');
    upload.type = 'button';
    upload.setAttribute('data-add-upload', '1');
    sheet.appendChild(upload);

    var others = otherFonts(font);
    if (others.length) {
      var pick = el(doc, 'button', 'morphe-font-action', 'Select from library\u2026');
      pick.type = 'button';
      pick.setAttribute('data-add-pick', '1');
      sheet.appendChild(pick);
    } else {
      sheet.appendChild(el(doc, 'p', 'morphe-font-note',
        'No other fonts in the library to merge yet.'));
    }

    var cancel = el(doc, 'button', 'morphe-font-link', 'Cancel');
    cancel.type = 'button';
    cancel.setAttribute('data-add-cancel', '1');
    sheet.appendChild(cancel);

    try {
      upload.focus();
    } catch (e) {
      // Focus is a convenience.
    }
  }

  function openAddDialog() {
    if (!editingFont()) {
      return;
    }
    addDialog = 'options';
    addQuery = '';
    syncSection();
  }

  function closeAddDialog() {
    addDialog = '';
    addQuery = '';
    syncSection();
  }

  // Faces carry their absolute stored index; the array index can differ when a
  // file is missing and that face is hidden from the list.
  function findFace(font, index) {
    if (!font) {
      return null;
    }
    for (var i = 0; i < font.faces.length; i++) {
      if (font.faces[i].face === index) {
        return font.faces[i];
      }
    }
    return null;
  }

  function setEditorStatus(text) {
    var section = topDocument().getElementById(SECTION_ID);
    var status = section && section.querySelector('#morphe-font-editor-status');
    if (!status) {
      return;
    }
    var value = text || '';
    if (status.textContent !== value) {
      status.textContent = value;
    }
    if (status.hidden !== !value) {
      status.hidden = !value;
    }
  }

  function applyNativeState(method) {
    var args = Array.prototype.slice.call(arguments, 1);
    try {
      var b = bridge();
      if (b && typeof b[method] === 'function') {
        var state = parseState(b[method].apply(b, args));
        if (state && applyState(state)) {
          return true;
        }
      }
    } catch (e) {
      // Fall through to the failure path.
    }
    return false;
  }

  function afterNative(method) {
    var args = Array.prototype.slice.call(arguments, 1);
    if (!applyNativeState.apply(null, [method].concat(args))) {
      var section = topDocument().getElementById(SECTION_ID);
      setStatus(section, 'Could not update the font');
      var editor = section && section.querySelector('#morphe-font-editor');
      if (editor) {
        editor.removeAttribute('data-morphe-editor-signature');
      }
      syncSection();
      setEditorStatus('Could not update the font');
      return;
    }
    syncSection();
    setEditorStatus('');
  }

  function sliderOf(block) {
    return block ? block.querySelector('[data-weight-slider]') : null;
  }

  function sliderIsDual(slider) {
    return !!slider && slider.classList.contains('is-dual');
  }

  function updateFaceSummary(block, text) {
    var summary = block.querySelector('.morphe-font-face-summary');
    if (summary && summary.textContent !== text) {
      summary.textContent = text;
    }
  }

  function updateSingle(block, value) {
    var field = block.querySelector('[data-weight-field="weight"]');
    if (!field) {
      return;
    }
    paintSingle(field.querySelector('.morphe-weight-scale'), value);
    var valueEl = field.querySelector('.morphe-weight-value');
    if (valueEl) {
      var text = weightLabel(value);
      if (valueEl.textContent !== text) {
        valueEl.textContent = text;
      }
    }
    updateFaceSummary(block, weightLabel(value));
  }

  function updateDual(block, low, high) {
    var field = block.querySelector('[data-weight-field="range"]');
    if (!field) {
      return;
    }
    paintDual(field.querySelector('.morphe-weight-scale'), low, high);
    var valueEl = field.querySelector('.morphe-weight-value');
    if (valueEl) {
      var text = weightRangeLabel(low, high);
      if (valueEl.textContent !== text) {
        valueEl.textContent = text;
      }
    }
    updateFaceSummary(block, 'Variable ' + low + '\u2013' + high);
  }

  function saveFace(block) {
    var font = editingFont();
    if (!font || !block) {
      return;
    }
    var index = parseInt(block.getAttribute('data-face-block'), 10);
    var slider = sliderOf(block);
    var italicInput = block.querySelector('[data-face-italic]');
    if (!isFinite(index) || !slider) {
      return;
    }
    var italic = italicInput ? !!italicInput.checked : false;

    if (sliderIsDual(slider)) {
      var low = parseInt(slider.getAttribute('data-low'), 10);
      var high = parseInt(slider.getAttribute('data-high'), 10);
      if (!isFinite(low) || !isFinite(high)) {
        return;
      }
      if (low === high) {
        // Both handles landed on the same tick: turn the variable range off
        // and keep that tick as the single weight.
        afterNative('setFace', font.id, index, low, low, low, italic);
        return;
      }
      var face = findFace(font, index);
      afterNative('setFace', font.id, index, face ? face.weight : 400,
        low, high, italic);
      return;
    }

    var value = parseInt(slider.getAttribute('data-value'), 10);
    if (!isFinite(value)) {
      return;
    }
    afterNative('setFace', font.id, index, value, value, value, italic);
  }

  function valueFromPointer(slider, clientX) {
    var area = slider.querySelector('.morphe-weight-area');
    if (!area) {
      return 400;
    }
    var rect = area.getBoundingClientRect();
    var ratio = rect.width > 0 ? (clientX - rect.left) / rect.width : 0;
    ratio = Math.max(0, Math.min(1, ratio));
    return Math.round((100 + ratio * 800) / 100) * 100;
  }

  function setSingleValue(slider, block, value) {
    value = Math.max(100, Math.min(900, value));
    if (parseInt(slider.getAttribute('data-value'), 10) === value) {
      return false;
    }
    updateSingle(block, value);
    return true;
  }

  function setDualValue(slider, block, handle, value) {
    var low = parseInt(slider.getAttribute('data-low'), 10);
    var high = parseInt(slider.getAttribute('data-high'), 10);
    if (!isFinite(low) || !isFinite(high)) {
      return false;
    }
    if (handle === 'min') {
      value = Math.min(value, high);
      if (value === low) {
        return false;
      }
      low = value;
    } else if (handle === 'max') {
      value = Math.max(value, low);
      if (value === high) {
        return false;
      }
      high = value;
    } else {
      return false;
    }
    updateDual(block, low, high);
    return true;
  }

  var activeDrag = null;

  function onSliderPointerDown(event) {
    if (activeDrag || (event.button !== undefined && event.button !== 0)) {
      return;
    }
    var target = event.target;
    var slider = target && target.closest
      ? target.closest('[data-weight-slider]') : null;
    if (!slider) {
      return;
    }
    var block = slider.closest('[data-face-block]');
    if (!block) {
      return;
    }

    var handle = target.closest('[data-weight-handle]');
    var field = handle ? handle.getAttribute('data-weight-handle') : '';
    var changed = false;

    if (!handle) {
      var value = valueFromPointer(slider, event.clientX);
      if (sliderIsDual(slider)) {
        var low = parseInt(slider.getAttribute('data-low'), 10);
        var high = parseInt(slider.getAttribute('data-high'), 10);
        if (value < low) {
          field = 'min';
        } else if (value > high) {
          field = 'max';
        } else {
          field = (value - low <= high - value) ? 'min' : 'max';
        }
        changed = setDualValue(slider, block, field, value);
      } else {
        field = 'weight';
        changed = setSingleValue(slider, block, value);
      }
    }

    var activeHandle = slider.querySelector(
      '[data-weight-handle="' + (field || 'weight') + '"]');
    activeDrag = {
      slider: slider,
      block: block,
      handle: field || 'weight',
      pointerId: event.pointerId,
      dirty: changed
    };

    var focusTarget = sliderIsDual(slider) ? activeHandle : slider;
    if (focusTarget && typeof focusTarget.focus === 'function') {
      try {
        focusTarget.focus({ preventScroll: true });
      } catch (e) {
        focusTarget.focus();
      }
    }
    if (activeHandle) {
      activeHandle.classList.add('is-dragging');
    }
    try {
      slider.setPointerCapture(event.pointerId);
    } catch (e) {
      // Capture is a convenience; the overlay listener still gets the moves.
    }
    event.preventDefault();
  }

  function onSliderPointerMove(event) {
    if (!activeDrag || event.pointerId !== activeDrag.pointerId) {
      return;
    }
    var slider = activeDrag.slider;
    var block = activeDrag.block;
    var value = valueFromPointer(slider, event.clientX);
    var changed = sliderIsDual(slider)
      ? setDualValue(slider, block, activeDrag.handle, value)
      : setSingleValue(slider, block, value);
    if (changed) {
      activeDrag.dirty = true;
    }
    event.preventDefault();
  }

  function endSliderDrag(event) {
    if (!activeDrag || event.pointerId !== activeDrag.pointerId) {
      return;
    }
    var drag = activeDrag;
    activeDrag = null;
    try {
      drag.slider.releasePointerCapture(event.pointerId);
    } catch (e) {
      // Already released.
    }
    var handle = drag.slider.querySelector(
      '[data-weight-handle="' + drag.handle + '"]');
    if (handle) {
      handle.classList.remove('is-dragging');
    }
    if (drag.dirty) {
      saveFace(drag.block);
    }
  }

  function onSliderKeyDown(event) {
    var target = event.target;
    if (!target || !target.closest) {
      return;
    }
    var handle = target.closest('[data-weight-handle]');
    var slider = target.closest('[data-weight-slider]');
    if (!slider) {
      return;
    }
    var block = slider.closest('[data-face-block]');
    if (!block) {
      return;
    }

    var dual = sliderIsDual(slider);
    var field = handle ? handle.getAttribute('data-weight-handle') : 'weight';
    if (dual && field !== 'min' && field !== 'max') {
      return;
    }

    var delta = 0;
    if (event.key === 'ArrowLeft' || event.key === 'ArrowDown') {
      delta = -100;
    } else if (event.key === 'ArrowRight' || event.key === 'ArrowUp') {
      delta = 100;
    }

    var changed = false;
    if (delta !== 0) {
      var current = parseInt(slider.getAttribute(
        dual ? (field === 'min' ? 'data-low' : 'data-high') : 'data-value'), 10);
      if (!isFinite(current)) {
        return;
      }
      changed = dual
        ? setDualValue(slider, block, field, current + delta)
        : setSingleValue(slider, block, current + delta);
    } else if (event.key === 'Home') {
      changed = dual
        ? setDualValue(slider, block, field,
          field === 'max' ? parseInt(slider.getAttribute('data-low'), 10) : 100)
        : setSingleValue(slider, block, 100);
    } else if (event.key === 'End') {
      changed = dual
        ? setDualValue(slider, block, field,
          field === 'min' ? parseInt(slider.getAttribute('data-high'), 10) : 900)
        : setSingleValue(slider, block, 900);
    } else {
      return;
    }

    event.preventDefault();
    if (changed) {
      slider.setAttribute('data-key-dirty', '1');
    }
  }

  function onSliderKeyUp(event) {
    var target = event.target;
    if (!target || !target.closest) {
      return;
    }
    var slider = target.closest('[data-weight-slider]');
    if (!slider || slider.getAttribute('data-key-dirty') !== '1') {
      return;
    }
    slider.removeAttribute('data-key-dirty');
    var block = slider.closest('[data-face-block]');
    if (block) {
      saveFace(block);
    }
  }

  function renameCurrent(value) {
    var font = editingFont();
    if (!font) {
      return;
    }
    var next = (value || '').trim();
    if (!next || next === font.name) {
      var input = topDocument().getElementById('morphe-font-name-input');
      if (input && input.value !== font.name) {
        input.value = font.name;
      }
      return;
    }
    afterNative('renameFont', font.id, next);
    var updated = editingFont();
    var input = topDocument().getElementById('morphe-font-name-input');
    if (updated && input && input.value !== updated.name) {
      input.value = updated.name;
    }
  }

  function toggleVariable(block, checked) {
    var font = editingFont();
    if (!font || !block) {
      return;
    }
    var index = parseInt(block.getAttribute('data-face-block'), 10);
    var face = findFace(font, index);
    if (!face) {
      return;
    }

    if (checked) {
      var min;
      var max;
      if (face.format === 'woff2') {
        // WOFF2 has no readable axis data. 100..900 is the common full range,
        // and the browser clamps to the font's real axis anyway.
        min = 100;
        max = 900;
      } else {
        min = Math.floor(clampWeight(face.weight, 400) / 100) * 100;
        min = Math.max(100, Math.min(900, min));
        max = Math.min(900, min + 300);
        if (max <= min) {
          min = Math.max(100, max - 100);
        }
      }
      afterNative('setFace', font.id, index, face.weight, min, max, face.italic);
    } else {
      afterNative('setFace', font.id, index, face.weight, face.weight,
        face.weight, face.italic);
    }
  }

  function openEditor(id) {
    if (!id) {
      return;
    }
    editingId = id;
    addDialog = '';
    addQuery = '';
    syncSection();
  }

  function closeEditor() {
    editingId = '';
    addDialog = '';
    addQuery = '';
    syncSection();
  }

  function detectCurrent() {
    var font = editingFont();
    if (font) {
      afterNative('detectFont', font.id);
    }
  }



  function pickFace() {
    var font = editingFont();
    if (!font) {
      return;
    }
    try {
      var b = bridge();
      if (b && typeof b.pickVariant === 'function') {
        b.pickVariant(font.id);
      }
    } catch (e) {
      setEditorStatus('Could not open the file picker');
    }
  }

  function removeFaceFromEditor(index) {
    var font = editingFont();
    if (font) {
      afterNative('removeFace', font.id, index);
    }
  }

  function syncSection() {
    var section = topDocument().getElementById(SECTION_ID);
    if (section) {
      setSwitch(section, enabled);
      setWeightField(section);
      setStatus(section, statusText);
      renderList(section);
      renderEditor(section);
      renderAddDialog(section);
    }
    apply();
  }

  // Reading weight: persist the choice and re-apply. Faces that do not cover
  // the weight get synthesized by the browser, which is the expected behavior
  // for a static family. Default (0) removes the weight rule entirely.
  function setWeight(value) {
    var next = parseWeight(value, weight);
    if (next === weight) {
      return;
    }
    weight = next;
    apply();
    try {
      var b = bridge();
      if (b && typeof b.setWeight === 'function') {
        b.setWeight(weight);
      }
    } catch (e) {
      // The reader is already updated; persistence is best effort.
    }
  }

  function pickFont() {
    var section = topDocument().getElementById(SECTION_ID);
    try {
      var b = bridge();
      if (b && typeof b.pickFont === 'function') {
        b.pickFont();
      } else if (section) {
        setStatus(section, 'Native picker unavailable');
      }
    } catch (e) {
      if (section) {
        setStatus(section, 'Could not open the file picker: ' + e);
      }
    }
  }

  function chooseFont(id) {
    if (!id || (id === selectedId && enabled)) {
      return;
    }
    var section = topDocument().getElementById(SECTION_ID);
    var state = null;
    try {
      var b = bridge();
      if (b && typeof b.selectFont === 'function') {
        state = parseState(b.selectFont(id));
      }
    } catch (e) {
      state = null;
    }
    if (!state || !applyState(state)) {
      setStatus(section, 'Could not select the font');
      return;
    }
    syncSection();
  }

  function removeFont(id) {
    var section = topDocument().getElementById(SECTION_ID);
    var state = null;
    try {
      var b = bridge();
      if (b && typeof b.deleteFont === 'function') {
        state = parseState(b.deleteFont(id));
      }
    } catch (e) {
      state = null;
    }
    if (!state || !applyState(state)) {
      setStatus(section, 'Could not delete the font');
      syncSection();
      setEditorStatus('Could not delete the font');
      return;
    }
    if (editingId === id) {
      editingId = '';
    }
    syncSection();
  }

  // Listeners live on the overlay, not the document: the sheet is ours and its
  // contents are only re-rendered by the functions below.
  function onUiClick(event) {
    var target = event.target;
    if (!target || !target.closest) {
      return;
    }

    if (target.closest('[data-font-close]')) {
      closeSheet();
      return;
    }

    if (target.closest('#morphe-font-upload')) {
      pickFont();
      return;
    }

    var choose = target.closest('[data-font-select]');
    if (choose) {
      chooseFont(choose.getAttribute('data-font-select'));
      return;
    }

    var edit = target.closest('[data-font-edit]');
    if (edit) {
      openEditor(edit.getAttribute('data-font-edit'));
      return;
    }

    var askDelete = target.closest('[data-font-delete]');
    if (askDelete) {
      removeFont(askDelete.getAttribute('data-font-delete'));
      return;
    }

    if (target.closest('[data-font-back]')) {
      closeEditor();
      return;
    }

    if (target.closest('[data-face-add]')) {
      openAddDialog();
      return;
    }

    if (target.closest('[data-add-upload]')) {
      addDialog = '';
      addQuery = '';
      syncSection();
      pickFace();
      return;
    }

    if (target.closest('[data-add-pick]')) {
      addDialog = 'fonts';
      addQuery = '';
      syncSection();
      return;
    }

    var addFont = target.closest('[data-add-font]');
    if (addFont) {
      var targetFont = editingFont();
      var sourceId = addFont.getAttribute('data-add-font');
      addDialog = '';
      addQuery = '';
      if (targetFont) {
        afterNative('mergeFont', targetFont.id, sourceId);
      } else {
        syncSection();
      }
      return;
    }

    if (target.closest('[data-add-back]')) {
      addDialog = 'options';
      addQuery = '';
      syncSection();
      return;
    }

    if (target.closest('[data-add-cancel]')) {
      closeAddDialog();
      return;
    }

    var backdrop = target.closest('[data-add-backdrop]');
    if (backdrop && !target.closest('.morphe-font-modal-sheet')) {
      closeAddDialog();
      return;
    }

    var removeFace = target.closest('[data-face-remove]');
    if (removeFace) {
      removeFaceFromEditor(parseInt(removeFace.getAttribute('data-face-remove'), 10));
      return;
    }

    if (target.closest('[data-detect]')) {
      detectCurrent();
      return;
    }
  }

  function onUiChange(event) {
    var target = event.target;
    if (!target) {
      return;
    }

    if (target.id === 'morphe-font-weight') {
      setWeight(parseInt(target.value, 10));
      return;
    }

    if (target.id === 'morphe-font-enabled') {
      enabled = hasFont && !!target.checked;
      try {
        var b = bridge();
        if (b && typeof b.setEnabled === 'function') {
          b.setEnabled(enabled);
        }
      } catch (e) {
        // Keep the UI responsive even if the bridge call fails.
      }
      apply();
      return;
    }

    if (target.id === 'morphe-font-name-input') {
      renameCurrent(target.value);
      return;
    }

    if (target.hasAttribute && target.hasAttribute('data-face-variable')) {
      toggleVariable(target.closest('[data-face-block]'), !!target.checked);
      return;
    }

    if (target.hasAttribute && target.hasAttribute('data-face-italic')) {
      saveFace(target.closest('[data-face-block]'));
    }
  }

  function onUiInput(event) {
    var target = event.target;
    if (!target) {
      return;
    }
    if (target.id === 'morphe-font-search') {
      searchQuery = (target.value || '').trim();
      renderList(topDocument().getElementById(SECTION_ID));
      return;
    }
    if (target.id === 'morphe-font-add-search') {
      addQuery = target.value || '';
      fillAddFontList(topDocument().getElementById(SECTION_ID));
    }
  }

  function onUiKeydown(event) {
    var target = event.target;
    if (!target) {
      return;
    }
    if (event.key === 'Escape' && addDialog) {
      event.preventDefault();
      closeAddDialog();
      return;
    }
    if (target.id === 'morphe-font-name-input') {
      if (event.key === 'Enter') {
        event.preventDefault();
        target.blur();
      } else if (event.key === 'Escape') {
        event.preventDefault();
        var font = editingFont();
        if (font) {
          target.value = font.name;
        }
        target.blur();
      }
      return;
    }
    onSliderKeyDown(event);
  }

  // The sheet ends where the keyboard starts, so a focused field is already in
  // the visible part of the panel body. This only brings it fully into view
  // inside that body; it never relies on the window scrolling.
  function onFocusIn(event) {
    var target = event.target;
    if (!target || !target.tagName) {
      return;
    }
    var doc = topDocument();
    var overlay = doc.getElementById(OVERLAY_ID);
    if (!overlay || overlay.hidden || !overlay.contains(target)) {
      return;
    }
    if (target.tagName !== 'INPUT' && target.tagName !== 'TEXTAREA') {
      return;
    }
    setTimeout(function () {
      fitSheet();
      try {
        target.scrollIntoView({ block: 'nearest' });
      } catch (e) {
        // Focus is still usable without the scroll hint.
      }
    }, 50);
  }

  function wireEvents(doc) {
    if (eventsWired) {
      return;
    }
    eventsWired = true;
    // The reader stops propagation of UI events above our sheet, so a listener
    // on the overlay itself never runs (only native defaults like the checkbox
    // still work). Listening on window in the capture phase runs first, before
    // any reader handler can swallow the event.
    window.addEventListener('click', onUiClick, true);
    window.addEventListener('change', onUiChange, true);
    window.addEventListener('input', onUiInput, true);
    window.addEventListener('keydown', onUiKeydown, true);
    window.addEventListener('keyup', onSliderKeyUp, true);
    window.addEventListener('pointerdown', onSliderPointerDown, true);
    window.addEventListener('pointermove', onSliderPointerMove, true);
    window.addEventListener('pointerup', endSliderDrag, true);
    window.addEventListener('pointercancel', endSliderDrag, true);
    window.addEventListener('focusin', onFocusIn, true);
    // Chapter iframes live in the reader document, not in the sheet, and their
    // load events do not bubble. The capture phase on the document sees them.
    doc.addEventListener('load', onFrameLoad, true);
    // Libby's activity is adjustPan, so the keyboard does not resize the
    // layout viewport. Keep our fixed sheet pinned to the visual viewport
    // instead: resize fires when the keyboard opens, scroll when Chromium pans.
    var viewport = window.visualViewport;
    if (viewport) {
      viewport.addEventListener('resize', fitSheet);
      viewport.addEventListener('scroll', fitSheet);
    }
  }

  function inject() {
    var doc = topDocument();
    if (!doc.body) {
      return;
    }
    ensureNavButton(doc);

    var overlay = doc.getElementById(OVERLAY_ID);
    var section = null;
    var created = false;

    if (!overlay) {
      var html = uiHtml();
      if (!html) {
        return;
      }
      // Our own sheet, appended to the reader document. Libby's Appearance
      // dialog and its scroller are not involved, so the panel can end exactly
      // where the keyboard starts.
      overlay = doc.createElement('div');
      overlay.id = OVERLAY_ID;
      overlay.className = 'morphe-font-overlay';
      overlay.hidden = true;
      overlay.innerHTML =
        '<div class="morphe-font-backdrop" data-font-close></div>' +
        '<div class="morphe-font-panel" role="dialog" aria-modal="true"' +
        ' aria-labelledby="morphe-font-panel-title">' +
        '<div class="morphe-font-panel-head">' +
        '<h2 class="morphe-font-panel-title" id="morphe-font-panel-title">Patch Settings</h2>' +
        '<button class="morphe-font-panel-close" type="button" data-font-close>Done</button>' +
        '</div>' +
        '<div class="morphe-font-panel-body"></div>' +
        '</div>';
      doc.body.appendChild(overlay);

      section = doc.createElement('div');
      section.className = 'readability-section readability-section-font';
      section.id = SECTION_ID;
      section.setAttribute(SECTION_FLAG, '1');
      section.innerHTML = html;
      overlay.querySelector('.morphe-font-panel-body').appendChild(section);
      created = true;
    } else {
      section = overlay.querySelector('[' + SECTION_FLAG + ']');
      if (!section) {
        return;
      }
    }

    var helper = doc.getElementById('morphe-font-helper-style');
    if (!helper) {
      helper = doc.createElement('style');
      helper.id = 'morphe-font-helper-style';
      doc.head.appendChild(helper);
      created = true;
    }

    if (created) {
      // Start each freshly built sheet with no transient filter/editor state.
      searchQuery = '';
      editingId = '';
      addDialog = '';
      addQuery = '';
      statusText = baseStatus();
      refreshHelper(doc);
      setTimeout(function () {
        refreshHelper(doc);
      }, 300);
    }

    setSwitch(section, enabled);
    setWeightField(section);
    setStatus(section, statusText);
    renderList(section);
    renderEditor(section);
    renderAddDialog(section);
    wireEvents(doc);
  }

  window.MorpheFont = {
    init: function (css, isEnabled, name, hasFontValue, libraryJson) {
      if (typeof css === 'string') {
        fontCss = css;
      }
      hasFont = !!hasFontValue;
      enabled = hasFont && !!isEnabled;
      fontName = name || '';
      statusText = baseStatus();
      var state = parseState(libraryJson);
      if (state) {
        applyState(state);
      }
      inject();
      apply();
    },

    // Called after an upload or by any native change to the font library.
    onLibraryChanged: function (json) {
      var state = parseState(json);
      if (!state || !applyState(state)) {
        return;
      }
      searchQuery = '';
      syncSection();
    },

    onFontError: function (message) {
      var section = topDocument().getElementById(SECTION_ID);
      setStatus(section, message || 'Font error');
    },

    onPickCancelled: function () {
      var section = topDocument().getElementById(SECTION_ID);
      setStatus(section, baseStatus());
    }
  };
})();
