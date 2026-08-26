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
    # --- Block: broad Google endpoints (everything Gboard talks to routes through these) ---
    googleapis.com
    google.com
    gstatic.com
    gvt1.com
    gvt2.com
    ggpht.com

    # --- Block: third-party analytics / ads (belt and suspenders) ---
    app-measurement.com
    doubleclick.net
    googlesyndication.com
    googleadservices.com
    google-analytics.com
    crashlytics.com

    # --- Allow: GIF search (Tenor) ---
    @@tenor.googleapis.com
    @@tenor.com
    @@media.tenor.com
    @@media1.tenor.com
    @@media.tenor.co
    @@c.tenor.com

    # --- Allow: cloud voice typing (speech) ---
    @@speechs3proto2-pa.googleapis.com
"""
