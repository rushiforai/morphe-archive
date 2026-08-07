.class public Ll/y2g0;
.super Ll/g1e;
.source "SourceFile"


# instance fields
.field public j:Landroid/widget/FrameLayout;

.field public k:Lv/VDraweeView;

.field public l:Lv/VDraweeView;

.field public m:Lv/VDraweeView;

.field public n:Lv/VDraweeView;

.field public o:Lv/VIcon;

.field public p:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public q:Landroid/widget/TextView;

.field public r:Landroid/widget/FrameLayout;

.field public s:Landroid/widget/TextView;

.field public t:Landroid/widget/TextView;

.field public u:Lcom/p1/mobile/android/app/Act;

.field public v:Lcom/p1/mobile/putong/core/data/ChatPartners;

.field public w:I

.field public x:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0, v0}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 3
    .line 4
    .line 5
    iput v0, p0, Ll/y2g0;->w:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Ll/dbc0;->zr:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 27
    .line 28
    .line 29
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    iput-object p1, p0, Ll/y2g0;->u:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic F(Ll/y2g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y2g0;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/y2g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y2g0;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/y2g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y2g0;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/y2g0;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y2g0;->S(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic J(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u7f51\u7edc\u9519\u8bef\uff0c\u8bf7\u91cd\u8bd5"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic K(Ll/y2g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y2g0;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Ll/y2g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y2g0;->R(Landroid/view/View;)V

    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/y2g0;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y2g0;->U(Lcom/p1/mobile/putong/core/data/ChatPartners;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/y2g0;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y2g0;->T(Lcom/p1/mobile/putong/core/data/ChatPartners;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic S(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Tg()Lrx/c;

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/och0;->d()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/y2g0;->x:Ll/x20;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-interface {p1}, Ll/x20;->call()V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public M(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/z2g0;->b(Ll/y2g0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/y2g0;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y2g0;->T(Lcom/p1/mobile/putong/core/data/ChatPartners;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/y2g0;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y2g0;->T(Lcom/p1/mobile/putong/core/data/ChatPartners;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/y2g0;->x:Ll/x20;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/core/data/ChatPartners;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget v1, p0, Ll/y2g0;->w:I

    .line 22
    .line 23
    if-le v0, v1, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Ll/y2g0;->x:Ll/x20;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-interface {v0}, Ll/x20;->call()V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 36
    .line 37
    iget v1, p0, Ll/y2g0;->w:I

    .line 38
    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 44
    .line 45
    iget-object v1, p0, Ll/y2g0;->u:Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->id:Ljava/lang/String;

    .line 48
    .line 49
    const-string v3, "from_start_chatting_now_dialg"

    .line 50
    .line 51
    invoke-static {v1, p1, v2, v3}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerSelectFriendAct;->a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartners;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object v1, p0, Ll/y2g0;->u:Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    invoke-virtual {v1, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/y2g0;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatPartners;->users:Ljava/util/List;

    .line 63
    .line 64
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    const-string v1, ""

    .line 69
    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_1

    .line 81
    .line 82
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 87
    .line 88
    new-instance v2, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string p1, ","

    .line 102
    .line 103
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    goto :goto_0

    .line 111
    :cond_1
    const-string p0, "other_uid"

    .line 112
    .line 113
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const-string p1, "preset_word"

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    const-string p1, "e_surprisebox_friend"

    .line 130
    .line 131
    const-string v0, "p_suggest_users_home_view"

    .line 132
    .line 133
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 134
    .line 135
    .line 136
    :cond_2
    return-void
.end method

.method public final U(Lcom/p1/mobile/putong/core/data/ChatPartners;)V
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget v1, p0, Ll/y2g0;->w:I

    .line 22
    .line 23
    if-le v0, v1, :cond_3

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->users:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->p2(Z)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vc()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 79
    .line 80
    iget v1, p0, Ll/y2g0;->w:I

    .line 81
    .line 82
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 87
    .line 88
    iget-object v1, p0, Ll/y2g0;->u:Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 93
    .line 94
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->id:Ljava/lang/String;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->users:Ljava/util/List;

    .line 97
    .line 98
    new-instance v4, Ll/v2g0;

    .line 99
    .line 100
    invoke-direct {v4}, Ll/v2g0;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-static {p1, v4}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {v2, v3, p1}, Ll/dkb;->ra(Ljava/lang/String;Ljava/util/List;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance v1, Ll/w2g0;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/w2g0;-><init>(Ll/y2g0;)V

    .line 118
    .line 119
    .line 120
    new-instance v2, Ll/x2g0;

    .line 121
    .line 122
    invoke-direct {v2}, Ll/x2g0;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Ll/y2g0;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatPartners;->users:Ljava/util/List;

    .line 135
    .line 136
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    const-string v1, ""

    .line 141
    .line 142
    if-nez p1, :cond_2

    .line 143
    .line 144
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_2

    .line 153
    .line 154
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 159
    .line 160
    new-instance v2, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string p1, ","

    .line 174
    .line 175
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    goto :goto_0

    .line 183
    :cond_2
    const-string p0, "other_uid"

    .line 184
    .line 185
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    const-string p1, "preset_word"

    .line 190
    .line 191
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 192
    .line 193
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    const-string p1, "e_surprisebox_friend"

    .line 202
    .line 203
    const-string v0, "p_suggest_users_home_view"

    .line 204
    .line 205
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 206
    .line 207
    .line 208
    :cond_3
    return-void
.end method

.method public V(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y2g0;->x:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/core/data/ChatPartners;)V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y2g0;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->users:Ljava/util/List;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_2

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 30
    .line 31
    iget-object v3, p0, Ll/y2g0;->l:Lv/VDraweeView;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v2, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 51
    .line 52
    iget-object v2, v2, Ll/j7b;->b0:Ll/wyd0;

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profile180()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v2, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    const/4 v2, 0x2

    .line 74
    if-lt v1, v2, :cond_0

    .line 75
    .line 76
    const/4 v1, 0x1

    .line 77
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 84
    .line 85
    iget-object v4, p0, Ll/y2g0;->m:Lv/VDraweeView;

    .line 86
    .line 87
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v3, v4, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    const/4 v3, 0x3

    .line 107
    if-lt v1, v3, :cond_1

    .line 108
    .line 109
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 114
    .line 115
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 116
    .line 117
    iget-object v3, p0, Ll/y2g0;->n:Lv/VDraweeView;

    .line 118
    .line 119
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v2, v3, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_1
    iget-object v1, p0, Ll/y2g0;->s:Landroid/widget/TextView;

    .line 135
    .line 136
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    const-string v2, "\u4e3a\u4f60\u627e\u5230%S\u4e2a\u4f60\u611f\u5174\u8da3\u7684\u804a\u5929\u642d\u5b50"

    .line 149
    .line 150
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    :cond_2
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-nez v0, :cond_3

    .line 162
    .line 163
    new-instance v0, Ljava/util/Random;

    .line 164
    .line 165
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    iput v0, p0, Ll/y2g0;->w:I

    .line 177
    .line 178
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 183
    .line 184
    iget-object p0, p0, Ll/y2g0;->q:Landroid/widget/TextView;

    .line 185
    .line 186
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    .line 190
    .line 191
    :cond_3
    const-string p0, "e_surprisebox_friend"

    .line 192
    .line 193
    const-string p1, "p_suggest_users_home_view"

    .line 194
    .line 195
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/y2g0;->u:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/y2g0;->M(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 19
    .line 20
    iget-object v0, p0, Ll/y2g0;->k:Lv/VDraweeView;

    .line 21
    .line 22
    sget v1, Ll/dbc0;->tq:I

    .line 23
    .line 24
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/y2g0;->r:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    new-instance v0, Ll/y2g0$a;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/y2g0$a;-><init>(Ll/y2g0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/y2g0;->t:Landroid/widget/TextView;

    .line 38
    .line 39
    new-instance v0, Ll/q2g0;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/q2g0;-><init>(Ll/y2g0;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/y2g0;->l:Lv/VDraweeView;

    .line 48
    .line 49
    new-instance v0, Ll/r2g0;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/r2g0;-><init>(Ll/y2g0;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/y2g0;->m:Lv/VDraweeView;

    .line 58
    .line 59
    new-instance v0, Ll/s2g0;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/s2g0;-><init>(Ll/y2g0;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/y2g0;->n:Lv/VDraweeView;

    .line 68
    .line 69
    new-instance v0, Ll/t2g0;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Ll/t2g0;-><init>(Ll/y2g0;)V

    .line 72
    .line 73
    .line 74
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/y2g0;->o:Lv/VIcon;

    .line 78
    .line 79
    new-instance v0, Ll/u2g0;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Ll/u2g0;-><init>(Ll/y2g0;)V

    .line 82
    .line 83
    .line 84
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
