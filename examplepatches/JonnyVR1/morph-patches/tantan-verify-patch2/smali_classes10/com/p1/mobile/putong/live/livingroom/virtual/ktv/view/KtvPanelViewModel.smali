.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lv/VLinear;",
        "Ll/iam<",
        "Ll/a5r;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;


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

.method public P(Ll/a5r;)V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/a5r;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;->P(Ll/a5r;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/yec0;->p9:I

    .line 2
    .line 3
    invoke-virtual {p1, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->X2:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 23
    .line 24
    return-void
.end method

.method public setMemberSwallow(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 12
    .line 13
    iget-object p1, p1, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;->setSwallowTarget(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
