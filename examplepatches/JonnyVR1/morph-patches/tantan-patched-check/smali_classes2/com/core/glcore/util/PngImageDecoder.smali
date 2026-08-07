.class public Lcom/core/glcore/util/PngImageDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final COLORSPACE_AG:I = 0x21

.field public static final COLORSPACE_ARGB:I = 0x23

.field public static final COLORSPACE_BGR:I = 0x12

.field public static final COLORSPACE_BGRA:I = 0x13

.field public static final COLORSPACE_GA:I = 0x1

.field public static final COLORSPACE_GRAY:I = 0x0

.field public static final COLORSPACE_RGB:I = 0x2

.field public static final COLORSPACE_RGBA:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "pngdecoder"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
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

.method public static imageLoad(Ljava/lang/String;Lcom/core/glcore/util/ImageFrame;)Lcom/core/glcore/util/ImageFrame;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/core/glcore/util/PngImageDecoder;->nativeImageLoader(Ljava/lang/String;Lcom/core/glcore/util/ImageFrame;)Lcom/core/glcore/util/ImageFrame;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/core/glcore/util/ImageFrame;->imageByteBuffer:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/core/glcore/util/ImageFrame;->imageByteData:[B

    .line 12
    .line 13
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/core/glcore/util/ImageFrame;->imageByteBuffer:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    :cond_0
    return-object p0
.end method

.method private static native nativeImageLoader(Ljava/lang/String;Lcom/core/glcore/util/ImageFrame;)Lcom/core/glcore/util/ImageFrame;
.end method
