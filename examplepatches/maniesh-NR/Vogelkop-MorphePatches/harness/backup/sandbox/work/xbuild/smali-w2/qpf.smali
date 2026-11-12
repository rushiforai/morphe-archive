.class public final Lqpf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/ads/mediation/MediationRewardedAd;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

.field public final c:Lqhf;

.field public d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

.field public e:Lm4b;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;Lqhf;B)V
    .registers 4

    iput-byte p3, p0, Lqpf;->a:B

    iput-object p1, p0, Lqpf;->b:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    iput-object p2, p0, Lqpf;->c:Lqhf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lqpf;->c:Lqhf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lqhf;->a()V

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lqpf;->c:Lqhf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lqhf;->a()V

    return-void
.end method

.method public final showAd(Landroid/content/Context;)V
    .registers 6

    iget-byte v0, p0, Lqpf;->a:B

    const/16 v1, 0x67

    const-string v2, "showAd: no ad loaded"

    const-string v3, "showAd"

    packed-switch v0, :pswitch_data_54

    invoke-virtual {p0, v3}, Lqpf;->b(Ljava/lang/String;)V

    iget-object v0, p0, Lqpf;->e:Lm4b;

    check-cast v0, Ll2i;

    if-nez v0, :cond_25

    invoke-virtual {p0, v2}, Lqpf;->b(Ljava/lang/String;)V

    const-string p1, "The rewarded interstitial ad is invalid to show."

    invoke-static {v1, p1}, Lrm5;->o(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object p0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz p0, :cond_2e

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;->onAdFailedToShow(Lcom/google/android/gms/ads/AdError;)V

    goto :goto_2e

    :cond_25
    new-instance v1, Ltnf;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ltnf;-><init>(Lcom/google/android/gms/ads/mediation/MediationRewardedAd;B)V

    invoke-virtual {v0, p1, v1}, Lk8;->K(Landroid/content/Context;Lvm;)V

    :cond_2e
    :goto_2e
    return-void

    :pswitch_2f
    invoke-virtual {p0, v3}, Lqpf;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lqpf;->e:Lm4b;

    check-cast v0, Li2i;

    if-nez v0, :cond_49

    invoke-virtual {p0, v2}, Lqpf;->a(Ljava/lang/String;)V

    const-string p1, "The rewarded ad is invalid to show."

    invoke-static {v1, p1}, Lrm5;->o(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object p0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz p0, :cond_52

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;->onAdFailedToShow(Lcom/google/android/gms/ads/AdError;)V

    goto :goto_52

    :cond_49
    new-instance v1, Ltnf;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Ltnf;-><init>(Lcom/google/android/gms/ads/mediation/MediationRewardedAd;B)V

    invoke-virtual {v0, p1, v1}, Lk8;->K(Landroid/content/Context;Lvm;)V

    :cond_52
    :goto_52
    return-void

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_2f
    .end packed-switch
.end method
