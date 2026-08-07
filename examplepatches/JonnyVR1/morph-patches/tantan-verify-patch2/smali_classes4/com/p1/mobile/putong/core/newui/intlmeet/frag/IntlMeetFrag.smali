.class public Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Ll/lfo;",
        "Ll/rfo;",
        ">;"
    }
.end annotation


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


# virtual methods
.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;->O4()Ll/lfo;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;->P4()Ll/rfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public O4()Ll/lfo;
    .locals 1

    .line 1
    new-instance v0, Ll/lfo;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lfo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public P4()Ll/rfo;
    .locals 1

    .line 1
    new-instance v0, Ll/rfo;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rfo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;)V

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
    invoke-static {}, Ll/joa;->D3()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "is_privileged"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rfo;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/rfo;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 2
    .line 3
    check-cast v0, Ll/lfo;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ll/lfo;->m0(IILandroid/content/Intent;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    check-cast v0, Ll/rfo;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rfo;->D1()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    check-cast v0, Ll/rfo;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/rfo;->x1()V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 20
    .line 21
    check-cast p0, Ll/lfo;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/lfo;->n0(Z)V

    .line 24
    .line 25
    .line 26
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
