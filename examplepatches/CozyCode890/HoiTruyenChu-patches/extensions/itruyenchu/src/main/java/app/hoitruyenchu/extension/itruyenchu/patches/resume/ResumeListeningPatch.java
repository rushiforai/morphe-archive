package app.hoitruyenchu.extension.itruyenchu.patches.resume;

import app.hoitruyenchu.extension.itruyenchu.patches.shared.JsScripts;

/**
 * Opening a book (bookshelf, "Đọc truyện") always showed the chapter from the top: the reader resets
 * the voice bar's active line to -1 every time a chapter is loaded and nothing remembers where the
 * listening stopped.
 * <p>
 * A small JS script ({@link #SCRIPT}) is evaluated right after the app's bundle, in the same Hermes
 * runtime. It uses the app's zustand stores (module ids of app 2.1.0) to remember the line being
 * read per book and, when that chapter is opened again, opens the voice bar (play button) and
 * highlights / scrolls to that line. Pressing play continues from there.
 */
@SuppressWarnings("unused")
public final class ResumeListeningPatch {
    private static final String TAG = "HTC-Resume";
    private static final String FILE_NAME = "htc-resume-listening.js";

    private ResumeListeningPatch() {
    }

    /** End of ReactInstance.loadJSBundle(loader): the app bundle is scheduled, queue the script after it. */
    public static void afterMainBundle(Object reactInstance) {
        JsScripts.load(reactInstance, FILE_NAME, SCRIPT, TAG);
    }

