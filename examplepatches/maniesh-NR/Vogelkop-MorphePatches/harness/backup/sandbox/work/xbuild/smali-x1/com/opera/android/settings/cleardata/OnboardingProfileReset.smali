.class public final Lcom/opera/android/settings/cleardata/OnboardingProfileReset;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;
    }
.end annotation


# direct methods
.method public static onCompleted(Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;Z)V
    .registers 6
    .param p0    # Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-wide v0, p0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->e:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_9

    return-void

    :cond_9
    iput-wide v2, p0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->e:J

    iget-object v0, p0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->c:Loml;

    const/4 v1, 0x0

    if-eqz v0, :cond_16

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Loml;->cancel(Z)Z

    iput-object v1, p0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->c:Loml;

    :cond_16
    iget-object v0, p0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->a:Lumi;

    new-instance v2, Lgh2;

    const/4 v3, 0x7

    invoke-direct {v2, v3, p0, p1}, Lgh2;-><init>(BLjava/lang/Object;Z)V

    invoke-interface {v0, v2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
