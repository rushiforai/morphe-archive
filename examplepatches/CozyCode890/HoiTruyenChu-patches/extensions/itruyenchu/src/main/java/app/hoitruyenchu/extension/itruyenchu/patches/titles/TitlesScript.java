package app.hoitruyenchu.extension.itruyenchu.patches.titles;

/**
 * App 3.0.0 keeps the chapter lists it downloaded in memory for an hour ({@code getDataFromS3}, a Map
 * keyed {@code s3:{url}}; 2.1.0 kept them in AsyncStorage, which {@link ChapterTitlesPatch#beforeStorageGet}
 * updates). Titles that were still loading when the list was downloaded would only show after a restart.
 * <p>
 * This script, evaluated after the app bundle (app 3.0.0 only), wraps {@code getDataFromS3}: once Java
 * reports new titles for a book (device event {@link #EVENT}, the slug), the next request of that
 * book's chapter list gets a query string ({@code ?htc=n}), so it is a new cache entry: the app downloads it
 * again and {@link ChapterListInterceptor} fills in every known title. The app module ("s3") comes from
 * {@code __htcR(name)}, ids per app version in AppInfo. Plain ES5, everything inside try/catch: an exception
 * escaping here would be a fatal JS error.
 */
final class TitlesScript {
    static final String FILE_NAME = "htc-titles.js";
    static final String EVENT = "htcTitlesUpdated";

    private TitlesScript() {
    }

    static final String SCRIPT = ""
            + "(function () {\n"
            + "  var TAG = '[HTC-Titles] ';\n"
            + "  function log(m) { try { var s0 = globalThis.__htcS; if (s0 && s0.debug === false) return; console.log(TAG + m); } catch (e) {} }\n"
            + "  function S(k, d) { try { var s0 = globalThis.__htcS; var v = s0 ? s0[k] : undefined; return v === undefined || v === null ? d : v; } catch (e) { return d; } }\n"
            + "  try {\n"
            + "    var g = typeof globalThis !== 'undefined' ? globalThis : this;\n"
            + "    if (typeof g.__r !== 'function') { log('no __r'); return; }\n"
            + "    var M = g.__htcR('s3');\n"
            + "    var RN = g.__htcR('rn');\n"
            + "    if (!M || typeof M.getDataFromS3 !== 'function' || !RN || !RN.DeviceEventEmitter) { log('chapter list loader not found'); return; }\n"
            + "    // getDataFromS3('/chapters/' + slug + '.json.gz', true)\n"
            + "    var LIST = /^\\/chapters\\/([^\\/?#]+)\\.json\\.gz$/;\n"
            + "    var fresh = {};  // slug -> how many times new titles came: part of the new cache key\n"
            + "    RN.DeviceEventEmitter.addListener('" + EVENT + "', function (slug) {\n"
            + "      try {\n"
            + "        var k = String(slug);\n"
            + "        fresh[k] = (fresh[k] || 0) + 1;\n"
            + "        log(k + ': new titles, the chapter list is loaded again next time');\n"
            + "      } catch (e) {}\n"
            + "    });\n"
            + "    var orig = M.getDataFromS3;\n"
            + "    var wrapped = function (path) {\n"
            + "      try {\n"
            + "        if (typeof path === 'string' && S('titles.enabled', true)) {\n"
            + "          var m = LIST.exec(path);\n"
            + "          var v = 0;\n"
            + "          if (m) { try { v = fresh[decodeURIComponent(m[1])] || 0; } catch (x) { v = fresh[m[1]] || 0; } }\n"
            + "          if (v) {\n"
            + "            var args = Array.prototype.slice.call(arguments);\n"
            + "            args[0] = path + '?htc=' + v;\n"
            + "            return orig.apply(this, args);\n"
            + "          }\n"
            + "        }\n"
            + "      } catch (e) {}\n"
            + "      return orig.apply(this, arguments);\n"
            + "    };\n"
            + "    M.getDataFromS3 = wrapped;\n"
            + "    if (M.getDataFromS3 !== wrapped) { log('loader not writable'); return; }\n"
            + "    log('ready');\n"
            + "  } catch (e) {\n"
            + "    log('init failed ' + e);\n"
            + "  }\n"
            + "})();\n";
}
