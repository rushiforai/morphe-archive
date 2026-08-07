.class public Ll/bqf;
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
    invoke-virtual {p0, p1}, Ll/bqf;->h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Ll/bqf;->i(Ll/spf$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 3

    .line 1
    iget-boolean p0, p1, Ll/spf$a;->h:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/spf$a;->a()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Ll/spf$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iget-object v0, p1, Ll/spf$a;->g:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v1, p1, Ll/spf$a;->d:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-static {p0, v0, v1, v2}, Ll/zof;->M(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Ll/spf$a;->k:Ll/btl;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/spf$a;->a()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const-string v0, "no_condition_to_rightswipe"

    .line 28
    .line 29
    invoke-interface {p0, p1, v0}, Ll/btl;->M3(ZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 36
    .line 37
    return-object p0
.end method

.method public i(Ll/spf$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p1, Ll/spf$a;->h:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/spf$a;->a()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
