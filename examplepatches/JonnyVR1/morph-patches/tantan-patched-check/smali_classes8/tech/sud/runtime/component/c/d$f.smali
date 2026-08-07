.class Ltech/sud/runtime/component/c/d$f;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/c/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:Z

.field private f:Z

.field private g:Z

.field private h:Z

.field private i:Z

.field private j:Z

.field private k:Z

.field private l:Z

.field private m:I

.field private n:I

.field private o:I

.field private p:Z

.field private q:Z

.field private r:Z

.field private s:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private t:Z

.field private u:Ljava/lang/Runnable;

.field private v:Ltech/sud/runtime/component/c/d$e;

.field private w:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ltech/sud/runtime/component/c/d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Ltech/sud/runtime/component/c/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "GLThread"

    .line 5
    .line 6
    iput-object v0, p0, Ltech/sud/runtime/component/c/d$f;->a:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ltech/sud/runtime/component/c/d$f;->s:Ljava/util/ArrayList;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->t:Z

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Ltech/sud/runtime/component/c/d$f;->u:Ljava/lang/Runnable;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput v1, p0, Ltech/sud/runtime/component/c/d$f;->m:I

    .line 23
    .line 24
    iput v1, p0, Ltech/sud/runtime/component/c/d$f;->n:I

    .line 25
    .line 26
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->p:Z

    .line 27
    .line 28
    iput v0, p0, Ltech/sud/runtime/component/c/d$f;->o:I

    .line 29
    .line 30
    iput-boolean v1, p0, Ltech/sud/runtime/component/c/d$f;->q:Z

    .line 31
    .line 32
    iput-object p1, p0, Ltech/sud/runtime/component/c/d$f;->w:Ljava/lang/ref/WeakReference;

    .line 33
    .line 34
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/c/d$f;Z)Z
    .locals 0

    .line 170
    iput-boolean p1, p0, Ltech/sud/runtime/component/c/d$f;->c:Z

    return p1
.end method

.method private d()V
    .locals 1

    .line 133
    iget-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->j:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 134
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->j:Z

    .line 135
    iget-object p0, p0, Ltech/sud/runtime/component/c/d$f;->v:Ltech/sud/runtime/component/c/d$e;

    invoke-virtual {p0}, Ltech/sud/runtime/component/c/d$e;->e()V

    :cond_0
    return-void
.end method

.method private e()V
    .locals 1

    .line 98
    iget-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->i:Z

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$f;->v:Ltech/sud/runtime/component/c/d$e;

    invoke-virtual {v0}, Ltech/sud/runtime/component/c/d$e;->f()V

    const/4 v0, 0x0

    .line 100
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->i:Z

    .line 101
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/c/d$g;->b(Ltech/sud/runtime/component/c/d$f;)V

    :cond_0
    return-void
.end method

