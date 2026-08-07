.class public Lproject/android/imageprocessing/GLTextureView;
.super Landroid/view/TextureView;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lproject/android/imageprocessing/GLTextureView$k;,
        Lproject/android/imageprocessing/GLTextureView$l;,
        Lproject/android/imageprocessing/GLTextureView$h;,
        Lproject/android/imageprocessing/GLTextureView$g;,
        Lproject/android/imageprocessing/GLTextureView$f;,
        Lproject/android/imageprocessing/GLTextureView$j;,
        Lproject/android/imageprocessing/GLTextureView$n;,
        Lproject/android/imageprocessing/GLTextureView$d;,
        Lproject/android/imageprocessing/GLTextureView$e;,
        Lproject/android/imageprocessing/GLTextureView$c;,
        Lproject/android/imageprocessing/GLTextureView$m;,
        Lproject/android/imageprocessing/GLTextureView$i;,
        Lproject/android/imageprocessing/GLTextureView$b;
    }
.end annotation


# static fields
.field private static final k:Lproject/android/imageprocessing/GLTextureView$k;


# instance fields
.field private final a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lproject/android/imageprocessing/GLTextureView;",
            ">;"
        }
    .end annotation
.end field

.field private b:Lproject/android/imageprocessing/GLTextureView$j;

.field private c:Landroid/opengl/GLSurfaceView$Renderer;

.field private d:Z

.field private e:Lproject/android/imageprocessing/GLTextureView$f;

.field private f:Lproject/android/imageprocessing/GLTextureView$g;

.field private g:Lproject/android/imageprocessing/GLTextureView$h;

.field private h:I

.field private i:I

