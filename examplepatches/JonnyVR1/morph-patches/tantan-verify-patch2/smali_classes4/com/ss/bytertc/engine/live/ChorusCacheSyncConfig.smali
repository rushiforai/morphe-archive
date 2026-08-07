.class public Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private maxCacheTimeMs:I

.field private mode:Lcom/ss/bytertc/engine/live/ChorusCacheSyncMode;

.field private videoFps:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x7d0

    .line 5
    .line 6
    iput v0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->maxCacheTimeMs:I

    .line 7
    .line 8
    sget-object v0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncMode;->CHORUS_CACHE_SYNC_MODE_RETRANSMITTER:Lcom/ss/bytertc/engine/live/ChorusCacheSyncMode;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->mode:Lcom/ss/bytertc/engine/live/ChorusCacheSyncMode;

    .line 11
    .line 12
    const/16 v0, 0xf

    .line 13
    .line 14
    iput v0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->videoFps:I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getChorusCacheSyncConfigMaxCacheTimeMs()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->maxCacheTimeMs:I

    .line 2
    .line 3
    return p0
.end method

.method public getChorusCacheSyncConfigMode()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->mode:Lcom/ss/bytertc/engine/live/ChorusCacheSyncMode;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/ChorusCacheSyncMode;->value()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getChorusCacheSyncConfigVideoFps()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->videoFps:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxCacheTimeMs()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->maxCacheTimeMs:I

    .line 2
    .line 3
    return p0
.end method

.method public getMode()Lcom/ss/bytertc/engine/live/ChorusCacheSyncMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->mode:Lcom/ss/bytertc/engine/live/ChorusCacheSyncMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoFps()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->videoFps:I

    .line 2
    .line 3
    return p0
.end method

.method public setMaxCacheTimeMs(I)Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->maxCacheTimeMs:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setMode(Lcom/ss/bytertc/engine/live/ChorusCacheSyncMode;)Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->mode:Lcom/ss/bytertc/engine/live/ChorusCacheSyncMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public setVideoFps(I)Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;->videoFps:I

    .line 2
    .line 3
    return-object p0
.end method
