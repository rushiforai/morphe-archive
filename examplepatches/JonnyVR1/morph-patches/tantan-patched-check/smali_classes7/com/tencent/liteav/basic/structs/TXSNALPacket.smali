.class public Lcom/tencent/liteav/basic/structs/TXSNALPacket;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public arrivalTimeMs:J

.field public buffer:Ljava/nio/ByteBuffer;

.field public codecId:I

.field public dts:J

.field public frameIndex:J

.field public gopFrameIndex:J

.field public gopIndex:J

.field public info:Landroid/media/MediaCodec$BufferInfo;

.field public nalData:[B

.field public nalType:I

.field public pts:J

.field public refFremeIndex:J

.field public rotation:I

.field public sequenceNum:J

.field public streamType:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 9
    .line 10
    const-wide/16 v1, 0x0

    .line 11
    .line 12
    iput-wide v1, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->gopIndex:J

    .line 13
    .line 14
    iput-wide v1, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->gopFrameIndex:J

    .line 15
    .line 16
    iput-wide v1, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->frameIndex:J

    .line 17
    .line 18
    iput-wide v1, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->refFremeIndex:J

    .line 19
    .line 20
    iput-wide v1, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 21
    .line 22
    iput-wide v1, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->dts:J

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    iput v3, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->rotation:I

    .line 26
    .line 27
    iput-wide v1, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->sequenceNum:J

    .line 28
    .line 29
    iput-wide v1, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->arrivalTimeMs:J

    .line 30
    .line 31
    iput v3, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->codecId:I

    .line 32
    .line 33
    iput-object v0, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->buffer:Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->info:Landroid/media/MediaCodec$BufferInfo;

    .line 36
    .line 37
    const/4 v0, 0x2

    .line 38
    iput v0, p0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->streamType:I

    .line 39
    .line 40
    return-void
.end method
