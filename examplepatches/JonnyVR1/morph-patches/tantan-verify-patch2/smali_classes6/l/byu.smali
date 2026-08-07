.class public Ll/byu;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

.field public localGoAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

.field public localTrackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;


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


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/byu;->localGoAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/byu;->localTrackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/byu;->localTrackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-void
.end method
