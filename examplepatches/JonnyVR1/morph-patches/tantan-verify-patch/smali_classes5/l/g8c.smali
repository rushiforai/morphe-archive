.class public Ll/g8c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/requery/android/database/DatabaseErrorHandler;


# static fields
.field public static final s:Ljava/util/concurrent/locks/ReadWriteLock;

.field public static t:Z

.field public static u:Z


# instance fields
.field public a:Z

.field public b:Ll/vxd0;

.field public c:I

.field public final d:I

.field public final e:Ljava/lang/String;

.field public final f:Ljava/io/File;

.field public volatile g:Lio/requery/android/database/sqlite/SQLiteDatabase;

.field public volatile h:Ll/kcg0;

.field public final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/wzh0;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/wzh0;",
            ">;"
        }
    .end annotation
.end field

.field public k:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public volatile m:Z

.field public volatile n:Z

.field public o:Ll/j7b0;

.field public p:Z

.field public q:Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

.field public r:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-boolean v0, Ll/g8c;->t:Z

    .line 10
    .line 11
    sput-boolean v0, Ll/g8c;->u:Z

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/File;ILrx/c;Ll/pcj;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            "I",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/pcj<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/g8c;->a:Z

    .line 6
    .line 7
    iput v0, p0, Ll/g8c;->c:I

    .line 8
    .line 9
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/g8c;->i:Ljava/util/List;

    .line 15
    .line 16
    iput-object v1, p0, Ll/g8c;->j:Ljava/util/List;

    .line 17
    .line 18
    iput-boolean v0, p0, Ll/g8c;->m:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Ll/g8c;->n:Z

    .line 21
    .line 22
    new-instance v1, Ll/j7b0;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/j7b0;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ll/g8c;->o:Ll/j7b0;

    .line 28
    .line 29
    iput-boolean v0, p0, Ll/g8c;->p:Z

    .line 30
    .line 31
    iput-boolean v0, p0, Ll/g8c;->r:Z

    .line 32
    .line 33
    iput-object p1, p0, Ll/g8c;->e:Ljava/lang/String;

    .line 34
    .line 35
    iput-object p2, p0, Ll/g8c;->f:Ljava/io/File;

    .line 36
    .line 37
    iput p3, p0, Ll/g8c;->d:I

    .line 38
    .line 39
    iput-object p4, p0, Ll/g8c;->k:Lrx/c;

    .line 40
    .line 41
    iput-object p5, p0, Ll/g8c;->l:Ll/pcj;

    .line 42
    .line 43
    new-instance p2, Ll/vxd0;

    .line 44
    .line 45
    iget-object p3, p0, Ll/g8c;->o:Ll/j7b0;

    .line 46
    .line 47
    invoke-virtual {p3}, Ll/j7b0;->m()I

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    invoke-direct {p2, p1, p3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    iput-object p2, p0, Ll/g8c;->b:Ll/vxd0;

    .line 55
    .line 56
    iget-object p1, p0, Ll/g8c;->o:Ll/j7b0;

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/j7b0;->g()V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/g8c;->o:Ll/j7b0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/j7b0;->h()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static synthetic a(Ll/g8c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g8c;->t()V

    return-void
.end method

.method public static synthetic b(Ll/g8c;ZLl/pcj;Ll/y20;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/g8c;->q(ZLl/pcj;Ll/y20;Ljava/lang/String;Ll/x20;)V

    return-void
.end method

.method public static synthetic c(Ll/g8c;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g8c;->s(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/g8c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g8c;->r()V

    return-void
.end method

.method public static synthetic g(Ll/y20;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "PRAGMA wal_checkpoint("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ll/g8c;->p:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-string v1, "PASSIVE"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v1, "TRUNCATE"

    .line 16
    .line 17
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, ");"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {p1, v0, v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const/4 v0, 0x1

    .line 35
    iput-boolean v0, p0, Ll/g8c;->p:Z

    .line 36
    .line 37
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    .line 38
    .line 39
    .line 40
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public A(Ll/x20;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/g8c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 9
    .line 10
    .line 11
    sget-object v0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->beginTransactionDeferredWrite()V

    .line 25
    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    :try_start_0
    new-instance v2, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 29
    .line 30
    invoke-direct {v2}, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Ll/g8c;->q:Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 34
    .line 35
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Ll/l9c;->r()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    invoke-interface {p1}, Ll/x20;->call()V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception p1

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 63
    .line 64
    .line 65
    sget-boolean p1, Ll/g8c;->u:Z

    .line 66
    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    new-instance p1, Ll/g8c$a;

    .line 70
    .line 71
    invoke-direct {p1, p0}, Ll/g8c$a;-><init>(Ll/g8c;)V

    .line 72
    .line 73
    .line 74
    invoke-static {p1}, Lcom/tantanapp/common/utils/ThreadUtil;->g(Ljava/lang/Runnable;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    iput-object v1, p0, Ll/g8c;->q:Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 78
    .line 79
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :goto_1
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 92
    .line 93
    .line 94
    iput-object v1, p0, Ll/g8c;->q:Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 95
    .line 96
    sget-object p0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 97
    .line 98
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 103
    .line 104
    .line 105
    throw p1
.end method

.method public final B()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g8c;->g:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->tryLock()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {p0, v1}, Ll/g8c;->l(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    sget-object v0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 40
    .line 41
    .line 42
    throw p0

    .line 43
    :cond_0
    return-void
.end method

.method public h(ZLl/pcj;Ll/y20;Ll/x20;ZLjava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z",
            "Ll/pcj<",
            "TT;>;",
            "Ll/y20<",
            "TT;>;",
            "Ll/x20;",
            "Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/a8c;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v6, p4

    .line 8
    move-object v5, p6

    .line 9
    invoke-direct/range {v0 .. v6}, Ll/a8c;-><init>(Ll/g8c;ZLl/pcj;Ll/y20;Ljava/lang/String;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, p5}, Ll/l51;->t(Ljava/lang/Runnable;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public i(Ll/pcj;Ll/y20;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "TT;>;",
            "Ll/y20<",
            "TT;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/g8c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->beginTransactionDeferredReadOnly()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :try_start_1
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance p3, Ll/e8c;

    .line 20
    .line 21
    invoke-direct {p3, p2, p1}, Ll/e8c;-><init>(Ll/y20;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p3}, Lcom/tantanapp/common/utils/ThreadUtil;->g(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 39
    .line 40
    .line 41
    sget-object p0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :catchall_0
    move-exception p1

    .line 52
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 57
    .line 58
    .line 59
    sget-object p0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 60
    .line 61
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 66
    .line 67
    .line 68
    throw p1

    .line 69
    :catch_0
    move-exception p0

    .line 70
    new-instance p1, Ljava/lang/RuntimeException;

    .line 71
    .line 72
    new-instance p2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v0, "queryFetchError:"

    .line 75
    .line 76
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-direct {p1, p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    throw p0
.end method

.method public final j(Lio/requery/android/database/sqlite/SQLiteDatabase;Ll/h9c;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Ll/h9c;->f()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    check-cast p2, Ll/wzh0;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v1, "\u521d\u59cb\u5316table "

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p2, Ll/wzh0;->d:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "DatabaseStore"

    .line 44
    .line 45
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p2, Ll/wzh0;->b:Ll/vzf0;

    .line 49
    .line 50
    invoke-virtual {v0, p2}, Ll/vzf0;->CREATE_TABLE(Ll/wzh0;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    :goto_0
    iget-object v1, p2, Ll/wzh0;->a:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-ge v0, v1, :cond_0

    .line 65
    .line 66
    iget-object v1, p2, Ll/wzh0;->a:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lcom/tantanapp/common/data/orm/Index;

    .line 73
    .line 74
    iget-object v2, p2, Ll/wzh0;->b:Ll/vzf0;

    .line 75
    .line 76
    invoke-virtual {v2, p2, v1}, Ll/vzf0;->CREATE_INDEX(Ll/wzh0;Lcom/tantanapp/common/data/orm/Index;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p1, v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    add-int/lit8 v0, v0, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    return-void
.end method

.method public k()Lio/requery/android/database/sqlite/SQLiteDatabase;
    .locals 6

    .line 1
    const-string v0, "[common][DatabaseStore]"

    .line 2
    .line 3
    const-string v1, "new version is "

    .line 4
    .line 5
    iget-object v2, p0, Ll/g8c;->g:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/g8c;->g:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object v2, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 13
    .line 14
    invoke-interface {v2}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 19
    .line 20
    .line 21
    :try_start_0
    iget-object v2, p0, Ll/g8c;->g:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 22
    .line 23
    if-nez v2, :cond_5

    .line 24
    .line 25
    const-string v2, "inter create db"

    .line 26
    .line 27
    invoke-static {v0, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/g8c;->f:Ljava/io/File;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    const/high16 v3, 0x30000000

    .line 44
    .line 45
    const/4 v4, 0x1

    .line 46
    const/4 v5, 0x0

    .line 47
    invoke-static {v2, v5, v3, v4, p0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Lio/requery/android/database/sqlite/SQLiteDatabase$CursorFactory;IZLio/requery/android/database/DatabaseErrorHandler;)Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    const-string v3, "SQLiteDatabase openDatabase"

    .line 52
    .line 53
    invoke-static {v0, v3}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->acquirePrimaryConnection()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 57
    .line 58
    .line 59
    :try_start_1
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->getVersion()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    iput v3, p0, Ll/g8c;->c:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 64
    .line 65
    const-string v4, "SQLiteDatabase onCreate"

    .line 66
    .line 67
    if-nez v3, :cond_1

    .line 68
    .line 69
    :try_start_2
    iget-object v1, p0, Ll/g8c;->b:Ll/vxd0;

    .line 70
    .line 71
    const/4 v3, 0x0

    .line 72
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v1, v3}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 80
    .line 81
    .line 82
    :try_start_3
    iget-object v1, p0, Ll/g8c;->o:Ll/j7b0;

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ll/j7b0;->l(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :catchall_0
    move-exception p0

    .line 89
    goto :goto_1

    .line 90
    :catch_0
    move-exception v1

    .line 91
    :try_start_4
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    const-string v1, "realDbVersion == 0"

    .line 95
    .line 96
    invoke-virtual {p0, v2, v1}, Ll/g8c;->u(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :goto_0
    invoke-static {v0, v4}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/g8c;->o:Ll/j7b0;

    .line 103
    .line 104
    invoke-virtual {v0}, Ll/j7b0;->c()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    invoke-virtual {v2, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setVersion(I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 112
    .line 113
    .line 114
    :try_start_5
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 115
    .line 116
    .line 117
    invoke-direct {p0, v2}, Ll/g8c;->l(Lio/requery/android/database/sqlite/SQLiteDatabase;)V

    .line 118
    .line 119
    .line 120
    goto :goto_5

    .line 121
    :catchall_1
    move-exception p0

    .line 122
    goto/16 :goto_7

    .line 123
    .line 124
    :goto_1
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 125
    .line 126
    .line 127
    throw p0

    .line 128
    :cond_1
    invoke-direct {p0, v2}, Ll/g8c;->l(Lio/requery/android/database/sqlite/SQLiteDatabase;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 132
    .line 133
    .line 134
    :try_start_6
    iget-object v5, p0, Ll/g8c;->o:Ll/j7b0;

    .line 135
    .line 136
    invoke-virtual {v5}, Ll/j7b0;->m()I

    .line 137
    .line 138
    .line 139
    move-result v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 140
    if-gt v3, v5, :cond_2

    .line 141
    .line 142
    :try_start_7
    iget-object v5, p0, Ll/g8c;->o:Ll/j7b0;

    .line 143
    .line 144
    invoke-virtual {v5, v2}, Ll/j7b0;->l(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 145
    .line 146
    .line 147
    goto :goto_2

    .line 148
    :catchall_2
    move-exception p0

    .line 149
    goto/16 :goto_6

    .line 150
    .line 151
    :catch_1
    move-exception v5

    .line 152
    :try_start_8
    invoke-static {v5}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 153
    .line 154
    .line 155
    const-string v5, "realDbVersion <= providerManager.getDbSplitVersion()"

    .line 156
    .line 157
    invoke-virtual {p0, v2, v5}, Ll/g8c;->u(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    :goto_2
    invoke-static {v0, v4}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    :cond_2
    iget-object v4, p0, Ll/g8c;->o:Ll/j7b0;

    .line 164
    .line 165
    invoke-virtual {v4}, Ll/j7b0;->c()I

    .line 166
    .line 167
    .line 168
    move-result v4

    .line 169
    if-ge v3, v4, :cond_3

    .line 170
    .line 171
    iget-object v1, p0, Ll/g8c;->b:Ll/vxd0;

    .line 172
    .line 173
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    invoke-virtual {v1, v4}, Ll/vxd0;->put(Ljava/lang/Object;)Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 178
    .line 179
    .line 180
    :try_start_9
    iget-object v1, p0, Ll/g8c;->o:Ll/j7b0;

    .line 181
    .line 182
    invoke-virtual {v1}, Ll/j7b0;->c()I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    invoke-static {v2, v3, v1}, Ll/yg50;->h(Lio/requery/android/database/sqlite/SQLiteDatabase;II)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 187
    .line 188
    .line 189
    goto :goto_3

    .line 190
    :catch_2
    move-exception v1

    .line 191
    :try_start_a
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 192
    .line 193
    .line 194
    const-string v1, "realDbVersion < providerManager.dbVersion()"

    .line 195
    .line 196
    invoke-virtual {p0, v2, v1}, Ll/g8c;->u(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    :goto_3
    const-string v1, "SQLiteDatabase onUpgrade"

    .line 200
    .line 201
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Ll/g8c;->o:Ll/j7b0;

    .line 205
    .line 206
    invoke-virtual {v0}, Ll/j7b0;->c()I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    invoke-virtual {v2, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setVersion(I)V

    .line 211
    .line 212
    .line 213
    goto :goto_4

    .line 214
    :cond_3
    iget-object v4, p0, Ll/g8c;->o:Ll/j7b0;

    .line 215
    .line 216
    invoke-virtual {v4}, Ll/j7b0;->c()I

    .line 217
    .line 218
    .line 219
    move-result v4

    .line 220
    if-gt v3, v4, :cond_4

    .line 221
    .line 222
    const-string v1, "SQLiteDatabase \u6ca1\u6709\u7248\u672c\u5347\u7ea7"

    .line 223
    .line 224
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    :goto_4
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 228
    .line 229
    .line 230
    :try_start_b
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 231
    .line 232
    .line 233
    :goto_5
    :try_start_c
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->releasePrimaryConnection()V

    .line 234
    .line 235
    .line 236
    iput-object v2, p0, Ll/g8c;->g:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 237
    .line 238
    new-instance v0, Ll/z7c;

    .line 239
    .line 240
    invoke-direct {v0, p0}, Ll/z7c;-><init>(Ll/g8c;)V

    .line 241
    .line 242
    .line 243
    const-wide/16 v1, 0x64

    .line 244
    .line 245
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/ThreadUtil;->h(Ljava/lang/Runnable;J)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 246
    .line 247
    .line 248
    goto :goto_8

    .line 249
    :cond_4
    :try_start_d
    const-string v0, "realDbVersion > providerManager.dbVersion()"

    .line 250
    .line 251
    invoke-virtual {p0, v2, v0}, Ll/g8c;->u(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    new-instance v0, Lcom/tantanapp/common/utils/DBCorruptException;

    .line 255
    .line 256
    new-instance v3, Ljava/lang/StringBuilder;

    .line 257
    .line 258
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    iget v1, p0, Ll/g8c;->d:I

    .line 262
    .line 263
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    const-string v1, ", while old is"

    .line 267
    .line 268
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    iget p0, p0, Ll/g8c;->d:I

    .line 272
    .line 273
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    invoke-direct {v0, p0}, Lcom/tantanapp/common/utils/DBCorruptException;-><init>(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    throw v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 284
    :goto_6
    :try_start_e
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 285
    .line 286
    .line 287
    throw p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 288
    :goto_7
    :try_start_f
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->releasePrimaryConnection()V

    .line 289
    .line 290
    .line 291
    throw p0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 292
    :cond_5
    :goto_8
    sget-object v0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 293
    .line 294
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 299
    .line 300
    .line 301
    iget-object p0, p0, Ll/g8c;->g:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 302
    .line 303
    return-object p0

    .line 304
    :catchall_3
    move-exception p0

    .line 305
    sget-object v0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 306
    .line 307
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 312
    .line 313
    .line 314
    throw p0
.end method

.method public m(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g8c;->o:Ll/j7b0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j7b0;->k()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Ll/g8c;->n:Z

    .line 17
    .line 18
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/l9c;->z()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    iget-object v1, p0, Ll/g8c;->g:Lio/requery/android/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    const-string v2, "[common][DatabaseStore]"

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    :try_start_1
    iget-object v1, p0, Ll/g8c;->g:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 32
    .line 33
    invoke-virtual {v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->inTransaction()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget-object v1, p0, Ll/g8c;->g:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 40
    .line 41
    invoke-virtual {v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 42
    .line 43
    .line 44
    :cond_0
    const-string v1, "SQLiteDatabase close"

    .line 45
    .line 46
    invoke-static {v2, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/g8c;->g:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 50
    .line 51
    invoke-virtual {v1}, Lio/requery/android/database/sqlite/SQLiteClosable;->close()V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Ll/g8c;->h:Ll/kcg0;

    .line 55
    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    iget-object v1, p0, Ll/g8c;->h:Ll/kcg0;

    .line 59
    .line 60
    invoke-interface {v1}, Ll/kcg0;->isUnsubscribed()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_1

    .line 65
    .line 66
    iget-object v1, p0, Ll/g8c;->h:Ll/kcg0;

    .line 67
    .line 68
    invoke-interface {v1}, Ll/kcg0;->unsubscribe()V

    .line 69
    .line 70
    .line 71
    :cond_1
    const/4 v1, 0x0

    .line 72
    iput-object v1, p0, Ll/g8c;->g:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 73
    .line 74
    :cond_2
    const-string v1, "SQLiteDatabase before delete"

    .line 75
    .line 76
    invoke-static {v2, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    if-nez p1, :cond_3

    .line 80
    .line 81
    sget-boolean p1, Ll/uqb0;->C0:Z

    .line 82
    .line 83
    if-nez p1, :cond_4

    .line 84
    .line 85
    :cond_3
    iget-object p0, p0, Ll/g8c;->f:Ljava/io/File;

    .line 86
    .line 87
    invoke-static {p0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->deleteDatabase(Ljava/io/File;)Z

    .line 88
    .line 89
    .line 90
    :cond_4
    const-string p0, "SQLiteDatabase after delete"

    .line 91
    .line 92
    invoke-static {v2, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    .line 94
    .line 95
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :catchall_0
    move-exception p0

    .line 104
    sget-object p1, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 105
    .line 106
    invoke-interface {p1}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 111
    .line 112
    .line 113
    throw p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/g8c;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/g8c;->r:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->beginTransactionDeferredReadOnly()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->getVersion()I

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Ll/g8c;->r:Z

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onCorruption(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    .locals 4

    .line 1
    iget-boolean p1, p0, Ll/g8c;->a:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Ll/g8c;->a:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/g8c;->e:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "core_v2_"

    .line 11
    .line 12
    const-string v2, ""

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 19
    .line 20
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v3, "oldUid.equals(newUid) : "

    .line 27
    .line 28
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const-string v3, "[common][DatabaseStore]"

    .line 43
    .line 44
    invoke-static {v3, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {p0, p1}, Ll/g8c;->m(Z)V

    .line 55
    .line 56
    .line 57
    const-string p0, "delete database and throw DBCorruptException"

    .line 58
    .line 59
    invoke-static {v3, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    new-instance p0, Lcom/tantanapp/common/utils/DBCorruptException;

    .line 63
    .line 64
    const-string p1, "delete database when database maybe error"

    .line 65
    .line 66
    invoke-direct {p0, p1}, Lcom/tantanapp/common/utils/DBCorruptException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p0

    .line 70
    :cond_1
    :goto_0
    const-wide/16 p0, 0x7d0

    .line 71
    .line 72
    :try_start_0
    invoke-static {p0, p1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :catch_0
    move-exception p0

    .line 77
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final p()I
    .locals 1

    .line 1
    iget v0, p0, Ll/g8c;->c:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/g8c;->b:Ll/vxd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final synthetic q(ZLl/pcj;Ll/y20;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    sget-object p1, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->tryLock()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p2, p3, p4}, Ll/g8c;->i(Ll/pcj;Ll/y20;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    if-eqz p5, :cond_2

    .line 26
    .line 27
    new-instance p0, Ll/b8c;

    .line 28
    .line 29
    invoke-direct {p0, p5}, Ll/b8c;-><init>(Ll/x20;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0}, Lcom/tantanapp/common/utils/ThreadUtil;->g(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    sget-object p1, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p2, p3, p4}, Ll/g8c;->i(Ll/pcj;Ll/y20;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDatabaseCorruptException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void

    .line 49
    :catch_0
    move-exception p0

    .line 50
    const/16 p1, 0x14

    .line 51
    .line 52
    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final synthetic r()V
    .locals 1

    .line 1
    new-instance v0, Ll/f8c;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/f8c;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/g8c;->A(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic s(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/g8c;->m:Z

    .line 6
    .line 7
    iget-boolean p1, p0, Ll/g8c;->m:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    new-instance p1, Ll/d8c;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/d8c;-><init>(Ll/g8c;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    invoke-static {p1, p0}, Ll/l51;->t(Ljava/lang/Runnable;Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic t()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/g8c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/g8c;->o()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/g8c;->k:Lrx/c;

    .line 12
    .line 13
    new-instance v1, Ll/c8c;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/c8c;-><init>(Ll/g8c;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/g8c;->h:Ll/kcg0;

    .line 27
    .line 28
    return-void
.end method

.method public u(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onCorruptionOpt: from:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-string v0, "[common][DatabaseStore]"

    .line 16
    .line 17
    invoke-static {v0, p2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/g8c;->onCorruption(Lio/requery/android/database/sqlite/SQLiteDatabase;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g8c;->o:Ll/j7b0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j7b0;->o()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w(Ll/h9c;)V
    .locals 12

    .line 1
    const-string v0, " deleted():"

    .line 2
    .line 3
    const-string v1, "db provider "

    .line 4
    .line 5
    const-string v2, "db provider update"

    .line 6
    .line 7
    const-string v3, ": version old: 0, new: "

    .line 8
    .line 9
    const-string v4, "db provider init"

    .line 10
    .line 11
    const-string v5, "\u6ce8\u518cprovider  "

    .line 12
    .line 13
    iget-boolean v6, p0, Ll/g8c;->n:Z

    .line 14
    .line 15
    const-string v7, "DatabaseStore"

    .line 16
    .line 17
    if-nez v6, :cond_7

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    sget-object v8, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 24
    .line 25
    invoke-interface {v8}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 26
    .line 27
    .line 28
    move-result-object v8

    .line 29
    invoke-interface {v8}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v6}, Lio/requery/android/database/sqlite/SQLiteDatabase;->acquirePrimaryConnection()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v6}, Lio/requery/android/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 36
    .line 37
    .line 38
    :try_start_0
    invoke-virtual {p1}, Ll/h9c;->h()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ll/h9c;->e()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    invoke-virtual {p1}, Ll/h9c;->g()V

    .line 46
    .line 47
    .line 48
    iget-object v9, p0, Ll/g8c;->o:Ll/j7b0;

    .line 49
    .line 50
    invoke-virtual {v9, v8}, Ll/j7b0;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/data/TableProviderInfo;

    .line 51
    .line 52
    .line 53
    move-result-object v9

    .line 54
    new-instance v10, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v10, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-static {v7, v5}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    const-string v5, " db version "

    .line 70
    .line 71
    const-string v10, "\u5347\u7ea7\u7248\u672c "

    .line 72
    .line 73
    const-string v11, "provider thread "

    .line 74
    .line 75
    if-nez v9, :cond_2

    .line 76
    .line 77
    :try_start_1
    new-instance v1, Lcom/p1/mobile/putong/data/TableProviderInfo;

    .line 78
    .line 79
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/TableProviderInfo;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object v8, v1, Lcom/p1/mobile/putong/data/TableProviderInfo;->name:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/h9c;->c()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    iput v2, v1, Lcom/p1/mobile/putong/data/TableProviderInfo;->version:I

    .line 89
    .line 90
    invoke-virtual {p1}, Ll/h9c;->d()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iput-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    .line 100
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v2, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-static {}, Ll/l51;->D()Z

    .line 106
    .line 107
    .line 108
    move-result v9

    .line 109
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-static {v7, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ll/g8c;->p()I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    const/4 v9, 0x1

    .line 124
    if-nez v2, :cond_0

    .line 125
    .line 126
    invoke-virtual {p0, v6, p1}, Ll/g8c;->j(Lio/requery/android/database/sqlite/SQLiteDatabase;Ll/h9c;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :catchall_0
    move-exception v1

    .line 131
    goto/16 :goto_5

    .line 132
    .line 133
    :catch_0
    move-exception v1

    .line 134
    goto :goto_1

    .line 135
    :cond_0
    invoke-virtual {p1}, Ll/h9c;->c()I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    if-le v2, v9, :cond_1

    .line 140
    .line 141
    invoke-virtual {p1}, Ll/h9c;->c()I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    invoke-virtual {p1, v6, v9, v2}, Ll/h9c;->j(Lio/requery/android/database/sqlite/SQLiteDatabase;II)V

    .line 146
    .line 147
    .line 148
    :cond_1
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v2, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-static {v7, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Ll/g8c;->o:Ll/j7b0;

    .line 164
    .line 165
    invoke-virtual {v2, v6, v1, v9}, Ll/j7b0;->p(Lio/requery/android/database/sqlite/SQLiteDatabase;Lcom/p1/mobile/putong/data/TableProviderInfo;Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 166
    .line 167
    .line 168
    goto :goto_2

    .line 169
    :goto_1
    :try_start_3
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 170
    .line 171
    .line 172
    const-string v1, "registerProvider Exception providerInfo == null"

    .line 173
    .line 174
    invoke-virtual {p0, v6, v1}, Ll/g8c;->u(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p1}, Ll/h9c;->e()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v6}, Lio/requery/android/database/sqlite/SQLiteDatabase;->getVersion()I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1}, Ll/h9c;->c()I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-static {v7, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    goto/16 :goto_4

    .line 217
    .line 218
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    invoke-direct {v3, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    invoke-static {}, Ll/l51;->D()Z

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    invoke-static {v7, v3}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    iget v3, v9, Lcom/p1/mobile/putong/data/TableProviderInfo;->version:I

    .line 238
    .line 239
    invoke-virtual {p1}, Ll/h9c;->c()I

    .line 240
    .line 241
    .line 242
    move-result v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 243
    if-le v4, v3, :cond_3

    .line 244
    .line 245
    :try_start_4
    invoke-virtual {p1, v6, v3, v4}, Ll/h9c;->j(Lio/requery/android/database/sqlite/SQLiteDatabase;II)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p1}, Ll/h9c;->c()I

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    iput v2, v9, Lcom/p1/mobile/putong/data/TableProviderInfo;->version:I

    .line 253
    .line 254
    new-instance v2, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    invoke-direct {v2, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-static {v7, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    iget-object v2, p0, Ll/g8c;->o:Ll/j7b0;

    .line 270
    .line 271
    const/4 v8, 0x0

    .line 272
    invoke-virtual {v2, v6, v9, v8}, Ll/j7b0;->p(Lio/requery/android/database/sqlite/SQLiteDatabase;Lcom/p1/mobile/putong/data/TableProviderInfo;Z)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 273
    .line 274
    .line 275
    goto :goto_3

    .line 276
    :catch_1
    move-exception v2

    .line 277
    :try_start_5
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 278
    .line 279
    .line 280
    const-string v2, "registerProvider Exception providerInfo != null "

    .line 281
    .line 282
    invoke-virtual {p0, v6, v2}, Ll/g8c;->u(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    goto :goto_3

    .line 286
    :cond_3
    if-lt v4, v3, :cond_5

    .line 287
    .line 288
    new-instance v2, Ljava/lang/StringBuilder;

    .line 289
    .line 290
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 291
    .line 292
    .line 293
    invoke-virtual {p1}, Ll/h9c;->e()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v8

    .line 297
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    const-string v8, " version not change"

    .line 301
    .line 302
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    invoke-static {v7, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    .line 313
    .line 314
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {p1}, Ll/h9c;->e()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v6}, Lio/requery/android/database/sqlite/SQLiteDatabase;->getVersion()I

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    const-string v1, ": version old: "

    .line 335
    .line 336
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    const-string v1, ", new: "

    .line 343
    .line 344
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    invoke-static {v7, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    :goto_4
    invoke-virtual {v6}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 358
    .line 359
    .line 360
    invoke-virtual {p0, p1}, Ll/g8c;->x(Ll/h9c;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 361
    .line 362
    .line 363
    new-instance v1, Ljava/lang/StringBuilder;

    .line 364
    .line 365
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 366
    .line 367
    .line 368
    invoke-virtual {p1}, Ll/h9c;->e()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object p1

    .line 372
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    invoke-virtual {p0}, Ll/g8c;->n()Z

    .line 379
    .line 380
    .line 381
    move-result p1

    .line 382
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    invoke-static {v7, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    invoke-virtual {p0}, Ll/g8c;->n()Z

    .line 393
    .line 394
    .line 395
    move-result p0

    .line 396
    if-nez p0, :cond_4

    .line 397
    .line 398
    invoke-virtual {v6}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 399
    .line 400
    .line 401
    invoke-virtual {v6}, Lio/requery/android/database/sqlite/SQLiteDatabase;->releasePrimaryConnection()V

    .line 402
    .line 403
    .line 404
    :cond_4
    sget-object p0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 405
    .line 406
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 407
    .line 408
    .line 409
    move-result-object p0

    .line 410
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 411
    .line 412
    .line 413
    return-void

    .line 414
    :cond_5
    :try_start_6
    const-string v1, "registerProvider newVersion < oldVersion)"

    .line 415
    .line 416
    invoke-virtual {p0, v6, v1}, Ll/g8c;->u(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    new-instance v1, Lcom/tantanapp/common/utils/DBCorruptException;

    .line 420
    .line 421
    new-instance v3, Ljava/lang/StringBuilder;

    .line 422
    .line 423
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 424
    .line 425
    .line 426
    invoke-virtual {p1}, Ll/h9c;->e()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object v2

    .line 430
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    const-string v2, " version error new version must >= old version"

    .line 434
    .line 435
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v2

    .line 442
    invoke-direct {v1, v2}, Lcom/tantanapp/common/utils/DBCorruptException;-><init>(Ljava/lang/String;)V

    .line 443
    .line 444
    .line 445
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 446
    :goto_5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 447
    .line 448
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 449
    .line 450
    .line 451
    invoke-virtual {p1}, Ll/h9c;->e()Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object p1

    .line 455
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    invoke-virtual {p0}, Ll/g8c;->n()Z

    .line 462
    .line 463
    .line 464
    move-result p1

    .line 465
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 466
    .line 467
    .line 468
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object p1

    .line 472
    invoke-static {v7, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {p0}, Ll/g8c;->n()Z

    .line 476
    .line 477
    .line 478
    move-result p0

    .line 479
    if-nez p0, :cond_6

    .line 480
    .line 481
    invoke-virtual {v6}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 482
    .line 483
    .line 484
    invoke-virtual {v6}, Lio/requery/android/database/sqlite/SQLiteDatabase;->releasePrimaryConnection()V

    .line 485
    .line 486
    .line 487
    :cond_6
    sget-object p0, Ll/g8c;->s:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 488
    .line 489
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 490
    .line 491
    .line 492
    move-result-object p0

    .line 493
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 494
    .line 495
    .line 496
    throw v1

    .line 497
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 498
    .line 499
    const-string v0, "registerProvider db has delete name: "

    .line 500
    .line 501
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 502
    .line 503
    .line 504
    invoke-virtual {p1}, Ll/h9c;->e()Ljava/lang/String;

    .line 505
    .line 506
    .line 507
    move-result-object v1

    .line 508
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 509
    .line 510
    .line 511
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object p0

    .line 515
    invoke-static {v7, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    .line 517
    .line 518
    new-instance p0, Lcom/tantanapp/common/utils/DBCorruptException;

    .line 519
    .line 520
    invoke-virtual {p1}, Ll/h9c;->e()Ljava/lang/String;

    .line 521
    .line 522
    .line 523
    move-result-object p1

    .line 524
    new-instance v1, Ljava/lang/StringBuilder;

    .line 525
    .line 526
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 527
    .line 528
    .line 529
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object p1

    .line 536
    invoke-direct {p0, p1}, Lcom/tantanapp/common/utils/DBCorruptException;-><init>(Ljava/lang/String;)V

    .line 537
    .line 538
    .line 539
    throw p0
.end method

.method public final x(Ll/h9c;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/h9c;->f()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/wzh0;

    .line 26
    .line 27
    iget-object v1, p0, Ll/g8c;->i:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/g8c;->r:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :try_start_0
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 18
    .line 19
    .line 20
    iput-boolean v0, p0, Ll/g8c;->r:Z

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    invoke-virtual {p0}, Ll/g8c;->k()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 29
    .line 30
    .line 31
    iput-boolean v0, p0, Ll/g8c;->r:Z

    .line 32
    .line 33
    throw p1

    .line 34
    :cond_0
    :goto_0
    iget-boolean v0, p0, Ll/g8c;->m:Z

    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Ll/g8c;->l:Ll/pcj;

    .line 39
    .line 40
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ljava/lang/Long;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    const-wide/16 v2, 0x1388

    .line 51
    .line 52
    cmp-long v0, v0, v2

    .line 53
    .line 54
    if-lez v0, :cond_1

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/g8c;->B()V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->tickSynced:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Ll/pf60;

    .line 76
    .line 77
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast v1, Ll/x20;

    .line 80
    .line 81
    invoke-interface {v1}, Ll/x20;->call()V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    iget-object v0, p0, Ll/g8c;->i:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_3

    .line 96
    .line 97
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    check-cast v1, Ll/wzh0;

    .line 102
    .line 103
    iget-object v2, v1, Ll/wzh0;->d:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p1, v2}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Ljava/util/List;

    .line 110
    .line 111
    invoke-virtual {v1, v2}, Ll/wzh0;->syncUiCache(Ljava/util/List;)V

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_3
    invoke-virtual {p0}, Ll/g8c;->o()V

    .line 116
    .line 117
    .line 118
    iget-object v0, p1, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->tickSynced:Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-eqz v1, :cond_4

    .line 129
    .line 130
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    check-cast v1, Ll/pf60;

    .line 135
    .line 136
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 137
    .line 138
    check-cast v1, Ll/x20;

    .line 139
    .line 140
    invoke-interface {v1}, Ll/x20;->call()V

    .line 141
    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_4
    iget-object p0, p0, Ll/g8c;->i:Ljava/util/List;

    .line 145
    .line 146
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-eqz v0, :cond_7

    .line 155
    .line 156
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Ll/wzh0;

    .line 161
    .line 162
    iget-object v1, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 163
    .line 164
    invoke-virtual {p1, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    if-eqz v1, :cond_6

    .line 169
    .line 170
    iget-object v1, v0, Ll/wzh0;->e:Ljava/util/Map;

    .line 171
    .line 172
    if-eqz v1, :cond_6

    .line 173
    .line 174
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    :cond_5
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    if-eqz v2, :cond_6

    .line 187
    .line 188
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    check-cast v2, Ljava/lang/String;

    .line 193
    .line 194
    iget-object v3, v0, Ll/wzh0;->e:Ljava/util/Map;

    .line 195
    .line 196
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    check-cast v2, Ll/h0i0;

    .line 201
    .line 202
    iget-object v3, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {p1, v3}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    check-cast v3, Ljava/util/List;

    .line 209
    .line 210
    invoke-virtual {v2, v3}, Ll/h0i0;->a(Ljava/util/List;)Z

    .line 211
    .line 212
    .line 213
    move-result v3

    .line 214
    if-eqz v3, :cond_5

    .line 215
    .line 216
    iget-object v2, v2, Ll/h0i0;->b:Ll/x20;

    .line 217
    .line 218
    invoke-interface {v2}, Ll/x20;->call()V

    .line 219
    .line 220
    .line 221
    goto :goto_5

    .line 222
    :cond_6
    invoke-virtual {v0}, Ll/wzh0;->triggerMergeUpdates()V

    .line 223
    .line 224
    .line 225
    goto :goto_4

    .line 226
    :cond_7
    return-void
.end method

.method public z(Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g8c;->q:Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;->tickSynced:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method