.method private f()V
    .locals 21

    move-object/from16 v1, p0

    .line 1
    new-instance v0, Ltech/sud/runtime/component/c/d$e;

    iget-object v2, v1, Ltech/sud/runtime/component/c/d$f;->w:Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v2}, Ltech/sud/runtime/component/c/d$e;-><init>(Ljava/lang/ref/WeakReference;)V

    iput-object v0, v1, Ltech/sud/runtime/component/c/d$f;->v:Ltech/sud/runtime/component/c/d$e;

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->i:Z

    .line 3
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->j:Z

    .line 4
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->q:Z

    move v4, v0

    move v5, v4

    move v6, v5

    move v7, v6

    move v8, v7

    move v9, v8

    move v10, v9

    move v11, v10

    move v12, v11

    move v13, v12

    const/4 v3, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    .line 5
    :goto_0
    :try_start_0
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v16

    monitor-enter v16
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 6
    :goto_1
    :try_start_1
    iget-boolean v2, v1, Ltech/sud/runtime/component/c/d$f;->b:Z

    if-eqz v2, :cond_1

    .line 7
    monitor-exit v16
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 8
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v2

    monitor-enter v2

    .line 9
    :try_start_2
    iget-object v0, v1, Ltech/sud/runtime/component/c/d$f;->w:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltech/sud/runtime/component/c/d;

    if-eqz v0, :cond_0

    .line 10
    invoke-virtual {v0}, Ltech/sud/runtime/component/c/d;->b()V

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_3

    .line 11
    :cond_0
    :goto_2
    invoke-direct {v1}, Ltech/sud/runtime/component/c/d$f;->d()V

    .line 12
    invoke-direct {v1}, Ltech/sud/runtime/component/c/d$f;->e()V

    .line 13
    monitor-exit v2

    return-void

    .line 14
    :goto_3
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_1
    move-exception v0

    move-object v2, v1

    goto/16 :goto_13

    .line 15
    :cond_1
    :try_start_3
    iget-object v2, v1, Ltech/sud/runtime/component/c/d$f;->s:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 16
    iget-object v2, v1, Ltech/sud/runtime/component/c/d$f;->s:Ljava/util/ArrayList;

    const/4 v14, 0x0

    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Ljava/lang/Runnable;

    move-object/from16 v19, v3

    const/4 v0, 0x0

    const/4 v2, 0x0

    goto/16 :goto_a

    .line 17
    :cond_2
    iget-boolean v2, v1, Ltech/sud/runtime/component/c/d$f;->e:Z

    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->d:Z

    if-eq v2, v0, :cond_3

    .line 18
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->e:Z

    .line 19
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 20
    const-string v2, "GLThread"

    move/from16 v18, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v19, v3

    const-string v3, "mPaused is now "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, v1, Ltech/sud/runtime/component/c/d$f;->e:Z

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " tid="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v20, v4

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_3
    move-object/from16 v19, v3

    move/from16 v20, v4

    const/16 v18, 0x0

    .line 21
    :goto_4
    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->l:Z

    if-eqz v0, :cond_4

    .line 22
    const-string v0, "GLThread"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "releasing EGL context because asked to tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    invoke-direct {v1}, Ltech/sud/runtime/component/c/d$f;->d()V

    .line 24
    invoke-direct {v1}, Ltech/sud/runtime/component/c/d$f;->e()V

    const/4 v0, 0x0

    .line 25
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->l:Z

    const/4 v11, 0x1

    :cond_4
    if-eqz v7, :cond_5

    .line 26
    invoke-direct {v1}, Ltech/sud/runtime/component/c/d$f;->d()V

    .line 27
    invoke-direct {v1}, Ltech/sud/runtime/component/c/d$f;->e()V

    const/4 v7, 0x0

    :cond_5
    if-eqz v18, :cond_6

    .line 28
    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->j:Z

    if-eqz v0, :cond_6

    .line 29
    const-string v0, "GLThread"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "releasing EGL surface because paused tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    invoke-direct {v1}, Ltech/sud/runtime/component/c/d$f;->d()V

    :cond_6
    if-eqz v18, :cond_8

    .line 31
    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->i:Z

    if-eqz v0, :cond_8

    .line 32
    iget-object v0, v1, Ltech/sud/runtime/component/c/d$f;->w:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltech/sud/runtime/component/c/d;

    if-eqz v0, :cond_7

    .line 33
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->g(Ltech/sud/runtime/component/c/d;)Z

    move-result v0

    if-eqz v0, :cond_7

    goto :goto_5

    .line 34
    :cond_7
    invoke-direct {v1}, Ltech/sud/runtime/component/c/d$f;->e()V

    .line 35
    const-string v0, "GLThread"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "releasing EGL context because paused tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    :cond_8
    :goto_5
    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->f:Z

    if-nez v0, :cond_a

    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->h:Z

    if-nez v0, :cond_a

    .line 37
    const-string v0, "GLThread"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "noticed textureView surface lost tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->j:Z

    if-eqz v0, :cond_9

    .line 39
    invoke-direct {v1}, Ltech/sud/runtime/component/c/d$f;->d()V

    :cond_9
    const/4 v0, 0x1

    .line 40
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->h:Z

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->g:Z

    .line 42
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 43
    :cond_a
    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->f:Z

    if-eqz v0, :cond_b

    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->h:Z

    if-eqz v0, :cond_b

    .line 44
    const-string v0, "GLThread"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "noticed textureView surface acquired tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 45
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->h:Z

    .line 46
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    :cond_b
    if-eqz v10, :cond_c

    .line 47
    const-string v0, "GLThread"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sending render notification tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 48
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->q:Z

    const/4 v0, 0x1

    .line 49
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->r:Z

    .line 50
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    const/4 v10, 0x0

    .line 51
    :cond_c
    iget-object v0, v1, Ltech/sud/runtime/component/c/d$f;->u:Ljava/lang/Runnable;

    if-eqz v0, :cond_d

    const/4 v2, 0x0

    .line 52
    iput-object v2, v1, Ltech/sud/runtime/component/c/d$f;->u:Ljava/lang/Runnable;

    move-object v15, v0

    goto :goto_6

    :cond_d
    const/4 v2, 0x0

    .line 53
    :goto_6
    invoke-direct {v1}, Ltech/sud/runtime/component/c/d$f;->g()Z

    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_22

    .line 54
    :try_start_4
    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->i:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_7

    if-nez v0, :cond_f

    if-eqz v11, :cond_e

    move/from16 v4, v20

    const/4 v11, 0x0

    goto :goto_7

    .line 55
    :cond_e
    :try_start_5
    iget-object v0, v1, Ltech/sud/runtime/component/c/d$f;->v:Ltech/sud/runtime/component/c/d$e;

    invoke-virtual {v0}, Ltech/sud/runtime/component/c/d$e;->a()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    const/4 v0, 0x1

    .line 56
    :try_start_6
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->i:Z

    .line 57
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    const/4 v4, 0x1

    goto :goto_7

    :catch_0
    move-exception v0

    .line 58
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v2

    invoke-virtual {v2, v1}, Ltech/sud/runtime/component/c/d$g;->b(Ltech/sud/runtime/component/c/d$f;)V

    .line 59
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :cond_f
    move/from16 v4, v20

    .line 60
    :goto_7
    :try_start_7
    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->i:Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    if-eqz v0, :cond_10

    :try_start_8
    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->j:Z

    if-nez v0, :cond_10

    const/4 v0, 0x1

    .line 61
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->j:Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    const/4 v5, 0x1

    const/4 v6, 0x1

    const/4 v8, 0x1

    .line 62
    :cond_10
    :try_start_9
    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->j:Z

    if-eqz v0, :cond_21

    .line 63
    iget-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->t:Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_7

    if-eqz v0, :cond_11

    .line 64
    :try_start_a
    iget v12, v1, Ltech/sud/runtime/component/c/d$f;->m:I

    .line 65
    iget v13, v1, Ltech/sud/runtime/component/c/d$f;->n:I

    const/4 v0, 0x1

    .line 66
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->q:Z

    .line 67
    const-string v0, "GLThread"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "noticing that we want render notification tid="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v17, v4

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 68
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->t:Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    const/4 v5, 0x1

    const/4 v8, 0x1

    :goto_8
    const/4 v0, 0x0

    goto :goto_9

    :cond_11
    move/from16 v17, v4

    goto :goto_8

    .line 69
    :goto_9
    :try_start_b
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->p:Z

    .line 70
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 71
    iget-boolean v3, v1, Ltech/sud/runtime/component/c/d$f;->q:Z

    move/from16 v4, v17

    if-eqz v3, :cond_12

    const/4 v9, 0x1

    .line 72
    :cond_12
    :goto_a
    monitor-exit v16
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    if-eqz v14, :cond_13

    .line 73
    :try_start_c
    invoke-interface {v14}, Ljava/lang/Runnable;->run()V

    move-object v14, v2

    move-object/from16 v3, v19

    goto/16 :goto_0

    :catchall_2
    move-exception v0

    move-object v2, v1

    goto/16 :goto_14

    :cond_13
    if-eqz v5, :cond_15

    .line 74
    const-string v3, "GLThread"

    const-string v0, "egl createSurface"

    invoke-static {v3, v0}, Ltech/sud/runtime/component/h/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    iget-object v0, v1, Ltech/sud/runtime/component/c/d$f;->v:Ltech/sud/runtime/component/c/d$e;

    invoke-virtual {v0}, Ltech/sud/runtime/component/c/d$e;->b()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 76
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v3

    monitor-enter v3
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    const/4 v0, 0x1

    .line 77
    :try_start_d
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->k:Z

    .line 78
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 79
    monitor-exit v3

    const/4 v5, 0x0

    goto :goto_b

    :catchall_3
    move-exception v0

    .line 80
    monitor-exit v3
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    :try_start_e
    throw v0

    .line 81
    :cond_14
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v3

    monitor-enter v3
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    const/4 v0, 0x1

    .line 82
    :try_start_f
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->k:Z

    .line 83
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->g:Z

    .line 84
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 85
    monitor-exit v3

    move-object/from16 v3, v19

    const/4 v0, 0x0

    goto/16 :goto_0

    :catchall_4
    move-exception v0

    .line 86
    monitor-exit v3
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    :try_start_10
    throw v0

    :cond_15
    :goto_b
    if-eqz v6, :cond_16

    .line 87
    iget-object v0, v1, Ltech/sud/runtime/component/c/d$f;->v:Ltech/sud/runtime/component/c/d$e;

    invoke-virtual {v0}, Ltech/sud/runtime/component/c/d$e;->c()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/opengles/GL10;

    move-object v3, v0

    const/4 v6, 0x0

    goto :goto_c

    :cond_16
    move-object/from16 v3, v19

    :goto_c
    if-eqz v4, :cond_18

    .line 88
    const-string v0, "GLThread"

    const-string v4, "onSurfaceCreated"

    invoke-static {v0, v4}, Ltech/sud/runtime/component/h/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    iget-object v0, v1, Ltech/sud/runtime/component/c/d$f;->w:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltech/sud/runtime/component/c/d;

    if-eqz v0, :cond_17

    .line 90
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->h(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$Renderer;

    move-result-object v0

    iget-object v4, v1, Ltech/sud/runtime/component/c/d$f;->v:Ltech/sud/runtime/component/c/d$e;

    iget-object v4, v4, Ltech/sud/runtime/component/c/d$e;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v0, v3, v4}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    :cond_17
    const/4 v4, 0x0

    :cond_18
    if-eqz v8, :cond_1a

    .line 91
    const-string v0, "GLThread"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSurfaceChanged("

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Ltech/sud/runtime/component/h/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    iget-object v0, v1, Ltech/sud/runtime/component/c/d$f;->w:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltech/sud/runtime/component/c/d;

    if-eqz v0, :cond_19

    .line 93
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->h(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$Renderer;

    move-result-object v0

    invoke-interface {v0, v3, v12, v13}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    :cond_19
    const/4 v8, 0x0

    .line 94
    :cond_1a
    :try_start_11
    iget-object v0, v1, Ltech/sud/runtime/component/c/d$f;->w:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltech/sud/runtime/component/c/d;
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_6

    if-eqz v0, :cond_1c

    .line 95
    :try_start_12
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->h(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$Renderer;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/opengl/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 96
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->i(Ltech/sud/runtime/component/c/d;)Ltech/sud/runtime/core/d$a;

    move-result-object v2

    if-eqz v2, :cond_1b

    .line 97
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->i(Ltech/sud/runtime/component/c/d;)Ltech/sud/runtime/core/d$a;

    move-result-object v0

    iget-boolean v0, v0, Ltech/sud/runtime/core/d$a;->a:Z

    goto :goto_d

    :cond_1b
    const/4 v0, 0x0

    :goto_d
    if-eqz v15, :cond_1d

    .line 98
    invoke-interface {v15}, Ljava/lang/Runnable;->run()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    const/4 v15, 0x0

    goto :goto_e

    :cond_1c
    const/4 v0, 0x0

    :cond_1d
    :goto_e
    if-eqz v0, :cond_1f

    .line 99
    :try_start_13
    iget-object v0, v1, Ltech/sud/runtime/component/c/d$f;->v:Ltech/sud/runtime/component/c/d$e;

    invoke-virtual {v0}, Ltech/sud/runtime/component/c/d$e;->d()I

    move-result v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_6

    const/16 v2, 0x3000

    if-eq v0, v2, :cond_1f

    const/16 v2, 0x300e

    if-eq v0, v2, :cond_1e

    .line 100
    :try_start_14
    const-string v2, "GLThread"

    move-object/from16 v16, v3

    const-string v3, "eglSwapBuffers"

    invoke-static {v2, v3, v0}, Ltech/sud/runtime/component/c/d$e;->a(Ljava/lang/String;Ljava/lang/String;I)V

    .line 101
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v2

    monitor-enter v2
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_2

    const/4 v0, 0x1

    .line 102
    :try_start_15
    iput-boolean v0, v1, Ltech/sud/runtime/component/c/d$f;->g:Z

    .line 103
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 104
    monitor-exit v2

    goto :goto_f

    :catchall_5
    move-exception v0

    monitor-exit v2
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_5

    :try_start_16
    throw v0
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_2

    :cond_1e
    move-object/from16 v16, v3

    const/4 v0, 0x1

    .line 105
    :try_start_17
    const-string v2, "GLThread"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "egl context lost tid="

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_6

    const/4 v7, 0x1

    goto :goto_f

    :catchall_6
    move-exception v0

    move-object/from16 v2, p0

    goto/16 :goto_14

    :cond_1f
    move-object/from16 v16, v3

    :goto_f
    const/4 v0, 0x0

    if-eqz v9, :cond_20

    const/4 v9, 0x0

    const/4 v10, 0x1

    :cond_20
    move-object/from16 v1, p0

    move-object/from16 v3, v16

    goto/16 :goto_0

    :catchall_7
    move-exception v0

    move-object/from16 v2, p0

    goto/16 :goto_13

    :cond_21
    move/from16 v17, v4

    goto :goto_10

    :cond_22
    if-eqz v15, :cond_23

    .line 106
    :try_start_18
    const-string v0, "GLThread"

    const-string v1, "Warning, !readyToDraw() but waiting for draw finished! Early reporting draw finished."

    invoke-static {v0, v1}, Ltech/sud/runtime/component/h/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    invoke-interface {v15}, Ljava/lang/Runnable;->run()V

    move/from16 v4, v20

    const/4 v15, 0x0

    goto :goto_10

    :cond_23
    move/from16 v4, v20

    .line 108
    :goto_10
    const-string v0, "GLThread"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "waiting tid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " mHaveEglContext: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_7

    move-object/from16 v2, p0

    :try_start_19
    iget-boolean v3, v2, Ltech/sud/runtime/component/c/d$f;->i:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " mHaveEglSurface: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, v2, Ltech/sud/runtime/component/c/d$f;->j:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " mFinishedCreatingEglSurface: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, v2, Ltech/sud/runtime/component/c/d$f;->k:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " mPaused: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, v2, Ltech/sud/runtime/component/c/d$f;->e:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " mHasSurface: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, v2, Ltech/sud/runtime/component/c/d$f;->f:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " mSurfaceIsBad: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, v2, Ltech/sud/runtime/component/c/d$f;->g:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " mWaitingForSurface: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, v2, Ltech/sud/runtime/component/c/d$f;->h:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " mWidth: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v2, Ltech/sud/runtime/component/c/d$f;->m:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " mHeight: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v2, Ltech/sud/runtime/component/c/d$f;->n:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " mRequestRender: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, v2, Ltech/sud/runtime/component/c/d$f;->p:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " mRenderMode: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v2, Ltech/sud/runtime/component/c/d$f;->o:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    iget-boolean v0, v2, Ltech/sud/runtime/component/c/d$f;->b:Z

    if-eqz v0, :cond_25

    .line 110
    monitor-exit v16
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_9

    .line 111
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v1

    monitor-enter v1

    .line 112
    :try_start_1a
    iget-object v0, v2, Ltech/sud/runtime/component/c/d$f;->w:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltech/sud/runtime/component/c/d;

    if-eqz v0, :cond_24

    .line 113
    invoke-virtual {v0}, Ltech/sud/runtime/component/c/d;->b()V

    goto :goto_11

    :catchall_8
    move-exception v0

    goto :goto_12

    .line 114
    :cond_24
    :goto_11
    invoke-direct {v2}, Ltech/sud/runtime/component/c/d$f;->d()V

    .line 115
    invoke-direct {v2}, Ltech/sud/runtime/component/c/d$f;->e()V

    .line 116
    monitor-exit v1

    return-void

    .line 117
    :goto_12
    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_8

    throw v0

    :catchall_9
    move-exception v0

    goto :goto_13

    .line 118
    :cond_25
    :try_start_1b
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V

    move-object v1, v2

    move-object/from16 v3, v19

    const/4 v0, 0x0

    goto/16 :goto_1

    .line 119
    :goto_13
    monitor-exit v16
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_9

    :try_start_1c
    throw v0
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_a

    :catchall_a
    move-exception v0

    .line 120
    :goto_14
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v1

    monitor-enter v1

    .line 121
    :try_start_1d
    iget-object v3, v2, Ltech/sud/runtime/component/c/d$f;->w:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltech/sud/runtime/component/c/d;

    if-eqz v3, :cond_26

    .line 122
    invoke-virtual {v3}, Ltech/sud/runtime/component/c/d;->b()V

    goto :goto_15

    :catchall_b
    move-exception v0

    goto :goto_16

    .line 123
    :cond_26
    :goto_15
    invoke-direct {v2}, Ltech/sud/runtime/component/c/d$f;->d()V

    .line 124
    invoke-direct {v2}, Ltech/sud/runtime/component/c/d$f;->e()V

    .line 125
    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_b

    .line 126
    throw v0

    .line 127
    :goto_16
    :try_start_1e
    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_b

    throw v0
.end method

.method private g()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->f:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->g:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget v0, p0, Ltech/sud/runtime/component/c/d$f;->m:I

    .line 14
    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    iget v0, p0, Ltech/sud/runtime/component/c/d$f;->n:I

    .line 18
    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    iget-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->p:Z

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget p0, p0, Ltech/sud/runtime/component/c/d$f;->o:I

    .line 27
    .line 28
    if-ne p0, v1, :cond_1

    .line 29
    .line 30
    :cond_0
    return v1

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method


# virtual methods
.method public a(I)V
    .locals 1

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    if-gt p1, v0, :cond_0

    .line 149
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    monitor-enter v0

    .line 150
    :try_start_0
    iput p1, p0, Ltech/sud/runtime/component/c/d$f;->o:I

    .line 151
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 152
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    .line 153
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 154
    :cond_0
    const-string p0, "renderMode"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 171
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    monitor-enter v0

    .line 172
    :try_start_0
    iget-object p0, p0, Ltech/sud/runtime/component/c/d$f;->s:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 173
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 174
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    .line 175
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 176
    :cond_0
    const-string p0, "r must not be null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-void
.end method

.method public a(Ltech/sud/runtime/component/d/a;)V
    .locals 12

    .line 155
    const-string v0, "surfaceCreated tid="

    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v1

    monitor-enter v1

    .line 156
    :try_start_0
    const-string v2, "GLThread"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 157
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->f:Z

    const/4 v2, 0x0

    .line 158
    iput-boolean v2, p0, Ltech/sud/runtime/component/c/d$f;->k:Z

    .line 159
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 160
    :cond_0
    :goto_0
    iget-boolean v3, p0, Ltech/sud/runtime/component/c/d$f;->h:Z

    if-eqz v3, :cond_3

    iget-boolean v3, p0, Ltech/sud/runtime/component/c/d$f;->k:Z

    if-nez v3, :cond_3

    iget-boolean v3, p0, Ltech/sud/runtime/component/c/d$f;->c:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_3

    if-eqz v2, :cond_1

    .line 161
    :try_start_1
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 162
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    const-wide/32 v5, 0xf4240

    div-long/2addr v3, v5

    .line 163
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v7

    const-wide/16 v8, 0xfa0

    invoke-virtual {v7, v8, v9}, Ljava/lang/Object;->wait(J)V

    .line 164
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    div-long/2addr v10, v5
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    sub-long/2addr v10, v3

    cmp-long v3, v10, v8

    if-ltz v3, :cond_0

    .line 165
    :try_start_2
    const-string v2, "GLThread"

    const-string v3, "surfaceCreated \u89e6\u53d1\u4e86anr\u76d1\u63a7"

    invoke-static {v2, v3}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_2

    .line 166
    const-string v2, "onGameANRDetected"

    const-string v3, ""

    invoke-virtual {p1, v2, v3}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_2
    move v2, v0

    goto :goto_0

    :catch_0
    move v2, v0

    .line 167
    :catch_1
    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 168
    :cond_3
    monitor-exit v1

    return-void

    .line 169
    :goto_1
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p0
.end method

.method public a(Ltech/sud/runtime/component/d/a;II)V
    .locals 10

    .line 1
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iput p2, p0, Ltech/sud/runtime/component/c/d$f;->m:I

    .line 7
    .line 8
    iput p3, p0, Ltech/sud/runtime/component/c/d$f;->n:I

    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    iput-boolean p2, p0, Ltech/sud/runtime/component/c/d$f;->t:Z

    .line 12
    .line 13
    iput-boolean p2, p0, Ltech/sud/runtime/component/c/d$f;->p:Z

    .line 14
    .line 15
    const/4 p3, 0x0

    .line 16
    iput-boolean p3, p0, Ltech/sud/runtime/component/c/d$f;->r:Z

    .line 17
    .line 18
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-ne v1, p0, :cond_0

    .line 23
    .line 24
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_0
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    iget-boolean v1, p0, Ltech/sud/runtime/component/c/d$f;->c:Z

    .line 37
    .line 38
    if-nez v1, :cond_4

    .line 39
    .line 40
    iget-boolean v1, p0, Ltech/sud/runtime/component/c/d$f;->e:Z

    .line 41
    .line 42
    if-nez v1, :cond_4

    .line 43
    .line 44
    iget-boolean v1, p0, Ltech/sud/runtime/component/c/d$f;->r:Z

    .line 45
    .line 46
    if-nez v1, :cond_4

    .line 47
    .line 48
    invoke-virtual {p0}, Ltech/sud/runtime/component/c/d$f;->a()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_4

    .line 53
    .line 54
    const-string v1, "GLThread"

    .line 55
    .line 56
    new-instance v2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    const-string v3, "onWindowResize waiting for render complete from tid="

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 67
    .line 68
    .line 69
    move-result-wide v3

    .line 70
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v1, v2}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    .line 79
    .line 80
    if-eqz p3, :cond_2

    .line 81
    .line 82
    :try_start_1
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 91
    .line 92
    .line 93
    move-result-wide v1

    .line 94
    const-wide/32 v3, 0xf4240

    .line 95
    .line 96
    .line 97
    div-long/2addr v1, v3

    .line 98
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    const-wide/16 v6, 0xfa0

    .line 103
    .line 104
    invoke-virtual {v5, v6, v7}, Ljava/lang/Object;->wait(J)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 108
    .line 109
    .line 110
    move-result-wide v8

    .line 111
    div-long/2addr v8, v3
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    sub-long/2addr v8, v1

    .line 113
    cmp-long v1, v8, v6

    .line 114
    .line 115
    if-ltz v1, :cond_1

    .line 116
    .line 117
    :try_start_2
    const-string p3, "GLThread"

    .line 118
    .line 119
    const-string v1, "onWindowResize \u89e6\u53d1\u4e86anr\u76d1\u63a7"

    .line 120
    .line 121
    invoke-static {p3, v1}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    if-eqz p1, :cond_3

    .line 125
    .line 126
    const-string p3, "onGameANRDetected"

    .line 127
    .line 128
    const-string v1, ""

    .line 129
    .line 130
    invoke-virtual {p1, p3, v1}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 131
    .line 132
    .line 133
    :cond_3
    move p3, p2

    .line 134
    goto :goto_0

    .line 135
    :catch_0
    move p3, p2

    .line 136
    :catch_1
    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_4
    monitor-exit v0

    .line 145
    return-void

    .line 146
    :goto_1
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 147
    throw p0
.end method

.method public a()Z
    .locals 1

    .line 148
    iget-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->i:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->j:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Ltech/sud/runtime/component/c/d$f;->g()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public b()I
    .locals 1

    .line 116
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    monitor-enter v0

    .line 117
    :try_start_0
    iget p0, p0, Ltech/sud/runtime/component/c/d$f;->o:I

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    .line 118
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public b(Ltech/sud/runtime/component/d/a;)V
    .locals 11

    .line 1
    const-string v0, "surfaceDestroyed tid="

    .line 2
    .line 3
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    const-string v2, "GLThread"

    .line 9
    .line 10
    new-instance v3, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 16
    .line 17
    .line 18
    move-result-wide v4

    .line 19
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v2, v0}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->f:Z

    .line 31
    .line 32
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 37
    .line 38
    .line 39
    :cond_0
    :goto_0
    iget-boolean v2, p0, Ltech/sud/runtime/component/c/d$f;->h:Z

    .line 40
    .line 41
    if-nez v2, :cond_2

    .line 42
    .line 43
    iget-boolean v2, p0, Ltech/sud/runtime/component/c/d$f;->c:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    if-nez v2, :cond_2

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    :try_start_1
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2}, Ljava/lang/Object;->wait()V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 60
    .line 61
    .line 62
    move-result-wide v2

    .line 63
    const-wide/32 v4, 0xf4240

    .line 64
    .line 65
    .line 66
    div-long/2addr v2, v4

    .line 67
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    const-wide/16 v7, 0xfa0

    .line 72
    .line 73
    invoke-virtual {v6, v7, v8}, Ljava/lang/Object;->wait(J)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 77
    .line 78
    .line 79
    move-result-wide v9

    .line 80
    div-long/2addr v9, v4

    .line 81
    sub-long/2addr v9, v2

    .line 82
    cmp-long v2, v9, v7

    .line 83
    .line 84
    if-ltz v2, :cond_0

    .line 85
    .line 86
    const/4 v0, 0x1

    .line 87
    const-string v2, "GLThread"

    .line 88
    .line 89
    const-string v3, "surfaceDestroyed \u89e6\u53d1\u4e86anr\u76d1\u63a7"

    .line 90
    .line 91
    invoke-static {v2, v3}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    if-eqz p1, :cond_0

    .line 95
    .line 96
    const-string v2, "onGameANRDetected"

    .line 97
    .line 98
    const-string v3, ""

    .line 99
    .line 100
    invoke-virtual {p1, v2, v3}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_2
    monitor-exit v1

    .line 113
    return-void

    .line 114
    :goto_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 115
    throw p0
