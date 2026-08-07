.class public Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;
.super Landroid/view/SurfaceView;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$a;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$e;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$d;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$g;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$c;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$f;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$k;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$m;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$b;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$l;,
        Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;
    }
.end annotation


# static fields
.field private static final a:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;


# instance fields
.field protected b:Z

.field protected c:Z

.field protected final d:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;",
            ">;"
        }
    .end annotation
.end field

.field protected e:Z

.field protected f:Z

.field private g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

.field private h:Landroid/opengl/GLSurfaceView$Renderer;

.field private i:Z

.field private j:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$e;

.field private k:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$f;

.field private l:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$g;

.field private m:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$k;

.field private n:I

.field private o:I

.field private p:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$1;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->a:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->b:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->c:Z

    .line 8
    .line 9
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->d:Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->a()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->b:Z

    .line 22
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->c:Z

    .line 23
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->d:Ljava/lang/ref/WeakReference;

    .line 24
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->a()V

    return-void
.end method

.method private a()V
    .locals 1

    .line 17
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 18
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)Z
    .locals 0

    .line 19
    iget-boolean p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->p:Z

    return p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)Landroid/opengl/GLSurfaceView$Renderer;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->h:Landroid/opengl/GLSurfaceView$Renderer;

    return-object p0
.end method

.method public static synthetic c(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->j:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$f;
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->k:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$f;

    return-object p0
.end method

.method public static synthetic e(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$g;
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->l:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$g;

    return-object p0
.end method

.method public static synthetic f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->a:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic f(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$k;
    .locals 0

    .line 4
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->m:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$k;

    return-object p0
.end method

.method public static synthetic g(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)I
    .locals 0

    .line 12
    iget p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->n:I

    return p0
.end method

.method private g()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

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

.method public static synthetic h(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->o:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public a(IIIIII)V
    .locals 8

    .line 1
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$b;

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
    invoke-direct/range {v0 .. v7}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$b;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;IIIIII)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->setEGLConfigChooser(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$e;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public b()V
    .locals 0

    .line 37
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->b:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->c:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p1, "TXCGLSurfaceViewBase"

    .line 14
    .line 15
    const-string v0, "background capture destroy surface when not enable background run"

    .line 16
    .line 17
    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 21
    .line 22
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$2;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$2;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->a(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->g()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public c()I
    .locals 0

    .line 4
    const/4 p0, 0x0

    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->b()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->h()V
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
    iget p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getEGLHelper()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->c()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPreserveEGLContextOnPause()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public getRenderMode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->e()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onAttachedToWindow()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/SurfaceView;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->i:Z

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->h:Landroid/opengl/GLSurfaceView$Renderer;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->e()I

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
    new-instance v2, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->d:Ljava/lang/ref/WeakReference;

    .line 26
    .line 27
    invoke-direct {v2, v3}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 28
    .line 29
    .line 30
    iput-object v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 31
    .line 32
    if-eq v0, v1, :cond_1

    .line 33
    .line 34
    invoke-virtual {v2, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->a(I)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 40
    .line 41
    .line 42
    :cond_2
    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->i:Z

    .line 44
    .line 45
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "TXCGLSurfaceViewBase"

    .line 10
    .line 11
    const-string v1, "background capture destroy surface when onDetachedFromWindow"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 17
    .line 18
    new-instance v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$3;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$3;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->a(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->g()V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->h()V

    .line 36
    .line 37
    .line 38
    :cond_1
    const/4 v0, 0x1

    .line 39
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->i:Z

    .line 40
    .line 41
    invoke-super {p0}, Landroid/view/SurfaceView;->onDetachedFromWindow()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public setDebugFlags(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->n:I

    .line 2
    .line 3
    return-void
.end method

.method public setEGLConfigChooser(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$e;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g()V

    .line 11
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->j:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$e;

    return-void
.end method

.method public setEGLConfigChooser(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$m;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$m;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->setEGLConfigChooser(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$e;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setEGLContextClientVersion(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->o:I

    .line 5
    .line 6
    return-void
.end method

.method public setEGLContextFactory(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->k:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$f;

    .line 5
    .line 6
    return-void
.end method

.method public setEGLWindowSurfaceFactory(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->l:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$g;

    .line 5
    .line 6
    return-void
.end method

.method public setGLWrapper(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->m:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$k;

    .line 2
    .line 3
    return-void
.end method

.method public setPreserveEGLContextOnPause(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRenderMode(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->a(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->j:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$e;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$m;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-direct {v0, p0, v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$m;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;Z)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->j:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$e;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->k:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$f;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$c;

    .line 22
    .line 23
    invoke-direct {v0, p0, v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$c;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$1;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->k:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$f;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->l:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$g;

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$d;

    .line 33
    .line 34
    invoke-direct {v0, v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$d;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$1;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->l:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$g;

    .line 38
    .line 39
    :cond_2
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->h:Landroid/opengl/GLSurfaceView$Renderer;

    .line 40
    .line 41
    new-instance p1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 42
    .line 43
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->d:Ljava/lang/ref/WeakReference;

    .line 44
    .line 45
    invoke-direct {p1, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 51
    .line 52
    .line 53
    const-string p0, "TXCGLSurfaceViewBase"

    .line 54
    .line 55
    const-string p1, "setRenderer-->mGLThread.start"

    .line 56
    .line 57
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public setRunInBackground(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 2
    .line 3
    invoke-virtual {p0, p3, p4}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->a(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->f()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->setRunInBackground(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->setRunInBackground(Z)V

    .line 3
    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->b:Z

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 10
    .line 11
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$1;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$1;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->a(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->g:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->g()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
