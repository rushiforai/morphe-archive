.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VButton;

.field public i:Landroid/view/View;

.field public j:[Lv/VDraweeView;

.field public k:Landroid/view/View;

.field public l:Lcom/p1/mobile/putong/feed/data/MomentActivity;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x4

    .line 5
    new-array p1, p1, [Lv/VDraweeView;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->j:[Lv/VDraweeView;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x4

    .line 11
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->j:[Lv/VDraweeView;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x4

    .line 13
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->j:[Lv/VDraweeView;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->m(Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    const-string v3, "p_my_interactions_notification_view"

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0, v2, v3}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->l(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->k(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->o(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->n(Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public getUserAndMoment()Ll/pf60;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->l:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 14
    .line 15
    iget-object v2, v2, Ll/jka;->i0:Ljava/util/Map;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->l:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ih00;->a(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public j(I)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingInflatedId"
        }
    .end annotation

    .line 1
    sget v0, Ll/tec0;->I4:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    const/4 v2, 0x2

    .line 5
    const/4 v3, 0x1

    .line 6
    if-eqz p1, :cond_5

    .line 7
    .line 8
    if-eq p1, v3, :cond_4

    .line 9
    .line 10
    if-eq p1, v2, :cond_3

    .line 11
    .line 12
    if-eq p1, v1, :cond_2

    .line 13
    .line 14
    const/4 v4, 0x4

    .line 15
    if-eq p1, v4, :cond_1

    .line 16
    .line 17
    const/4 v4, 0x6

    .line 18
    if-eq p1, v4, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget v0, Ll/tec0;->R4:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget v0, Ll/tec0;->K4:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    sget v0, Ll/tec0;->N4:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_3
    sget v0, Ll/tec0;->O4:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_4
    sget v0, Ll/tec0;->M4:I

    .line 34
    .line 35
    :cond_5
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->g:Landroid/widget/FrameLayout;

    .line 44
    .line 45
    const/4 v5, 0x0

    .line 46
    invoke-virtual {p1, v0, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->j:[Lv/VDraweeView;

    .line 51
    .line 52
    sget v4, Ll/hdc0;->o0:I

    .line 53
    .line 54
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Lv/VDraweeView;

    .line 59
    .line 60
    aput-object v4, v0, v5

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->j:[Lv/VDraweeView;

    .line 63
    .line 64
    sget v4, Ll/hdc0;->q0:I

    .line 65
    .line 66
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    check-cast v4, Lv/VDraweeView;

    .line 71
    .line 72
    aput-object v4, v0, v3

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->j:[Lv/VDraweeView;

    .line 75
    .line 76
    sget v3, Ll/hdc0;->p0:I

    .line 77
    .line 78
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    check-cast v3, Lv/VDraweeView;

    .line 83
    .line 84
    aput-object v3, v0, v2

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->j:[Lv/VDraweeView;

    .line 87
    .line 88
    sget v2, Ll/hdc0;->n0:I

    .line 89
    .line 90
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Lv/VDraweeView;

    .line 95
    .line 96
    aput-object v2, v0, v1

    .line 97
    .line 98
    sget v0, Ll/hdc0;->q1:I

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->k:Landroid/view/View;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->g:Landroid/widget/FrameLayout;

    .line 107
    .line 108
    invoke-virtual {p0, p1, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->b:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->d:Lv/VText;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->getGPMemo(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->d:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 45
    .line 46
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->c:Lv/VImage;

    .line 53
    .line 54
    invoke-interface {v0, v1, p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_1

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 26
    .line 27
    const/4 p3, 0x0

    .line 28
    invoke-static {p0, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->Y1(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 45
    .line 46
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    invoke-static {p0, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsSimpleTextAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "from_MomentActivitiesAct"

    .line 12
    .line 13
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/bh00;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/bh00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/MomentActivity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 8
    .line 9
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p1, p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->sg(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 29
    .line 30
    const/4 p3, 0x0

    .line 31
    invoke-static {p0, p2, p3, p3}, Ll/orb0;->c(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 4

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->l:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_4

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const-string v1, "p_my_interactions_notification_view"

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 35
    .line 36
    const-string v3, "matched"

    .line 37
    .line 38
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_2

    .line 43
    .line 44
    const-string v3, "following"

    .line 45
    .line 46
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 56
    .line 57
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 58
    .line 59
    if-eqz p0, :cond_1

    .line 60
    .line 61
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 62
    .line 63
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0, v0, p1, v2, v1}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 90
    .line 91
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    new-instance v1, Ll/ch00;

    .line 96
    .line 97
    invoke-direct {v1, p1}, Ll/ch00;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0, p0, v1}, Ll/k3h;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p0, v0, p1, v2, v1}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 115
    .line 116
    .line 117
    :cond_4
    return-void
.end method

.method public q(Ll/dq1;Lcom/p1/mobile/putong/feed/data/MomentActivity;IZ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dq1<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            "IZ)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->l:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->getUserAndMoment()Ll/pf60;

    move-result-object v0

    .line 3
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    iget-boolean v1, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    if-nez v1, :cond_0

    sget v1, Ll/k9c0;->S:I

    goto :goto_0

    :cond_0
    sget v1, Ll/k9c0;->p0:I

    :goto_0
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    iget-object v2, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    invoke-static {v2}, Ll/mrb0;->W(Ljava/lang/String;)Lrx/c;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Ll/dq1;->c(Ll/ner;Lrx/c;)Lrx/c;

    move-result-object p1

    new-instance v1, Ll/wg00;

    invoke-direct {v1, p0}, Ll/wg00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;)V

    .line 6
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v1

    .line 7
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->i:Landroid/view/View;

    const/4 v1, 0x0

    if-nez p4, :cond_1

    move p4, v1

    goto :goto_1

    :cond_1
    const/16 p4, 0x8

    :goto_1
    invoke-virtual {p1, p4}, Landroid/view/View;->setVisibility(I)V

    .line 9
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    iget-object p4, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    iget-object p4, p4, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    move-result-object p1

    .line 10
    iget-object p4, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    const-string v2, "comment"

    invoke-static {p4, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p4

    const/4 v2, 0x1

    if-eqz p4, :cond_2

    .line 11
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->e:Lv/VText;

    invoke-virtual {p4, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 12
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->e:Lv/VText;

    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h:Lv/VButton;

    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->g:Landroid/widget/FrameLayout;

    invoke-static {p4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    goto/16 :goto_3

    .line 15
    :cond_2
    iget-object p4, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    const-string v3, "follow"

    invoke-static {p4, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p4

    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h:Lv/VButton;

    if-eqz p4, :cond_6

    .line 17
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->g:Landroid/widget/FrameLayout;

    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    iget-object p4, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_5

    iget-object p4, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    iget-object p4, p4, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 20
    const-string v3, "matched"

    invoke-static {p4, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p4

    if-nez p4, :cond_3

    iget-object p4, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    iget-object p4, p4, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    const-string v4, "following"

    .line 21
    invoke-static {p4, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_5

    .line 22
    :cond_3
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h:Lv/VButton;

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Ll/lbc0;->c:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 24
    invoke-virtual {p4, v4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 25
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h:Lv/VButton;

    const-string v4, "#cccccc"

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p4, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    iget-object p4, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    iget-object p4, p4, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    invoke-static {p4, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p4

    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h:Lv/VButton;

    .line 28
    const-string v3, "#bfbfbf"

    if-eqz p4, :cond_4

    .line 29
    sget p4, Lcom/p1/mobile/putong/feed/R$string;->N2:I

    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setText(I)V

    .line 30
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h:Lv/VButton;

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_2

    .line 31
    :cond_4
    sget p4, Lcom/p1/mobile/putong/feed/R$string;->P2:I

    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setText(I)V

    .line 32
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h:Lv/VButton;

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_2

    .line 33
    :cond_5
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h:Lv/VButton;

    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Ll/lbc0;->q4:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 35
    invoke-virtual {p4, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 36
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h:Lv/VButton;

    sget v0, Lcom/p1/mobile/putong/feed/R$string;->Q2:I

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(I)V

    .line 37
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h:Lv/VButton;

    const/4 v0, -0x1

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    :goto_2
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->e:Lv/VText;

    invoke-virtual {p4, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 39
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->e:Lv/VText;

    sget v0, Lcom/p1/mobile/putong/feed/R$string;->L2:I

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_3

    .line 40
    :cond_6
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    sget p4, Ll/lbc0;->d2:I

    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->e:Lv/VText;

    invoke-virtual {v0, p4, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 43
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->e:Lv/VText;

    if-nez p1, :cond_7

    .line 44
    const-string v0, ""

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 45
    :cond_7
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->B3:I

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(I)V

    .line 46
    :goto_3
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->f:Lv/VText;

    iget-wide v3, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->createdTime:D

    invoke-static {v3, v4}, Ll/pzi0;->N(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move p4, v1

    :goto_4
    if-ge p4, p3, :cond_c

    if-nez p1, :cond_8

    .line 47
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->j:[Lv/VDraweeView;

    aget-object v3, v3, p4

    invoke-virtual {v0, v3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    goto :goto_6

    .line 48
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    invoke-interface {v0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 49
    instance-of v3, v0, Lcom/p1/mobile/putong/data/Video;

    if-eqz v3, :cond_9

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    goto :goto_5

    .line 51
    :cond_9
    instance-of v3, v0, Lcom/p1/mobile/putong/data/Picture;

    if-eqz v3, :cond_a

    .line 52
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    goto :goto_5

    :cond_a
    const/4 v0, 0x0

    .line 53
    :goto_5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 54
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->j:[Lv/VDraweeView;

    aget-object v4, v4, p4

    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    goto :goto_6

    .line 55
    :cond_b
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->j:[Lv/VDraweeView;

    aget-object v3, v3, p4

    invoke-virtual {v0, v3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    :goto_6
    add-int/lit8 p4, p4, 0x1

    goto :goto_4

    .line 56
    :cond_c
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->g:Landroid/widget/FrameLayout;

    new-instance p4, Ll/xg00;

    invoke-direct {p4, p0, p1, p2}, Ll/xg00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;)V

    invoke-virtual {p3, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->b:Lv/VDraweeView;

    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->d:Lv/VText;

    const/4 v0, 0x2

    new-array v0, v0, [Landroid/view/View;

    aput-object p3, v0, v1

    aput-object p4, v0, v2

    .line 58
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p3

    new-instance p4, Ll/yg00;

    invoke-direct {p4, p0, p2}, Ll/yg00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/MomentActivity;)V

    .line 59
    invoke-static {p3, p4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 60
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->a:Landroid/widget/FrameLayout;

    new-instance p4, Ll/zg00;

    invoke-direct {p4, p0, p1, p2}, Ll/zg00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;)V

    invoke-virtual {p3, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->h:Lv/VButton;

    new-instance p2, Ll/ah00;

    invoke-direct {p2, p0}, Ll/ah00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
