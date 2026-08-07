.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$97;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setReverbType(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$reverbType:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$97;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$97;->val$reverbType:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$97;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    const-string v1, "setLocalViewFillMode"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->getInstance()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$97;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->reverbTypes:[Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 15
    .line 16
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$97;->val$reverbType:I

    .line 17
    .line 18
    aget-object p0, v1, p0

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->setVoiceReverbType(Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
