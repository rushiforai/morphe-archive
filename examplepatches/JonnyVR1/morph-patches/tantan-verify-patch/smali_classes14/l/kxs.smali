.class public Ll/kxs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bws;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/bws;

.field public b:Landroidx/viewpager/widget/ViewPager;

.field public c:Lcom/google/android/material/tabs/TabLayout;

.field public d:Ll/n2u;

.field public e:Z

.field public final f:Landroid/view/View;

.field public g:I

.field public final h:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

.field public i:Ll/x20;

.field public j:Ll/x20;

.field public k:I


# direct methods
.method public constructor <init>(Landroidx/viewpager/widget/ViewPager;Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/kxs;->e:Z

    .line 6
    .line 7
    new-instance v0, Ll/kxs$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/kxs$a;-><init>(Ll/kxs;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/kxs;->h:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

    .line 13
    .line 14
    iput-object p1, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 15
    .line 16
    iput-object p2, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 17
    .line 18
    iput-object p3, p0, Ll/kxs;->f:Landroid/view/View;

    .line 19
    .line 20
    return-void
.end method

.method private B(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/sft;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "tooltips_type_ui"

    .line 6
    .line 7
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "e_red_dot_live_icon"

    .line 16
    .line 17
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private C(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/sft;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "tooltips_type_ui"

    .line 6
    .line 7
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "e_red_dot_live_icon"

    .line 16
    .line 17
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private H(Landroid/widget/TextView;I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private I(Ljava/util/List;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;I)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 3
    .line 4
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_4

    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 15
    .line 16
    iget-object v2, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 17
    .line 18
    invoke-virtual {v2, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {p0}, Ll/kxs;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-static {v3, v1}, Ll/kxs;->w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v3, Ll/jxs;

    .line 31
    .line 32
    invoke-direct {v3, p0, v0}, Ll/jxs;-><init>(Ll/kxs;I)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 41
    .line 42
    .line 43
    :cond_0
    sget v2, Ll/ldc0;->k2:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Landroid/widget/TextView;

    .line 50
    .line 51
    if-ne v0, p2, :cond_1

    .line 52
    .line 53
    sget v3, Ll/hgc0;->i:I

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    sget v3, Ll/hgc0;->k:I

    .line 57
    .line 58
    :goto_1
    invoke-direct {p0, v2, v3}, Ll/kxs;->H(Landroid/widget/TextView;I)V

    .line 59
    .line 60
    .line 61
    iget-object v3, p0, Ll/kxs;->a:Ll/bws;

    .line 62
    .line 63
    iget v3, v3, Ll/bws;->i:I

    .line 64
    .line 65
    if-ne p2, v3, :cond_2

    .line 66
    .line 67
    if-eq v0, p2, :cond_2

    .line 68
    .line 69
    const-string v3, "#B2FFFFFF"

    .line 70
    .line 71
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    :cond_2
    if-ne v0, p2, :cond_3

    .line 79
    .line 80
    sget v2, Ll/nbc0;->m:I

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_3
    sget v2, Ll/nbc0;->D1:I

    .line 84
    .line 85
    :goto_2
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 86
    .line 87
    .line 88
    add-int/lit8 v0, v0, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_4
    return-void
.end method

.method private L(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/kxs;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-direct {p0, p2, p3}, Ll/kxs;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p2, p3}, Ll/kxs;->B(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private M(Lcom/google/android/material/tabs/TabLayout$Tab;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "square-suggested"

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const-string v1, "p_audio_explore_recommend"

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string p1, "e_live_top_tab"

    .line 26
    .line 27
    invoke-static {p1, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, p2, p1}, Ll/kxs;->A(Ljava/lang/String;Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p0, "square-multi-call"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    const-string p0, "e_video_room_top_tab"

    .line 44
    .line 45
    invoke-static {p0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getTabId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "2"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getTabId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c(Ll/kxs;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/kxs;->z(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/kxs;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kxs;->y(Z)V

    return-void
.end method

.method public static synthetic e(Ll/kxs;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kxs;->x(I)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/y6u;->l(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static bridge synthetic i(Ll/kxs;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/kxs;->g:I

    return p0
.end method

.method public static bridge synthetic j(Ll/kxs;)Ll/bws;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kxs;->a:Ll/bws;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/kxs;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kxs;->f:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/kxs;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/kxs;->g:I

    return-void
.end method

.method public static bridge synthetic m(Ll/kxs;Lcom/google/android/material/tabs/TabLayout$Tab;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/kxs;->M(Lcom/google/android/material/tabs/TabLayout$Tab;Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Ll/kxs;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kxs;->N()V

    return-void
.end method

.method public static w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Landroid/view/View;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/xec0;->s:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    sget v0, Ll/ldc0;->k2:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lv/VText;

    .line 26
    .line 27
    sget v1, Ll/ldc0;->m1:I

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 38
    .line 39
    const/high16 v3, -0x3e900000    # -15.0f

    .line 40
    .line 41
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 46
    .line 47
    const/high16 v3, 0x40000000    # 2.0f

    .line 48
    .line 49
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 54
    .line 55
    const/high16 v3, 0x41300000    # 11.0f

    .line 56
    .line 57
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    iput v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 62
    .line 63
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    .line 71
    .line 72
    const/high16 v1, 0x41400000    # 12.0f

    .line 73
    .line 74
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    const/4 v3, 0x0

    .line 79
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-virtual {v0, v2, v3, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    return-object p0
.end method

.method private synthetic x(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kxs;->F(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic y(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kxs;->G(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic z(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v1, "square-suggested"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget v1, Ll/ldc0;->n1:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/TextView;

    .line 18
    .line 19
    sget v2, Ll/ldc0;->m1:I

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    const-string v0, "red_dot_figure"

    .line 34
    .line 35
    invoke-direct {p0, p2, v0, p1}, Ll/kxs;->L(ZLjava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    const-string v0, "red_dot_normal"

    .line 48
    .line 49
    invoke-direct {p0, p2, v0, p1}, Ll/kxs;->L(ZLjava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public E(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    iget-object v0, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    new-instance v0, Ll/pxs;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/pxs;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    sget-object v1, Ll/itd0;->d:Ll/itd0;

    .line 21
    .line 22
    invoke-static {v1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/bk3;

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ll/bk3;->c(Ljava/util/List;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 35
    .line 36
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/gm3;

    .line 41
    .line 42
    iget-object v0, v0, Ll/gm3;->i:Lrx/subjects/a;

    .line 43
    .line 44
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Ll/ixs;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/ixs;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    sget-object v1, Ll/itd0;->c:Ll/itd0;

    .line 60
    .line 61
    invoke-static {v1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ll/gm3;

    .line 66
    .line 67
    iget-object v1, v1, Ll/gm3;->i:Lrx/subjects/a;

    .line 68
    .line 69
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    iget-object v1, p0, Ll/kxs;->a:Ll/bws;

    .line 75
    .line 76
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object v1, v1, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 81
    .line 82
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_4

    .line 87
    .line 88
    iget-object v1, p0, Ll/kxs;->d:Ll/n2u;

    .line 89
    .line 90
    if-nez v1, :cond_2

    .line 91
    .line 92
    iget-object v1, p0, Ll/kxs;->a:Ll/bws;

    .line 93
    .line 94
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget-object v1, v1, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 99
    .line 100
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-static {v1}, Ll/y6u;->c(Landroidx/fragment/app/FragmentManager;)V

    .line 105
    .line 106
    .line 107
    new-instance v2, Ll/n2u;

    .line 108
    .line 109
    iget-object v3, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 110
    .line 111
    invoke-virtual {v3}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    iget-object v4, p0, Ll/kxs;->a:Ll/bws;

    .line 116
    .line 117
    invoke-virtual {v4}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-direct {v2, v1, v0, v3, v4}, Ll/n2u;-><init>(Landroidx/fragment/app/FragmentManager;IILcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 122
    .line 123
    .line 124
    iput-object v2, p0, Ll/kxs;->d:Ll/n2u;

    .line 125
    .line 126
    :cond_2
    iget-object v1, p0, Ll/kxs;->d:Ll/n2u;

    .line 127
    .line 128
    invoke-virtual {v1, p1}, Ll/n2u;->m(Ljava/util/List;)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 132
    .line 133
    iget-object v2, p0, Ll/kxs;->d:Ll/n2u;

    .line 134
    .line 135
    invoke-virtual {v1, v2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Ll/kxs;->i:Ll/x20;

    .line 139
    .line 140
    if-eqz v1, :cond_3

    .line 141
    .line 142
    invoke-interface {v1}, Ll/x20;->call()V

    .line 143
    .line 144
    .line 145
    :cond_3
    iput v0, p0, Ll/kxs;->k:I

    .line 146
    .line 147
    :cond_4
    iget-object v0, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 148
    .line 149
    iget-object v1, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 152
    .line 153
    .line 154
    iget v0, p0, Ll/kxs;->k:I

    .line 155
    .line 156
    invoke-direct {p0, p1, v0}, Ll/kxs;->I(Ljava/util/List;I)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 160
    .line 161
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 166
    .line 167
    .line 168
    iget p1, p0, Ll/kxs;->k:I

    .line 169
    .line 170
    iget-object v0, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 171
    .line 172
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eq p1, v0, :cond_5

    .line 177
    .line 178
    iget-object p1, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 179
    .line 180
    iget v0, p0, Ll/kxs;->k:I

    .line 181
    .line 182
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 183
    .line 184
    .line 185
    :cond_5
    invoke-virtual {p0}, Ll/kxs;->p()V

    .line 186
    .line 187
    .line 188
    const/4 p1, 0x1

    .line 189
    iput-boolean p1, p0, Ll/kxs;->e:Z

    .line 190
    .line 191
    iget-object p1, p0, Ll/kxs;->j:Ll/x20;

    .line 192
    .line 193
    if-eqz p1, :cond_6

    .line 194
    .line 195
    invoke-interface {p1}, Ll/x20;->call()V

    .line 196
    .line 197
    .line 198
    :cond_6
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-virtual {p1}, Ll/ppi0;->x()Z

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    if-eqz p1, :cond_7

    .line 207
    .line 208
    iget-object p0, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 209
    .line 210
    const/4 p1, 0x0

    .line 211
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    :cond_7
    :goto_1
    return-void
.end method

.method public F(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v1, "square-suggested"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/exs;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Ll/exs;-><init>(Ll/kxs;I)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/kxs;->i:Ll/x20;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Ll/kxs;->i:Ll/x20;

    .line 21
    .line 22
    sget p0, Ll/ldc0;->n1:I

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Landroid/widget/TextView;

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    if-lez p1, :cond_1

    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 p1, 0x0

    .line 42
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public G(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v1, "p_live_curated_recommend"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/hxs;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Ll/hxs;-><init>(Ll/kxs;Z)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/kxs;->j:Ll/x20;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Ll/kxs;->j:Ll/x20;

    .line 21
    .line 22
    sget p0, Ll/ldc0;->m1:I

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public J(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Ll/kxs;->f:Landroid/view/View;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/bnl0;->y0()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    int-to-float p1, p1

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public K(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ll/fxs;

    .line 11
    .line 12
    invoke-direct {v0, p2}, Ll/fxs;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-ltz p2, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    new-instance p2, Ll/gxs;

    .line 28
    .line 29
    invoke-direct {p2}, Ll/gxs;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, p2}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-ltz p1, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_0
    return-void
.end method

.method public final N()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    iget-object v3, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 5
    .line 6
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    if-ge v1, v3, :cond_3

    .line 11
    .line 12
    iget-object v3, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 13
    .line 14
    invoke-virtual {v3, v1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    iget-object v4, v3, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 19
    .line 20
    sget v5, Ll/ldc0;->k2:I

    .line 21
    .line 22
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    check-cast v4, Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout$Tab;->isSelected()Z

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-eqz v5, :cond_1

    .line 33
    .line 34
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iget-object v5, p0, Ll/kxs;->a:Ll/bws;

    .line 39
    .line 40
    iget v5, v5, Ll/bws;->i:I

    .line 41
    .line 42
    if-ne v2, v5, :cond_0

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    move v2, v0

    .line 47
    :goto_1
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eqz v5, :cond_2

    .line 52
    .line 53
    sget v5, Ll/ggc0;->h:I

    .line 54
    .line 55
    invoke-static {v4, v5}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    sget v4, Ll/nbc0;->m:I

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 65
    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_1
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_2

    .line 73
    .line 74
    sget v5, Ll/ggc0;->j:I

    .line 75
    .line 76
    invoke-static {v4, v5}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    sget v5, Ll/nbc0;->D1:I

    .line 84
    .line 85
    invoke-virtual {v3, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 86
    .line 87
    .line 88
    if-eqz v2, :cond_2

    .line 89
    .line 90
    const-string v3, "#B2FFFFFF"

    .line 91
    .line 92
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 97
    .line 98
    .line 99
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kxs;->a:Ll/bws;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bws;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kxs;->q(Ll/bws;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public p()V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Ll/bws;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kxs;->a:Ll/bws;

    .line 2
    .line 3
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/kxs;->h:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    sget v1, Ll/l9c0;->n:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabRippleColorResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 16
    .line 17
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 27
    .line 28
    new-instance v1, Ll/kxs$b;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/kxs$b;-><init>(Ll/kxs;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public s()Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kxs;->d:Ll/n2u;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v2, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    if-eqz v2, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/n2u;->getCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-ge v0, v2, :cond_0

    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_0
    iget-object v0, p0, Ll/kxs;->d:Ll/n2u;

    .line 19
    .line 20
    iget-object p0, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {v0, p0}, Ll/bvu;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    return-object v1
.end method

.method public u(I)Lcom/p1/mobile/android/app/Frag;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kxs;->d:Ll/n2u;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v2, p0, Ll/kxs;->b:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    if-eqz v2, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/n2u;->getCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lt p1, v0, :cond_0

    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_0
    iget-object p0, p0, Ll/kxs;->d:Ll/n2u;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/bvu;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    instance-of p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    return-object v1
.end method

.method public v(I)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kxs;->d:Ll/n2u;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n2u;->l()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-ltz p1, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ge p1, v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const-string p0, "NA"

    .line 27
    .line 28
    return-object p0
.end method
