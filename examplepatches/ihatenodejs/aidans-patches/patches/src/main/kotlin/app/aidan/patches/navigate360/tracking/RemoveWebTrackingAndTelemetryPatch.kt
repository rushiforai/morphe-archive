package app.aidan.patches.navigate360.tracking

import app.aidan.patches.navigate360.shared.COMPATIBILITY_NAVIGATE360
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.io.File

val removeWebTrackingAndTelemetryPatch = rawResourcePatch(
    name = "Remove Web Telemetry",
    description = "Removes Sentry error/performance reporting, CSP telemetry endpoints, and Gainsight web bootstrap scripts from the embedded Cordova web bundle.",
    default = true
) {
    compatibleWith(COMPATIBILITY_NAVIGATE360)

    execute {
        val indexHtml = get("assets/www/index.html")
        indexHtml.replaceRequired(
            """
            |    <meta
            |      http-equiv="Reporting-Endpoints"
            |      content='sentry-csp="https://sentry.devops.eab.com/api/51/security/?sentry_key=5a282e1f1a464673aa8fef5b0d51a633"'
            |    />
            """.trimMargin(),
            ""
        )
        indexHtml.replaceRequired("; report-to sentry-csp", "")
        indexHtml.replaceRequired(
            """
            |    <!-- SENTRY -->
            |    <script src="./bin/sentry.js"></script>
            |    <script>
            |
            |      if (typeof Sentry !== 'undefined') {
            |        Sentry.init({
            |          dsn: 'https://5a282e1f1a464673aa8fef5b0d51a633@sentry.devops.eab.com/51',
            |          environment: 'PROD',
            |          release: '26.19.22'
            |        });
            |
            |        document.addEventListener('deviceready', () => {
            |          Sentry.setTag('device.model', device.model);
            |          Sentry.setTag('device.ver_os', device.version);
            |          Sentry.setTag('device.platform', device.platform);
            |          Sentry.setTag('device.ver_cordova', device.cordova);
            |          Sentry.addBreadcrumb({
            |            category: 'system',
            |            message: 'Loading',
            |            level: 'info'
            |          });
            |        });
            |
            |        document.addEventListener('pause', () => {
            |          Sentry.addBreadcrumb({
            |            category: 'system',
            |            message: 'Paused',
            |            level: 'info'
            |          });
            |        });
            |        document.addEventListener('resume', () => {
            |          Sentry.addBreadcrumb({
            |            category: 'system',
            |            message: 'Resumed',
            |            level: 'info'
            |          });
            |        });
            |        window.addEventListener('offline', () => {
            |          Sentry.addBreadcrumb({
            |            category: 'network',
            |            message: 'Offline',
            |            level: 'info'
            |          });
            |        });
            |        window.addEventListener('online', () => {
            |          Sentry.addBreadcrumb({
            |            category: 'network',
            |            message: 'Online',
            |            level: 'info'
            |          });
            |        });
            |      }
            |    </script>
            """.trimMargin(),
            "    <!-- Sentry disabled -->"
        )

        val bundle = get("assets/bundle.js")
        bundle.replaceRequired(
            """
            |function sendMessage(body) {
            |    var tsWindow = window;
            |    if ((0,_platformType__WEBPACK_IMPORTED_MODULE_0__.getPlatformType)() === _type__WEBPACK_IMPORTED_MODULE_1__.PlatformType.ios) {
            |        tsWindow.webkit.messageHandlers.gpxjs.postMessage(body);
            |    }
            |    else if ((0,_platformType__WEBPACK_IMPORTED_MODULE_0__.getPlatformType)() === _type__WEBPACK_IMPORTED_MODULE_1__.PlatformType.android) {
            |        tsWindow.gpxjs && tsWindow.gpxjs.postMessage(JSON.stringify(body));
            |    }
            |}
            """.trimMargin(),
            "function sendMessage(body) {}"
        )
        bundle.replaceRequired(
            """
            |function startEngine() {
            |    if (window !== null) {
            |        engineStarted = true;
            |        (0,_gainsightpx__WEBPACK_IMPORTED_MODULE_2__.createEvent)({ type: _type__WEBPACK_IMPORTED_MODULE_1__.kEventType.engineState, params: { "state": true } });
            |        setTimeout(function () {
            |            var value = "env(safe-area-inset-top)";
            |            document.documentElement.style.setProperty("--sat", value);
            |            ignoreSafeAreaOffset = getComputedStyle(document.documentElement).getPropertyValue('--sat') != "0px";
            |        }, 2000);
            |    }
            |    else {
            |        (0,_gainsightpx__WEBPACK_IMPORTED_MODULE_2__.createEvent)({ type: _type__WEBPACK_IMPORTED_MODULE_1__.kEventType.engineState, params: { "state": false } });
            |    }
            |}
            """.trimMargin(),
            "function startEngine() {}"
        )

        val gainsightPlugin = get("assets/www/plugins/cordova-gainsight/www/gainsight.js")
        gainsightPlugin.replaceRequired("return promiseExec('attach');", "return Promise.resolve({ initialized: false, attached: false });")
        gainsightPlugin.replaceRequired(
            "return promiseExec('getDiagnostics');",
            "return Promise.resolve({ initialized: false, apiKeyPresent: false, sdkVersion: '', host: '' });"
        )
        gainsightPlugin.replaceRequired("return promiseExec('getApiKey');", "return Promise.resolve({ apiKey: '' });")
    }
}

/**
 * Replaces every literal occurrence of [expected] in this UTF-8 file and overwrites it.
 *
 * @throws PatchException if [expected] is absent.
 * @throws java.io.IOException if reading or writing the file fails.
 */
private fun File.replaceRequired(expected: String, replacement: String) {
    val contents = readText()
    if (!contents.contains(expected)) {
        throw PatchException("Expected telemetry asset content was not found in $path")
    }
    writeText(contents.replace(expected, replacement))
}
