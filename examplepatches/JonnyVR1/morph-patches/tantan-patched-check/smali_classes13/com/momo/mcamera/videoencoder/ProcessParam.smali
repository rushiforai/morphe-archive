.class public Lcom/momo/mcamera/videoencoder/ProcessParam;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private bitrate:I

.field private outPutHeight:I

.field private outPutWidth:I

.field private outputBitrate:J

.field private outputPath:Ljava/lang/String;

.field private tempPath:Ljava/lang/String;

.field private videoDuration:J

.field private videoHeight:I

.field private videoPath:Ljava/lang/String;

.field private videoWidth:I


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
.method public getBitrate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->bitrate:I

    .line 2
    .line 3
    return p0
.end method

.method public getOutPutHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->outPutHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getOutPutWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->outPutWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getOutputBitrate()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->outputBitrate:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getOutputPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->outputPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTempPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->tempPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->videoDuration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getVideoHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->videoHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->videoPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->videoWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public setBitrate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->bitrate:I

    .line 2
    .line 3
    return-void
.end method

.method public setOutPutHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->outPutHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setOutPutWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->outPutWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setOutputBitrate(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->outputBitrate:J

    .line 2
    .line 3
    return-void
.end method

.method public setOutputPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->outputPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTempPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->tempPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->videoDuration:J

    .line 2
    .line 3
    return-void
.end method

.method public setVideoHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->videoHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->videoPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/videoencoder/ProcessParam;->videoWidth:I

    .line 2
    .line 3
    return-void
.end method
