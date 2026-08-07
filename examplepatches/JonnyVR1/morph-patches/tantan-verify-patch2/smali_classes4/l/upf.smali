.class public Ll/upf;
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
    invoke-virtual {p0, p1}, Ll/upf;->h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Ll/upf;->i(Ll/spf$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 6

    .line 1
    iget-object v3, p1, Ll/spf$a;->c:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v2, p1, Ll/spf$a;->g:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p1, Ll/spf$a;->k:Ll/btl;

    .line 6
    .line 7
    iget-object v1, p1, Ll/spf$a;->b:Landroid/view/View;

    .line 8
    .line 9
    iget-object v4, p1, Ll/spf$a;->i:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    invoke-interface {v0, v1, v4}, Ll/btl;->D0(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/rpf;->g(Ll/spf$a;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iget-boolean v4, p1, Ll/spf$a;->j:Z

    .line 19
    .line 20
    move-object v0, p0

    .line 21
    move-object v5, p1

    .line 22
    invoke-virtual/range {v0 .. v5}, Ll/rpf;->f(ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;ZLl/spf$a;)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 26
    .line 27
    return-object p0
.end method

.method public i(Ll/spf$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
