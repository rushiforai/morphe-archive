.class public Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public annexb:Z

.field public appendSpsPps:Z

.field public bLimitFps:Z

.field public bMultiRef:Z

.field public baseFrameIndex:J

.field public baseGopIndex:J

.field public bitrate:I

.field public enableBFrame:Z

.field public enableBlackList:Z

.field public enableEGL14:Z

.field public encFmt:Lorg/json/JSONArray;

.field public encodeType:I

.field public encoderMode:I

.field public encoderProfile:I

.field public forceSetBitrateMode:Z

.field public fps:I

.field public fullIFrame:Z

.field public glContext:Ljava/lang/Object;

.field public gop:I

.field public height:I

.field public realTime:Z

.field public record:Z

.field public streamType:I

.field public syncOutput:Z

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 8
    .line 9
    const/16 v1, 0x14

    .line 10
    .line 11
    iput v1, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    iput v1, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->gop:I

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    iput v1, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderProfile:I

    .line 18
    .line 19
    iput v1, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderMode:I

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->enableBFrame:Z

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    iput-object v2, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->glContext:Ljava/lang/Object;

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->realTime:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->annexb:Z

    .line 29
    .line 30
    iput-boolean v1, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->appendSpsPps:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fullIFrame:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->syncOutput:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->enableEGL14:Z

    .line 37
    .line 38
    iput-boolean v1, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->enableBlackList:Z

    .line 39
    .line 40
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->record:Z

    .line 41
    .line 42
    const-wide/16 v3, 0x0

    .line 43
    .line 44
    iput-wide v3, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->baseFrameIndex:J

    .line 45
    .line 46
    iput-wide v3, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->baseGopIndex:J

    .line 47
    .line 48
    iput v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->streamType:I

    .line 49
    .line 50
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->bMultiRef:Z

    .line 51
    .line 52
    iput v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->bitrate:I

    .line 53
    .line 54
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->bLimitFps:Z

    .line 55
    .line 56
    iput v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encodeType:I

    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->forceSetBitrateMode:Z

    .line 59
    .line 60
    iput-object v2, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encFmt:Lorg/json/JSONArray;

    .line 61
    .line 62
    return-void
.end method
