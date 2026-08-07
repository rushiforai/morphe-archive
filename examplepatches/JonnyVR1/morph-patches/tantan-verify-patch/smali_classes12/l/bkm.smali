.class public Ll/bkm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ljava/lang/String;

.field b:I

.field c:I

.field d:Ll/hfj;

.field e:Ll/hfj;

.field f:Ll/kt2;

.field g:Ll/kt2;

.field final h:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field final i:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field protected j:Ll/qej;

.field private k:Ll/kt2;

.field private l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/kt2;",
            ">;"
        }
    .end annotation
.end field

.field private m:I

.field private n:Landroid/graphics/SurfaceTexture;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "ImageRender"

    .line 5
    .line 6
    iput-object v0, p0, Ll/bkm;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/bkm;->d:Ll/hfj;

    .line 10
    .line 11
    iput-object v0, p0, Ll/bkm;->e:Ll/hfj;

    .line 12
    .line 13
    iput-object v0, p0, Ll/bkm;->f:Ll/kt2;

    .line 14
    .line 15
    iput-object v0, p0, Ll/bkm;->g:Ll/kt2;

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/bkm;->l:Ljava/util/List;

    .line 23
    .line 24
    const/16 v0, -0x3039

    .line 25
    .line 26
    iput v0, p0, Ll/bkm;->m:I

    .line 27
    .line 28
    new-instance v0, Ljava/util/LinkedList;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/bkm;->h:Ljava/util/Queue;

    .line 34
    .line 35
    new-instance v0, Ljava/util/LinkedList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/bkm;->i:Ljava/util/Queue;

    .line 41
    .line 42
    return-void
.end method

