.class public Ll/olp;
.super Ll/ufp;
.source "SourceFile"


# static fields
.field public static volatile a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ufp;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/olp;Ll/rfh0$a;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/olp;->p(Ll/rfh0$a;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j(Ll/olp;Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/olp;->s(Ll/rfh0$a;)V

    return-void
.end method

.method public static synthetic k(Ll/olp;Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/olp;->q(Ll/rfh0$a;)V

    return-void
.end method

.method public static synthetic l(Ll/olp;Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/olp;->r(Ll/rfh0$a;)V

    return-void
.end method

.method public static u(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/olp;->a:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/rfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/olp;->m(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Ll/olp;->v(Ll/rfh0$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/b240;->p5()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    const-string v1, "p_intl_tribe_swipe_view,e_superlikeButton,click"

    .line 20
    .line 21
    :cond_0
    move-object v3, v1

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    invoke-static {}, Ll/d79;->b0()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object p0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 44
    .line 45
    iget-object p0, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v8

    .line 51
    const/4 v5, 0x0

    .line 52
    const/4 v6, 0x0

    .line 53
    const/4 v7, 0x0

    .line 54
    invoke-static/range {v2 .. v8}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p1, Ll/rfh0$a;->a:Ll/hjp;

    .line 58
    .line 59
    iget-object p1, p1, Ll/rfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 60
    .line 61
    const-string v0, "failLessVipSuperLike"

    .line 62
    .line 63
    invoke-virtual {p0, p1, v0}, Ll/hjp;->x2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    :goto_0
    iget-object v0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/klp;

    .line 74
    .line 75
    invoke-direct {v1, p0, p1}, Ll/klp;-><init>(Ll/olp;Ll/rfh0$a;)V

    .line 76
    .line 77
    .line 78
    const/4 p0, 0x1

    .line 79
    invoke-static {v0, v3, p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILl/a30;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p1, Ll/rfh0$a;->a:Ll/hjp;

    .line 83
    .line 84
    iget-object p1, p1, Ll/rfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 85
    .line 86
    const-string v0, "failExhaustSuperlike"

    .line 87
    .line 88
    invoke-virtual {p0, p1, v0}, Ll/hjp;->x2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 92
    .line 93
    return-object p0
.end method

.method public final n(Ll/rfh0$a;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/llp;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1}, Ll/llp;-><init>(Ll/olp;Ll/rfh0$a;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final o(Ll/rfh0$a;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/olp;->w(Ll/rfh0$a;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-object v0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/mlp;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1}, Ll/mlp;-><init>(Ll/olp;Ll/rfh0$a;)V

    .line 41
    .line 42
    .line 43
    const-wide/16 p0, 0x12c

    .line 44
    .line 45
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    iget-object v0, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    iget-object v0, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/ik4;->a()Ll/q7m;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    iget-object v0, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/ik4;->a()Ll/q7m;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Ll/q7m;->getCardView()Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    goto :goto_0

    .line 80
    :cond_3
    const/4 v0, 0x0

    .line 81
    :goto_0
    iget-object v1, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 82
    .line 83
    iget-object v2, v1, Ll/pkp;->o:Lv/VFrame;

    .line 84
    .line 85
    if-eqz v0, :cond_5

    .line 86
    .line 87
    if-nez v2, :cond_4

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_4
    new-instance v3, Ll/ndp;

    .line 91
    .line 92
    invoke-virtual {v1}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-direct {v3, v1, v2}, Ll/ndp;-><init>(Landroid/content/Context;Lv/VFrame;)V

    .line 97
    .line 98
    .line 99
    new-instance v1, Ll/nlp;

    .line 100
    .line 101
    invoke-direct {v1, p0, p1}, Ll/nlp;-><init>(Ll/olp;Ll/rfh0$a;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3, v0, v1}, Ll/ndp;->i(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_5
    :goto_1
    invoke-virtual {p0, p1}, Ll/olp;->w(Ll/rfh0$a;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final synthetic p(Ll/rfh0$a;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/olp;->n(Ll/rfh0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q(Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/olp;->o(Ll/rfh0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r(Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/olp;->t(Ll/rfh0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s(Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/olp;->w(Ll/rfh0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final t(Ll/rfh0$a;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/olp;->o(Ll/rfh0$a;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0, p1}, Ll/olp;->w(Ll/rfh0$a;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public v(Ll/rfh0$a;)Z
    .locals 4

    .line 1
    sget-boolean p0, Ll/olp;->a:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    sput-boolean v0, Ll/olp;->a:Z

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 16
    .line 17
    iget-object v1, p1, Ll/rfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 18
    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    if-ne v1, v2, :cond_1

    .line 23
    .line 24
    move v1, v3

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v1, v0

    .line 27
    :goto_0
    invoke-static {}, Ll/d79;->j0()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    iget-object v2, p1, Ll/rfh0$a;->a:Ll/hjp;

    .line 36
    .line 37
    iget-object p1, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v2, p1}, Ll/hjp;->C1(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    return v0

    .line 52
    :cond_2
    if-eqz v1, :cond_3

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-static {p0}, Ll/a5i0;->w0(I)I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_3

    .line 63
    .line 64
    return v3

    .line 65
    :cond_3
    return v0
.end method

.method public final w(Ll/rfh0$a;)V
    .locals 0

    .line 1
    iget-object p0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    const/4 p0, 0x1

    .line 24
    invoke-static {p0}, Ll/clp;->r(Z)V

    .line 25
    .line 26
    .line 27
    invoke-static {p0}, Ll/olp;->u(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 37
    .line 38
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
