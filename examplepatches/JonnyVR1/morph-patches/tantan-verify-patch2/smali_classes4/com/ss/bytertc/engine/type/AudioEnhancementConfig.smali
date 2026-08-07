.class public Lcom/ss/bytertc/engine/type/AudioEnhancementConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public enhanceAudio:Z

.field public enhanceSignaling:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/AudioEnhancementConfig;->enhanceSignaling:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/AudioEnhancementConfig;->enhanceAudio:Z

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/type/AudioEnhancementConfig;->enhanceSignaling:Z

    .line 12
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/type/AudioEnhancementConfig;->enhanceAudio:Z

    return-void
.end method
