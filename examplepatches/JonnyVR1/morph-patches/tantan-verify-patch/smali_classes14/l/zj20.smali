.class public Ll/zj20;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/ry3;Ll/w84;)Ll/i5d0;
    .locals 1

    .line 1
    :try_start_0
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_1
    move-exception v0

    .line 12
    invoke-interface {p1, p0, v0}, Ll/w84;->onFailure(Ll/ry3;Ljava/io/IOException;)V

    .line 13
    .line 14
    .line 15
    :goto_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public static synthetic b(Ll/w84;Ll/ry3;Ll/i5d0;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    :try_start_0
    invoke-interface {p0, p1, p2}, Ll/w84;->onResponse(Ll/ry3;Ll/i5d0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :catch_0
    move-exception p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static c(Ll/ry3;Ll/w84;)V
    .locals 2

    .line 1
    new-instance v0, Ll/xj20;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/xj20;-><init>(Ll/ry3;Ll/w84;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Ll/trd0;->e(Ll/f2e0;)Lrx/c$d;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/yj20;

    .line 31
    .line 32
    invoke-direct {v1, p1, p0}, Ll/yj20;-><init>(Ll/w84;Ll/ry3;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method
