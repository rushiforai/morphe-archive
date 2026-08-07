.class public Ll/hq30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/czl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hq30$b;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VPager;

.field public c:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Landroid/view/View;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/widget/TextView;

.field public j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

.field public k:Ll/hq30$b;

.field public l:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "daily_picks_entrance"

    .line 10
    .line 11
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->qa(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "from_meet"

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct;->Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "meet_see"

    .line 2
    .line 3
    const-string v0, "high_pop_level"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_meet_see_total"

    .line 14
    .line 15
    const-string v1, "p_meet"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 39
    .line 40
    iget p1, p1, Lcom/p1/mobile/putong/data/LikersLimit;->remaining:I

    .line 41
    .line 42
    if-lez p1, :cond_0

    .line 43
    .line 44
    const-string p1, "from_meet"

    .line 45
    .line 46
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v0, "p_meet_view,e_see_banner_highpopsee,click"

    .line 63
    .line 64
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic f(Ll/hq30;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hq30;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ll/hq30;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hq30;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vf()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/NewMyLikedUsersAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance p1, Landroid/content/Intent;

    .line 21
    .line 22
    const-class v0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUsersAct;

    .line 23
    .line 24
    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "meet_see"

    .line 2
    .line 3
    const-string v0, "high_pop_level"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_meet_see_total"

    .line 14
    .line 15
    const-string v1, "p_meet"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 39
    .line 40
    iget p1, p1, Lcom/p1/mobile/putong/data/LikersLimit;->remaining:I

    .line 41
    .line 42
    if-lez p1, :cond_0

    .line 43
    .line 44
    const-string p1, "from_meet"

    .line 45
    .line 46
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v0, "p_meet_view,e_see_banner_highpopsee,click"

    .line 63
    .line 64
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static bridge synthetic j(Ll/hq30;)Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    return-object p0
.end method

.method private l()V
    .locals 2

    .line 1
    new-instance v0, Ll/hq30$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hq30$b;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/hq30;->k:Ll/hq30$b;

    .line 7
    .line 8
    iget-object v1, p0, Ll/hq30;->b:Lv/VPager;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/hq30;->b:Lv/VPager;

    .line 14
    .line 15
    new-instance v1, Ll/hq30$a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/hq30$a;-><init>(Ll/hq30;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/hq30;->b:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/high16 p1, -0x40400000    # -1.5f

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/hq30;->o(F)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 16
    .line 17
    iget-object p0, p0, Ll/hq30;->b:Lv/VPager;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/hq30;->b:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/hq30;->k:Ll/hq30$b;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/hq30$b;->getCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    if-ne p1, v0, :cond_0

    .line 16
    .line 17
    const/high16 p1, 0x3fc00000    # 1.5f

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ll/hq30;->o(F)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 24
    .line 25
    iget-object p0, p0, Ll/hq30;->b:Lv/VPager;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private o(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hq30;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hq30;->b:Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    const/high16 v2, 0x40000000    # 2.0f

    .line 11
    .line 12
    div-float/2addr v1, v2

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/hq30;->a:Landroid/widget/RelativeLayout;

    .line 17
    .line 18
    iget-object v1, p0, Ll/hq30;->b:Lv/VPager;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-float v1, v1

    .line 25
    div-float/2addr v1, v2

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/hq30;->b:Lv/VPager;

    .line 30
    .line 31
    sget-object v0, Landroid/view/View;->ROTATION_Y:Landroid/util/Property;

    .line 32
    .line 33
    const/4 v1, 0x3

    .line 34
    new-array v1, v1, [F

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    const/4 v3, 0x0

    .line 38
    aput v3, v1, v2

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    aput p1, v1, v2

    .line 42
    .line 43
    const/4 p1, 0x2

    .line 44
    aput v3, v1, p1

    .line 45
    .line 46
    invoke-static {p0, v0, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-wide/16 v0, 0xc8

    .line 51
    .line 52
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    iput-object p2, p0, Ll/hq30;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 4
    .line 5
    iput-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 6
    .line 7
    iget-object v0, p0, Ll/hq30;->c:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/hq30;->c:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 21
    .line 22
    iget-object v0, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x0

    .line 33
    const/4 v2, 0x1

    .line 34
    if-le v0, v2, :cond_0

    .line 35
    .line 36
    move v0, v2

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    move v0, v1

    .line 39
    :goto_0
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeePortraitUser()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    :cond_1
    move p1, v1

    .line 65
    goto :goto_1

    .line 66
    :cond_2
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isLowSeeSingleUser()Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_1

    .line 87
    .line 88
    move p1, v2

    .line 89
    :goto_1
    iget-object v0, p0, Ll/hq30;->b:Lv/VPager;

    .line 90
    .line 91
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Ll/hq30$b;

    .line 96
    .line 97
    iget-object v3, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 98
    .line 99
    iget-object v3, v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 102
    .line 103
    invoke-virtual {v0, v3, p1}, Ll/hq30$b;->q(Ljava/util/List;Z)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ll/hq30;->b:Lv/VPager;

    .line 107
    .line 108
    iget-object v0, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 109
    .line 110
    iget v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;->picIndex:I

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/hq30;->f:Landroid/view/View;

    .line 116
    .line 117
    new-instance v0, Ll/aq30;

    .line 118
    .line 119
    invoke-direct {v0, p0}, Ll/aq30;-><init>(Ll/hq30;)V

    .line 120
    .line 121
    .line 122
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Ll/hq30;->g:Landroid/view/View;

    .line 126
    .line 127
    new-instance v0, Ll/bq30;

    .line 128
    .line 129
    invoke-direct {v0, p0}, Ll/bq30;-><init>(Ll/hq30;)V

    .line 130
    .line 131
    .line 132
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 136
    .line 137
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 141
    .line 142
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 148
    .line 149
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 150
    .line 151
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 152
    .line 153
    const-string v0, "highSeeUser"

    .line 154
    .line 155
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/FeedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FeedType;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    const-string v3, "\u559c\u6b22\u6211\u7684\u4eba \u00b7 TA\u559c\u6b22\u4e86\u6211\uff1f\u53f3\u6ed1\u7acb\u5373\u914d\u5bf9"

    .line 160
    .line 161
    if-eq p1, v0, :cond_a

    .line 162
    .line 163
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 164
    .line 165
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 166
    .line 167
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 168
    .line 169
    const-string v0, "lowSeeUser"

    .line 170
    .line 171
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/FeedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FeedType;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    if-eq p1, v0, :cond_a

    .line 176
    .line 177
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 178
    .line 179
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 180
    .line 181
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 182
    .line 183
    sget-object v0, Lcom/p1/mobile/putong/core/api/s;->Companion:Lcom/p1/mobile/putong/core/api/s$a;

    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/s$a;->a()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-eqz p1, :cond_3

    .line 194
    .line 195
    goto/16 :goto_4

    .line 196
    .line 197
    :cond_3
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 198
    .line 199
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 200
    .line 201
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 202
    .line 203
    const-string v0, "pickUser"

    .line 204
    .line 205
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/FeedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FeedType;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    if-ne p1, v0, :cond_7

    .line 210
    .line 211
    iget-object p1, p0, Ll/hq30;->h:Landroid/widget/LinearLayout;

    .line 212
    .line 213
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Ll/hq30;->i:Landroid/widget/TextView;

    .line 217
    .line 218
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    sget v1, Ll/gbc0;->D0:I

    .line 223
    .line 224
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-static {p1, v0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 229
    .line 230
    .line 231
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Lc()Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    if-eqz p1, :cond_5

    .line 244
    .line 245
    invoke-static {}, Ll/c17;->u0()Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    iget-object v0, p0, Ll/hq30;->i:Landroid/widget/TextView;

    .line 250
    .line 251
    if-eqz p1, :cond_4

    .line 252
    .line 253
    const-string p1, "\u6bcf\u65e5\u7cbe\u9009 \u00b7 \u8ba4\u8bc6\u66f4\u591a\u4f18\u8d28\u7537\u6027"

    .line 254
    .line 255
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    .line 257
    .line 258
    goto :goto_2

    .line 259
    :cond_4
    const-string p1, "\u6bcf\u65e5\u7cbe\u9009 \u00b7 \u8ba4\u8bc6\u66f4\u591a\u4f18\u8d28\u5973\u6027"

    .line 260
    .line 261
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    .line 263
    .line 264
    :goto_2
    iget-object p0, p0, Ll/hq30;->h:Landroid/widget/LinearLayout;

    .line 265
    .line 266
    new-instance p1, Ll/dq30;

    .line 267
    .line 268
    invoke-direct {p1, p2}, Ll/dq30;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 269
    .line 270
    .line 271
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 272
    .line 273
    .line 274
    return-void

    .line 275
    :cond_5
    invoke-static {}, Ll/c17;->u0()Z

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    iget-object v0, p0, Ll/hq30;->i:Landroid/widget/TextView;

    .line 280
    .line 281
    if-eqz p1, :cond_6

    .line 282
    .line 283
    const-string p1, "\u6bcf\u65e5\u5fc3\u52a8 \u00b7 \u53d1\u73b0\u4f60\u7684\u5fc3\u52a8\u7537\u5b69"

    .line 284
    .line 285
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 286
    .line 287
    .line 288
    goto :goto_3

    .line 289
    :cond_6
    const-string p1, "\u6bcf\u65e5\u5fc3\u52a8 \u00b7 \u53d1\u73b0\u4f60\u7684\u5fc3\u52a8\u5973\u5b69"

    .line 290
    .line 291
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    .line 293
    .line 294
    :goto_3
    iget-object p0, p0, Ll/hq30;->h:Landroid/widget/LinearLayout;

    .line 295
    .line 296
    new-instance p1, Ll/eq30;

    .line 297
    .line 298
    invoke-direct {p1, p2}, Ll/eq30;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 299
    .line 300
    .line 301
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 302
    .line 303
    .line 304
    return-void

    .line 305
    :cond_7
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 306
    .line 307
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 308
    .line 309
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 310
    .line 311
    const-string v0, "likedUser"

    .line 312
    .line 313
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/FeedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FeedType;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    if-ne p1, v0, :cond_8

    .line 318
    .line 319
    iget-object p1, p0, Ll/hq30;->h:Landroid/widget/LinearLayout;

    .line 320
    .line 321
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 322
    .line 323
    .line 324
    iget-object p1, p0, Ll/hq30;->i:Landroid/widget/TextView;

    .line 325
    .line 326
    const-string v0, "\u6211\u559c\u6b22\u7684\u4eba"

    .line 327
    .line 328
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 329
    .line 330
    .line 331
    iget-object p1, p0, Ll/hq30;->i:Landroid/widget/TextView;

    .line 332
    .line 333
    const/4 v0, 0x0

    .line 334
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 335
    .line 336
    .line 337
    iget-object p0, p0, Ll/hq30;->h:Landroid/widget/LinearLayout;

    .line 338
    .line 339
    new-instance p1, Ll/fq30;

    .line 340
    .line 341
    invoke-direct {p1, p2}, Ll/fq30;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 342
    .line 343
    .line 344
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 345
    .line 346
    .line 347
    return-void

    .line 348
    :cond_8
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 349
    .line 350
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 351
    .line 352
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 353
    .line 354
    const-string v0, "seePortraitUser"

    .line 355
    .line 356
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/FeedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FeedType;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    if-ne p1, v0, :cond_9

    .line 361
    .line 362
    iget-object p1, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 363
    .line 364
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 365
    .line 366
    .line 367
    iget-object p1, p0, Ll/hq30;->h:Landroid/widget/LinearLayout;

    .line 368
    .line 369
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 370
    .line 371
    .line 372
    iget-object p1, p0, Ll/hq30;->i:Landroid/widget/TextView;

    .line 373
    .line 374
    sget v0, Ll/gbc0;->E0:I

    .line 375
    .line 376
    invoke-virtual {p2, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-static {p1, v0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 381
    .line 382
    .line 383
    iget-object p1, p0, Ll/hq30;->i:Landroid/widget/TextView;

    .line 384
    .line 385
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 386
    .line 387
    .line 388
    iget-object p1, p0, Ll/hq30;->h:Landroid/widget/LinearLayout;

    .line 389
    .line 390
    new-instance v0, Ll/gq30;

    .line 391
    .line 392
    invoke-direct {v0, p2}, Ll/gq30;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 393
    .line 394
    .line 395
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 396
    .line 397
    .line 398
    iget-object p1, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 399
    .line 400
    sget v0, Ll/gbc0;->i:I

    .line 401
    .line 402
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 403
    .line 404
    .line 405
    move-result-object v0

    .line 406
    invoke-static {p1, v0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 407
    .line 408
    .line 409
    iget-object p1, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 410
    .line 411
    sget v0, Ll/gbc0;->b2:I

    .line 412
    .line 413
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 414
    .line 415
    .line 416
    move-result-object p2

    .line 417
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 418
    .line 419
    .line 420
    iget-object p0, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 421
    .line 422
    const-string p1, "\u5373\u523b\u804a\u5929"

    .line 423
    .line 424
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 425
    .line 426
    .line 427
    return-void

    .line 428
    :cond_9
    iget-object p0, p0, Ll/hq30;->h:Landroid/widget/LinearLayout;

    .line 429
    .line 430
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 431
    .line 432
    .line 433
    return-void

    .line 434
    :cond_a
    :goto_4
    iget-object p1, p0, Ll/hq30;->h:Landroid/widget/LinearLayout;

    .line 435
    .line 436
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 437
    .line 438
    .line 439
    iget-object p1, p0, Ll/hq30;->i:Landroid/widget/TextView;

    .line 440
    .line 441
    sget v0, Ll/gbc0;->E0:I

    .line 442
    .line 443
    invoke-virtual {p2, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    invoke-static {p1, v0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 448
    .line 449
    .line 450
    iget-object p1, p0, Ll/hq30;->i:Landroid/widget/TextView;

    .line 451
    .line 452
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 453
    .line 454
    .line 455
    iget-object p1, p0, Ll/hq30;->h:Landroid/widget/LinearLayout;

    .line 456
    .line 457
    new-instance v0, Ll/cq30;

    .line 458
    .line 459
    invoke-direct {v0, p2}, Ll/cq30;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 460
    .line 461
    .line 462
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 463
    .line 464
    .line 465
    iget-object p1, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 466
    .line 467
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 468
    .line 469
    .line 470
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 471
    .line 472
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 473
    .line 474
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 475
    .line 476
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 477
    .line 478
    const-string v0, "superliked"

    .line 479
    .line 480
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 481
    .line 482
    .line 483
    move-result-object v0

    .line 484
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 485
    .line 486
    .line 487
    move-result p1

    .line 488
    iget-object v0, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 489
    .line 490
    if-eqz p1, :cond_d

    .line 491
    .line 492
    sget p1, Ll/gbc0;->j2:I

    .line 493
    .line 494
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 495
    .line 496
    .line 497
    move-result-object p1

    .line 498
    invoke-static {v0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 499
    .line 500
    .line 501
    iget-object p1, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 502
    .line 503
    sget v0, Ll/gbc0;->m2:I

    .line 504
    .line 505
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 506
    .line 507
    .line 508
    move-result-object p2

    .line 509
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 510
    .line 511
    .line 512
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 513
    .line 514
    .line 515
    move-result-object p1

    .line 516
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 517
    .line 518
    .line 519
    move-result-object p1

    .line 520
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->sf()Z

    .line 521
    .line 522
    .line 523
    move-result p1

    .line 524
    if-eqz p1, :cond_b

    .line 525
    .line 526
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 527
    .line 528
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 529
    .line 530
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 531
    .line 532
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MeetRelation;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 533
    .line 534
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RelationshipExt;->recvSuperLikedNum:Ljava/lang/String;

    .line 535
    .line 536
    invoke-static {p1}, Ll/z5h0;->r(Ljava/lang/String;)I

    .line 537
    .line 538
    .line 539
    move-result p1

    .line 540
    if-le p1, v2, :cond_b

    .line 541
    .line 542
    iget-object p1, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 543
    .line 544
    iget-object p0, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 545
    .line 546
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 547
    .line 548
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 549
    .line 550
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 551
    .line 552
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RelationshipExt;->recvSuperLikedNum:Ljava/lang/String;

    .line 553
    .line 554
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 555
    .line 556
    .line 557
    move-result-object p0

    .line 558
    const-string p2, "\u8d85\u7ea7\u559c\u6b22x%s"

    .line 559
    .line 560
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 561
    .line 562
    .line 563
    move-result-object p0

    .line 564
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 565
    .line 566
    .line 567
    return-void

    .line 568
    :cond_b
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 569
    .line 570
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 571
    .line 572
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 573
    .line 574
    .line 575
    move-result p1

    .line 576
    iget-object p0, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 577
    .line 578
    if-eqz p1, :cond_c

    .line 579
    .line 580
    const-string p1, "\u5979\u8d85\u7ea7\u559c\u6b22\u4e86\u6211"

    .line 581
    .line 582
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 583
    .line 584
    .line 585
    return-void

    .line 586
    :cond_c
    const-string p1, "\u4ed6\u8d85\u7ea7\u559c\u6b22\u4e86\u6211"

    .line 587
    .line 588
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 589
    .line 590
    .line 591
    return-void

    .line 592
    :cond_d
    sget p1, Ll/gbc0;->c2:I

    .line 593
    .line 594
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 595
    .line 596
    .line 597
    move-result-object p1

    .line 598
    invoke-static {v0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 599
    .line 600
    .line 601
    iget-object p1, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 602
    .line 603
    sget v0, Ll/gbc0;->i2:I

    .line 604
    .line 605
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 606
    .line 607
    .line 608
    move-result-object p2

    .line 609
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 610
    .line 611
    .line 612
    iget-object p1, p0, Ll/hq30;->j:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 613
    .line 614
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 615
    .line 616
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 617
    .line 618
    .line 619
    move-result p1

    .line 620
    iget-object p0, p0, Ll/hq30;->d:Landroid/widget/TextView;

    .line 621
    .line 622
    if-eqz p1, :cond_e

    .line 623
    .line 624
    const-string p1, "\u5979\u559c\u6b22\u4e86\u6211"

    .line 625
    .line 626
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 627
    .line 628
    .line 629
    return-void

    .line 630
    :cond_e
    const-string p1, "\u4ed6\u559c\u6b22\u4e86\u6211"

    .line 631
    .line 632
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 633
    .line 634
    .line 635
    return-void
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hq30;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/hq30;->l()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/iq30;->b(Ll/hq30;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method
