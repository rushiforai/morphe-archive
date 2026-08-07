.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lv/VDraweeView;

.field public i:Lv/VDraweeView;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public m:Ljava/lang/String;

.field public n:Ll/keh;

.field public o:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field public p:Landroid/widget/PopupWindow;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/leh;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/leh;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->n:Ll/keh;

    .line 10
    .line 11
    new-instance p1, Ll/shh;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/shh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;)V

    .line 14
    .line 15
    .line 16
    const/16 v0, 0x190

    .line 17
    .line 18
    invoke-static {v0, p1}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->o:Ll/y20;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    new-instance p1, Ll/leh;

    invoke-direct {p1}, Ll/leh;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->n:Ll/keh;

    .line 27
    new-instance p1, Ll/shh;

    invoke-direct {p1, p0}, Ll/shh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;)V

    const/16 p2, 0x190

    .line 28
    invoke-static {p2, p1}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->o:Ll/y20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    new-instance p1, Ll/leh;

    invoke-direct {p1}, Ll/leh;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->n:Ll/keh;

    .line 31
    new-instance p1, Ll/shh;

    invoke-direct {p1, p0}, Ll/shh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;)V

    const/16 p2, 0x190

    .line 32
    invoke-static {p2, p1}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->o:Ll/y20;

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->O(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic M(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p1, p1, Ll/jka;->v1:Lrx/subjects/b;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->R()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance p1, Ll/pf60;

    .line 2
    .line 3
    const-string v0, "post_guide_type"

    .line 4
    .line 5
    const-string v1, "5"

    .line 6
    .line 7
    invoke-direct {p1, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    filled-new-array {p1}, [Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "e_moment_post"

    .line 15
    .line 16
    const-string v1, "p_navigation_view"

    .line 17
    .line 18
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/orb0;->I()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->n:Ll/keh;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, 0x0

    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->o:Ll/y20;

    .line 43
    .line 44
    const-string v2, "from_mine_tab_album"

    .line 45
    .line 46
    invoke-interface {p1, v0, v2, v1, p0}, Ll/keh;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ll/y20;)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ll/l94;->e()Ll/l94;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/l94;->j()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->L(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->M(Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xhh;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L(Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 v0, 0x312

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->p:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->p:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->p:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lcom/p1/mobile/putong/feed/data/MomentViewerBox;Ljava/lang/String;)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->m:Ljava/lang/String;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->R()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->R()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const-string v0, "from_mine_tab_album"

    .line 24
    .line 25
    invoke-static {v0, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-nez p3, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->R()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    const/4 v0, 0x4

    .line 42
    if-ge p3, v0, :cond_3

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->R()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_3
    sget-object p3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 49
    .line 50
    iget-object p3, p3, Ll/jka;->E1:Ll/byd0;

    .line 51
    .line 52
    invoke-virtual {p3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    check-cast p3, Ljava/lang/Long;

    .line 57
    .line 58
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    invoke-static {v0, v1}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    if-eqz p3, :cond_4

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    const/16 v0, 0x8

    .line 73
    .line 74
    if-ne p3, v0, :cond_4

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->R()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_4
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 81
    .line 82
    const/high16 v0, 0x41200000    # 10.0f

    .line 83
    .line 84
    invoke-static {p3, v0}, Ll/ezq;->b(Landroid/view/View;F)V

    .line 85
    .line 86
    .line 87
    sget-object p3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 88
    .line 89
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 90
    .line 91
    const/4 v1, 0x0

    .line 92
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lcom/p1/mobile/putong/feed/data/ViewersBox;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/ViewersBox;->userId:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p3, v0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 105
    .line 106
    iget-object v2, p2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 107
    .line 108
    const/4 v3, 0x1

    .line 109
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    check-cast v2, Lcom/p1/mobile/putong/feed/data/ViewersBox;

    .line 114
    .line 115
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/ViewersBox;->userId:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 122
    .line 123
    iget-object v3, p2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 124
    .line 125
    const/4 v4, 0x2

    .line 126
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    check-cast v3, Lcom/p1/mobile/putong/feed/data/ViewersBox;

    .line 131
    .line 132
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/ViewersBox;->userId:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v2, v3}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 139
    .line 140
    iget-object v4, p2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 141
    .line 142
    const/4 v5, 0x3

    .line 143
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v4

    .line 147
    check-cast v4, Lcom/p1/mobile/putong/feed/data/ViewersBox;

    .line 148
    .line 149
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/ViewersBox;->userId:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {v3, v4}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    if-eqz p3, :cond_6

    .line 156
    .line 157
    if-eqz v0, :cond_6

    .line 158
    .line 159
    if-eqz v2, :cond_6

    .line 160
    .line 161
    if-nez v3, :cond_5

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_5
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 166
    .line 167
    .line 168
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 169
    .line 170
    iget-object v1, v1, Ll/jka;->E1:Ll/byd0;

    .line 171
    .line 172
    invoke-static {}, Ll/pzi0;->o()J

    .line 173
    .line 174
    .line 175
    move-result-wide v4

    .line 176
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    invoke-virtual {v1, v4}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 184
    .line 185
    iget-object v1, v1, Ll/jka;->v1:Lrx/subjects/b;

    .line 186
    .line 187
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 188
    .line 189
    invoke-virtual {v1, v4}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 193
    .line 194
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->f:Lv/VDraweeView;

    .line 195
    .line 196
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 197
    .line 198
    .line 199
    move-result-object p3

    .line 200
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 201
    .line 202
    .line 203
    move-result-object p3

    .line 204
    invoke-virtual {v1, v4, p3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 205
    .line 206
    .line 207
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 208
    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->g:Lv/VDraweeView;

    .line 210
    .line 211
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {p3, v1, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 220
    .line 221
    .line 222
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 223
    .line 224
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->h:Lv/VDraweeView;

    .line 225
    .line 226
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-virtual {p3, v0, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 235
    .line 236
    .line 237
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 238
    .line 239
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->i:Lv/VDraweeView;

    .line 240
    .line 241
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    invoke-virtual {p3, v0, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 250
    .line 251
    .line 252
    sget-object p3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 253
    .line 254
    iget-object p3, p3, Ll/jka;->w1:Lrx/subjects/b;

    .line 255
    .line 256
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 257
    .line 258
    .line 259
    move-result-object p3

    .line 260
    new-instance v0, Ll/thh;

    .line 261
    .line 262
    invoke-direct {v0, p0}, Ll/thh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;)V

    .line 263
    .line 264
    .line 265
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-virtual {p3, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 270
    .line 271
    .line 272
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    new-instance p3, Ll/uhh;

    .line 277
    .line 278
    invoke-direct {p3}, Ll/uhh;-><init>()V

    .line 279
    .line 280
    .line 281
    invoke-virtual {p1, p3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    new-instance p3, Ll/vhh;

    .line 286
    .line 287
    invoke-direct {p3, p0}, Ll/vhh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;)V

    .line 288
    .line 289
    .line 290
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 291
    .line 292
    .line 293
    move-result-object p3

    .line 294
    invoke-virtual {p1, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 295
    .line 296
    .line 297
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->j:Landroid/widget/TextView;

    .line 298
    .line 299
    new-instance p3, Ljava/lang/StringBuilder;

    .line 300
    .line 301
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 302
    .line 303
    .line 304
    iget p2, p2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->count:I

    .line 305
    .line 306
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    const-string p2, "\u4f4d\u5973\u751f\u6d4f\u89c8\u4e86\u4f60\u7684\u52a8\u6001"

    .line 310
    .line 311
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p2

    .line 318
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 319
    .line 320
    .line 321
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 322
    .line 323
    new-instance p2, Ll/whh;

    .line 324
    .line 325
    invoke-direct {p2, p0}, Ll/whh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;)V

    .line 326
    .line 327
    .line 328
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 329
    .line 330
    .line 331
    return-void

    .line 332
    :cond_6
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->R()V

    .line 333
    .line 334
    .line 335
    return-void
.end method

.method public final R()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    const/16 v0, 0x8

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
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

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->I(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/16 v0, 0x8

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
