package app.consumerclarity.patches.talabat

private const val SENTRY = "Lio/sentry/Sentry;"
private const val SENTRY_OPTIONS = "Lio/sentry/SentryOptions;"
private const val ANDROID_OPTIONS = "Lio/sentry/android/core/SentryAndroidOptions;"
private const val REPLAY_OPTIONS = "Lio/sentry/SentryReplayOptions;"

private fun sentryFalseControl(name: String, description: String, classType: String, vararg methods: String) =
    consumerBytecodePatch(name, description, "Diagnostics") {
        execute {
            methods.forEach { methodName ->
                mutableClassDefBy(classType).methods.single { it.name == methodName }.returnFalseWhenKey(name)
            }
        }
    }

private fun sentryNullControl(name: String, description: String, classType: String, method: String) =
    consumerBytecodePatch(name, description, "Diagnostics") {
        execute {
            mutableClassDefBy(classType).methods.single { it.name == method }.returnNullWhenKey(name)
        }
    }

@Suppress("unused")
val disableSentryCrashReportsPatch = consumerBytecodePatch(
    "Disable Sentry crash reports",
    "Suppresses Sentry events, exceptions, messages, and user-feedback reports while returning an empty event ID.",
    "Diagnostics",
) {
    execute {
        mutableClassDefBy(SENTRY).methods.forEach { method ->
            when (method.name) {
                "captureEvent", "captureException", "captureMessage" ->
                    method.returnEmptySentryIdWhenKey("Disable Sentry crash reports")
                "captureUserFeedback" -> method.skipWhenKey("Disable Sentry crash reports")
            }
        }
    }
}

@Suppress("unused")
val disableSentryPerformancePatch = sentryNullControl(
    "Disable Sentry performance traces",
    "Sets Sentry's performance trace sample rate to zero.",
    SENTRY_OPTIONS,
    "getTracesSampleRate",
)

@Suppress("unused")
val disableSentryProfilingPatch = sentryNullControl(
    "Disable Sentry profiling",
    "Sets Sentry's profiling sample rate to zero.",
    SENTRY_OPTIONS,
    "getProfilesSampleRate",
)

@Suppress("unused")
val disableSentrySessionReplayPatch = sentryFalseControl(
    "Disable Sentry session replay",
    "Displays no Sentry session-replay capture. This is separate from crash screenshots.",
    REPLAY_OPTIONS,
    "isSessionReplayEnabled",
)

@Suppress("unused")
val disableSentryErrorReplayPatch = sentryFalseControl(
    "Disable Sentry error replay",
    "Disables Sentry replay capture associated with errors.",
    REPLAY_OPTIONS,
    "isSessionReplayForErrorsEnabled",
)

@Suppress("unused")
val disableSentryScreenshotsPatch = sentryFalseControl(
    "Disable Sentry crash screenshots",
    "Prevents Sentry from attaching screenshots to crash events.",
    ANDROID_OPTIONS,
    "isAttachScreenshot",
)

@Suppress("unused")
val disableSentryViewHierarchyPatch = sentryFalseControl(
    "Disable Sentry view hierarchy capture",
    "Prevents Sentry from attaching the app's view hierarchy to events.",
    ANDROID_OPTIONS,
    "isAttachViewHierarchy",
)

@Suppress("unused")
val disableSentryAnrPatch = sentryFalseControl(
    "Disable Sentry ANR reports",
    "Disables Sentry application-not-responding reports.",
    ANDROID_OPTIONS,
    "isAnrEnabled",
)

@Suppress("unused")
val disableSentryAnrProfilingPatch = sentryNullControl(
    "Disable Sentry ANR profiling",
    "Sets Sentry's ANR profiling sample rate to zero.",
    ANDROID_OPTIONS,
    "getAnrProfilingSampleRate",
)

@Suppress("unused")
val disableSentryNativeReportsPatch = sentryFalseControl(
    "Disable Sentry native reporting",
    "Disables Sentry's native NDK integration.",
    ANDROID_OPTIONS,
    "isEnableNdk",
)

@Suppress("unused")
val disableSentryInteractionTracingPatch = sentryFalseControl(
    "Disable Sentry interaction tracing",
    "Disables Sentry performance traces built from user interactions.",
    SENTRY_OPTIONS,
    "isEnableUserInteractionTracing",
)

@Suppress("unused")
val disableSentryInteractionBreadcrumbsPatch = sentryFalseControl(
    "Disable Sentry interaction breadcrumbs",
    "Prevents taps and other user interactions from becoming Sentry breadcrumbs.",
    SENTRY_OPTIONS,
    "isEnableUserInteractionBreadcrumbs",
)

@Suppress("unused")
val disableSentryNetworkBreadcrumbsPatch = sentryFalseControl(
    "Disable Sentry network breadcrumbs",
    "Prevents network changes from becoming Sentry breadcrumbs.",
    ANDROID_OPTIONS,
    "isEnableNetworkEventBreadcrumbs",
)

@Suppress("unused")
val disableSentryLifecycleBreadcrumbsPatch = sentryFalseControl(
    "Disable Sentry lifecycle breadcrumbs",
    "Disables activity, application, and component lifecycle breadcrumbs.",
    ANDROID_OPTIONS,
    "isEnableActivityLifecycleBreadcrumbs",
    "isEnableAppLifecycleBreadcrumbs",
    "isEnableAppComponentBreadcrumbs",
)

@Suppress("unused")
val disableSentryDeviceContextPatch = sentryFalseControl(
    "Disable Sentry device context",
    "Prevents Sentry from collecting additional device context.",
    ANDROID_OPTIONS,
    "isCollectAdditionalContext",
)

