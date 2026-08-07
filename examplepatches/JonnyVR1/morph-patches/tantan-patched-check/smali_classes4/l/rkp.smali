.class public Ll/rkp;
.super Ll/ufp;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ufp;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->Z7()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/dkb;->c8()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ll/k3g;->a()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    return v0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return p0
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/rfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rkp;->i(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/rfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rkp;->k(Ll/rfh0$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 1

    .line 1
    invoke-static {}, Ll/qyf;->f()Ll/qyf;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/qyf;->h(Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p1, Ll/rfh0$a;->a:Ll/hjp;

    .line 15
    .line 16
    iget-object p1, p1, Ll/rfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 17
    .line 18
    const-string v0, "failFakeUser"

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Ll/hjp;->x2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 24
    .line 25
    return-object p0
.end method

.method public k(Ll/rfh0$a;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rkp;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
