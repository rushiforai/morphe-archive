.class public Ll/vpf;
.super Ll/rpf;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rpf;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/spf$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vpf;->h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    check-cast p1, Ll/spf$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vpf;->i(Ll/spf$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 1

    .line 1
    iget-object p0, p1, Ll/spf$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/ey0;->g(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p1, Ll/spf$a;->k:Ll/btl;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/spf$a;->a()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const-string v0, "other"

    .line 19
    .line 20
    invoke-interface {p0, p1, v0}, Ll/btl;->M3(ZLjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 24
    .line 25
    return-object p0
.end method

.method public i(Ll/spf$a;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->f8()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
