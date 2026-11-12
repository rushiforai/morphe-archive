.class public final Lcom/opera/android/wallpaper/WallpaperStorefrontExtension;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ldx3;

.field public static b:Llnn;


# direct methods
.method public static getSupportedPreviewTargets()I
    .registers 3

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Lr9n;->H(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_21

    const-string v0, "xiaomi"

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "Redmi"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1f

    const/4 v0, 0x3

    return v0

    :cond_1f
    const/4 v0, 0x7

    return v0

    :cond_21
    const/4 v0, 0x1

    return v0
.end method

.method public static shouldInstall(Lorg/chromium/url/GURL;)Z
    .registers 4
    .param p0    # Lorg/chromium/url/GURL;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-boolean v0, p0, Lorg/chromium/url/GURL;->b:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Lrih;->q(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_f

    return v1

    :cond_f
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_24

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_24

    invoke-static {p0, v0}, LJ/N;->MstQ1QcZ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_24
    return v1
.end method

.method public static showPreview(Lorg/chromium/url/GURL;I)Z
    .registers 11
    .param p0    # Lorg/chromium/url/GURL;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/wallpaper/WallpaperStorefrontExtension;->a:Ldx3;

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    invoke-static {}, Lcom/opera/android/wallpaper/WallpaperStorefrontExtension;->getSupportedPreviewTargets()I

    move-result v0

    and-int v5, p1, v0

    if-nez v5, :cond_e

    :cond_d
    return v1

    :cond_e
    sget-object p1, Lcom/opera/android/wallpaper/WallpaperStorefrontExtension;->a:Ldx3;

    invoke-virtual {p1}, Ldx3;->N()Lex3;

    move-result-object p1

    invoke-interface {p1}, Lijf;->b()Lcom/opera/android/Lazy;

    move-result-object p1

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgjm;

    new-instance v0, Ldmn;

    sget-object v8, Lwln;->g:Lwln;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v4

    new-instance v2, Lcmn;

    const/4 v7, 0x0

    const/16 v6, 0x9

    const/4 v3, 0x0

    invoke-direct/range {v2 .. v7}, Lcmn;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    invoke-direct {v0, v8, v2}, Ldmn;-><init>(Lwln;Lcmn;)V

    invoke-virtual {p1, v0, v1}, Lgjm;->e(Ln37;Z)V

    const/4 p0, 0x1

    return p0
.end method
