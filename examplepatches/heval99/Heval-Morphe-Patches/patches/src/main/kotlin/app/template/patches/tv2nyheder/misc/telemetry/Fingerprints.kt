package app.template.patches.tv2nyheder.misc.telemetry

// Chartbeat (com.chartbeat.androidsdk) is the only usage analytics SDK and Bugsnag
// (com.bugsnag.android) the only crash reporter in the app. Both keep their library class names,
// so Disable telemetry anchors on Tracker and BugsnagContentProvider directly:
//   - Chartbeat starts from Tracker.setupTracker (the app's own wrapper, Ldo1;, calls it), which
//     starts the ping service, the foreground tracker and the engagement timer.
//   - Bugsnag starts itself from BugsnagContentProvider.onCreate (no other caller of the SDK's
//     start helper in the dex).

/** The Bugsnag startup provider; its onCreate holds the only start call. */
internal const val BUGSNAG_PROVIDER = "Lcom/bugsnag/android/internal/BugsnagContentProvider;"

/** The Chartbeat tracker whose setupTracker overloads start every reporter. */
internal const val CHARTBEAT_TRACKER = "Lcom/chartbeat/androidsdk/Tracker;"
