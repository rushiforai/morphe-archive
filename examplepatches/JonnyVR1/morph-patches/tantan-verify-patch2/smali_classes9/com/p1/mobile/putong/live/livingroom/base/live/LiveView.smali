.class public Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lv/VFrame;",
        "Ll/iam<",
        "Ll/xct;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

.field public B:Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

.field public C:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

.field public D:Landroid/widget/FrameLayout;

.field public E:Lv/VFrame;

.field public F:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

.field public G:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

.field public H:Lv/VRelative;

.field public I:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

.field public J:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

.field public K:Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;

.field public L:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

.field public M:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

.field public N:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

.field public O:Landroid/widget/FrameLayout;

.field public P:Lv/VRelative;

.field public Q:Lv/VImage;

.field public R:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerDragMask;

.field public S:Landroid/view/View;

.field public T:Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

.field public U:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

.field public V:Lv/VFrame;

.field public W:Ll/xct;

.field public a:Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

.field public f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

.field public i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

.field public j:Lv/VFrame;

.field public k:Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

.field public l:Landroid/view/View;

.field public m:Lv/VRelative;

.field public n:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/annoncements/view/LiveAnnouncementEntryView;

.field public o:Lv/VFrame;

.field public p:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

.field public r:Landroid/widget/FrameLayout;

.field public s:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

.field public t:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

.field public u:Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

.field public v:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

.field public w:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

.field public x:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

.field public y:Landroid/view/View;

.field public z:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->v(Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->b:Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 7
    .line 8
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 12
    .line 13
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 17
    .line 18
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 22
    .line 23
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->P:Lv/VRelative;

    .line 27
    .line 28
    new-instance v1, Ll/jyu;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/jyu;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->W:Ll/xct;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xct;->X3()V

    .line 4
    .line 5
    .line 6
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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->J:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

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
    check-cast p1, Ll/xct;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->u(Ll/xct;)V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->s(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kyu;->a(Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(Ll/xct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->W:Ll/xct;

    .line 2
    .line 3
    return-void
.end method
