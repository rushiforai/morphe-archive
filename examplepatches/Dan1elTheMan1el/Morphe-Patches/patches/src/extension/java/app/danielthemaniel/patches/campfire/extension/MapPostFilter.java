package app.danielthemaniel.patches.campfire.extension;

import android.util.Log;
import android.webkit.WebResourceResponse;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Map post age filter.
 *
 * Adds a round filter button above the map's locate-me button ([data-test-id=LocateMeButtonId])
 * with a menu: All posts / Past 24 hours / 12 hours / hour / 10 minutes (persisted).
 *
 * Data (only while a filter is active; "All posts" leaves every request untouched): every query that loads map objects (viewport, by-id, preview card, activity center) gets
 * `createdAt` added to its MapObject.post selections, and the page script records each map
 * object's post time (Relay drops unknown fields, so the app's components never see it). Posts
 * are therefore filtered from the moment they first appear, whichever query brought them.
 *
 * Rendering: the map draws fresh results plus its own map-object cache, merged in
 * getAllRenderableMapObjects(). That function is rewritten as the JS is served so its result
 * goes through window.__morpheFilterMapObjects, which hides posts older than the cutoff — cached
 * ones included, and reversibly. Posts with an unknown age are kept. Changing the filter nudges
 * the Google map by a few pixels so the map refetches and re-renders.
 * Look for "[MorpheMapFilter]" in the WebView console.
 */
@SuppressWarnings("unused")
public final class MapPostFilter {
    private static final String TAG = "CampfireMapPostFilter";

    private MapPostFilter() {}

