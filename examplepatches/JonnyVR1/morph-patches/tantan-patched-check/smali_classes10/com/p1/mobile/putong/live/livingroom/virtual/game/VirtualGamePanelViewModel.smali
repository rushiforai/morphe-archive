.class public Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lv/VLinear;",
        "Ll/iam<",
        "Ll/k0m0;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

.field public e:Ll/k0m0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public P(Ll/k0m0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;->e:Ll/k0m0;

    .line 2
    .line 3
    return-void
.end method

.method public Q()V
    .locals 3

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x43af8000    # 351.0f

    .line 6
    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int/2addr v0, v1

    .line 13
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 14
    .line 15
    sget v2, Ll/bnl0;->e:I

    .line 16
    .line 17
    invoke-direct {v1, v2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;->c:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/k0m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;->P(Ll/k0m0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->W1:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;->c:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->V3:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 23
    .line 24
    return-void
.end method

.method public setSwallowTarget(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;->c:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 10
    .line 11
    iget-object v1, v1, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 19
    .line 20
    iget-object p1, p1, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;->setSwallowTarget(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
