.class abstract Lproject/android/imageprocessing/GLTextureView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lproject/android/imageprocessing/GLTextureView$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lproject/android/imageprocessing/GLTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "b"
.end annotation


# instance fields
.field protected a:[I

.field final synthetic b:Lproject/android/imageprocessing/GLTextureView;


# direct methods
.method public constructor <init>(Lproject/android/imageprocessing/GLTextureView;[I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView$b;->b:Lproject/android/imageprocessing/GLTextureView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p2}, Lproject/android/imageprocessing/GLTextureView$b;->b([I)[I

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView$b;->a:[I

    .line 11
    .line 12
    return-void
.end method

.method private b([I)[I
    .locals 3

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView$b;->b:Lproject/android/imageprocessing/GLTextureView;

    .line 2
    .line 3
    invoke-static {p0}, Lproject/android/imageprocessing/GLTextureView;->b(Lproject/android/imageprocessing/GLTextureView;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x2

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    return-object p1

    .line 11
    :cond_0
    array-length p0, p1

    .line 12
    add-int/lit8 v0, p0, 0x2

    .line 13
    .line 14
    new-array v0, v0, [I

    .line 15
    .line 16
    add-int/lit8 v1, p0, -0x1

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    .line 21
    .line 22
    const/16 p1, 0x3040

    .line 23
    .line 24
    aput p1, v0, v1

    .line 25
    .line 26
    const/4 p1, 0x4

    .line 27
    aput p1, v0, p0

    .line 28
    .line 29
    add-int/lit8 p0, p0, 0x1

    .line 30
    .line 31
    const/16 p1, 0x3038

    .line 32
    .line 33
    aput p1, v0, p0

    .line 34
    .line 35
    return-object v0
.end method


# virtual methods
.method public abstract a(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
.end method

.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v6, v0, [I

    .line 3
    .line 4
    iget-object v3, p0, Lproject/android/imageprocessing/GLTextureView$b;->a:[I

    .line 5
    .line 6
    const/4 v4, 0x0

    .line 7
    const/4 v5, 0x0

    .line 8
    move-object v1, p1

    .line 9
    move-object v2, p2

    .line 10
    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 p2, 0x0

    .line 15
    if-eqz p1, :cond_3

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    aget v5, v6, p1

    .line 19
    .line 20
    if-lez v5, :cond_2

    .line 21
    .line 22
    new-array v4, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 23
    .line 24
    iget-object v3, p0, Lproject/android/imageprocessing/GLTextureView$b;->a:[I

    .line 25
    .line 26
    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, v1, v2, v4}, Lproject/android/imageprocessing/GLTextureView$b;->a(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_0
    const-string p0, "No config chosen"

    .line 40
    .line 41
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-object p2

    .line 45
    :cond_1
    const-string p0, "eglChooseConfig#2 failed"

    .line 46
    .line 47
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object p2

    .line 51
    :cond_2
    const-string p0, "No configs match configSpec"

    .line 52
    .line 53
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-object p2

    .line 57
    :cond_3
    const-string p0, "eglChooseConfig failed"

    .line 58
    .line 59
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-object p2
.end method
