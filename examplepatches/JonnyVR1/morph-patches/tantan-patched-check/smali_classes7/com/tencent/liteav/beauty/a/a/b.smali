.class public Lcom/tencent/liteav/beauty/a/a/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected a:Lcom/tencent/liteav/beauty/a/a/a;

.field private b:Ljavax/microedition/khronos/egl/EGLSurface;

.field private c:I

.field private d:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/beauty/a/a/a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljavax/microedition/khronos/egl/EGL11;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/beauty/a/a/b;->b:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/tencent/liteav/beauty/a/a/b;->c:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/a/a/b;->d:I

    .line 12
    .line 13
    iput-object p1, p0, Lcom/tencent/liteav/beauty/a/a/b;->a:Lcom/tencent/liteav/beauty/a/a/a;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 26
    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/b;->a:Lcom/tencent/liteav/beauty/a/a/a;

    iget-object v1, p0, Lcom/tencent/liteav/beauty/a/a/b;->b:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/a/a/a;->a(Ljavax/microedition/khronos/egl/EGLSurface;)V

    .line 27
    sget-object v0, Ljavax/microedition/khronos/egl/EGL11;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    iput-object v0, p0, Lcom/tencent/liteav/beauty/a/a/b;->b:Ljavax/microedition/khronos/egl/EGLSurface;

    const/4 v0, -0x1

    .line 28
    iput v0, p0, Lcom/tencent/liteav/beauty/a/a/b;->d:I

    iput v0, p0, Lcom/tencent/liteav/beauty/a/a/b;->c:I

    return-void
.end method

.method public a(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/b;->b:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    sget-object v1, Ljavax/microedition/khronos/egl/EGL11;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/b;->a:Lcom/tencent/liteav/beauty/a/a/a;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/beauty/a/a/a;->a(II)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/tencent/liteav/beauty/a/a/b;->b:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 14
    .line 15
    iput p1, p0, Lcom/tencent/liteav/beauty/a/a/b;->c:I

    .line 16
    .line 17
    iput p2, p0, Lcom/tencent/liteav/beauty/a/a/b;->d:I

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p0, "surface already created"

    .line 21
    .line 22
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/b;->a:Lcom/tencent/liteav/beauty/a/a/a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/liteav/beauty/a/a/b;->b:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/beauty/a/a/a;->b(Ljavax/microedition/khronos/egl/EGLSurface;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
