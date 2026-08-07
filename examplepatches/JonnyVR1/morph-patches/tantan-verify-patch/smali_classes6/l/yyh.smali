.class public Ll/yyh;
.super Ll/e7;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/t4i;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e7;-><init>(Ll/t4i;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/yyh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yyh;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ll/yyh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yyh;->o(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Ll/yyh;Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yyh;->q(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;)V

    return-void
.end method

.method public static synthetic i(Ll/yyh;Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;Lcom/p1/mobile/putong/data/KanPostData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yyh;->r(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;Lcom/p1/mobile/putong/data/KanPostData;)V

    return-void
.end method

.method public static synthetic j(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k(Ll/yyh;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yyh;->s(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method


# virtual methods
.method public a(ILandroid/widget/TextView;Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lv/navigationbar/VNavigationBar;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->d2:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d(Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yyh;->l()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final l()Landroid/view/View;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/e7;->a:Ll/t4i;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;->c:Landroid/widget/TextView;

    .line 13
    .line 14
    new-instance v2, Ll/syh;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/syh;-><init>(Ll/yyh;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;->a:Lv/VText;

    .line 23
    .line 24
    iget-object v2, p0, Ll/e7;->a:Ll/t4i;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-virtual {v2, v3}, Ll/t4i;->d(I)Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p0, v2}, Ll/yyh;->n(Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/e7;->a:Ll/t4i;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 45
    .line 46
    iget-object v2, v2, Ll/ms8;->H:Lrx/subjects/a;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    new-instance v2, Ll/tyh;

    .line 53
    .line 54
    invoke-direct {v2, p0, v0}, Ll/tyh;-><init>(Ll/yyh;Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-object v0
.end method

.method public final m()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e7;->a:Ll/t4i;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/t4i;->d(I)Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 9
    .line 10
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v2, v0}, Ll/jka;->Z6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/wyh;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/wyh;-><init>(Ll/yyh;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/xyh;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/xyh;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->createdTime:D

    .line 7
    .line 8
    const-wide v2, 0x4194997000000000L    # 8.64E7

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    add-double/2addr v0, v2

    .line 14
    invoke-static {v0, v1}, Ll/p6i;->o(D)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p1, "\u540e\u81ea\u52a8\u7ed3\u675f"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final synthetic o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yyh;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ms8;->H:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 12
    .line 13
    iget-object p1, p1, Ll/ms8;->H:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 26
    .line 27
    iget-object p1, p1, Ll/ms8;->H:Lrx/subjects/a;

    .line 28
    .line 29
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/data/KanPostData;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/KanPostData;->status:Lcom/p1/mobile/putong/data/KanKanStatus;

    .line 36
    .line 37
    const-string v0, "start"

    .line 38
    .line 39
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    const-string p0, "\u72b6\u6001\u53d1\u5e03\u4e2d..."

    .line 46
    .line 47
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget-object p1, p0, Ll/e7;->a:Ll/t4i;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object v0, p0, Ll/e7;->a:Ll/t4i;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Ll/t4i;->d(I)Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "state_id"

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    filled-new-array {v0}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-string v1, "e_my_state_over"

    .line 77
    .line 78
    const-string v2, "p_my_state"

    .line 79
    .line 80
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 81
    .line 82
    .line 83
    new-instance v0, Ll/th0$a;

    .line 84
    .line 85
    invoke-direct {v0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 86
    .line 87
    .line 88
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 89
    .line 90
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->c2:I

    .line 91
    .line 92
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {v0, p1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    const-string v1, "\u786e\u8ba4\u8981\u7ed3\u675f\u8fd9\u6761\u72b6\u6001\uff1f"

    .line 101
    .line 102
    invoke-virtual {p1, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    new-instance v1, Ll/uyh;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ll/uyh;-><init>(Ll/yyh;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    const-string p1, "\u786e\u5b9a"

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 122
    .line 123
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ms8;->H:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/KanPostData;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/KanPostData;->status:Lcom/p1/mobile/putong/data/KanKanStatus;

    .line 12
    .line 13
    const-string v1, "start"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/16 v1, 0x8

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;->a:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;->b:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;->a:Lv/VText;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;->b:Landroid/widget/TextView;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;->a:Lv/VText;

    .line 46
    .line 47
    iget-object v0, p0, Ll/e7;->a:Ll/t4i;

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Ll/t4i;->d(I)Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Ll/yyh;->n(Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;Lcom/p1/mobile/putong/data/KanPostData;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/e7;->a:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance v0, Ll/vyh;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/vyh;-><init>(Ll/yyh;Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->k0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    iget-object p1, p1, Ll/jka;->z0:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/e7;->a:Ll/t4i;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-virtual {p0, p1}, Ll/jka;->lc(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
