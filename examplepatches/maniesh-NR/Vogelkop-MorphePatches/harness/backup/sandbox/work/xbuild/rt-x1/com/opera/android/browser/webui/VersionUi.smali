.class public final Lcom/opera/android/browser/webui/VersionUi;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static packageVersionCode()J
    .registers 2

    const-wide/32 v0, 0x71de74d2

    return-wide v0
.end method

.method public static packageVersionName()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Lr9n;->t(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    return-object v0
.end method
