.class public Ll/ilp;
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


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/rfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ilp;->i(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Ll/ilp;->j(Ll/rfh0$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "p_intl_tribe_swipe_view,e_intl_tribe_card_like_click,click"

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 18
    .line 19
    invoke-interface {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 20
    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 23
    .line 24
    return-object p0
.end method

.method public j(Ll/rfh0$a;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ufp;->e()Lcom/p1/mobile/putong/data/Counter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 10
    .line 11
    :goto_0
    iget-object p1, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 12
    .line 13
    iget-object p1, p1, Ll/pkp;->U:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "certified"

    .line 16
    .line 17
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ll/joa;->f4()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    iget p1, p0, Lcom/p1/mobile/putong/data/VerificationLimit;->tribeSwipeCount:I

    .line 32
    .line 33
    iget p0, p0, Lcom/p1/mobile/putong/data/VerificationLimit;->tribeTotalCount:I

    .line 34
    .line 35
    if-lt p1, p0, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method
