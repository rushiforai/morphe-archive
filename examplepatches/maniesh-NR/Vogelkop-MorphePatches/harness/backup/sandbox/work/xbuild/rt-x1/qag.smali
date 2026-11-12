.class public final Lqag;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/net/CookieStore;


# static fields
.field public static final f:Landroid/os/Handler;


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:Li32;

.field public final c:Lvdf;

.field public final d:Ljava/lang/Object;

.field public final e:S


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lqag;->f:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Lumi;Landroid/content/Context;Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lqag;->a:Ljava/util/HashMap;

    new-instance v0, Lvdf;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lvdf;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lqag;->c:Lvdf;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lqag;->d:Ljava/lang/Object;

    new-instance v0, Li32;

    new-instance v1, Lo8f;

    const/16 v2, 0x13

    invoke-direct {v1, p0, v2}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, p2, p1, p3, v1}, Li32;-><init>(Landroid/content/Context;Lumi;Ljava/lang/String;Lo8f;)V

    iput-object v0, p0, Lqag;->b:Li32;

    invoke-virtual {v0}, Lldk;->h()V

    const/16 p1, 0xbb8

    iput-short p1, p0, Lqag;->e:S

    return-void
.end method

.method public static d(Lvpb;Ljava/util/Set;)V
    .registers 10

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/HttpCookie;

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getMaxAge()J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Ljava/net/HttpCookie;->hasExpired()Z

    move-result v1

    if-nez v1, :cond_4

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    const-string v2, "name"

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "value"

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "comment"

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getComment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "domain"

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getDomain()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "path"

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "portlist"

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getPortlist()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "discard"

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getDiscard()Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorb;->r(Ljava/lang/String;Z)V

    const-string v2, "secure"

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getSecure()Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorb;->r(Ljava/lang/String;Z)V

    const-string v2, "version"

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getVersion()I

    move-result v3

    invoke-virtual {v1, v3, v2}, Lorb;->n(ILjava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getMaxAge()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    add-long/2addr v4, v2

    const-string v0, "expires"

    invoke-virtual {v1, v4, v5, v0}, Lorb;->o(JLjava/lang/String;)V

    invoke-virtual {p0, v1}, Lvpb;->a(Ljava/lang/Object;)V

    goto/16 :goto_4

    :cond_8c
    return-void
.end method


# virtual methods
.method public final a(Ljava/net/URI;Ljava/net/HttpCookie;)V
    .registers 7

    const/4 v0, 0x0

    if-nez p1, :cond_5

    move-object p1, v0

    goto :goto_11

    :cond_5
    :try_start_5
    new-instance v1, Ljava/net/URI;

    const-string v2, "http"

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_10
    .catch Ljava/net/URISyntaxException; {:try_start_5 .. :try_end_10} :catch_11

    move-object p1, v1

    :catch_11
    :goto_11
    iget-object p0, p0, Lqag;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    if-nez v0, :cond_24

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_27

    :cond_24
    invoke-interface {v0, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :goto_27
    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final add(Ljava/net/URI;Ljava/net/HttpCookie;)V
    .registers 4

    invoke-virtual {p0}, Lqag;->b()V

    iget-object v0, p0, Lqag;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_6
    invoke-virtual {p0, p1, p2}, Lqag;->a(Ljava/net/URI;Ljava/net/HttpCookie;)V

    monitor-exit v0
    :try_end_a
    .catchall {:try_start_6 .. :try_end_a} :catchall_10

    invoke-virtual {p0}, Lqag;->e()V

    return-void

    :goto_e
    :try_start_e
    monitor-exit v0
    :try_end_f
    .catchall {:try_start_e .. :try_end_f} :catchall_10

    throw p0

    :catchall_10
    move-exception p0

    goto :goto_e
.end method

.method public final b()V
    .registers 3

    iget-object p0, p0, Lqag;->b:Li32;

    iget-object p0, p0, Lldk;->f:Lhd;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_7
    iget-object v0, p0, Lhd;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V

    invoke-static {}, Lvml;->b()Z

    move-result v0

    if-eqz v0, :cond_1f

    iget-object v0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast v0, Loml;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    invoke-virtual {p0}, Lhd;->f()V
    :try_end_1f
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_1f} :catch_1f

    :catch_1f
    :cond_1f
    return-void
.end method

.method public final c()V
    .registers 8

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    const-string v2, "uris"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lqag;->b()V

    iget-object v2, p0, Lqag;->d:Ljava/lang/Object;

    monitor-enter v2

    :try_start_15
    iget-object v3, p0, Lqag;->a:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_53

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    new-instance v5, Lvpb;

    invoke-direct {v5}, Lvpb;-><init>()V

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_3c

    const-string v6, "any"

    invoke-virtual {v0, v5, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_49

    :cond_3c
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/net/URI;

    invoke-virtual {v6}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_49
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    invoke-static {v5, v4}, Lqag;->d(Lvpb;Ljava/util/Set;)V

    goto :goto_1f

    :cond_53
    monitor-exit v2
    :try_end_54
    .catchall {:try_start_15 .. :try_end_54} :catchall_5c

    iget-object p0, p0, Lqag;->b:Li32;

    invoke-virtual {p0, v0}, Lldk;->g(Ljava/lang/Object;)V

    return-void

    :goto_5a
    :try_start_5a
    monitor-exit v2
    :try_end_5b
    .catchall {:try_start_5a .. :try_end_5b} :catchall_5c

    throw p0

    :catchall_5c
    move-exception p0

    goto :goto_5a
.end method

.method public final e()V
    .registers 5

    iget-short v0, p0, Lqag;->e:S

    int-to-long v0, v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_a

    return-void

    :cond_a
    if-nez v2, :cond_10

    invoke-virtual {p0}, Lqag;->c()V

    return-void

    :cond_10
    sget-object v2, Lqag;->f:Landroid/os/Handler;

    iget-object p0, p0, Lqag;->c:Lvdf;

    invoke-virtual {v2, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {v2, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final get(Ljava/net/URI;)Ljava/util/List;
    .registers 11

    invoke-virtual {p0}, Lqag;->b()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lqag;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_b
    iget-object v2, p0, Lqag;->a:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    :cond_16
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_65

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/net/URI;->equals(Ljava/lang/Object;)Z

    move-result v5

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_34
    :goto_34
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_16

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/net/HttpCookie;

    if-nez v5, :cond_50

    invoke-virtual {v6}, Ljava/net/HttpCookie;->getDomain()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Ljava/net/HttpCookie;->domainMatches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_34

    :cond_50
    invoke-virtual {v6}, Ljava/net/HttpCookie;->hasExpired()Z

    move-result v7

    if-eqz v7, :cond_5b

    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    const/4 v3, 0x1

    goto :goto_34

    :cond_5b
    invoke-virtual {v0, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_34

    invoke-virtual {v0, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_34

    :cond_65
    monitor-exit v1
    :try_end_66
    .catchall {:try_start_b .. :try_end_66} :catchall_77

    if-eqz v3, :cond_6b

    invoke-virtual {p0}, Lqag;->e()V

    :cond_6b
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :goto_75
    :try_start_75
    monitor-exit v1
    :try_end_76
    .catchall {:try_start_75 .. :try_end_76} :catchall_77

    throw p0

    :catchall_77
    move-exception p0

    goto :goto_75
.end method

.method public final getCookies()Ljava/util/List;
    .registers 8

    invoke-virtual {p0}, Lqag;->b()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lqag;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_b
    iget-object v2, p0, Lqag;->a:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    :cond_16
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_47

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_26
    :goto_26
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_16

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/net/HttpCookie;

    invoke-virtual {v5}, Ljava/net/HttpCookie;->hasExpired()Z

    move-result v6

    if-eqz v6, :cond_3d

    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    const/4 v3, 0x1

    goto :goto_26

    :cond_3d
    invoke-virtual {v0, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_26

    invoke-virtual {v0, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_26

    :cond_47
    monitor-exit v1
    :try_end_48
    .catchall {:try_start_b .. :try_end_48} :catchall_59

    if-eqz v3, :cond_4d

    invoke-virtual {p0}, Lqag;->e()V

    :cond_4d
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :goto_57
    :try_start_57
    monitor-exit v1
    :try_end_58
    .catchall {:try_start_57 .. :try_end_58} :catchall_59

    throw p0

    :catchall_59
    move-exception p0

    goto :goto_57
.end method

.method public final getURIs()Ljava/util/List;
    .registers 3

    invoke-virtual {p0}, Lqag;->b()V

    iget-object v0, p0, Lqag;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_6
    new-instance v1, Ljava/util/ArrayList;

    iget-object p0, p0, Lqag;->a:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :goto_1b
    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_6 .. :try_end_1c} :catchall_1d

    throw p0

    :catchall_1d
    move-exception p0

    goto :goto_1b
.end method

.method public final remove(Ljava/net/URI;Ljava/net/HttpCookie;)Z
    .registers 5

    invoke-virtual {p0}, Lqag;->b()V

    iget-object v0, p0, Lqag;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_6
    iget-object v1, p0, Lqag;->a:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Set;

    if-eqz p1, :cond_15

    invoke-interface {p1, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result p1

    goto :goto_16

    :cond_15
    const/4 p1, 0x0

    :goto_16
    monitor-exit v0
    :try_end_17
    .catchall {:try_start_6 .. :try_end_17} :catchall_1f

    if-eqz p1, :cond_1c

    invoke-virtual {p0}, Lqag;->e()V

    :cond_1c
    return p1

    :goto_1d
    :try_start_1d
    monitor-exit v0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1f

    throw p0

    :catchall_1f
    move-exception p0

    goto :goto_1d
.end method

.method public final removeAll()Z
    .registers 3

    invoke-virtual {p0}, Lqag;->b()V

    iget-object v0, p0, Lqag;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_6
    iget-object v1, p0, Lqag;->a:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_11

    const/4 p0, 0x0

    monitor-exit v0

    return p0

    :cond_11
    iget-object v1, p0, Lqag;->a:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    monitor-exit v0
    :try_end_17
    .catchall {:try_start_6 .. :try_end_17} :catchall_1e

    invoke-virtual {p0}, Lqag;->e()V

    const/4 p0, 0x1

    return p0

    :goto_1c
    :try_start_1c
    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1e

    throw p0

    :catchall_1e
    move-exception p0

    goto :goto_1c
.end method
