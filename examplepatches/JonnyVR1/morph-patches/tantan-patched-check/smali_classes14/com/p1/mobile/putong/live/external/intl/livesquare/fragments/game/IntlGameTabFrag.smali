.class public Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/sjn;

.field public z:Ll/rjn;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public S4(ZIJ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->S4(ZIJ)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;->z:Ll/rjn;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/rjn;->v2()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public d4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/rjn;

    .line 5
    .line 6
    new-instance v1, Ll/nus;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Z4()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {v1, v2, p0}, Ll/nus;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {v0, p0, v1}, Ll/rjn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;Ll/nus;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;->z:Ll/rjn;

    .line 19
    .line 20
    new-instance v0, Ll/sjn;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/sjn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;->A:Ll/sjn;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;->z:Ll/rjn;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/cyr;->C(Ll/iam;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;->A:Ll/sjn;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/sjn;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_entertaiment_tab_game"

    .line 2
    .line 3
    return-object p0
.end method
