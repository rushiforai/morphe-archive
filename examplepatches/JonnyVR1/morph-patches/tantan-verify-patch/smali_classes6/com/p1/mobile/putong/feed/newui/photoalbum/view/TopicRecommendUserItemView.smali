.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;

.field public e:Lv/VFrame;

.field public f:Lv/VDraweeView;

.field public g:Lv/VLinear;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VButton;

.field public final m:I

.field public final n:I

.field public o:Ljava/lang/String;

.field public p:Lcom/p1/mobile/putong/data/User;

.field public q:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x43240000    # 164.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->m:I

    .line 11
    .line 12
    const/high16 p1, 0x41400000    # 12.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n:I

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x43240000    # 164.0f

    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->m:I

    const/high16 p1, 0x41400000    # 12.0f

    .line 23
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x43240000    # 164.0f

    .line 25
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->m:I

    const/high16 p1, 0x41400000    # 12.0f

    .line 26
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->p(Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->k(Ll/pf60;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->m(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/saj0;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i(ZLcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "e_follow"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p1, "e_cancelfollow"

    .line 7
    .line 8
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->o:Ljava/lang/String;

    .line 9
    .line 10
    const-string v0, "owner_id"

    .line 11
    .line 12
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "source_module_id"

    .line 19
    .line 20
    const-string v2, "e_user_suggest_card"

    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "receiver_user_id"

    .line 27
    .line 28
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v2, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    filled-new-array {v0, v1, p2}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-static {p1, p0, p2}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 11
    .line 12
    return-object p0
.end method

.method public final synthetic k(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->p:Lcom/p1/mobile/putong/data/User;

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
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->p:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->q(Lcom/p1/mobile/putong/data/User;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/data/User;)V
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
    const-string v3, "p_activity"

    .line 13
    .line 14
    invoke-virtual {v0, v1, p1, v2, v3}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/oaj0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/oaj0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/raj0;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/raj0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 v0, 0x1

    .line 8
    if-eqz p2, :cond_3

    .line 9
    .line 10
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 11
    .line 12
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 13
    .line 14
    const-string v1, "matched"

    .line 15
    .line 16
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_2

    .line 21
    .line 22
    const-string v1, "following"

    .line 23
    .line 24
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->i(ZLcom/p1/mobile/putong/data/User;)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 35
    .line 36
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 37
    .line 38
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 39
    .line 40
    if-eqz p2, :cond_1

    .line 41
    .line 42
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 43
    .line 44
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->o:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p2, v1, p1, v0, v2}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance p2, Ll/oaj0;

    .line 65
    .line 66
    invoke-direct {p2, p0}, Ll/oaj0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;)V

    .line 67
    .line 68
    .line 69
    new-instance p0, Ll/paj0;

    .line 70
    .line 71
    invoke-direct {p0}, Ll/paj0;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    :goto_0
    const/4 p2, 0x0

    .line 83
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->i(ZLcom/p1/mobile/putong/data/User;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/naj0;

    .line 103
    .line 104
    invoke-direct {v1, p0, p1}, Ll/naj0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;Lcom/p1/mobile/putong/data/User;)V

    .line 105
    .line 106
    .line 107
    invoke-static {p2, v0, v1}, Ll/k3h;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->i(ZLcom/p1/mobile/putong/data/User;)V

    .line 112
    .line 113
    .line 114
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->o:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {p2, v1, p1, v0, v2}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    new-instance p2, Ll/oaj0;

    .line 131
    .line 132
    invoke-direct {p2, p0}, Ll/oaj0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;)V

    .line 133
    .line 134
    .line 135
    new-instance p0, Ll/qaj0;

    .line 136
    .line 137
    invoke-direct {p0}, Ll/qaj0;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/data/Picture;Lv/VDraweeView;I)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 5
    .line 6
    const-string v0, "raw"

    .line 7
    .line 8
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 23
    .line 24
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-virtual {p0, p2, p3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p2, p0}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method public o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/RecommendUsers;Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/feed/data/RecommendUsers;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->q:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->o:Ljava/lang/String;

    .line 4
    .line 5
    sget-object p4, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->userId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p4, v0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->p:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    if-nez p4, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->r(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 22
    .line 23
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->f:Lv/VDraweeView;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->p:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p3, p4, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 36
    .line 37
    .line 38
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->h:Landroid/widget/TextView;

    .line 39
    .line 40
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->p:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    iget-object p4, p4, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->i:Landroid/widget/TextView;

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 50
    .line 51
    .line 52
    move-result-object p4

    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->p:Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    invoke-interface {p4, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->hideAge(Lcom/p1/mobile/putong/data/User;)Z

    .line 56
    .line 57
    .line 58
    move-result p4

    .line 59
    xor-int/lit8 p4, p4, 0x1

    .line 60
    .line 61
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->i:Landroid/widget/TextView;

    .line 65
    .line 66
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->p:Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    iget-object p4, p4, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 69
    .line 70
    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p4

    .line 74
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->j:Lv/VText;

    .line 78
    .line 79
    new-instance p4, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    iget v0, p2, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->followerCounter:I

    .line 85
    .line 86
    invoke-static {v0}, Ll/q8g0;->u(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v0, "\u4eba\u5173\u6ce8"

    .line 94
    .line 95
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p4

    .line 102
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->k:Lv/VText;

    .line 106
    .line 107
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->recommendation:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->p:Lcom/p1/mobile/putong/data/User;

    .line 113
    .line 114
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->q(Lcom/p1/mobile/putong/data/User;)V

    .line 115
    .line 116
    .line 117
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 118
    .line 119
    iget-object p2, p2, Ll/jka;->Q0:Lrx/subjects/b;

    .line 120
    .line 121
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    new-instance p2, Ll/laj0;

    .line 126
    .line 127
    invoke-direct {p2, p0}, Ll/laj0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;)V

    .line 128
    .line 129
    .line 130
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 2
    .line 3
    const-string v1, "matched"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v2, -0x1

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 13
    .line 14
    const-string v3, "following"

    .line 15
    .line 16
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Ll/lbc0;->p4:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 45
    .line 46
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 52
    .line 53
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    sget v4, Ll/lbc0;->p4:I

    .line 64
    .line 65
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 73
    .line 74
    const/4 v3, 0x1

    .line 75
    invoke-virtual {v0, v3}, Landroid/view/View;->setSelected(Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 84
    .line 85
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 90
    .line 91
    if-eqz p1, :cond_2

    .line 92
    .line 93
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->N2:I

    .line 94
    .line 95
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    sget v0, Ll/k9c0;->F:I

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_2
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->P2:I

    .line 115
    .line 116
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    sget v0, Ll/k9c0;->F:I

    .line 126
    .line 127
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->p(Lcom/p1/mobile/putong/data/Followship;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Ll/lbc0;->p4:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 37
    .line 38
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 44
    .line 45
    const/4 v1, -0x1

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->l:Lv/VButton;

    .line 50
    .line 51
    new-instance v1, Ll/maj0;

    .line 52
    .line 53
    invoke-direct {v1, p0, p1}, Ll/maj0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;Lcom/p1/mobile/putong/data/User;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final r(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->s()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/4 v1, 0x3

    .line 43
    if-eqz p1, :cond_5

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    if-eq p1, v2, :cond_4

    .line 47
    .line 48
    const/4 v2, 0x2

    .line 49
    if-eq p1, v2, :cond_3

    .line 50
    .line 51
    if-eq p1, v1, :cond_2

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->u(Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->v(Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->t(Ljava/util/List;)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->s()V

    .line 67
    .line 68
    .line 69
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-le p1, v1, :cond_6

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->u(Ljava/util/List;)V

    .line 76
    .line 77
    .line 78
    :cond_6
    return-void
.end method

.method public final s()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->d:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->b:Lv/VDraweeView;

    .line 13
    .line 14
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n:I

    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    const/4 v7, 0x0

    .line 18
    move v5, v4

    .line 19
    move-object v2, p0

    .line 20
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->w(Lv/VDraweeView;IIII)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 24
    .line 25
    iget-object v0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->b:Lv/VDraweeView;

    .line 26
    .line 27
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->p:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0, v0, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final t(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->d:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->j(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->b:Lv/VDraweeView;

    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->m:I

    .line 25
    .line 26
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n(Lcom/p1/mobile/putong/data/Picture;Lv/VDraweeView;I)V

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->b:Lv/VDraweeView;

    .line 30
    .line 31
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n:I

    .line 32
    .line 33
    const/4 v6, 0x0

    .line 34
    const/4 v7, 0x0

    .line 35
    move v5, v4

    .line 36
    move-object v2, p0

    .line 37
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->w(Lv/VDraweeView;IIII)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final u(Ljava/util/List;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->d:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->b:Lv/VDraweeView;

    .line 13
    .line 14
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n:I

    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    const/4 v7, 0x0

    .line 18
    const/4 v5, 0x0

    .line 19
    move-object v2, p0

    .line 20
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->w(Lv/VDraweeView;IIII)V

    .line 21
    .line 22
    .line 23
    move-object v8, v2

    .line 24
    iget-object v9, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->c:Lv/VDraweeView;

    .line 25
    .line 26
    const/4 v12, 0x0

    .line 27
    const/4 v13, 0x0

    .line 28
    const/4 v10, 0x0

    .line 29
    const/4 v11, 0x0

    .line 30
    invoke-virtual/range {v8 .. v13}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->w(Lv/VDraweeView;IIII)V

    .line 31
    .line 32
    .line 33
    iget-object v9, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->d:Lv/VDraweeView;

    .line 34
    .line 35
    iget v11, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n:I

    .line 36
    .line 37
    invoke-virtual/range {v8 .. v13}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->w(Lv/VDraweeView;IIII)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 52
    .line 53
    const/4 v1, 0x2

    .line 54
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 59
    .line 60
    invoke-virtual {v8, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->j(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v8, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->j(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v8, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->j(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object v1, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->b:Lv/VDraweeView;

    .line 73
    .line 74
    iget v2, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->m:I

    .line 75
    .line 76
    div-int/lit8 v2, v2, 0x3

    .line 77
    .line 78
    invoke-virtual {v8, p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n(Lcom/p1/mobile/putong/data/Picture;Lv/VDraweeView;I)V

    .line 79
    .line 80
    .line 81
    iget-object p0, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->c:Lv/VDraweeView;

    .line 82
    .line 83
    iget v1, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->m:I

    .line 84
    .line 85
    div-int/lit8 v1, v1, 0x3

    .line 86
    .line 87
    invoke-virtual {v8, v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n(Lcom/p1/mobile/putong/data/Picture;Lv/VDraweeView;I)V

    .line 88
    .line 89
    .line 90
    iget-object p0, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->d:Lv/VDraweeView;

    .line 91
    .line 92
    iget v0, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->m:I

    .line 93
    .line 94
    div-int/lit8 v0, v0, 0x3

    .line 95
    .line 96
    invoke-virtual {v8, p1, p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n(Lcom/p1/mobile/putong/data/Picture;Lv/VDraweeView;I)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final v(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v6, 0x1

    .line 4
    invoke-static {v1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->d:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v7, 0x0

    .line 10
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->b:Lv/VDraweeView;

    .line 14
    .line 15
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n:I

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    const/4 v5, 0x0

    .line 19
    const/4 v3, 0x0

    .line 20
    move-object v0, p0

    .line 21
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->w(Lv/VDraweeView;IIII)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->c:Lv/VDraweeView;

    .line 25
    .line 26
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n:I

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->w(Lv/VDraweeView;IIII)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 37
    .line 38
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->j(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->j(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->b:Lv/VDraweeView;

    .line 53
    .line 54
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->m:I

    .line 55
    .line 56
    div-int/lit8 v4, v4, 0x2

    .line 57
    .line 58
    invoke-virtual {p0, v1, v3, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n(Lcom/p1/mobile/putong/data/Picture;Lv/VDraweeView;I)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->c:Lv/VDraweeView;

    .line 62
    .line 63
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->m:I

    .line 64
    .line 65
    div-int/lit8 v3, v3, 0x2

    .line 66
    .line 67
    invoke-virtual {p0, v2, v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->n(Lcom/p1/mobile/putong/data/Picture;Lv/VDraweeView;I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final w(Lv/VDraweeView;IIII)V
    .locals 0

    .line 1
    new-instance p0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 4
    .line 5
    .line 6
    int-to-float p2, p2

    .line 7
    int-to-float p3, p3

    .line 8
    int-to-float p5, p5

    .line 9
    int-to-float p4, p4

    .line 10
    invoke-virtual {p0, p2, p3, p5, p4}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ll/wlj;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
