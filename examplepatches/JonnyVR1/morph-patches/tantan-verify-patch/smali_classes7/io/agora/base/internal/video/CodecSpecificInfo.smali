.class public Lio/agora/base/internal/video/CodecSpecificInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/internal/video/CodecSpecificInfo$CodecSpecificInfoHEVC;,
        Lio/agora/base/internal/video/CodecSpecificInfo$CodecSpecificInfoH264;,
        Lio/agora/base/internal/video/CodecSpecificInfo$CodecSpecificInfoVP9;,
        Lio/agora/base/internal/video/CodecSpecificInfo$CodecSpecificInfoVP8;
    }
.end annotation


# instance fields
.field private compressed_alpha_buffer:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public elapsedRealtime:J

.field private final metadata:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public opaque:J


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    .line 21
    invoke-direct {p0, v0, v0, v1, v2}, Lio/agora/base/internal/video/CodecSpecificInfo;-><init>(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;J)V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->metadata:Ljava/nio/ByteBuffer;

    .line 15
    iput-object v0, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->compressed_alpha_buffer:Ljava/nio/ByteBuffer;

    .line 16
    iput-wide p1, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->opaque:J

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->metadata:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    iput-wide p2, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->elapsedRealtime:J

    .line 7
    .line 8
    const-wide/16 p1, 0x0

    .line 9
    .line 10
    iput-wide p1, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->opaque:J

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->metadata:Ljava/nio/ByteBuffer;

    .line 19
    iput-object p2, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->compressed_alpha_buffer:Ljava/nio/ByteBuffer;

    .line 20
    iput-wide p3, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->opaque:J

    return-void
.end method


# virtual methods
.method public getCompressedAlphadata()Ljava/nio/ByteBuffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->compressed_alpha_buffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMetadata()Ljava/nio/ByteBuffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->metadata:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpaque()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/CodecSpecificInfo;->opaque:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getVideoCodecProfile()Lio/agora/base/internal/video/VideoCodecProfile;
    .locals 0

    .line 1
    sget-object p0, Lio/agora/base/internal/video/VideoCodecProfile;->UNKNOWN:Lio/agora/base/internal/video/VideoCodecProfile;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoCodecType()Lio/agora/base/internal/video/VideoCodecType;
    .locals 0

    .line 1
    sget-object p0, Lio/agora/base/internal/video/VideoCodecType;->UNKNOWN:Lio/agora/base/internal/video/VideoCodecType;

    .line 2
    .line 3
    return-object p0
.end method
