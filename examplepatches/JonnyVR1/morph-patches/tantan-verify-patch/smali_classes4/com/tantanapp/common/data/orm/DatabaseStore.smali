.class public Lcom/tantanapp/common/data/orm/DatabaseStore;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/requery/android/database/DatabaseErrorHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/data/orm/DatabaseStore$Table;,
        Lcom/tantanapp/common/data/orm/DatabaseStore$TableTrigger;,
        Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;,
        Lcom/tantanapp/common/data/orm/DatabaseStore$Change;
    }
.end annotation


# static fields
.field public static final ASYNC_INIT:Z = true

.field public static final DETAILED_LOGGING:Z

.field public static final TAG:Ljava/lang/String; = "DatabaseStore"

.field public static debug_asyncFetchCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field public static debug_delayTransaction10Seconds:Z

.field public static debug_omitPostingChanges:Z


# instance fields
.field public final dbName:Ljava/lang/String;

.field private volatile dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;

.field public final dbPath:Ljava/io/File;

.field public final debug_tables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table;",
            ">;"
        }
    .end annotation
.end field

.field volatile deleted:Z

.field private foreground:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private getStartMillis:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field hasDoneTruncateCheckpoint:Z

.field private volatile lifecycleSubs:Ll/kcg0;

.field private final lock:Ljava/util/concurrent/locks/ReadWriteLock;

.field private final tables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/common/data/orm/DatabaseStore$Table;",
            ">;"
        }
    .end annotation
.end field

.field private volatile transaction:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

.field uiDeferredTransactionStarted:Z

.field volatile uiIsInForeground:Z

