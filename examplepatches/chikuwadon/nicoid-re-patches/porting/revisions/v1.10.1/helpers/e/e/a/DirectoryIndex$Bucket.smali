.class final Le/e/a/DirectoryIndex$Bucket;
.super Ljava/lang/Object;
.source "DirectoryIndex.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DirectoryIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Bucket"
.end annotation


# instance fields
.field final dirty:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final items:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/DirectoryIndex$Item<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field loaded:Z

.field final parent:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field refreshed:J

.field final synthetic this$0:Le/e/a/DirectoryIndex;


# direct methods
.method constructor <init>(Le/e/a/DirectoryIndex;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 13
    iput-object p1, p0, Le/e/a/DirectoryIndex$Bucket;->this$0:Le/e/a/DirectoryIndex;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Le/e/a/DirectoryIndex$Bucket;->items:Ljava/util/Map;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Le/e/a/DirectoryIndex$Bucket;->dirty:Ljava/util/Set;

    .line 13
    iput-object p2, p0, Le/e/a/DirectoryIndex$Bucket;->parent:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method declared-synchronized all()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Le/e/a/DirectoryIndex$Item<",
            "TT;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 17
    :try_start_1
    invoke-virtual {p0}, Le/e/a/DirectoryIndex$Bucket;->load()V

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/DirectoryIndex$Bucket;->items:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_11

    monitor-exit p0

    return-object v0

    .line 17
    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized changed(Ljava/lang/String;)V
    .registers 3

    monitor-enter p0

    .line 20
    :try_start_1
    iget-object v0, p0, Le/e/a/DirectoryIndex$Bucket;->items:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    iget-object v0, p0, Le/e/a/DirectoryIndex$Bucket;->dirty:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    :cond_e
    monitor-exit p0

    return-void

    .line 20
    :catchall_10
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized find(Ljava/lang/String;ZZ)Le/e/a/DirectoryIndex$Item;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZZ)",
            "Le/e/a/DirectoryIndex$Item<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 15
    :try_start_1
    invoke-virtual {p0}, Le/e/a/DirectoryIndex$Bucket;->load()V

    iget-object v0, p0, Le/e/a/DirectoryIndex$Bucket;->items:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/DirectoryIndex$Item;

    if-nez v0, :cond_41

    if-eqz p2, :cond_41

    iget-object p2, p0, Le/e/a/DirectoryIndex$Bucket;->this$0:Le/e/a/DirectoryIndex;

    # getter for: Le/e/a/DirectoryIndex;->provider:Le/e/a/DirectoryIndex$Provider;
    invoke-static {p2}, Le/e/a/DirectoryIndex;->access$0(Le/e/a/DirectoryIndex;)Le/e/a/DirectoryIndex$Provider;

    move-result-object p2

    iget-object v0, p0, Le/e/a/DirectoryIndex$Bucket;->parent:Ljava/lang/Object;

    invoke-static {p1}, Le/e/a/DirectoryIndex;->physical(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, v1, p3}, Le/e/a/DirectoryIndex$Provider;->create(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_39

    new-instance v0, Le/e/a/DirectoryIndex$Item;

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    move-object v2, v0

    move-object v3, p1

    move v5, p3

    invoke-direct/range {v2 .. v9}, Le/e/a/DirectoryIndex$Item;-><init>(Ljava/lang/String;Ljava/lang/Object;ZJJ)V

    iget-object p2, p0, Le/e/a/DirectoryIndex$Bucket;->items:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Le/e/a/DirectoryIndex$Bucket;->dirty:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_41

    :cond_39
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Cannot create cache document"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_41
    .catchall {:try_start_1 .. :try_end_41} :catchall_43

    :cond_41
    :goto_41
    monitor-exit p0

    return-object v0

    .line 15
    :catchall_43
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized forget(Ljava/lang/String;)V
    .registers 3

    monitor-enter p0

    .line 18
    :try_start_1
    iget-object v0, p0, Le/e/a/DirectoryIndex$Bucket;->items:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/DirectoryIndex$Bucket;->dirty:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    monitor-exit p0

    return-void

    .line 18
    :catchall_d
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized load()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 14
    :try_start_1
    iget-boolean v0, p0, Le/e/a/DirectoryIndex$Bucket;->loaded:Z

    if-eqz v0, :cond_1a

    iget-object v0, p0, Le/e/a/DirectoryIndex$Bucket;->this$0:Le/e/a/DirectoryIndex;

    # getter for: Le/e/a/DirectoryIndex;->provider:Le/e/a/DirectoryIndex$Provider;
    invoke-static {v0}, Le/e/a/DirectoryIndex;->access$0(Le/e/a/DirectoryIndex;)Le/e/a/DirectoryIndex$Provider;

    move-result-object v0

    invoke-interface {v0}, Le/e/a/DirectoryIndex$Provider;->now()J

    move-result-wide v0

    iget-wide v2, p0, Le/e/a/DirectoryIndex$Bucket;->refreshed:J
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_5c

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x7d0

    cmp-long v4, v0, v2

    if-gez v4, :cond_1a

    :goto_18
    monitor-exit p0

    return-void

    :cond_1a
    :try_start_1a
    iget-object v0, p0, Le/e/a/DirectoryIndex$Bucket;->this$0:Le/e/a/DirectoryIndex;

    # getter for: Le/e/a/DirectoryIndex;->provider:Le/e/a/DirectoryIndex$Provider;
    invoke-static {v0}, Le/e/a/DirectoryIndex;->access$0(Le/e/a/DirectoryIndex;)Le/e/a/DirectoryIndex$Provider;

    move-result-object v0

    iget-object v1, p0, Le/e/a/DirectoryIndex$Bucket;->parent:Ljava/lang/Object;

    invoke-interface {v0, v1}, Le/e/a/DirectoryIndex$Provider;->children(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Le/e/a/DirectoryIndex$Bucket;->items:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    iget-object v1, p0, Le/e/a/DirectoryIndex$Bucket;->dirty:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_34
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_4a

    iget-object v0, p0, Le/e/a/DirectoryIndex$Bucket;->this$0:Le/e/a/DirectoryIndex;

    # getter for: Le/e/a/DirectoryIndex;->provider:Le/e/a/DirectoryIndex$Provider;
    invoke-static {v0}, Le/e/a/DirectoryIndex;->access$0(Le/e/a/DirectoryIndex;)Le/e/a/DirectoryIndex$Provider;

    move-result-object v0

    invoke-interface {v0}, Le/e/a/DirectoryIndex$Provider;->now()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/DirectoryIndex$Bucket;->refreshed:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/DirectoryIndex$Bucket;->loaded:Z

    goto :goto_18

    :cond_4a
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/DirectoryIndex$Item;

    iget-object v2, p0, Le/e/a/DirectoryIndex$Bucket;->items:Ljava/util/Map;

    iget-object v3, v1, Le/e/a/DirectoryIndex$Item;->name:Ljava/lang/String;

    invoke-static {v3}, Le/e/a/DirectoryIndex;->logical(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5b
    .catchall {:try_start_1a .. :try_end_5b} :catchall_5c

    goto :goto_34

    .line 14
    :catchall_5c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized metadata(Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Le/e/a/DirectoryIndex$Item<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 16
    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p0, p1, v0, v0}, Le/e/a/DirectoryIndex$Bucket;->find(Ljava/lang/String;ZZ)Le/e/a/DirectoryIndex$Item;

    move-result-object v0

    if-eqz v0, :cond_2e

    iget-object v1, p0, Le/e/a/DirectoryIndex$Bucket;->dirty:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    iget-object v1, p0, Le/e/a/DirectoryIndex$Bucket;->this$0:Le/e/a/DirectoryIndex;

    # getter for: Le/e/a/DirectoryIndex;->provider:Le/e/a/DirectoryIndex$Provider;
    invoke-static {v1}, Le/e/a/DirectoryIndex;->access$0(Le/e/a/DirectoryIndex;)Le/e/a/DirectoryIndex$Provider;

    move-result-object v1

    iget-object v0, v0, Le/e/a/DirectoryIndex$Item;->ref:Ljava/lang/Object;

    invoke-interface {v1, v0, p1}, Le/e/a/DirectoryIndex$Provider;->stat(Ljava/lang/Object;Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;

    move-result-object v0

    if-nez v0, :cond_24

    iget-object v1, p0, Le/e/a/DirectoryIndex$Bucket;->items:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_29

    :cond_24
    iget-object v1, p0, Le/e/a/DirectoryIndex$Bucket;->items:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_29
    iget-object v1, p0, Le/e/a/DirectoryIndex$Bucket;->dirty:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_2e
    .catchall {:try_start_2 .. :try_end_2e} :catchall_30

    :cond_2e
    monitor-exit p0

    return-object v0

    .line 16
    :catchall_30
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized remember(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    monitor-enter p0

    .line 19
    :try_start_1
    iget-object v0, p0, Le/e/a/DirectoryIndex$Bucket;->items:Ljava/util/Map;

    new-instance v9, Le/e/a/DirectoryIndex$Item;

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const/4 v4, 0x0

    move-object v1, v9

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v8}, Le/e/a/DirectoryIndex$Item;-><init>(Ljava/lang/String;Ljava/lang/Object;ZJJ)V

    invoke-interface {v0, p1, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Le/e/a/DirectoryIndex$Bucket;->dirty:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_1a

    monitor-exit p0

    return-void

    .line 19
    :catchall_1a
    move-exception p1

    monitor-exit p0

    throw p1
.end method
