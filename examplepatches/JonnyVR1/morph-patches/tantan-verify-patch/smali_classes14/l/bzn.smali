.class public Ll/bzn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/qyn;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/qyn;

.field public b:Landroidx/viewpager/widget/ViewPager;

.field public c:Lcom/google/android/material/tabs/TabLayout;

.field public d:Ll/n5o;

.field public e:Z

.field public f:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final g:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

.field public h:Ll/x20;

.field public i:Ll/x20;

.field public j:Ll/x20;


# direct methods
.method public constructor <init>(Landroidx/viewpager/widget/ViewPager;Lcom/google/android/material/tabs/TabLayout;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/bzn;->e:Z

    .line 6
    .line 7
    new-instance v0, Ll/bzn$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/bzn$a;-><init>(Ll/bzn;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/bzn;->g:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

    .line 13
    .line 14
    iput-object p1, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 15
    .line 16
    iput-object p2, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/bzn;->q()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private U(Landroid/widget/TextView;I)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/bzn;->f:Ljava/lang/String;

    .line 11
    .line 12
    new-instance p2, Ll/zyn;

    .line 13
    .line 14
    invoke-direct {p2, p1}, Ll/zyn;-><init>(Landroid/widget/TextView;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, p2}, Ll/xau;->n(Ljava/lang/String;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private Y(Lcom/google/android/material/tabs/TabLayout$Tab;Ljava/lang/String;)V
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
    invoke-virtual {p0, p2, p1}, Ll/bzn;->K(Ljava/lang/String;Z)V

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "square-intlGame"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic b(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic c(Ll/bzn;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bzn;->I(I)V

    return-void
.end method

.method public static synthetic d(Ll/bzn;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bzn;->J(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic f(Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic i(Ll/bzn;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/bzn;->G(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ll/y20;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "square-intlGame"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic k(Ll/bzn;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bzn;->H(I)V

    return-void
.end method

.method public static synthetic l(Ll/y20;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic m(Ll/bzn;)Ll/qyn;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bzn;->a:Ll/qyn;

    return-object p0
.end method

.method public static bridge synthetic n(Ll/bzn;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bzn;->L(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Ll/bzn;Lcom/google/android/material/tabs/TabLayout$Tab;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/bzn;->Y(Lcom/google/android/material/tabs/TabLayout$Tab;Ljava/lang/String;)V

    return-void
.end method

.method private q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    new-instance v1, Ll/bzn$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/bzn$b;-><init>(Ll/bzn;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static v(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "voice-live"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/j6t;->v(Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/j6t;->p(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final A(Ljava/util/List;Ljava/lang/String;)I
    .locals 3
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const-string v2, "2"

    .line 7
    .line 8
    if-le v0, v1, :cond_1

    .line 9
    .line 10
    sget-object v0, Ll/wtd;->b:Ll/jxd0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    sget-object p2, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 25
    .line 26
    const-string v0, "unknown_"

    .line 27
    .line 28
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-nez p2, :cond_0

    .line 33
    .line 34
    sget-object p2, Ll/wtd;->a:Ll/wyd0;

    .line 35
    .line 36
    const-string v0, ""

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    sget-object p2, Ll/wtd;->b:Ll/jxd0;

    .line 42
    .line 43
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :cond_0
    move-object p2, v2

    .line 49
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    move-object v2, p2

    .line 57
    :goto_0
    new-instance p2, Ll/azn;

    .line 58
    .line 59
    invoke-direct {p2, v2}, Ll/azn;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1, p2}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-gez p1, :cond_3

    .line 67
    .line 68
    iget-object p0, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    return p0

    .line 75
    :cond_3
    return p1
.end method

.method public final B(II)Z
    .locals 0

    .line 1
    and-int p0, p1, p2

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public C(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->q()V

    .line 14
    .line 15
    .line 16
    :cond_0
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

.method public E()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v0, "voice-live"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->z()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public F()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bzn;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic G(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ll/y20;)V
    .locals 6

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bzn;->A(Ljava/util/List;Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    iget-object p2, p0, Ll/bzn;->a:Ll/qyn;

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/mus;->H2()Ll/nus;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget-object p2, p2, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_9

    .line 18
    .line 19
    invoke-static {p1, p3}, Ll/x7s;->r0(Ljava/util/List;Ljava/util/List;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    iget-object p2, p0, Ll/bzn;->d:Ll/n5o;

    .line 26
    .line 27
    if-nez p2, :cond_7

    .line 28
    .line 29
    :cond_0
    iget-object p2, p0, Ll/bzn;->a:Ll/qyn;

    .line 30
    .line 31
    invoke-virtual {p2}, Ll/mus;->H2()Ll/nus;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    iget-object p2, p2, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 36
    .line 37
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Ll/y6u;->c(Landroidx/fragment/app/FragmentManager;)V

    .line 42
    .line 43
    .line 44
    new-instance v0, Ll/n5o;

    .line 45
    .line 46
    iget-object p2, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 47
    .line 48
    invoke-virtual {p2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    iget-object p2, p0, Ll/bzn;->a:Ll/qyn;

    .line 53
    .line 54
    invoke-virtual {p2}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    move-object v2, p1

    .line 59
    invoke-direct/range {v0 .. v5}, Ll/n5o;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;IILcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/bzn;->d:Ll/n5o;

    .line 63
    .line 64
    iget-object p1, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 65
    .line 66
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 74
    .line 75
    iget-object p2, p0, Ll/bzn;->d:Ll/n5o;

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 81
    .line 82
    iget-object p2, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 85
    .line 86
    .line 87
    const/4 p1, 0x0

    .line 88
    move p2, p1

    .line 89
    :goto_0
    iget-object p3, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 90
    .line 91
    invoke-virtual {p3}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 92
    .line 93
    .line 94
    move-result p3

    .line 95
    if-ge p2, p3, :cond_3

    .line 96
    .line 97
    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 102
    .line 103
    iget-object v0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 104
    .line 105
    invoke-virtual {v0, p2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p0}, Ll/bzn;->act()Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-static {v1, p3}, Ll/v9o;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    new-instance v1, Ll/xyn;

    .line 118
    .line 119
    invoke-direct {v1, p4, p2}, Ll/xyn;-><init>(Ll/y20;I)V

    .line 120
    .line 121
    .line 122
    invoke-static {p3, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    if-eqz v0, :cond_1

    .line 126
    .line 127
    invoke-virtual {v0, p3}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 128
    .line 129
    .line 130
    :cond_1
    sget v0, Ll/ldc0;->k2:I

    .line 131
    .line 132
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object p3

    .line 136
    check-cast p3, Landroid/widget/TextView;

    .line 137
    .line 138
    if-ne p2, v3, :cond_2

    .line 139
    .line 140
    sget v0, Ll/hgc0;->h:I

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_2
    sget v0, Ll/hgc0;->j:I

    .line 144
    .line 145
    :goto_1
    invoke-direct {p0, p3, v0}, Ll/bzn;->U(Landroid/widget/TextView;I)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 149
    .line 150
    .line 151
    add-int/lit8 p2, p2, 0x1

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_3
    iget-object p1, p0, Ll/bzn;->h:Ll/x20;

    .line 155
    .line 156
    if-eqz p1, :cond_4

    .line 157
    .line 158
    invoke-interface {p1}, Ll/x20;->call()V

    .line 159
    .line 160
    .line 161
    :cond_4
    iget-object p1, p0, Ll/bzn;->i:Ll/x20;

    .line 162
    .line 163
    if-eqz p1, :cond_5

    .line 164
    .line 165
    invoke-interface {p1}, Ll/x20;->call()V

    .line 166
    .line 167
    .line 168
    :cond_5
    iget-object p1, p0, Ll/bzn;->j:Ll/x20;

    .line 169
    .line 170
    if-eqz p1, :cond_6

    .line 171
    .line 172
    invoke-interface {p1}, Ll/x20;->call()V

    .line 173
    .line 174
    .line 175
    :cond_6
    invoke-virtual {p0, v2}, Ll/bzn;->N(Ljava/util/List;)V

    .line 176
    .line 177
    .line 178
    :cond_7
    iget-object p1, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 179
    .line 180
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    if-eq v3, p1, :cond_8

    .line 185
    .line 186
    iget-object p1, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 187
    .line 188
    invoke-virtual {p1, v3}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 189
    .line 190
    .line 191
    :cond_8
    invoke-virtual {p0}, Ll/bzn;->s()V

    .line 192
    .line 193
    .line 194
    const/4 p1, 0x1

    .line 195
    iput-boolean p1, p0, Ll/bzn;->e:Z

    .line 196
    .line 197
    :cond_9
    return-void
.end method

.method public final synthetic H(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic I(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bzn;->S(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic J(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bzn;->W(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v0, "square-suggested"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->H(Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final L(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/bzn;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bzn;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/mbs;->A(Lcom/p1/mobile/android/app/Act;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Ll/bzn;->v(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public M(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bzn;->g:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/google/android/material/tabs/TabLayout;->removeOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final N(Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/yyn;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/yyn;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    sget-object v1, Ll/itd0;->e:Ll/itd0;

    .line 15
    .line 16
    invoke-static {v1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/fm3;

    .line 21
    .line 22
    iget-object v1, v1, Ll/fm3;->k:Ll/jxd0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasRedDot:Z

    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 v0, 0x0

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 44
    :goto_1
    invoke-virtual {p0, v0, p1}, Ll/bzn;->R(ZLjava/util/List;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void
.end method

.method public O(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ll/y20;)V
    .locals 8
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v2, Ll/wyn;

    .line 11
    .line 12
    move-object v3, p0

    .line 13
    move-object v6, p1

    .line 14
    move-object v4, p2

    .line 15
    move-object v5, p3

    .line 16
    move-object v7, p4

    .line 17
    invoke-direct/range {v2 .. v7}, Ll/wyn;-><init>(Ll/bzn;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public P(I)V
    .locals 2

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/bzn;->a:Ll/qyn;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/tyn;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/tyn;-><init>(Ll/bzn;I)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public Q(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v0, "square-intlFollowing"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->setLiveRedDotNum(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public R(ZLjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v0, "square-intlGame"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget v0, Ll/ldc0;->m1:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    sget-object p0, Ll/itd0;->c:Ll/itd0;

    .line 22
    .line 23
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/gm3;

    .line 28
    .line 29
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/gm3;->i(Ljava/lang/Boolean;)V

    .line 34
    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    sget-object p0, Ll/itd0;->e:Ll/itd0;

    .line 39
    .line 40
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ll/fm3;

    .line 45
    .line 46
    iget-object p0, p0, Ll/fm3;->k:Ll/jxd0;

    .line 47
    .line 48
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    new-instance p0, Ll/ryn;

    .line 55
    .line 56
    invoke-direct {p0}, Ll/ryn;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {p2, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 64
    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    const/4 p1, 0x0

    .line 68
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasRedDot:Z

    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method

.method public S(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

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
    new-instance v0, Ll/syn;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Ll/syn;-><init>(Ll/bzn;I)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/bzn;->i:Ll/x20;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Ll/bzn;->i:Ll/x20;

    .line 21
    .line 22
    instance-of p0, v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->setLiveRedDotNum(I)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public final T(II)I
    .locals 0

    .line 1
    or-int p0, p1, p2

    .line 2
    .line 3
    return p0
.end method

.method public V(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/bzn;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public W(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v1, "voice-live"

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
    new-instance v0, Ll/uyn;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1, p2}, Ll/uyn;-><init>(Ll/bzn;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/bzn;->h:Ll/x20;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Ll/bzn;->h:Ll/x20;

    .line 21
    .line 22
    instance-of p0, v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 27
    .line 28
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public X(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ll/vyn;

    .line 11
    .line 12
    invoke-direct {v0, p2}, Ll/vyn;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-ltz p1, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public Z(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v0, "voice-live"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->P(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bzn;->a:Ll/qyn;

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
    check-cast p1, Ll/qyn;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bzn;->u(Ll/qyn;)V

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

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bzn;->g:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    sget v1, Ll/l9c0;->n:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabRippleColorResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 16
    .line 17
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bzn;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->w8(Lcom/p1/mobile/android/app/Act;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/bzn;->z()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sget-object v1, Ll/tbs;->f:Ll/j6t;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/bzn;->a:Ll/qyn;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/qyn;->n3(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "voice-live"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/4 v0, 0x0

    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/j6t;->v(Z)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ll/j6t;->p(Z)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public u(Ll/qyn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bzn;->a:Ll/qyn;

    .line 2
    .line 3
    return-void
.end method

.method public final w(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->getTabID()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string p0, ""

    .line 19
    .line 20
    return-object p0
.end method

.method public x()Ljava/lang/String;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v1, v2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    move v3, v2

    .line 21
    :goto_0
    if-ge v2, v0, :cond_1

    .line 22
    .line 23
    iget-object v4, p0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 24
    .line 25
    invoke-virtual {v4, v2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    if-eqz v4, :cond_0

    .line 30
    .line 31
    invoke-virtual {v4}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    instance-of v5, v4, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 36
    .line 37
    if-eqz v5, :cond_0

    .line 38
    .line 39
    check-cast v4, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;

    .line 40
    .line 41
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->B()Z

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    if-eqz v5, :cond_0

    .line 46
    .line 47
    iget v4, v4, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->i:I

    .line 48
    .line 49
    invoke-virtual {p0, v3, v4}, Ll/bzn;->T(II)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const-string v1, "square-suggested"

    .line 61
    .line 62
    const-string v2, "voice-live"

    .line 63
    .line 64
    const/4 v4, 0x2

    .line 65
    const/4 v5, 0x1

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0, v3, v4}, Ll/bzn;->B(II)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    invoke-virtual {p0, v2}, Ll/bzn;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_2
    invoke-virtual {p0, v3, v5}, Ll/bzn;->B(II)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_5

    .line 84
    .line 85
    invoke-virtual {p0, v1}, Ll/bzn;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0

    .line 90
    :cond_3
    invoke-virtual {p0, v3, v5}, Ll/bzn;->B(II)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    invoke-virtual {p0, v1}, Ll/bzn;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0

    .line 101
    :cond_4
    invoke-virtual {p0, v3, v4}, Ll/bzn;->B(II)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_5

    .line 106
    .line 107
    invoke-virtual {p0, v2}, Ll/bzn;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_5
    const-string p0, ""

    .line 113
    .line 114
    return-object p0
.end method

.method public y()Lcom/p1/mobile/android/app/Frag;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bzn;->d:Ll/n5o;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v2, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    if-eqz v2, :cond_2

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/n5o;->getCount()I

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
    iget-object v0, p0, Ll/bzn;->d:Ll/n5o;

    .line 19
    .line 20
    iget-object p0, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

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
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A5()Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    :cond_1
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_2
    return-object v1
.end method

.method public z()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
