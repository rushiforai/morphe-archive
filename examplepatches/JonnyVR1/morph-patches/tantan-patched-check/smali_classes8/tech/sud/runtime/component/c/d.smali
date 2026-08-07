.class public Ltech/sud/runtime/component/c/d;
.super Landroid/view/TextureView;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/component/c/d$g;,
        Ltech/sud/runtime/component/c/d$h;,
        Ltech/sud/runtime/component/c/d$f;,
        Ltech/sud/runtime/component/c/d$e;,
        Ltech/sud/runtime/component/c/d$i;,
        Ltech/sud/runtime/component/c/d$b;,
        Ltech/sud/runtime/component/c/d$a;,
        Ltech/sud/runtime/component/c/d$d;,
        Ltech/sud/runtime/component/c/d$c;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String; = "d"

.field private static final c:Ltech/sud/runtime/component/c/d$g;


# instance fields
.field private b:Ltech/sud/runtime/component/d/a;

.field private final d:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ltech/sud/runtime/component/c/d;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ltech/sud/runtime/component/c/d$f;

.field private f:Landroid/opengl/GLSurfaceView$Renderer;

.field private g:Ltech/sud/runtime/core/d$a;

.field private h:Z

.field private i:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

.field private j:Landroid/opengl/GLSurfaceView$EGLContextFactory;

.field private k:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

.field private l:Landroid/opengl/GLSurfaceView$GLWrapper;

.field private m:I

.field private n:I

.field private o:Z

.field private final p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/TextureView$SurfaceTextureListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ltech/sud/runtime/component/c/d$g;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ltech/sud/runtime/component/c/d$g;-><init>(Ltech/sud/runtime/component/c/d$1;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ltech/sud/runtime/component/c/d;->c:Ltech/sud/runtime/component/c/d$g;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ltech/sud/runtime/component/c/d;->d:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ltech/sud/runtime/component/c/d;->p:Ljava/util/List;

    .line 17
    .line 18
    invoke-direct {p0}, Ltech/sud/runtime/component/c/d;->e()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/c/d;)I
    .locals 0

    .line 57
    iget p0, p0, Ltech/sud/runtime/component/c/d;->n:I

    return p0
.end method

