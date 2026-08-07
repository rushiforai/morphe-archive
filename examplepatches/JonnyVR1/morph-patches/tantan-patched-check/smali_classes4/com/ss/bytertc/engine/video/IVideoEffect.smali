.class public abstract Lcom/ss/bytertc/engine/video/IVideoEffect;
.super Ljava/lang/Object;
.source "SourceFile"


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
.method public abstract appendEffectNodes(Ljava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation
.end method

.method public abstract applyStickerEffect(Ljava/lang/String;)I
.end method

.method public abstract disableFaceDetection()I
.end method

.method public abstract disableVideoEffect()I
.end method

.method public abstract disableVirtualBackground()I
.end method

.method public abstract enableFaceDetection(Lcom/ss/bytertc/engine/video/IFaceDetectionObserver;ILjava/lang/String;)I
.end method

.method public abstract enableVideoEffect()I
.end method

.method public abstract enableVirtualBackground(Ljava/lang/String;Lcom/ss/bytertc/engine/data/VirtualBackgroundSource;)I
.end method

.method public abstract getVideoEffectHandle()J
.end method

.method public abstract initCVResource(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract removeEffectNodes(Ljava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation
.end method

.method public abstract setAlgoModelResourceFinder(JJ)I
.end method

.method public abstract setColorFilter(Ljava/lang/String;)I
.end method

.method public abstract setColorFilterIntensity(F)I
.end method

.method public abstract setEffectNodes(Ljava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation
.end method

.method public abstract setVideoEffectExpressionDetect(Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;)I
.end method

.method public abstract updateEffectNode(Ljava/lang/String;Ljava/lang/String;F)I
.end method
