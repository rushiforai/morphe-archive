.class public Ll/mf40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/if40;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;

.field public b:Lv/VListCell;

.field public c:Lv/VListCell;

.field public d:Lv/VListCell;

.field public e:Lv/VListCell;

.field public f:Lv/VListCell;

.field public g:Lv/VLinear;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Landroid/view/View;

.field public j:Ll/if40;

.field public k:Ljava/lang/String;

.field public l:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public m:Lcom/p1/mobile/putong/data/Settings;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/mf40;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/mf40;->h:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    return-void
.end method

.method public static H(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 5

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Bn()J

    .line 21
    .line 22
    .line 23
    move-result-wide v3

    .line 24
    sub-long/2addr v3, v1

    .line 25
    const-wide/16 v1, 0x0

    .line 26
    .line 27
    cmp-long v1, v3, v1

    .line 28
    .line 29
    if-ltz v1, :cond_0

    .line 30
    .line 31
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->p2:I

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const-string v1, "\u5f00\u542f\u6b64\u529f\u80fd\u4f1a\u5bfc\u81f4\u201c\u67e5\u770b\u8c01\u559c\u6b22\u6211\u201c\u5217\u8868\u5185\u4e0d\u4f1a\u518d\u6709\u65b0\u7684\u559c\u6b22\u4f60\u7684\u7528\u6237\uff0c\u5982\u679c\u540e\u7eed\u518d\u8d2d\u4e70\u201c\u67e5\u770b\u8c01\u559c\u6b22\u6211\u201c\u5c06\u9ed8\u8ba4\u91cd\u65b0\u5173\u95ed"

    .line 39
    .line 40
    :goto_0
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->q2:I

    .line 45
    .line 46
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v1, p0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->b0:I

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->h:I

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance v1, Ll/mf40$a;

    .line 67
    .line 68
    invoke-direct {v1, p1}, Ll/mf40$a;-><init>(Ljava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static synthetic a(Ll/mf40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mf40;->w()V

    return-void
.end method

.method public static synthetic b(ILv/VListCell;)V
    .locals 1

    .line 1
    sget v0, Ll/gdc0;->S:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lv/VSwitchButton;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lv/VSwitchButton;->setActiveSliderColor(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic c(IILv/VListCell;)V
    .locals 1

    .line 1
    sget v0, Ll/gdc0;->S:I

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Lv/VSwitchButton;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Lv/VSwitchButton;->setThumbActiveColor(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, p1}, Lv/VSwitchButton;->setThumbInActiveColor(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method


# virtual methods
.method public varargs A(I[Lv/VListCell;)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    array-length p0, p2

    .line 2
    const/4 v0, 0x0

    .line 3
    :goto_0
    if-ge v0, p0, :cond_0

    .line 4
    .line 5
    aget-object v1, p2, v0

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Lv/VListCell;->setTitleColor(I)V

    .line 8
    .line 9
    .line 10
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return-void
.end method

.method public B(Landroid/graphics/Typeface;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/mf40;->b:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mf40;->c:Lv/VListCell;

    .line 4
    .line 5
    iget-object v2, p0, Ll/mf40;->d:Lv/VListCell;

    .line 6
    .line 7
    iget-object v3, p0, Ll/mf40;->e:Lv/VListCell;

    .line 8
    .line 9
    iget-object v4, p0, Ll/mf40;->f:Lv/VListCell;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lv/VListCell;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, p1, v0}, Ll/mf40;->C(Landroid/graphics/Typeface;[Lv/VListCell;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public varargs C(Landroid/graphics/Typeface;[Lv/VListCell;)V
    .locals 2

    .line 1
    array-length p0, p2

    .line 2
    const/4 v0, 0x0

    .line 3
    :goto_0
    if-ge v0, p0, :cond_0

    .line 4
    .line 5
    aget-object v1, p2, v0

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Lv/VListCell;->setTitleTypeface(Landroid/graphics/Typeface;)V

    .line 8
    .line 9
    .line 10
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mf40;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mf40;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mf40;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-void
.end method

.method public G(I)V
    .locals 5
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/mf40;->b:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mf40;->c:Lv/VListCell;

    .line 4
    .line 5
    iget-object v2, p0, Ll/mf40;->d:Lv/VListCell;

    .line 6
    .line 7
    iget-object v3, p0, Ll/mf40;->e:Lv/VListCell;

    .line 8
    .line 9
    iget-object v4, p0, Ll/mf40;->f:Lv/VListCell;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lv/VListCell;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, p1, v0}, Ll/mf40;->A(I[Lv/VListCell;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nf40;->a(Ll/mf40;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mf40;->i:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mf40;->d(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Ll/if40;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mf40;->j:Ll/if40;

    .line 2
    .line 3
    return-void
.end method

.method public i(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mf40;->b:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mf40;->c:Lv/VListCell;

    .line 4
    .line 5
    iget-object v2, p0, Ll/mf40;->d:Lv/VListCell;

    .line 6
    .line 7
    iget-object v3, p0, Ll/mf40;->e:Lv/VListCell;

    .line 8
    .line 9
    iget-object p0, p0, Ll/mf40;->f:Lv/VListCell;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, p0}, [Lv/VListCell;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/lf40;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Ll/lf40;-><init>(I)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/if40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mf40;->f(Ll/if40;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mf40;->i:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mf40;->b:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mf40;->c:Lv/VListCell;

    .line 4
    .line 5
    iget-object v2, p0, Ll/mf40;->d:Lv/VListCell;

    .line 6
    .line 7
    iget-object v3, p0, Ll/mf40;->e:Lv/VListCell;

    .line 8
    .line 9
    iget-object p0, p0, Ll/mf40;->f:Lv/VListCell;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, p0}, [Lv/VListCell;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/kf40;

    .line 20
    .line 21
    invoke-direct {v0, p1, p2}, Ll/kf40;-><init>(II)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mf40;->f:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/mf40;->j:Ll/if40;

    .line 7
    .line 8
    iget-object v1, p0, Ll/mf40;->f:Lv/VListCell;

    .line 9
    .line 10
    invoke-static {v1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ll/if40;->x0(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/mf40;->j:Ll/if40;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/if40;->W0()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mf40;->b:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/mf40;->j:Ll/if40;

    .line 7
    .line 8
    iget-object v1, p0, Ll/mf40;->b:Lv/VListCell;

    .line 9
    .line 10
    invoke-static {v1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ll/if40;->s0(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/mf40;->j:Ll/if40;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/if40;->W0()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mf40;->e:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/mf40;->j:Ll/if40;

    .line 7
    .line 8
    iget-object v1, p0, Ll/mf40;->e:Lv/VListCell;

    .line 9
    .line 10
    invoke-static {v1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ll/if40;->t0(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/mf40;->j:Ll/if40;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/if40;->W0()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mf40;->c:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/mf40;->j:Ll/if40;

    .line 7
    .line 8
    iget-object v1, p0, Ll/mf40;->c:Lv/VListCell;

    .line 9
    .line 10
    invoke-static {v1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ll/if40;->u0(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/mf40;->j:Ll/if40;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/if40;->W0()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mf40;->d:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/mf40;->d:Lv/VListCell;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/mf40;->j:Ll/if40;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Ll/if40;->b1(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/mf40;->j:Ll/if40;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/if40;->W0()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/mf40;->k:Ljava/lang/String;

    .line 26
    .line 27
    const-string v0, "privacy_type"

    .line 28
    .line 29
    const-string v1, "show_to_mylikes_only"

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    filled-new-array {v0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "e_privacy"

    .line 40
    .line 41
    invoke-static {v1, p0, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/jf40;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/jf40;-><init>(Ll/mf40;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/mf40;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public q()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mf40;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()V
    .locals 3

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sk()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/mf40;->d:Lv/VListCell;

    .line 16
    .line 17
    const-string v1, "\u4ec5\u9650\u5fc3\u52a8\u5bf9\u8c61\u53ef\u89c1"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitle(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/mf40;->d:Lv/VListCell;

    .line 23
    .line 24
    const-string v1, "\u5f00\u542f\u540e\uff0c\u53ea\u6709\u4f60\u53f3\u6ed1\u8fc7\u7684\u4eba\u624d\u80fd\u6ed1\u5230\u4f60"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lv/VListCell;->setSubTitle(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/mf40;->d:Lv/VListCell;

    .line 30
    .line 31
    iget-object v1, p0, Ll/mf40;->j:Ll/if40;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/if40;->S0()Landroid/view/View$OnClickListener;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/mf40;->c:Lv/VListCell;

    .line 41
    .line 42
    iget-object v1, p0, Ll/mf40;->j:Ll/if40;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/if40;->R0()Landroid/view/View$OnClickListener;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/mf40;->e:Lv/VListCell;

    .line 52
    .line 53
    iget-object v1, p0, Ll/mf40;->j:Ll/if40;

    .line 54
    .line 55
    invoke-virtual {v1}, Ll/if40;->Q0()Landroid/view/View$OnClickListener;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/mf40;->b:Lv/VListCell;

    .line 63
    .line 64
    iget-object v1, p0, Ll/mf40;->j:Ll/if40;

    .line 65
    .line 66
    invoke-virtual {v1}, Ll/if40;->P0()Landroid/view/View$OnClickListener;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/mf40;->f:Lv/VListCell;

    .line 74
    .line 75
    iget-object v1, p0, Ll/mf40;->j:Ll/if40;

    .line 76
    .line 77
    invoke-virtual {v1}, Ll/if40;->O0()Landroid/view/View$OnClickListener;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/mf40;->g:Lv/VLinear;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    const/4 v1, 0x0

    .line 91
    const/4 v2, 0x1

    .line 92
    if-eqz v0, :cond_1

    .line 93
    .line 94
    iget-object v0, p0, Ll/mf40;->g:Lv/VLinear;

    .line 95
    .line 96
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/mf40;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 100
    .line 101
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    iget-object p0, p0, Ll/mf40;->g:Lv/VLinear;

    .line 108
    .line 109
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_1
    iget-object v0, p0, Ll/mf40;->f:Lv/VListCell;

    .line 114
    .line 115
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/mf40;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 119
    .line 120
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_2

    .line 125
    .line 126
    iget-object v0, p0, Ll/mf40;->f:Lv/VListCell;

    .line 127
    .line 128
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->xj()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_3

    .line 144
    .line 145
    iget-object p0, p0, Ll/mf40;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;

    .line 146
    .line 147
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 148
    .line 149
    .line 150
    :cond_3
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mf40;->d:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->showMeToMyLike:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/mf40;->c:Lv/VListCell;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/mf40;->e:Lv/VListCell;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/mf40;->b:Lv/VListCell;

    .line 35
    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/mf40;->f:Lv/VListCell;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-static {p0, p1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/mf40;->m:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    iget-object v0, p0, Ll/mf40;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;

    .line 4
    .line 5
    iget-object p0, p0, Ll/mf40;->h:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mf40;->e(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mf40;->r()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic w()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mf40;->d:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/mf40;->j:Ll/if40;

    .line 7
    .line 8
    iget-object v1, p0, Ll/mf40;->d:Lv/VListCell;

    .line 9
    .line 10
    invoke-static {v1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ll/if40;->b1(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/mf40;->j:Ll/if40;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/if40;->W0()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/mf40;->k:Ljava/lang/String;

    .line 23
    .line 24
    const-string v0, "privacy_type"

    .line 25
    .line 26
    const-string v1, "show_to_mylikes_only"

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    filled-new-array {v0}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "e_privacy"

    .line 37
    .line 38
    invoke-static {v1, p0, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public x()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mf40;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "p_advanced_filter_page"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/mf40;->k:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public y(Landroid/graphics/drawable/Drawable;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/mf40;->b:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mf40;->c:Lv/VListCell;

    .line 4
    .line 5
    iget-object v2, p0, Ll/mf40;->d:Lv/VListCell;

    .line 6
    .line 7
    iget-object v3, p0, Ll/mf40;->e:Lv/VListCell;

    .line 8
    .line 9
    iget-object v4, p0, Ll/mf40;->f:Lv/VListCell;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lv/VListCell;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, p1, v0}, Ll/mf40;->z(Landroid/graphics/drawable/Drawable;[Lv/VListCell;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public varargs z(Landroid/graphics/drawable/Drawable;[Lv/VListCell;)V
    .locals 2

    .line 1
    array-length p0, p2

    .line 2
    const/4 v0, 0x0

    .line 3
    :goto_0
    if-ge v0, p0, :cond_0

    .line 4
    .line 5
    aget-object v1, p2, v0

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return-void
.end method
