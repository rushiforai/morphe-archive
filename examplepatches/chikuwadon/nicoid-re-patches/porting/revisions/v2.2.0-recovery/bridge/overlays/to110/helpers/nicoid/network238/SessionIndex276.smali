.class final Lnicoid/network238/SessionIndex276;
.super Ljava/lang/Object;
.source "SessionIndex276.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/SessionIndex276$Rules;
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


# instance fields
.field private final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final rules:Lnicoid/network238/SessionIndex276$Rules;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnicoid/network238/SessionIndex276$Rules<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lnicoid/network238/SessionIndex276$Rules;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/SessionIndex276$Rules<",
            "TT;>;)V"
        }
    .end annotation

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnicoid/network238/SessionIndex276;->entries:Ljava/util/List;

    .line 8
    iput-object p1, p0, Lnicoid/network238/SessionIndex276;->rules:Lnicoid/network238/SessionIndex276$Rules;

    return-void
.end method

.method private domain(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 9
    iget-object v0, p0, Lnicoid/network238/SessionIndex276;->rules:Lnicoid/network238/SessionIndex276$Rules;

    invoke-interface {v0, p1}, Lnicoid/network238/SessionIndex276$Rules;->domain(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const-string p1, ""

    :cond_0
    return-object p1
.end method

.method private path(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 10
    iget-object v0, p0, Lnicoid/network238/SessionIndex276;->rules:Lnicoid/network238/SessionIndex276$Rules;

    invoke-interface {v0, p1}, Lnicoid/network238/SessionIndex276$Rules;->path(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const-string p1, "/"

    :cond_0
    return-object p1
.end method

.method private same(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .line 11
    iget-object v0, p0, Lnicoid/network238/SessionIndex276;->rules:Lnicoid/network238/SessionIndex276$Rules;

    invoke-interface {v0, p1}, Lnicoid/network238/SessionIndex276$Rules;->name(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/SessionIndex276;->rules:Lnicoid/network238/SessionIndex276$Rules;

    invoke-interface {v1, p2}, Lnicoid/network238/SessionIndex276$Rules;->name(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lnicoid/network238/SessionIndex276;->domain(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p2}, Lnicoid/network238/SessionIndex276;->domain(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lnicoid/network238/SessionIndex276;->path(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2}, Lnicoid/network238/SessionIndex276;->path(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method declared-synchronized add(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    monitor-enter p0

    .line 12
    if-eqz p1, :cond_2

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/SessionIndex276;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lnicoid/network238/SessionIndex276;->same(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lnicoid/network238/SessionIndex276;->rules:Lnicoid/network238/SessionIndex276$Rules;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-interface {v0, p1, v1}, Lnicoid/network238/SessionIndex276$Rules;->expired(Ljava/lang/Object;Ljava/util/Date;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lnicoid/network238/SessionIndex276;->entries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    monitor-exit p0

    return-void

    .line 12
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1
.end method

.method declared-synchronized clear()V
    .registers 2

    monitor-enter p0

    .line 15
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/SessionIndex276;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 15
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method declared-synchronized clearExpired(Ljava/util/Date;)Z
    .registers 6

    monitor-enter p0

    .line 14
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    :try_start_0
    iget-object v1, p0, Lnicoid/network238/SessionIndex276;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lnicoid/network238/SessionIndex276;->rules:Lnicoid/network238/SessionIndex276$Rules;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3, p1}, Lnicoid/network238/SessionIndex276$Rules;->expired(Ljava/lang/Object;Ljava/util/Date;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    monitor-exit p0

    return v0

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1
.end method

.method declared-synchronized size()I
    .registers 2

    monitor-enter p0

    .line 16
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/SessionIndex276;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 16
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method declared-synchronized snapshot()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    monitor-enter p0

    .line 13
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lnicoid/network238/SessionIndex276;->entries:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 13
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method
