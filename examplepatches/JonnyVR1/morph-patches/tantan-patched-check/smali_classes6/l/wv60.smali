.class public Ll/wv60;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Ll/v0q;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/vw60;",
        ">;",
        "Ll/v0q;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

.field public b:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public c:Ll/n570;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:I

.field public g:I

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Lcom/p1/mobile/putong/data/User;

.field public k:Z

.field public l:Ll/bkj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation
.end field

.field public m:Z

.field public n:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "-1"

    .line 5
    .line 6
    iput-object v0, p0, Ll/wv60;->h:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/wv60;->n:Z

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 12
    .line 13
    iput-object p1, p0, Ll/wv60;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 14
    .line 15
    return-void
.end method

.method private E0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jka;->g8(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/iv60;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/iv60;-><init>(Ll/wv60;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/jv60;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/jv60;-><init>(Ll/wv60;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic G0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/vw60;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/vw60;->r0(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic H0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/vw60;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/vw60;->r0(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic P0(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/vw60;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/vw60;->q0(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic V0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/vw60;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/vw60;->u0(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private c1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    iget-object v2, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Ll/jka;->f8(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/kv60;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/kv60;-><init>(Ll/wv60;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/lv60;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/lv60;-><init>(Ll/wv60;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic e0(Ll/wv60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wv60;->N0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/wv60;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wv60;->O0(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic g0(Ll/wv60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wv60;->W0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/wv60;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wv60;->I0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic i0(Ll/wv60;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wv60;->G0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic j0(Ll/wv60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wv60;->H0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ll/wv60;Lcom/p1/mobile/putong/data/ConversationStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wv60;->S0(Lcom/p1/mobile/putong/data/ConversationStatus;)V

    return-void
.end method

.method public static synthetic l0(Ll/wv60;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wv60;->Q0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic m0(Ll/wv60;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wv60;->P0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic n0(Ll/wv60;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wv60;->L0(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method

.method public static synthetic o0(Ll/wv60;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wv60;->J0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic p0(Ll/wv60;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wv60;->U0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic q0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r0(Ll/wv60;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wv60;->R0(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic s0(Ll/wv60;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wv60;->V0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private y0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wv60;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/wv60;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->Q0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/wv60;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/wv60;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 14
    .line 15
    return-object p0
.end method

.method private z0()Ll/v670;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wv60;->y0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->A:Ll/v670;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public final A0()Ll/y670;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wv60;->y0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 6
    .line 7
    return-object p0
.end method

.method public C0()Ll/n570;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/wv60;->A0()Ll/y670;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/y670;->H()V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/hu60;

    .line 9
    .line 10
    iget-object v1, p0, Ll/wv60;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 11
    .line 12
    const-string v2, "from_profile_opt"

    .line 13
    .line 14
    iget-object v3, p0, Ll/wv60;->e:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iget-object p0, p0, Ll/wv60;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 21
    .line 22
    invoke-direct {v0, v1, v2, p0}, Ll/hu60;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;ZLl/n2m;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public D0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wv60;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "from"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/wv60;->e:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Ll/wv60;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "user_id"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p0, Ll/wv60;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "page_type"

    .line 36
    .line 37
    const/4 v2, -0x1

    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/wv60;->f:I

    .line 43
    .line 44
    iget-object v0, p0, Ll/wv60;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "selected_item_position"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput v0, p0, Ll/wv60;->g:I

    .line 57
    .line 58
    iget-object v0, p0, Ll/wv60;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "target_moment_id"

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Ll/wv60;->h:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v0, p0, Ll/wv60;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const-string v1, "start_home_card"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput-boolean v0, p0, Ll/wv60;->m:Z

    .line 85
    .line 86
    invoke-static {}, Ll/cmg;->Y()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_0

    .line 91
    .line 92
    iget-boolean v0, p0, Ll/wv60;->i:Z

    .line 93
    .line 94
    if-nez v0, :cond_0

    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v1, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 101
    .line 102
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->se(Ljava/lang/String;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    new-instance v1, Ll/hv60;

    .line 111
    .line 112
    invoke-direct {v1, p0}, Ll/hv60;-><init>(Ll/wv60;)V

    .line 113
    .line 114
    .line 115
    new-instance v2, Ll/nv60;

    .line 116
    .line 117
    invoke-direct {v2, p0}, Ll/nv60;-><init>(Ll/wv60;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 125
    .line 126
    .line 127
    :cond_0
    invoke-static {}, Ll/cmg;->k0()Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_1

    .line 132
    .line 133
    invoke-direct {p0}, Ll/wv60;->E0()V

    .line 134
    .line 135
    .line 136
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 137
    .line 138
    iget-object v0, v0, Ll/jka;->z0:Lrx/subjects/a;

    .line 139
    .line 140
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v1, Ll/ov60;

    .line 145
    .line 146
    invoke-direct {v1, p0}, Ll/ov60;-><init>(Ll/wv60;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 154
    .line 155
    .line 156
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 157
    .line 158
    iget-object v0, v0, Ll/jka;->t1:Lrx/subjects/b;

    .line 159
    .line 160
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    new-instance v1, Ll/pv60;

    .line 165
    .line 166
    invoke-direct {v1, p0}, Ll/pv60;-><init>(Ll/wv60;)V

    .line 167
    .line 168
    .line 169
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 174
    .line 175
    .line 176
    :cond_1
    return-void
.end method

.method public F0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wv60;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic I0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wv60;->E0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic J0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wv60;->E0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L0(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/vw60;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vw60;->U()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    check-cast p0, Ll/vw60;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/vw60;->v0(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic N0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/vw60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vw60;->U()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic O0(Ll/bkj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wv60;->l:Ll/bkj0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic Q0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/wv60;->n:Z

    .line 3
    .line 4
    invoke-direct {p0}, Ll/wv60;->c1()V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p1, Ll/vw60;

    .line 24
    .line 25
    iget-object p0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Ll/vw60;->u0(Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-direct {p0}, Ll/wv60;->c1()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic R0(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance v0, Ll/mv60;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/mv60;-><init>(Ll/wv60;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-boolean p0, p0, Ll/wv60;->n:Z

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const-wide/16 p0, 0x3e8

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-wide/16 p0, 0x0

    .line 18
    .line 19
    :goto_0
    invoke-static {p2, v0, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic S0(Lcom/p1/mobile/putong/data/ConversationStatus;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/vw60;

    .line 4
    .line 5
    invoke-static {p1}, Ll/ksg;->U(Lcom/p1/mobile/putong/data/ConversationStatus;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/vw60;->t0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic U0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/vw60;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/vw60;->u0(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic W0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/vw60;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/vw60;->u0(Lcom/p1/mobile/putong/data/User;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public X0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/wv60;->k:Z

    .line 3
    .line 4
    return-void
.end method

.method public Y0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/wv60;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/mrb0;->M(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Ll/vw60;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/vw60;->u0(Lcom/p1/mobile/putong/data/User;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {}, Ll/mrb0;->B()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Ll/qv60;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/qv60;-><init>(Ll/wv60;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    invoke-direct {p0}, Ll/wv60;->c1()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v1}, Ll/kyi;->b(Ljava/lang/String;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/rv60;

    .line 66
    .line 67
    invoke-direct {v1, p0, p1}, Ll/rv60;-><init>(Ll/wv60;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ab(Ljava/lang/String;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    new-instance v0, Ll/sv60;

    .line 90
    .line 91
    invoke-direct {v0, p0}, Ll/sv60;-><init>(Ll/wv60;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 5
    .line 6
    const-string v1, "album"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/jka;->mc(Ljava/lang/String;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/tv60;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/tv60;-><init>(Ll/wv60;)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Ll/uv60;

    .line 22
    .line 23
    invoke-direct {v2}, Ll/uv60;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/cmg;->K()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-boolean v0, p0, Ll/wv60;->i:Z

    .line 40
    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 44
    .line 45
    iget-object v0, v0, Ll/jka;->S0:Lrx/subjects/b;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/vv60;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/vv60;-><init>(Ll/wv60;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public a1()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput-boolean v0, p0, Ll/wv60;->i:Z

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 18
    .line 19
    iget-object v1, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v1, Ll/vw60;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ll/vw60;->u0(Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/wv60;->Y0(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public b1()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 6
    .line 7
    const-string v1, "receiver_user_id"

    .line 8
    .line 9
    const-string v2, "owner_id"

    .line 10
    .line 11
    const-string v3, "p_album"

    .line 12
    .line 13
    const-string v4, "e_follow"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->a2()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v5, "p_christmas_profile"

    .line 28
    .line 29
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v2, "album_from"

    .line 44
    .line 45
    invoke-static {v2, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object p0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    filled-new-array {v0, v2, p0}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {v4, v3, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object p0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {v4, v3, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public t0(Ll/pf60;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/wv60;->z0()Ll/v670;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1, p2}, Ll/v670;->X0(Ll/pf60;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/wv60;->x0()Ll/n570;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p2, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->invalidateOptionsMenu()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p0, Ll/vw60;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/vw60;->u0(Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public u0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 16
    .line 17
    const-string v1, "default"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 30
    .line 31
    const-string v1, "followed"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 44
    .line 45
    const-string v1, "unfollow"

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 58
    .line 59
    const-string v1, "unknown_"

    .line 60
    .line 61
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 71
    .line 72
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 83
    .line 84
    const-string v1, "following"

    .line 85
    .line 86
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_1

    .line 91
    .line 92
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 97
    .line 98
    const-string v1, "matched"

    .line 99
    .line 100
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    :cond_1
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 109
    .line 110
    const-string v1, "owner_id"

    .line 111
    .line 112
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v1, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 117
    .line 118
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 119
    .line 120
    const-string v2, "receiver_user_id"

    .line 121
    .line 122
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    const-string v1, "e_cancelfollow"

    .line 131
    .line 132
    const-string v2, "p_album"

    .line 133
    .line 134
    invoke-static {v1, v2, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 152
    .line 153
    check-cast p0, Ll/vw60;

    .line 154
    .line 155
    invoke-virtual {p0, v0}, Ll/vw60;->G0(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/wv60;->b1()V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 163
    .line 164
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 165
    .line 166
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 167
    .line 168
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 169
    .line 170
    if-eqz v0, :cond_3

    .line 171
    .line 172
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 173
    .line 174
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 179
    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    iget-object p0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 189
    .line 190
    const/4 v2, 0x1

    .line 191
    invoke-virtual {v0, v1, p0, v2}, Ll/jka;->f7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Z)Lrx/c;

    .line 192
    .line 193
    .line 194
    :cond_4
    return-void
.end method

.method public w1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wv60;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public x0()Ll/n570;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wv60;->c:Ll/n570;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/wv60;->z0()Ll/v670;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Ll/v670;->b:Ll/n570;

    .line 10
    .line 11
    iput-object v0, p0, Ll/wv60;->c:Ll/n570;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/wv60;->c:Ll/n570;

    .line 14
    .line 15
    return-object p0
.end method
