.class public final Lcom/opera/ads/OperaAds;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method private static initContext(Landroid/content/Context;)V
    .registers 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lpn;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lpn;-><init>(Landroid/content/Context;B)V

    invoke-static {v0}, Lpfp;->c(Ljava/lang/Runnable;)V

    return-void
.end method