    private static final String SCRIPT =
            "(function () {\n"
            + "  if (window.__morpheMapPostFilter) return;\n"
            + "  var TAG = '[MorpheMapFilter]';\n"
            + "  var STORE_KEY = 'morphe.mapPostAgeFilter';\n"
            + "  var OPTIONS = [\n"
            + "    { id: 'default', label: 'All posts', ms: 0 },\n"
            + "    { id: '24h', label: 'Past 24 hours', ms: 24 * 3600e3 },\n"
            + "    { id: '12h', label: 'Past 12 hours', ms: 12 * 3600e3 },\n"
            + "    { id: '1h', label: 'Past hour', ms: 3600e3 },\n"
            + "    { id: '10m', label: 'Past 10 minutes', ms: 10 * 60e3 }\n"
            + "  ];\n"
            + "\n"
            + "  var current = 'default';\n"
            + "  try { current = localStorage.getItem(STORE_KEY) || 'default'; } catch (e) {}\n"
            + "  function option() {\n"
            + "    for (var i = 0; i < OPTIONS.length; i++) if (OPTIONS[i].id === current) return OPTIONS[i];\n"
            + "    return OPTIONS[0];\n"
            + "  }\n"
            + "  function active() { return option().ms > 0; }\n"
            + "\n"
            + "  // ---------------------------------------------------------------------------------------------\n"
            + "  // Data: map objects reach the map through several queries (viewport, by-id, preview card,\n"
            + "  // activity center) whose post selections have no timestamp. Add createdAt to them and remember\n"
            + "  // each map object's post time, so a post is filtered from the moment it first appears.\n"
            + "  // (Relay drops fields its compiled query doesn't know, so the components never see createdAt.)\n"
            + "  // ---------------------------------------------------------------------------------------------\n"
            + "  var MAP_QUERY = /^\\s*query \\w*(?:RealityChannel|ActivityCenter|MapObject)\\w*\\b/;\n"
            + "  var postTimes = new Map(); // map object id -> post createdAt (ms)\n"
            + "\n"
            + "  // Only while a filter is active: with \"All posts\" every request is exactly the app's own.\n"
            + "  function rewriteBody(body) {\n"
            + "    if (!active() || typeof body !== 'string' || body.indexOf('post {') === -1) return null;\n"
            + "    var payload;\n"
            + "    try { payload = JSON.parse(body); } catch (e) { return null; }\n"
            + "    if (!payload || typeof payload.query !== 'string' || !MAP_QUERY.test(payload.query)) return null;\n"
            + "    if (!/mapObject|realityChannelMapObjects|nearbyActivePois/.test(payload.query)) return null;\n"
            + "    payload.query = payload.query.replace(/(\\n([ \\t]*)post \\{\\n)/g, '$1$2  createdAt\\n');\n"
            + "    return JSON.stringify(payload);\n"
            + "  }\n"
            + "\n"
            + "  function timeOf(v) {\n"
            + "    if (v === null || v === undefined || v === '') return NaN;\n"
            + "    var n = typeof v === 'number' ? v : (/^\\d+(\\.\\d+)?$/.test(String(v)) ? Number(v) : NaN);\n"
            + "    if (!isNaN(n)) return n < 1e11 ? n * 1000 : n; // seconds vs milliseconds\n"
            + "    return Date.parse(String(v));\n"
            + "  }\n"
            + "\n"
            + "  function record(text) {\n"
            + "    var json, data;\n"
            + "    try { json = JSON.parse(text); data = json.data; } catch (e) { return; }\n"
            + "    if (json && json.errors && json.errors.length) {\n"
            + "      console.warn(TAG, 'GraphQL errors in a rewritten map query:', JSON.stringify(json.errors).slice(0, 800));\n"
            + "    }\n"
            + "    if (!data) return;\n"
            + "    var n = 0;\n"
            + "    (function walk(v, depth) {\n"
            + "      if (!v || typeof v !== 'object' || depth > 12) return;\n"
            + "      if (Array.isArray(v)) { for (var i = 0; i < v.length; i++) walk(v[i], depth + 1); return; }\n"
            + "      if (typeof v.id === 'string' && v.post && typeof v.post === 'object') {\n"
            + "        var t = timeOf(v.post.createdAt);\n"
            + "        if (!isNaN(t)) { postTimes.set(v.id, t); n++; }\n"
            + "      }\n"
            + "      for (var k in v) if (k !== 'post') walk(v[k], depth + 1);\n"
            + "    })(data, 0);\n"
            + "    if (n && active()) console.log(TAG, 'learned', n, 'post time(s)');\n"
            + "  }\n"
            + "\n"
            + "  // Called by the app's map (getAllRenderableMapObjects, patched at serve time) with everything it\n"
            + "  // is about to draw: fresh results plus its own map-object cache.\n"
            + "  function filterMapObjects(list) {\n"
            + "    if (!active() || !Array.isArray(list)) return list;\n"
            + "    var cutoff = Date.now() - option().ms;\n"
            + "    var out = list.filter(function (o) {\n"
            + "      var t = o && postTimes.get(o.id);\n"
            + "      return t === undefined || t >= cutoff; // unknown age -> keep\n"
            + "    });\n"
            + "    return out;\n"
            + "  }\n"
            + "  window.__morpheFilterMapObjects = filterMapObjects;\n"
            + "\n"
            + "  // XHR (axios): rewrite the request, record times when the app reads the response.\n"
            + "  var XHR = window.XMLHttpRequest;\n"
            + "  if (XHR) {\n"
            + "    var proto = XHR.prototype;\n"
            + "    var send = proto.send;\n"
            + "    var textGetter = Object.getOwnPropertyDescriptor(proto, 'responseText');\n"
            + "    var responseGetter = Object.getOwnPropertyDescriptor(proto, 'response');\n"
            + "    proto.send = function (body) {\n"
            + "      var rewritten = rewriteBody(body);\n"
            + "      if (rewritten === null) return send.call(this, body);\n"
            + "      var xhr = this, done = false;\n"
            + "      var observe = function (text) {\n"
            + "        if (!done && xhr.readyState === 4) { done = true; record(text); }\n"
            + "        return text;\n"
            + "      };\n"
            + "      if (textGetter && responseGetter) {\n"
            + "        Object.defineProperty(xhr, 'responseText', {\n"
            + "          configurable: true,\n"
            + "          get: function () { return observe(textGetter.get.call(xhr)); }\n"
            + "        });\n"
            + "        Object.defineProperty(xhr, 'response', {\n"
            + "          configurable: true,\n"
            + "          get: function () {\n"
            + "            var r = responseGetter.get.call(xhr);\n"
            + "            if (typeof r === 'string') observe(r);\n"
            + "            else if (r && typeof r === 'object' && !done && xhr.readyState === 4) { done = true; try { record(JSON.stringify(r)); } catch (e) {} }\n"
            + "            return r;\n"
            + "          }\n"
            + "        });\n"
            + "      }\n"
            + "      xhr.addEventListener('readystatechange', function () {\n"
            + "        if (xhr.readyState === 4 && !done) { try { observe(textGetter.get.call(xhr)); } catch (e) {} }\n"
            + "      });\n"
            + "      return send.call(this, rewritten);\n"
            + "    };\n"
            + "  }\n"
            + "\n"
            + "  // fetch (in case a future bundle switches transport).\n"
            + "  var nativeFetch = window.fetch;\n"
            + "  if (nativeFetch) {\n"
            + "    window.fetch = function (input, init) {\n"
            + "      var rewritten = init ? rewriteBody(init.body) : null;\n"
            + "      if (rewritten === null) return nativeFetch.apply(this, arguments);\n"
            + "      var copy = {};\n"
            + "      for (var k in init) copy[k] = init[k];\n"
            + "      copy.body = rewritten;\n"
            + "      return nativeFetch.call(this, input, copy).then(function (res) {\n"
            + "        res.clone().text().then(record, function () {});\n"
            + "        return res;\n"
            + "      });\n"
            + "    };\n"
            + "  }\n"
            + "\n"
            + "  // ---------------------------------------------------------------------------------------------\n"
            + "  // Map refresh: remember the Google Maps instance; nudge it so the app refetches the viewport.\n"
            + "  // ---------------------------------------------------------------------------------------------\n"
            + "  var lastMap = null;\n"
            + "  (function hookMaps() {\n"
            + "    var g = window.google;\n"
            + "    var M = g && g.maps && g.maps.Map;\n"
            + "    if (!M || !M.prototype) return setTimeout(hookMaps, 300);\n"
            + "    ['getBounds', 'getZoom', 'getCenter'].forEach(function (name) {\n"
            + "      var orig = M.prototype[name];\n"
            + "      if (typeof orig !== 'function' || orig.__morphe) return;\n"
            + "      var wrapped = function () { lastMap = this; return orig.apply(this, arguments); };\n"
            + "      wrapped.__morphe = true;\n"
            + "      M.prototype[name] = wrapped;\n"
            + "    });\n"
            + "  })();\n"
            + "\n"
            + "  function refreshMap() {\n"
            + "    var map = lastMap;\n"
            + "    if (!map || typeof map.panBy !== 'function') return;\n"
            + "    try {\n"
            + "      map.panBy(0, 3);\n"
            + "      setTimeout(function () { try { map.panBy(0, -3); } catch (e) {} }, 800);\n"
            + "    } catch (e) {}\n"
            + "  }\n"
            + "\n"
            + "  // ---------------------------------------------------------------------------------------------\n"
            + "  // UI: a round filter button above the locate-me button, with a small menu.\n"
            + "  // ---------------------------------------------------------------------------------------------\n"
            + "  var BUTTON_ID = 'morphe-map-filter-button';\n"
            + "  var MENU_ID = 'morphe-map-filter-menu';\n"
            + "  var ICON = '<svg viewBox=\"0 0 24 24\" width=\"55%\" height=\"55%\" aria-hidden=\"true\">' +\n"
            + "    '<path fill=\"currentColor\" d=\"M3 5.5C3 4.67 3.67 4 4.5 4h15c.83 0 1.5.67 1.5 1.5 0 .37-.14.73-.39 1L14 13.6V19a1 1 0 0 1-1.45.9l-2-1A1 1 0 0 1 10 18v-4.4L3.39 6.5A1.5 1.5 0 0 1 3 5.5z\"/></svg>';\n"
            + "  var CHECK = '<svg viewBox=\"0 0 24 24\" width=\"18\" height=\"18\" aria-hidden=\"true\">' +\n"
            + "    '<path fill=\"currentColor\" d=\"M9.55 17.6 4.4 12.45l1.4-1.4 3.75 3.75 8.65-8.65 1.4 1.4z\"/></svg>';\n"
            + "\n"
            + "  function closeMenu() {\n"
            + "    var m = document.getElementById(MENU_ID);\n"
            + "    if (m) m.remove();\n"
            + "  }\n"
            + "\n"
            + "  function openMenu(button) {\n"
            + "    closeMenu();\n"
            + "    var menu = document.createElement('div');\n"
            + "    menu.id = MENU_ID;\n"
            + "    menu.setAttribute('role', 'menu');\n"
            + "    menu.style.cssText = 'position:absolute;z-index:' + (button.style.zIndex || 10) + ';min-width:180px;padding:6px 0;' +\n"
            + "      'border-radius:16px;background:var(--ion-color-white,#fff);color:var(--ion-text-color,#2f496d);' +\n"
            + "      'box-shadow:0 4px 16px rgba(0,0,0,.25);font-family:inherit;font-size:15px;';\n"
            + "    var title = document.createElement('div');\n"
            + "    title.textContent = 'Show posts';\n"
            + "    title.style.cssText = 'padding:8px 16px 4px;font-size:12px;font-weight:600;opacity:.7;text-transform:uppercase;letter-spacing:.04em;';\n"
            + "    menu.appendChild(title);\n"
            + "    OPTIONS.forEach(function (o) {\n"
            + "      var item = document.createElement('div');\n"
            + "      item.setAttribute('role', 'menuitemradio');\n"
            + "      item.setAttribute('aria-checked', String(o.id === current));\n"
            + "      item.style.cssText = 'display:flex;align-items:center;gap:10px;padding:10px 16px;cursor:pointer;' +\n"
            + "        (o.id === current ? 'color:var(--ion-color-primary,#16bcf0);font-weight:600;' : '');\n"
            + "      var mark = document.createElement('span');\n"
            + "      mark.style.cssText = 'width:18px;height:18px;display:inline-flex;';\n"
            + "      mark.innerHTML = o.id === current ? CHECK : '';\n"
            + "      var text = document.createElement('span');\n"
            + "      text.textContent = o.label;\n"
            + "      item.appendChild(mark);\n"
            + "      item.appendChild(text);\n"
            + "      item.addEventListener('click', function (ev) {\n"
            + "        ev.stopPropagation();\n"
            + "        select(o.id);\n"
            + "      });\n"
            + "      menu.appendChild(item);\n"
            + "    });\n"
            + "    button.parentElement.appendChild(menu);\n"
            + "\n"
            + "    // To the left of the button, bottom-aligned with it, kept on screen.\n"
            + "    menu.style.position = button.style.position;\n"
            + "    menu.style.top = (parseFloat(button.style.top) + button.offsetHeight - menu.offsetHeight) + 'px';\n"
            + "    menu.style.left = (parseFloat(button.style.left) - menu.offsetWidth - 10) + 'px';\n"
            + "    var r = menu.getBoundingClientRect();\n"
            + "    if (r.top < 8) menu.style.top = (parseFloat(menu.style.top) + 8 - r.top) + 'px';\n"
            + "    if (r.left < 8) menu.style.left = (parseFloat(menu.style.left) + 8 - r.left) + 'px';\n"
            + "  }\n"
            + "\n"
            + "  function select(id) {\n"
            + "    closeMenu();\n"
            + "    if (id === current) return;\n"
            + "    current = id;\n"
            + "    try { localStorage.setItem(STORE_KEY, id); } catch (e) {}\n"
            + "    console.log(TAG, 'filter:', option().label);\n"
            + "    syncButton();\n"
            + "    refreshMap();\n"
            + "  }\n"
            + "\n"
            + "  document.addEventListener('pointerdown', function (ev) {\n"
            + "    var menu = document.getElementById(MENU_ID);\n"
            + "    var button = document.getElementById(BUTTON_ID);\n"
            + "    if (menu && !menu.contains(ev.target) && !(button && button.contains(ev.target))) closeMenu();\n"
            + "  }, true);\n"
            + "\n"
            + "  function syncButton() {\n"
            + "    var button = document.getElementById(BUTTON_ID);\n"
            + "    if (!button) return;\n"
            + "    var on = active();\n"
            + "    button.querySelector('.morphe-icon').style.color = on ? 'var(--ion-color-primary,#16bcf0)' : '';\n"
            + "    button.querySelector('.morphe-dot').style.display = on ? 'block' : 'none';\n"
            + "    button.setAttribute('aria-label', 'Filter posts: ' + option().label);\n"
            + "  }\n"
            + "\n"
            + "  function place() {\n"
            + "    var locate = document.querySelector('[data-test-id=\"LocateMeButtonId\"]');\n"
            + "    var button = document.getElementById(BUTTON_ID);\n"
            + "    if (!locate || !locate.parentElement || !locate.getClientRects().length || !locate.offsetWidth) {\n"
            + "      if (button) button.remove();\n"
            + "      closeMenu();\n"
            + "      return;\n"
            + "    }\n"
            + "    if (!button || button.parentElement !== locate.parentElement) {\n"
            + "      if (button) button.remove();\n"
            + "      button = document.createElement('div');\n"
            + "      button.id = BUTTON_ID;\n"
            + "      button.setAttribute('role', 'button');\n"
            + "      button.innerHTML = '<span class=\"morphe-icon\" style=\"display:flex;align-items:center;justify-content:center;width:100%;height:100%\">' + ICON + '</span>' +\n"
            + "        '<span class=\"morphe-dot\" style=\"position:absolute;top:18%;right:18%;width:8px;height:8px;border-radius:50%;background:var(--ion-color-primary,#16bcf0);display:none\"></span>';\n"
            + "      button.addEventListener('click', function (ev) {\n"
            + "        ev.stopPropagation();\n"
            + "        if (document.getElementById(MENU_ID)) closeMenu(); else openMenu(button);\n"
            + "      });\n"
            + "      // Out of flow before it touches the DOM, and after the locate button, so it never shifts it.\n"
            + "      button.style.position = 'absolute';\n"
            + "      button.style.visibility = 'hidden';\n"
            + "      locate.parentElement.insertBefore(button, locate.nextSibling);\n"
            + "      syncButton();\n"
            + "    }\n"
            + "\n"
            + "    // Match the locate button's look; one circle the width of that control.\n"
            + "    var cs = getComputedStyle(locate);\n"
            + "    var size = locate.offsetWidth;\n"
            + "    var gap = 12;\n"
            + "    // Same coordinate system as the locate button: offsets within the shared containing block,\n"
            + "    // or viewport coordinates if the locate button itself is fixed.\n"
            + "    var fixed = cs.position === 'fixed';\n"
            + "    var rect = locate.getBoundingClientRect();\n"
            + "    var x = fixed ? rect.left : locate.offsetLeft;\n"
            + "    var y = fixed ? rect.top : locate.offsetTop;\n"
            + "    var icon = locate.querySelector('svg, ion-icon, img') || locate;\n"
            + "    var s = button.style;\n"
            + "    s.position = fixed ? 'fixed' : 'absolute';\n"
            + "    s.boxSizing = 'border-box';\n"
            + "    s.width = size + 'px';\n"
            + "    s.height = size + 'px';\n"
            + "    s.left = x + 'px';\n"
            + "    s.top = (y - size - gap) + 'px';\n"
            + "    s.borderRadius = '50%';\n"
            + "    s.background = cs.backgroundColor && cs.backgroundColor !== 'rgba(0, 0, 0, 0)' ? cs.backgroundColor : 'var(--ion-color-white,#fff)';\n"
            + "    s.boxShadow = cs.boxShadow;\n"
            + "    s.border = cs.border;\n"
            + "    s.color = getComputedStyle(icon).color;\n"
            + "    s.zIndex = cs.zIndex === 'auto' ? '' : cs.zIndex;\n"
            + "    s.cursor = 'pointer';\n"
            + "    s.display = 'flex';\n"
            + "    s.webkitTapHighlightColor = 'transparent';\n"
            + "    s.visibility = '';\n"
            + "  }\n"
            + "\n"
            + "  setInterval(place, 400);\n"
            + "  window.addEventListener('resize', place);\n"
            + "  window.__morpheMapPostFilter = { select: select, filterMapObjects: filterMapObjects, rewriteBody: rewriteBody, place: place, postTimes: postTimes };\n"
            + "})();\n";

