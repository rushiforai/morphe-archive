.class public Ll/ycd0;
.super Ll/e9d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/e9d0<",
        "Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public f:Ll/j9d0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ll/j9d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/e9d0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ycd0;->e:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ycd0;->f:Ll/j9d0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ycd0;->e:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->ENTER_ROOM_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

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

.method public I(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ycd0;->f:Ll/j9d0;

    .line 5
    .line 6
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;->j0(Ll/ycd0;Ll/j9d0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;Ljava/util/List;)V
    .locals 1
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/ycd0;->I(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/4 p2, 0x3

    .line 23
    if-ne p0, p2, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;->k0()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public isChecked()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ycd0;->H()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/mbs;->w()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    xor-int/lit8 p0, p0, 0x1

    .line 20
    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->t1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ycd0;->I(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;)V

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
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ycd0;->J(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