.end method

.method public c()V
    .locals 2

    .line 125
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object v0

    monitor-enter v0

    const/4 v1, 0x1

    .line 126
    :try_start_0
    iput-boolean v1, p0, Ltech/sud/runtime/component/c/d$f;->p:Z

    .line 127
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 128
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    .line 129
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public c(Ltech/sud/runtime/component/d/a;)V
    .locals 12

    .line 1
    const-string v0, "onPause tid="

    .line 2
    .line 3
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    const-string v2, "GLThread"

    .line 9
    .line 10
    new-instance v3, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 16
    .line 17
    .line 18
    move-result-wide v4

    .line 19
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v2, v0}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->d:Z

    .line 31
    .line 32
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 37
    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    :cond_0
    :goto_0
    iget-boolean v3, p0, Ltech/sud/runtime/component/c/d$f;->c:Z

    .line 41
    .line 42
    if-nez v3, :cond_3

    .line 43
    .line 44
    iget-boolean v3, p0, Ltech/sud/runtime/component/c/d$f;->e:Z

    .line 45
    .line 46
    if-nez v3, :cond_3

    .line 47
    .line 48
    const-string v3, "GLThread"

    .line 49
    .line 50
    const-string v4, "onPause waiting for mPaused."

    .line 51
    .line 52
    invoke-static {v3, v4}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    :try_start_1
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3}, Ljava/lang/Object;->wait()V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception p0

    .line 66
    goto :goto_1

    .line 67
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 68
    .line 69
    .line 70
    move-result-wide v3

    .line 71
    const-wide/32 v5, 0xf4240

    .line 72
    .line 73
    .line 74
    div-long/2addr v3, v5

    .line 75
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    const-wide/16 v8, 0xfa0

    .line 80
    .line 81
    invoke-virtual {v7, v8, v9}, Ljava/lang/Object;->wait(J)V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 85
    .line 86
    .line 87
    move-result-wide v10

    .line 88
    div-long/2addr v10, v5
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    sub-long/2addr v10, v3

    .line 90
    cmp-long v3, v10, v8

    .line 91
    .line 92
    if-ltz v3, :cond_0

    .line 93
    .line 94
    :try_start_2
    const-string v2, "GLThread"

    .line 95
    .line 96
    const-string v3, "onPause \u89e6\u53d1\u4e86anr\u76d1\u63a7"

    .line 97
    .line 98
    invoke-static {v2, v3}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    if-eqz p1, :cond_2

    .line 102
    .line 103
    const-string v2, "onGameANRDetected"

    .line 104
    .line 105
    const-string v3, ""

    .line 106
    .line 107
    invoke-virtual {p1, v2, v3}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 108
    .line 109
    .line 110
    :cond_2
    move v2, v0

    .line 111
    goto :goto_0

    .line 112
    :catch_0
    move v2, v0

    .line 113
    :catch_1
    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_3
    monitor-exit v1

    .line 122
    return-void

    .line 123
    :goto_1
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 124
    throw p0
