package morningentree.morphe.patches.google.gboard.tracking

internal const val GBOARD_TRACKING_HOSTS = """
    federatedcompute-pa.googleapis.com

    # --- Firebase / Google analytics & measurement ---
    app-measurement.com
    firebaselogging-pa.googleapis.com
    firebaselogging.googleapis.com
    google-analytics.com
    ssl.google-analytics.com
    www.google-analytics.com
    analytics.google.com
    firebase-settings.crashlytics.com
    crashlyticsreports-pa.googleapis.com

    # --- Google ads ---
    googleads.g.doubleclick.net
    ad.doubleclick.net
    pagead2.googlesyndication.com
    www.googleadservices.com
    admob.com
    admob-gmats.uc.r.appspot.com

    # --- Third-party analytics (rarely in Gboard; kept for completeness) ---
    api.mixpanel.com
    graph.facebook.com
"""

internal const val GBOARD_LOCKDOWN_HOSTS = """
    # Strategy: a DENY-list, not a broad block. We never touch the functional hosts GIF search, cloud
    # voice typing, stickers, translation, or the connectivity check use, so those features cannot
    # break. We only rewrite specific, known ad / telemetry / logging hosts.
    #
    # Why not "block everything except GIF/voice"? This patch is a compile-time host-string rewrite,
    # not a firewall. Gboard's functional features ride shared Google infra (www.google.com,
    # www.googleapis.com, sticker-pa, speechs3proto2-pa, translation, imagen, media.*), and most of
    # its telemetry actually goes through Google Play Services (Clearcut) which has NO literal URL in
    # the APK to rewrite. So the honest, reliable move is to null the ad/telemetry hosts that DO
    # appear as literals and leave everything functional untouched.
    #
    # For reference, the functional hosts we intentionally DO NOT block (verified in the decompile):
    #   speechs3proto2-pa.googleapis.com (+ sandbox/dev variants), tenor.googleapis.com / *.tenor.com,
    #   sticker-pa.googleapis.com, translation.googleapis.com, *-gboard-imagen-pa.googleapis.com,
    #   www.google.com, www.googleapis.com, www.gstatic.com, media.googleusercontent.com.

    # --- Federated learning / on-device training upload (the one telemetry literal Gboard ships) ---
    federatedcompute-pa.googleapis.com

    # --- Firebase / Google analytics & measurement ---
    app-measurement.com
    firebaselogging-pa.googleapis.com
    firebaselogging.googleapis.com
    google-analytics.com
    ssl.google-analytics.com
    www.google-analytics.com
    analytics.google.com
    firebase-settings.crashlytics.com
    crashlyticsreports-pa.googleapis.com

    # --- Google ads ---
    adservice.google.com
    adwords.google.com
    googleads.g.doubleclick.net
    ad.doubleclick.net
    stats.g.doubleclick.net
    doubleclick.net
    pagead2.googlesyndication.com
    partner.googleadservices.com
    www.googleadservices.com
    admob.com
    admob-gmats.uc.r.appspot.com

    # --- Third-party analytics (rarely in Gboard; harmless no-ops if absent) ---
    api.mixpanel.com
    graph.facebook.com
    app.adjust.com
    api.amplitude.com
"""
