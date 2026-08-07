.class final Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->onEffectProgress(JJJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic val$curPtsMS:J

.field final synthetic val$durationMS:J

.field final synthetic val$id:J


# direct methods
.method public constructor <init>(JJJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$5;->val$id:J

    .line 2
    .line 3
    iput-wide p3, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$5;->val$curPtsMS:J

    .line 4
    .line 5
    iput-wide p5, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$5;->val$durationMS:J

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->access$600()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-wide v1, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$5;->val$id:J

    .line 6
    .line 7
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->access$600()Ljava/util/HashMap;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-wide v1, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$5;->val$id:J

    .line 22
    .line 23
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    move-object v1, v0

    .line 32
    check-cast v1, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;

    .line 33
    .line 34
    iget-wide v2, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$5;->val$id:J

    .line 35
    .line 36
    long-to-int v2, v2

    .line 37
    iget-wide v3, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$5;->val$curPtsMS:J

    .line 38
    .line 39
    iget-wide v5, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$5;->val$durationMS:J

    .line 40
    .line 41
    invoke-interface/range {v1 .. v6}, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;->onPlayProgress(IJJ)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method
