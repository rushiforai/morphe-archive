.class public Lcom/core/glcore/yuvutil/YuvTools;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "yuvutils"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "yuvtools"

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a([BII[B)[B
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/core/glcore/yuvutil/YuvTools;->nativeRGBA2NV21([BII[B)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static native nativeARGBToNV21ByArray([III[B)Z
.end method

.method private static native nativeArgb2Nv21([III)[B
.end method

.method private static native nativeCovertYUV420888ToNV21(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;IILjava/nio/ByteBuffer;IIII[B)[B
.end method

.method private static native nativeNV21toARGB([BII)[B
.end method

.method private static native nativeNV21toARGBByArray([BII[B)Z
.end method

.method private static native nativeRGBA2NV21([BII[B)[B
.end method
