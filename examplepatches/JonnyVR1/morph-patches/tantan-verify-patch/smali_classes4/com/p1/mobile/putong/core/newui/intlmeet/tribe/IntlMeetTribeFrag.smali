.class public Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Ll/ojo;",
        "Ll/qjo;",
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

.method public static synthetic O4(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;->R4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic R4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;->P4()Ll/ojo;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;->Q4()Ll/qjo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public P4()Ll/ojo;
    .locals 1

    .line 1
    new-instance v0, Ll/ojo;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ojo;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public Q4()Ll/qjo;
    .locals 1

    .line 1
    new-instance v0, Ll/qjo;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qjo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public S4(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 2
    .line 3
    check-cast p0, Ll/ojo;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/ojo;->I0(IILandroid/content/Intent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
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
    new-instance v1, Ll/ajo;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/ajo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/qjo;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/qjo;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 5
    .line 6
    check-cast p0, Ll/ojo;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/ojo;->J0(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_tribe_view"

    .line 2
    .line 3
    return-object p0
.end method
