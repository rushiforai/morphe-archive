.class public Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public baseUserID:Ljava/lang/String;

.field public maxCacheTimeMs:I

.field public syncStrategy:Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;

.field public videoNeedSdkMix:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;->MIXED_STREAM_SYNC_STRATEGY_NO_SYNC:Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->syncStrategy:Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;

    .line 7
    .line 8
    const/16 v0, 0x7d0

    .line 9
    .line 10
    iput v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->maxCacheTimeMs:I

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->videoNeedSdkMix:Z

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->baseUserID:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method
