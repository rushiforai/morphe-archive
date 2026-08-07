.class public Lcom/p1/mobile/putong/util/a;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/util/a;->c()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/util/a;->b()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static b()V
    .locals 4

    .line 1
    const-string v0, "sFinishers"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "android.app.QueuedWork"

    .line 4
    .line 5
    invoke-static {v1}, Lorg/joor/Reflect;->on(Ljava/lang/String;)Lorg/joor/Reflect;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1, v0}, Lorg/joor/Reflect;->field0(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1}, Lorg/joor/Reflect;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    new-instance v3, Lcom/p1/mobile/putong/util/LinkedListProxy;

    .line 22
    .line 23
    check-cast v2, Ljava/util/LinkedList;

    .line 24
    .line 25
    invoke-direct {v3, v2}, Lcom/p1/mobile/putong/util/LinkedListProxy;-><init>(Ljava/util/LinkedList;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0, v3}, Lorg/joor/Reflect;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/joor/Reflect;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    :catchall_0
    return-void
.end method

.method public static c()V
    .locals 4

    .line 1
    const-string v0, "sPendingWorkFinishers"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "android.app.QueuedWork"

    .line 4
    .line 5
    invoke-static {v1}, Lorg/joor/Reflect;->on(Ljava/lang/String;)Lorg/joor/Reflect;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1, v0}, Lorg/joor/Reflect;->field0(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1}, Lorg/joor/Reflect;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    new-instance v3, Lcom/p1/mobile/putong/util/ConcurrentLinkedQueueProxy;

    .line 22
    .line 23
    check-cast v2, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 24
    .line 25
    invoke-direct {v3, v2}, Lcom/p1/mobile/putong/util/ConcurrentLinkedQueueProxy;-><init>(Ljava/util/concurrent/ConcurrentLinkedQueue;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0, v3}, Lorg/joor/Reflect;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/joor/Reflect;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    :catchall_0
    return-void
.end method
