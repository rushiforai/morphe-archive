.class public Ll/kxq0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Ll/cxq0;

.field private static b:Ll/dxq0;


# direct methods
.method public static a(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "onSendMsg"

    .line 2
    .line 3
    invoke-static {v0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/kxq0;->g(Landroid/content/Context;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {p0}, Ll/kxq0;->d(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {p0, v0, v1, v2}, Ll/nxq0;->g(Landroid/content/Context;JZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static b(Landroid/content/Context;Ll/u1r0;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/kxq0;->g(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    sget-object v0, Ll/kxq0;->a:Ll/cxq0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/cxq0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/cxq0;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Ll/kxq0;->a:Ll/cxq0;

    .line 17
    .line 18
    :cond_0
    sget-object v0, Ll/kxq0;->b:Ll/dxq0;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    new-instance v0, Ll/dxq0;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/dxq0;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Ll/kxq0;->b:Ll/dxq0;

    .line 28
    .line 29
    :cond_1
    sget-object p0, Ll/kxq0;->a:Ll/cxq0;

    .line 30
    .line 31
    invoke-virtual {p1, p0, p0}, Ll/u1r0;->n(Ll/z1r0;Ll/d2r0;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Ll/kxq0;->b:Ll/dxq0;

    .line 35
    .line 36
    invoke-virtual {p1, p0, p0}, Ll/u1r0;->z(Ll/z1r0;Ll/d2r0;)V

    .line 37
    .line 38
    .line 39
    const-string p0, "startStats"

    .line 40
    .line 41
    invoke-static {p0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method

.method public static c(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "Push-PowerStats"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/bxq0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static d(Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/u3r0;->q(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static e(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "onReceiveMsg"

    .line 2
    .line 3
    invoke-static {v0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/kxq0;->g(Landroid/content/Context;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {p0}, Ll/kxq0;->d(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {p0, v0, v1, v2}, Ll/nxq0;->k(Landroid/content/Context;JZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static f(Landroid/content/Context;Ll/u1r0;)V
    .locals 1

    .line 1
    sget-object p0, Ll/kxq0;->a:Ll/cxq0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Ll/u1r0;->m(Ll/z1r0;)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Ll/kxq0;->a:Ll/cxq0;

    .line 10
    .line 11
    :cond_0
    sget-object p0, Ll/kxq0;->b:Ll/dxq0;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ll/u1r0;->y(Ll/z1r0;)V

    .line 16
    .line 17
    .line 18
    sput-object v0, Ll/kxq0;->b:Ll/dxq0;

    .line 19
    .line 20
    :cond_1
    const-string p0, "stopStats"

    .line 21
    .line 22
    invoke-static {p0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private static g(Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bxq0;->c(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static h(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "onPing"

    .line 2
    .line 3
    invoke-static {v0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/kxq0;->g(Landroid/content/Context;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {p0}, Ll/kxq0;->d(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {p0, v0, v1, v2}, Ll/nxq0;->l(Landroid/content/Context;JZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static i(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "onPong"

    .line 2
    .line 3
    invoke-static {v0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/kxq0;->g(Landroid/content/Context;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {p0}, Ll/kxq0;->d(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {p0, v0, v1, v2}, Ll/nxq0;->m(Landroid/content/Context;JZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
