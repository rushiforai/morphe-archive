.class Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/HardwareVideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DecodedTextureMetadata"
.end annotation


# instance fields
.field final decodeTimeMs:Ljava/lang/Integer;

.field final delaySize:I

.field final height:I

.field private final infoPresentationTimeUs:J

.field final outputBufferIndex:I

.field final presentationTimestampUs:J

.field final prevElapsedRealtime:J

.field final rotation:I

.field final width:I


# direct methods
.method public constructor <init>(IIIIJLjava/lang/Integer;IJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;->outputBufferIndex:I

    .line 5
    .line 6
    iput p2, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;->width:I

    .line 7
    .line 8
    iput p3, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;->height:I

    .line 9
    .line 10
    iput p4, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;->rotation:I

    .line 11
    .line 12
    iput-wide p5, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;->presentationTimestampUs:J

    .line 13
    .line 14
    iput-object p7, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;->decodeTimeMs:Ljava/lang/Integer;

    .line 15
    .line 16
    iput p8, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;->delaySize:I

    .line 17
    .line 18
    iput-wide p9, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;->prevElapsedRealtime:J

    .line 19
    .line 20
    iput-wide p11, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;->infoPresentationTimeUs:J

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic access$2000(Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$DecodedTextureMetadata;->infoPresentationTimeUs:J

    .line 2
    .line 3
    return-wide v0
.end method
