.class public final Lbko;
.super Lejo;
.source "SourceFile"


# instance fields
.field public final b:Landroid/app/Application;

.field public final c:Ljava/util/WeakHashMap;

.field public final d:Lws8;


# direct methods
.method public constructor <init>(Landroid/app/Application;Lh9o;)V
    .registers 4

    invoke-direct {p0, p2}, Lejo;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lbko;->b:Landroid/app/Application;

    new-instance p2, Ljava/util/WeakHashMap;

    invoke-direct {p2}, Ljava/util/WeakHashMap;-><init>()V

    iput-object p2, p0, Lbko;->c:Ljava/util/WeakHashMap;

    new-instance p2, Lws8;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lws8;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lbko;->d:Lws8;

    invoke-virtual {p1, p2}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 3

    iget-object v0, p0, Lbko;->b:Landroid/app/Application;

    iget-object v1, p0, Lbko;->d:Lws8;

    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lejo;->a:Ljava/lang/Object;

    return-void
.end method

.method public final h(Landroid/app/Activity;)V
    .registers 8

    iget-object v0, p0, Lbko;->c:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_cd

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_cd

    instance-of v0, p1, Lndc;

    if-eqz v0, :cond_25

    move-object v0, p1

    check-cast v0, Lndc;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->d:Lqcc;

    invoke-virtual {v0, v1}, Lqcc;->d(Lqcc;)Z

    move-result v0

    goto/16 :goto_ca

    :cond_25
    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_27
    sget-object v2, Lt0i;->b:Lp0i;

    const-string v2, "mResumed"

    const-class v3, Landroid/app/Activity;

    invoke-virtual {v3, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3d

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_5a

    :cond_3d
    const-string v2, "mStopped"

    invoke-virtual {v3, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4f

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_4e
    .catchall {:try_start_27 .. :try_end_4e} :catchall_51

    goto :goto_5a

    :cond_4f
    move-object v2, v1

    goto :goto_5a

    :catchall_51
    move-exception v2

    sget-object v3, Lt0i;->b:Lp0i;

    new-instance v3, Lq0i;

    invoke-direct {v3, v2}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v2, v3

    :goto_5a
    instance-of v3, v2, Lq0i;

    if-eqz v3, :cond_5f

    move-object v2, v1

    :cond_5f
    check-cast v2, Ljava/lang/Boolean;

    if-nez v2, :cond_c4

    :try_start_63
    invoke-static {}, Lmzg;->d()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "activity"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v4, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, Landroid/app/Activity;

    if-eqz v5, :cond_8d

    check-cast v4, Landroid/app/Activity;

    goto :goto_8e

    :cond_8d
    move-object v4, v1

    :goto_8e
    if-ne v4, p1, :cond_6b

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v4, "stopped"

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    xor-int/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_b8

    :cond_a7
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v2, "Collection contains no element matching the predicate."

    invoke-direct {v0, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_af
    .catchall {:try_start_63 .. :try_end_af} :catchall_af

    :catchall_af
    move-exception v0

    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Lq0i;

    invoke-direct {v2, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v2

    :goto_b8
    sget-object v2, Lt0i;->b:Lp0i;

    instance-of v2, v0, Lq0i;

    if-nez v2, :cond_bf

    move-object v1, v0

    :cond_bf
    move-object v2, v1

    check-cast v2, Ljava/lang/Boolean;

    if-eqz v2, :cond_c9

    :cond_c4
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_ca

    :cond_c9
    const/4 v0, 0x0

    :goto_ca
    invoke-virtual {p0, p1, v0}, Lbko;->i(Landroid/app/Activity;Z)V

    :cond_cd
    return-void
.end method

.method public final i(Landroid/app/Activity;Z)V
    .registers 4

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    iget-object v0, p0, Lbko;->c:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;

    move-result-object p1

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p1, p2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result p1

    iget-object p0, p0, Lejo;->a:Ljava/lang/Object;

    check-cast p0, Lh9o;

    if-eqz p0, :cond_1c

    invoke-virtual {p0, p1}, Lh9o;->c(Z)V

    :cond_1c
    return-void
.end method
