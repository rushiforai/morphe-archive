.class public Lcom/effectsar/labcv/effectsdk/YUVUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final NV12:I = 0x6

.field public static final NV21:I = 0x7

.field public static final ORIENTATION_0:I = 0x0

.field public static final ORIENTATION_180:I = 0x2

.field public static final ORIENTATION_270:I = 0x3

.field public static final ORIENTATION_90:I = 0x1

.field public static final RGBA:I = 0x0

.field public static final YUV420P:I = 0x5


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

.method public static native BGR2RGBA(Ljava/nio/Buffer;Ljava/nio/Buffer;III)V
.end method

.method public static native I420ToBGRA([BI[BI[BI[BIII)V
.end method

.method public static native I420ToRGBA([BI[BI[BI[BIII)V
.end method

.method public static native NV12ToBGRA([BI[BI[BIII)V
.end method

.method public static native NV12ToRGBA([BI[BI[BIII)V
.end method

.method public static native NV21ToBGRA([BI[BI[BIII)V
.end method

.method public static native NV21ToRGBA([BI[BI[BIII)V
.end method

.method public static native RGBA2BGR(Ljava/nio/Buffer;Ljava/nio/Buffer;III)V
.end method

.method public static native RGBA2YUV([B[BIII)V
.end method

.method public static native Rotate([B[BIIII)V
.end method

.method public static native YUV2RGBA([B[BIIIIIIZ)V
.end method

.method public static native YUVRESIZE([B[BIIIII)V
.end method