.field public final version:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-boolean v0, Ll/kmk0;->b:Z

    .line 2
    .line 3
    sput-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 4
    .line 5
    const-string v0, "sqlite3x"

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    sput-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_delayTransaction10Seconds:Z

    .line 12
    .line 13
    sput-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_omitPostingChanges:Z

    .line 14
    .line 15
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_asyncFetchCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 21
    .line 22
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
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->tables:Ljava/util/List;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_tables:Ljava/util/List;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->uiIsInForeground:Z

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->deleted:Z

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->transaction:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->uiDeferredTransactionStarted:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->hasDoneTruncateCheckpoint:Z

    .line 31
    .line 32
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbName:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbPath:Ljava/io/File;

    .line 35
    .line 36
    iput p3, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->version:I

    .line 37
    .line 38
    iput-object p4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->foreground:Lrx/c;

    .line 39
    .line 40
    iput-object p5, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->getStartMillis:Ll/pcj;

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/common/data/orm/DatabaseStore;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput-boolean p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->uiIsInForeground:Z

    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->uiIsInForeground:Z

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    new-instance p1, Ll/g7c;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/g7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-static {p1, p0}, Lcom/tantanapp/common/utils/ThreadUtil;->e(Ljava/lang/Runnable;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->transaction:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/tantanapp/common/data/orm/DatabaseStore;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->tables:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/y20;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/tantanapp/common/data/orm/DatabaseStore;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->ensureMainThreadDeferredTransactionStarted()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->foreground:Lrx/c;

    .line 5
    .line 6
    new-instance v1, Ll/f7c;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/f7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lifecycleSubs:Ll/kcg0;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic d(Lcom/tantanapp/common/data/orm/DatabaseStore;ZLl/pcj;Ll/y20;Ll/x20;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    sget-boolean v0, Ll/kmk0;->b:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_asyncFetchCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 14
    .line 15
    .line 16
    move-result-object v0
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDatabaseCorruptException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    :try_start_1
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->tryLock()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, p2, p3}, Lcom/tantanapp/common/data/orm/DatabaseStore;->asyncFetchInner(Ll/pcj;Ll/y20;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    if-eqz p4, :cond_3

    .line 38
    .line 39
    new-instance p0, Ll/c7c;

    .line 40
    .line 41
    invoke-direct {p0, p4}, Ll/c7c;-><init>(Ll/x20;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p0}, Lcom/tantanapp/common/utils/ThreadUtil;->g(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p2, p3}, Lcom/tantanapp/common/data/orm/DatabaseStore;->asyncFetchInner(Ll/pcj;Ll/y20;)V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteDatabaseCorruptException; {:try_start_1 .. :try_end_1} :catch_0

    .line 56
    .line 57
    .line 58
    :cond_3
    return-void

    .line 59
    :catch_0
    move-exception p0

    .line 60
    const/16 p1, 0x14

    .line 61
    .line 62
    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 0

    .line 66
    sget-object p0, Ll/kmk0;->a:Ljava/lang/String;

    return-void
.end method

.method public static synthetic e()V
    .locals 0

    .line 1
    return-void
.end method

.method public static explainQuery(Lio/requery/android/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "EXPLAIN QUERY PLAN "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->getColumnCount()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-ge p2, v0, :cond_0

    .line 36
    .line 37
    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, ":"

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-interface {p0, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v0, ", "

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    add-int/lit8 p2, p2, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p1, "EXPLAIN: \n\t"

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 76
    .line 77
    .line 78
    const-string p0, ""

    .line 79
    .line 80
    return-object p0
.end method

.method public static synthetic f(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/tantanapp/common/data/orm/DatabaseStore;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/b7c;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/b7c;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->transaction(Ll/x20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static i(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/kmk0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method private uiRunCheckpoint()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->tryLock()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db_checkpoint(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 42
    .line 43
    .line 44
    throw v0

    .line 45
    :cond_0
    return-void
.end method


# virtual methods
.method public asyncFetch(ZLl/pcj;Ll/y20;Ll/x20;Z)V
    .locals 6
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
            "Z)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/d7c;

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
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/d7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore;ZLl/pcj;Ll/y20;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, p5}, Lcom/tantanapp/common/utils/ThreadUtil;->e(Ljava/lang/Runnable;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public asyncFetchInner(Ll/pcj;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "TT;>;",
            "Ll/y20<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "async fetch finished, currently has "

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->deleted()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->beginTransactionDeferredReadOnly()V

    .line 15
    .line 16
    .line 17
    :try_start_0
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v1, Ll/a7c;

    .line 22
    .line 23
    invoke-direct {v1, p2, p1}, Ll/a7c;-><init>(Ll/y20;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Lcom/tantanapp/common/utils/ThreadUtil;->g(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    sget-boolean p1, Ll/kmk0;->b:Z

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    sget-object p1, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_asyncFetchCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    sget-boolean p2, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 40
    .line 41
    if-eqz p2, :cond_1

    .line 42
    .line 43
    new-instance p2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catchall_0
    move-exception p1

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 76
    .line 77
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :goto_1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 93
    .line 94
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 99
    .line 100
    .line 101
    throw p1
.end method

.method public db()Lio/requery/android/database/sqlite/SQLiteDatabase;
    .locals 6

    .line 1
    const-string v0, "[common][DatabaseStore]"

    .line 2
    .line 3
    const-string v1, "new version is "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

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
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 22
    .line 23
    if-nez v2, :cond_8

    .line 24
    .line 25
    sget-object v2, Ll/kmk0;->a:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "inter create db"

    .line 28
    .line 29
    invoke-static {v0, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget-boolean v2, Ll/kmk0;->c:Z

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    goto/16 :goto_a

    .line 42
    .line 43
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbPath:Ljava/io/File;

    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const/high16 v3, 0x30000000

    .line 57
    .line 58
    const/4 v4, 0x1

    .line 59
    const/4 v5, 0x0

    .line 60
    invoke-static {v2, v5, v3, v4, p0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Lio/requery/android/database/sqlite/SQLiteDatabase$CursorFactory;IZLio/requery/android/database/DatabaseErrorHandler;)Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const-string v3, "SQLiteDatabase openDatabase"

    .line 65
    .line 66
    invoke-static {v0, v3}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->acquirePrimaryConnection()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    .line 71
    .line 72
    :try_start_1
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->getVersion()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    iget v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->version:I

    .line 77
    .line 78
    if-eq v3, v4, :cond_6

    .line 79
    .line 80
    if-nez v3, :cond_3

    .line 81
    .line 82
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 83
    .line 84
    .line 85
    :try_start_2
    sget-boolean v1, Ll/kmk0;->b:Z

    .line 86
    .line 87
    if-eqz v1, :cond_2

    .line 88
    .line 89
    const-string v1, "creating db"

    .line 90
    .line 91
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :catchall_1
    move-exception v0

    .line 96
    goto :goto_3

    .line 97
    :cond_2
    :goto_1
    :try_start_3
    invoke-virtual {p0, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->onCreate(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :catch_0
    :try_start_4
    invoke-virtual {p0, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->onCorruption(Lio/requery/android/database/sqlite/SQLiteDatabase;)V

    .line 102
    .line 103
    .line 104
    :goto_2
    const-string v1, "SQLiteDatabase onCreate"

    .line 105
    .line 106
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->version:I

    .line 110
    .line 111
    invoke-virtual {v2, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setVersion(I)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 115
    .line 116
    .line 117
    :try_start_5
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db_checkpoint(Lio/requery/android/database/sqlite/SQLiteDatabase;)V

    .line 121
    .line 122
    .line 123
    goto :goto_7

    .line 124
    :catchall_2
    move-exception v0

    .line 125
    goto/16 :goto_8

    .line 126
    .line 127
    :goto_3
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 128
    .line 129
    .line 130
    throw v0

    .line 131
    :cond_3
    invoke-virtual {p0, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db_checkpoint(Lio/requery/android/database/sqlite/SQLiteDatabase;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 135
    .line 136
    .line 137
    :try_start_6
    iget v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->version:I

    .line 138
    .line 139
    if-gt v3, v4, :cond_5

    .line 140
    .line 141
    sget-boolean v1, Ll/kmk0;->b:Z

    .line 142
    .line 143
    if-eqz v1, :cond_4

    .line 144
    .line 145
    const-string v1, "updating db"

    .line 146
    .line 147
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 148
    .line 149
    .line 150
    goto :goto_4

    .line 151
    :catchall_3
    move-exception v0

    .line 152
    goto :goto_6

    .line 153
    :cond_4
    :goto_4
    :try_start_7
    iget v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->version:I

    .line 154
    .line 155
    invoke-virtual {p0, v2, v3, v1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->onUpgrade(Lio/requery/android/database/sqlite/SQLiteDatabase;II)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 156
    .line 157
    .line 158
    goto :goto_5

    .line 159
    :catch_1
    :try_start_8
    invoke-virtual {p0, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->onCorruption(Lio/requery/android/database/sqlite/SQLiteDatabase;)V

    .line 160
    .line 161
    .line 162
    :goto_5
    const-string v1, "SQLiteDatabase onUpgrade"

    .line 163
    .line 164
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->version:I

    .line 168
    .line 169
    invoke-virtual {v2, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setVersion(I)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 173
    .line 174
    .line 175
    :try_start_9
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db_checkpoint(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 179
    .line 180
    .line 181
    goto :goto_7

    .line 182
    :cond_5
    :try_start_a
    invoke-virtual {p0, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->onCorruption(Lio/requery/android/database/sqlite/SQLiteDatabase;)V

    .line 183
    .line 184
    .line 185
    new-instance v0, Lcom/tantanapp/common/utils/DBCorruptException;

    .line 186
    .line 187
    new-instance v4, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->version:I

    .line 193
    .line 194
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    const-string v1, ", while old is"

    .line 198
    .line 199
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    invoke-direct {v0, v1}, Lcom/tantanapp/common/utils/DBCorruptException;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 213
    :goto_6
    :try_start_b
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 214
    .line 215
    .line 216
    throw v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 217
    :cond_6
    :goto_7
    :try_start_c
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->releasePrimaryConnection()V

    .line 218
    .line 219
    .line 220
    iput-object v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 221
    .line 222
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 223
    .line 224
    if-eqz v0, :cond_7

    .line 225
    .line 226
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 227
    .line 228
    .line 229
    :cond_7
    new-instance v0, Ll/e7c;

    .line 230
    .line 231
    invoke-direct {v0, p0}, Ll/e7c;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore;)V

    .line 232
    .line 233
    .line 234
    const-wide/16 v1, 0x64

    .line 235
    .line 236
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/ThreadUtil;->h(Ljava/lang/Runnable;J)V

    .line 237
    .line 238
    .line 239
    goto :goto_9

    .line 240
    :goto_8
    invoke-virtual {v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->releasePrimaryConnection()V

    .line 241
    .line 242
    .line 243
    throw v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 244
    :cond_8
    :goto_9
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 245
    .line 246
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 251
    .line 252
    .line 253
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 254
    .line 255
    return-object p0

    .line 256
    :goto_a
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 257
    .line 258
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 263
    .line 264
    .line 265
    throw v0
.end method

.method public db_checkpoint(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    .locals 2

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "PRAGMA wal_checkpoint("

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->hasDoneTruncateCheckpoint:Z

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    const-string v1, "PASSIVE"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const-string v1, "TRUNCATE"

    .line 23
    .line 24
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ");"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {p1, v0, v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->hasDoneTruncateCheckpoint:Z

    .line 43
    .line 44
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    .line 45
    .line 46
    .line 47
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 48
    .line 49
    .line 50
    sget-boolean p0, Ll/kmk0;->c:Z

    .line 51
    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public debug_clear()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->tables:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/LruCache2;->evictAll()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public debug_db()Lio/requery/android/database/sqlite/SQLiteDatabase;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public delete()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->deleted:Z

    .line 12
    .line 13
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    const-string v1, "[common][DatabaseStore]"

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    :try_start_1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 20
    .line 21
    invoke-virtual {v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->inTransaction()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 28
    .line 29
    invoke-virtual {v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    const-string v0, "SQLiteDatabase close"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 41
    .line 42
    invoke-virtual {v0}, Lio/requery/android/database/sqlite/SQLiteClosable;->close()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lifecycleSubs:Ll/kcg0;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lifecycleSubs:Ll/kcg0;

    .line 50
    .line 51
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lifecycleSubs:Ll/kcg0;

    .line 58
    .line 59
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 60
    .line 61
    .line 62
    :cond_1
    const/4 v0, 0x0

    .line 63
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbObj:Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 64
    .line 65
    :cond_2
    const-string v0, "SQLiteDatabase before delete"

    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->dbPath:Ljava/io/File;

    .line 71
    .line 72
    invoke-static {v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->deleteDatabase(Ljava/io/File;)Z

    .line 73
    .line 74
    .line 75
    const-string v0, "SQLiteDatabase after delete"

    .line 76
    .line 77
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 81
    .line 82
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :goto_1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 91
    .line 92
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 97
    .line 98
    .line 99
    throw v0
.end method

.method public deleted()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->deleted:Z

    .line 2
    .line 3
    return p0
.end method

.method public ensureMainThreadDeferredTransactionStarted()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/u11;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->uiDeferredTransactionStarted:Z

    .line 9
    .line 10
    if-nez v0, :cond_3

    .line 11
    .line 12
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 17
    .line 18
    .line 19
    :cond_1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->beginTransactionDeferredReadOnly()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->getVersion()I

    .line 31
    .line 32
    .line 33
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 38
    .line 39
    .line 40
    :cond_2
    const/4 v0, 0x1

    .line 41
    iput-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->uiDeferredTransactionStarted:Z

    .line 42
    .line 43
    :cond_3
    return-void
.end method

.method public onCorruption(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .line 1
    sget-boolean p0, Ll/kmk0;->b:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "corruption!"

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onCreate(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->tables:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->CREATE_TABLE(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p1, v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    :goto_0
    iget-object v2, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->indexes:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-ge v1, v2, :cond_0

    .line 36
    .line 37
    iget-object v2, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->indexes:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/tantanapp/common/data/orm/Index;

    .line 44
    .line 45
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->adapter:Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;

    .line 46
    .line 47
    invoke-virtual {v3, v0, v2}, Lcom/tantanapp/common/data/orm/SqlDatabaseAdapter;->CREATE_INDEX(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Lcom/tantanapp/common/data/orm/Index;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {p1, v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    return-void
.end method

.method public onUpgrade(Lio/requery/android/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    return-void
.end method

.method public syncUiCache(Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;)V
    .locals 5

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/u11;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-boolean v0, Ll/kmk0;->b:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    const-string v2, "started sync ui cache"

    .line 17
    .line 18
    invoke-static {v2}, Lcom/tantanapp/common/data/orm/DatabaseStore;->i(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    :goto_0
    iget-boolean v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->uiDeferredTransactionStarted:Z

    .line 25
    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    :try_start_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 41
    .line 42
    .line 43
    iput-boolean v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->uiDeferredTransactionStarted:Z

    .line 44
    .line 45
    sget-boolean v2, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 46
    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v3, "ended previous deferred transaction "

    .line 52
    .line 53
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 57
    .line 58
    .line 59
    move-result-wide v3

    .line 60
    sub-long/2addr v3, v0

    .line 61
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->i(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :catchall_0
    move-exception p1

    .line 73
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 78
    .line 79
    .line 80
    iput-boolean v2, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->uiDeferredTransactionStarted:Z

    .line 81
    .line 82
    throw p1

    .line 83
    :cond_2
    :goto_1
    iget-boolean v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->uiIsInForeground:Z

    .line 84
    .line 85
    if-nez v0, :cond_3

    .line 86
    .line 87
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->getStartMillis:Ll/pcj;

    .line 88
    .line 89
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Ljava/lang/Long;

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 96
    .line 97
    .line 98
    move-result-wide v0

    .line 99
    const-wide/16 v2, 0x1388

    .line 100
    .line 101
    cmp-long v0, v0, v2

    .line 102
    .line 103
    if-lez v0, :cond_3

    .line 104
    .line 105
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->uiRunCheckpoint()V

    .line 106
    .line 107
    .line 108
    :cond_3
    iget-object v0, p1, Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;->tickSynced:Ljava/util/ArrayList;

    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_4

    .line 119
    .line 120
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Ll/pf60;

    .line 125
    .line 126
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v1, Ll/x20;

    .line 129
    .line 130
    invoke-interface {v1}, Ll/x20;->call()V

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_4
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->tables:Ljava/util/List;

    .line 135
    .line 136
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-eqz v1, :cond_5

    .line 145
    .line 146
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    check-cast v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 151
    .line 152
    iget-object v2, v1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {p1, v2}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    check-cast v2, Ljava/util/List;

    .line 159
    .line 160
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->syncUiCache(Ljava/util/List;)V

    .line 161
    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_5
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->ensureMainThreadDeferredTransactionStarted()V

    .line 165
    .line 166
    .line 167
    sget-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 168
    .line 169
    if-eqz v0, :cond_6

    .line 170
    .line 171
    const-string v0, "ended sync"

    .line 172
    .line 173
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->i(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :cond_6
    iget-object v0, p1, Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;->tickSynced:Ljava/util/ArrayList;

    .line 177
    .line 178
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    if-eqz v1, :cond_7

    .line 187
    .line 188
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    check-cast v1, Ll/pf60;

    .line 193
    .line 194
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 195
    .line 196
    check-cast v1, Ll/x20;

    .line 197
    .line 198
    invoke-interface {v1}, Ll/x20;->call()V

    .line 199
    .line 200
    .line 201
    goto :goto_4

    .line 202
    :cond_7
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->tables:Ljava/util/List;

    .line 203
    .line 204
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    :goto_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-eqz v0, :cond_a

    .line 213
    .line 214
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    check-cast v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    .line 219
    .line 220
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {p1, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    if-eqz v1, :cond_9

    .line 227
    .line 228
    iget-object v1, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->triggers:Ljava/util/Map;

    .line 229
    .line 230
    if-eqz v1, :cond_9

    .line 231
    .line 232
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    :cond_8
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    if-eqz v2, :cond_9

    .line 245
    .line 246
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    check-cast v2, Ljava/lang/String;

    .line 251
    .line 252
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->triggers:Ljava/util/Map;

    .line 253
    .line 254
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    check-cast v2, Lcom/tantanapp/common/data/orm/DatabaseStore$TableTrigger;

    .line 259
    .line 260
    iget-object v3, v0, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->tableName:Ljava/lang/String;

    .line 261
    .line 262
    invoke-virtual {p1, v3}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    check-cast v3, Ljava/util/List;

    .line 267
    .line 268
    invoke-virtual {v2, v3}, Lcom/tantanapp/common/data/orm/DatabaseStore$TableTrigger;->isTriggered(Ljava/util/List;)Z

    .line 269
    .line 270
    .line 271
    move-result v3

    .line 272
    if-eqz v3, :cond_8

    .line 273
    .line 274
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/DatabaseStore$TableTrigger;->action:Ll/x20;

    .line 275
    .line 276
    invoke-interface {v2}, Ll/x20;->call()V

    .line 277
    .line 278
    .line 279
    goto :goto_6

    .line 280
    :cond_9
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->triggerMergeUpdates()V

    .line 281
    .line 282
    .line 283
    goto :goto_5

    .line 284
    :cond_a
    sget-boolean p0, Ll/kmk0;->b:Z

    .line 285
    .line 286
    if-eqz p0, :cond_b

    .line 287
    .line 288
    const-string p0, "ended trigger"

    .line 289
    .line 290
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->i(Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    :cond_b
    return-void
.end method

.method public tickSync(Ll/x20;Ll/x20;)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/u11;->f()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->transaction:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-static {v0}, Ll/u11;->h(Z)V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->transaction:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;->tickSynced:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public transaction(Ll/x20;)V
    .locals 10

    .line 1
    const-string v0, "ended transaction, posting sync"

    .line 2
    .line 3
    const-string v1, "time used: "

    .line 4
    .line 5
    sget-boolean v2, Ll/kmk0;->c:Z

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/u11;->f()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->deleted()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_2

    .line 17
    .line 18
    sget-boolean p0, Ll/kmk0;->b:Z

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string p0, "deleted database calling transaction"

    .line 23
    .line 24
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void

    .line 28
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    iget-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 33
    .line 34
    invoke-interface {v4}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v4}, Lio/requery/android/database/sqlite/SQLiteDatabase;->beginTransactionDeferredWrite()V

    .line 46
    .line 47
    .line 48
    const/4 v4, 0x0

    .line 49
    const-wide/16 v5, 0x2710

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    :try_start_0
    sget-boolean v8, Ll/kmk0;->c:Z

    .line 53
    .line 54
    const/4 v9, 0x1

    .line 55
    if-eqz v8, :cond_4

    .line 56
    .line 57
    iget-object v8, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->transaction:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 58
    .line 59
    if-nez v8, :cond_3

    .line 60
    .line 61
    move v8, v9

    .line 62
    goto :goto_0

    .line 63
    :cond_3
    move v8, v7

    .line 64
    :goto_0
    invoke-static {v8}, Ll/u11;->h(Z)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catchall_0
    move-exception p1

    .line 69
    goto :goto_3

    .line 70
    :cond_4
    :goto_1
    sget-boolean v8, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 71
    .line 72
    if-eqz v8, :cond_5

    .line 73
    .line 74
    const-string v8, "started transaction"

    .line 75
    .line 76
    invoke-static {v8}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_5
    new-instance v8, Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 80
    .line 81
    invoke-direct {v8}, Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;-><init>()V

    .line 82
    .line 83
    .line 84
    iput-object v8, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->transaction:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 85
    .line 86
    invoke-interface {p1}, Ll/x20;->call()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    .line 95
    .line 96
    :try_start_1
    sget-boolean p1, Ll/kmk0;->b:Z

    .line 97
    .line 98
    if-eqz p1, :cond_6

    .line 99
    .line 100
    new-instance p1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 106
    .line 107
    .line 108
    move-result-wide v7

    .line 109
    sub-long/2addr v7, v2

    .line 110
    invoke-virtual {p1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 118
    .line 119
    .line 120
    goto :goto_2

    .line 121
    :catchall_1
    move-exception p1

    .line 122
    move v7, v9

    .line 123
    goto :goto_3

    .line 124
    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 129
    .line 130
    .line 131
    sget-boolean p1, Ll/kmk0;->b:Z

    .line 132
    .line 133
    if-eqz p1, :cond_7

    .line 134
    .line 135
    sget-boolean p1, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_delayTransaction10Seconds:Z

    .line 136
    .line 137
    if-eqz p1, :cond_7

    .line 138
    .line 139
    sget-object p1, Ll/kmk0;->a:Ljava/lang/String;

    .line 140
    .line 141
    :try_start_2
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 142
    .line 143
    .line 144
    :catch_0
    sget-object p1, Ll/kmk0;->a:Ljava/lang/String;

    .line 145
    .line 146
    :cond_7
    sget-boolean p1, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_omitPostingChanges:Z

    .line 147
    .line 148
    if-nez p1, :cond_9

    .line 149
    .line 150
    sget-boolean p1, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 151
    .line 152
    if-eqz p1, :cond_8

    .line 153
    .line 154
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    :cond_8
    new-instance p1, Lcom/tantanapp/common/data/orm/DatabaseStore$1;

    .line 158
    .line 159
    invoke-direct {p1, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$1;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore;)V

    .line 160
    .line 161
    .line 162
    invoke-static {p1}, Lcom/tantanapp/common/utils/ThreadUtil;->g(Ljava/lang/Runnable;)V

    .line 163
    .line 164
    .line 165
    :cond_9
    iput-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->transaction:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 166
    .line 167
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 168
    .line 169
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :goto_3
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->db()Lio/requery/android/database/sqlite/SQLiteDatabase;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    invoke-virtual {v1}, Lio/requery/android/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 182
    .line 183
    .line 184
    sget-boolean v1, Ll/kmk0;->b:Z

    .line 185
    .line 186
    if-eqz v1, :cond_a

    .line 187
    .line 188
    sget-boolean v1, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_delayTransaction10Seconds:Z

    .line 189
    .line 190
    if-eqz v1, :cond_a

    .line 191
    .line 192
    sget-object v1, Ll/kmk0;->a:Ljava/lang/String;

    .line 193
    .line 194
    :try_start_3
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1

    .line 195
    .line 196
    .line 197
    :catch_1
    sget-object v1, Ll/kmk0;->a:Ljava/lang/String;

    .line 198
    .line 199
    :cond_a
    if-eqz v7, :cond_c

    .line 200
    .line 201
    sget-boolean v1, Lcom/tantanapp/common/data/orm/DatabaseStore;->debug_omitPostingChanges:Z

    .line 202
    .line 203
    if-nez v1, :cond_c

    .line 204
    .line 205
    sget-boolean v1, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 206
    .line 207
    if-eqz v1, :cond_b

    .line 208
    .line 209
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    :cond_b
    new-instance v0, Lcom/tantanapp/common/data/orm/DatabaseStore$1;

    .line 213
    .line 214
    invoke-direct {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$1;-><init>(Lcom/tantanapp/common/data/orm/DatabaseStore;)V

    .line 215
    .line 216
    .line 217
    invoke-static {v0}, Lcom/tantanapp/common/utils/ThreadUtil;->g(Ljava/lang/Runnable;)V

    .line 218
    .line 219
    .line 220
    :cond_c
    iput-object v4, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->transaction:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 221
    .line 222
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 223
    .line 224
    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 229
    .line 230
    .line 231
    throw p1
.end method
