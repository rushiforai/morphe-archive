.class public Ll/bl90;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/content/ContentResolver;

.field public b:Landroid/content/res/Resources;

.field public c:Landroid/content/res/AssetManager;

.field public final d:Ll/wq3;

.field public final e:Ll/shm;

.field public final f:Ll/t4b0;

.field public final g:Lcom/facebook/imagepipeline/core/DownsampleMode;

.field public final h:Z

.field public final i:Z

.field public final j:Ll/d7f;

.field public final k:Ll/fj80;

.field public final l:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Ll/mpy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mpy<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field public final n:Ll/mpy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public final o:Ll/cy3;

.field public final p:Ll/ye3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ye3<",
            "Ll/by3;",
            ">;"
        }
    .end annotation
.end field

.field public final q:Ll/ye3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ye3<",
            "Ll/by3;",
            ">;"
        }
    .end annotation
.end field

.field public final r:Ll/xc80;

.field public final s:I

.field public final t:I

.field public u:Z

.field public final v:Ll/gb5;

.field public final w:I

.field public final x:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/wq3;Ll/shm;Ll/t4b0;Lcom/facebook/imagepipeline/core/DownsampleMode;ZZLl/d7f;Ll/fj80;Ll/mpy;Ll/mpy;Ll/a7h0;Ll/cy3;Ll/xc80;IIZILl/gb5;ZI)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/wq3;",
            "Ll/shm;",
            "Ll/t4b0;",
            "Lcom/facebook/imagepipeline/core/DownsampleMode;",
            "ZZ",
            "Ll/d7f;",
            "Ll/fj80;",
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;",
            "Ll/mpy<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;",
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;",
            "Ll/cy3;",
            "Ll/xc80;",
            "IIZI",
            "Ll/gb5;",
            "ZI)V"
        }
    .end annotation

    move/from16 v0, p21

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iput-object v1, p0, Ll/bl90;->a:Landroid/content/ContentResolver;

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iput-object v1, p0, Ll/bl90;->b:Landroid/content/res/Resources;

    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    iput-object p1, p0, Ll/bl90;->c:Landroid/content/res/AssetManager;

    .line 5
    iput-object p2, p0, Ll/bl90;->d:Ll/wq3;

    .line 6
    iput-object p3, p0, Ll/bl90;->e:Ll/shm;

    .line 7
    iput-object p4, p0, Ll/bl90;->f:Ll/t4b0;

    .line 8
    iput-object p5, p0, Ll/bl90;->g:Lcom/facebook/imagepipeline/core/DownsampleMode;

    .line 9
    iput-boolean p6, p0, Ll/bl90;->h:Z

    .line 10
    iput-boolean p7, p0, Ll/bl90;->i:Z

    .line 11
    iput-object p8, p0, Ll/bl90;->j:Ll/d7f;

    .line 12
    iput-object p9, p0, Ll/bl90;->k:Ll/fj80;

    .line 13
    iput-object p10, p0, Ll/bl90;->n:Ll/mpy;

    .line 14
    iput-object p11, p0, Ll/bl90;->m:Ll/mpy;

    .line 15
    iput-object p12, p0, Ll/bl90;->l:Ll/a7h0;

    .line 16
    iput-object p13, p0, Ll/bl90;->o:Ll/cy3;

    move-object/from16 p1, p14

    .line 17
    iput-object p1, p0, Ll/bl90;->r:Ll/xc80;

    .line 18
    new-instance p1, Ll/ye3;

    invoke-direct {p1, v0}, Ll/ye3;-><init>(I)V

    iput-object p1, p0, Ll/bl90;->p:Ll/ye3;

    .line 19
    new-instance p1, Ll/ye3;

    invoke-direct {p1, v0}, Ll/ye3;-><init>(I)V

    iput-object p1, p0, Ll/bl90;->q:Ll/ye3;

    move/from16 p1, p15

    .line 20
    iput p1, p0, Ll/bl90;->s:I

    move/from16 p1, p16

    .line 21
    iput p1, p0, Ll/bl90;->t:I

    move/from16 p1, p17

    .line 22
    iput-boolean p1, p0, Ll/bl90;->u:Z

    move/from16 p1, p18

    .line 23
    iput p1, p0, Ll/bl90;->w:I

    move-object/from16 p1, p19

    .line 24
    iput-object p1, p0, Ll/bl90;->v:Ll/gb5;

    move/from16 p1, p20

    .line 25
    iput-boolean p1, p0, Ll/bl90;->x:Z

    return-void
.end method

