.class public final Ll/cwy0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/awy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public static declared-synchronized a(Ll/avy0;)Ll/jvy0;
    .locals 3

    .line 1
    const-class v0, Ll/cwy0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/cwy0;->a:Ll/awy0;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/awy0;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-direct {v1, v2}, Ll/awy0;-><init>(Ll/yvy0;)V

    .line 12
    .line 13
    .line 14
    sput-object v1, Ll/cwy0;->a:Ll/awy0;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    sget-object v1, Ll/cwy0;->a:Ll/awy0;

    .line 20
    .line 21
    invoke-virtual {v1, p0}, Ll/w9r;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/jvy0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-object p0

    .line 29
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw p0
.end method

.method public static declared-synchronized b(Ljava/lang/String;)Ll/jvy0;
    .locals 1

    .line 1
    const-class p0, Ll/cwy0;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v0, "common"

    .line 5
    .line 6
    invoke-static {v0}, Ll/avy0;->d(Ljava/lang/String;)Ll/yuy0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/yuy0;->c()Ll/avy0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/cwy0;->a(Ll/avy0;)Ll/jvy0;

    .line 15
    .line 16
    .line 17
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    monitor-exit p0

    .line 19
    return-object v0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v0
.end method
