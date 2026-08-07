.class public Ll/qrh;
.super Ll/erh;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/erh;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/frh$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qrh;->h(Ll/frh$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    check-cast p1, Ll/frh$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qrh;->i(Ll/frh$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(Ll/frh$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 1

    .line 1
    iget-object p0, p1, Ll/frh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p1, Ll/frh$a;->g:Ll/ttl;

    .line 7
    .line 8
    iget-object p1, p1, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 9
    .line 10
    const-string v0, "failFakeUser"

    .line 11
    .line 12
    invoke-interface {p0, p1, v0}, Ll/ttl;->k2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 16
    .line 17
    return-object p0
.end method

.method public i(Ll/frh$a;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method
