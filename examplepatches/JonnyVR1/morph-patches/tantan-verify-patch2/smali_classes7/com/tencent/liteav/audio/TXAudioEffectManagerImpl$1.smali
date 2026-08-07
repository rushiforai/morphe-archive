.class Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->setMusicObserver(ILcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

.field final synthetic val$id:I

.field final synthetic val$observer:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;Lcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;->this$0:Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;->val$observer:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;->val$id:I

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;->val$observer:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->access$600()Ljava/util/HashMap;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;->this$0:Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->access$400(Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget p0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;->val$id:I

    .line 16
    .line 17
    invoke-static {v1, p0}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->access$500(II)J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->access$600()Ljava/util/HashMap;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;->this$0:Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->access$400(Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iget v2, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;->val$id:I

    .line 40
    .line 41
    invoke-static {v1, v2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->access$500(II)J

    .line 42
    .line 43
    .line 44
    move-result-wide v1

    .line 45
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object p0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;->val$observer:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;

    .line 50
    .line 51
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->access$600()Ljava/util/HashMap;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string v0, "AudioCenter:TXAudioEffectManager"

    .line 71
    .line 72
    const-string v1, "setMusicObserver map count: %d"

    .line 73
    .line 74
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
