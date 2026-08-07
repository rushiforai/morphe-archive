.class public Lcom/tantanapp/beatles/safety/spwaitfix/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/beatles/safety/spwaitfix/a$a;
    }
.end annotation


# static fields
.field public static volatile b:Z


# instance fields
.field public a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public declared-synchronized a()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-boolean v0, Lcom/tantanapp/beatles/safety/spwaitfix/a;->b:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    const-string v0, "Landroid/app/QueuedWork;->sPendingWorkFinishers:Ljava/util/concurrent/ConcurrentLinkedQueue;"

    .line 9
    .line 10
    const-string v1, "Landroid/app/QueuedWork;->sFinishers:Ljava/util/LinkedList;"

    .line 11
    .line 12
    const-string v2, "Landroid/app/QueuedWork;->sWork:Ljava/util/LinkedList;"

    .line 13
    .line 14
    const-string v3, "Landroid/app/QueuedWork;->sLock:Ljava/lang/Object;"

    .line 15
    .line 16
    const-string v4, "Landroid/app/QueuedWork;->getHandler()Landroid/os/Handler;"

    .line 17
    .line 18
    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Ll/ua3;->a([Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tantanapp/beatles/safety/spwaitfix/a;->b()V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    sput-boolean v0, Lcom/tantanapp/beatles/safety/spwaitfix/a;->b:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    goto :goto_1

    .line 34
    :catch_0
    move-exception v0

    .line 35
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 36
    .line 37
    .line 38
    :goto_0
    monitor-exit p0

    .line 39
    return-void

    .line 40
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 41
    throw v0
.end method

.method public final b()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string p0, "android.app.QueuedWork"

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    const/16 v3, 0x1a

    .line 12
    .line 13
    if-ge v0, v3, :cond_0

    .line 14
    .line 15
    const-string v4, "sPendingWorkFinishers"

    .line 16
    .line 17
    invoke-virtual {p0, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 29
    .line 30
    new-instance v4, Lcom/tantanapp/beatles/safety/spwaitfix/ProxyFinishersLinkedList;

    .line 31
    .line 32
    invoke-direct {v4, v1}, Lcom/tantanapp/beatles/safety/spwaitfix/ProxyFinishersLinkedList;-><init>(Ljava/util/concurrent/ConcurrentLinkedQueue;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v2, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string v4, "sFinishers"

    .line 40
    .line 41
    invoke-virtual {p0, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Ljava/util/LinkedList;

    .line 53
    .line 54
    new-instance v4, Lcom/tantanapp/beatles/safety/spwaitfix/ProxyFinishersList;

    .line 55
    .line 56
    invoke-direct {v4, v1}, Lcom/tantanapp/beatles/safety/spwaitfix/ProxyFinishersList;-><init>(Ljava/util/LinkedList;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v2, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :goto_0
    if-ge v0, v3, :cond_1

    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    new-instance p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;

    .line 66
    .line 67
    invoke-direct {p0}, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {p0}, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->b(Lcom/tantanapp/beatles/safety/spwaitfix/a$a;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method
