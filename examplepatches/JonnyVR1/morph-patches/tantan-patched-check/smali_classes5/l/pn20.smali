.class public Ll/pn20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/hn20;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VListCell;

.field public b:Lv/VListCell;

.field public c:Lv/VListCell;

.field public d:Lv/VListCell;

.field public e:Lv/VListCell;

.field public f:Lv/VLinear;

.field public g:Lv/VLinear;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Landroid/view/View;

.field public j:Ll/hn20;

.field public k:Ljava/lang/String;


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
    iput-object v0, p0, Ll/pn20;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/pn20;->h:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    return-void
.end method

.method private varargs B(Landroid/graphics/drawable/Drawable;[Lv/VListCell;)V
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

.method private varargs C(I[Lv/VListCell;)V
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

.method private varargs E(Landroid/graphics/Typeface;[Lv/VListCell;)V
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

.method public static synthetic a(IILv/VListCell;)V
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

.method public static synthetic b(Ll/pn20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pn20;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/pn20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pn20;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/pn20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pn20;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(ILv/VListCell;)V
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

.method public static synthetic f(Ll/pn20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pn20;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/pn20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pn20;->y(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Landroid/graphics/drawable/Drawable;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pn20;->a:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pn20;->b:Lv/VListCell;

    .line 4
    .line 5
    iget-object v2, p0, Ll/pn20;->c:Lv/VListCell;

    .line 6
    .line 7
    iget-object v3, p0, Ll/pn20;->d:Lv/VListCell;

    .line 8
    .line 9
    iget-object v4, p0, Ll/pn20;->e:Lv/VListCell;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lv/VListCell;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, p1, v0}, Ll/pn20;->B(Landroid/graphics/drawable/Drawable;[Lv/VListCell;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pn20;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public F(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pn20;->k:Ljava/lang/String;

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
    iget-object v0, p0, Ll/pn20;->a:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pn20;->b:Lv/VListCell;

    .line 4
    .line 5
    iget-object v2, p0, Ll/pn20;->c:Lv/VListCell;

    .line 6
    .line 7
    iget-object v3, p0, Ll/pn20;->d:Lv/VListCell;

    .line 8
    .line 9
    iget-object v4, p0, Ll/pn20;->e:Lv/VListCell;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lv/VListCell;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, p1, v0}, Ll/pn20;->C(I[Lv/VListCell;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public H(Landroid/graphics/Typeface;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pn20;->a:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pn20;->b:Lv/VListCell;

    .line 4
    .line 5
    iget-object v2, p0, Ll/pn20;->c:Lv/VListCell;

    .line 6
    .line 7
    iget-object v3, p0, Ll/pn20;->d:Lv/VListCell;

    .line 8
    .line 9
    iget-object v4, p0, Ll/pn20;->e:Lv/VListCell;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lv/VListCell;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, p1, v0}, Ll/pn20;->E(Landroid/graphics/Typeface;[Lv/VListCell;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final I(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/pn20;->h:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 10
    .line 11
    invoke-interface {v0, p0, p1, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ip(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/hn20;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pn20;->l(Ll/hn20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pn20;->i:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qn20;->a(Ll/pn20;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pn20;->i:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pn20;->j(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ll/hn20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pn20;->j:Ll/hn20;

    .line 2
    .line 3
    return-void
.end method

.method public m(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pn20;->a:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pn20;->b:Lv/VListCell;

    .line 4
    .line 5
    iget-object v2, p0, Ll/pn20;->c:Lv/VListCell;

    .line 6
    .line 7
    iget-object v3, p0, Ll/pn20;->d:Lv/VListCell;

    .line 8
    .line 9
    iget-object p0, p0, Ll/pn20;->e:Lv/VListCell;

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
    new-instance v0, Ll/nn20;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Ll/nn20;-><init>(I)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public n(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pn20;->a:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pn20;->b:Lv/VListCell;

    .line 4
    .line 5
    iget-object v2, p0, Ll/pn20;->c:Lv/VListCell;

    .line 6
    .line 7
    iget-object v3, p0, Ll/pn20;->d:Lv/VListCell;

    .line 8
    .line 9
    iget-object p0, p0, Ll/pn20;->e:Lv/VListCell;

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
    new-instance v0, Ll/on20;

    .line 20
    .line 21
    invoke-direct {v0, p1, p2}, Ll/on20;-><init>(II)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pn20;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pn20;->b:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

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
    iget-object v0, p0, Ll/pn20;->c:Lv/VListCell;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

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
    iget-object v0, p0, Ll/pn20;->d:Lv/VListCell;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

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
    iget-object v0, p0, Ll/pn20;->e:Lv/VListCell;

    .line 35
    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

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
    iget-object p0, p0, Ll/pn20;->a:Lv/VListCell;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

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

.method public s(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/pn20;->k(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/xra;->v()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget-object p1, p0, Ll/pn20;->f:Lv/VLinear;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/pn20;->f:Lv/VLinear;

    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p1, p0, Ll/pn20;->c:Lv/VListCell;

    .line 26
    .line 27
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/pn20;->b:Lv/VListCell;

    .line 31
    .line 32
    new-instance v0, Ll/in20;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/in20;-><init>(Ll/pn20;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/pn20;->c:Lv/VListCell;

    .line 41
    .line 42
    new-instance v0, Ll/jn20;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/jn20;-><init>(Ll/pn20;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/pn20;->d:Lv/VListCell;

    .line 51
    .line 52
    new-instance v0, Ll/kn20;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/kn20;-><init>(Ll/pn20;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/pn20;->e:Lv/VListCell;

    .line 61
    .line 62
    new-instance v0, Ll/ln20;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/ln20;-><init>(Ll/pn20;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/pn20;->a:Lv/VListCell;

    .line 71
    .line 72
    new-instance v0, Ll/mn20;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/mn20;-><init>(Ll/pn20;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/pn20;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/pn20;->b:Lv/VListCell;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    xor-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "is_selected"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "e_advanced_filter_pop"

    .line 28
    .line 29
    invoke-static {v2, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/pn20;->j:Ll/hn20;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/hn20;->u0()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Ll/joa;->z3()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const-string p1, "p_home_filter,advanced"

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/pn20;->I(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/pn20;->p()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object v0, p0, Ll/pn20;->b:Lv/VListCell;

    .line 58
    .line 59
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    xor-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    filled-new-array {v0}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v2, p1, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/pn20;->b:Lv/VListCell;

    .line 81
    .line 82
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/pn20;->j:Ll/hn20;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/hn20;->A0()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/pn20;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/pn20;->c:Lv/VListCell;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    xor-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "is_selected"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "e_advanced_filter_real"

    .line 28
    .line 29
    invoke-static {v2, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/pn20;->j:Ll/hn20;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/hn20;->u0()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Ll/pn20;->j:Ll/hn20;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/hn20;->o0()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    invoke-static {}, Ll/joa;->z3()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const-string p1, "p_home_filter,advanced"

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/pn20;->I(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/pn20;->p()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object v0, p0, Ll/pn20;->c:Lv/VListCell;

    .line 66
    .line 67
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    xor-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    filled-new-array {v0}, [Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v2, p1, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/pn20;->c:Lv/VListCell;

    .line 89
    .line 90
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ll/pn20;->j:Ll/hn20;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/hn20;->A0()V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/pn20;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/pn20;->d:Lv/VListCell;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    xor-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "is_selected"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "e_advanced_filter_student"

    .line 28
    .line 29
    invoke-static {v2, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/pn20;->j:Ll/hn20;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/hn20;->u0()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Ll/pn20;->j:Ll/hn20;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/hn20;->p0()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    invoke-static {}, Ll/joa;->z3()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const-string p1, "p_advanced_filter_page,e_advanced_filter_student,click"

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/pn20;->I(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/pn20;->p()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object v0, p0, Ll/pn20;->d:Lv/VListCell;

    .line 66
    .line 67
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    xor-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    filled-new-array {v0}, [Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v2, p1, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/pn20;->d:Lv/VListCell;

    .line 89
    .line 90
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ll/pn20;->j:Ll/hn20;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/hn20;->A0()V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final synthetic x(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/pn20;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/pn20;->e:Lv/VListCell;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    xor-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "is_selected"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "e_advanced_filter_new"

    .line 28
    .line 29
    invoke-static {v2, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/pn20;->j:Ll/hn20;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/hn20;->u0()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Ll/joa;->z3()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const-string p1, "p_home_filter,advanced"

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/pn20;->I(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/pn20;->p()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object v0, p0, Ll/pn20;->e:Lv/VListCell;

    .line 58
    .line 59
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    xor-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    filled-new-array {v0}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v2, p1, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/pn20;->e:Lv/VListCell;

    .line 81
    .line 82
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/pn20;->j:Ll/hn20;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/hn20;->A0()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/pn20;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/pn20;->a:Lv/VListCell;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    xor-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "is_selected"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "e_advanced_filter_online"

    .line 28
    .line 29
    invoke-static {v2, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/pn20;->j:Ll/hn20;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/hn20;->u0()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Ll/joa;->z3()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const-string p1, "p_home_filter,advanced"

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/pn20;->I(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/pn20;->p()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object v0, p0, Ll/pn20;->a:Lv/VListCell;

    .line 58
    .line 59
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    xor-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    filled-new-array {v0}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v2, p1, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/pn20;->a:Lv/VListCell;

    .line 81
    .line 82
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/pn20;->j:Ll/hn20;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/hn20;->A0()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pn20;->b:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 12
    .line 13
    iget-object v0, p0, Ll/pn20;->c:Lv/VListCell;

    .line 14
    .line 15
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 24
    .line 25
    iget-object v0, p0, Ll/pn20;->d:Lv/VListCell;

    .line 26
    .line 27
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 36
    .line 37
    iget-object v0, p0, Ll/pn20;->e:Lv/VListCell;

    .line 38
    .line 39
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 48
    .line 49
    iget-object p0, p0, Ll/pn20;->a:Lv/VListCell;

    .line 50
    .line 51
    invoke-static {p0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 60
    .line 61
    return-void
.end method
