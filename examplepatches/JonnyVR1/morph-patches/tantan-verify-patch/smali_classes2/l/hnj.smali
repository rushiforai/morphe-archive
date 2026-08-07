.class Ll/hnj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hnj$a;,
        Ll/hnj$c;,
        Ll/hnj$b;
    }
.end annotation


# instance fields
.field private final a:Ll/anj;

.field private final b:Landroid/os/Handler;

.field private final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/hnj$b;",
            ">;"
        }
    .end annotation
.end field

.field final d:Ll/m2d0;

.field private final e:Ll/w23;

.field private f:Z

.field private g:Z

.field private h:Z

.field private i:Ll/a2d0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a2d0<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private j:Ll/hnj$a;

.field private k:Z

.field private l:Ll/hnj$a;

.field private m:Landroid/graphics/Bitmap;

.field private n:Ll/tgj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/tgj0<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private o:Ll/hnj$a;

.field private p:I

.field private q:I

.field private r:I


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/a;Ll/anj;IILl/tgj0;Landroid/graphics/Bitmap;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/a;",
            "Ll/anj;",
            "II",
            "Ll/tgj0<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    .line 41
    invoke-virtual {p1}, Lcom/bumptech/glide/a;->f()Ll/w23;

    move-result-object v1

    .line 42
    invoke-virtual {p1}, Lcom/bumptech/glide/a;->h()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    move-result-object v2

    .line 43
    invoke-virtual {p1}, Lcom/bumptech/glide/a;->h()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    move-result-object p1

    invoke-static {p1, p3, p4}, Ll/hnj;->i(Ll/m2d0;II)Ll/a2d0;

    move-result-object v5

    const/4 v4, 0x0

    move-object v0, p0

    move-object v3, p2

    move-object v6, p5

    move-object v7, p6

    .line 44
    invoke-direct/range {v0 .. v7}, Ll/hnj;-><init>(Ll/w23;Ll/m2d0;Ll/anj;Landroid/os/Handler;Ll/a2d0;Ll/tgj0;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public constructor <init>(Ll/w23;Ll/m2d0;Ll/anj;Landroid/os/Handler;Ll/a2d0;Ll/tgj0;Landroid/graphics/Bitmap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/w23;",
            "Ll/m2d0;",
            "Ll/anj;",
            "Landroid/os/Handler;",
            "Ll/a2d0<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Ll/tgj0<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/hnj;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p2, p0, Ll/hnj;->d:Ll/m2d0;

    .line 12
    .line 13
    if-nez p4, :cond_0

    .line 14
    .line 15
    new-instance p4, Landroid/os/Handler;

    .line 16
    .line 17
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    new-instance v0, Ll/hnj$c;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/hnj$c;-><init>(Ll/hnj;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p4, p2, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iput-object p1, p0, Ll/hnj;->e:Ll/w23;

    .line 30
    .line 31
    iput-object p4, p0, Ll/hnj;->b:Landroid/os/Handler;

    .line 32
    .line 33
    iput-object p5, p0, Ll/hnj;->i:Ll/a2d0;

    .line 34
    .line 35
    iput-object p3, p0, Ll/hnj;->a:Ll/anj;

    .line 36
    .line 37
    invoke-virtual {p0, p6, p7}, Ll/hnj;->o(Ll/tgj0;Landroid/graphics/Bitmap;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private static g()Ll/kzq;
    .locals 3

    .line 1
    new-instance v0, Ll/d950;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/d950;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private static i(Ll/m2d0;II)Ll/a2d0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/m2d0;",
            "II)",
            "Ll/a2d0<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/m2d0;->f()Ll/a2d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ll/d4e;->b:Ll/d4e;

    .line 6
    .line 7
    invoke-static {v0}, Ll/p2d0;->n0(Ll/d4e;)Ll/p2d0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Ll/lr2;->l0(Z)Ll/lr2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/p2d0;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/lr2;->g0(Z)Ll/lr2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/p2d0;

    .line 23
    .line 24
    invoke-virtual {v0, p1, p2}, Ll/lr2;->X(II)Ll/lr2;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method private l()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/hnj;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/hnj;->g:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-boolean v0, p0, Ll/hnj;->h:Z

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Ll/hnj;->o:Ll/hnj$a;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    move v0, v1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v0, v2

    .line 23
    :goto_0
    const-string v3, "Pending target must be null when starting from the first frame"

    .line 24
    .line 25
    invoke-static {v0, v3}, Ll/vn80;->a(ZLjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/hnj;->a:Ll/anj;

    .line 29
    .line 30
    invoke-interface {v0}, Ll/anj;->b()V

    .line 31
    .line 32
    .line 33
    iput-boolean v2, p0, Ll/hnj;->h:Z

    .line 34
    .line 35
    :cond_2
    iget-object v0, p0, Ll/hnj;->o:Ll/hnj$a;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    iput-object v1, p0, Ll/hnj;->o:Ll/hnj$a;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/hnj;->m(Ll/hnj$a;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_3
    iput-boolean v1, p0, Ll/hnj;->g:Z

    .line 47
    .line 48
    iget-object v0, p0, Ll/hnj;->a:Ll/anj;

    .line 49
    .line 50
    invoke-interface {v0}, Ll/anj;->e()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 55
    .line 56
    .line 57
    move-result-wide v1

    .line 58
    int-to-long v3, v0

    .line 59
    add-long/2addr v1, v3

    .line 60
    iget-object v0, p0, Ll/hnj;->a:Ll/anj;

    .line 61
    .line 62
    invoke-interface {v0}, Ll/anj;->advance()V

    .line 63
    .line 64
    .line 65
    new-instance v0, Ll/hnj$a;

    .line 66
    .line 67
    iget-object v3, p0, Ll/hnj;->b:Landroid/os/Handler;

    .line 68
    .line 69
    iget-object v4, p0, Ll/hnj;->a:Ll/anj;

    .line 70
    .line 71
    invoke-interface {v4}, Ll/anj;->c()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    invoke-direct {v0, v3, v4, v1, v2}, Ll/hnj$a;-><init>(Landroid/os/Handler;IJ)V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Ll/hnj;->l:Ll/hnj$a;

    .line 79
    .line 80
    iget-object v0, p0, Ll/hnj;->i:Ll/a2d0;

    .line 81
    .line 82
    invoke-static {}, Ll/hnj;->g()Ll/kzq;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {v1}, Ll/p2d0;->o0(Ll/kzq;)Ll/p2d0;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v1, p0, Ll/hnj;->a:Ll/anj;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ll/a2d0;->C0(Ljava/lang/Object;)Ll/a2d0;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object p0, p0, Ll/hnj;->l:Ll/hnj$a;

    .line 101
    .line 102
    invoke-virtual {v0, p0}, Ll/a2d0;->u0(Ll/cli0;)Ll/cli0;

    .line 103
    .line 104
    .line 105
    :cond_4
    :goto_1
    return-void
.end method

.method private n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hnj;->m:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/hnj;->e:Ll/w23;

    .line 6
    .line 7
    invoke-interface {v1, v0}, Ll/w23;->c(Landroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Ll/hnj;->m:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private p()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/hnj;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/hnj;->f:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Ll/hnj;->k:Z

    .line 11
    .line 12
    invoke-direct {p0}, Ll/hnj;->l()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private q()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hnj;->f:Z

    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hnj;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/hnj;->n()V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Ll/hnj;->q()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/hnj;->j:Ll/hnj$a;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v2, p0, Ll/hnj;->d:Ll/m2d0;

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Ll/m2d0;->n(Ll/cli0;)V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/hnj;->j:Ll/hnj$a;

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/hnj;->l:Ll/hnj$a;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v2, p0, Ll/hnj;->d:Ll/m2d0;

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ll/m2d0;->n(Ll/cli0;)V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Ll/hnj;->l:Ll/hnj$a;

    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Ll/hnj;->o:Ll/hnj$a;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v2, p0, Ll/hnj;->d:Ll/m2d0;

    .line 40
    .line 41
    invoke-virtual {v2, v0}, Ll/m2d0;->n(Ll/cli0;)V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Ll/hnj;->o:Ll/hnj$a;

    .line 45
    .line 46
    :cond_2
    iget-object v0, p0, Ll/hnj;->a:Ll/anj;

    .line 47
    .line 48
    invoke-interface {v0}, Ll/anj;->clear()V

    .line 49
    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    iput-boolean v0, p0, Ll/hnj;->k:Z

    .line 53
    .line 54
    return-void
.end method

.method public b()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnj;->a:Ll/anj;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/anj;->getData()Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public c()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hnj;->j:Ll/hnj$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/hnj$a;->b()Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/hnj;->m:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnj;->j:Ll/hnj$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Ll/hnj$a;->e:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, -0x1

    .line 9
    return p0
.end method

.method public e()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnj;->m:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnj;->a:Ll/anj;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/anj;->getFrameCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/hnj;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public j()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hnj;->a:Ll/anj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/anj;->d()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p0, p0, Ll/hnj;->p:I

    .line 8
    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Ll/hnj;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public m(Ll/hnj$a;)V
    .locals 3
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hnj;->g:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Ll/hnj;->k:Z

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/hnj;->b:Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {p0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-boolean v0, p0, Ll/hnj;->f:Z

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iget-boolean v0, p0, Ll/hnj;->h:Z

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/hnj;->b:Landroid/os/Handler;

    .line 28
    .line 29
    invoke-virtual {p0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iput-object p1, p0, Ll/hnj;->o:Ll/hnj$a;

    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    invoke-virtual {p1}, Ll/hnj$a;->b()Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    invoke-direct {p0}, Ll/hnj;->n()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/hnj;->j:Ll/hnj$a;

    .line 50
    .line 51
    iput-object p1, p0, Ll/hnj;->j:Ll/hnj$a;

    .line 52
    .line 53
    iget-object p1, p0, Ll/hnj;->c:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    add-int/lit8 p1, p1, -0x1

    .line 60
    .line 61
    :goto_0
    if-ltz p1, :cond_3

    .line 62
    .line 63
    iget-object v2, p0, Ll/hnj;->c:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    check-cast v2, Ll/hnj$b;

    .line 70
    .line 71
    invoke-interface {v2}, Ll/hnj$b;->a()V

    .line 72
    .line 73
    .line 74
    add-int/lit8 p1, p1, -0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    if-eqz v0, :cond_4

    .line 78
    .line 79
    iget-object p1, p0, Ll/hnj;->b:Landroid/os/Handler;

    .line 80
    .line 81
    invoke-virtual {p1, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 86
    .line 87
    .line 88
    :cond_4
    invoke-direct {p0}, Ll/hnj;->l()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public o(Ll/tgj0;Landroid/graphics/Bitmap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/tgj0<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/tgj0;

    .line 6
    .line 7
    iput-object v0, p0, Ll/hnj;->n:Ll/tgj0;

    .line 8
    .line 9
    invoke-static {p2}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/graphics/Bitmap;

    .line 14
    .line 15
    iput-object v0, p0, Ll/hnj;->m:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    iget-object v0, p0, Ll/hnj;->i:Ll/a2d0;

    .line 18
    .line 19
    new-instance v1, Ll/p2d0;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/p2d0;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ll/lr2;->j0(Ll/tgj0;)Ll/lr2;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, p1}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/hnj;->i:Ll/a2d0;

    .line 33
    .line 34
    invoke-static {p2}, Ll/ylk0;->h(Landroid/graphics/Bitmap;)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput p1, p0, Ll/hnj;->p:I

    .line 39
    .line 40
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iput p1, p0, Ll/hnj;->q:I

    .line 45
    .line 46
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iput p1, p0, Ll/hnj;->r:I

    .line 51
    .line 52
    return-void
.end method

.method public r(Ll/hnj$b;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/hnj;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/hnj;->c:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/hnj;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Ll/hnj;->c:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-direct {p0}, Ll/hnj;->p()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void

    .line 30
    :cond_1
    const-string p0, "Cannot subscribe twice in a row"

    .line 31
    .line 32
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    const-string p0, "Cannot subscribe to a cleared frame loader"

    .line 37
    .line 38
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public s(Ll/hnj$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hnj;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/hnj;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Ll/hnj;->q()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
