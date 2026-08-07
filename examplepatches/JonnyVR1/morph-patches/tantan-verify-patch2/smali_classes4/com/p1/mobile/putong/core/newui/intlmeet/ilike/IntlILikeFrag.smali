.class public Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Ll/arn;",
        "Ll/grn;",
        ">;"
    }
.end annotation


# instance fields
.field public B:Ll/vqn;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->S4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic S4(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Ll/grn;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/grn;->j()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 30
    .line 31
    check-cast p0, Ll/arn;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-virtual {p0, p1}, Ll/arn;->b1(Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->Q4()Ll/arn;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic N4()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->R4()Ll/grn;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public P4()Ll/vqn;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->B:Ll/vqn;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/vqn;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 8
    .line 9
    check-cast v1, Ll/arn;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/vqn;-><init>(Ll/arn;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->B:Ll/vqn;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->B:Ll/vqn;

    .line 17
    .line 18
    return-object p0
.end method

.method public Q4()Ll/arn;
    .locals 1

    .line 1
    new-instance v0, Ll/arn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/arn;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public R4()Ll/grn;
    .locals 1

    .line 1
    new-instance v0, Ll/grn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/grn;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;->d4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 5
    .line 6
    invoke-static {}, Ll/joa;->f4()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    xor-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "is_privileged"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    filled-new-array {v0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/wqn;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/wqn;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/grn;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/grn;->c()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 5
    .line 6
    check-cast p0, Ll/arn;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Ll/an2;->I0(IILandroid/content/Intent;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    check-cast p0, Ll/arn;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/an2;->N0()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_meet_view"

    .line 2
    .line 3
    return-object p0
.end method