@Suppress("unused")
val disableSentryStorageContextPatch = sentryFalseControl(
    "Disable Sentry storage context",
    "Prevents Sentry from collecting external-storage context.",
    ANDROID_OPTIONS,
    "isCollectExternalStorageContext",
)

@Suppress("unused")
val disableSentryFrameTrackingPatch = sentryFalseControl(
    "Disable Sentry frame tracking",
    "Disables Sentry frame-rate and rendering performance collection.",
    ANDROID_OPTIONS,
    "isEnableFramesTracking",
)

@Suppress("unused")
val disableSentryLogcatPatch = consumerBytecodePatch(
    "Disable Sentry logcat collection",
    "Prevents Sentry from turning logcat messages into breadcrumbs or Sentry logs. Logcat output itself is unchanged.",
    "Diagnostics",
) {
    execute {
        mutableClassDefBy("Lio/sentry/android/core/SentryLogcatAdapter;").methods.forEach { method ->
            if (method.name == "addAsBreadcrumb" || method.name == "addAsLog") {
                method.skipWhenKey("Disable Sentry logcat collection")
            }
        }
    }
}

@Suppress("unused")
val disableSentryBreadcrumbsPatch = consumerBytecodePatch(
    "Disable Sentry breadcrumbs",
    "Prevents application-supplied breadcrumbs from being recorded by Sentry.",
    "Diagnostics",
) {
    execute {
        mutableClassDefBy(SENTRY).methods.filter { it.name == "addBreadcrumb" }.forEach {
            it.skipWhenKey("Disable Sentry breadcrumbs")
        }
    }
}

@Suppress("unused")
val disableSentryTombstonesPatch = sentryFalseControl(
    "Disable Sentry tombstone reports",
    "Disables Sentry tombstone collection and historical tombstone reporting.",
    ANDROID_OPTIONS,
    "isTombstoneEnabled",
    "isReportHistoricalTombstones",
)

@Suppress("unused")
val disableSentryRootReportingPatch = sentryFalseControl(
    "Disable Sentry root reporting",
    "Disables Sentry's root-status checks and reporting.",
    ANDROID_OPTIONS,
    "isEnableRootCheck",
)

@Suppress("unused")
val disableSentryAppStartTracingPatch = sentryFalseControl(
    "Disable Sentry app-start tracing",
    "Disables automatic startup and activity lifecycle performance traces.",
    ANDROID_OPTIONS,
    "isEnableStandaloneAppStartTracing",
    "isEnableAutoActivityLifecycleTracing",
)

@Suppress("unused")
val disableSentryPerformanceV2Patch = sentryFalseControl(
    "Disable Sentry performance V2",
    "Disables Sentry's second-generation automatic performance collection.",
    ANDROID_OPTIONS,
    "isEnablePerformanceV2",
)

@Suppress("unused")
val disableSentrySystemBreadcrumbsPatch = sentryFalseControl(
    "Disable Sentry system breadcrumbs",
    "Disables system-event breadcrumbs and their extra device details.",
    ANDROID_OPTIONS,
    "isEnableSystemEventBreadcrumbs",
    "isEnableSystemEventBreadcrumbsExtras",
)

@Suppress("unused")
val disableSentryReplayNetworkBodiesPatch = sentryFalseControl(
    "Disable Sentry replay network bodies",
    "Prevents Sentry replay from capturing network request and response bodies.",
    REPLAY_OPTIONS,
    "isNetworkCaptureBodies",
)

@Suppress("unused")
val disableSentrySurfaceReplayPatch = sentryFalseControl(
    "Disable Sentry SurfaceView replay",
    "Prevents Sentry replay from capturing SurfaceView content.",
    REPLAY_OPTIONS,
    "isCaptureSurfaceViews",
)

@Suppress("unused")
val disableSentryCacheTracingPatch = sentryFalseControl(
    "Disable Sentry cache tracing",
    "Disables Sentry performance traces for cache operations.",
    SENTRY_OPTIONS,
    "isEnableCacheTracing",
)

@Suppress("unused")
val disableSentryDatabaseTracingPatch = sentryFalseControl(
    "Disable Sentry database tracing",
    "Disables Sentry performance traces for database transactions.",
    SENTRY_OPTIONS,
    "isEnableDatabaseTransactionTracing",
)

@Suppress("unused")
val disableSentryQueueTracingPatch = sentryFalseControl(
    "Disable Sentry queue tracing",
    "Disables Sentry performance traces for queue operations.",
    SENTRY_OPTIONS,
    "isEnableQueueTracing",
)

@Suppress("unused")
val disableSentryDisplayTracingPatch = sentryFalseControl(
    "Disable Sentry full-display tracing",
    "Disables Sentry's time-to-full-display performance traces.",
    SENTRY_OPTIONS,
    "isEnableTimeToFullDisplayTracing",
)

@Suppress("unused")
val disableSentryAnrThreadDumpsPatch = sentryFalseControl(
    "Disable Sentry ANR thread dumps",
    "Prevents Sentry from attaching thread dumps to ANR reports.",
    ANDROID_OPTIONS,
    "isAttachAnrThreadDump",
)

@Suppress("unused")
val disableSentryRawTombstonesPatch = sentryFalseControl(
    "Disable Sentry raw tombstones",
    "Prevents Sentry from attaching raw native tombstone data.",
    ANDROID_OPTIONS,
    "isAttachRawTombstone",
)

@Suppress("unused")
val disableSentryHistoricalAnrsPatch = sentryFalseControl(
    "Disable Sentry historical ANRs",
    "Disables Sentry reports for historical application-not-responding events.",
    ANDROID_OPTIONS,
    "isReportHistoricalAnrs",
)
