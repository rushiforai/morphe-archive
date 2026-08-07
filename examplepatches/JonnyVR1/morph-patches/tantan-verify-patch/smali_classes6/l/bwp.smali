.class public Ll/bwp;
.super Ll/a4s;
.source "SourceFile"


# instance fields
.field private goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

.field private isShowRegion:Z

.field private liveFrame:Lcom/p1/mobile/putong/live/base/data/BLiveFrame;

.field private roomFeed:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

.field private styleIndex:I

.field private trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

.field private whiteMCTrackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a4s;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bwp;->roomFeed:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwp;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/live/base/data/BLiveFrame;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwp;->liveFrame:Lcom/p1/mobile/putong/live/base/data/BLiveFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwp;->roomFeed:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bwp;->styleIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwp;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwp;->whiteMCTrackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bwp;->isShowRegion:Z

    .line 2
    .line 3
    return p0
.end method

.method public h(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bwp;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/base/data/BLiveFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bwp;->liveFrame:Lcom/p1/mobile/putong/live/base/data/BLiveFrame;

    .line 2
    .line 3
    return-void
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bwp;->isShowRegion:Z

    .line 2
    .line 3
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bwp;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bwp;->whiteMCTrackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-void
.end method
