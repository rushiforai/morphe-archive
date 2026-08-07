.class public Ll/ewa0;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public A:Lv/VDraweeView;

.field public B:Lv/VDraweeView;

.field public C:Lv/VDraweeView;

.field public D:Landroid/widget/RelativeLayout;

.field public E:Lv/VRelative;

.field public F:Lv/VDraweeView;

.field public G:Lv/VText;

.field public H:Lv/VLinear;

.field public I:Lv/VText;

.field public J:Lv/VText;

.field public K:Landroid/view/View;

.field public L:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public M:Ljava/lang/String;

.field public N:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public O:Z

.field public P:Z

.field public Q:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public R:Ll/x20;

.field public S:Ll/skq0;

.field public T:Lv/VLinear;

.field public u:Landroid/widget/LinearLayout;

.field public v:Lv/VLinear;

.field public w:Lv/VText;

.field public x:Lv/VDraweeView;

.field public y:Lv/VDraweeView;

.field public z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/ewa0;->K:Landroid/view/View;

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/ewa0;->N:Lrx/subjects/a;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Ll/ewa0;->P:Z

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/on2;->p()Ll/ner;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance p2, Ll/vva0;

    .line 21
    .line 22
    invoke-direct {p2, p0}, Ll/vva0;-><init>(Ll/ewa0;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1, p2}, Ll/ner;->creates(Ll/y20;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic R(Ll/ewa0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->g0()V

    return-void
.end method

.method public static synthetic S(Ll/ewa0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ewa0;->h0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ll/ewa0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ewa0;->k0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic U(Ll/ewa0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ewa0;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W(Ll/ewa0;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ewa0;->o0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X(Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMoments(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v0, 0x0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    .line 25
    invoke-interface {p1, p0, v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentCachedMoments(Ljava/lang/String;ILcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic Y(Ll/ewa0;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ewa0;->j0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic Z(Ll/ewa0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ewa0;->l0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic a0(Ll/ewa0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ewa0;->i0(Ll/pf60;)V

    return-void
.end method

.method private synthetic h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->b0()Ll/x20;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private o0()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->P1()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    .line 25
    invoke-interface {p0, v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMoments(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->wh(Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v1, Ll/dwa0;

    .line 39
    .line 40
    invoke-direct {v1, v0}, Ll/dwa0;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method private t0()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->u6()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    iget-object v0, p0, Ll/ewa0;->T:Lv/VLinear;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    iget-object v0, p0, Ll/ewa0;->S:Ll/skq0;

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    const-string v2, "p_suggest_user_profile_info_view"

    .line 48
    .line 49
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ll/skq0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/ewa0;->S:Ll/skq0;

    .line 54
    .line 55
    iget-object v1, p0, Ll/ewa0;->T:Lv/VLinear;

    .line 56
    .line 57
    invoke-interface {v0}, Ll/skq0;->getView()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/ewa0;->S:Ll/skq0;

    .line 65
    .line 66
    invoke-interface {v0}, Ll/skq0;->getView()Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/high16 v1, 0x40800000    # 4.0f

    .line 71
    .line 72
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 77
    .line 78
    .line 79
    :cond_0
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    if-nez v0, :cond_1

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {v1}, Ll/s7m;->userId()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-interface {v0, v1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    :cond_1
    iget-object p0, p0, Ll/ewa0;->S:Ll/skq0;

    .line 106
    .line 107
    if-nez v0, :cond_2

    .line 108
    .line 109
    invoke-interface {p0}, Ll/skq0;->getView()Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const/4 v0, 0x0

    .line 114
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ns()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-interface {p0, v0, v1}, Ll/skq0;->a(Lcom/p1/mobile/putong/data/User;I)V

    .line 127
    .line 128
    .line 129
    :cond_3
    return-void
.end method

.method private v0()V
    .locals 9

    .line 1
    invoke-static {}, Ll/luh;->k()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/luh;->j()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "p_suggest_user_profile_info_view"

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Ll/luh;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isPostingMoment()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    move-object v2, p0

    .line 60
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    const/4 p0, 0x0

    .line 63
    new-array p0, p0, [Lcom/p1/mobile/putong/data/Media;

    .line 64
    .line 65
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-static {}, Ll/luh;->k()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    invoke-static {}, Ll/luh;->l()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    const/4 v8, 0x0

    .line 78
    const/4 v4, 0x1

    .line 79
    const-string v5, "other"

    .line 80
    .line 81
    invoke-interface/range {v1 .. v8}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Nr(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method


# virtual methods
.method public O()Ll/t3m;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/on2;->w()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/t3m;

    .line 6
    .line 7
    return-object p0
.end method

.method public final b0()Ll/x20;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ewa0;->R:Ll/x20;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/cwa0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/cwa0;-><init>(Ll/ewa0;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ewa0;->R:Ll/x20;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/ewa0;->R:Ll/x20;

    .line 13
    .line 14
    return-object p0
.end method

.method public final c0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ewa0;->x:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ewa0;->z:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ewa0;->B:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final d0()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "from_new_meet_picks_feed"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/joa;->H3()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    return v1

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v2, "from_new_meet_see_feed"

    .line 34
    .line 35
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-static {}, Ll/rbb0;->q()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    return v1

    .line 48
    :cond_1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p0}, Ll/t3m;->from()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v0, "from_meet_feed"

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    invoke-static {}, Ll/joa;->f4()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_2

    .line 69
    .line 70
    return v1

    .line 71
    :cond_2
    const/4 p0, 0x0

    .line 72
    return p0
.end method

.method public final e0(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->E1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0, p1}, Ll/t3m;->m3(Lcom/p1/mobile/putong/data/User;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    :cond_0
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0, p1}, Ll/t3m;->c3(Lcom/p1/mobile/putong/data/User;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-interface {p0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-interface {p1, p0}, Ll/t3m;->P(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    const/4 p0, 0x0

    .line 85
    return p0

    .line 86
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 87
    return p0
.end method

.method public final f0()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/vq8;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ll/t3m;->D2()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public final synthetic g0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0, v1}, Ll/t3m;->m3(Lcom/p1/mobile/putong/data/User;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v0, v1}, Ll/t3m;->c3(Lcom/p1/mobile/putong/data/User;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "from_guess_liker_result"

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    :goto_0
    return-void

    .line 56
    :cond_2
    invoke-static {}, Ll/vq8;->b()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/ewa0;->p0()V

    .line 63
    .line 64
    .line 65
    :cond_3
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-interface {v2}, Ll/nol;->act()Landroid/app/Activity;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-interface {p0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-string v3, "from_ProfileFrag"

    .line 96
    .line 97
    invoke-interface {v1, v2, p0, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentsInProfileAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final synthetic i0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ewa0;->N:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v0, Ll/vg60;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/util/List;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-direct {v0, p1, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Ll/t3m;->D2()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Ll/t3m;->S()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Ll/ewa0;->w:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    sget v0, Lcom/p1/mobile/putong/core/R$string;->rj:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->N:I

    .line 40
    .line 41
    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object p1, p0, Ll/ewa0;->u:Landroid/widget/LinearLayout;

    .line 45
    .line 46
    new-instance v0, Ll/uva0;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/uva0;-><init>(Ll/ewa0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ewa0;->f0()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-interface {p1}, Ll/hbs;->a()Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    return-void

    .line 76
    :cond_3
    :goto_1
    invoke-virtual {p0}, Ll/ewa0;->c0()V

    .line 77
    .line 78
    .line 79
    const/4 p1, 0x0

    .line 80
    invoke-virtual {p0, p1}, Ll/ewa0;->w0(Ll/vg60;)Z

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final synthetic j0(Ll/vg60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ewa0;->L:Ll/vg60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ewa0;->q0(Ll/vg60;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ll/t3m;->t1()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic k0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/ewa0;->P:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Ll/t3m;->t1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/wj90;->c(Lcom/p1/mobile/putong/data/User;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    sget-object v0, Ll/f760;->Companion:Ll/f760$a;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2}, Ll/s7m;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Ll/f760$a;->i(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_7

    .line 32
    .line 33
    sget-object v0, Ll/qap;->Companion:Ll/qap$a;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {v2}, Ll/s7m;->userId()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v2}, Ll/qap$a;->j(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :cond_1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Ll/ewa0;->e0(Lcom/p1/mobile/putong/data/User;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    return v1

    .line 66
    :cond_2
    invoke-virtual {p0}, Ll/ewa0;->n0()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    return p0

    .line 74
    :cond_3
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-interface {v0}, Ll/t3m;->E1()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_7

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-string v2, "from_meet_picks_feed"

    .line 93
    .line 94
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-nez v0, :cond_4

    .line 99
    .line 100
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const-string v2, "from_new_meet_picks_feed"

    .line 109
    .line 110
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_4

    .line 115
    .line 116
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const-string v2, "from_picks"

    .line 125
    .line 126
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_4

    .line 131
    .line 132
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    const-string v2, "p_picks_profile"

    .line 141
    .line 142
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-nez v0, :cond_4

    .line 147
    .line 148
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    const-string v2, "p_picks_profile_card"

    .line 157
    .line 158
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_4

    .line 163
    .line 164
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    const-string v2, "from_meet_picks_card"

    .line 173
    .line 174
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_5

    .line 179
    .line 180
    :cond_4
    invoke-static {}, Ll/joa;->H3()Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-eqz v0, :cond_7

    .line 185
    .line 186
    :cond_5
    invoke-virtual {p0}, Ll/ewa0;->d0()Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_6

    .line 191
    .line 192
    goto :goto_0

    .line 193
    :cond_6
    iget-boolean p0, p0, Ll/ewa0;->P:Z

    .line 194
    .line 195
    return p0

    .line 196
    :cond_7
    :goto_0
    return v1
.end method

.method public final synthetic l0(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/t3m;->P1()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Ll/s7m;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 25
    .line 26
    const-string v3, "profile"

    .line 27
    .line 28
    invoke-interface {p1, v1, v0, v2, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cq(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v1, Ll/xva0;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/xva0;-><init>(Ll/ewa0;)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ll/yva0;

    .line 38
    .line 39
    invoke-direct {v2}, Ll/yva0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-interface {p1}, Ll/t3m;->E1()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-interface {p1}, Ll/t3m;->from()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p1}, Ll/zbj;->a(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    const/4 p1, 0x1

    .line 74
    iput-boolean p1, p0, Ll/ewa0;->P:Z

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-interface {p1}, Ll/t3m;->O1()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_2

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentHasMoments(Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iput-boolean p1, p0, Ll/ewa0;->P:Z

    .line 104
    .line 105
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/on2;->p()Ll/ner;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    new-instance v0, Ll/zva0;

    .line 110
    .line 111
    invoke-direct {v0, p0}, Ll/zva0;-><init>(Ll/ewa0;)V

    .line 112
    .line 113
    .line 114
    invoke-interface {p1, v0}, Ll/ner;->duringCreated(Ll/pcj;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    new-instance v0, Ll/awa0;

    .line 119
    .line 120
    invoke-direct {v0, p0}, Ll/awa0;-><init>(Ll/ewa0;)V

    .line 121
    .line 122
    .line 123
    new-instance v1, Ll/bwa0;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/bwa0;-><init>(Ll/ewa0;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_3
    iput-boolean v0, p0, Ll/ewa0;->P:Z

    .line 137
    .line 138
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-interface {p0}, Ll/t3m;->t1()V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public final synthetic m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ewa0;->v0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->I1()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/ewa0;->L:Ll/vg60;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public p0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "owner_id"

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    filled-new-array {p0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "e_moment"

    .line 20
    .line 21
    const-string v1, "p_suggest_user_profile_info_view"

    .line 22
    .line 23
    invoke-static {v0, v1, p0}, Ll/sfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final q0(Ll/vg60;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/u11;->c()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/ewa0;->P:Z

    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Ll/s7m;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v1, v2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-interface {v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v2}, Ll/hbs;->a()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v2}, Ll/s7m;->userId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v1, v2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    :cond_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    const/4 v3, 0x0

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    iput-boolean v3, p0, Ll/ewa0;->P:Z

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    invoke-virtual {p0}, Ll/ewa0;->n0()Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    const/4 v2, 0x1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iput-boolean v2, p0, Ll/ewa0;->P:Z

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-nez v1, :cond_4

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Rc()Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_3

    .line 95
    .line 96
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-interface {v1}, Ll/t3m;->P1()Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-eqz v1, :cond_3

    .line 105
    .line 106
    move v3, v2

    .line 107
    :cond_3
    iput-boolean v3, p0, Ll/ewa0;->P:Z

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_4
    iput-boolean v2, p0, Ll/ewa0;->P:Z

    .line 111
    .line 112
    :goto_0
    iget-boolean v1, p0, Ll/ewa0;->P:Z

    .line 113
    .line 114
    if-eq v0, v1, :cond_5

    .line 115
    .line 116
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-interface {p0}, Ll/t3m;->J3()V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_5
    if-eqz v0, :cond_6

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/on2;->h()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_6

    .line 131
    .line 132
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p0, v0, p1}, Ll/ewa0;->s0(Ljava/lang/String;Ll/vg60;)V

    .line 141
    .line 142
    .line 143
    :cond_6
    return-void
.end method

.method public r0(Z)V
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public final s0(Ljava/lang/String;Ll/vg60;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto/16 :goto_2

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Ll/ewa0;->E:Lv/VRelative;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/ewa0;->E:Lv/VRelative;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v2, 0x0

    .line 27
    const/4 v3, 0x0

    .line 28
    const/4 v4, 0x1

    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iget-object v0, p0, Ll/ewa0;->E:Lv/VRelative;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_4

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Rc()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    iget-object p1, p0, Ll/ewa0;->D:Landroid/widget/RelativeLayout;

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/ewa0;->E:Lv/VRelative;

    .line 55
    .line 56
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/ewa0;->I:Lv/VText;

    .line 60
    .line 61
    invoke-virtual {p1, v2, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/ewa0;->G:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {p1, v2, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Ll/luh;->j()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_2

    .line 78
    .line 79
    invoke-static {}, Ll/luh;->f()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    :cond_2
    iget-object p2, p0, Ll/ewa0;->I:Lv/VText;

    .line 84
    .line 85
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/ewa0;->J:Lv/VText;

    .line 89
    .line 90
    invoke-static {}, Ll/luh;->i()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/ewa0;->G:Lv/VText;

    .line 98
    .line 99
    invoke-static {}, Ll/luh;->g()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    invoke-static {}, Ll/luh;->h()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    if-eqz p2, :cond_3

    .line 115
    .line 116
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 117
    .line 118
    iget-object p2, p0, Ll/ewa0;->F:Lv/VDraweeView;

    .line 119
    .line 120
    sget v0, Ll/dbc0;->nk:I

    .line 121
    .line 122
    invoke-virtual {p1, p2, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_3
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 127
    .line 128
    iget-object v0, p0, Ll/ewa0;->F:Lv/VDraweeView;

    .line 129
    .line 130
    invoke-virtual {p2, v0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :goto_0
    iget-object p1, p0, Ll/ewa0;->E:Lv/VRelative;

    .line 134
    .line 135
    new-instance p2, Ll/wva0;

    .line 136
    .line 137
    invoke-direct {p2, p0}, Ll/wva0;-><init>(Ll/ewa0;)V

    .line 138
    .line 139
    .line 140
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 141
    .line 142
    .line 143
    iget-boolean p1, p0, Ll/ewa0;->O:Z

    .line 144
    .line 145
    if-nez p1, :cond_7

    .line 146
    .line 147
    invoke-static {}, Ll/luh;->k()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-static {}, Ll/luh;->j()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    const-string v0, "p_suggest_user_profile_info_view"

    .line 156
    .line 157
    invoke-static {p1, p2, v0}, Ll/luh;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    iput-boolean v4, p0, Ll/ewa0;->O:Z

    .line 161
    .line 162
    return-void

    .line 163
    :cond_4
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-interface {v0}, Ll/t3m;->I1()Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-nez v0, :cond_6

    .line 172
    .line 173
    iget-object v0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 174
    .line 175
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-nez v0, :cond_5

    .line 180
    .line 181
    move v0, v4

    .line 182
    goto :goto_1

    .line 183
    :cond_5
    move v0, v3

    .line 184
    :goto_1
    invoke-virtual {p0, v0}, Ll/ewa0;->r0(Z)V

    .line 185
    .line 186
    .line 187
    iget-object v0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 188
    .line 189
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-nez v0, :cond_6

    .line 194
    .line 195
    invoke-virtual {p0}, Ll/ewa0;->x0()V

    .line 196
    .line 197
    .line 198
    iget-object p0, p0, Ll/ewa0;->D:Landroid/widget/RelativeLayout;

    .line 199
    .line 200
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    :cond_6
    iget-object v0, p0, Ll/ewa0;->Q:Ll/vg60;

    .line 205
    .line 206
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    if-eqz v0, :cond_8

    .line 211
    .line 212
    :cond_7
    :goto_2
    return-void

    .line 213
    :cond_8
    iget-object v0, p0, Ll/ewa0;->D:Landroid/widget/RelativeLayout;

    .line 214
    .line 215
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 216
    .line 217
    .line 218
    invoke-static {}, Ll/u11;->c()V

    .line 219
    .line 220
    .line 221
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-interface {v0, p1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 230
    .line 231
    .line 232
    move-result-object v5

    .line 233
    invoke-interface {v5}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 234
    .line 235
    .line 236
    move-result-object v5

    .line 237
    invoke-interface {v5}, Ll/hbs;->a()Z

    .line 238
    .line 239
    .line 240
    move-result v5

    .line 241
    if-eqz v5, :cond_9

    .line 242
    .line 243
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-interface {v0, p1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    :cond_9
    iget-object p1, p2, Ll/vg60;->a:Ljava/util/List;

    .line 252
    .line 253
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 254
    .line 255
    .line 256
    move-result p1

    .line 257
    if-nez p1, :cond_a

    .line 258
    .line 259
    iget-object p1, p0, Ll/ewa0;->u:Landroid/widget/LinearLayout;

    .line 260
    .line 261
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 262
    .line 263
    .line 264
    goto/16 :goto_9

    .line 265
    .line 266
    :cond_a
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result p1

    .line 270
    if-eqz p1, :cond_b

    .line 271
    .line 272
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    if-eqz p1, :cond_b

    .line 277
    .line 278
    iget-object p1, p0, Ll/ewa0;->u:Landroid/widget/LinearLayout;

    .line 279
    .line 280
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 281
    .line 282
    .line 283
    goto :goto_3

    .line 284
    :cond_b
    iget-object p1, p0, Ll/ewa0;->u:Landroid/widget/LinearLayout;

    .line 285
    .line 286
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 287
    .line 288
    .line 289
    :goto_3
    iput-boolean v4, p0, Ll/ewa0;->P:Z

    .line 290
    .line 291
    iget-object p1, p0, Ll/ewa0;->x:Lv/VDraweeView;

    .line 292
    .line 293
    iget-object v0, p0, Ll/ewa0;->z:Lv/VDraweeView;

    .line 294
    .line 295
    iget-object v5, p0, Ll/ewa0;->B:Lv/VDraweeView;

    .line 296
    .line 297
    filled-new-array {p1, v0, v5}, [Lv/VDraweeView;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    invoke-virtual {p0}, Ll/ewa0;->f0()Z

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    if-eqz v0, :cond_c

    .line 306
    .line 307
    invoke-virtual {p0, p2}, Ll/ewa0;->w0(Ll/vg60;)Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-eqz v0, :cond_c

    .line 312
    .line 313
    invoke-virtual {p0}, Ll/ewa0;->x0()V

    .line 314
    .line 315
    .line 316
    invoke-direct {p0}, Ll/ewa0;->t0()V

    .line 317
    .line 318
    .line 319
    return-void

    .line 320
    :cond_c
    move v0, v3

    .line 321
    move v5, v0

    .line 322
    :goto_4
    const/4 v6, 0x3

    .line 323
    if-ge v0, v6, :cond_10

    .line 324
    .line 325
    iget-object v7, p2, Ll/vg60;->a:Ljava/util/List;

    .line 326
    .line 327
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 328
    .line 329
    .line 330
    move-result v7

    .line 331
    if-ge v5, v7, :cond_10

    .line 332
    .line 333
    iget-object v7, p2, Ll/vg60;->a:Ljava/util/List;

    .line 334
    .line 335
    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v7

    .line 339
    check-cast v7, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 340
    .line 341
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 342
    .line 343
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 344
    .line 345
    .line 346
    move-result-object v7

    .line 347
    :cond_d
    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 348
    .line 349
    .line 350
    move-result v8

    .line 351
    if-eqz v8, :cond_f

    .line 352
    .line 353
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 354
    .line 355
    .line 356
    move-result-object v8

    .line 357
    check-cast v8, Lcom/p1/mobile/putong/data/Media;

    .line 358
    .line 359
    if-ge v0, v6, :cond_d

    .line 360
    .line 361
    instance-of v9, v8, Lcom/p1/mobile/putong/data/Picture;

    .line 362
    .line 363
    if-eqz v9, :cond_e

    .line 364
    .line 365
    aget-object v9, p1, v0

    .line 366
    .line 367
    invoke-static {v9, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 368
    .line 369
    .line 370
    sget-object v9, Ll/uqb0;->G:Ll/fsb0;

    .line 371
    .line 372
    aget-object v10, p1, v0

    .line 373
    .line 374
    check-cast v8, Lcom/p1/mobile/putong/data/Picture;

    .line 375
    .line 376
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 377
    .line 378
    .line 379
    move-result-object v8

    .line 380
    invoke-virtual {v9, v10, v8}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 381
    .line 382
    .line 383
    aget-object v8, p1, v0

    .line 384
    .line 385
    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 386
    .line 387
    .line 388
    move-result-object v8

    .line 389
    check-cast v8, Ll/wlj;

    .line 390
    .line 391
    invoke-virtual {v8, v2}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 392
    .line 393
    .line 394
    :goto_6
    add-int/lit8 v0, v0, 0x1

    .line 395
    .line 396
    goto :goto_5

    .line 397
    :cond_e
    instance-of v9, v8, Lcom/p1/mobile/putong/data/Video;

    .line 398
    .line 399
    if-eqz v9, :cond_d

    .line 400
    .line 401
    check-cast v8, Lcom/p1/mobile/putong/data/Video;

    .line 402
    .line 403
    iget-object v9, v8, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 404
    .line 405
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 406
    .line 407
    .line 408
    move-result v9

    .line 409
    if-eqz v9, :cond_d

    .line 410
    .line 411
    iget-object v9, v8, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 412
    .line 413
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 414
    .line 415
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 416
    .line 417
    .line 418
    move-result v9

    .line 419
    if-eqz v9, :cond_d

    .line 420
    .line 421
    aget-object v9, p1, v0

    .line 422
    .line 423
    invoke-static {v9, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 424
    .line 425
    .line 426
    sget-object v9, Ll/uqb0;->G:Ll/fsb0;

    .line 427
    .line 428
    aget-object v10, p1, v0

    .line 429
    .line 430
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 431
    .line 432
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 433
    .line 434
    .line 435
    move-result-object v8

    .line 436
    invoke-virtual {v9, v10, v8}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 437
    .line 438
    .line 439
    aget-object v8, p1, v0

    .line 440
    .line 441
    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 442
    .line 443
    .line 444
    move-result-object v8

    .line 445
    check-cast v8, Ll/wlj;

    .line 446
    .line 447
    new-instance v9, Ll/x0e0;

    .line 448
    .line 449
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 450
    .line 451
    .line 452
    move-result-object v10

    .line 453
    invoke-interface {v10}, Ll/nol;->act()Landroid/app/Activity;

    .line 454
    .line 455
    .line 456
    move-result-object v10

    .line 457
    check-cast v10, Lcom/p1/mobile/android/app/Act;

    .line 458
    .line 459
    invoke-virtual {v10}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 460
    .line 461
    .line 462
    move-result-object v10

    .line 463
    sget v11, Ll/dbc0;->Ns:I

    .line 464
    .line 465
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 466
    .line 467
    .line 468
    move-result-object v10

    .line 469
    sget-object v11, Ll/h1e0;->g:Ll/h1e0;

    .line 470
    .line 471
    invoke-direct {v9, v10, v11}, Ll/x0e0;-><init>(Landroid/graphics/drawable/Drawable;Ll/h1e0;)V

    .line 472
    .line 473
    .line 474
    invoke-virtual {v8, v9}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 475
    .line 476
    .line 477
    goto :goto_6

    .line 478
    :cond_f
    add-int/lit8 v5, v5, 0x1

    .line 479
    .line 480
    goto/16 :goto_4

    .line 481
    .line 482
    :cond_10
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 483
    .line 484
    .line 485
    move-result-object v2

    .line 486
    invoke-interface {v2}, Ll/t3m;->from()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v2

    .line 490
    const-string v4, "from_guess_liker_result"

    .line 491
    .line 492
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 493
    .line 494
    .line 495
    move-result v2

    .line 496
    if-eqz v2, :cond_11

    .line 497
    .line 498
    if-nez v0, :cond_11

    .line 499
    .line 500
    iget-object v2, p0, Ll/ewa0;->u:Landroid/widget/LinearLayout;

    .line 501
    .line 502
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 503
    .line 504
    .line 505
    :cond_11
    :goto_7
    if-ge v0, v6, :cond_13

    .line 506
    .line 507
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 508
    .line 509
    aget-object v2, p1, v0

    .line 510
    .line 511
    invoke-virtual {v1, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 512
    .line 513
    .line 514
    if-nez v0, :cond_12

    .line 515
    .line 516
    aget-object v1, p1, v0

    .line 517
    .line 518
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 519
    .line 520
    .line 521
    goto :goto_8

    .line 522
    :cond_12
    aget-object v1, p1, v0

    .line 523
    .line 524
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 525
    .line 526
    .line 527
    :goto_8
    add-int/lit8 v0, v0, 0x1

    .line 528
    .line 529
    goto :goto_7

    .line 530
    :cond_13
    :goto_9
    iput-object p2, p0, Ll/ewa0;->Q:Ll/vg60;

    .line 531
    .line 532
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/ewa0;->L:Ll/vg60;

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ewa0;->s0(Ljava/lang/String;Ll/vg60;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public u0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ewa0;->M:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final w0(Ll/vg60;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "FEED_INSERT_PART_ATTENTION_BUTTON_DATA_MOMENT"

    .line 15
    .line 16
    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    const-string p1, "FEED_INSERT_PART_ATTENTION_BUTTON_DATA_USER_ID"

    .line 20
    .line 21
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    const-string p1, "FEED_INSERT_PART_ATTENTION_BUTTON_DATA_CLICK"

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ewa0;->b0()Ll/x20;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    new-instance p1, Ll/ewa0$a;

    .line 34
    .line 35
    invoke-direct {p1, p0}, Ll/ewa0$a;-><init>(Ll/ewa0;)V

    .line 36
    .line 37
    .line 38
    const-string v0, "FEED_INSERT_PART_ATTENTION_BUTTON_MOMENT_VIEW_PROCESS"

    .line 39
    .line 40
    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    iget-object v2, p0, Ll/ewa0;->D:Landroid/widget/RelativeLayout;

    .line 58
    .line 59
    iget-object p0, p0, Ll/ewa0;->v:Lv/VLinear;

    .line 60
    .line 61
    const/4 v3, 0x5

    .line 62
    new-array v3, v3, [Landroid/view/View;

    .line 63
    .line 64
    const/4 v4, 0x0

    .line 65
    aput-object v2, v3, v4

    .line 66
    .line 67
    const/4 v2, 0x1

    .line 68
    const/4 v4, 0x0

    .line 69
    aput-object v4, v3, v2

    .line 70
    .line 71
    const/4 v5, 0x2

    .line 72
    aput-object v4, v3, v5

    .line 73
    .line 74
    const/4 v5, 0x3

    .line 75
    aput-object v4, v3, v5

    .line 76
    .line 77
    const/4 v4, 0x4

    .line 78
    aput-object p0, v3, v4

    .line 79
    .line 80
    invoke-interface {p1, v0, v2, v1, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->useFeedInsertViewProxy(Lcom/p1/mobile/android/app/Act;ILjava/util/Map;[Landroid/view/View;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    return p0
.end method

.method public final x0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ewa0;->K:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