.method public static a(I)Ljava/lang/String;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ltech/sud/runtime/component/c/d;->b(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0

    .line 9
    :pswitch_0
    const-string p0, "EGL_CONTEXT_LOST"

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_1
    const-string p0, "EGL_BAD_SURFACE"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_2
    const-string p0, "EGL_BAD_PARAMETER"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_3
    const-string p0, "EGL_BAD_NATIVE_WINDOW"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_4
    const-string p0, "EGL_BAD_NATIVE_PIXMAP"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_5
    const-string p0, "EGL_BAD_MATCH"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_6
    const-string p0, "EGL_BAD_DISPLAY"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_7
    const-string p0, "EGL_BAD_CURRENT_SURFACE"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_8
    const-string p0, "EGL_BAD_CONTEXT"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_9
    const-string p0, "EGL_BAD_CONFIG"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_a
    const-string p0, "EGL_BAD_ATTRIBUTE"

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_b
    const-string p0, "EGL_BAD_ALLOC"

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_c
    const-string p0, "EGL_BAD_ACCESS"

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_d
    const-string p0, "EGL_NOT_INITIALIZED"

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_e
    const-string p0, "EGL_SUCCESS"

    .line 52
    .line 53
    return-object p0

    .line 54
    nop

    .line 55
    :pswitch_data_0
    .packed-switch 0x3000
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic b(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$EGLConfigChooser;
    .locals 0

    .line 20
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->i:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    return-object p0
.end method

.method private static b(I)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "0x"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic c(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$EGLContextFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->j:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c()Ljava/lang/String;
    .locals 1

    .line 4
    sget-object v0, Ltech/sud/runtime/component/c/d;->a:Ljava/lang/String;

    return-object v0
.end method

.method public static synthetic d(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->k:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d()Ltech/sud/runtime/component/c/d$g;
    .locals 1

    .line 4
    sget-object v0, Ltech/sud/runtime/component/c/d;->c:Ltech/sud/runtime/component/c/d$g;

    return-object v0
.end method

.method public static synthetic e(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$GLWrapper;
    .locals 0

    .line 5
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->l:Landroid/opengl/GLSurfaceView$GLWrapper;

    return-object p0
.end method

.method private e()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ltech/sud/runtime/component/c/d;)I
    .locals 0

    .line 12
    iget p0, p0, Ltech/sud/runtime/component/c/d;->m:I

    return p0
.end method

.method private f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "setRenderer has already been called for this instance."

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic g(Ltech/sud/runtime/component/c/d;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltech/sud/runtime/component/c/d;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$Renderer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->f:Landroid/opengl/GLSurfaceView$Renderer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Ltech/sud/runtime/component/c/d;)Ltech/sud/runtime/core/d$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->g:Ltech/sud/runtime/core/d$a;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 55
    iget-object p1, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->b:Ltech/sud/runtime/component/d/a;

    invoke-virtual {p1, p0}, Ltech/sud/runtime/component/c/d$f;->a(Ltech/sud/runtime/component/d/a;)V

    return-void
.end method

.method public a(Landroid/graphics/SurfaceTexture;III)V
    .locals 0

    .line 56
    iget-object p1, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->b:Ltech/sud/runtime/component/d/a;

    invoke-virtual {p1, p0, p3, p4}, Ltech/sud/runtime/component/c/d$f;->a(Ltech/sud/runtime/component/d/a;II)V

    return-void
.end method

.method public a_()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 2
    .line 3
    invoke-virtual {p0}, Ltech/sud/runtime/component/c/d$f;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()V
    .locals 0

    .line 22
    return-void
.end method

.method public b(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 21
    iget-object p1, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->b:Ltech/sud/runtime/component/d/a;

    invoke-virtual {p1, p0}, Ltech/sud/runtime/component/c/d$f;->b(Ltech/sud/runtime/component/d/a;)V

    return-void
.end method

.method public finalize()V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/runtime/component/c/d;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "finalize"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/runtime/component/h/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ltech/sud/runtime/component/c/d;->b:Ltech/sud/runtime/component/d/a;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ltech/sud/runtime/component/c/d$f;->e(Ltech/sud/runtime/component/d/a;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :goto_1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 25
    .line 26
    .line 27
    throw v0
.end method

.method public getDebugFlags()I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/component/c/d;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getPreserveEGLContextOnPause()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltech/sud/runtime/component/c/d;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public getRenderMode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 2
    .line 3
    invoke-virtual {p0}, Ltech/sud/runtime/component/c/d$f;->b()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onAttachedToWindow()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/TextureView;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ltech/sud/runtime/component/c/d;->a:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "onAttachedToWindow reattach ="

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-boolean v2, p0, Ltech/sud/runtime/component/c/d;->h:Z

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Ltech/sud/runtime/component/h/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Ltech/sud/runtime/component/c/d;->h:Z

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->f:Landroid/opengl/GLSurfaceView$Renderer;

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->b:Ltech/sud/runtime/component/d/a;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    const-string v2, "GameViewOnAttachedToWindowReload"

    .line 39
    .line 40
    const-string v3, ""

    .line 41
    .line 42
    invoke-virtual {v0, v2, v3}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iput-boolean v1, p0, Ltech/sud/runtime/component/c/d;->h:Z

    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    invoke-virtual {v0}, Ltech/sud/runtime/component/c/d$f;->b()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    move v0, v2

    .line 59
    :goto_0
    new-instance v3, Ltech/sud/runtime/component/c/d$f;

    .line 60
    .line 61
    iget-object v4, p0, Ltech/sud/runtime/component/c/d;->d:Ljava/lang/ref/WeakReference;

    .line 62
    .line 63
    invoke-direct {v3, v4}, Ltech/sud/runtime/component/c/d$f;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 64
    .line 65
    .line 66
    iput-object v3, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 67
    .line 68
    if-eq v0, v2, :cond_2

    .line 69
    .line 70
    invoke-virtual {v3, v0}, Ltech/sud/runtime/component/c/d$f;->a(I)V

    .line 71
    .line 72
    .line 73
    :cond_2
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 76
    .line 77
    .line 78
    :cond_3
    iput-boolean v1, p0, Ltech/sud/runtime/component/c/d;->h:Z

    .line 79
    .line 80
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/runtime/component/c/d;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onDetachedFromWindow"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/runtime/component/h/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ltech/sud/runtime/component/c/d;->b:Ltech/sud/runtime/component/d/a;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ltech/sud/runtime/component/c/d$f;->e(Ltech/sud/runtime/component/d/a;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/d;->h:Z

    .line 19
    .line 20
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sub-int/2addr p4, p2

    .line 6
    sub-int/2addr p5, p3

    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-virtual {p0, p1, p2, p4, p5}, Ltech/sud/runtime/component/c/d;->a(Landroid/graphics/SurfaceTexture;III)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 2
    .line 3
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->b:Ltech/sud/runtime/component/d/a;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/c/d$f;->c(Ltech/sud/runtime/component/d/a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 2
    .line 3
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->b:Ltech/sud/runtime/component/d/a;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/c/d$f;->d(Ltech/sud/runtime/component/d/a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->b:Ltech/sud/runtime/component/d/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v1, "GameViewOnSurfaceCreated"

    .line 6
    .line 7
    const-string v2, ""

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Ltech/sud/runtime/component/c/d;->a(Landroid/graphics/SurfaceTexture;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, p1, v0, p2, p3}, Ltech/sud/runtime/component/c/d;->a(Landroid/graphics/SurfaceTexture;III)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->p:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/view/TextureView$SurfaceTextureListener;

    .line 36
    .line 37
    invoke-interface {v0, p1, p2, p3}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->b:Ltech/sud/runtime/component/d/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v1, "GameViewOnSurfaceDestroyed"

    .line 6
    .line 7
    const-string v2, ""

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Ltech/sud/runtime/component/c/d;->b(Landroid/graphics/SurfaceTexture;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->p:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/view/TextureView$SurfaceTextureListener;

    .line 32
    .line 33
    invoke-interface {v0, p1}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p0, 0x1

    .line 38
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, p2, p3}, Ltech/sud/runtime/component/c/d;->a(Landroid/graphics/SurfaceTexture;III)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->p:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/view/TextureView$SurfaceTextureListener;

    .line 22
    .line 23
    invoke-interface {v0, p1, p2, p3}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/c/d;->a_()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->p:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/view/TextureView$SurfaceTextureListener;

    .line 21
    .line 22
    invoke-interface {v0, p1}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ltech/sud/runtime/component/c/d$f;->a(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDebugFlags(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltech/sud/runtime/component/c/d;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public setEGLConfigChooser(IIIIII)V
    .locals 8

    .line 1
    new-instance v0, Ltech/sud/runtime/component/c/d$b;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    move v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Ltech/sud/runtime/component/c/d$b;-><init>(Ltech/sud/runtime/component/c/d;IIIIII)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ltech/sud/runtime/component/c/d;->setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ltech/sud/runtime/component/c/d;->f()V

    .line 19
    iput-object p1, p0, Ltech/sud/runtime/component/c/d;->i:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    return-void
.end method

.method public setEGLConfigChooser(Z)V
    .locals 1

    .line 17
    new-instance v0, Ltech/sud/runtime/component/c/d$i;

    invoke-direct {v0, p0, p1}, Ltech/sud/runtime/component/c/d$i;-><init>(Ltech/sud/runtime/component/c/d;Z)V

    invoke-virtual {p0, v0}, Ltech/sud/runtime/component/c/d;->setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V

    return-void
.end method

.method public setEGLContextClientVersion(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltech/sud/runtime/component/c/d;->f()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ltech/sud/runtime/component/c/d;->n:I

    .line 5
    .line 6
    return-void
.end method

.method public setEGLContextFactory(Landroid/opengl/GLSurfaceView$EGLContextFactory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltech/sud/runtime/component/c/d;->f()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ltech/sud/runtime/component/c/d;->j:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    .line 5
    .line 6
    return-void
.end method

.method public setEGLWindowSurfaceFactory(Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltech/sud/runtime/component/c/d;->f()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ltech/sud/runtime/component/c/d;->k:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 5
    .line 6
    return-void
.end method

.method public setExternalInterface(Ltech/sud/runtime/component/d/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/c/d;->b:Ltech/sud/runtime/component/d/a;

    .line 2
    .line 3
    return-void
.end method

.method public setGLWrapper(Landroid/opengl/GLSurfaceView$GLWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/c/d;->l:Landroid/opengl/GLSurfaceView$GLWrapper;

    .line 2
    .line 3
    return-void
.end method

.method public setPreserveEGLContextOnPause(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltech/sud/runtime/component/c/d;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRenderMode(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ltech/sud/runtime/component/c/d$f;->a(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ltech/sud/runtime/component/c/d;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->i:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ltech/sud/runtime/component/c/d$i;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-direct {v0, p0, v1}, Ltech/sud/runtime/component/c/d$i;-><init>(Ltech/sud/runtime/component/c/d;Z)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ltech/sud/runtime/component/c/d;->i:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->j:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Ltech/sud/runtime/component/c/d$c;

    .line 22
    .line 23
    invoke-direct {v0, p0, v1}, Ltech/sud/runtime/component/c/d$c;-><init>(Ltech/sud/runtime/component/c/d;Ltech/sud/runtime/component/c/d$1;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ltech/sud/runtime/component/c/d;->j:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->k:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    new-instance v0, Ltech/sud/runtime/component/c/d$d;

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ltech/sud/runtime/component/c/d$d;-><init>(Ltech/sud/runtime/component/c/d$1;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ltech/sud/runtime/component/c/d;->k:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 38
    .line 39
    :cond_2
    iput-object p1, p0, Ltech/sud/runtime/component/c/d;->f:Landroid/opengl/GLSurfaceView$Renderer;

    .line 40
    .line 41
    instance-of v0, p1, Ltech/sud/runtime/core/d;

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    check-cast p1, Ltech/sud/runtime/core/d;

    .line 46
    .line 47
    invoke-virtual {p1}, Ltech/sud/runtime/core/d;->f()Ltech/sud/runtime/core/d$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Ltech/sud/runtime/component/c/d;->g:Ltech/sud/runtime/core/d$a;

    .line 52
    .line 53
    :cond_3
    new-instance p1, Ltech/sud/runtime/component/c/d$f;

    .line 54
    .line 55
    iget-object v0, p0, Ltech/sud/runtime/component/c/d;->d:Ljava/lang/ref/WeakReference;

    .line 56
    .line 57
    invoke-direct {p1, v0}, Ltech/sud/runtime/component/c/d$f;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Ltech/sud/runtime/component/c/d;->e:Ltech/sud/runtime/component/c/d$f;

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 63
    .line 64
    .line 65
    return-void
.end method
