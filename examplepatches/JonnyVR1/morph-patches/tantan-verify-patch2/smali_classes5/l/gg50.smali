.class public Ll/gg50;
.super Ll/o8l;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/o8l;-><init>(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gg50;->e(Ll/p8l$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Ll/p8l$a;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/p8l$a;->b:Ll/b240;

    .line 2
    .line 3
    invoke-static {p0}, Ll/j7d0;->h0(Ll/b240;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public e(Ll/p8l$a;)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/j7d0;->f0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 v0, 0x0

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    return v0

    .line 21
    :cond_0
    invoke-static {}, Ll/spl0;->F()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_offline_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p1, v1, v0}, Ll/rj50;->M(Ljava/lang/String;Z)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    invoke-static {}, Ll/j7d0;->c0()Ll/j7d0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const/4 p1, 0x1

    .line 52
    iput-boolean p1, p0, Ll/j7d0;->f:Z

    .line 53
    .line 54
    return v0

    .line 55
    :cond_1
    return p0
.end method

.method public f(Ll/p8l$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
