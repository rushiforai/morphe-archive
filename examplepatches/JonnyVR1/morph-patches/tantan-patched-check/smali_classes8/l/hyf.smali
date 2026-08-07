.class public Ll/hyf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public final a:Ll/x0m;


# direct methods
.method public constructor <init>(Ll/x0m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hyf;->a:Ll/x0m;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h(Ll/hyf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hyf;->k()V

    return-void
.end method

.method public static synthetic i(Ll/hyf;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hyf;->l(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method private synthetic k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hyf;->a:Ll/x0m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/hyf;->j(Lcom/p1/mobile/android/app/Act;)Ljava/lang/Runnable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
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
    sget p0, Ll/nec0;->f:I

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
    check-cast p1, Lcom/p1/mobile/putong/core/ui/fakecard/FakeDailogCard;

    .line 2
    .line 3
    new-instance p3, Ll/fyf;

    .line 4
    .line 5
    invoke-direct {p3, p0}, Ll/fyf;-><init>(Ll/hyf;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/fakecard/FakeDailogCard;->f(Ll/x20;)V

    .line 9
    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/hyf;->a:Ll/x0m;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/x0m;->u0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 p2, 0x0

    .line 20
    new-array p2, p2, [Ll/sfj0$a;

    .line 21
    .line 22
    const-string p3, "e_fakeuser_update_photo_card"

    .line 23
    .line 24
    invoke-static {p3, p1, p2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/hyf;->a:Ll/x0m;

    .line 28
    .line 29
    invoke-interface {p1}, Ll/x0m;->O3()V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/hyf;->a:Ll/x0m;

    .line 33
    .line 34
    invoke-interface {p0}, Ll/x0m;->J0()V

    .line 35
    .line 36
    .line 37
    :cond_0
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
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(Lcom/p1/mobile/android/app/Act;)Ljava/lang/Runnable;
    .locals 1

    .line 1
    new-instance v0, Ll/gyf;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/gyf;-><init>(Ll/hyf;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic l(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/hyf;->a:Ll/x0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x0m;->u0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v0, v0, [Ll/sfj0$a;

    .line 9
    .line 10
    const-string v1, "e_fakeuser_update_photo_card"

    .line 11
    .line 12
    invoke-static {v1, p0, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Jl(Lcom/p1/mobile/android/app/Act;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
