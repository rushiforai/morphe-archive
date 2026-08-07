.class public Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lv/VFrame;",
        "Ll/iam<",
        "Ll/x5;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public B:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

.field public C:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

.field public D:Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

.field public E:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public E0:Landroid/widget/FrameLayout;

.field public F:Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

.field public F0:Lv/VRelative;

.field public G:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

.field public G0:Lv/VImage;

.field public H:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

.field public H0:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

.field public I:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public I0:Lv/VFrame;

.field public J:Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

.field public J0:Lv/VRelative;

.field public K:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

.field public K0:Ll/x5;

.field public L:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

.field public L0:Z

.field public M:Lv/VFrame;

.field public N:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

.field public O:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

.field public P:Lv/VRelative;

.field public Q:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

.field public R:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

.field public S:Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;

.field public T:Landroid/widget/FrameLayout;

.field public U:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

.field public V:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

.field public W:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

.field public a:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

.field public e:Landroid/view/View;

.field public f:Lcom/p1/mobile/putong/live/livingroom/base/player/LiveRtcPlayErrorView;

.field public g:Lv/VFrame;

.field public h:Lv/VRelative;

.field public i:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpToRoomView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

.field public k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

.field public k0:Landroid/view/View;

.field public l:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

.field public n:Lv/VText;

.field public o:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

.field public p:Lv/VFrame;

.field public p0:Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

.field public r:Lv/VRelative;

.field public s:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/annoncements/view/LiveAnnouncementEntryView;

.field public t:Lv/VFrame;

.field public u:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;

.field public v:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

.field public w:Landroid/widget/FrameLayout;

.field public x:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

.field public y:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

.field public z:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;


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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->L0:Z

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->L0:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->L0:Z

    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->K0:Ll/x5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/x5;->Z3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->z(Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->c:Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 7
    .line 8
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 12
    .line 13
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->l:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 17
    .line 18
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->m:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 22
    .line 23
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->o:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 27
    .line 28
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->F0:Lv/VRelative;

    .line 32
    .line 33
    new-instance v1, Ll/fmd0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/fmd0;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->J0:Lv/VRelative;

    .line 42
    .line 43
    new-instance v1, Ll/gmd0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/gmd0;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->h:Lv/VRelative;

    .line 52
    .line 53
    invoke-static {}, Ll/bnl0;->F0()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    sget v1, Ll/qa00;->c:I

    .line 58
    .line 59
    add-int/2addr v0, v1

    .line 60
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->B(Landroid/view/View;)V

    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->K0:Ll/x5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/x5;->Z3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->G0:Lv/VImage;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->h:Lv/VRelative;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->M:Lv/VFrame;

    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->P:Lv/VRelative;

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
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->C(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->L0:Z

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->R:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

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
    check-cast p1, Ll/x5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->v(Ll/x5;)V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setSwallowAllTouchEvent(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->L0:Z

    .line 2
    .line 3
    return-void
.end method

.method public final u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/imd0;->a(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v(Ll/x5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->K0:Ll/x5;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->E:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->A:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->I:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->l:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
