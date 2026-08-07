.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/l6c;
.implements Ll/jn50;
.implements Ll/omg;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "Ll/l6c<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
        ">;>;",
        "Ll/jn50;",
        "Ll/omg;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

.field public B:Lv/VLinear;

.field public C:Lv/VDraweeView;

.field public D:Lv/VText;

.field public E:Ll/b370;

.field public F:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;"
        }
    .end annotation
.end field

.field public G:Ll/a7;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;>;"
        }
    .end annotation
.end field

.field public H:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

.field public I:Ll/zxh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/zxh<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field public J:Ll/v370;

.field public K:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

.field public L:Landroid/widget/TextView;

.field public M:Ll/byd0;

.field public N:Z

.field public O:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;"
        }
    .end annotation
.end field

.field public P:Z

.field public z:Lv/VPullDownRefreshLayout;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->F:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/v370;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/v370;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->J:Ll/v370;

    .line 17
    .line 18
    new-instance v0, Ll/byd0;

    .line 19
    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "feed_interaction_attention_toast"

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-wide/16 v2, 0x0

    .line 43
    .line 44
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->M:Ll/byd0;

    .line 52
    .line 53
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->b5(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->a5()V

    return-void
.end method

.method public static synthetic O4(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

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

.method public static synthetic P4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q4(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic R4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->c5(Ljava/lang/String;)V

    return-void
.end method

.method private g5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->J:Ll/v370;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v370;->H()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/cah;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/cah;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/dah;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/dah;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public G3(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public L3()V
    .locals 0

    .line 1
    return-void
.end method

.method public M1(Ljava/lang/String;I)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->J:Ll/v370;

    .line 2
    .line 3
    sget-object v0, Ll/umh;->j:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p2, v0, p1}, Ll/v370;->w(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ll/eah;

    .line 14
    .line 15
    invoke-direct {p2, p0}, Ll/eah;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/fah;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/fah;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public T0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->setFrom(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hah;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public U4(Lcom/p1/mobile/putong/feed/data/MomentActivity;)V
    .locals 9

    .line 1
    const-string v0, "other_user_id"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;->getValue()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "interact_type"

    .line 16
    .line 17
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "e_interactcell_message"

    .line 26
    .line 27
    const-string v2, "p_interactcell_detail"

    .line 28
    .line 29
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 33
    .line 34
    iget-object v0, v0, Ll/jka;->H0:Ljava/util/Map;

    .line 35
    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 45
    .line 46
    sget-object v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;->Comment:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 47
    .line 48
    if-ne v1, v3, :cond_2

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->X4(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    const-string v1, "comment"

    .line 61
    .line 62
    const-string v3, "reply"

    .line 63
    .line 64
    if-eqz p1, :cond_0

    .line 65
    .line 66
    move-object p1, v3

    .line 67
    goto :goto_0

    .line 68
    :cond_0
    move-object p1, v1

    .line 69
    :goto_0
    const-string v4, "comment_detail"

    .line 70
    .line 71
    invoke-static {v4, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object v5, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v5, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 78
    .line 79
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 80
    .line 81
    const-string v6, "moment_id"

    .line 82
    .line 83
    invoke-static {v6, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    iget-object v7, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v7, Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    iget-object v7, v7, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 92
    .line 93
    const-string v8, "comment_user_id"

    .line 94
    .line 95
    invoke-static {v8, v7}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    filled-new-array {p1, v5, v7}, [Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const-string v5, "e_interactcell_comment_like"

    .line 104
    .line 105
    invoke-static {v5, v2, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_1

    .line 113
    .line 114
    move-object v1, v3

    .line 115
    :cond_1
    invoke-static {v4, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 122
    .line 123
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v6, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 130
    .line 131
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 132
    .line 133
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {v8, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    filled-new-array {p1, v0, p0}, [Ll/pf60;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    const-string p1, "e_interactcell_comment_reply"

    .line 144
    .line 145
    invoke-static {p1, v2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 146
    .line 147
    .line 148
    :cond_2
    return-void
.end method

.method public final V4()Ll/a7;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/a7<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag$b;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/nog;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {v0, p0}, Ll/nog;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_0
    new-instance v0, Ll/dxg;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v0, p0}, Ll/dxg;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 34
    .line 35
    .line 36
    return-object v0

    .line 37
    :cond_1
    new-instance v0, Ll/obh;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-direct {v0, p0}, Ll/obh;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 44
    .line 45
    .line 46
    return-object v0
.end method

.method public W4()Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 2
    .line 3
    return-object p0
.end method

.method public X4(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ")",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/pf60;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    iget-object v1, v1, Ll/jka;->i0:Ljava/util/Map;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    invoke-direct {p0, v0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method public final Y4()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->L:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Landroid/widget/TextView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->L:Landroid/widget/TextView;

    .line 16
    .line 17
    const-string v1, "\u56de\u5e94\u5173\u6ce8\u4f60\u7684\u4eba\uff0c\u53cc\u65b9\u5373\u53ef\u5f00\u542f\u804a\u5929"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->L:Landroid/widget/TextView;

    .line 23
    .line 24
    const/high16 v1, 0x41800000    # 16.0f

    .line 25
    .line 26
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/high16 v3, 0x41880000    # 17.0f

    .line 31
    .line 32
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v2, v4, v3, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->L:Landroid/widget/TextView;

    .line 48
    .line 49
    const/high16 v1, 0x41700000    # 15.0f

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->L:Landroid/widget/TextView;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const/4 v1, 0x1

    .line 61
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->L:Landroid/widget/TextView;

    .line 65
    .line 66
    const-string v1, "#e6000000"

    .line 67
    .line 68
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->L:Landroid/widget/TextView;

    .line 76
    .line 77
    sget v1, Ll/lbc0;->q1:I

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 80
    .line 81
    .line 82
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 83
    .line 84
    const/4 v1, -0x1

    .line 85
    const/4 v2, -0x2

    .line 86
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 87
    .line 88
    .line 89
    const/high16 v1, 0x41400000    # 12.0f

    .line 90
    .line 91
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 96
    .line 97
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 102
    .line 103
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 108
    .line 109
    const/high16 v1, 0x40000000    # 2.0f

    .line 110
    .line 111
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->L:Landroid/widget/TextView;

    .line 118
    .line 119
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public final Z4()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->M:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    invoke-static {v0, v1, v2, v3}, Ll/p6i;->l(JJ)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    xor-int/lit8 p0, p0, 0x1

    .line 22
    .line 23
    return p0
.end method

.method public a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->n5()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->N:Z

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic a5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->O:Ll/h80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic b5(Ll/bkj0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->h5(Ljava/util/List;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic c5(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->F:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/gah;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/gah;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->j5()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->I:Ll/zxh;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const/4 p1, -0x2

    .line 31
    invoke-interface {p0, p1}, Ll/zxh;->c(I)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public d0()V
    .locals 0

    .line 1
    return-void
.end method

.method public d5(Ljava/util/List;Lcom/p1/mobile/putong/data/Links;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;",
            "Lcom/p1/mobile/putong/data/Links;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->F:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->F:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->j5()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->n5()V

    .line 15
    .line 16
    .line 17
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->N:Z

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->I:Ll/zxh;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->I:Ll/zxh;

    .line 30
    .line 31
    invoke-interface {p1}, Ll/zxh;->b()V

    .line 32
    .line 33
    .line 34
    :cond_0
    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->N:Z

    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->F:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x4

    .line 8
    .line 9
    if-lt p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->F:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-lez p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->G:Ll/a7;

    .line 20
    .line 21
    invoke-interface {p0}, Ll/dsl;->next()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public e5()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->P:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->O:Ll/h80;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/aah;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/aah;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v2, 0x1f4

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;->R()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public f5()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->P:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->L:Landroid/widget/TextView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/16 v0, 0x8

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public getFrom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;->getValue()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h5(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;->W(Ljava/util/List;I)V

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->P:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;->R()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public i5(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
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
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->F:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 25
    .line 26
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 27
    .line 28
    new-instance v3, Ll/bah;

    .line 29
    .line 30
    invoke-direct {v3, v2}, Ll/bah;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 40
    .line 41
    const-string v3, "comment_reply"

    .line 42
    .line 43
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_1

    .line 48
    .line 49
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 50
    .line 51
    const-string v3, "comment"

    .line 52
    .line 53
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-nez v2, :cond_1

    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    iput-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->j5()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->T4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-string v0, "TAB_VALUE"

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 22
    .line 23
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->V4()Ll/a7;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->G:Ll/a7;

    .line 30
    .line 31
    invoke-virtual {p2, p0}, Ll/a7;->a(Ll/l6c;)V

    .line 32
    .line 33
    .line 34
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag$a;

    .line 35
    .line 36
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;)V

    .line 37
    .line 38
    .line 39
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->O:Ll/h80;

    .line 40
    .line 41
    new-instance p2, Ll/b370;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Landroid/view/View;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->O:Ll/h80;

    .line 57
    .line 58
    invoke-direct {p2, v0, v1, p0, v2}, Ll/b370;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Ll/omg;Ll/h80;)V

    .line 59
    .line 60
    .line 61
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->E:Ll/b370;

    .line 62
    .line 63
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;->getValue()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;->setInteractionType(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    new-instance p2, Ll/s8h;

    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->E:Ll/b370;

    .line 86
    .line 87
    invoke-direct {p2, v0}, Ll/s8h;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->k5()V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 94
    .line 95
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;->Attention:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 96
    .line 97
    const/4 v2, -0x2

    .line 98
    const/4 v3, -0x1

    .line 99
    const/4 v4, 0x1

    .line 100
    if-ne v0, v1, :cond_1

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->Z4()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_1

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->Y4()V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->M:Ll/byd0;

    .line 112
    .line 113
    invoke-static {}, Ll/pzi0;->o()J

    .line 114
    .line 115
    .line 116
    move-result-wide v5

    .line 117
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    new-instance v0, Landroid/widget/LinearLayout;

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 131
    .line 132
    .line 133
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 134
    .line 135
    invoke-direct {v1, v3, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 142
    .line 143
    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 147
    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->L:Landroid/widget/TextView;

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p2, v0}, Ll/zzk;->H(Landroid/view/View;)V

    .line 155
    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_1
    new-instance v0, Landroid/widget/LinearLayout;

    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 165
    .line 166
    .line 167
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 168
    .line 169
    invoke-direct {v1, v3, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 179
    .line 180
    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 182
    .line 183
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p2, v0}, Ll/zzk;->H(Landroid/view/View;)V

    .line 187
    .line 188
    .line 189
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 190
    .line 191
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 192
    .line 193
    .line 194
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 195
    .line 196
    const/high16 v0, 0x42d40000    # 106.0f

    .line 197
    .line 198
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    invoke-static {p2, v0}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 203
    .line 204
    .line 205
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 206
    .line 207
    const/4 v0, 0x0

    .line 208
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 209
    .line 210
    .line 211
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->G:Ll/a7;

    .line 212
    .line 213
    invoke-interface {p2}, Ll/dsl;->previous()V

    .line 214
    .line 215
    .line 216
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->z:Lv/VPullDownRefreshLayout;

    .line 217
    .line 218
    invoke-virtual {p2, p0}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 219
    .line 220
    .line 221
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->g5()V

    .line 222
    .line 223
    .line 224
    return-object p1
.end method

.method public j5()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->F:Ljava/util/List;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-gtz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->B:Lv/VLinear;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->z:Lv/VPullDownRefreshLayout;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->E:Ll/b370;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->F:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ll/b370;->G(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->B:Lv/VLinear;

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->z:Lv/VPullDownRefreshLayout;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->C:Lv/VDraweeView;

    .line 46
    .line 47
    sget v3, Ll/lbc0;->f1:I

    .line 48
    .line 49
    invoke-virtual {v0, v1, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->D:Lv/VText;

    .line 53
    .line 54
    const-string v1, "\u4f60\u6ca1\u6709\u6536\u5230\u4efb\u4f55\u6d88\u606f"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 60
    .line 61
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;->Attention:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 62
    .line 63
    if-ne v0, v1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->Z4()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->Y4()V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->B:Lv/VLinear;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->L:Landroid/widget/TextView;

    .line 77
    .line 78
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->M:Ll/byd0;

    .line 82
    .line 83
    invoke-static {}, Ll/pzi0;->o()J

    .line 84
    .line 85
    .line 86
    move-result-wide v0

    .line 87
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    :cond_2
    return-void
.end method

.method public final k5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/z9h;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/z9h;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/z9h;->X()Ll/x20;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;->setClickOuterAction(Ll/x20;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public l5(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->P:Z

    .line 2
    .line 3
    return-void
.end method

.method public m5(Ll/zxh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->I:Ll/zxh;

    .line 2
    .line 3
    return-void
.end method

.method public n5()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->w(Z)Ll/mvc0;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public w2(Ll/mvc0;)V
    .locals 1
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->G:Ll/a7;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->N:Z

    .line 7
    .line 8
    invoke-interface {p1}, Ll/dsl;->previous()V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->g5()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic z0(Ljava/lang/Object;Lcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->d5(Ljava/util/List;Lcom/p1/mobile/putong/data/Links;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