    /** Called on every return of JSInjector.getScriptString(). Never throws. */
    public static String appendScript(String script) {
        return script + "\n\n" + SCRIPT;
    }

    private static final String MARKER = "getAllRenderableMapObjects";

    /** this.getAllRenderableMapObjects=()=>{ ... return X().uniqBy(e,e=>e.id).filter(Boolean)} */
    private static final Pattern RENDERABLE = Pattern.compile(
        "(this\\.getAllRenderableMapObjects=\\(\\)=>\\{[\\s\\S]{0,600}?return )"
            + "([\\w$]+\\(\\)\\.uniqBy\\([\\w$]+,[\\w$]+=>[\\w$]+\\.id\\)\\.filter\\(Boolean\\))\\}");

    /** Wraps the map's renderable-object list in window.__morpheFilterMapObjects. */
    public static String rewriteJs(String js) {
        if (js.indexOf(MARKER) == -1 || js.contains("__morpheFilterMapObjects")) return js;
        Matcher m = RENDERABLE.matcher(js);
        StringBuffer sb = new StringBuffer(js.length() + 512);
        int n = 0;
        while (m.find()) {
            String list = m.group(2);
            m.appendReplacement(sb, Matcher.quoteReplacement(m.group(1)
                + "(window.__morpheFilterMapObjects?window.__morpheFilterMapObjects(" + list + "):" + list + ")}"));
            n++;
        }
        m.appendTail(sb);
        if (n == 0) Log.w(TAG, "getAllRenderableMapObjects found but not in the expected shape");
        return n == 0 ? js : sb.toString();
    }

    /**
     * Called on every return of WebViewLocalServer.handleLocalRequest(). Rewrites the map's JS
     * chunk, passes everything else through untouched. Never throws.
     */
    public static WebResourceResponse filterResponse(WebResourceResponse response) {
        if (response == null) return null;
        String mime = response.getMimeType();
        if (mime == null || !mime.contains("javascript")) return response;

        byte[] original = null;
        try {
            InputStream in = response.getData();
            if (in == null) return response;
            original = readAll(in);
            String js = new String(original, StandardCharsets.UTF_8);
            String patched = rewriteJs(js);
            response.setData(new ByteArrayInputStream(
                patched == js ? original : patched.getBytes(StandardCharsets.UTF_8)));
        } catch (Throwable t) {
            Log.e(TAG, "Failed to patch map JS", t);
            if (original != null) response.setData(new ByteArrayInputStream(original));
        }
        return response;
    }

    private static byte[] readAll(InputStream in) throws java.io.IOException {
        try (InputStream input = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream(256 * 1024);
            byte[] buffer = new byte[32 * 1024];
            int n;
            while ((n = input.read(buffer)) != -1) out.write(buffer, 0, n);
            return out.toByteArray();
        }
    }
}
