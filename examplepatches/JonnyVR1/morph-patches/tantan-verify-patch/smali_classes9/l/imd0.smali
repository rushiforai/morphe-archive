.class public Ll/imd0;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;Landroid/view/View;)V
    .locals 10

    .line 1
    move-object v0, p1

    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->a:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 2
    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    .line 3
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->b:Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    const/4 v1, 0x1

    .line 4
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->c:Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    const/4 v2, 0x2

    .line 5
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    const/4 v3, 0x3

    .line 6
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->e:Landroid/view/View;

    const/4 v4, 0x4

    .line 7
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/live/livingroom/base/player/LiveRtcPlayErrorView;

    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->f:Lcom/p1/mobile/putong/live/livingroom/base/player/LiveRtcPlayErrorView;

    const/4 v5, 0x5

    .line 8
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lv/VFrame;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->g:Lv/VFrame;

    .line 9
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lv/VRelative;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->h:Lv/VRelative;

    .line 10
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 11
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpToRoomView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->i:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpToRoomView;

    .line 12
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 13
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 14
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 15
    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 16
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 17
    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->l:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 18
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 19
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->m:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 20
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 21
    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lv/VText;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->n:Lv/VText;

    .line 22
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/4 v7, 0x6

    .line 23
    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->o:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 24
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/4 v8, 0x7

    .line 25
    invoke-virtual {v6, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lv/VFrame;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->p:Lv/VFrame;

    .line 26
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 27
    invoke-virtual {v6, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 28
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->q:Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

    .line 29
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/16 v9, 0x8

    .line 30
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lv/VRelative;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->r:Lv/VRelative;

    .line 31
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 32
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 33
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/annoncements/view/LiveAnnouncementEntryView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->s:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/annoncements/view/LiveAnnouncementEntryView;

    .line 34
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 35
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 36
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lv/VFrame;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->t:Lv/VFrame;

    .line 37
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 38
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 39
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 40
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->u:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;

    .line 41
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 42
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 43
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 44
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

    .line 45
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 46
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 47
    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/FrameLayout;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->w:Landroid/widget/FrameLayout;

    .line 48
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 49
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 50
    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 51
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->x:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

    .line 52
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 53
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 54
    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 55
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->y:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 56
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/16 v9, 0x9

    .line 57
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->z:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;

    .line 58
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/16 v9, 0xa

    .line 59
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->A:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 60
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 61
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 62
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->B:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 63
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/16 v9, 0xb

    .line 64
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->C:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 65
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/16 v9, 0xc

    .line 66
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->D:Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    .line 67
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/16 v9, 0xd

    .line 68
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->E:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 69
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 70
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 71
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->F:Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 72
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/16 v9, 0xe

    .line 73
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->G:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 74
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/16 v9, 0xf

    .line 75
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->H:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 76
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/16 v9, 0x10

    .line 77
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->I:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 78
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 79
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 80
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->J:Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 81
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/16 v9, 0x11

    .line 82
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->K:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 83
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 84
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->L:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 85
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lv/VFrame;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->M:Lv/VFrame;

    .line 86
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 87
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->N:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 88
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 89
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->O:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 90
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lv/VRelative;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->P:Lv/VRelative;

    .line 91
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 92
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->Q:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 93
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 94
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->R:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 95
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 96
    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;

    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->S:Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;

    .line 97
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 98
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 99
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->T:Landroid/widget/FrameLayout;

    .line 100
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 101
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 102
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 103
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->U:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 104
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 105
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 106
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->V:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 107
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 108
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 109
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->W:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 110
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 111
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->k0:Landroid/view/View;

    .line 112
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 113
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 114
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->p0:Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 115
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 116
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->E0:Landroid/widget/FrameLayout;

    .line 117
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 118
    invoke-virtual {v1, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lv/VRelative;

    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->F0:Lv/VRelative;

    .line 119
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 120
    invoke-virtual {v1, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 121
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/VImage;

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->G0:Lv/VImage;

    .line 122
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->H0:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 123
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/VFrame;

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->I0:Lv/VFrame;

    .line 124
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lv/VRelative;

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->J0:Lv/VRelative;

    return-void
.end method