.field private j:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lproject/android/imageprocessing/GLTextureView$k;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lproject/android/imageprocessing/GLTextureView$k;-><init>(Lproject/android/imageprocessing/GLTextureView$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lproject/android/imageprocessing/GLTextureView;->k:Lproject/android/imageprocessing/GLTextureView$k;

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
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-direct {p0}, Lproject/android/imageprocessing/GLTextureView;->k()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView;->a:Ljava/lang/ref/WeakReference;

    .line 17
    invoke-direct {p0}, Lproject/android/imageprocessing/GLTextureView;->k()V

    return-void
.end method

.method public static synthetic a(Lproject/android/imageprocessing/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->c:Landroid/opengl/GLSurfaceView$Renderer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lproject/android/imageprocessing/GLTextureView;)I
    .locals 0

    .line 1
    iget p0, p0, Lproject/android/imageprocessing/GLTextureView;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lproject/android/imageprocessing/GLTextureView;)Lproject/android/imageprocessing/GLTextureView$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->e:Lproject/android/imageprocessing/GLTextureView$f;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lproject/android/imageprocessing/GLTextureView;)Lproject/android/imageprocessing/GLTextureView$g;
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->f:Lproject/android/imageprocessing/GLTextureView$g;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lproject/android/imageprocessing/GLTextureView;)Lproject/android/imageprocessing/GLTextureView$h;
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->g:Lproject/android/imageprocessing/GLTextureView$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lproject/android/imageprocessing/GLTextureView;)Lproject/android/imageprocessing/GLTextureView$l;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic g(Lproject/android/imageprocessing/GLTextureView;)I
    .locals 0

    .line 1
    iget p0, p0, Lproject/android/imageprocessing/GLTextureView;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h()Lproject/android/imageprocessing/GLTextureView$k;
    .locals 1

    .line 1
    sget-object v0, Lproject/android/imageprocessing/GLTextureView;->k:Lproject/android/imageprocessing/GLTextureView$k;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic i(Lproject/android/imageprocessing/GLTextureView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lproject/android/imageprocessing/GLTextureView;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method private j()V
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

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

.method private k()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lproject/android/imageprocessing/GLTextureView$j;->g()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    :goto_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :goto_1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 16
    .line 17
    .line 18
    throw v0
.end method

.method public getDebugFlags()I
    .locals 0

    .line 1
    iget p0, p0, Lproject/android/imageprocessing/GLTextureView;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public getPreserveEGLContextOnPause()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lproject/android/imageprocessing/GLTextureView;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public getRenderMode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lproject/android/imageprocessing/GLTextureView$j;->c()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public l()V
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lproject/android/imageprocessing/GLTextureView$j;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/TextureView;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lproject/android/imageprocessing/GLTextureView;->d:Z

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->c:Landroid/opengl/GLSurfaceView$Renderer;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lproject/android/imageprocessing/GLTextureView$j;->c()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v0, v1

    .line 23
    :goto_0
    new-instance v2, Lproject/android/imageprocessing/GLTextureView$j;

    .line 24
    .line 25
    iget-object v3, p0, Lproject/android/imageprocessing/GLTextureView;->a:Ljava/lang/ref/WeakReference;

    .line 26
    .line 27
    invoke-direct {v2, v3}, Lproject/android/imageprocessing/GLTextureView$j;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 28
    .line 29
    .line 30
    iput-object v2, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 31
    .line 32
    if-eq v0, v1, :cond_1

    .line 33
    .line 34
    invoke-virtual {v2, v0}, Lproject/android/imageprocessing/GLTextureView$j;->j(I)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 40
    .line 41
    .line 42
    :cond_2
    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Lproject/android/imageprocessing/GLTextureView;->d:Z

    .line 44
    .line 45
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lproject/android/imageprocessing/GLTextureView$j;->g()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lproject/android/imageprocessing/GLTextureView;->d:Z

    .line 10
    .line 11
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/TextureView;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Lproject/android/imageprocessing/GLTextureView$j;->e(II)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lproject/android/imageprocessing/GLTextureView$j;->m()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lproject/android/imageprocessing/GLTextureView$j;->n()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x1

    .line 9
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p2, p3}, Lproject/android/imageprocessing/GLTextureView$j;->e(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lproject/android/imageprocessing/GLTextureView$j;->c()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lproject/android/imageprocessing/GLTextureView;->l()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setDebugFlags(I)V
    .locals 0

    .line 1
    iput p1, p0, Lproject/android/imageprocessing/GLTextureView;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public setEGLConfigChooser(Lproject/android/imageprocessing/GLTextureView$f;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Lproject/android/imageprocessing/GLTextureView;->j()V

    .line 11
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView;->e:Lproject/android/imageprocessing/GLTextureView$f;

    return-void
.end method

.method public setEGLConfigChooser(Z)V
    .locals 1

    .line 1
    new-instance v0, Lproject/android/imageprocessing/GLTextureView$n;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lproject/android/imageprocessing/GLTextureView$n;-><init>(Lproject/android/imageprocessing/GLTextureView;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lproject/android/imageprocessing/GLTextureView;->setEGLConfigChooser(Lproject/android/imageprocessing/GLTextureView$f;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setEGLContextClientVersion(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lproject/android/imageprocessing/GLTextureView;->j()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lproject/android/imageprocessing/GLTextureView;->i:I

    .line 5
    .line 6
    return-void
.end method

.method public setEGLContextFactory(Lproject/android/imageprocessing/GLTextureView$g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lproject/android/imageprocessing/GLTextureView;->j()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView;->f:Lproject/android/imageprocessing/GLTextureView$g;

    .line 5
    .line 6
    return-void
.end method

.method public setEGLWindowSurfaceFactory(Lproject/android/imageprocessing/GLTextureView$h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lproject/android/imageprocessing/GLTextureView;->j()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView;->g:Lproject/android/imageprocessing/GLTextureView$h;

    .line 5
    .line 6
    return-void
.end method

.method public setGLWrapper(Lproject/android/imageprocessing/GLTextureView$l;)V
    .locals 0

    return-void
.end method

.method public setPreserveEGLContextOnPause(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lproject/android/imageprocessing/GLTextureView;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRenderMode(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lproject/android/imageprocessing/GLTextureView$j;->j(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lproject/android/imageprocessing/GLTextureView;->j()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->e:Lproject/android/imageprocessing/GLTextureView$f;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Lproject/android/imageprocessing/GLTextureView$n;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-direct {v0, p0, v1}, Lproject/android/imageprocessing/GLTextureView$n;-><init>(Lproject/android/imageprocessing/GLTextureView;Z)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->e:Lproject/android/imageprocessing/GLTextureView$f;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->f:Lproject/android/imageprocessing/GLTextureView$g;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Lproject/android/imageprocessing/GLTextureView$d;

    .line 22
    .line 23
    invoke-direct {v0, p0, v1}, Lproject/android/imageprocessing/GLTextureView$d;-><init>(Lproject/android/imageprocessing/GLTextureView;Lproject/android/imageprocessing/GLTextureView$a;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->f:Lproject/android/imageprocessing/GLTextureView$g;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->g:Lproject/android/imageprocessing/GLTextureView$h;

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    new-instance v0, Lproject/android/imageprocessing/GLTextureView$e;

    .line 33
    .line 34
    invoke-direct {v0, v1}, Lproject/android/imageprocessing/GLTextureView$e;-><init>(Lproject/android/imageprocessing/GLTextureView$a;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->g:Lproject/android/imageprocessing/GLTextureView$h;

    .line 38
    .line 39
    :cond_2
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView;->c:Landroid/opengl/GLSurfaceView$Renderer;

    .line 40
    .line 41
    new-instance p1, Lproject/android/imageprocessing/GLTextureView$j;

    .line 42
    .line 43
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView;->a:Ljava/lang/ref/WeakReference;

    .line 44
    .line 45
    invoke-direct {p1, v0}, Lproject/android/imageprocessing/GLTextureView$j;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView;->b:Lproject/android/imageprocessing/GLTextureView$j;

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
