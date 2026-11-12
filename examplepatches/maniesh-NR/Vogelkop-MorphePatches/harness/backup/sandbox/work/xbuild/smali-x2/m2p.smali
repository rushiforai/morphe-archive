.class public final Lm2p;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lf2p;

.field public final b:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lf2p;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm2p;->a:Lf2p;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lm2p;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 4

    :try_start_0
    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lce2;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lce2;-><init>(Ljava/lang/Object;B)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_35

    :try_start_9
    invoke-static {}, Lpfp;->b()Z

    move-result p0

    if-eqz p0, :cond_14

    invoke-virtual {v0}, Lce2;->call()Ljava/lang/Object;

    move-result-object p0

    goto :goto_26

    :cond_14
    new-instance p0, Ljava/util/concurrent/FutureTask;

    invoke-direct {p0, v0}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    invoke-static {p0}, Lpfp;->a(Ljava/lang/Runnable;)V

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x7d0

    invoke-virtual {p0, v1, v2, v0}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_24} :catch_25
    .catchall {:try_start_9 .. :try_end_24} :catchall_35

    goto :goto_26

    :catch_25
    const/4 p0, 0x0

    :goto_26
    :try_start_26
    check-cast p0, Ljava/lang/String;

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object v0

    invoke-virtual {v0, p0}, Lz8p;->a(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0
    :try_end_34
    .catchall {:try_start_26 .. :try_end_34} :catchall_35

    goto :goto_3e

    :catchall_35
    move-exception p0

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, v0

    :goto_3e
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v1, Lt0i;->b:Lp0i;

    instance-of v1, p0, Lq0i;

    if-eqz v1, :cond_47

    move-object p0, v0

    :cond_47
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final cai(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p0}, Lm2p;->a()Z

    move-result v0

    if-nez v0, :cond_9

    const-string p0, ""

    return-object p0

    :cond_9
    const/4 v0, 0x0

    :try_start_a
    sget-object v1, Lt0i;->b:Lp0i;

    sget-object v1, Lrpb;->d:Lqpb;

    if-eqz p1, :cond_5a

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lsqb;->a:Lsqb;

    invoke-virtual {v1, p1, v2}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkotlinx/serialization/json/b;

    invoke-static {p1}, Lqqb;->g(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/a;

    move-result-object p1

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object p1, p1, Lkotlinx/serialization/json/a;->a:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2a
    :goto_2a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_55

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/json/b;

    instance-of v3, v2, Lkotlinx/serialization/json/d;

    if-eqz v3, :cond_3d

    check-cast v2, Lkotlinx/serialization/json/d;

    goto :goto_3e

    :cond_3d
    move-object v2, v0

    :goto_3e
    if-eqz v2, :cond_4e

    invoke-virtual {v2}, Lkotlinx/serialization/json/d;->c()Z

    move-result v3

    if-nez v3, :cond_47

    move-object v2, v0

    :cond_47
    if-eqz v2, :cond_4e

    invoke-virtual {v2}, Lkotlinx/serialization/json/d;->b()Ljava/lang/String;

    move-result-object v2

    goto :goto_4f

    :cond_4e
    move-object v2, v0

    :goto_4f
    if-eqz v2, :cond_2a

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    :cond_55
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p1

    goto :goto_6b

    :cond_5a
    const-string p1, "Required value was null."

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_62
    .catchall {:try_start_a .. :try_end_62} :catchall_62

    :catchall_62
    move-exception p1

    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lq0i;

    invoke-direct {v1, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v1

    :goto_6b
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    const/16 v2, 0xd

    if-eqz v1, :cond_7b

    new-instance v1, Lkoj;

    invoke-direct {v1, v2}, Lkoj;-><init>(B)V

    invoke-static {v1}, Lpfp;->c(Ljava/lang/Runnable;)V

    :cond_7b
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    instance-of v3, p1, Lq0i;

    if-nez v3, :cond_85

    move-object v0, p1

    :cond_85
    check-cast v0, Ljava/util/Set;

    if-eqz v0, :cond_e1

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_8d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_e1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :try_start_99
    sget-object v3, Lt0i;->b:Lp0i;

    iget-object v3, p0, Lm2p;->b:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3
    :try_end_a1
    .catchall {:try_start_99 .. :try_end_a1} :catchall_ab

    const/4 v4, 0x0

    :try_start_a2
    invoke-virtual {v3, v0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_a5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_a2 .. :try_end_a5} :catch_a6
    .catchall {:try_start_a2 .. :try_end_a5} :catchall_ab

    const/4 v4, 0x1

    :catch_a6
    :try_start_a6
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3
    :try_end_aa
    .catchall {:try_start_a6 .. :try_end_aa} :catchall_ab

    goto :goto_b4

    :catchall_ab
    move-exception v3

    sget-object v4, Lt0i;->b:Lp0i;

    new-instance v4, Lq0i;

    invoke-direct {v4, v3}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v3, v4

    :goto_b4
    invoke-static {v3}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_c2

    new-instance v4, Lkoj;

    invoke-direct {v4, v2}, Lkoj;-><init>(B)V

    invoke-static {v4}, Lpfp;->c(Ljava/lang/Runnable;)V

    :cond_c2
    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    instance-of v5, v3, Lq0i;

    if-eqz v5, :cond_cc

    move-object v3, v4

    :cond_cc
    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lqqb;->b(Ljava/lang/Number;)Lkotlinx/serialization/json/d;

    move-result-object v3

    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/b;

    goto :goto_8d

    :cond_e1
    new-instance p0, Lkotlinx/serialization/json/c;

    invoke-direct {p0, v1}, Lkotlinx/serialization/json/c;-><init>(Ljava/util/Map;)V

    sget-object p1, Lrpb;->d:Lqpb;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lkotlinx/serialization/json/c;->Companion:Lkotlinx/serialization/json/JsonObject$Companion;

    invoke-virtual {v0}, Lkotlinx/serialization/json/JsonObject$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final destroy()V
    .registers 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    invoke-virtual {p0}, Lm2p;->a()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Ll2p;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ll2p;-><init>(Lm2p;B)V

    invoke-static {v0}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final reportAdmReady()V
    .registers 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    sget-object v0, Lito;->a:[Lito;

    new-instance v0, Ll2p;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ll2p;-><init>(Lm2p;B)V

    invoke-static {v0}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final shouldPauseAutoRefresh(Z)V
    .registers 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    sget-object v0, Lito;->a:[Lito;

    new-instance v0, Ls03;

    const/16 v1, 0x9

    invoke-direct {v0, v1, p0, p1}, Ls03;-><init>(BLjava/lang/Object;Z)V

    invoke-static {v0}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-void
.end method
