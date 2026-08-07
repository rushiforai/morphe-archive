.class public Ll/iqo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/eqo;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VScroll;

.field public e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

.field public f:Lv/VText;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

.field public i:Lv/VListCell;

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Ll/eqo;

.field public l:Ll/xi40;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iqo;->j:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/iqo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iqo;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/iqo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iqo;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/iqo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iqo;->p(Landroid/view/View;)V

    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iqo;->k:Ll/eqo;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eqo;->D()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iqo;->k:Ll/eqo;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eqo;->Q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/iqo;->i:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/joa;->f4()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/joa;->k4()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "p_intl_swipe_setting,e_intl_show_verified_switch,click"

    .line 34
    .line 35
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    .line 37
    invoke-interface {p1, p0, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object p1, p0, Ll/iqo;->i:Lv/VListCell;

    .line 42
    .line 43
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    const-string p1, "e_intl_show_verified_switch"

    .line 50
    .line 51
    const-string v0, "p_intl_swipe_setting"

    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object p0, p0, Ll/iqo;->i:Lv/VListCell;

    .line 57
    .line 58
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private r()V
    .locals 3

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
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ve(Lcom/p1/mobile/putong/data/User;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Ll/iqo;->f:Lv/VText;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v2, Ll/kbc0;->S1:I

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v1, v0}, Ll/yra;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget v2, Ll/kbc0;->R1:I

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v1, v0}, Ll/yra;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 56
    .line 57
    .line 58
    :goto_0
    iget-object v0, p0, Ll/iqo;->a:Lv/VImage;

    .line 59
    .line 60
    new-instance v1, Ll/fqo;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/fqo;-><init>(Ll/iqo;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/iqo;->c:Lv/VText;

    .line 69
    .line 70
    new-instance v1, Ll/gqo;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/gqo;-><init>(Ll/iqo;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/iqo;->l()V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/iqo;->i:Lv/VListCell;

    .line 82
    .line 83
    new-instance v1, Ll/hqo;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/hqo;-><init>(Ll/iqo;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iqo;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jqo;->b(Ll/iqo;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iqo;->e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->Z(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Ll/eqo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/iqo;->k:Ll/eqo;

    .line 2
    .line 3
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iqo;->e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->c0(Lcom/p1/mobile/putong/data/Settings;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/eqo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/iqo;->f(Ll/eqo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/iqo;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/iqo;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/iqo;->i:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

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
    iget-object v0, p0, Ll/iqo;->l:Ll/xi40;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/o1i0;->g()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/iqo;->l:Ll/xi40;

    .line 18
    .line 19
    iget-object v0, v0, Ll/xi40;->g:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ll/qi40;

    .line 36
    .line 37
    iget-object v2, v1, Ll/qi40;->d:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    iget-object v2, p0, Ll/iqo;->l:Ll/xi40;

    .line 48
    .line 49
    invoke-virtual {v2, v1}, Ll/o1i0;->o(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iqo;->e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 2
    .line 3
    iget-object p0, p0, Ll/iqo;->j:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->k0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    new-instance v0, Ll/xi40;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xi40;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/iqo;->l:Ll/xi40;

    .line 7
    .line 8
    new-instance v1, Ll/iqo$a;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/iqo$a;-><init>(Ll/iqo;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/o1i0;->m(Ll/qcj;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/iqo;->l:Ll/xi40;

    .line 17
    .line 18
    new-instance v1, Ll/iqo$b;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/iqo$b;-><init>(Ll/iqo;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/o1i0;->n(Ll/y20;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/iqo;->h:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->setCanAdjustChildHeight(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/iqo;->h:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 33
    .line 34
    iget-object v1, p0, Ll/iqo;->l:Ll/xi40;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->setAdapter(Ll/j1i0;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/iqo;->l:Ll/xi40;

    .line 40
    .line 41
    sget-object v0, Ll/xve0;->i:[Ll/qi40;

    .line 42
    .line 43
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/xi40;->r(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iqo;->l:Ll/xi40;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/o1i0;->i()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;->getBindViewData()Ll/qi40;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Ll/qi40;->d:Ljava/lang/String;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v0, ""

    .line 19
    .line 20
    :goto_0
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p0, p0, Ll/iqo;->i:Lv/VListCell;

    .line 23
    .line 24
    invoke-static {p0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 33
    .line 34
    return-void
.end method

.method public s(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iqo;->e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->g:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public u(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iqo;->e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->m0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
