.class abstract Ltech/sud/runtime/component/c/d$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/opengl/GLSurfaceView$EGLConfigChooser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/c/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "a"
.end annotation


# instance fields
.field protected a:[I

.field final synthetic b:Ltech/sud/runtime/component/c/d;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/c/d;[I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/c/d$a;->b:Ltech/sud/runtime/component/c/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p2}, Ltech/sud/runtime/component/c/d$a;->a([I)[I

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ltech/sud/runtime/component/c/d$a;->a:[I

    .line 11
    .line 12
    return-void
.end method

.method private a([I)[I
    .locals 5

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$a;->b:Ltech/sud/runtime/component/c/d;

    .line 2
    .line 3
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->a(Ltech/sud/runtime/component/c/d;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$a;->b:Ltech/sud/runtime/component/c/d;

    .line 11
    .line 12
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->a(Ltech/sud/runtime/component/c/d;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v2, 0x3

    .line 17
    if-eq v0, v2, :cond_0

    .line 18
    .line 19
    return-object p1

    .line 20
    :cond_0
    array-length v0, p1

    .line 21
    add-int/lit8 v2, v0, 0x2

    .line 22
    .line 23
    new-array v2, v2, [I

    .line 24
    .line 25
    add-int/lit8 v3, v0, -0x1

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-static {p1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 29
    .line 30
    .line 31
    const/16 p1, 0x3040

    .line 32
    .line 33
    aput p1, v2, v3

    .line 34
    .line 35
    iget-object p0, p0, Ltech/sud/runtime/component/c/d$a;->b:Ltech/sud/runtime/component/c/d;

    .line 36
    .line 37
    invoke-static {p0}, Ltech/sud/runtime/component/c/d;->a(Ltech/sud/runtime/component/c/d;)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-ne p0, v1, :cond_1

    .line 42
    .line 43
    const/4 p0, 0x4

    .line 44
    aput p0, v2, v0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/16 p0, 0x40

    .line 48
    .line 49
    aput p0, v2, v0

    .line 50
    .line 51
    :goto_0
    add-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    const/16 p0, 0x3038

    .line 54
    .line 55
    aput p0, v2, v0

    .line 56
    .line 57
    return-object v2
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
    iget-object v3, p0, Ltech/sud/runtime/component/c/d$a;->a:[I

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
    iget-object v3, p0, Ltech/sud/runtime/component/c/d$a;->a:[I

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
    invoke-virtual {p0, v1, v2, v4}, Ltech/sud/runtime/component/c/d$a;->a(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

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
