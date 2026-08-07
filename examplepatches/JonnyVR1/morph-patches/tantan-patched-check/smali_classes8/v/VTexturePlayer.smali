.class public Lv/VTexturePlayer;
.super Landroid/view/TextureView;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/VTexturePlayer$b;,
        Lv/VTexturePlayer$a;,
        Lv/VTexturePlayer$c;
    }
.end annotation


# static fields
.field public static x:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Lv/VTexturePlayer$b;

.field public b:D

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:J

.field public i:J

.field public j:Z

.field public k:Lv/VTexturePlayer$c;

.field public l:Ll/y20;

.field public m:Ljava/lang/String;

.field public n:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public o:F

.field public p:Z

.field public q:Z

.field public r:Landroid/view/Surface;

.field public s:Z

.field public t:Ll/azl;

.field public u:Landroid/net/Uri;

.field public v:Z

.field public w:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lv/VTexturePlayer;->x:Lrx/subjects/b;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lv/VTexturePlayer$b;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lv/VTexturePlayer;->c:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lv/VTexturePlayer;->d:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lv/VTexturePlayer;->e:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Lv/VTexturePlayer;->f:Z

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lv/VTexturePlayer;->g:Z

    .line 15
    .line 16
    const-wide/16 v1, -0x1

    .line 17
    .line 18
    iput-wide v1, p0, Lv/VTexturePlayer;->h:J

    .line 19
    .line 20
    iput-wide v1, p0, Lv/VTexturePlayer;->i:J

    .line 21
    .line 22
    iput-boolean v0, p0, Lv/VTexturePlayer;->j:Z

    .line 23
    .line 24
    const-string v1, ""

    .line 25
    .line 26
    iput-object v1, p0, Lv/VTexturePlayer;->m:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    iput-object v1, p0, Lv/VTexturePlayer;->n:Lrx/c;

    .line 30
    .line 31
    const/high16 v1, -0x40800000    # -1.0f

    .line 32
    .line 33
    iput v1, p0, Lv/VTexturePlayer;->o:F

    .line 34
    .line 35
    invoke-virtual {p0, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 36
    .line 37
    .line 38
    iput-boolean v0, p0, Lv/VTexturePlayer;->p:Z

    .line 39
    .line 40
    iput-boolean p1, p0, Lv/VTexturePlayer;->q:Z

    .line 41
    .line 42
    iput-boolean p1, p0, Lv/VTexturePlayer;->v:Z

    .line 43
    .line 44
    iput-object p2, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic a(Lv/VTexturePlayer;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/VTexturePlayer;->l(I)V

    return-void
.end method

.method public static synthetic b(Lv/VTexturePlayer;Ljava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lv/VTexturePlayer;->o(Ljava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c(Lv/VTexturePlayer;Ljava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lv/VTexturePlayer;->p(Ljava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic d(Lv/VTexturePlayer;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lv/VTexturePlayer;->n(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic e(Ll/azl;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/azl;->release()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lv/VTexturePlayer;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/VTexturePlayer;->q(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic g(Lv/VTexturePlayer;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/VTexturePlayer;->m(Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public final h(IID)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lv/VTexturePlayer;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    int-to-double v0, p1

    .line 6
    mul-double/2addr v0, p3

    .line 7
    double-to-int v0, v0

    .line 8
    if-le p2, v0, :cond_1

    .line 9
    .line 10
    :cond_0
    int-to-double v0, p2

    .line 11
    div-double/2addr v0, p3

    .line 12
    double-to-int p3, v0

    .line 13
    move v0, p2

    .line 14
    goto :goto_1

    .line 15
    :cond_1
    :goto_0
    move p3, p1

    .line 16
    goto :goto_1

    .line 17
    :cond_2
    int-to-double v0, p1

    .line 18
    mul-double/2addr v0, p3

    .line 19
    double-to-int v0, v0

    .line 20
    if-le p2, v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :goto_1
    sub-int p4, p1, p3

    .line 24
    .line 25
    div-int/lit8 p4, p4, 0x2

    .line 26
    .line 27
    sub-int v1, p2, v0

    .line 28
    .line 29
    div-int/lit8 v1, v1, 0x2

    .line 30
    .line 31
    new-instance v2, Landroid/graphics/Matrix;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v2}, Landroid/view/TextureView;->getTransform(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    .line 37
    .line 38
    .line 39
    int-to-float p3, p3

    .line 40
    int-to-float p1, p1

    .line 41
    div-float/2addr p3, p1

    .line 42
    int-to-float p1, v0

    .line 43
    int-to-float p2, p2

    .line 44
    div-float/2addr p1, p2

    .line 45
    invoke-virtual {v2, p3, p1}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 46
    .line 47
    .line 48
    int-to-float p1, p4

    .line 49
    int-to-float p2, v1

    .line 50
    invoke-virtual {v2, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v2}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public i(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VTexturePlayer;->w:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lv/VTexturePlayer;->q:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lv/VTexturePlayer;->s:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lv/VTexturePlayer;->v:Z

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lv/VTexturePlayer;->p:Z

    .line 15
    .line 16
    iget-object v0, p0, Lv/VTexturePlayer;->u:Landroid/net/Uri;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iput-object v1, p0, Lv/VTexturePlayer;->u:Landroid/net/Uri;

    .line 22
    .line 23
    const-string v0, ""

    .line 24
    .line 25
    iput-object v0, p0, Lv/VTexturePlayer;->m:Ljava/lang/String;

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    :try_start_0
    invoke-interface {v0}, Ll/azl;->reset()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catch_0
    move-exception v0

    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 42
    .line 43
    invoke-interface {v0}, Ll/azl;->release()V

    .line 44
    .line 45
    .line 46
    :cond_1
    if-eqz p1, :cond_2

    .line 47
    .line 48
    iget-object p1, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/view/Surface;->release()V

    .line 53
    .line 54
    .line 55
    iput-object v1, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/VTexturePlayer;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic l(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 13
    .line 14
    invoke-interface {p0}, Lv/VTexturePlayer$b;->d()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic m(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lv/VTexturePlayer;->j:Z

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lv/VTexturePlayer;->j:Z

    .line 13
    .line 14
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Lv/VTexturePlayer;->h:J

    .line 19
    .line 20
    return-void
.end method

.method public final synthetic n(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lv/VTexturePlayer;->h:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p2, v0, v2

    .line 6
    .line 7
    if-lez p2, :cond_0

    .line 8
    .line 9
    const-wide/16 v0, -0x1

    .line 10
    .line 11
    iput-wide v0, p0, Lv/VTexturePlayer;->h:J

    .line 12
    .line 13
    :cond_0
    iget-object p2, p0, Lv/VTexturePlayer;->m:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/azl;->start()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public final synthetic o(Ljava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p3, 0x3

    .line 6
    if-ne p1, p3, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 9
    .line 10
    invoke-interface {p1}, Lv/VTexturePlayer$b;->y()V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lv/VTexturePlayer;->f:Z

    .line 15
    .line 16
    iget-object p1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 17
    .line 18
    const/4 p3, 0x0

    .line 19
    invoke-interface {p1, p3}, Ll/azl;->a(Ll/a30;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lv/VTexturePlayer;->k:Lv/VTexturePlayer$c;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-interface {p1}, Lv/VTexturePlayer$c;->a()V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 30
    .line 31
    if-eqz p1, :cond_3

    .line 32
    .line 33
    instance-of p1, p1, Ll/cyh0;

    .line 34
    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/16 p3, 0x2bd

    .line 42
    .line 43
    if-ne p1, p3, :cond_1

    .line 44
    .line 45
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    iput-wide v0, p0, Lv/VTexturePlayer;->i:J

    .line 50
    .line 51
    iget-object p1, p0, Lv/VTexturePlayer;->k:Lv/VTexturePlayer$c;

    .line 52
    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    invoke-interface {p1}, Lv/VTexturePlayer$c;->O()V

    .line 56
    .line 57
    .line 58
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    const/16 p2, 0x2be

    .line 63
    .line 64
    if-ne p1, p2, :cond_3

    .line 65
    .line 66
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 67
    .line 68
    .line 69
    move-result-wide p1

    .line 70
    iget-wide v0, p0, Lv/VTexturePlayer;->i:J

    .line 71
    .line 72
    sub-long/2addr p1, v0

    .line 73
    iget-object p3, p0, Lv/VTexturePlayer;->k:Lv/VTexturePlayer$c;

    .line 74
    .line 75
    if-eqz p3, :cond_2

    .line 76
    .line 77
    invoke-interface {p3, p1, p2}, Lv/VTexturePlayer$c;->c(J)V

    .line 78
    .line 79
    .line 80
    :cond_2
    const-wide/16 p1, -0x1

    .line 81
    .line 82
    iput-wide p1, p0, Lv/VTexturePlayer;->i:J

    .line 83
    .line 84
    :cond_3
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Landroid/view/Surface;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 14
    .line 15
    iget-object p1, p0, Lv/VTexturePlayer;->w:Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 21
    .line 22
    if-nez p1, :cond_2

    .line 23
    .line 24
    iget-object p1, p0, Lv/VTexturePlayer;->u:Landroid/net/Uri;

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "http"

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    new-instance p1, Ll/cyh0;

    .line 41
    .line 42
    invoke-direct {p1}, Ll/cyh0;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 46
    .line 47
    iget-boolean v0, p0, Lv/VTexturePlayer;->e:Z

    .line 48
    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/cyh0;->j()V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    new-instance p1, Ll/aqh0;

    .line 56
    .line 57
    invoke-direct {p1}, Ll/aqh0;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    invoke-interface {p1}, Ll/azl;->reset()V

    .line 64
    .line 65
    .line 66
    :cond_3
    :goto_0
    iget-object p1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 67
    .line 68
    iget-object v0, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 69
    .line 70
    invoke-interface {p1, v0}, Ll/azl;->setSurface(Landroid/view/Surface;)V

    .line 71
    .line 72
    .line 73
    iget-boolean p1, p0, Lv/VTexturePlayer;->v:Z

    .line 74
    .line 75
    if-eqz p1, :cond_4

    .line 76
    .line 77
    iget-wide v0, p0, Lv/VTexturePlayer;->b:D

    .line 78
    .line 79
    invoke-virtual {p0, p2, p3, v0, v1}, Lv/VTexturePlayer;->h(IID)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lv/VTexturePlayer;->t()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_4
    iget-boolean p1, p0, Lv/VTexturePlayer;->q:Z

    .line 87
    .line 88
    if-eqz p1, :cond_5

    .line 89
    .line 90
    iget-object p1, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 91
    .line 92
    if-eqz p1, :cond_5

    .line 93
    .line 94
    const/4 p1, 0x0

    .line 95
    iput-boolean p1, p0, Lv/VTexturePlayer;->s:Z

    .line 96
    .line 97
    const/4 p1, 0x1

    .line 98
    iput-boolean p1, p0, Lv/VTexturePlayer;->p:Z

    .line 99
    .line 100
    iget-object p1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 101
    .line 102
    invoke-interface {p1}, Ll/azl;->reset()V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 106
    .line 107
    invoke-interface {p0}, Lv/VTexturePlayer$b;->d()V

    .line 108
    .line 109
    .line 110
    :cond_5
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 1

    .line 1
    iget-object p1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ll/azl;->e()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 9
    .line 10
    new-instance v0, Ll/b0l0;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/b0l0;-><init>(Ll/azl;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ll/xhi0;->a(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/TextureView;->onVisibilityChanged(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x4

    .line 5
    if-ne p2, p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lv/VTexturePlayer;->g:Z

    .line 9
    .line 10
    const-wide/16 p1, -0x1

    .line 11
    .line 12
    iput-wide p1, p0, Lv/VTexturePlayer;->h:J

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic p(Ljava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lv/VTexturePlayer;->d:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const v0, -0x20464f45

    .line 10
    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lv/VTexturePlayer;->l:Ll/y20;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-interface {p1, v0, v1}, Lv/VTexturePlayer$b;->onError(II)V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Lv/VTexturePlayer;->p:Z

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lv/VTexturePlayer;->s:Z

    .line 39
    .line 40
    iget-object p1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 41
    .line 42
    invoke-interface {p1}, Ll/azl;->reset()V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 46
    .line 47
    invoke-interface {p1}, Lv/VTexturePlayer$b;->d()V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lv/VTexturePlayer;->k:Lv/VTexturePlayer$c;

    .line 51
    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-interface {p0, p1, p2}, Lv/VTexturePlayer$c;->b(II)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public final synthetic q(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 2
    .line 3
    invoke-interface {p1}, Lv/VTexturePlayer$b;->onComplete()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lv/VTexturePlayer;->q:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lv/VTexturePlayer;->s:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Lv/VTexturePlayer;->g:Z

    .line 12
    .line 13
    const-wide/16 v0, -0x1

    .line 14
    .line 15
    iput-wide v0, p0, Lv/VTexturePlayer;->h:J

    .line 16
    .line 17
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lv/VTexturePlayer;->v:Z

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lv/VTexturePlayer;->q:Z

    .line 6
    .line 7
    iget-object v1, p0, Lv/VTexturePlayer;->u:Landroid/net/Uri;

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    iget-object v1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v1}, Ll/azl;->isPlaying()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/azl;->pause()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-boolean v1, p0, Lv/VTexturePlayer;->s:Z

    .line 28
    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    iput-boolean v0, p0, Lv/VTexturePlayer;->p:Z

    .line 32
    .line 33
    iget-object v0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 34
    .line 35
    invoke-interface {v0}, Ll/azl;->reset()V

    .line 36
    .line 37
    .line 38
    iget-boolean v0, p0, Lv/VTexturePlayer;->f:Z

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    const/4 v0, 0x4

    .line 43
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    iget-object p0, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 47
    .line 48
    invoke-interface {p0}, Lv/VTexturePlayer$b;->onPause()V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void
.end method

.method public s(Landroid/net/Uri;DLjava/lang/String;ZII)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p5, :cond_0

    .line 3
    .line 4
    invoke-static {p6, v0}, Ll/o1j0;->i(IZ)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x4

    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p5, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 13
    .line 14
    if-nez p5, :cond_2

    .line 15
    .line 16
    iget-object p5, p0, Lv/VTexturePlayer;->w:Ljava/lang/Runnable;

    .line 17
    .line 18
    if-nez p5, :cond_1

    .line 19
    .line 20
    new-instance p5, Ll/c0l0;

    .line 21
    .line 22
    invoke-direct {p5, p0, p7}, Ll/c0l0;-><init>(Lv/VTexturePlayer;I)V

    .line 23
    .line 24
    .line 25
    iput-object p5, p0, Lv/VTexturePlayer;->w:Ljava/lang/Runnable;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-static {p5}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object p5

    .line 35
    iget-object p6, p0, Lv/VTexturePlayer;->w:Ljava/lang/Runnable;

    .line 36
    .line 37
    const-wide/16 v1, 0x2710

    .line 38
    .line 39
    invoke-static {p5, p6, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 40
    .line 41
    .line 42
    :cond_2
    const/4 p5, 0x0

    .line 43
    invoke-virtual {p0, p5}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    iget-object p6, p0, Lv/VTexturePlayer;->u:Landroid/net/Uri;

    .line 47
    .line 48
    if-nez p6, :cond_3

    .line 49
    .line 50
    iput-object p1, p0, Lv/VTexturePlayer;->u:Landroid/net/Uri;

    .line 51
    .line 52
    iput-wide p2, p0, Lv/VTexturePlayer;->b:D

    .line 53
    .line 54
    iput-object p4, p0, Lv/VTexturePlayer;->m:Ljava/lang/String;

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_3
    iget-object p6, p0, Lv/VTexturePlayer;->m:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p6, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p6

    .line 63
    if-nez p6, :cond_6

    .line 64
    .line 65
    iput-object p1, p0, Lv/VTexturePlayer;->u:Landroid/net/Uri;

    .line 66
    .line 67
    iput-wide p2, p0, Lv/VTexturePlayer;->b:D

    .line 68
    .line 69
    iput-object p4, p0, Lv/VTexturePlayer;->m:Ljava/lang/String;

    .line 70
    .line 71
    iget-object p2, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 72
    .line 73
    if-eqz p2, :cond_5

    .line 74
    .line 75
    iget-object p2, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 76
    .line 77
    if-eqz p2, :cond_5

    .line 78
    .line 79
    invoke-virtual {p0}, Lv/VTexturePlayer;->u()Z

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    if-eqz p2, :cond_4

    .line 84
    .line 85
    iget-object p2, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 86
    .line 87
    invoke-interface {p2}, Ll/azl;->pause()V

    .line 88
    .line 89
    .line 90
    :cond_4
    iget-object p2, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 91
    .line 92
    invoke-interface {p2}, Ll/azl;->reset()V

    .line 93
    .line 94
    .line 95
    :cond_5
    iput-boolean v0, p0, Lv/VTexturePlayer;->p:Z

    .line 96
    .line 97
    iput-boolean p5, p0, Lv/VTexturePlayer;->s:Z

    .line 98
    .line 99
    :cond_6
    :goto_1
    sget-object p2, Lv/VTexturePlayer;->x:Lrx/subjects/b;

    .line 100
    .line 101
    sget-object p3, Ll/uxj0;->a:Ll/uxj0;

    .line 102
    .line 103
    invoke-virtual {p2, p3}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    iput-boolean p5, p0, Lv/VTexturePlayer;->q:Z

    .line 107
    .line 108
    iget-boolean p2, p0, Lv/VTexturePlayer;->s:Z

    .line 109
    .line 110
    const-wide/16 p6, -0x1

    .line 111
    .line 112
    if-eqz p2, :cond_7

    .line 113
    .line 114
    iput-boolean p5, p0, Lv/VTexturePlayer;->s:Z

    .line 115
    .line 116
    iget-object p2, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 117
    .line 118
    if-eqz p2, :cond_b

    .line 119
    .line 120
    iget-object p2, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 121
    .line 122
    if-eqz p2, :cond_b

    .line 123
    .line 124
    invoke-interface {p2}, Ll/azl;->start()V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 128
    .line 129
    invoke-interface {p2}, Lv/VTexturePlayer$b;->y()V

    .line 130
    .line 131
    .line 132
    iput-boolean v0, p0, Lv/VTexturePlayer;->f:Z

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_7
    iget-boolean p2, p0, Lv/VTexturePlayer;->p:Z

    .line 136
    .line 137
    if-eqz p2, :cond_a

    .line 138
    .line 139
    iput-boolean p5, p0, Lv/VTexturePlayer;->p:Z

    .line 140
    .line 141
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 146
    .line 147
    .line 148
    move-result p3

    .line 149
    iget-wide v1, p0, Lv/VTexturePlayer;->b:D

    .line 150
    .line 151
    invoke-virtual {p0, p2, p3, v1, v2}, Lv/VTexturePlayer;->h(IID)V

    .line 152
    .line 153
    .line 154
    iget-object p2, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 155
    .line 156
    invoke-interface {p2}, Lv/VTexturePlayer$b;->h()V

    .line 157
    .line 158
    .line 159
    iget-object p2, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 160
    .line 161
    if-nez p2, :cond_8

    .line 162
    .line 163
    invoke-virtual {p0}, Landroid/view/TextureView;->isAvailable()Z

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    if-eqz p2, :cond_8

    .line 168
    .line 169
    invoke-virtual {p0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 174
    .line 175
    .line 176
    move-result p3

    .line 177
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    invoke-virtual {p0, p2, p3, v1}, Lv/VTexturePlayer;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V

    .line 182
    .line 183
    .line 184
    :cond_8
    iget-object p2, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 185
    .line 186
    if-nez p2, :cond_9

    .line 187
    .line 188
    iput-boolean v0, p0, Lv/VTexturePlayer;->v:Z

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_9
    invoke-virtual {p0}, Lv/VTexturePlayer;->t()V

    .line 192
    .line 193
    .line 194
    iput-boolean v0, p0, Lv/VTexturePlayer;->g:Z

    .line 195
    .line 196
    iput-wide p6, p0, Lv/VTexturePlayer;->h:J

    .line 197
    .line 198
    goto :goto_2

    .line 199
    :cond_a
    iget-object p2, p0, Lv/VTexturePlayer;->r:Landroid/view/Surface;

    .line 200
    .line 201
    if-eqz p2, :cond_b

    .line 202
    .line 203
    iget-object p2, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 204
    .line 205
    if-eqz p2, :cond_b

    .line 206
    .line 207
    invoke-interface {p2}, Ll/azl;->start()V

    .line 208
    .line 209
    .line 210
    iget-object p2, p0, Lv/VTexturePlayer;->a:Lv/VTexturePlayer$b;

    .line 211
    .line 212
    invoke-interface {p2}, Lv/VTexturePlayer$b;->onResume()V

    .line 213
    .line 214
    .line 215
    :cond_b
    :goto_2
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 216
    .line 217
    .line 218
    move-result-object p2

    .line 219
    invoke-virtual {p2, p4}, Ll/cbl0;->I(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    iget-boolean p2, p0, Lv/VTexturePlayer;->g:Z

    .line 223
    .line 224
    if-eqz p2, :cond_d

    .line 225
    .line 226
    iput-boolean p5, p0, Lv/VTexturePlayer;->g:Z

    .line 227
    .line 228
    if-eqz p1, :cond_c

    .line 229
    .line 230
    iget-object p1, p0, Lv/VTexturePlayer;->n:Lrx/c;

    .line 231
    .line 232
    invoke-virtual {p1}, Lrx/c;->first()Lrx/c;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    new-instance p2, Ll/d0l0;

    .line 237
    .line 238
    invoke-direct {p2, p0}, Ll/d0l0;-><init>(Lv/VTexturePlayer;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 242
    .line 243
    .line 244
    :cond_c
    return-void

    .line 245
    :cond_d
    iput-wide p6, p0, Lv/VTexturePlayer;->h:J

    .line 246
    .line 247
    return-void
.end method

.method public setIfUseTTDynamicCache(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/VTexturePlayer;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public setIsInABGroup(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/VTexturePlayer;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLooping(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/azl;->setLooping(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setNetErrorListener(Ll/y20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VTexturePlayer;->l:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnBufferListener(Lv/VTexturePlayer$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VTexturePlayer;->k:Lv/VTexturePlayer$c;

    .line 2
    .line 3
    return-void
.end method

.method public setVolume(F)V
    .locals 1
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/azl;->setVolume(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setVolume(Z)V
    .locals 0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 15
    :goto_0
    invoke-virtual {p0, p1}, Lv/VTexturePlayer;->setVolume(F)V

    return-void
.end method

.method public final t()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iput-boolean v0, p0, Lv/VTexturePlayer;->v:Z

    .line 3
    .line 4
    iget-object v0, p0, Lv/VTexturePlayer;->m:Ljava/lang/String;

    .line 5
    .line 6
    iget-object v1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 7
    .line 8
    iget-object v2, p0, Lv/VTexturePlayer;->u:Landroid/net/Uri;

    .line 9
    .line 10
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v1, v2}, Ll/azl;->setDataSource(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 18
    .line 19
    new-instance v2, Ll/xzk0;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0}, Ll/xzk0;-><init>(Lv/VTexturePlayer;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v1, v2}, Ll/azl;->b(Ll/y20;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 28
    .line 29
    new-instance v1, Ll/yzk0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/yzk0;-><init>(Lv/VTexturePlayer;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, v1}, Ll/azl;->a(Ll/a30;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 38
    .line 39
    new-instance v1, Ll/zzk0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/zzk0;-><init>(Lv/VTexturePlayer;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {v0, v1}, Ll/azl;->c(Ll/a30;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 48
    .line 49
    new-instance v1, Ll/a0l0;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/a0l0;-><init>(Lv/VTexturePlayer;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {v0, v1}, Ll/azl;->d(Ll/y20;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 58
    .line 59
    invoke-interface {v0}, Ll/azl;->prepareAsync()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :catch_0
    move-exception v0

    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 68
    .line 69
    invoke-interface {p0}, Ll/azl;->reset()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public u()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/azl;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public v()V
    .locals 3

    .line 1
    :try_start_0
    iget-object p0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    invoke-interface {p0, v0, v1}, Ll/azl;->seekTo(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    new-instance v0, Ljava/lang/Exception;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "VTexturePlayer seekToZero exception:"

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {v0, v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public w(Lv/VTexturePlayer$a;Lrx/c;F)V
    .locals 0

    .line 1
    iput-object p2, p0, Lv/VTexturePlayer;->n:Lrx/c;

    .line 2
    .line 3
    iput p3, p0, Lv/VTexturePlayer;->o:F

    .line 4
    .line 5
    return-void
.end method
