.class public Ll/fs40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fs40$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/viewpager/widget/ViewPager$j;",
        "Ll/iam<",
        "Ll/yr40;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/AutoVDraweeView;

.field public c:Lv/AutoVDraweeView;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/TextView;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lv/VPager;

.field public i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public j:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public k:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

.field public l:Lv/VText;

.field public m:Lcom/p1/mobile/putong/data/User;

.field public final n:Ll/fs40$a;

.field public final o:Lcom/p1/mobile/putong/core/ui/nightclub/view/NightClubUserDetailAct;

.field public p:Ll/yr40;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/nightclub/view/NightClubUserDetailAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/fs40$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/fs40$a;-><init>(Ll/fs40;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/fs40;->n:Ll/fs40$a;

    .line 10
    .line 11
    iput-object p1, p0, Ll/fs40;->o:Lcom/p1/mobile/putong/core/ui/nightclub/view/NightClubUserDetailAct;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/fs40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fs40;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/fs40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fs40;->k()V

    return-void
.end method

.method public static synthetic c(Ll/fs40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fs40;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(ZLl/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "profile"

    .line 13
    .line 14
    :goto_0
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 15
    .line 16
    invoke-static {v0}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v2, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    sget-object p1, Lcom/facebook/imagepipeline/common/Priority;->HIGH:Lcom/facebook/imagepipeline/common/Priority;

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p1, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    const/4 v2, 0x1

    .line 44
    if-ne p1, v2, :cond_2

    .line 45
    .line 46
    sget-object p1, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    sget-object p1, Lcom/facebook/imagepipeline/common/Priority;->LOW:Lcom/facebook/imagepipeline/common/Priority;

    .line 50
    .line 51
    :goto_1
    invoke-virtual {v1, v0, p1, p0}, Ll/fsb0;->w0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static bridge synthetic e(Ll/fs40;)Ll/fs40$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fs40;->n:Ll/fs40$a;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/fs40;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fs40;->m:Lcom/p1/mobile/putong/data/User;

    return-object p0
.end method


# virtual methods
.method public A3(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ll/fs40;->m:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget-object p1, p0, Ll/fs40;->d:Landroid/widget/ImageView;

    .line 36
    .line 37
    sget v0, Ll/qa00;->j:I

    .line 38
    .line 39
    invoke-static {}, Ll/bnl0;->F0()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr v0, v1

    .line 44
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/fs40;->e:Landroid/widget/TextView;

    .line 48
    .line 49
    const/high16 v0, 0x42300000    # 44.0f

    .line 50
    .line 51
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-static {}, Ll/bnl0;->F0()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    add-int/2addr v0, v1

    .line 60
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/fs40;->q()V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/fs40;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;->r()V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/fs40;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 72
    .line 73
    iget-object v0, p0, Ll/fs40;->m:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    const/4 v1, -0x1

    .line 76
    const/4 v2, 0x0

    .line 77
    invoke-virtual {p1, v0, v1, v2, v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;->q(Lcom/p1/mobile/putong/data/User;IZZ)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/fs40;->k:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 81
    .line 82
    iget-object v0, p0, Ll/fs40;->m:Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    const/4 v2, 0x1

    .line 85
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->W(Lcom/p1/mobile/putong/data/User;IZ)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/fs40;->p()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fs40;->o:Lcom/p1/mobile/putong/core/ui/nightclub/view/NightClubUserDetailAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/gs40;->b(Ll/fs40;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/yr40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fs40;->j(Ll/yr40;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fs40;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/yr40;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fs40;->p:Ll/yr40;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fs40;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/fs40;->n(Lcom/p1/mobile/putong/data/User;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/fs40;->o:Lcom/p1/mobile/putong/core/ui/nightclub/view/NightClubUserDetailAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/nightclub/view/NightClubUserDetailAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "e_intl_mkt_twclub_profile_like"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ll/a0g;->M(Lcom/p1/mobile/putong/data/User;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Ec:I

    .line 27
    .line 28
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 53
    .line 54
    iget v0, p1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 55
    .line 56
    if-nez v0, :cond_1

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    const-wide/16 v2, 0x0

    .line 63
    .line 64
    cmp-long p1, v0, v2

    .line 65
    .line 66
    if-lez p1, :cond_1

    .line 67
    .line 68
    iget-object p0, p0, Ll/fs40;->o:Lcom/p1/mobile/putong/core/ui/nightclub/view/NightClubUserDetailAct;

    .line 69
    .line 70
    const-string p1, "p_intl_mkt_twclub_profile,e_intl_mkt_twclub_profile_like,click"

    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 73
    .line 74
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    iget-object p1, p0, Ll/fs40;->p:Ll/yr40;

    .line 79
    .line 80
    if-eqz p1, :cond_2

    .line 81
    .line 82
    iget-object p0, p0, Ll/fs40;->m:Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    invoke-virtual {p1, p0}, Ll/yr40;->j0(Lcom/p1/mobile/putong/data/User;)V

    .line 85
    .line 86
    .line 87
    :cond_2
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Ll/jyb;->p0(Ljava/util/Collection;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Ll/cs40;

    .line 14
    .line 15
    invoke-direct {p1, p2}, Ll/cs40;-><init>(Z)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    const-string p0, ""

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const-string p0, "profile"

    .line 39
    .line 40
    :goto_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    sget-object v0, Lcom/facebook/imagepipeline/common/Priority;->HIGH:Lcom/facebook/imagepipeline/common/Priority;

    .line 51
    .line 52
    invoke-virtual {p2, p1, v0, p0}, Ll/fsb0;->w0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fs40;->h:Lv/VPager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/hkl0;->a(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/fs40;->i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->b(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/fs40;->n:Ll/fs40$a;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/fs40$a;->s(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/asj0;->d0()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/fs40;->o:Lcom/p1/mobile/putong/core/ui/nightclub/view/NightClubUserDetailAct;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 35
    .line 36
    if-ne p0, v0, :cond_0

    .line 37
    .line 38
    check-cast p1, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->V()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final p()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fs40;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 4
    .line 5
    iget v1, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 6
    .line 7
    const/16 v2, 0x3e8

    .line 8
    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 17
    .line 18
    const/4 v2, 0x5

    .line 19
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 27
    .line 28
    sget v2, Lcom/p1/mobile/putong/common/R$string;->J0:I

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 v1, 0x0

    .line 43
    invoke-static {v0, v1}, Ll/q8g0;->q(Lcom/p1/mobile/putong/data/Location;Z)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    :goto_0
    iget-object v1, p0, Ll/fs40;->f:Lv/VText;

    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Fb:I

    .line 55
    .line 56
    invoke-static {v3}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v3, ": "

    .line 64
    .line 65
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Ll/fs40;->k:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->c:Lv/VText;

    .line 81
    .line 82
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-nez v2, :cond_2

    .line 91
    .line 92
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    sget v3, Lcom/p1/mobile/putong/core/R$string;->sh:I

    .line 97
    .line 98
    invoke-static {v3}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-nez v2, :cond_1

    .line 107
    .line 108
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    sget v2, Lcom/p1/mobile/putong/core/R$string;->lj:I

    .line 113
    .line 114
    invoke-static {v2}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-eqz v1, :cond_2

    .line 123
    .line 124
    :cond_1
    iget-object p0, p0, Ll/fs40;->k:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->c:Lv/VText;

    .line 127
    .line 128
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    :cond_2
    return-void
.end method

.method public final q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fs40;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/zr40;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/zr40;-><init>(Ll/fs40;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/fs40;->h:Lv/VPager;

    .line 15
    .line 16
    iget-object v1, p0, Ll/fs40;->n:Ll/fs40$a;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/fs40;->n:Ll/fs40$a;

    .line 22
    .line 23
    iget-object v1, p0, Ll/fs40;->m:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/fs40$a;->y(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/fs40;->h:Lv/VPager;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/fs40;->i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 36
    .line 37
    iget-object v1, p0, Ll/fs40;->m:Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/fs40;->m:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/4 v1, 0x1

    .line 57
    if-gt v0, v1, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Ll/fs40;->i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object v0, p0, Ll/fs40;->d:Landroid/widget/ImageView;

    .line 66
    .line 67
    new-instance v1, Ll/as40;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/as40;-><init>(Ll/fs40;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/fs40;->l:Lv/VText;

    .line 76
    .line 77
    new-instance v1, Ll/bs40;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/bs40;-><init>(Ll/fs40;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final s(Z)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 p1, 0x3fc00000    # 1.5f

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/high16 p1, -0x40400000    # -1.5f

    .line 7
    .line 8
    :goto_0
    iget-object v0, p0, Ll/fs40;->h:Lv/VPager;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    int-to-float v1, v1

    .line 15
    const/high16 v2, 0x40000000    # 2.0f

    .line 16
    .line 17
    div-float/2addr v1, v2

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/fs40;->h:Lv/VPager;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    int-to-float v1, v1

    .line 28
    div-float/2addr v1, v2

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/fs40;->h:Lv/VPager;

    .line 33
    .line 34
    sget-object v0, Landroid/view/View;->ROTATION_Y:Landroid/util/Property;

    .line 35
    .line 36
    const/4 v1, 0x3

    .line 37
    new-array v1, v1, [F

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    const/4 v3, 0x0

    .line 41
    aput v3, v1, v2

    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    aput p1, v1, v2

    .line 45
    .line 46
    const/4 p1, 0x2

    .line 47
    aput v3, v1, p1

    .line 48
    .line 49
    invoke-static {p0, v0, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-wide/16 v0, 0xc8

    .line 54
    .line 55
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fs40;->h:Lv/VPager;

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
    iget-object v0, p0, Ll/fs40;->h:Lv/VPager;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    if-gtz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ll/fs40;->s(Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p0, p0, Ll/fs40;->h:Lv/VPager;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/lit8 v0, v0, -0x1

    .line 30
    .line 31
    invoke-virtual {p0, v0, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public v()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fs40;->h:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/fs40;->n:Ll/fs40$a;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/fs40$a;->getCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    sub-int/2addr v1, v2

    .line 15
    if-lt v0, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Ll/fs40;->s(Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Ll/fs40;->h:Lv/VPager;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr v0, v2

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {p0, v0, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
