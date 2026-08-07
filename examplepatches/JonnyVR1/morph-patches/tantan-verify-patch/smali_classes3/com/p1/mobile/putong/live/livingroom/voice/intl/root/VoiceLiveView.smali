.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/b4o0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Landroid/view/View;

.field public B:Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;

.field public C:Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceGrabHatFloatViewMode;

.field public D:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;

.field public E:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

.field public F:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

.field public G:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

.field public H:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

.field public I:Landroid/widget/FrameLayout;

.field public J:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

.field public K:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

.field public L:Lv/VFrame;

.field public M:Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

.field public N:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

.field public O:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

.field public P:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

.field public Q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

.field public R:Lv/VFrame;

.field public S:Lcom/p1/mobile/putong/live/livingroom/voice/bubble/VoiceLiveBubbleView;

.field public T:Landroid/view/View;

.field public U:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;

.field public V:Landroid/widget/FrameLayout;

.field public W:Ll/b4o0;

.field public d:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;

.field public i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roominfobar/VoiceRoomInfoView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

.field public k:Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationView;

.field public l:Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

.field public m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/gameRoot/VoiceNewGamePlayRootView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;

.field public o:Landroidx/recyclerview/widget/RecyclerView;

.field public p:Landroid/widget/FrameLayout;

.field public q:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public r:Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;

.field public s:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

.field public t:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;

.field public u:Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;

.field public v:Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceTopNoticeView;

.field public w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/VoiceChatGroupEnterView;

.field public x:Landroid/view/View;

.field public y:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

.field public z:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private r()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->j0()V

    .line 2
    .line 3
    .line 4
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

.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/m5o0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Ll/b4o0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->W:Ll/b4o0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b4o0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->i0(Ll/b4o0;)V

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

.method public final j0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->G:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 10
    .line 11
    const/high16 v1, 0x41600000    # 14.0f

    .line 12
    .line 13
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    neg-int v1, v1

    .line 18
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->G:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public k0(Lcom/p1/mobile/android/app/Frag;)V
    .locals 0

    .line 1
    return-void
.end method

.method public l0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->R:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;

    .line 8
    .line 9
    invoke-static {}, Ll/bnl0;->F0()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sget v2, Ll/qa00;->k:I

    .line 14
    .line 15
    add-int/2addr v1, v2

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->r()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
