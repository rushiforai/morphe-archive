.class public Ll/m6t;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/xct;Ll/fw40;Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/dum;->j:Ll/x6t;

    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 2
    new-instance v0, Ll/bft;

    invoke-direct {v0, p1}, Ll/bft;-><init>(Ll/dum;)V

    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 3
    new-instance v0, Ll/cpb0;

    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->b:Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;

    invoke-direct {v0, p1, v1}, Ll/cpb0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;)V

    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 4
    new-instance v0, Ll/yyr;

    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->a:Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Ll/yyr;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;Landroid/view/View;)V

    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 5
    new-instance v0, Ll/us80;

    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->c:Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    iget-object v3, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->P:Lv/VRelative;

    invoke-direct {v0, p1, p3, v1, v3}, Ll/us80;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;Lv/VRelative;)V

    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 6
    new-instance p3, Ll/tm1;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->k:Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

    invoke-direct {p3, p1, v0}, Ll/tm1;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 7
    new-instance p3, Ll/ehg;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->u:Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    invoke-direct {p3, p1, v0}, Ll/ehg;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 8
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    move-result-object p3

    invoke-virtual {p3}, Ll/vwt;->b7()Z

    move-result p3

    if-eqz p3, :cond_0

    .line 9
    new-instance p3, Ll/wmy;

    invoke-direct {p3, p1}, Ll/wmy;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    goto :goto_0

    .line 10
    :cond_0
    new-instance p3, Ll/vmy;

    invoke-direct {p3, p1}, Ll/vmy;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 11
    :goto_0
    new-instance p3, Ll/o4s;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->B:Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->I:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    invoke-direct {p3, p1, v0, v1}, Ll/o4s;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    new-instance p3, Ll/u3c;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->A:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    invoke-direct {p3, p1, v0}, Ll/u3c;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 13
    new-instance p3, Ll/gc3;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->I:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;

    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->J:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    invoke-direct {p3, p1, v0, v1}, Ll/gc3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 14
    new-instance p3, Ll/wak0;

    invoke-direct {p3, p1, v2}, Ll/wak0;-><init>(Ll/dum;Landroid/view/View;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 15
    new-instance p3, Ll/vuw;

    invoke-direct {p3, p1}, Ll/vuw;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 16
    new-instance p3, Ll/yuk;

    invoke-direct {p3, p1}, Ll/yuk;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 17
    new-instance p3, Ll/ezj;

    invoke-direct {p3, p1}, Ll/ezj;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 18
    new-instance p3, Ll/xij0;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->L:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    invoke-direct {p3, p1, v0}, Ll/xij0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 19
    new-instance p3, Ll/hcs;

    invoke-direct {p3, p1}, Ll/hcs;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 20
    new-instance p3, Ll/uel0;

    invoke-direct {p3, p1}, Ll/uel0;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 21
    sget-object p3, Ll/zrv;->a:Ll/wrv;

    invoke-virtual {p3}, Ll/wrv;->H()Z

    move-result p3

    if-eqz p3, :cond_1

    .line 22
    new-instance p3, Ll/gfn;

    invoke-direct {p3, p1}, Ll/gfn;-><init>(Ll/dum;)V

    goto :goto_1

    .line 23
    :cond_1
    new-instance p3, Ll/mvv;

    invoke-direct {p3, p1}, Ll/mvv;-><init>(Ll/dum;)V

    .line 24
    :goto_1
    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 25
    new-instance p3, Ll/a0s;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->K:Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;

    invoke-direct {p3, p1, v0}, Ll/a0s;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 26
    new-instance p3, Ll/wu40;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->C:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    invoke-direct {p3, p1, v0}, Ll/wu40;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 27
    new-instance p3, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->w:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    invoke-direct {p3, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 28
    new-instance p3, Ll/w7u;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->R:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerDragMask;

    invoke-direct {p3, p1, v0}, Ll/w7u;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerDragMask;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 29
    new-instance p3, Ll/ki3;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    invoke-direct {p3, p1, v0}, Ll/ki3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 30
    new-instance p3, Ll/las;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->N:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    invoke-direct {p3, p1, v0}, Ll/las;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 31
    new-instance p3, Ll/aks;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->F:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    invoke-direct {p3, p1, v0}, Ll/aks;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    new-instance p3, Ll/fgs;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->U:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    invoke-direct {p3, p1, v0}, Ll/fgs;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 33
    new-instance p3, Ll/q4j0;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->G:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    invoke-direct {p3, p1, v0}, Ll/q4j0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 34
    new-instance p3, Ll/fr70;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->e:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    invoke-direct {p3, p1, v0, v1}, Ll/fr70;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 35
    new-instance p3, Ll/pct;

    invoke-direct {p3, p1}, Ll/pct;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 36
    new-instance p3, Ll/qbt;

    iget-object v0, p0, Ll/xct;->j:Ljava/lang/String;

    invoke-direct {p3, p1, v0}, Ll/qbt;-><init>(Ll/dum;Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 37
    new-instance p3, Ll/c060;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->x:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    invoke-direct {p3, p1, v0}, Ll/c060;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 38
    new-instance p3, Ll/zm80;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->T:Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    invoke-direct {p3, p1, v0}, Ll/zm80;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 39
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    move-result-object p3

    invoke-virtual {p3}, Ll/vwt;->P6()Z

    move-result p3

    if-eqz p3, :cond_2

    .line 40
    new-instance p3, Ll/d9g;

    invoke-direct {p3, p1}, Ll/d9g;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 41
    new-instance p3, Ll/nag;

    invoke-direct {p3, p1}, Ll/nag;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 42
    new-instance p3, Ll/ebg;

    invoke-direct {p3, p1}, Ll/ebg;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 43
    new-instance p3, Ll/idg;

    invoke-direct {p3, p1}, Ll/idg;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 44
    new-instance p3, Ll/ycg;

    invoke-direct {p3, p1}, Ll/ycg;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 45
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    move-result-object p3

    invoke-virtual {p3}, Ll/vwt;->H3()Z

    move-result p3

    if-nez p3, :cond_2

    .line 46
    new-instance p3, Ll/ocg;

    invoke-direct {p3, p1}, Ll/ocg;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 47
    :cond_2
    sget-object p3, Ll/zrv;->a:Ll/wrv;

    invoke-virtual {p3}, Ll/wrv;->H()Z

    move-result p3

    if-eqz p3, :cond_3

    .line 48
    new-instance p3, Ll/whj;

    invoke-direct {p3, p1}, Ll/whj;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 49
    :cond_3
    new-instance p3, Ll/p260;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->x:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationEntryBindings;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    invoke-direct {p3, p1, v0}, Ll/p260;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 50
    new-instance p3, Ll/rz3;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->z:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    invoke-direct {p3, p1, v0, v1}, Ll/rz3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 51
    new-instance p3, Ll/nce0;

    invoke-direct {p3, p1}, Ll/nce0;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 52
    new-instance p3, Ll/gje;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->V:Lv/VFrame;

    invoke-direct {p3, p1, v0}, Ll/gje;-><init>(Ll/dum;Landroid/widget/FrameLayout;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 53
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    move-result-object p3

    invoke-virtual {p3}, Ll/vwt;->O6()Z

    move-result p3

    if-eqz p3, :cond_4

    .line 54
    new-instance p3, Ll/xre;

    invoke-direct {p3, p1}, Ll/xre;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 55
    :cond_4
    new-instance p3, Ll/qiv;

    invoke-direct {p3, p1}, Ll/qiv;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 56
    new-instance p3, Ll/une0;

    invoke-direct {p3, p1}, Ll/une0;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 57
    new-instance p3, Ll/p5f0;

    invoke-direct {p3, p1}, Ll/p5f0;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 58
    new-instance p3, Ll/cfv;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->S:Landroid/view/View;

    invoke-direct {p3, p1, v0}, Ll/cfv;-><init>(Ll/dum;Landroid/view/View;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 59
    new-instance p3, Ll/oh10;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    invoke-direct {p3, p1, v0}, Ll/oh10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 60
    new-instance p3, Ll/vi10;

    invoke-direct {p3, p1}, Ll/vi10;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 61
    new-instance p3, Ll/e910;

    invoke-direct {p3, p1}, Ll/e910;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 62
    new-instance p3, Ll/op10;

    invoke-direct {p3, p1}, Ll/op10;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 63
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    move-result-object p3

    invoke-virtual {p3}, Ll/vwt;->r6()Z

    move-result p3

    if-eqz p3, :cond_5

    .line 64
    new-instance p3, Ll/ta50;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->h:Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->Q:Lv/VImage;

    invoke-direct {p3, p1, v0, v1}, Ll/ta50;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;Lv/VImage;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 65
    :cond_5
    new-instance p3, Ll/yeu;

    invoke-direct {p3, p1}, Ll/yeu;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 66
    new-instance p3, Ll/rfg;

    invoke-direct {p3, p1}, Ll/rfg;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 67
    new-instance p3, Ll/g3j0;

    invoke-direct {p3, p1}, Ll/g3j0;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 68
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    move-result-object p3

    invoke-virtual {p3}, Ll/vwt;->g7()Z

    move-result p3

    if-eqz p3, :cond_6

    .line 69
    new-instance p3, Ll/hsx;

    invoke-direct {p3, p1}, Ll/hsx;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 70
    :cond_6
    new-instance p3, Ll/ue10;

    invoke-direct {p3, p1}, Ll/ue10;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 71
    new-instance p3, Ll/t9s;

    invoke-direct {p3, p1, p0, p2}, Ll/t9s;-><init>(Ll/dum;Ll/xct;Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 72
    new-instance p3, Ll/ll0;

    invoke-direct {p3, p1}, Ll/ll0;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 73
    new-instance p3, Ll/mvr;

    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->n:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/annoncements/view/LiveAnnouncementEntryView;

    invoke-direct {p3, p1, v0}, Ll/mvr;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/annoncements/view/LiveAnnouncementEntryView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 74
    new-instance p3, Ll/qtj0;

    invoke-direct {p3, p1}, Ll/qtj0;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 75
    new-instance p3, Ll/v06;

    invoke-direct {p3, p1}, Ll/v06;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    const/4 p3, 0x2

    .line 76
    invoke-static {p3}, Ll/wft;->b(I)Z

    move-result p3

    if-nez p3, :cond_7

    .line 77
    new-instance p3, Ll/y3s;

    new-instance v0, Ll/tf4;

    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->D:Landroid/widget/FrameLayout;

    invoke-direct {v0, v1}, Ll/tf4;-><init>(Landroid/widget/FrameLayout;)V

    invoke-direct {p3, p1, v0}, Ll/y3s;-><init>(Ll/dum;Ll/tf4;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 78
    new-instance p3, Ll/f1t;

    invoke-direct {p3, p1}, Ll/f1t;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 79
    new-instance p3, Ll/kdp;

    invoke-direct {p3, p1}, Ll/kdp;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 80
    new-instance p3, Ll/xrs;

    invoke-direct {p3, p1}, Ll/xrs;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 81
    new-instance p3, Ll/x0o;

    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->O:Landroid/widget/FrameLayout;

    invoke-direct {p3, p1, p2}, Ll/x0o;-><init>(Ll/dum;Landroid/widget/FrameLayout;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 82
    new-instance p2, Ll/tep;

    invoke-direct {p2, p1}, Ll/tep;-><init>(Ll/dum;)V

    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    goto :goto_2

    .line 83
    :cond_7
    new-instance p3, Ll/wzr;

    invoke-direct {p3, p1}, Ll/wzr;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 84
    new-instance p3, Ll/xrs;

    invoke-direct {p3, p1}, Ll/xrs;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 85
    new-instance p3, Ll/tls;

    invoke-direct {p3, p1}, Ll/tls;-><init>(Ll/dum;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 86
    new-instance p3, Ll/st10;

    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    invoke-direct {p3, p1, p2}, Ll/st10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;)V

    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 87
    :goto_2
    new-instance p2, Ll/b2s;

    invoke-direct {p2, p1}, Ll/b2s;-><init>(Ll/dum;)V

    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 88
    new-instance p2, Ll/z1t;

    invoke-direct {p2, p1}, Ll/z1t;-><init>(Ll/dum;)V

    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 89
    new-instance p2, Ll/zdu;

    invoke-direct {p2, p1}, Ll/zdu;-><init>(Ll/dum;)V

    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 90
    new-instance p2, Ll/act;

    invoke-direct {p2, p1}, Ll/act;-><init>(Ll/dum;)V

    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 91
    new-instance p2, Ll/s9s;

    invoke-direct {p2, p1}, Ll/s9s;-><init>(Ll/dum;)V

    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 92
    new-instance p2, Ll/s4t;

    invoke-direct {p2, p1}, Ll/s4t;-><init>(Ll/dum;)V

    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 93
    new-instance p2, Ll/a4h0;

    invoke-direct {p2, p1}, Ll/a4h0;-><init>(Ll/dum;)V

    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    return-void
.end method
