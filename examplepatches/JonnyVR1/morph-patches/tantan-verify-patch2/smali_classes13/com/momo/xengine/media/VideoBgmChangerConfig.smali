.class public Lcom/momo/xengine/media/VideoBgmChangerConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private bgmPath:Ljava/lang/String;

.field private outputPath:Ljava/lang/String;

.field private videoPath:Ljava/lang/String;

.field private volume_rate:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/xengine/media/VideoBgmChangerConfig;->volume_rate:F

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getBgmPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/VideoBgmChangerConfig;->bgmPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOutputPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/VideoBgmChangerConfig;->outputPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/VideoBgmChangerConfig;->videoPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVolumeRate()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/VideoBgmChangerConfig;->volume_rate:F

    .line 2
    .line 3
    return p0
.end method

.method public setBgmPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/VideoBgmChangerConfig;->bgmPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOutputPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/VideoBgmChangerConfig;->outputPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/VideoBgmChangerConfig;->videoPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVolumeRate(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/VideoBgmChangerConfig;->volume_rate:F

    .line 2
    .line 3
    return-void
.end method
