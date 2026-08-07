.class public Ll/zqr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/Active;

.field public b:Ll/x0m;

.field public final c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/core/ui/active/LiveActiveCard;


# direct methods
.method public constructor <init>(Ll/x0m;Lcom/p1/mobile/putong/core/data/Active;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "e_suggest_luckytt_card"

    .line 5
    .line 6
    iput-object v0, p0, Ll/zqr;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/zqr;->b:Ll/x0m;

    .line 9
    .line 10
    iput-object p2, p0, Ll/zqr;->a:Lcom/p1/mobile/putong/core/data/Active;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic h(Ll/zqr;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zqr;->i()V

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
    sget p0, Ll/nec0;->q:I

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
    .locals 2

    .line 1
    iget-object p4, p0, Ll/zqr;->d:Lcom/p1/mobile/putong/core/ui/active/LiveActiveCard;

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    if-eq p4, p1, :cond_1

    .line 6
    .line 7
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/core/ui/active/LiveActiveCard;

    .line 8
    .line 9
    iput-object p1, p0, Ll/zqr;->d:Lcom/p1/mobile/putong/core/ui/active/LiveActiveCard;

    .line 10
    .line 11
    iget-object p4, p0, Ll/zqr;->b:Ll/x0m;

    .line 12
    .line 13
    iget-object v0, p0, Ll/zqr;->a:Lcom/p1/mobile/putong/core/data/Active;

    .line 14
    .line 15
    new-instance v1, Ll/yqr;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/yqr;-><init>(Ll/zqr;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p4, p3, v0, v1}, Lcom/p1/mobile/putong/core/ui/active/LiveActiveCard;->c(Ll/x0m;Lcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/data/Active;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    if-nez p2, :cond_2

    .line 24
    .line 25
    iget-object p1, p0, Ll/zqr;->b:Ll/x0m;

    .line 26
    .line 27
    invoke-interface {p1}, Ll/x0m;->u0()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const/4 p2, 0x0

    .line 32
    new-array p3, p2, [Ll/sfj0$a;

    .line 33
    .line 34
    const-string p4, "e_suggest_luckytt_card"

    .line 35
    .line 36
    invoke-static {p4, p1, p3}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/zqr;->d:Lcom/p1/mobile/putong/core/ui/active/LiveActiveCard;

    .line 40
    .line 41
    iput-boolean p2, p1, Lcom/p1/mobile/putong/core/ui/active/LiveActiveCard;->d:Z

    .line 42
    .line 43
    iget-object p1, p0, Ll/zqr;->b:Ll/x0m;

    .line 44
    .line 45
    invoke-interface {p1}, Ll/x0m;->O3()V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/zqr;->b:Ll/x0m;

    .line 49
    .line 50
    invoke-interface {p0}, Ll/x0m;->J0()V

    .line 51
    .line 52
    .line 53
    :cond_2
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
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq p2, v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 19
    .line 20
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-ne p1, p2, :cond_1

    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Ll/zqr;->b:Ll/x0m;

    .line 27
    .line 28
    invoke-interface {p1}, Ll/x0m;->u0()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 p2, 0x0

    .line 33
    new-array p2, p2, [Ll/sfj0$a;

    .line 34
    .line 35
    const-string v0, "e_suggest_luckytt_card"

    .line 36
    .line 37
    invoke-static {v0, p1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/zqr;->b:Ll/x0m;

    .line 41
    .line 42
    invoke-interface {p1}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p2, p0, Ll/zqr;->a:Lcom/p1/mobile/putong/core/data/Active;

    .line 47
    .line 48
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Active;->cardLandPageUrl:Ljava/lang/String;

    .line 49
    .line 50
    const-string v0, ""

    .line 51
    .line 52
    invoke-static {p1, v0, p2}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string p2, "hideNavigationBar"

    .line 57
    .line 58
    invoke-virtual {p1, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Ll/zqr;->b:Ll/x0m;

    .line 62
    .line 63
    invoke-interface {p2}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Ll/zqr;->d:Lcom/p1/mobile/putong/core/ui/active/LiveActiveCard;

    .line 71
    .line 72
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    iget-object p1, p0, Ll/zqr;->d:Lcom/p1/mobile/putong/core/ui/active/LiveActiveCard;

    .line 79
    .line 80
    iput-boolean v1, p1, Lcom/p1/mobile/putong/core/ui/active/LiveActiveCard;->d:Z

    .line 81
    .line 82
    :cond_2
    iget-object p0, p0, Ll/zqr;->b:Ll/x0m;

    .line 83
    .line 84
    invoke-interface {p0}, Ll/x0m;->I()V

    .line 85
    .line 86
    .line 87
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 88
    .line 89
    return-object p0
.end method

.method public final synthetic i()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zqr;->b:Ll/x0m;

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
