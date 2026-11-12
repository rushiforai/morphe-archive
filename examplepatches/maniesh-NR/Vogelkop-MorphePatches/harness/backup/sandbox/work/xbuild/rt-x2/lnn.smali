.class public final Llnn;
.super Llim;
.source "SourceFile"


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    const/4 p0, 0x0

    sput-object p0, Lcom/opera/android/wallpaper/WallpaperStorefrontExtension;->a:Ldx3;

    return-void
.end method
