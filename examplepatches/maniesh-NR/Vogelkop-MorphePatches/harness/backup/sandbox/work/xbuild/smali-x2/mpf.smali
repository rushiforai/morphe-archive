.class public final Lmpf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/ads/mediation/MediationAppOpenAd;


# instance fields
.field public final a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

.field public final b:Lqhf;

.field public c:Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;

.field public d:Lvt1;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;Lqhf;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmpf;->a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    iput-object p2, p0, Lmpf;->b:Lqhf;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lmpf;->b:Lqhf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lqhf;->a()V

    return-void
.end method

.method public final showAd(Landroid/content/Context;)V
    .registers 4

    iget-object v0, p0, Lmpf;->d:Lvt1;

    if-nez v0, :cond_19

    const-string p1, "showAd: no ad loaded"

    invoke-virtual {p0, p1}, Lmpf;->a(Ljava/lang/String;)V

    const/16 p1, 0x67

    const-string v0, "The AppOpen ad is invalid to show."

    invoke-static {p1, v0}, Lrm5;->o(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object p0, p0, Lmpf;->c:Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;

    if-eqz p0, :cond_18

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;->onAdFailedToShow(Lcom/google/android/gms/ads/AdError;)V

    :cond_18
    return-void

    :cond_19
    new-instance v1, Lwub;

    invoke-direct {v1, p0}, Lwub;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p1, v1}, Lk8;->K(Landroid/content/Context;Lvm;)V

    return-void
.end method
