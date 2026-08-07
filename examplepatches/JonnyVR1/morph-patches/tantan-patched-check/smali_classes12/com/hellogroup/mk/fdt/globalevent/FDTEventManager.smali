.class public Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$a;,
        Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;
    }
.end annotation


# static fields
.field private static volatile c:Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;


# instance fields
.field private final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$a;",
            ">;>;"
        }
    .end annotation
.end field

.field private b:Landroid/content/Context;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->a:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->a:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static b()Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;
    .locals 2

    .line 1
    sget-object v0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->c:Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->c:Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->c:Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->c:Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public declared-synchronized c(Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$a;Ljava/lang/String;)V
    .locals 2
    .param p1    # Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->a:Ljava/util/Map;

    .line 3
    .line 4
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ljava/util/List;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ljava/util/LinkedList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->a:Ljava/util/Map;

    .line 18
    .line 19
    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-nez p2, :cond_1

    .line 30
    .line 31
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    :cond_1
    monitor-exit p0

    .line 35
    return-void

    .line 36
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p1
.end method

.method public declared-synchronized d(Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;)V
    .locals 2
    .param p1    # Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;->b()V

    .line 3
    .line 4
    .line 5
    new-instance v0, Landroid/content/Intent;

    .line 6
    .line 7
    const-string v1, "com.immomo.momo.globalevent.ACTION_FDT_GLOBAL_EVENT"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v1, "global_fdt_event"

    .line 13
    .line 14
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->b:Landroid/content/Context;

    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/rf3;->c(Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p1
.end method

.method public declared-synchronized e(Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$a;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->a:Ljava/util/Map;

    .line 3
    .line 4
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ljava/util/List;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->a:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {p1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw p1
.end method
