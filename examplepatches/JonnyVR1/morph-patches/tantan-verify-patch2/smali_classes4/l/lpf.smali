.class public Ll/lpf;
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
    invoke-virtual {p0, p1}, Ll/lpf;->h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Ll/lpf;->i(Ll/spf$a;)Z

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
    iget-object p0, p1, Ll/spf$a;->k:Ll/btl;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/spf$a;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const-string v0, "no_total_rightswipe_num"

    .line 8
    .line 9
    invoke-interface {p0, p1, v0}, Ll/btl;->M3(ZLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 13
    .line 14
    return-object p0
.end method

.method public i(Ll/spf$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p1, Ll/spf$a;->f:Z

    .line 2
    .line 3
    return p0
.end method
