.class public final Lopf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/ads/mediation/MediationInterstitialAd;


# instance fields
.field public final a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

.field public final b:Lqhf;

.field public c:Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;

.field public d:Ldhb;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;Lqhf;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lopf;->a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    iput-object p2, p0, Lopf;->b:Lqhf;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lopf;->b:Lqhf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lqhf;->a()V

    return-void
.end method

.method public final showAd(Landroid/content/Context;)V
    .registers 5

    const-string v0, "showAd"

    invoke-virtual {p0, v0}, Lopf;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lopf;->d:Ldhb;

    if-nez v0, :cond_1e

    const-string p1, "showAd: no ad loaded"

    invoke-virtual {p0, p1}, Lopf;->a(Ljava/lang/String;)V

    const/16 p1, 0x67

    const-string v0, "The interstitial ad is invalid to show."

    invoke-static {p1, v0}, Lrm5;->o(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object p0, p0, Lopf;->c:Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;

    if-eqz p0, :cond_1d

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;->onAdFailedToShow(Lcom/google/android/gms/ads/AdError;)V

    :cond_1d
    return-void

    :cond_1e
    new-instance v1, Llld;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Llld;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1, v1}, Lk8;->K(Landroid/content/Context;Lvm;)V

    return-void
.end method
