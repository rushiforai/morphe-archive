.class public final Ll/bew0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ll/hpr;Ll/cew0;Ll/rdw0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/bew0;->g(Ll/hpr;Ll/cew0;Ll/rdw0;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static b(Ll/hpr;Ll/cew0;Ll/rdw0;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/bew0;->g(Ll/hpr;Ll/cew0;Ll/rdw0;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static c(Ll/hpr;Ll/cew0;Ll/rdw0;)V
    .locals 1

    .line 1
    sget-object v0, Ll/ris0;->c:Ll/kis0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {p0}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v0, Ll/aew0;

    .line 21
    .line 22
    invoke-direct {v0, p1, p2}, Ll/aew0;-><init>(Ll/cew0;Ll/rdw0;)V

    .line 23
    .line 24
    .line 25
    sget-object p1, Ll/oct0;->f:Ll/xvw0;

    .line 26
    .line 27
    invoke-static {p0, v0, p1}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static d(Ll/hpr;Ll/rdw0;)V
    .locals 1

    .line 1
    sget-object v0, Ll/ris0;->c:Ll/kis0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {p0}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v0, Ll/ydw0;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ll/ydw0;-><init>(Ll/rdw0;)V

    .line 23
    .line 24
    .line 25
    sget-object p1, Ll/oct0;->f:Ll/xvw0;

    .line 26
    .line 27
    invoke-static {p0, v0, p1}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static e(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    sget-object v0, Ll/sgs0;->H8:Ll/dgs0;

    .line 10
    .line 11
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public static f(Ll/o7w0;)I
    .locals 1

    .line 1
    invoke-static {p0}, Ll/qyv0;->e(Ll/o7w0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit8 p0, p0, -0x1

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    const/16 p0, 0x17

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x7

    .line 16
    return p0
.end method

.method public static g(Ll/hpr;Ll/cew0;Ll/rdw0;Z)V
    .locals 1

    .line 1
    sget-object v0, Ll/ris0;->c:Ll/kis0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {p0}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v0, Ll/zdw0;

    .line 21
    .line 22
    invoke-direct {v0, p1, p2, p3}, Ll/zdw0;-><init>(Ll/cew0;Ll/rdw0;Z)V

    .line 23
    .line 24
    .line 25
    sget-object p1, Ll/oct0;->f:Ll/xvw0;

    .line 26
    .line 27
    invoke-static {p0, v0, p1}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
