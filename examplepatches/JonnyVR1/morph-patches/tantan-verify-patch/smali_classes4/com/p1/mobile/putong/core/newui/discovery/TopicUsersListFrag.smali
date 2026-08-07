.class public Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/core/newui/view/CoreEmptyView;

.field public B:Ll/a2h0;

.field public C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

.field public z:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Lcom/p1/mobile/putong/core/data/GPTopicCard;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->d5(Lcom/p1/mobile/putong/core/data/GPTopicCard;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->k5()V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->m5(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->h5(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->e5(Ljava/util/List;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R4(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/LikersLimit;->remaining:I

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

.method public static synthetic T4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->f5(Ll/pf60;)V

    return-void
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->j5(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Lcom/p1/mobile/putong/data/LookingFor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->l5(Lcom/p1/mobile/putong/data/LookingFor;)V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->c5(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Ljava/util/HashMap;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->g5(Ljava/util/HashMap;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/LookingFor;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public static synthetic Z4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->i5(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic c5(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/dkb;->o7(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic h5(Ljava/util/List;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Ll/dkb;->Ca(Ljava/lang/String;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->n5()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->b5()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->B:Ll/a2h0;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/a2h0;->J(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic i5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->n5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic j5(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/dkb;->o7(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zbj0;->b(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->z:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->A:Lcom/p1/mobile/putong/core/newui/view/CoreEmptyView;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "type_topic_name"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 17
    .line 18
    return-void
.end method

.method public final synthetic d5(Lcom/p1/mobile/putong/core/data/GPTopicCard;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public final synthetic e5(Ljava/util/List;)Ll/pf60;
    .locals 1

    .line 1
    new-instance v0, Ll/obj0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/obj0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 11
    .line 12
    iget p1, p0, Lcom/p1/mobile/putong/core/data/GPTopicCard;->headerDesc:I

    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public f4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lbj0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/lbj0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    iget-object v0, v0, Ll/dkb;->n1:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/rbj0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/rbj0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/sbj0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/sbj0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V

    .line 34
    .line 35
    .line 36
    new-instance v2, Ll/tbj0;

    .line 37
    .line 38
    invoke-direct {v2, p0}, Ll/tbj0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/ubj0;

    .line 59
    .line 60
    invoke-direct {v1}, Ll/ubj0;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/vbj0;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/vbj0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v1, Ll/wbj0;

    .line 96
    .line 97
    invoke-direct {v1}, Ll/wbj0;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const/4 v1, 0x1

    .line 109
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v2, Ll/xbj0;

    .line 114
    .line 115
    invoke-direct {v2, p0}, Ll/xbj0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 128
    .line 129
    iget-object v0, v0, Ll/dkb;->m1:Lrx/subjects/a;

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    new-instance v2, Ll/ybj0;

    .line 136
    .line 137
    invoke-direct {v2}, Ll/ybj0;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v2, Ll/mbj0;

    .line 145
    .line 146
    invoke-direct {v2, p0}, Ll/mbj0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    new-instance v1, Ll/qbj0;

    .line 162
    .line 163
    invoke-direct {v1, p0}, Ll/qbj0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V

    .line 164
    .line 165
    .line 166
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public final synthetic f5(Ll/pf60;)V
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
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

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
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->B:Ll/a2h0;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/a2h0;->K(Lcom/p1/mobile/putong/core/data/GPTopicCard;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->B:Ll/a2h0;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/a2h0;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 11
    .line 12
    new-instance v2, Ll/nbj0;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Ll/nbj0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p1, v0, v1, v2}, Ll/a2h0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GPTopicCard;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->B:Ll/a2h0;

    .line 21
    .line 22
    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-direct {p1, v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag$a;

    .line 33
    .line 34
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag$a;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Landroidx/recyclerview/widget/GridLayoutManager;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->z:Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->z:Landroidx/recyclerview/widget/RecyclerView;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->B:Ll/a2h0;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic g5(Ljava/util/HashMap;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    new-instance p0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {}, Ll/rbb0;->q()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    const/16 p1, 0xa

    .line 29
    .line 30
    invoke-static {p0, p1}, Ll/jyb;->k0(Ljava/util/List;I)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :cond_1
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->a5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic k5()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/dkb;->o7(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l5(Lcom/p1/mobile/putong/data/LookingFor;)V
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v0, Ll/pbj0;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/pbj0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v1, 0x3e8

    .line 9
    .line 10
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic m5(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Ll/ljj;->a(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_online:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->C:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "popular"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_pop:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 26
    .line 27
    const-string v0, "unlock_popular"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v0, "unlock_online"

    .line 31
    .line 32
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {v1, p0, v0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    const/4 v1, 0x1

    .line 59
    const/4 v2, 0x0

    .line 60
    const-string v3, "from_theme_recommendation"

    .line 61
    .line 62
    invoke-static {p0, p1, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final n5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->B:Ll/a2h0;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/a2h0;->J(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->A:Lcom/p1/mobile/putong/core/newui/view/CoreEmptyView;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
