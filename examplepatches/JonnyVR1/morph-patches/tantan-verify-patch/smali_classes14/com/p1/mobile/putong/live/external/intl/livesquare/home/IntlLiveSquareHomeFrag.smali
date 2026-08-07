.class public Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;
.super Lcom/p1/mobile/putong/live/external/square/home/LiveSquareHomeFrag;
.source "SourceFile"

# interfaces
.implements Ll/egj0;


# instance fields
.field public A:Ll/d6o;

.field public final B:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

.field public C:Z

.field public z:Ll/e6o;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/square/home/LiveSquareHomeFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->B:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->C:Z

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic O4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->destroy()V

    return-void
.end method

.method public static synthetic Q4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method private destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->A:Ll/d6o;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w2u;->Q2()V

    .line 4
    .line 5
    .line 6
    const-string p0, "context_square"

    .line 7
    .line 8
    invoke-static {p0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public M4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->A:Ll/d6o;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/d6o;->U2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public N4()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->B:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    return-object p0
.end method

.method public d4()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/d6o;

    .line 5
    .line 6
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    new-instance v2, Ll/y5o;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/y5o;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/nus;

    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->B:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 22
    .line 23
    invoke-direct {v2, v3, p0}, Ll/nus;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {v0, p0, v1, v2}, Ll/d6o;-><init>(Ll/ner;Lrx/c;Ll/nus;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->A:Ll/d6o;

    .line 30
    .line 31
    new-instance v0, Ll/e6o;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/e6o;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->z:Ll/e6o;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->A:Ll/d6o;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/z5o;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/z5o;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/a6o;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/a6o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->z:Ll/e6o;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1, v0}, Ll/e6o;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->A:Ll/d6o;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->z:Ll/e6o;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {p1, v0, v1}, Ll/b6o;->a(Ll/w2u;Ll/e6o;Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->A:Ll/d6o;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/w2u;->S2()V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->A:Ll/d6o;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/w2u;->R2()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->onHiddenChanged(Z)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->z:Ll/e6o;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/e6o;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    invoke-static {p0}, Ll/t4u;->m(Z)V

    .line 8
    .line 9
    .line 10
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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->A:Ll/d6o;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/d6o;->V2(Z)V

    .line 7
    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->C:Z

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/tbs;->p()V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->C:Z

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_recommend"

    .line 2
    .line 3
    return-object p0
.end method

.method public v()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/IntlLiveSquareHomeFrag;->M4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
