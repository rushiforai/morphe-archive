.class public final synthetic Ll/uyv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/ads/BaseAdView;

.field public final synthetic b:Ll/s70;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/ads/BaseAdView;Ll/s70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uyv0;->a:Lcom/google/android/gms/ads/BaseAdView;

    .line 5
    .line 6
    iput-object p2, p0, Ll/uyv0;->b:Ll/s70;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uyv0;->a:Lcom/google/android/gms/ads/BaseAdView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uyv0;->b:Ll/s70;

    .line 4
    .line 5
    :try_start_0
    iget-object v1, v0, Lcom/google/android/gms/ads/BaseAdView;->a:Ll/o2v0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/s70;->a:Ll/xxu0;

    .line 8
    .line 9
    invoke-virtual {v1, p0}, Ll/o2v0;->p(Ll/xxu0;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Ll/w2t0;->c(Landroid/content/Context;)Ll/y2t0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "BaseAdView.loadAd"

    .line 23
    .line 24
    invoke-interface {v0, p0, v1}, Ll/y2t0;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
