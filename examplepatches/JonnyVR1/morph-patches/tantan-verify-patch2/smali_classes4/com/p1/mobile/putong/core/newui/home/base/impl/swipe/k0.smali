.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k0;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# instance fields
.field public g:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k0;->g:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic p(Ljava/lang/Object;)V
    .locals 3

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "VirtualCard"

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveMultipleCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 16
    .line 17
    iput-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 18
    .line 19
    new-instance p0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/pf60;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-direct {v1, v0, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y6(Ljava/util/List;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic q(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 9
    .line 10
    iget-object v1, v1, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 11
    .line 12
    invoke-interface {v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->oo()Ll/wfh0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 21
    .line 22
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v1, p0, v0}, Ll/wfh0;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 31
    .line 32
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 33
    .line 34
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->oo()Ll/wfh0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string v1, ""

    .line 43
    .line 44
    invoke-interface {v0, p0, v1}, Ll/wfh0;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k0;->r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k0;->t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public final s()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->oo()Ll/wfh0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/wfh0;->d()Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k0;->g:I

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 26
    .line 27
    iget-object p0, p0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->oo()Ll/wfh0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Ll/wfh0;->i()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance v0, Ll/vjh0;

    .line 46
    .line 47
    invoke-direct {v0}, Ll/vjh0;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/wjh0;

    .line 51
    .line 52
    invoke-direct {v1}, Ll/wjh0;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 1

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k0;->g:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k0;->g:I

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->o1()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 16
    .line 17
    iget-object p1, p1, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 18
    .line 19
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->oo()Ll/wfh0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ll/wfh0;->e()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k0;->s()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return v0
.end method
