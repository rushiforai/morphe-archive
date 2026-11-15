package app.hoitruyenchu.extension.itruyenchu.patches.sync;

import app.hoitruyenchu.extension.itruyenchu.patches.shared.JsScripts;

/**
 * The sync at app start ({@link AutoSyncPatch#beforeStorageGet}) cannot help when the user logs in
 * after the app started, e.g. right after a fresh install: the bookshelf stays empty until the
 * "Đồng Bộ Truyện" button of the account tab is pressed, and the "Đồng bộ" button of the bookshelf
 * refuses to run with an empty bookshelf ("Không có truyện để đồng bộ", checked before any request,
 * HistoryScreen F34016).
 * <p>
 * A small JS script ({@link #SCRIPT}) is evaluated right after the app's bundle. It
 * <ul>
 *   <li>syncs as soon as the user logs in (the auth store gets a token after it was loaded without one);</li>
 *   <li>turns the "Không có truyện để đồng bộ" toast into a real sync when the user is logged in.</li>
 * </ul>
 * Both do exactly what the bookshelf button does: {@code POST /users/sync-books} with the local history
 * through the app's API client (answered by {@link FreeChapterInterceptor} from sync-books-new, with
 * book titles), then {@code clearRecentReads} + {@code addRecentRead} for each entry, oldest first.
 */
@SuppressWarnings("unused")
public final class SyncScript {
    private static final String TAG = "HTC-Sync";
    private static final String FILE_NAME = "htc-sync.js";

    private SyncScript() {
    }

    /** End of ReactInstance.loadJSBundle(loader): the app bundle is scheduled, queue the script after it. */
    public static void afterMainBundle(Object reactInstance) {
        JsScripts.load(reactInstance, FILE_NAME, SCRIPT, TAG);
    }

