.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/q4j0;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

.field public e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;

.field public i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopSVGAEffectView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;

.field public k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/LiveIntlStarLeaderBoardEffectView;

.field public l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceSpecialAuctionEffectView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;

.field public n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public o:Ll/q4j0;

.field public p:Landroid/widget/FrameLayout$LayoutParams;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;)Ll/q4j0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->o:Ll/q4j0;

    return-object p0
.end method


# virtual methods
.method public B0(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;Ll/x20;)V
    .locals 4

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->superGrade:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->i(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->i(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public D0(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public E0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->o:Ll/q4j0;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->n(Ll/q4j0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public G0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->d()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->e()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->e()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/r4j0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/q4j0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->j0(Ll/q4j0;)V

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

.method public j0(Ll/q4j0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->o:Ll/q4j0;

    .line 2
    .line 3
    return-void
.end method

.method public k0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/LiveIntlStarLeaderBoardEffectView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/LiveIntlStarLeaderBoardEffectView;->l()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public l0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->g()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public n0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public o0(Ll/rdh0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->o:Ll/q4j0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Ll/rdh0;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->isCacheable(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p1, p1, Ll/rdh0;->b:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer$b;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p0(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->l(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q0(Ll/z3j0;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/LiveIntlStarLeaderBoardEffectView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->o:Ll/q4j0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/LiveIntlStarLeaderBoardEffectView;->u(Lcom/p1/mobile/android/app/Act;Ll/z3j0;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public r0(Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->o:Ll/q4j0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public s0(Ll/rdh0;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->o:Ll/q4j0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->i(Lcom/p1/mobile/android/app/Act;Ll/rdh0;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public t0(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->o:Ll/q4j0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public u0(Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$GiftWallGradeFiveNotice;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopSVGAEffectView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->o:Ll/q4j0;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopSVGAEffectView;->f(Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$GiftWallGradeFiveNotice;Ll/q4j0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public v0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopSVGAEffectView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopSVGAEffectView;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w0(Ll/ivf0;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceSpecialAuctionEffectView;

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceSpecialAuctionEffectView;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceSpecialAuctionEffectView;->u0(Ll/ivf0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public y0(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->m(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z0(Ll/rdh0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->o:Ll/q4j0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Ll/rdh0;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p1, p1, Ll/rdh0;->b:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer$a;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopSVGAEffectView;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopSVGAEffectView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
