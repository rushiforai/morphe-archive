.class public Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/i6t;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Landroid/view/View;

.field public B:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public C:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

.field public D:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;

.field public E:Landroid/view/View;

.field public E0:Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

.field public F:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public F0:Landroid/view/View;

.field public G:Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

.field public H:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public I:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

.field public J:Landroid/view/ViewStub;

.field public K:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public L:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;

.field public M:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

.field public N:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

.field public O:Landroid/view/ViewStub;

.field public P:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

.field public Q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

.field public R:Lcom/p1/mobile/putong/live/livingroom/virtual/settle/VoiceVirtualSettleSuccessView;

.field public S:Landroid/widget/FrameLayout;

.field public T:Ll/ukp0;

.field public U:Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VirtualNewPreviewView;

.field public V:Z

.field public W:Lcom/p1/mobile/putong/live/livingroom/voice/bubble/VoiceLiveBubbleView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/virtual/room/close/VirtualVoiceCloseView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

.field public k:Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;

.field public k0:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

.field public l:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

.field public m:Landroid/widget/FrameLayout;

.field public n:Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

.field public p:Lv/VFrame;

.field public p0:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

.field public q:Lv/VImage;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Lv/VLinear;

.field public u:Lv/VDraweeView;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

.field public y:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

.field public z:Lcom/p1/mobile/putong/live/livingroom/virtual/room/LiveVirtualCallListBottomView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->V:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->V:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->V:Z

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->V:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->T:Ll/ukp0;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/ukp0;->d(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public getGiftWidthObs()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->L:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->K(Landroid/view/View;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ckp0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Ll/i6t;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ukp0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ukp0;-><init>(Ll/i6t;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->T:Ll/ukp0;

    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/i6t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->i0(Ll/i6t;)V

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

.method public j0(Ll/rgd0;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->K:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->h:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->F:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public k0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->O:Landroid/view/ViewStub;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/mdc0;->u3:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/bubble/VoiceLiveBubbleView;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->W:Lcom/p1/mobile/putong/live/livingroom/voice/bubble/VoiceLiveBubbleView;

    .line 16
    .line 17
    sget v1, Ll/mdc0;->N5:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->F0:Landroid/view/View;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->J:Landroid/view/ViewStub;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Ll/mdc0;->h2:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->k0:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    sget v1, Ll/mdc0;->X6:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->p0:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 54
    .line 55
    sget v1, Ll/mdc0;->L1:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->E0:Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

    .line 64
    .line 65
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->j:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 13
    .line 14
    sget v1, Ll/mdc0;->H4:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VirtualNewPreviewView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->U:Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VirtualNewPreviewView;

    .line 23
    .line 24
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->T:Ll/ukp0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ukp0;->e(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public setSwallowAllTouchEvent(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->V:Z

    .line 2
    .line 3
    return-void
.end method