.end method

.method public d(Ltech/sud/runtime/component/d/a;)V
    .locals 12

    .line 1
    const-string v0, "onResume tid="

    .line 2
    .line 3
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    const-string v2, "GLThread"

    .line 9
    .line 10
    new-instance v3, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 16
    .line 17
    .line 18
    move-result-wide v4

    .line 19
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v2, v0}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->d:Z

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    iput-boolean v2, p0, Ltech/sud/runtime/component/c/d$f;->p:Z

    .line 34
    .line 35
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/d$f;->r:Z

    .line 36
    .line 37
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 42
    .line 43
    .line 44
    :cond_0
    :goto_0
    iget-boolean v3, p0, Ltech/sud/runtime/component/c/d$f;->c:Z

    .line 45
    .line 46
    if-nez v3, :cond_3

    .line 47
    .line 48
    iget-boolean v3, p0, Ltech/sud/runtime/component/c/d$f;->e:Z

    .line 49
    .line 50
    if-eqz v3, :cond_3

    .line 51
    .line 52
    iget-boolean v3, p0, Ltech/sud/runtime/component/c/d$f;->r:Z

    .line 53
    .line 54
    if-nez v3, :cond_3

    .line 55
    .line 56
    const-string v3, "GLThread"

    .line 57
    .line 58
    const-string v4, "onResume waiting for !mPaused."

    .line 59
    .line 60
    invoke-static {v3, v4}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    :try_start_1
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v3}, Ljava/lang/Object;->wait()V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :catchall_0
    move-exception p0

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 76
    .line 77
    .line 78
    move-result-wide v3

    .line 79
    const-wide/32 v5, 0xf4240

    .line 80
    .line 81
    .line 82
    div-long/2addr v3, v5

    .line 83
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    const-wide/16 v8, 0xfa0

    .line 88
    .line 89
    invoke-virtual {v7, v8, v9}, Ljava/lang/Object;->wait(J)V

    .line 90
    .line 91
    .line 92
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 93
    .line 94
    .line 95
    move-result-wide v10

    .line 96
    div-long/2addr v10, v5
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    sub-long/2addr v10, v3

    .line 98
    cmp-long v3, v10, v8

    .line 99
    .line 100
    if-ltz v3, :cond_0

    .line 101
    .line 102
    :try_start_2
    const-string v0, "GLThread"

    .line 103
    .line 104
    const-string v3, "onResume \u89e6\u53d1\u4e86anr\u76d1\u63a7"

    .line 105
    .line 106
    invoke-static {v0, v3}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    if-eqz p1, :cond_2

    .line 110
    .line 111
    const-string v0, "onGameANRDetected"

    .line 112
    .line 113
    const-string v3, ""

    .line 114
    .line 115
    invoke-virtual {p1, v0, v3}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 116
    .line 117
    .line 118
    :cond_2
    move v0, v2

    .line 119
    goto :goto_0

    .line 120
    :catch_0
    move v0, v2

    .line 121
    :catch_1
    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_3
    monitor-exit v1

    .line 130
    return-void

    .line 131
    :goto_1
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 132
    throw p0
