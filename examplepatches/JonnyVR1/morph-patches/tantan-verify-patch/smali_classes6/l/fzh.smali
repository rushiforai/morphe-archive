.class public Ll/fzh;
.super Ll/e7;
.source "SourceFile"


# instance fields
.field public c:I


# direct methods
.method public constructor <init>(Ll/t4i;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e7;-><init>(Ll/t4i;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Ll/fzh;->c:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic f(Ll/fzh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fzh;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ll/fzh;Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fzh;->o(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Ll/fzh;Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fzh;->n(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/fzh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fzh;->m(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(ILandroid/widget/TextView;Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/e7;->a:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/t4i;->b()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    iget-object v0, p0, Ll/e7;->a:Ll/t4i;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/t4i;->f(I)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/dzh;

    .line 14
    .line 15
    invoke-direct {v1, p0, p4, v0}, Ll/dzh;-><init>(Ll/fzh;Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/ezh;

    .line 22
    .line 23
    invoke-direct {v1, p0, p4, v0}, Ll/ezh;-><init>(Ll/fzh;Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    iget p2, p0, Ll/fzh;->c:I

    .line 30
    .line 31
    if-eq p2, p1, :cond_0

    .line 32
    .line 33
    const-string p2, "state_id"

    .line 34
    .line 35
    iget-object p4, p3, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p2, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    iget-object p3, p3, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 42
    .line 43
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 44
    .line 45
    const-string p4, "owner_id"

    .line 46
    .line 47
    invoke-static {p4, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    filled-new-array {p2, p3}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    const-string p3, "e_other_state_avartar"

    .line 56
    .line 57
    const-string p4, "p_other_state"

    .line 58
    .line 59
    invoke-static {p3, p4, p2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    iput p1, p0, Ll/fzh;->c:I

    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lv/navigationbar/VNavigationBar;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->e2:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/fzh;->k(Lv/navigationbar/VNavigationBar;)Landroid/widget/TextView;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v0, 0x1

    .line 17
    new-array v0, v0, [Landroid/view/View;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    aput-object p0, v0, v1

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public d(Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fzh;->j()Landroid/view/View;

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

.method public final j()Landroid/view/View;
    .locals 5

    .line 1
    new-instance v0, Landroid/widget/TextView;

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
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    const-string v1, "\u53d1\u6d88\u606f"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/e7;->a:Ll/t4i;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/k9c0;->x:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 34
    .line 35
    .line 36
    const/16 v1, 0x10

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 39
    .line 40
    .line 41
    const/high16 v1, 0x41800000    # 16.0f

    .line 42
    .line 43
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {v0, v1, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 49
    .line 50
    .line 51
    sget v1, Ll/lbc0;->t3:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v2, 0x1

    .line 61
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 62
    .line 63
    .line 64
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 65
    .line 66
    const v3, 0x43938000    # 295.0f

    .line 67
    .line 68
    .line 69
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    const/high16 v4, 0x42600000    # 56.0f

    .line 74
    .line 75
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    invoke-direct {v1, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 80
    .line 81
    .line 82
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 83
    .line 84
    const/high16 v2, 0x41f00000    # 30.0f

    .line 85
    .line 86
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 91
    .line 92
    const/high16 v2, 0x41200000    # 10.0f

    .line 93
    .line 94
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ll/fzh;->r()V

    .line 104
    .line 105
    .line 106
    new-instance v1, Ll/czh;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ll/czh;-><init>(Ll/fzh;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    return-object v0
.end method

.method public k(Lv/navigationbar/VNavigationBar;)Landroid/widget/TextView;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 11
    .line 12
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->f2:I

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    const/high16 p1, 0x41600000    # 14.0f

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 24
    .line 25
    .line 26
    const/4 v1, -0x1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/high16 v2, 0x41200000    # 10.0f

    .line 44
    .line 45
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {v0, v1, v3, p1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 58
    .line 59
    .line 60
    sget p1, Ll/lbc0;->q5:I

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 63
    .line 64
    .line 65
    new-instance p1, Ll/bzh;

    .line 66
    .line 67
    invoke-direct {p1, p0}, Ll/bzh;-><init>(Ll/fzh;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ll/cmg;->E()Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-nez p1, :cond_0

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/fzh;->t()V

    .line 80
    .line 81
    .line 82
    :cond_0
    return-object v0
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fzh;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 5

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/jka;->I7()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "p_other_state"

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/e7;->a:Ll/t4i;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1, v0}, Ll/h3i;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/e7;->a:Ll/t4i;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object v2, p0, Ll/e7;->a:Ll/t4i;

    .line 36
    .line 37
    invoke-virtual {v2}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const/4 v3, 0x0

    .line 42
    const-string v4, ""

    .line 43
    .line 44
    invoke-static {v2, v1, v3, v4, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->r2(Landroid/content/Context;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    invoke-virtual {p0}, Ll/fzh;->p()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object p3, p0, Ll/e7;->a:Ll/t4i;

    .line 8
    .line 9
    invoke-virtual {p3}, Ll/t4i;->b()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p0, p1, p2, p3}, Ll/fzh;->s(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object p3, p0, Ll/e7;->a:Ll/t4i;

    .line 8
    .line 9
    invoke-virtual {p3}, Ll/t4i;->b()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p0, p1, p2, p3}, Ll/fzh;->s(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final p()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e7;->a:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t4i;->e()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/e7;->a:Ll/t4i;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/t4i;->b()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "source_page"

    .line 20
    .line 21
    const-string v1, "p_other_state"

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "state_id"

    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 38
    .line 39
    const-string v3, "owner_id"

    .line 40
    .line 41
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    filled-new-array {v0, v2, p0}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v0, "e_set_my_state"

    .line 50
    .line 51
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public final q()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/e7;->a:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t4i;->b()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "state_id"

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "owner_id"

    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "e_send_message"

    .line 30
    .line 31
    const-string v1, "p_other_state"

    .line 32
    .line 33
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final r()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/e7;->a:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t4i;->b()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "state_id"

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "owner_id"

    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "e_send_message"

    .line 30
    .line 31
    const-string v1, "p_other_state"

    .line 32
    .line 33
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public s(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p3, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Zj(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-static {p1, p0, p2, p2}, Ll/orb0;->c(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    const-string p0, "state_id"

    .line 32
    .line 33
    iget-object p1, p3, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget-object p1, p3, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 42
    .line 43
    const-string p2, "owner_id"

    .line 44
    .line 45
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string p1, "e_other_state_avartar"

    .line 54
    .line 55
    const-string p2, "p_other_state"

    .line 56
    .line 57
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final t()V
    .locals 4

    .line 1
    const-string p0, "source_page"

    .line 2
    .line 3
    const-string v0, "p_other_state"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "state_id"

    .line 10
    .line 11
    const-string v2, ""

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v3, "owner_id"

    .line 18
    .line 19
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    filled-new-array {p0, v1, v2}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "e_set_my_state"

    .line 28
    .line 29
    invoke-static {v1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final u()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/e7;->a:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Ll/e7;->a:Ll/t4i;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v3, p0, Ll/e7;->a:Ll/t4i;

    .line 18
    .line 19
    invoke-virtual {v3}, Ll/t4i;->b()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-object v3, v3, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v4, p0, Ll/e7;->a:Ll/t4i;

    .line 26
    .line 27
    invoke-virtual {v4}, Ll/t4i;->b()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    iget-object v4, v4, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 32
    .line 33
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 34
    .line 35
    const-string v5, "from_state"

    .line 36
    .line 37
    invoke-interface {v1, v2, v3, v4, v5}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->k9(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/e7;->a:Ll/t4i;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget v1, Ll/a8c0;->i:I

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/fzh;->q()V

    .line 57
    .line 58
    .line 59
    return-void
.end method
