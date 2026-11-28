.class final Lcom/google/common/collect/Synchronized$SynchronizedEntry;
.super Lcom/google/common/collect/Synchronized$SynchronizedObject;
.source "Synchronized.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Synchronized;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SynchronizedEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/Synchronized$SynchronizedObject;",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# direct methods
.method constructor <init>(Ljava/util/Map$Entry;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "delegate",
            "mutex"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1683
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/Synchronized$SynchronizedObject;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 1678
    invoke-virtual {p0}, Lcom/google/common/collect/Synchronized$SynchronizedEntry;->delegate()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method delegate()Ljava/util/Map$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1689
    invoke-super {p0}, Lcom/google/common/collect/Synchronized$SynchronizedObject;->delegate()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map$Entry;

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    .line 1694
    iget-object v0, p0, Lcom/google/common/collect/Synchronized$SynchronizedEntry;->mutex:Ljava/lang/Object;

    monitor-enter v0

    .line 1695
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/collect/Synchronized$SynchronizedEntry;->delegate()Ljava/util/Map$Entry;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Map$Entry;->equals(Ljava/lang/Object;)Z

    move-result p0

    monitor-exit v0

    return p0

    .line 1696
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public getKey()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 1708
    iget-object v0, p0, Lcom/google/common/collect/Synchronized$SynchronizedEntry;->mutex:Ljava/lang/Object;

    monitor-enter v0

    .line 1709
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/collect/Synchronized$SynchronizedEntry;->delegate()Ljava/util/Map$Entry;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    monitor-exit v0

    return-object p0

    .line 1710
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 1715
    iget-object v0, p0, Lcom/google/common/collect/Synchronized$SynchronizedEntry;->mutex:Ljava/lang/Object;

    monitor-enter v0

    .line 1716
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/collect/Synchronized$SynchronizedEntry;->delegate()Ljava/util/Map$Entry;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    monitor-exit v0

    return-object p0

    .line 1717
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public hashCode()I
    .registers 2

    .line 1701
    iget-object v0, p0, Lcom/google/common/collect/Synchronized$SynchronizedEntry;->mutex:Ljava/lang/Object;

    monitor-enter v0

    .line 1702
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/collect/Synchronized$SynchronizedEntry;->delegate()Ljava/util/Map$Entry;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map$Entry;->hashCode()I

    move-result p0

    monitor-exit v0

    return p0

    .line 1703
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .line 1722
    iget-object v0, p0, Lcom/google/common/collect/Synchronized$SynchronizedEntry;->mutex:Ljava/lang/Object;

    monitor-enter v0

    .line 1723
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/collect/Synchronized$SynchronizedEntry;->delegate()Ljava/util/Map$Entry;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    monitor-exit v0

    return-object p0

    .line 1724
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method
