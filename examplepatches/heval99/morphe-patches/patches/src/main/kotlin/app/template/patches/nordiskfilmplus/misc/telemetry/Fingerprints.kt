package app.template.patches.nordiskfilmplus.misc.telemetry

// Nordisk Film+ bundles Sentry (io.sentry) with R8-minified internals: SentryAndroid itself is
// renamed, but the auto-init ContentProvider keeps its library class name, and both start paths
// (SentryInitProvider.onCreate and MobileNFApplication.onCreate) call the same static init method.
// Finding that method through the provider gives one choke point without hardcoding an obfuscated
// class name.

/** The Sentry auto-init provider; its onCreate holds the init call. */
internal const val SENTRY_INIT_PROVIDER = "Lio/sentry/android/core/SentryInitProvider;"
