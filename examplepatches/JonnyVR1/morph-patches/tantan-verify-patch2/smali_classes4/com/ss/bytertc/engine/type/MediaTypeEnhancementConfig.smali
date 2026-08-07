.class public Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public enhanceAudio:Z

.field public enhanceScreenAudio:Z

.field public enhanceScreenVideo:Z

.field public enhanceSignaling:Z

.field public enhanceVideo:Z


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
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;->enhanceSignaling:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;->enhanceAudio:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;->enhanceVideo:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;->enhanceScreenAudio:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;->enhanceScreenVideo:Z

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(ZZZZZ)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;->enhanceSignaling:Z

    .line 18
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;->enhanceAudio:Z

    .line 19
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;->enhanceVideo:Z

    .line 20
    iput-boolean p4, p0, Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;->enhanceScreenAudio:Z

    .line 21
    iput-boolean p5, p0, Lcom/ss/bytertc/engine/type/MediaTypeEnhancementConfig;->enhanceScreenVideo:Z

    return-void
.end method
