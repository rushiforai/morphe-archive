.class final Le/e/a/PlaylistStorage;
.super Ljava/lang/Object;
.source "PlaylistStorage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlaylistStorage$Edit;,
        Le/e/a/PlaylistStorage$Persistence;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized update(Le/e/a/PlaylistStorage$Persistence;Le/e/a/PlaylistStorage$Edit;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Le/e/a/PlaylistStorage;

    monitor-enter v0

    .line 8
    :try_start_3
    invoke-interface {p0}, Le/e/a/PlaylistStorage$Persistence;->read()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/LocalPlaylistData;

    invoke-direct {v2, v1}, Le/e/a/LocalPlaylistData;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v2}, Le/e/a/PlaylistStorage$Edit;->apply(Le/e/a/LocalPlaylistData;)V

    .line 10
    new-instance p1, Le/e/a/LocalPlaylistData;

    invoke-virtual {v2}, Le/e/a/LocalPlaylistData;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p1, v2}, Le/e/a/LocalPlaylistData;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Le/e/a/LocalPlaylistData;->toString()Ljava/lang/String;

    move-result-object p1

    .line 11
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_35

    if-eqz v2, :cond_25

    monitor-exit v0

    const/4 p0, 0x1

    return p0

    .line 12
    :cond_25
    :try_start_25
    invoke-interface {p0, p1}, Le/e/a/PlaylistStorage$Persistence;->write(Ljava/lang/String;)Z

    move-result p1
    :try_end_29
    .catchall {:try_start_25 .. :try_end_29} :catchall_30

    if-nez p1, :cond_2e

    :try_start_2b
    invoke-interface {p0, v1}, Le/e/a/PlaylistStorage$Persistence;->restore(Ljava/lang/String;)V
    :try_end_2e
    .catchall {:try_start_2b .. :try_end_2e} :catchall_35

    :cond_2e
    monitor-exit v0

    return p1

    :catchall_30
    move-exception p1

    :try_start_31
    invoke-interface {p0, v1}, Le/e/a/PlaylistStorage$Persistence;->restore(Ljava/lang/String;)V

    throw p1
    :try_end_35
    .catchall {:try_start_31 .. :try_end_35} :catchall_35

    .line 7
    :catchall_35
    move-exception p0

    monitor-exit v0

    throw p0
.end method
