.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Landroid/widget/LinearLayout;

.field public e:Landroid/widget/LinearLayout;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VFrame;

.field public l:Lv/VImage;

.field public m:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "following"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {p1, p0, v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToPhotoAlbumFansAct(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->T(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "fans"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {p1, p0, v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToPhotoAlbumFansAct(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/x9f0;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->Z3:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "marryMode"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->m:Lv/VText;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string v0, "\u60f3\u7ed3\u5a5a"

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->l:Lv/VImage;

    .line 29
    .line 30
    sget v1, Ll/dbc0;->Qd:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 33
    .line 34
    .line 35
    const-string v0, "marry"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const-string v0, "\u60f3\u604b\u7231"

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->l:Lv/VImage;

    .line 44
    .line 45
    sget v1, Ll/dbc0;->Pd:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    const-string v0, "love"

    .line 51
    .line 52
    :goto_0
    const-string v1, "mode_select"

    .line 53
    .line 54
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    filled-new-array {v1}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const-string v2, "e_mode_entrance"

    .line 63
    .line 64
    const-string v3, "p_navigation_view"

    .line 65
    .line 66
    invoke-static {v2, v3, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->k:Lv/VFrame;

    .line 70
    .line 71
    new-instance v2, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2$a;

    .line 72
    .line 73
    invoke-direct {v2, p0, v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->c:Lv/VText;

    .line 80
    .line 81
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->c:Lv/VText;

    .line 87
    .line 88
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->f:Landroid/widget/TextView;

    .line 94
    .line 95
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 96
    .line 97
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 98
    .line 99
    iget-object v1, v1, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    .line 100
    .line 101
    iget v1, v1, Lcom/p1/mobile/putong/data/FollowshipCounter;->followers:I

    .line 102
    .line 103
    invoke-static {v1}, Ll/q8g0;->t(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->i:Landroid/widget/TextView;

    .line 111
    .line 112
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 113
    .line 114
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 115
    .line 116
    iget-object p2, p2, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    .line 117
    .line 118
    iget p2, p2, Lcom/p1/mobile/putong/data/FollowshipCounter;->followings:I

    .line 119
    .line 120
    invoke-static {p2}, Ll/q8g0;->t(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->e:Landroid/widget/LinearLayout;

    .line 128
    .line 129
    new-instance v0, Ll/v9f0;

    .line 130
    .line 131
    invoke-direct {v0, p1}, Ll/v9f0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 132
    .line 133
    .line 134
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->h:Landroid/widget/LinearLayout;

    .line 138
    .line 139
    new-instance p2, Ll/w9f0;

    .line 140
    .line 141
    invoke-direct {p2, p1}, Ll/w9f0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 142
    .line 143
    .line 144
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public V(Lcom/p1/mobile/android/app/Act;Ll/pol;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p2, p1, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/u9f0;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/u9f0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->S(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
