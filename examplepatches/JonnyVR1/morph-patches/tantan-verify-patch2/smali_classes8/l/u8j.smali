.class public Ll/u8j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/VirtualCardType;

.field public b:Ll/x0m;


# direct methods
.method public constructor <init>(Ll/x0m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u8j;->b:Ll/x0m;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h(Ll/u8j;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u8j;->n(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;)V

    return-void
.end method

.method public static synthetic i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic k(Ll/u8j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/u8j;->m()V

    return-void
.end method

.method private synthetic m()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u8j;->b:Ll/x0m;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/x0m;->V(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/nec0;->g:I

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/freetrial/FreeTrialCard;

    .line 2
    .line 3
    iput-object p3, p0, Ll/u8j;->a:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 4
    .line 5
    new-instance p2, Ll/q8j;

    .line 6
    .line 7
    invoke-direct {p2, p0}, Ll/q8j;-><init>(Ll/u8j;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p3, p2}, Lcom/p1/mobile/putong/core/ui/freetrial/FreeTrialCard;->f(Lcom/p1/mobile/putong/core/data/VirtualCardType;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/u8j;->b:Ll/x0m;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/x0m;->O3()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iget-object v0, p0, Ll/u8j;->a:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 17
    .line 18
    invoke-interface {p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Un(Lcom/p1/mobile/putong/core/data/VirtualCardType;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, p2, v0}, Ll/u8j;->l(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 27
    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ei(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p0, p0, Ll/u8j;->b:Ll/x0m;

    .line 43
    .line 44
    invoke-interface {p0}, Ll/x0m;->I()V

    .line 45
    .line 46
    .line 47
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 48
    .line 49
    return-object p0
.end method

.method public final l(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u8j;->b:Ll/x0m;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->v1:Ll/dt8;

    .line 6
    .line 7
    invoke-virtual {v1, p1, p2}, Ll/dt8;->j3(Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v0, v1}, Ll/x0m;->z1(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/r8j;

    .line 21
    .line 22
    invoke-direct {v1, p2}, Ll/r8j;-><init>(Ljava/lang/Boolean;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    new-instance v0, Ll/s8j;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1}, Ll/s8j;-><init>(Ll/u8j;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ll/t8j;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/t8j;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic n(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/u8j;->b:Ll/x0m;

    .line 10
    .line 11
    invoke-interface {v0, p0, p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->vs(Ll/x0m;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
