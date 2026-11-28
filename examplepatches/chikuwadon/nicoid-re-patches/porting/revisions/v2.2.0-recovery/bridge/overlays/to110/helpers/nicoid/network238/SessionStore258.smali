.class public final Lnicoid/network238/SessionStore258;
.super Ljava/lang/Object;
.source "SessionStore258.java"

# interfaces
.implements Lorg/apache/http/client/CookieStore;


# instance fields
.field private final index:Lnicoid/network238/SessionIndex276;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnicoid/network238/SessionIndex276<",
            "Lorg/apache/http/cookie/Cookie;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Lnicoid/network238/SessionIndex276;

    new-instance v1, Lnicoid/network238/SessionStore258$1;

    invoke-direct {v1, p0}, Lnicoid/network238/SessionStore258$1;-><init>(Lnicoid/network238/SessionStore258;)V

    invoke-direct {v0, v1}, Lnicoid/network238/SessionIndex276;-><init>(Lnicoid/network238/SessionIndex276$Rules;)V

    iput-object v0, p0, Lnicoid/network238/SessionStore258;->index:Lnicoid/network238/SessionIndex276;

    return-void
.end method


# virtual methods
.method public declared-synchronized addCookie(Lorg/apache/http/cookie/Cookie;)V
    .registers 3

    monitor-enter p0

    .line 13
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/SessionStore258;->index:Lnicoid/network238/SessionIndex276;

    invoke-virtual {v0, p1}, Lnicoid/network238/SessionIndex276;->add(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 13
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public declared-synchronized clear()V
    .registers 2

    monitor-enter p0

    .line 16
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/SessionStore258;->index:Lnicoid/network238/SessionIndex276;

    invoke-virtual {v0}, Lnicoid/network238/SessionIndex276;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

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

.method public declared-synchronized clearExpired(Ljava/util/Date;)Z
    .registers 3

    monitor-enter p0

    .line 15
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/SessionStore258;->index:Lnicoid/network238/SessionIndex276;

    invoke-virtual {v0, p1}, Lnicoid/network238/SessionIndex276;->clearExpired(Ljava/util/Date;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    .line 15
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public declared-synchronized getCookies()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/apache/http/cookie/Cookie;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 14
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/SessionStore258;->index:Lnicoid/network238/SessionIndex276;

    invoke-virtual {v0}, Lnicoid/network238/SessionIndex276;->snapshot()Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 14
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

.method public declared-synchronized toString()Ljava/lang/String;
    .registers 3

    monitor-enter p0

    .line 17
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SessionStore258[count="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/SessionStore258;->index:Lnicoid/network238/SessionIndex276;

    invoke-virtual {v1}, Lnicoid/network238/SessionIndex276;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 17
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
