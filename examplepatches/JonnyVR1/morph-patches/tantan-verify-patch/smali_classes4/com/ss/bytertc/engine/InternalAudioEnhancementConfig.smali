.class public Lcom/ss/bytertc/engine/InternalAudioEnhancementConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public enhanceAudio:Z

.field public enhanceSignaling:Z


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/type/AudioEnhancementConfig;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalAudioEnhancementConfig;->enhanceSignaling:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalAudioEnhancementConfig;->enhanceAudio:Z

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/type/AudioEnhancementConfig;->enhanceSignaling:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalAudioEnhancementConfig;->enhanceSignaling:Z

    .line 12
    .line 13
    iget-boolean p1, p1, Lcom/ss/bytertc/engine/type/AudioEnhancementConfig;->enhanceAudio:Z

    .line 14
    .line 15
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/InternalAudioEnhancementConfig;->enhanceAudio:Z

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public getAudioEnhance()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/InternalAudioEnhancementConfig;->enhanceAudio:Z

    .line 2
    .line 3
    return p0
.end method

.method public getSignalingEnhance()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/InternalAudioEnhancementConfig;->enhanceSignaling:Z

    .line 2
    .line 3
    return p0
.end method
