.class public Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;
.super Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;
.source "SourceFile"


# instance fields
.field public B:Lv/VFrame;

.field public C:Lcom/google/android/material/tabs/TabLayout;

.field public D:Lv/VPager;

.field public E:[Ljava/lang/String;

.field public F:Landroidx/fragment/app/Fragment;

.field public G:Landroidx/fragment/app/Fragment;

.field public H:Lv/VImage;

.field public I:Ll/v3e;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/core/R$string;->zq:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 13
    .line 14
    sget v2, Lcom/p1/mobile/putong/core/R$string;->nj:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->E:[Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->f5(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->e5(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/CouterMoments;->unreadFeeds:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->d5(ILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic Z4(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->H:Lv/VImage;

    return-object p0
.end method

.method private synthetic e5(Landroid/os/Bundle;)V
    .locals 2

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->D:Lv/VPager;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, "bundle_show_position"

    .line 16
    .line 17
    const/4 v1, -0x1

    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->D:Lv/VPager;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private synthetic f5(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->H:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/u3e;->b(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b5(Ljava/lang/String;I)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->gf:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/adc0;->Ke:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lv/VText;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    if-ne p2, v2, :cond_0

    .line 22
    .line 23
    sget v2, Ll/adc0;->g3:I

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lv/VImage;

    .line 30
    .line 31
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->H:Lv/VImage;

    .line 32
    .line 33
    :cond_0
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Ll/q3e;

    .line 37
    .line 38
    invoke-direct {p1, p0, p2}, Ll/q3e;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;I)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    return-object v0
.end method

.method public c5()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->F:Landroidx/fragment/app/Fragment;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ik()Landroidx/fragment/app/Fragment;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->G:Landroidx/fragment/app/Fragment;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->F:Landroidx/fragment/app/Fragment;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->G:Landroidx/fragment/app/Fragment;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/v3e;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-direct {v1, v2, v0}, Ll/v3e;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->I:Ll/v3e;

    .line 43
    .line 44
    return-void
.end method

.method public final synthetic d5(ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->g5(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 5
    .line 6
    invoke-static {v0}, Ll/ji30;->g(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/r3e;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/r3e;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/s3e;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/s3e;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/t3e;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/t3e;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->B:Lv/VFrame;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    new-array v0, v0, [Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aput-object p1, v0, v1

    .line 11
    .line 12
    invoke-static {v0}, Ll/bnl0;->g0([Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->c5()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->D:Lv/VPager;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->I:Ll/v3e;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->C:Lcom/google/android/material/tabs/TabLayout;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->D:Lv/VPager;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->C:Lcom/google/android/material/tabs/TabLayout;

    .line 33
    .line 34
    new-instance v0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag$a;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag$a;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->h5()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final g5(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->D:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->D:Lv/VPager;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->D:Lv/VPager;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final h5()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->C:Lcom/google/android/material/tabs/TabLayout;

    .line 3
    .line 4
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->C:Lcom/google/android/material/tabs/TabLayout;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->E:[Ljava/lang/String;

    .line 17
    .line 18
    aget-object v2, v2, v0

    .line 19
    .line 20
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->b5(Ljava/lang/String;I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 25
    .line 26
    .line 27
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->a5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryHomeFrag;->G:Landroidx/fragment/app/Fragment;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_explore_view"

    .line 2
    .line 3
    return-object p0
.end method
