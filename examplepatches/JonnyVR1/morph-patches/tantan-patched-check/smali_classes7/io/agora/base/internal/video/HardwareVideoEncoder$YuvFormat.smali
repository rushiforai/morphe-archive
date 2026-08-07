.class abstract enum Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/HardwareVideoEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "YuvFormat"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

.field public static final enum I420:Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

.field public static final enum NV12:Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

.field public static final enum NV21:Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat$1;

    .line 2
    .line 3
    const-string v1, "I420"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat$1;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;->I420:Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    .line 10
    .line 11
    new-instance v1, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat$2;

    .line 12
    .line 13
    const-string v3, "NV12"

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    invoke-direct {v1, v3, v4}, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat$2;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;->NV12:Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    .line 20
    .line 21
    new-instance v3, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat$3;

    .line 22
    .line 23
    const-string v5, "NV21"

    .line 24
    .line 25
    const/4 v6, 0x2

    .line 26
    invoke-direct {v3, v5, v6}, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat$3;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v3, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;->NV21:Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    .line 30
    .line 31
    const/4 v5, 0x3

    .line 32
    new-array v5, v5, [Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    .line 33
    .line 34
    aput-object v0, v5, v2

    .line 35
    .line 36
    aput-object v1, v5, v4

    .line 37
    .line 38
    aput-object v3, v5, v6

    .line 39
    .line 40
    sput-object v5, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;->$VALUES:[Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    .line 41
    .line 42
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILio/agora/base/internal/video/HardwareVideoEncoder$1;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static fillNV12Buffer(Ljava/nio/ByteBuffer;IILio/agora/base/VideoFrame$Buffer;Z)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-interface/range {p3 .. p3}, Lio/agora/base/VideoFrame$Buffer;->toI420()Lio/agora/base/VideoFrame$I420Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    add-int/lit8 v2, p1, 0x1

    .line 8
    .line 9
    div-int/lit8 v2, v2, 0x2

    .line 10
    .line 11
    add-int/lit8 v3, p2, 0x1

    .line 12
    .line 13
    div-int/lit8 v3, v3, 0x2

    .line 14
    .line 15
    mul-int v4, p1, p2

    .line 16
    .line 17
    mul-int/2addr v3, v2

    .line 18
    mul-int/lit8 v3, v3, 0x2

    .line 19
    .line 20
    add-int/2addr v3, v4

    .line 21
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-lt v5, v3, :cond_4

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object v11

    .line 35
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v13

    .line 42
    if-eqz p4, :cond_0

    .line 43
    .line 44
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    :goto_0
    move-object v7, v0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    goto :goto_0

    .line 55
    :goto_1
    if-eqz p4, :cond_1

    .line 56
    .line 57
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideV()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    :goto_2
    move v8, v0

    .line 62
    goto :goto_3

    .line 63
    :cond_1
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideU()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    goto :goto_2

    .line 68
    :goto_3
    if-eqz p4, :cond_2

    .line 69
    .line 70
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    :goto_4
    move-object v9, v0

    .line 75
    goto :goto_5

    .line 76
    :cond_2
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    goto :goto_4

    .line 81
    :goto_5
    if-eqz p4, :cond_3

    .line 82
    .line 83
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideU()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    :goto_6
    move v10, v0

    .line 88
    goto :goto_7

    .line 89
    :cond_3
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideV()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    goto :goto_6

    .line 94
    :goto_7
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideY()I

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    mul-int/lit8 v14, v2, 0x2

    .line 103
    .line 104
    invoke-interface {v1}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 105
    .line 106
    .line 107
    move-result v15

    .line 108
    invoke-interface {v1}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 109
    .line 110
    .line 111
    move-result v16

    .line 112
    move/from16 v12, p1

    .line 113
    .line 114
    invoke-static/range {v5 .. v16}, Lio/agora/base/internal/video/YuvHelper;->I420ToNV12(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 115
    .line 116
    .line 117
    invoke-interface {v1}, Lio/agora/base/VideoFrame$Buffer;->release()V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_4
    const-string v1, " was "

    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    const-string v2, "Expected destination buffer capacity to be at least "

    .line 128
    .line 129
    invoke-static {v2, v3, v1, v0}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public static valueOf(IZ)Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;
    .locals 1

    .line 1
    const/16 v0, 0x13

    .line 2
    .line 3
    if-eq p0, v0, :cond_3

    .line 4
    .line 5
    const/16 v0, 0x15

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const v0, 0x7fa30c00

    .line 10
    .line 11
    .line 12
    if-eq p0, v0, :cond_1

    .line 13
    .line 14
    const v0, 0x7fa30c04

    .line 15
    .line 16
    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p1, "Unsupported colorFormat: "

    .line 21
    .line 22
    invoke-static {p1, p0}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0

    .line 27
    :cond_1
    :goto_0
    if-eqz p1, :cond_2

    .line 28
    .line 29
    sget-object p0, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;->NV21:Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    sget-object p0, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;->NV12:Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_3
    sget-object p0, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;->I420:Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    .line 36
    .line 37
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;
    .locals 1

    .line 38
    const-class v0, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    return-object p0
.end method

.method public static values()[Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;->$VALUES:[Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public abstract fillBuffer(Ljava/nio/ByteBuffer;IILio/agora/base/VideoFrame$Buffer;)V
.end method