.end method

.method public e(Ltech/sud/runtime/component/d/a;)V
    .locals 12

    .line 1
    const-string v0, "GLThread"

    .line 2
    .line 3
    const-string v1, "requestExitAndWait"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    monitor-enter v0

    .line 13
    const/4 v1, 0x1

    .line 14
    :try_start_0
    iput-boolean v1, p0, Ltech/sud/runtime/component/c/d$f;->b:Z

    .line 15
    .line 16
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 21
    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    :cond_0
    :goto_0
    iget-boolean v3, p0, Ltech/sud/runtime/component/c/d$f;->c:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    if-nez v3, :cond_3

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    :try_start_1
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3}, Ljava/lang/Object;->wait()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    const-wide/32 v5, 0xf4240

    .line 45
    .line 46
    .line 47
    div-long/2addr v3, v5

    .line 48
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    const-wide/16 v8, 0xfa0

    .line 53
    .line 54
    invoke-virtual {v7, v8, v9}, Ljava/lang/Object;->wait(J)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 58
    .line 59
    .line 60
    move-result-wide v10

    .line 61
    div-long/2addr v10, v5
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    sub-long/2addr v10, v3

    .line 63
    cmp-long v3, v10, v8

    .line 64
    .line 65
    if-ltz v3, :cond_0

    .line 66
    .line 67
    :try_start_2
    const-string v2, "GLThread"

    .line 68
    .line 69
    const-string v3, "requestExitAndWait \u89e6\u53d1\u4e86anr\u76d1\u63a7"

    .line 70
    .line 71
    invoke-static {v2, v3}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    const-string v2, "onGameANRDetected"

    .line 77
    .line 78
    const-string v3, ""

    .line 79
    .line 80
    invoke-virtual {p1, v2, v3}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 81
    .line 82
    .line 83
    :cond_2
    move v2, v1

    .line 84
    goto :goto_0

    .line 85
    :catch_0
    move v2, v1

    .line 86
    :catch_1
    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    monitor-exit v0

    .line 95
    return-void

    .line 96
    :goto_1
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 97
    throw p0
.end method

.method public run()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "GLThread "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v1, "starting tid="

    .line 25
    .line 26
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 30
    .line 31
    .line 32
    move-result-wide v1

    .line 33
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "GLThread"

    .line 41
    .line 42
    invoke-static {v1, v0}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :try_start_0
    invoke-direct {p0}, Ltech/sud/runtime/component/c/d$f;->f()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/c/d$g;->a(Ltech/sud/runtime/component/c/d$f;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :catchall_0
    move-exception v0

    .line 57
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1, p0}, Ltech/sud/runtime/component/c/d$g;->a(Ltech/sud/runtime/component/c/d$f;)V

    .line 62
    .line 63
    .line 64
    throw v0

    .line 65
    :catch_0
    invoke-static {}, Ltech/sud/runtime/component/c/d;->d()Ltech/sud/runtime/component/c/d$g;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/c/d$g;->a(Ltech/sud/runtime/component/c/d$f;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
