.class public Ll/ead0;
.super Ll/d9d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d9d0<",
        "Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;ILjava/lang/String;ZLl/j9d0;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/d9d0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;ILjava/lang/String;ZLl/j9d0;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->ENTER_ROOM_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 5
    .line 6
    iput-object p1, p0, Ll/d9d0;->j:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput p1, p0, Ll/e9d0;->c:I

    .line 10
    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    if-ne p2, p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    :cond_1
    :goto_0
    iput-boolean p1, p0, Ll/e9d0;->a:Z

    .line 18
    .line 19
    return-void
.end method

.method private V()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/d9d0;->f:I

    .line 2
    .line 3
    rem-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method private W()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/d9d0;->f:I

    .line 2
    .line 3
    rem-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method


# virtual methods
.method public O()I
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ead0;->V()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x41200000    # 10.0f

    .line 8
    .line 9
    :goto_0
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/high16 p0, 0x40a00000    # 5.0f

    .line 15
    .line 16
    goto :goto_0
.end method

.method public P()I
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ead0;->W()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x41200000    # 10.0f

    .line 8
    .line 9
    :goto_0
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/high16 p0, 0x40a00000    # 5.0f

    .line 15
    .line 16
    goto :goto_0
.end method

.method public R()I
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/e9d0;->a:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/high16 p0, 0x41400000    # 12.0f

    .line 6
    .line 7
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public X(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/d9d0;->i:Ll/j9d0;

    .line 5
    .line 6
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;->e(Ll/d9d0;Ll/j9d0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Y(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;Ljava/util/List;)V
    .locals 1
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/d3q;->v(Landroid/view/View;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/ead0;->X(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/4 p2, 0x1

    .line 26
    if-ne p0, p2, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;->d()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const/4 p2, 0x2

    .line 33
    if-ne p0, p2, :cond_2

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;->c()V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->h1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ead0;->X(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic v(Landroid/view/View;Ljava/util/List;)V
    .locals 0
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ead0;->Y(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEnterRoomEffectView;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
