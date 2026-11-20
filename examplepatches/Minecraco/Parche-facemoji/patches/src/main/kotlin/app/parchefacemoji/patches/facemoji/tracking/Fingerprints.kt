package app.parchefacemoji.patches.facemoji.tracking

import app.morphe.patcher.Fingerprint

/**
 * Rastreadores y SDK de analitica incluidos en Facemoji segun los metadatos publicos
 * de la app: Google Firebase Analytics, Google Crashlytics, Facebook y AppsFlyer.
 *
 * Igual que en los anuncios, se apunta a la API publica de cada SDK para que las huellas
 * sobrevivan a las actualizaciones de la app.
 */

/** Firebase Analytics: eventos. */
internal object FirebaseAnalyticsEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "logEvent",
    returnType = "V",
)

/** Firebase Analytics: propiedades de usuario. */
internal object FirebaseAnalyticsUserPropertyFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setUserProperty",
    returnType = "V",
)

/** Firebase Analytics: identificador de usuario. */
internal object FirebaseAnalyticsUserIdFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setUserId",
    returnType = "V",
)

/** Firebase Analytics: parametros por defecto que se adjuntan a todos los eventos. */
internal object FirebaseAnalyticsDefaultParamsFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setDefaultEventParameters",
    returnType = "V",
)

/** Crashlytics: registros y claves personalizadas. */
internal object CrashlyticsLogFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "log",
    returnType = "V",
)

/** Crashlytics: identificador de usuario. */
internal object CrashlyticsUserIdFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "setUserId",
    returnType = "V",
)

/** Crashlytics: excepciones registradas manualmente por la app. */
internal object CrashlyticsRecordExceptionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "recordException",
    returnType = "V",
)

/** Facebook: eventos de la app. */
internal object FacebookAppEventFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/AppEventsLogger;",
    name = "logEvent",
    returnType = "V",
)

/**
 * AppsFlyer: `AppsFlyerLib` es una interfaz, asi que se busca la clase que la implementa
 * y se neutralizan sus eventos. El nombre de la implementacion cambia entre versiones del
 * SDK, por eso se busca por interfaz y no por nombre de clase.
 */
internal object AppsFlyerEventFingerprint : Fingerprint(
    interfaces = listOf("Lcom/appsflyer/AppsFlyerLib;"),
    name = "logEvent",
    returnType = "V",
)
