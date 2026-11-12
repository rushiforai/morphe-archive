.class public final Ltnf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvm;
.implements Lidf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/google/android/gms/ads/mediation/MediationRewardedAd;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/ads/mediation/MediationRewardedAd;B)V
    .registers 3

    iput-byte p2, p0, Ltnf;->a:B

    iput-object p1, p0, Ltnf;->b:Lcom/google/android/gms/ads/mediation/MediationRewardedAd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final C(Lcm;)V
    .registers 5

    iget-byte v0, p0, Ltnf;->a:B

    const/4 v1, 0x0

    const-string v2, "showAd: onAdFailedToShow, error="

    iget-object p0, p0, Ltnf;->b:Lcom/google/android/gms/ads/mediation/MediationRewardedAd;

    packed-switch v0, :pswitch_data_66

    check-cast p0, Lqpf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lqpf;->b(Ljava/lang/String;)V

    iget-object v0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz v0, :cond_2c

    iget v0, p1, Lcm;->b:I

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object v0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    invoke-interface {v0, p1}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;->onAdFailedToShow(Lcom/google/android/gms/ads/AdError;)V

    :cond_2c
    iget-object p1, p0, Lqpf;->e:Lm4b;

    check-cast p1, Ll2i;

    if-eqz p1, :cond_37

    invoke-virtual {p1}, Lk8;->P()V

    iput-object v1, p0, Lqpf;->e:Lm4b;

    :cond_37
    return-void

    :pswitch_38
    check-cast p0, Lqpf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lqpf;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz v0, :cond_5a

    iget v0, p1, Lcm;->b:I

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object v0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    invoke-interface {v0, p1}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;->onAdFailedToShow(Lcom/google/android/gms/ads/AdError;)V

    :cond_5a
    iget-object p1, p0, Lqpf;->e:Lm4b;

    check-cast p1, Li2i;

    if-eqz p1, :cond_65

    invoke-virtual {p1}, Lk8;->P()V

    iput-object v1, p0, Lqpf;->e:Lm4b;

    :cond_65
    return-void

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_38
    .end packed-switch
.end method

.method public final a(La36;)V
    .registers 3

    iget-byte p1, p0, Ltnf;->a:B

    const-string v0, "showAd: onUserRewarded"

    iget-object p0, p0, Ltnf;->b:Lcom/google/android/gms/ads/mediation/MediationRewardedAd;

    packed-switch p1, :pswitch_data_24

    check-cast p0, Lqpf;

    invoke-virtual {p0, v0}, Lqpf;->b(Ljava/lang/String;)V

    iget-object p0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz p0, :cond_15

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;->onUserEarnedReward()V

    :cond_15
    return-void

    :pswitch_16
    check-cast p0, Lqpf;

    invoke-virtual {p0, v0}, Lqpf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz p0, :cond_22

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;->onUserEarnedReward()V

    :cond_22
    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final g()V
    .registers 3

    iget-byte v0, p0, Ltnf;->a:B

    const-string v1, "showAd: onAdDisplayed"

    iget-object p0, p0, Ltnf;->b:Lcom/google/android/gms/ads/mediation/MediationRewardedAd;

    packed-switch v0, :pswitch_data_24

    check-cast p0, Lqpf;

    invoke-virtual {p0, v1}, Lqpf;->b(Ljava/lang/String;)V

    iget-object p0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz p0, :cond_15

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdImpression()V

    :cond_15
    return-void

    :pswitch_16
    check-cast p0, Lqpf;

    invoke-virtual {p0, v1}, Lqpf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz p0, :cond_22

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdImpression()V

    :cond_22
    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final onAdClicked()V
    .registers 3

    iget-byte v0, p0, Ltnf;->a:B

    const-string v1, "showAd: onAdClicked"

    iget-object p0, p0, Ltnf;->b:Lcom/google/android/gms/ads/mediation/MediationRewardedAd;

    packed-switch v0, :pswitch_data_24

    check-cast p0, Lqpf;

    invoke-virtual {p0, v1}, Lqpf;->b(Ljava/lang/String;)V

    iget-object p0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz p0, :cond_15

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdClicked()V

    :cond_15
    return-void

    :pswitch_16
    check-cast p0, Lqpf;

    invoke-virtual {p0, v1}, Lqpf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz p0, :cond_22

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdClicked()V

    :cond_22
    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final onAdDismissed()V
    .registers 4

    iget-byte v0, p0, Ltnf;->a:B

    const/4 v1, 0x0

    const-string v2, "showAd: onAdDismissed"

    iget-object p0, p0, Ltnf;->b:Lcom/google/android/gms/ads/mediation/MediationRewardedAd;

    packed-switch v0, :pswitch_data_3a

    check-cast p0, Lqpf;

    invoke-virtual {p0, v2}, Lqpf;->b(Ljava/lang/String;)V

    iget-object v0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz v0, :cond_16

    invoke-interface {v0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->onAdClosed()V

    :cond_16
    iget-object v0, p0, Lqpf;->e:Lm4b;

    check-cast v0, Ll2i;

    if-eqz v0, :cond_21

    invoke-virtual {v0}, Lk8;->P()V

    iput-object v1, p0, Lqpf;->e:Lm4b;

    :cond_21
    return-void

    :pswitch_22
    check-cast p0, Lqpf;

    invoke-virtual {p0, v2}, Lqpf;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz v0, :cond_2e

    invoke-interface {v0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->onAdClosed()V

    :cond_2e
    iget-object v0, p0, Lqpf;->e:Lm4b;

    check-cast v0, Li2i;

    if-eqz v0, :cond_39

    invoke-virtual {v0}, Lk8;->P()V

    iput-object v1, p0, Lqpf;->e:Lm4b;

    :cond_39
    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method

.method public final onAdOpened()V
    .registers 3

    iget-byte v0, p0, Ltnf;->a:B

    const-string v1, "showAd: onAdOpened"

    iget-object p0, p0, Ltnf;->b:Lcom/google/android/gms/ads/mediation/MediationRewardedAd;

    packed-switch v0, :pswitch_data_24

    check-cast p0, Lqpf;

    invoke-virtual {p0, v1}, Lqpf;->b(Ljava/lang/String;)V

    iget-object p0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz p0, :cond_15

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->onAdOpened()V

    :cond_15
    return-void

    :pswitch_16
    check-cast p0, Lqpf;

    invoke-virtual {p0, v1}, Lqpf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    if-eqz p0, :cond_22

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->onAdOpened()V

    :cond_22
    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
