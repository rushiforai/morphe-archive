.class public Ltech/sud/runtime/core/JNIShell;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "sud"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static native call(JIIILjava/lang/String;)V
.end method

.method public static native create(J)J
.end method

.method public static native destroy(J)V
.end method

.method public static native deviceIs64Bit()Z
.end method

.method public static native gDestroy(J)V
.end method

.method public static native gInitOrResize(JIIIF)V
.end method

.method public static native gPause(J)V
.end method

.method public static native gRender(J)Z
.end method

.method public static native gResume(J)V
.end method

.method public static native gTextBitmap(JIILandroid/graphics/Bitmap;II)V
.end method

.method public static native onTouch(JI[I[F[FD)V
.end method

.method public static native setJNIContext(JLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
.end method

.method public static native setLogCallback(Ljava/lang/Object;)V
.end method

.method public static native setNotchInfo(JZII)V
.end method

.method public static native setOption(JLjava/lang/String;Ljava/lang/String;)V
.end method

.method public static native setScreenSize(JII)V
.end method

.method public static native version(I)Ljava/lang/String;
.end method
