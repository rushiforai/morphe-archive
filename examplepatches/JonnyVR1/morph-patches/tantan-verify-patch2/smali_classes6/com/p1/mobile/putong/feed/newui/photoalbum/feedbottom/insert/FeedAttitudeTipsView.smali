.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VLinear;

.field public c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public d:Ljava/lang/String;

.field public e:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->g(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->g(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->g(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->i(Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/sog;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final e()Lcom/p1/mobile/android/app/Act;
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

.method public f(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "attitude"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string p0, ""

    .line 27
    .line 28
    :goto_0
    const-string v1, "moment_id"

    .line 29
    .line 30
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "e_attitude_bubble"

    .line 39
    .line 40
    invoke-static {p1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final g(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->h()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final h()V
    .locals 8

    .line 1
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/nkh;->f()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->a:Lv/VFrame;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 v1, 0x1

    .line 23
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->b:Lv/VLinear;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-ge v3, v1, :cond_3

    .line 36
    .line 37
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->e()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    sget v4, Ll/tec0;->H:I

    .line 52
    .line 53
    const/4 v5, 0x0

    .line 54
    invoke-virtual {v2, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Lv/VLinear;

    .line 59
    .line 60
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 61
    .line 62
    const/4 v5, -0x2

    .line 63
    invoke-direct {v4, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 64
    .line 65
    .line 66
    if-lez v3, :cond_1

    .line 67
    .line 68
    const/high16 v5, 0x41400000    # 12.0f

    .line 69
    .line 70
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 75
    .line 76
    :cond_1
    invoke-virtual {v2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    sget v4, Ll/hdc0;->e:I

    .line 80
    .line 81
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Lv/VText;

    .line 86
    .line 87
    sget v5, Ll/hdc0;->d1:I

    .line 88
    .line 89
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    check-cast v5, Lv/VText;

    .line 94
    .line 95
    iget-object v6, v1, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->name:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v6}, Ll/eu0;->b(Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    if-eqz v6, :cond_2

    .line 102
    .line 103
    new-instance v6, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    const-string v7, "["

    .line 106
    .line 107
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object v7, v1, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->name:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v7, "]"

    .line 116
    .line 117
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    :cond_2
    iget-object v4, v1, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->name:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    .line 131
    .line 132
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->b:Lv/VLinear;

    .line 133
    .line 134
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    new-instance v4, Ll/pog;

    .line 138
    .line 139
    invoke-direct {v4, p0, v1}, Ll/pog;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v2, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    add-int/lit8 v3, v3, 0x1

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_3
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;Landroid/view/View;)V
    .locals 0

    .line 1
    iget p2, p1, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->id:I

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->f(I)V

    .line 4
    .line 5
    .line 6
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->id:I

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->j(I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->e:Ll/x20;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->e:Ll/x20;

    .line 20
    .line 21
    invoke-interface {p0}, Ll/x20;->call()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final j(I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-lez p1, :cond_2

    .line 5
    .line 6
    iget v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 7
    .line 8
    if-gtz v2, :cond_1

    .line 9
    .line 10
    iget-boolean v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    move v5, v1

    .line 16
    goto :goto_2

    .line 17
    :cond_1
    :goto_1
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_2
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 21
    .line 22
    xor-int/2addr v1, v0

    .line 23
    goto :goto_0

    .line 24
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->e()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v4, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->getMomentShowFrom()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    move v7, p1

    .line 41
    invoke-virtual/range {v2 .. v7}, Ll/jka;->Gb(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;I)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    new-instance p1, Ll/qog;

    .line 50
    .line 51
    invoke-direct {p1}, Ll/qog;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v0, Ll/rog;

    .line 55
    .line 56
    invoke-direct {v0}, Ll/rog;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->d:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->e:Ll/x20;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->a:Lv/VFrame;

    .line 8
    .line 9
    sget p1, Ll/lbc0;->z:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->d:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    new-array v0, v0, [Ll/pf60;

    .line 5
    .line 6
    const-string v1, "e_attitude_bubble"

    .line 7
    .line 8
    invoke-static {v1, p0, v0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