.method public static a(Ll/wk90;)Ll/t80;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)",
            "Ll/t80;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/t80;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/t80;-><init>(Ll/wk90;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static h(Ll/wk90;Ll/wk90;)Ll/gf3;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)",
            "Ll/gf3;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/gf3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/gf3;-><init>(Ll/wk90;Ll/wk90;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public A(Ll/wk90;)Ll/em80;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)",
            "Ll/em80;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/em80;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->n:Ll/mpy;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bl90;->o:Ll/cy3;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p1}, Ll/em80;-><init>(Ll/mpy;Ll/cy3;Ll/wk90;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public B(Ll/wk90;)Ll/gm80;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)",
            "Ll/gm80;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/gm80;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->r:Ll/xc80;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bl90;->j:Ll/d7f;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/d7f;->b()Ljava/util/concurrent/Executor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, p1, v1, p0}, Ll/gm80;-><init>(Ll/wk90;Ll/xc80;Ljava/util/concurrent/Executor;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public C()Ll/pvb0;
    .locals 3

    .line 1
    new-instance v0, Ll/pvb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/d7f;->c()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/bl90;->k:Ll/fj80;

    .line 10
    .line 11
    iget-object p0, p0, Ll/bl90;->a:Landroid/content/ContentResolver;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2, p0}, Ll/pvb0;-><init>(Ljava/util/concurrent/Executor;Ll/fj80;Landroid/content/ContentResolver;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public D(Ll/wk90;ZLl/xkm;)Lcom/facebook/imagepipeline/producers/d;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;Z",
            "Ll/xkm;",
            ")",
            "Lcom/facebook/imagepipeline/producers/d;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/facebook/imagepipeline/producers/d;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/d7f;->b()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/bl90;->k:Ll/fj80;

    .line 10
    .line 11
    move-object v3, p1

    .line 12
    move v4, p2

    .line 13
    move-object v5, p3

    .line 14
    invoke-direct/range {v0 .. v5}, Lcom/facebook/imagepipeline/producers/d;-><init>(Ljava/util/concurrent/Executor;Ll/fj80;Ll/wk90;ZLl/xkm;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public E(Ll/wk90;)Ll/ffh0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/wk90<",
            "TT;>;)",
            "Ll/ffh0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/ffh0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/ffh0;-><init>(Ll/wk90;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public F(Ll/wk90;)Ll/syi0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/wk90<",
            "TT;>;)",
            "Ll/syi0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/syi0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/d7f;->a()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v1, 0x5

    .line 10
    invoke-direct {v0, v1, p0, p1}, Ll/syi0;-><init>(ILjava/util/concurrent/Executor;Ll/wk90;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public G([Ll/azi0;)Ll/zyi0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ll/azi0<",
            "Ll/n0f;",
            ">;)",
            "Ll/zyi0;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/zyi0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/zyi0;-><init>([Ll/azi0;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b(Ll/wk90;Ll/oxi0;)Ll/wk90;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/wk90<",
            "TT;>;",
            "Ll/oxi0;",
            ")",
            "Ll/wk90<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/nxi0;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/nxi0;-><init>(Ll/wk90;Ll/oxi0;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public c(Ll/wk90;)Ll/n23;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)",
            "Ll/n23;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/n23;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->n:Ll/mpy;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bl90;->o:Ll/cy3;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p1}, Ll/n23;-><init>(Ll/mpy;Ll/cy3;Ll/wk90;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public d(Ll/wk90;)Ll/p23;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)",
            "Ll/p23;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/p23;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bl90;->o:Ll/cy3;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/p23;-><init>(Ll/cy3;Ll/wk90;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public e(Ll/wk90;)Ll/q23;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)",
            "Ll/q23;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/q23;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->n:Ll/mpy;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bl90;->o:Ll/cy3;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p1}, Ll/q23;-><init>(Ll/mpy;Ll/cy3;Ll/wk90;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public f(Ll/wk90;)Ll/z23;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)",
            "Ll/z23;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/z23;

    .line 2
    .line 3
    iget v1, p0, Ll/bl90;->s:I

    .line 4
    .line 5
    iget v2, p0, Ll/bl90;->t:I

    .line 6
    .line 7
    iget-boolean p0, p0, Ll/bl90;->u:Z

    .line 8
    .line 9
    invoke-direct {v0, p1, v1, v2, p0}, Ll/z23;-><init>(Ll/wk90;IIZ)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public g(Ll/wk90;)Ll/b33;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)",
            "Ll/b33;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/b33;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->m:Ll/mpy;

    .line 4
    .line 5
    iget-object v2, p0, Ll/bl90;->l:Ll/a7h0;

    .line 6
    .line 7
    iget-object v3, p0, Ll/bl90;->o:Ll/cy3;

    .line 8
    .line 9
    iget-object v4, p0, Ll/bl90;->p:Ll/ye3;

    .line 10
    .line 11
    iget-object v5, p0, Ll/bl90;->q:Ll/ye3;

    .line 12
    .line 13
    move-object v6, p1

    .line 14
    invoke-direct/range {v0 .. v6}, Ll/b33;-><init>(Ll/mpy;Ll/a7h0;Ll/cy3;Ll/ye3;Ll/ye3;Ll/wk90;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public i()Ll/s5c;
    .locals 1

    .line 1
    new-instance v0, Ll/s5c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bl90;->k:Ll/fj80;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/s5c;-><init>(Ll/fj80;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public j(Ll/wk90;)Lcom/facebook/imagepipeline/producers/a;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/a;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/facebook/imagepipeline/producers/a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->d:Ll/wq3;

    .line 4
    .line 5
    iget-object v2, p0, Ll/bl90;->j:Ll/d7f;

    .line 6
    .line 7
    invoke-interface {v2}, Ll/d7f;->g()Ljava/util/concurrent/Executor;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v3, p0, Ll/bl90;->e:Ll/shm;

    .line 12
    .line 13
    iget-object v4, p0, Ll/bl90;->f:Ll/t4b0;

    .line 14
    .line 15
    iget-object v5, p0, Ll/bl90;->g:Lcom/facebook/imagepipeline/core/DownsampleMode;

    .line 16
    .line 17
    iget-boolean v6, p0, Ll/bl90;->h:Z

    .line 18
    .line 19
    iget-boolean v7, p0, Ll/bl90;->i:Z

    .line 20
    .line 21
    iget v9, p0, Ll/bl90;->w:I

    .line 22
    .line 23
    iget-object v10, p0, Ll/bl90;->v:Ll/gb5;

    .line 24
    .line 25
    const/4 v11, 0x0

    .line 26
    sget-object v12, Ll/d7h0;->b:Ll/a7h0;

    .line 27
    .line 28
    move-object v8, p1

    .line 29
    invoke-direct/range {v0 .. v12}, Lcom/facebook/imagepipeline/producers/a;-><init>(Ll/wq3;Ljava/util/concurrent/Executor;Ll/shm;Ll/t4b0;Lcom/facebook/imagepipeline/core/DownsampleMode;ZZLl/wk90;ILl/gb5;Ljava/lang/Runnable;Ll/a7h0;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public k(Ll/wk90;)Ll/hud;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)",
            "Ll/hud;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/hud;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/d7f;->f()Ljava/util/concurrent/ScheduledExecutorService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p1, p0}, Ll/hud;-><init>(Ll/wk90;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public l(Ll/wk90;)Lcom/facebook/imagepipeline/producers/b;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/b;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/facebook/imagepipeline/producers/b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->l:Ll/a7h0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bl90;->o:Ll/cy3;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p1}, Lcom/facebook/imagepipeline/producers/b;-><init>(Ll/a7h0;Ll/cy3;Ll/wk90;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public m(Ll/wk90;)Lcom/facebook/imagepipeline/producers/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/c;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/facebook/imagepipeline/producers/c;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->l:Ll/a7h0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bl90;->o:Ll/cy3;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p1}, Lcom/facebook/imagepipeline/producers/c;-><init>(Ll/a7h0;Ll/cy3;Ll/wk90;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public n(Ll/wk90;)Ll/l0f;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)",
            "Ll/l0f;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l0f;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->o:Ll/cy3;

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/bl90;->x:Z

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p1}, Ll/l0f;-><init>(Ll/cy3;ZLl/wk90;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public o(Ll/wk90;)Ll/wk90;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/q0f;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->m:Ll/mpy;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bl90;->o:Ll/cy3;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p1}, Ll/q0f;-><init>(Ll/mpy;Ll/cy3;Ll/wk90;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public p(Ll/wk90;)Ll/r0f;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)",
            "Ll/r0f;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/r0f;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->l:Ll/a7h0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/bl90;->o:Ll/cy3;

    .line 6
    .line 7
    iget-object v3, p0, Ll/bl90;->p:Ll/ye3;

    .line 8
    .line 9
    iget-object v4, p0, Ll/bl90;->q:Ll/ye3;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    invoke-direct/range {v0 .. v5}, Ll/r0f;-><init>(Ll/a7h0;Ll/cy3;Ll/ye3;Ll/ye3;Ll/wk90;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public q()Ll/ytv;
    .locals 3

    .line 1
    new-instance v0, Ll/ytv;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/d7f;->c()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/bl90;->k:Ll/fj80;

    .line 10
    .line 11
    iget-object p0, p0, Ll/bl90;->c:Landroid/content/res/AssetManager;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2, p0}, Ll/ytv;-><init>(Ljava/util/concurrent/Executor;Ll/fj80;Landroid/content/res/AssetManager;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public r()Ll/auv;
    .locals 3

    .line 1
    new-instance v0, Ll/auv;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/d7f;->c()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/bl90;->k:Ll/fj80;

    .line 10
    .line 11
    iget-object p0, p0, Ll/bl90;->a:Landroid/content/ContentResolver;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2, p0}, Ll/auv;-><init>(Ljava/util/concurrent/Executor;Ll/fj80;Landroid/content/ContentResolver;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public s()Ll/buv;
    .locals 3

    .line 1
    new-instance v0, Ll/buv;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/d7f;->c()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/bl90;->k:Ll/fj80;

    .line 10
    .line 11
    iget-object p0, p0, Ll/bl90;->a:Landroid/content/ContentResolver;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2, p0}, Ll/buv;-><init>(Ljava/util/concurrent/Executor;Ll/fj80;Landroid/content/ContentResolver;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public t()Lcom/facebook/imagepipeline/producers/LocalExifThumbnailProducer;
    .locals 3

    .line 1
    new-instance v0, Lcom/facebook/imagepipeline/producers/LocalExifThumbnailProducer;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/d7f;->d()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/bl90;->k:Ll/fj80;

    .line 10
    .line 11
    iget-object p0, p0, Ll/bl90;->a:Landroid/content/ContentResolver;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2, p0}, Lcom/facebook/imagepipeline/producers/LocalExifThumbnailProducer;-><init>(Ljava/util/concurrent/Executor;Ll/fj80;Landroid/content/ContentResolver;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public u()Ll/ovv;
    .locals 2

    .line 1
    new-instance v0, Ll/ovv;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/d7f;->c()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Ll/bl90;->k:Ll/fj80;

    .line 10
    .line 11
    invoke-direct {v0, v1, p0}, Ll/ovv;-><init>(Ljava/util/concurrent/Executor;Ll/fj80;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public v()Ll/wwv;
    .locals 3

    .line 1
    new-instance v0, Ll/wwv;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/d7f;->c()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/bl90;->k:Ll/fj80;

    .line 10
    .line 11
    iget-object p0, p0, Ll/bl90;->b:Landroid/content/res/Resources;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2, p0}, Ll/wwv;-><init>(Ljava/util/concurrent/Executor;Ll/fj80;Landroid/content/res/Resources;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public w()Ll/axv;
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1d
    .end annotation

    .line 1
    new-instance v0, Ll/axv;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/d7f;->b()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Ll/bl90;->a:Landroid/content/ContentResolver;

    .line 10
    .line 11
    invoke-direct {v0, v1, p0}, Ll/axv;-><init>(Ljava/util/concurrent/Executor;Landroid/content/ContentResolver;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public x()Ll/exv;
    .locals 2

    .line 1
    new-instance v0, Ll/exv;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->j:Ll/d7f;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/d7f;->c()Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Ll/bl90;->a:Landroid/content/ContentResolver;

    .line 10
    .line 11
    invoke-direct {v0, v1, p0}, Ll/exv;-><init>(Ljava/util/concurrent/Executor;Landroid/content/ContentResolver;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public y(Ll/vj20;)Ll/wk90;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vj20;",
            ")",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/uj20;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->k:Ll/fj80;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bl90;->d:Ll/wq3;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p1}, Ll/uj20;-><init>(Ll/fj80;Ll/wq3;Ll/vj20;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public z(Ll/wk90;)Ll/rg60;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)",
            "Ll/rg60;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rg60;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bl90;->l:Ll/a7h0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/bl90;->o:Ll/cy3;

    .line 6
    .line 7
    iget-object v3, p0, Ll/bl90;->k:Ll/fj80;

    .line 8
    .line 9
    iget-object v4, p0, Ll/bl90;->d:Ll/wq3;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    invoke-direct/range {v0 .. v5}, Ll/rg60;-><init>(Ll/a7h0;Ll/cy3;Ll/fj80;Ll/wq3;Ll/wk90;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method