.method private b(Ll/hfj;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/bkm;->l:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/kt2;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/hfj;->C(Ll/efj;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method private d()V
    .locals 3

    .line 1
    new-instance v0, Ll/qej;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qej;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/bkm;->j:Ll/qej;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/bkm;->f()V

    .line 9
    .line 10
    .line 11
    iget v1, p0, Ll/bkm;->b:I

    .line 12
    .line 13
    iget v2, p0, Ll/bkm;->c:I

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Ll/qej;->c(II)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/bkm;->d:Ll/hfj;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v2, p0, Ll/bkm;->k:Ll/kt2;

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ll/hfj;->C(Ll/efj;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/bkm;->k:Ll/kt2;

    .line 30
    .line 31
    invoke-direct {p0, v1}, Ll/bkm;->b(Ll/hfj;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-direct {p0, v1}, Ll/bkm;->b(Ll/hfj;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object p0, p0, Ll/bkm;->d:Ll/hfj;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ll/qej;->b(Ll/xej;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ll/qej;->h()V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method


# virtual methods
.method public a(Ll/kt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkm;->j:Ll/qej;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qej;->a(Ll/xej;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bkm;->h:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/bkm;->l(Ljava/util/Queue;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/bkm;->j()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/bkm;->i:Ljava/util/Queue;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/bkm;->l(Ljava/util/Queue;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bkm;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Ll/kt2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bkm;->f:Ll/kt2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-object p1, p0, Ll/bkm;->f:Ll/kt2;

    .line 7
    .line 8
    iget-object p0, p0, Ll/bkm;->d:Ll/hfj;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/hfj;->C(Ll/efj;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public h(Ll/kt2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bkm;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/bkm;->l:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/bkm;->k:Ll/kt2;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/hfj;->C(Ll/efj;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p0, p0, Ll/bkm;->d:Ll/hfj;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/hfj;->C(Ll/efj;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    :goto_0
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/bkm;->n:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    :catchall_0
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/bkm;->n:Landroid/graphics/SurfaceTexture;

    .line 10
    .line 11
    iget-object v1, p0, Ll/bkm;->j:Ll/qej;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/qej;->d()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/bkm;->j:Ll/qej;

    .line 19
    .line 20
    :cond_1
    iget-object v1, p0, Ll/bkm;->k:Ll/kt2;

    .line 21
    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/hfj;->f()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/bkm;->k:Ll/kt2;

    .line 28
    .line 29
    :cond_2
    iget-object v1, p0, Ll/bkm;->f:Ll/kt2;

    .line 30
    .line 31
    if-eqz v1, :cond_3

    .line 32
    .line 33
    iput-object v0, p0, Ll/bkm;->f:Ll/kt2;

    .line 34
    .line 35
    :cond_3
    iget-object v1, p0, Ll/bkm;->g:Ll/kt2;

    .line 36
    .line 37
    if-eqz v1, :cond_4

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/hfj;->f()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/bkm;->g:Ll/kt2;

    .line 43
    .line 44
    :cond_4
    iget-object v1, p0, Ll/bkm;->e:Ll/hfj;

    .line 45
    .line 46
    if-eqz v1, :cond_5

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/hfj;->f()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ll/bkm;->e:Ll/hfj;

    .line 52
    .line 53
    :cond_5
    iget-object v0, p0, Ll/bkm;->l:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/bkm;->h:Ljava/util/Queue;

    .line 59
    .line 60
    if-eqz v0, :cond_6

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 63
    .line 64
    .line 65
    :cond_6
    iget-object p0, p0, Ll/bkm;->i:Ljava/util/Queue;

    .line 66
    .line 67
    if-eqz p0, :cond_7

    .line 68
    .line 69
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 70
    .line 71
    .line 72
    :cond_7
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkm;->j:Ll/qej;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qej;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public k(Ll/hfj;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bkm;->d:Ll/hfj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/hfj;->D()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/bkm;->j:Ll/qej;

    .line 9
    .line 10
    iget-object v1, p0, Ll/bkm;->d:Ll/hfj;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/qej;->g(Ll/xej;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/bkm;->d:Ll/hfj;

    .line 16
    .line 17
    iput-object v0, p0, Ll/bkm;->e:Ll/hfj;

    .line 18
    .line 19
    :cond_0
    iput-object p1, p0, Ll/bkm;->d:Ll/hfj;

    .line 20
    .line 21
    iget-object v0, p0, Ll/bkm;->j:Ll/qej;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/qej;->b(Ll/xej;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/bkm;->k:Ll/kt2;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/bkm;->d:Ll/hfj;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ll/hfj;->C(Ll/efj;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/bkm;->k:Ll/kt2;

    .line 36
    .line 37
    invoke-direct {p0, p1}, Ll/bkm;->b(Ll/hfj;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object p1, p0, Ll/bkm;->f:Ll/kt2;

    .line 41
    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Ll/bkm;->d:Ll/hfj;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/hfj;->C(Ll/efj;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    return-void
.end method

.method public l(Ljava/util/Queue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .line 1
    monitor-enter p1

    .line 2
    :goto_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    monitor-exit p1

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public m(Ll/kt2;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-object v0, p0, Ll/bkm;->k:Ll/kt2;

    .line 4
    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v1, p0, Ll/bkm;->d:Ll/hfj;

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    iput-object p1, p0, Ll/bkm;->k:Ll/kt2;

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/hfj;->D()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/bkm;->j:Ll/qej;

    .line 21
    .line 22
    iget-object v1, p0, Ll/bkm;->k:Ll/kt2;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/qej;->a(Ll/xej;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iput-object p1, p0, Ll/bkm;->k:Ll/kt2;

    .line 28
    .line 29
    iget-object p1, p0, Ll/bkm;->d:Ll/hfj;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/hfj;->D()V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/bkm;->d:Ll/hfj;

    .line 35
    .line 36
    iget-object v0, p0, Ll/bkm;->k:Ll/kt2;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/hfj;->C(Ll/efj;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/bkm;->k:Ll/kt2;

    .line 42
    .line 43
    invoke-direct {p0, p1}, Ll/bkm;->b(Ll/hfj;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/bkm;->f:Ll/kt2;

    .line 47
    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    iget-object p0, p0, Ll/bkm;->d:Ll/hfj;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/hfj;->C(Ll/efj;)V

    .line 53
    .line 54
    .line 55
    :cond_3
    :goto_0
    return-void
.end method

.method public n(Ll/crf0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public o(Ll/hfj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bkm;->d:Ll/hfj;

    .line 2
    .line 3
    return-void
.end method

.method public p(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bkm;->k:Ll/kt2;

    .line 2
    .line 3
    instance-of v0, p0, Ll/ham;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/ham;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ll/ham;->setTimeStamp(J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public q(Ll/kt2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bkm;->f:Ll/kt2;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/bkm;->f:Ll/kt2;

    .line 7
    .line 8
    iget-object p0, p0, Ll/bkm;->d:Ll/hfj;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/hfj;->M(Ll/efj;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public r(Ll/kt2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bkm;->l:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/bkm;->k:Ll/kt2;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/hfj;->M(Ll/efj;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iget-object p0, p0, Ll/bkm;->d:Ll/hfj;

    .line 17
    .line 18
    if-eqz p0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/hfj;->M(Ll/efj;)V

    .line 21
    .line 22
    .line 23
    :cond_2
    return-void
.end method

.method public s(Lcom/immomo/components/interfaces/IProcessOutput;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/bkm;->k:Ll/kt2;

    .line 4
    .line 5
    instance-of v0, p0, Ll/ruf;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/ruf;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/ruf;->d(Lcom/immomo/components/interfaces/IProcessOutput;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