    /**
     * Plain ES5, everything inside try/catch: an exception escaping here would be a fatal JS error.
     * Module ids (app 2.1.0, dependencies of the HistoryScreen module 3370):
     * 2713 = useAuthStore ("auth-storage"), 2735 = useReadStore ("read"),
     * 2680 = react-native-toast-message, 2722 = API client (axios, used as {@code .default.post}).
     */
    static final String SCRIPT = ""
            + "(function () {\n"
            + "  var TAG = '[HTC-Sync] ';\n"
            + "  var EMPTY = 'Kh\\u00f4ng c\\u00f3 truy\\u1ec7n \\u0111\\u1ec3 \\u0111\\u1ed3ng b\\u1ed9';\n"
            + "  function log(m) { try { console.log(TAG + m); } catch (e) {} }\n"
            + "  function esDefault(m) { return m && m.__esModule ? m['default'] : m; }\n"
            + "  try {\n"
            + "    var g = typeof globalThis !== 'undefined' ? globalThis : this;\n"
            + "    if (typeof g.__r !== 'function') { log('no __r'); return; }\n"
            + "    var A = g.__r(2713) && g.__r(2713).useAuthStore;\n"
            + "    var R = g.__r(2735) && g.__r(2735).useReadStore;\n"
            + "    var Toast = esDefault(g.__r(2680));\n"
            + "    var api = esDefault(g.__r(2722));\n"
            + "    if (!A || typeof A.getState !== 'function' || typeof A.subscribe !== 'function') { log('auth store not found'); return; }\n"
            + "    if (!R || typeof R.getState !== 'function' || typeof R.getState().addRecentRead !== 'function'\n"
            + "        || typeof R.getState().clearRecentReads !== 'function') { log('read store not found'); return; }\n"
            + "    if (!api || typeof api.post !== 'function') { log('api client not found'); return; }\n"
            + "    if (!Toast || typeof Toast.show !== 'function') { log('toast not found'); Toast = null; }\n"
            + "\n"
            + "    var busy = false;\n"
            + "    var originalShow = Toast ? Toast.show : null;\n"
            + "    function toast(options) {\n"
            + "      try { if (originalShow) originalShow.call(Toast, options); } catch (e) {}\n"
            + "    }\n"
            + "    function loggedIn() {\n"
            + "      try { return !!A.getState().accessToken; } catch (e) { return false; }\n"
            + "    }\n"
            + "\n"
            + "    // Same as the bookshelf button. options: the app's toast object of a button press, or null (login:\n"
            + "    // toast only when books were added). A press during a running sync gets that sync's result.\n"
            + "    var pending = null;\n"
            + "    var ERROR = 'Có lỗi khi đồng bộ truyện';\n"
            + "    var DONE = 'Đồng bộ truyện thành công';\n"
            + "    function message(type, text, options) {\n"
            + "      return { type: type, text1: text, position: (options && options.position) || 'bottom' };\n"
            + "    }\n"
            + "    function key(item) { return item ? item.slug + '#' + item.currentChapter : ''; }\n"
            + "    function sync(reason, options) {\n"
            + "      if (!loggedIn()) return;\n"
            + "      if (busy) { if (options) pending = options; return; }\n"
            + "      busy = true;\n"
            + "      var local = [];\n"
            + "      try { local = (R.getState().recentReads || []).slice(); } catch (e) {}\n"
            + "      var before = {};\n"
            + "      for (var b = 0; b < local.length; b++) before[key(local[b])] = true;\n"
            + "      log(reason + ': syncing, local=' + local.length);\n"
            + "      function finish() {\n"
            + "        busy = false;\n"
            + "        var o = options || pending;\n"
            + "        pending = null;\n"
            + "        return o;\n"
            + "      }\n"
            + "      var p;\n"
            + "      try { p = api.post('/users/sync-books', { recentReads: local }); } catch (e) { finish(); log('post failed ' + e); return; }\n"
            + "      p.then(function (res) {\n"
            + "        var opts = finish();\n"
            + "        try {\n"
            + "          var data = res && res.data;\n"
            + "          var list = data && data.recentReads;\n"
            + "          if (Object.prototype.toString.call(list) !== '[object Array]') {\n"
            + "            log(reason + ': unexpected answer');\n"
            + "            if (opts) toast(message('error', (data && data.message) || ERROR, opts));\n"
            + "            return;\n"
            + "          }\n"
            + "          if (list.length > 0) {\n"
            + "            // Entries read while the request was running are not in the answer: keep them on top.\n"
            + "            var fresh = [], freshSlugs = {};\n"
            + "            var now = R.getState().recentReads || [];\n"
            + "            for (var i = 0; i < now.length; i++) {\n"
            + "              if (now[i] && !before[key(now[i])]) { fresh.push(now[i]); freshSlugs[now[i].slug] = true; }\n"
            + "            }\n"
            + "            R.getState().clearRecentReads();\n"
            + "            // The answer is the merged history, oldest first; addRecentRead puts each entry on top.\n"
            + "            for (var j = 0; j < list.length; j++) {\n"
            + "              if (list[j] && !freshSlugs[list[j].slug]) R.getState().addRecentRead(list[j]);\n"
            + "            }\n"
            + "            for (var k = fresh.length - 1; k >= 0; k--) R.getState().addRecentRead(fresh[k]);\n"
            + "            if (fresh.length) log(reason + ': kept ' + fresh.length + ' entries read meanwhile');\n"
            + "          }\n"
            + "          log(reason + ': ' + list.length + ' books');\n"
            + "          if (list.length === 0) {\n"
            + "            if (opts) toast(opts);\n"
            + "          } else if (opts || list.length > local.length) {\n"
            + "            toast(message('success', (data && data.message) || DONE, opts));\n"
            + "          }\n"
            + "        } catch (e) { log(reason + ': apply failed ' + e); }\n"
            + "      }, function (e) {\n"
            + "        var opts = finish();\n"
            + "        log(reason + ': failed ' + e);\n"
            + "        if (opts) {\n"
            + "          var msg = null;\n"
            + "          try { msg = e && e.response && e.response.data && e.response.data.message; } catch (x) {}\n"
            + "          toast(message('error', msg || ERROR, opts));\n"
            + "        }\n"
            + "      });\n"
            + "    }\n"
            + "\n"
            + "    // 1. The bookshelf button with an empty bookshelf: sync instead of refusing.\n"
            + "    if (Toast) {\n"
            + "      Toast.show = function (options) {\n"
            + "        try {\n"
            + "          if (options && options.text1 === EMPTY && loggedIn()) {\n"
            + "            sync('button', options);\n"
            + "            return;\n"
            + "          }\n"
            + "        } catch (e) {}\n"
            + "        return originalShow.apply(this, arguments);\n"
            + "      };\n"
            + "    }\n"
            + "\n"
            + "    // 2. Login after the app started (the startup sync ran without a token).\n"
            + "    var hydrated = function () {\n"
            + "      try { return !A.persist || typeof A.persist.hasHydrated !== 'function' || A.persist.hasHydrated(); } catch (e) { return true; }\n"
            + "    };\n"
            + "    A.subscribe(function (s, prev) {\n"
            + "      try {\n"
            + "        if (!s || !s.accessToken || (prev && prev.accessToken) || !hydrated()) return;\n"
            + "        // Let the login finish (user, navigation) before syncing.\n"
            + "        setTimeout(function () { sync('login', null); }, 1500);\n"
            + "      } catch (e) { log('listener failed ' + e); }\n"
            + "    });\n"
            + "    log('ready');\n"
            + "  } catch (e) {\n"
            + "    log('init failed ' + e);\n"
            + "  }\n"
            + "})();\n";
}
