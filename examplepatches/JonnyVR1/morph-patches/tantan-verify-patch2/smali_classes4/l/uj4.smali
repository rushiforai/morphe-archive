.class public Ll/uj4;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;",
            "Ll/nql;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/uj4;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ll/nql;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->DEFAULT_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 2
    .line 3
    const-class v1, Ll/uj4;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    invoke-static {}, Ll/gra;->N3()Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    invoke-static {v0}, Ll/uj4;->b(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)Ll/nql;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0

    .line 23
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)Ll/nql;
    .locals 3

    .line 1
    sget-object v0, Ll/uj4;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    const-class v0, Ll/uj4;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    sget-object v1, Ll/uj4;->a:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-nez v1, :cond_2

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 21
    .line 22
    if-ne p0, v1, :cond_0

    .line 23
    .line 24
    new-instance v1, Ll/omf;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/omf;-><init>(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->TRANS_EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 33
    .line 34
    if-ne p0, v1, :cond_1

    .line 35
    .line 36
    new-instance v1, Ll/rmf;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/rmf;-><init>(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    new-instance v1, Ll/hnd;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/hnd;-><init>(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    sget-object v2, Ll/uj4;->a:Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-virtual {v2, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    :cond_2
    monitor-exit v0

    .line 53
    goto :goto_2

    .line 54
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p0

    .line 56
    :cond_3
    :goto_2
    sget-object v0, Ll/uj4;->a:Ljava/util/HashMap;

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Ll/nql;

    .line 63
    .line 64
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uj4;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static d()V
    .locals 2

    .line 1
    sget-object v0, Ll/uj4;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/uj4;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/uj4;->a:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/nql;

    .line 38
    .line 39
    invoke-interface {v1}, Ll/nql;->f()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    sget-object v0, Ll/uj4;->a:Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 46
    .line 47
    .line 48
    return-void
.end method
