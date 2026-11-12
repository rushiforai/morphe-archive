.class public abstract Lno7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmch;
.implements Lw6f;


# static fields
.field public static final j:Landroid/util/SparseArray;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lko7;

.field public final c:I

.field public final d:Ljava/lang/String;

.field public final e:Li7f;

.field public f:Z

.field public g:I

.field public final h:Ljava/util/concurrent/CountDownLatch;

.field public volatile i:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lno7;->j:Landroid/util/SparseArray;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lko7;

    sget-object v1, Lvml;->d:Lumi;

    invoke-direct {v0, p0, v1}, Lko7;-><init>(Lno7;Lumi;)V

    iput-object v0, p0, Lno7;->b:Lko7;

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lno7;->e:Li7f;

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lno7;->h:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lno7;->a:Landroid/content/Context;

    iput p2, p0, Lno7;->c:I

    iput-object p3, p0, Lno7;->d:Ljava/lang/String;

    return-void
.end method

.method public static n(Landroid/content/Context;Lio7;Llo7;)Lno7;
    .registers 5

    sget-object v0, Lno7;->j:Landroid/util/SparseArray;

    monitor-enter v0

    :try_start_3
    iget-byte v1, p1, Lio7;->a:B

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lno7;

    if-nez v1, :cond_1b

    invoke-interface {p2, p0}, Llo7;->x(Landroid/content/Context;)Lno7;

    move-result-object v1

    iget-byte p0, p1, Lio7;->a:B

    invoke-virtual {v0, p0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object p0, v1, Lno7;->b:Lko7;

    invoke-virtual {p0}, Lldk;->h()V

    :cond_1b
    monitor-exit v0

    return-object v1

    :goto_1d
    monitor-exit v0
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1f

    throw p0

    :catchall_1f
    move-exception p0

    goto :goto_1d
.end method


# virtual methods
.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lmo7;

    invoke-virtual {p0, p1}, Lno7;->g(Lmo7;)V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lmo7;

    invoke-virtual {p0, p1}, Lno7;->p(Lmo7;)V

    return-void
.end method

.method public final a(Lio7;ILnch;Ljch;)V
    .registers 6

    iput p2, p0, Lno7;->g:I

    :try_start_2
    iget-object p1, p3, Lnch;->a:[B

    array-length p2, p1

    if-nez p2, :cond_e

    invoke-virtual {p0}, Lno7;->h()Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lno7;->i:Ljava/lang/Object;

    goto :goto_14

    :cond_e
    invoke-virtual {p0, p1}, Lno7;->q([B)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lno7;->i:Ljava/lang/Object;
    :try_end_14
    .catchall {:try_start_2 .. :try_end_14} :catchall_3d

    :goto_14
    iget-object p1, p0, Lno7;->i:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lno7;->r(Ljava/lang/Object;)V

    iget-object p1, p0, Lno7;->e:Li7f;

    invoke-static {p1, p1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p1

    :goto_1f
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_30

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lmo7;

    const/4 v0, 0x0

    invoke-interface {p2, v0}, Lmo7;->o(Z)V

    goto :goto_1f

    :cond_30
    iget-object p1, p3, Lnch;->a:[B

    iget-object p0, p0, Lno7;->b:Lko7;

    invoke-virtual {p0, p1}, Lldk;->g(Ljava/lang/Object;)V

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p4, p0}, Ljch;->run(Ljava/lang/Object;)V

    return-void

    :catchall_3d
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p4, p0}, Ljch;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final b(Ljava/lang/Runnable;)V
    .registers 5

    iget-boolean v0, p0, Lno7;->f:Z

    if-eqz v0, :cond_8

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_8
    new-instance v0, Lp1;

    const/4 v1, 0x5

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, p1, v2}, Lp1;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p0, p0, Lno7;->e:Li7f;

    invoke-virtual {p0, v0}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c()Lsa2;
    .registers 4

    new-instance v0, Lsa2;

    iget p0, p0, Lno7;->g:I

    const/16 v1, 0x9

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2}, Lsa2;-><init>(BIZ)V

    return-object v0
.end method

.method public e(Lcom/opera/android/PushedContentHandler;)V
    .registers 2

    return-void
.end method

.method public final f()V
    .registers 1

    return-void
.end method

.method public final g(Lmo7;)V
    .registers 3

    iget-object v0, p0, Lno7;->e:Li7f;

    invoke-virtual {v0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    iget-boolean p0, p0, Lno7;->f:Z

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    invoke-interface {p1, p0}, Lmo7;->o(Z)V

    :cond_10
    return-void
.end method

.method public h()Ljava/lang/Object;
    .registers 7

    new-instance v0, Lq1;

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lq1;-><init>(ZLjava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)V

    return-object v0
.end method

.method public final i()Ljava/lang/Object;
    .registers 1

    :try_start_0
    invoke-virtual {p0}, Lno7;->s()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_3} :catch_6

    iget-object p0, p0, Lno7;->i:Ljava/lang/Object;

    return-object p0

    :catch_6
    move-exception p0

    invoke-static {p0}, Lrqd;->p(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final j()Z
    .registers 4

    :try_start_0
    iget-object p0, p0, Lno7;->h:Ljava/util/concurrent/CountDownLatch;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v1, v2, v0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result p0
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_a} :catch_b

    return p0

    :catch_b
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lv1;->z(Lizd;)Lq1;

    move-result-object p0

    return-object p0
.end method

.method public l(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, Lno7;->h:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method

.method public m(Ljava/lang/Object;)V
    .registers 2

    return-void
.end method

.method public o()V
    .registers 1

    return-void
.end method

.method public final p(Lmo7;)V
    .registers 2

    iget-object p0, p0, Lno7;->e:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lv1;->z(Lizd;)Lq1;

    move-result-object p0

    return-object p0
.end method

.method public r(Ljava/lang/Object;)V
    .registers 2

    return-void
.end method

.method public final s()V
    .registers 4

    const-wide/16 v0, 0x3c

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object p0, p0, Lno7;->h:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0, v0, v1, v2}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result p0

    if-eqz p0, :cond_d

    return-void

    :cond_d
    const-string p0, ""

    invoke-static {p0}, Lh9o;->r(Ljava/lang/String;)V

    return-void
.end method
