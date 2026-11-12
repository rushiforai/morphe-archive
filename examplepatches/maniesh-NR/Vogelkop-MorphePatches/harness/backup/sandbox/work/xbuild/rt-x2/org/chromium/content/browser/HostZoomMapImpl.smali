.class public final Lorg/chromium/content/browser/HostZoomMapImpl;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(D)D
    .registers 4

    sget-object v0, Lgq5;->m:Lgde;

    invoke-virtual {v0}, Lgde;->a()Z

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3a83126f    # 0.001f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_12

    return-wide p0

    :cond_12
    const-wide v0, 0x3ff3333340000000L    # 1.2000000476837158

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p0

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    mul-double/2addr p0, v0

    invoke-static {p0, p1}, Ljava/lang/Math;->log10(D)D

    move-result-wide p0

    const-wide v0, 0x3fb445392859c561L    # 0.0791812633049367

    div-double/2addr p0, v0

    return-wide p0
.end method

.method public static buildSiteZoomInfo(Ljava/lang/String;D)Lorg/chromium/content_public/browser/SiteZoomInfo;
    .registers 4

    new-instance v0, Lorg/chromium/content_public/browser/SiteZoomInfo;

    invoke-direct {v0, p0, p1, p2}, Lorg/chromium/content_public/browser/SiteZoomInfo;-><init>(Ljava/lang/String;D)V

    return-object v0
.end method

.method public static getAdjustedZoomLevel(D)D
    .registers 2

    invoke-static {p0, p1}, Lorg/chromium/content/browser/HostZoomMapImpl;->a(D)D

    move-result-wide p0

    return-wide p0
.end method
