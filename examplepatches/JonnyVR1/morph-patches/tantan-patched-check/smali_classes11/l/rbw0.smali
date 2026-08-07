.class public final Ll/rbw0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final a(Ljava/util/concurrent/Callable;Ljava/lang/Object;Ll/ecw0;)Ll/dcw0;
    .locals 1

    .line 1
    invoke-static {p2}, Ll/ecw0;->e(Ll/ecw0;)Ll/xvw0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0, p1, p2}, Ll/rbw0;->b(Ljava/util/concurrent/Callable;Ll/xvw0;Ljava/lang/Object;Ll/ecw0;)Ll/dcw0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static final b(Ljava/util/concurrent/Callable;Ll/xvw0;Ljava/lang/Object;Ll/ecw0;)Ll/dcw0;
    .locals 8

    .line 1
    new-instance v0, Ll/dcw0;

    .line 2
    .line 3
    invoke-static {}, Ll/ecw0;->d()Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object v4

    .line 7
    sget-object v5, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1, p0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 10
    .line 11
    .line 12
    move-result-object v6

    .line 13
    const/4 v7, 0x0

    .line 14
    const/4 v3, 0x0

    .line 15
    move-object v2, p2

    .line 16
    move-object v1, p3

    .line 17
    invoke-direct/range {v0 .. v7}, Ll/dcw0;-><init>(Ll/ecw0;Ljava/lang/Object;Ljava/lang/String;Ll/hpr;Ljava/util/List;Ll/hpr;Ll/ccw0;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public static final c(Ll/hpr;Ljava/lang/Object;Ll/ecw0;)Ll/dcw0;
    .locals 8

    .line 1
    new-instance v0, Ll/dcw0;

    .line 2
    .line 3
    invoke-static {}, Ll/ecw0;->d()Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object v4

    .line 7
    sget-object v5, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 8
    .line 9
    const/4 v7, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    move-object v6, p0

    .line 12
    move-object v2, p1

    .line 13
    move-object v1, p2

    .line 14
    invoke-direct/range {v0 .. v7}, Ll/dcw0;-><init>(Ll/ecw0;Ljava/lang/Object;Ljava/lang/String;Ll/hpr;Ljava/util/List;Ll/hpr;Ll/ccw0;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public static final d(Ll/lbw0;Ll/xvw0;Ljava/lang/Object;Ll/ecw0;)Ll/dcw0;
    .locals 1

    .line 1
    new-instance v0, Ll/qbw0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qbw0;-><init>(Ll/lbw0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p1, p2, p3}, Ll/rbw0;->b(Ljava/util/concurrent/Callable;Ll/xvw0;Ljava/lang/Object;Ll/ecw0;)Ll/dcw0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
