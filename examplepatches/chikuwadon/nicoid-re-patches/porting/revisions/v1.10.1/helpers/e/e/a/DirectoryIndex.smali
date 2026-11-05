.class final Le/e/a/DirectoryIndex;
.super Ljava/lang/Object;
.source "DirectoryIndex.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/DirectoryIndex$Bucket;,
        Le/e/a/DirectoryIndex$Item;,
        Le/e/a/DirectoryIndex$Provider;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final ID:Ljava/util/regex/Pattern;

.field static final TTL:J = 0x7d0L


# instance fields
.field private final provider:Le/e/a/DirectoryIndex$Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Le/e/a/DirectoryIndex$Provider<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final root:Le/e/a/DirectoryIndex$Bucket;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Le/e/a/DirectoryIndex<",
            "TT;>.Bucket;"
        }
    .end annotation
.end field

.field private final videos:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/DirectoryIndex<",
            "TT;>.Bucket;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 8
    const-string v0, "^((?:sm|so|nm|ss)[0-9]+)(?:[._].*)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/DirectoryIndex;->ID:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Le/e/a/DirectoryIndex$Provider;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Le/e/a/DirectoryIndex$Provider<",
            "TT;>;)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Le/e/a/DirectoryIndex$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x10

    invoke-direct {v0, p0, v3, v1, v2}, Le/e/a/DirectoryIndex$1;-><init>(Le/e/a/DirectoryIndex;IFZ)V

    iput-object v0, p0, Le/e/a/DirectoryIndex;->videos:Ljava/util/Map;

    .line 22
    new-instance v0, Le/e/a/DirectoryIndex$Bucket;

    invoke-direct {v0, p0, p1}, Le/e/a/DirectoryIndex$Bucket;-><init>(Le/e/a/DirectoryIndex;Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    iput-object p2, p0, Le/e/a/DirectoryIndex;->provider:Le/e/a/DirectoryIndex$Provider;

    return-void
.end method

.method static synthetic access$0(Le/e/a/DirectoryIndex;)Le/e/a/DirectoryIndex$Provider;
    .registers 1

    .line 9
    iget-object p0, p0, Le/e/a/DirectoryIndex;->provider:Le/e/a/DirectoryIndex$Provider;

    return-object p0
.end method

.method private bucket(Ljava/lang/String;Z)Le/e/a/DirectoryIndex$Bucket;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Le/e/a/DirectoryIndex<",
            "TT;>.Bucket;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    invoke-static {p1}, Le/e/a/DirectoryIndex;->group(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_9

    iget-object p1, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    return-object p1

    .line 28
    :cond_9
    iget-object v0, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, v1}, Le/e/a/DirectoryIndex$Bucket;->find(Ljava/lang/String;ZZ)Le/e/a/DirectoryIndex$Item;

    move-result-object p2

    if-eqz p2, :cond_3f

    iget-boolean v0, p2, Le/e/a/DirectoryIndex$Item;->directory:Z

    if-nez v0, :cond_17

    goto :goto_3f

    .line 29
    :cond_17
    iget-object v0, p0, Le/e/a/DirectoryIndex;->videos:Ljava/util/Map;

    monitor-enter v0

    :try_start_1a
    iget-object v1, p0, Le/e/a/DirectoryIndex;->videos:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/DirectoryIndex$Bucket;

    if-eqz v1, :cond_2e

    iget-object v2, v1, Le/e/a/DirectoryIndex$Bucket;->parent:Ljava/lang/Object;

    iget-object v3, p2, Le/e/a/DirectoryIndex$Item;->ref:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3a

    :cond_2e
    new-instance v1, Le/e/a/DirectoryIndex$Bucket;

    iget-object p2, p2, Le/e/a/DirectoryIndex$Item;->ref:Ljava/lang/Object;

    invoke-direct {v1, p0, p2}, Le/e/a/DirectoryIndex$Bucket;-><init>(Le/e/a/DirectoryIndex;Ljava/lang/Object;)V

    iget-object p2, p0, Le/e/a/DirectoryIndex;->videos:Ljava/util/Map;

    invoke-interface {p2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3a
    monitor-exit v0

    return-object v1

    :catchall_3c
    move-exception p1

    monitor-exit v0
    :try_end_3e
    .catchall {:try_start_1a .. :try_end_3e} :catchall_3c

    throw p1

    .line 28
    :cond_3f
    :goto_3f
    iget-object p1, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    return-object p1
.end method

.method static group(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 23
    sget-object v0, Le/e/a/DirectoryIndex;->ID:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_13

    :cond_12
    const/4 p0, 0x0

    :goto_13
    return-object p0
.end method

.method static logical(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 24
    const-string v0, ".complete"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_26

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x9

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, ".mp4"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_26
    return-object p0
.end method

.method static physical(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 25
    invoke-static {p0}, Le/e/a/DirectoryIndex;->group(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2c

    const-string v0, ".mp4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2c

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, ".complete"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_2c
    return-object p0
.end method


# virtual methods
.method all()Ljava/util/List;
    .registers 7
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

    .line 39
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v1, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    invoke-virtual {v1}, Le/e/a/DirectoryIndex$Bucket;->all()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_f
    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_71

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_19
    :goto_19
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_29

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v1

    :cond_29
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/DirectoryIndex$Item;

    iget-boolean v2, v1, Le/e/a/DirectoryIndex$Item;->directory:Z

    if-eqz v2, :cond_19

    iget-object v2, v1, Le/e/a/DirectoryIndex$Item;->name:Ljava/lang/String;

    iget-object v4, v1, Le/e/a/DirectoryIndex$Item;->name:Ljava/lang/String;

    invoke-static {v4}, Le/e/a/DirectoryIndex;->group(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    iget-object v1, v1, Le/e/a/DirectoryIndex$Item;->name:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Le/e/a/DirectoryIndex;->bucket(Ljava/lang/String;Z)Le/e/a/DirectoryIndex$Bucket;

    move-result-object v1

    invoke-virtual {v1}, Le/e/a/DirectoryIndex$Bucket;->all()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_50
    :goto_50
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_57

    goto :goto_19

    :cond_57
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/DirectoryIndex$Item;

    iget-object v4, v2, Le/e/a/DirectoryIndex$Item;->name:Ljava/lang/String;

    const-string v5, ".nomedia"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_50

    iget-object v4, v2, Le/e/a/DirectoryIndex$Item;->name:Ljava/lang/String;

    invoke-static {v4}, Le/e/a/DirectoryIndex;->logical(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_50

    :cond_71
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/DirectoryIndex$Item;

    iget-boolean v4, v3, Le/e/a/DirectoryIndex$Item;->directory:Z

    if-nez v4, :cond_f

    iget-object v4, v3, Le/e/a/DirectoryIndex$Item;->name:Ljava/lang/String;

    invoke-static {v4}, Le/e/a/DirectoryIndex;->group(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_f

    iget-object v4, v3, Le/e/a/DirectoryIndex$Item;->name:Ljava/lang/String;

    invoke-static {v4}, Le/e/a/DirectoryIndex;->logical(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f
.end method

.method changed(Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    iget-object v0, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    invoke-virtual {v0, p1}, Le/e/a/DirectoryIndex$Bucket;->changed(Ljava/lang/String;)V

    invoke-static {p1}, Le/e/a/DirectoryIndex;->group(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/DirectoryIndex;->videos:Ljava/util/Map;

    monitor-enter v1

    :try_start_c
    iget-object v2, p0, Le/e/a/DirectoryIndex;->videos:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/DirectoryIndex$Bucket;

    if-eqz v0, :cond_19

    invoke-virtual {v0, p1}, Le/e/a/DirectoryIndex$Bucket;->changed(Ljava/lang/String;)V

    :cond_19
    monitor-exit v1

    return-void

    :catchall_1b
    move-exception p1

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_c .. :try_end_1d} :catchall_1b

    throw p1
.end method

.method directory(Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 43
    iget-object v0, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v1, v2}, Le/e/a/DirectoryIndex$Bucket;->find(Ljava/lang/String;ZZ)Le/e/a/DirectoryIndex$Item;

    move-result-object p1

    if-eqz p1, :cond_11

    iget-boolean v0, p1, Le/e/a/DirectoryIndex$Item;->directory:Z

    if-eqz v0, :cond_11

    iget-object p1, p1, Le/e/a/DirectoryIndex$Item;->ref:Ljava/lang/Object;

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    :goto_12
    return-object p1
.end method

.method document(Ljava/lang/String;Z)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object p1, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    iget-object p1, p1, Le/e/a/DirectoryIndex$Bucket;->parent:Ljava/lang/Object;

    return-object p1

    .line 34
    :cond_b
    iget-object v0, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1}, Le/e/a/DirectoryIndex$Bucket;->find(Ljava/lang/String;ZZ)Le/e/a/DirectoryIndex$Item;

    move-result-object v0

    if-eqz v0, :cond_1b

    iget-boolean v2, v0, Le/e/a/DirectoryIndex$Item;->directory:Z

    if-nez v2, :cond_1b

    iget-object p1, v0, Le/e/a/DirectoryIndex$Item;->ref:Ljava/lang/Object;

    return-object p1

    .line 35
    :cond_1b
    invoke-direct {p0, p1, p2}, Le/e/a/DirectoryIndex;->bucket(Ljava/lang/String;Z)Le/e/a/DirectoryIndex$Bucket;

    move-result-object v0

    if-eqz p2, :cond_2b

    iget-object v2, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    if-eq v0, v2, :cond_2b

    const-string v2, ".nomedia"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3, v1}, Le/e/a/DirectoryIndex$Bucket;->find(Ljava/lang/String;ZZ)Le/e/a/DirectoryIndex$Item;

    .line 36
    :cond_2b
    invoke-virtual {v0, p1, p2, v1}, Le/e/a/DirectoryIndex$Bucket;->find(Ljava/lang/String;ZZ)Le/e/a/DirectoryIndex$Item;

    move-result-object p1

    if-nez p1, :cond_33

    const/4 p1, 0x0

    goto :goto_35

    :cond_33
    iget-object p1, p1, Le/e/a/DirectoryIndex$Item;->ref:Ljava/lang/Object;

    :goto_35
    return-object p1
.end method

.method forget(Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    iget-object v0, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    invoke-virtual {v0, p1}, Le/e/a/DirectoryIndex$Bucket;->forget(Ljava/lang/String;)V

    invoke-static {p1}, Le/e/a/DirectoryIndex;->group(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/DirectoryIndex;->videos:Ljava/util/Map;

    monitor-enter v1

    :try_start_c
    iget-object v2, p0, Le/e/a/DirectoryIndex;->videos:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/DirectoryIndex$Bucket;

    if-eqz v0, :cond_19

    invoke-virtual {v0, p1}, Le/e/a/DirectoryIndex$Bucket;->forget(Ljava/lang/String;)V

    :cond_19
    monitor-exit v1

    return-void

    :catchall_1b
    move-exception p1

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_c .. :try_end_1d} :catchall_1b

    throw p1
.end method

.method remember(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Le/e/a/DirectoryIndex;->bucket(Ljava/lang/String;Z)Le/e/a/DirectoryIndex$Bucket;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Le/e/a/DirectoryIndex$Bucket;->remember(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method removeDirectory(Ljava/lang/String;)V
    .registers 4

    .line 44
    iget-object v0, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    invoke-virtual {v0, p1}, Le/e/a/DirectoryIndex$Bucket;->forget(Ljava/lang/String;)V

    iget-object v0, p0, Le/e/a/DirectoryIndex;->videos:Ljava/util/Map;

    monitor-enter v0

    :try_start_8
    iget-object v1, p0, Le/e/a/DirectoryIndex;->videos:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-void

    :catchall_f
    move-exception p1

    monitor-exit v0
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_f

    throw p1
.end method

.method stat(Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;
    .registers 11
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

    .line 38
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_18

    new-instance p1, Le/e/a/DirectoryIndex$Item;

    iget-object v0, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    iget-object v3, v0, Le/e/a/DirectoryIndex$Bucket;->parent:Ljava/lang/Object;

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const-string v2, ""

    const/4 v4, 0x1

    move-object v1, p1

    invoke-direct/range {v1 .. v8}, Le/e/a/DirectoryIndex$Item;-><init>(Ljava/lang/String;Ljava/lang/Object;ZJJ)V

    return-object p1

    :cond_18
    iget-object v0, p0, Le/e/a/DirectoryIndex;->root:Le/e/a/DirectoryIndex$Bucket;

    invoke-virtual {v0, p1}, Le/e/a/DirectoryIndex$Bucket;->metadata(Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;

    move-result-object v0

    if-eqz v0, :cond_25

    iget-boolean v1, v0, Le/e/a/DirectoryIndex$Item;->directory:Z

    if-nez v1, :cond_25

    return-object v0

    :cond_25
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Le/e/a/DirectoryIndex;->bucket(Ljava/lang/String;Z)Le/e/a/DirectoryIndex$Bucket;

    move-result-object v0

    invoke-virtual {v0, p1}, Le/e/a/DirectoryIndex$Bucket;->metadata(Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;

    move-result-object p1

    return-object p1
.end method