    /**
     * Plain ES5, everything inside try/catch: an exception escaping here would be a fatal JS error.
     * Module ids (app 2.1.0): 2766 = useTTSVoiceStore, 2735 = useReadStore.
     */
    static final String SCRIPT = ""
            + "(function () {\n"
            + "  var TAG = '[HTC-Resume] ';\n"
            + "  var KEY = 'htc_listen_pos';\n"
            + "  function log(m) { try { console.log(TAG + m); } catch (e) {} }\n"
            + "  try {\n"
            + "    var g = typeof globalThis !== 'undefined' ? globalThis : this;\n"
            + "    if (typeof g.__r !== 'function') { log('no __r'); return; }\n"
            + "    var V = g.__r(2766) && g.__r(2766).useTTSVoiceStore;\n"
            + "    if (!V || typeof V.getState !== 'function' || typeof V.subscribe !== 'function'\n"
            + "        || typeof V.getState().setActiveLine !== 'function') { log('voice store not found'); return; }\n"
            + "    var storage = null;\n"
            + "    try { storage = V.persist.getOptions().storage; } catch (e) {}\n"
            + "\n"
            + "    var saved = {};\n"
            + "    var loaded = null;   // chapter shown by the reader {slug, n}\n"
            + "    var request = null;  // last chapter text request {slug, n, done, used}\n"
            + "    var saveTimer = null;\n"
            + "\n"
            + "    if (storage) {\n"
            + "      try {\n"
            + "        var r = storage.getItem(KEY);\n"
            + "        var apply = function (v) { if (v && typeof v === 'object') { for (var k in v) { if (!saved[k]) saved[k] = v[k]; } } };\n"
            + "        if (r && typeof r.then === 'function') r.then(apply, function () {}); else apply(r);\n"
            + "      } catch (e) { log('load failed ' + e); }\n"
            + "    }\n"
            + "\n"
            + "    function persist() {\n"
            + "      if (!storage || saveTimer) return;\n"
            + "      saveTimer = setTimeout(function () {\n"
            + "        saveTimer = null;\n"
            + "        try {\n"
            + "          var keys = Object.keys(saved);\n"
            + "          if (keys.length > 300) {\n"
            + "            keys.sort(function (a, b) { return saved[a].t - saved[b].t; });\n"
            + "            for (var i = 0; i < keys.length - 300; i++) delete saved[keys[i]];\n"
            + "          }\n"
            + "          var p = storage.setItem(KEY, saved);\n"
            + "          if (p && typeof p.then === 'function') p.then(null, function () {});\n"
            + "        } catch (e) { log('save failed ' + e); }\n"
            + "      }, 1500);\n"
            + "    }\n"
            + "\n"
            + "    // Which chapter the reader is loading: the URL of its text.\n"
            + "    var CHAPTER_URL = /\\/(?:chapters\\/([^\\/?#]+)\\/content|(?:free|preview)\\/([^\\/?#]+))\\/(?:chuong-)?(\\d+)/;\n"
            + "    var originalFetch = g.fetch;\n"
            + "    if (typeof originalFetch === 'function') {\n"
            + "      g.fetch = function (input, init) {\n"
            + "        var result = originalFetch.apply(this, arguments);\n"
            + "        try {\n"
            + "          var url = typeof input === 'string' ? input : (input && input.url) || '';\n"
            + "          var m = CHAPTER_URL.exec(url);\n"
            + "          if (m) {\n"
            + "            var req = { slug: decodeURIComponent(m[1] || m[2]), n: parseInt(m[3], 10), done: false, used: false };\n"
            + "            request = req;\n"
            + "            if (result && typeof result.then === 'function') {\n"
            + "              result.then(function () { req.done = true; }, function () {});\n"
            + "            }\n"
            + "          }\n"
            + "        } catch (e) {}\n"
            + "        return result;\n"
            + "      };\n"
            + "    }\n"
            + "\n"
            + "    function restore(slug, n, line) {\n"
            + "      log('restore ' + slug + ' ch ' + n + ' line ' + line);\n"
            + "      var s = V.getState();\n"
            + "      var wasPlaying = s.autoPlay === true;\n"
            + "      // No auto play of the new text: the user presses play to continue from the line.\n"
            + "      if (wasPlaying) s.setAutoPlay(false);\n"
            + "      // Closing the bar stops any speech still going on and resets the play button.\n"
            + "      if (wasPlaying && s.isVoiceBarOpen) s.setIsVoiceBarOpen(false);\n"
            + "      setTimeout(function () {\n"
            + "        try { if (!V.getState().isVoiceBarOpen) V.getState().setIsVoiceBarOpen(true); } catch (e) {}\n"
            + "      }, wasPlaying ? 200 : 0);\n"
            + "      // Highlight once the lines are laid out, so that the reader also scrolls to it.\n"
            + "      setTimeout(function () {\n"
            + "        try {\n"
            + "          var cur = V.getState();\n"
            + "          if (loaded && loaded.slug === slug && loaded.n === n && cur.activeLine <= 0 && cur.autoPlay !== true) {\n"
            + "            cur.setActiveLine(line);\n"
            + "          }\n"
            + "        } catch (e) { log('highlight failed ' + e); }\n"
            + "      }, 900);\n"
            + "    }\n"
            + "\n"
            + "    V.subscribe(function (s, prev) {\n"
            + "      try {\n"
            + "        if (s.activeLine === -1 && request && request.done && !request.used) {\n"
            + "          // The reader just showed the text of the requested chapter.\n"
            + "          request.used = true;\n"
            + "          loaded = { slug: request.slug, n: request.n };\n"
            + "          var p = saved[loaded.slug];\n"
            + "          if (p && p.c === loaded.n && p.l > 0) restore(loaded.slug, loaded.n, p.l);\n"
            + "          return;\n"
            + "        }\n"
            + "        if (prev && s.activeLine !== prev.activeLine && s.activeLine > 0 && loaded) {\n"
            + "          saved[loaded.slug] = { c: loaded.n, l: s.activeLine, t: Date.now() };\n"
            + "          persist();\n"
            + "        }\n"
            + "      } catch (e) { log('listener failed ' + e); }\n"
            + "    });\n"
            + "    log('ready');\n"
            + "  } catch (e) {\n"
            + "    log('init failed ' + e);\n"
            + "  }\n"
            + "})();\n";
}
