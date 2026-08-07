.class public Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lv/VFrame;",
        "Ll/iam<",
        "Ll/ef50;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

.field public B:Lv/VFrame;

.field public C:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

.field public D:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

.field public E:Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;

.field public F:Landroid/widget/FrameLayout;

.field public G:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

.field public H:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

.field public I:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

.field public J:Landroid/view/View;

.field public K:Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

.field public L:Lv/VRelative;

.field public M:Lv/VImage;

.field public N:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

.field public O:Lv/VFrame;

.field public P:Lv/VRelative;

.field public Q:Ll/ef50;

.field public R:Z

.field public a:Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;

.field public h:Lv/VFrame;

.field public i:Lv/VRelative;

.field public j:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpToRoomView;

.field public k:Lv/VText;

.field public l:Lv/VFrame;

.field public m:Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

.field public p:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public r:Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

.field public s:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

.field public t:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public u:Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

.field public v:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public w:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;

.field public x:Lv/VFrame;

.field public y:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

.field public z:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->R:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->R:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->R:Z

    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->Q:Ll/ef50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ef50;->Z3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->z(Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->L:Lv/VRelative;

    .line 2
    .line 3
    new-instance v1, Ll/dg50;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/dg50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->P:Lv/VRelative;

    .line 12
    .line 13
    new-instance v1, Ll/eg50;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/eg50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->B(Landroid/view/View;)V

    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->Q:Ll/ef50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ef50;->Z3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->M:Lv/VImage;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->i:Lv/VRelative;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->x:Lv/VFrame;

    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->B:Lv/VFrame;

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

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
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->C(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->R:Z

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
    invoke-super {p0, p1}, Lv/VFrame;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->D:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

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

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ef50;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->v(Ll/ef50;)V

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
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setSwallowAllTouchEvent(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->R:Z

    .line 2
    .line 3
    return-void
.end method

.method public final u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fg50;->a(Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v(Ll/ef50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->Q:Ll/ef50;

    .line 2
    .line 3
    return-void
.end method

.method public w(Ll/rgd0;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->q:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->n:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->t:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->v:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
