.class public Ll/ju9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eu9;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/Exception;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setTantanCoinWalletActionMenuViewTheme error: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic n(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/Exception;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setIntlEmojiActionMenuViewTheme error: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic o(Landroidx/appcompat/widget/ActionMenuView;Lcom/p1/mobile/android/app/Act;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v2, v1, Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    check-cast v1, Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, v1}, Ll/ux0;->j(Landroid/widget/TextView;)V

    .line 23
    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    :goto_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 30
    .line 31
    return-object p0
.end method


# virtual methods
.method public A4(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/hu9;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hu9;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Ll/ju9;->p(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/gu9;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gu9;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Ll/ju9;->p(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->T1:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    sget p0, Ll/c9c0;->d2:I

    .line 2
    .line 3
    return p0
.end method

.method public d(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Ll/ux0;->b()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1}, Ll/ux0;->f()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setTitleTextColor(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1}, Ll/ux0;->e()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setSubtitleTextColor(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ll/ux0;->f()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitleColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    .line 50
    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    const/4 v1, 0x2

    .line 54
    const/high16 v2, 0x41a00000    # 20.0f

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    .line 66
    .line 67
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/ux0;->f()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 84
    .line 85
    .line 86
    :cond_0
    return-void
.end method

.method public e(Landroid/view/MenuItem;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/adc0;->l3:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/widget/ImageView;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const v0, -0x28b2c9

    .line 24
    .line 25
    .line 26
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 27
    .line 28
    invoke-virtual {p1, v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public f(Ll/yfl;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getAppTheme()Ll/ux0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Landroid/view/View;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ll/ux0;->d()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    const/4 v3, -0x1

    .line 28
    invoke-direct {p0, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p1, Ll/yfl;->a:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-virtual {v2, v1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    filled-new-array {v1}, [Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/bnl0;->r0([Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p1, Ll/yfl;->a:Landroid/widget/FrameLayout;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/ux0;->b()Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p1, Ll/yfl;->R:Ll/dvl;

    .line 53
    .line 54
    invoke-interface {p0}, Ll/dvl;->c()Landroid/widget/FrameLayout;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0}, Ll/ux0;->b()Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p1, Ll/yfl;->R:Ll/dvl;

    .line 66
    .line 67
    invoke-interface {p0}, Ll/dvl;->i()Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    sget v0, Ll/dbc0;->T1:I

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->setImageResource(I)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p1, Ll/yfl;->m:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

    .line 77
    .line 78
    invoke-virtual {p0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p1, Ll/yfl;->O:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideErrorNetView;

    .line 82
    .line 83
    invoke-virtual {p0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Landroid/widget/FrameLayout;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ll/ux0;->b()Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    new-array v3, v2, [Landroid/view/View;

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    aput-object v1, v3, v4

    .line 26
    .line 27
    invoke-static {v3}, Ll/bnl0;->r0([Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    const/high16 v3, 0x42300000    # 44.0f

    .line 31
    .line 32
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-eqz v5, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    invoke-virtual {v5}, Landroid/view/View;->getPaddingRight()I

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    invoke-virtual {v5}, Landroid/view/View;->getPaddingBottom()I

    .line 59
    .line 60
    .line 61
    move-result v8

    .line 62
    invoke-virtual {v5, v4, v6, v7, v8}, Landroid/view/View;->setPadding(IIII)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    iput v3, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 70
    .line 71
    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    sget-object v6, Lcom/p1/mobile/android/app/Act;->TOOLBAR_TITLE_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 75
    .line 76
    invoke-virtual {v6, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    check-cast v6, Landroid/widget/TextView;

    .line 81
    .line 82
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    if-eqz v7, :cond_0

    .line 87
    .line 88
    const/high16 v7, 0x41a80000    # 21.0f

    .line 89
    .line 90
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 91
    .line 92
    .line 93
    sget v7, Ll/agc0;->B:I

    .line 94
    .line 95
    invoke-static {v6, v7}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    sget v8, Ll/c9c0;->p:I

    .line 103
    .line 104
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    iput v3, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 116
    .line 117
    invoke-virtual {v6, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    .line 119
    .line 120
    const/high16 v7, 0x40a00000    # 5.0f

    .line 121
    .line 122
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    neg-int v7, v7

    .line 127
    const/high16 v8, 0x40000000    # 2.0f

    .line 128
    .line 129
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 130
    .line 131
    .line 132
    move-result v8

    .line 133
    invoke-virtual {v6, v7, v8, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :catch_0
    move-exception v5

    .line 138
    goto :goto_1

    .line 139
    :cond_0
    :goto_0
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 140
    .line 141
    .line 142
    move-result-object v6

    .line 143
    iput v3, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 144
    .line 145
    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :goto_1
    new-instance v6, Ljava/lang/Exception;

    .line 150
    .line 151
    new-instance v7, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    const-string v8, "initToolbarTheme reflect mNavButtonView error: "

    .line 154
    .line 155
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-direct {v6, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-static {v6}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 173
    .line 174
    .line 175
    :cond_1
    :goto_2
    new-instance v5, Landroid/view/View;

    .line 176
    .line 177
    invoke-direct {v5, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0}, Ll/ux0;->d()I

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    invoke-virtual {v5, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 185
    .line 186
    .line 187
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 188
    .line 189
    const/4 v0, -0x1

    .line 190
    invoke-direct {p0, v0, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v1, v5, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 194
    .line 195
    .line 196
    filled-new-array {v5}, [Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-static {p0}, Ll/bnl0;->r0([Landroid/view/View;)V

    .line 201
    .line 202
    .line 203
    new-array p0, v2, [Landroid/view/View;

    .line 204
    .line 205
    aput-object v1, p0, v4

    .line 206
    .line 207
    invoke-static {v3, p0}, Ll/bnl0;->q0(I[Landroid/view/View;)V

    .line 208
    .line 209
    .line 210
    new-array p0, v2, [Landroid/view/View;

    .line 211
    .line 212
    aput-object v1, p0, v4

    .line 213
    .line 214
    invoke-static {v0, p0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 215
    .line 216
    .line 217
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->B:Landroid/widget/FrameLayout;

    .line 218
    .line 219
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 220
    .line 221
    .line 222
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 223
    .line 224
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 225
    .line 226
    const/4 v1, 0x2

    .line 227
    if-nez p0, :cond_2

    .line 228
    .line 229
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->I:Landroid/view/View;

    .line 230
    .line 231
    new-array v5, v1, [Landroid/view/View;

    .line 232
    .line 233
    aput-object v0, v5, v4

    .line 234
    .line 235
    aput-object p0, v5, v2

    .line 236
    .line 237
    invoke-static {v5}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 238
    .line 239
    .line 240
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 241
    .line 242
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->I:Landroid/view/View;

    .line 243
    .line 244
    new-array v0, v1, [Landroid/view/View;

    .line 245
    .line 246
    aput-object p0, v0, v4

    .line 247
    .line 248
    aput-object p1, v0, v2

    .line 249
    .line 250
    invoke-static {v3, v0}, Ll/bnl0;->Y(I[Landroid/view/View;)V

    .line 251
    .line 252
    .line 253
    goto :goto_3

    .line 254
    :cond_2
    iget-object v5, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->I:Landroid/view/View;

    .line 255
    .line 256
    const/4 v6, 0x3

    .line 257
    new-array v7, v6, [Landroid/view/View;

    .line 258
    .line 259
    aput-object v0, v7, v4

    .line 260
    .line 261
    aput-object p0, v7, v2

    .line 262
    .line 263
    aput-object v5, v7, v1

    .line 264
    .line 265
    invoke-static {v7}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 266
    .line 267
    .line 268
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 269
    .line 270
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 271
    .line 272
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->I:Landroid/view/View;

    .line 273
    .line 274
    new-array v5, v6, [Landroid/view/View;

    .line 275
    .line 276
    aput-object p0, v5, v4

    .line 277
    .line 278
    aput-object v0, v5, v2

    .line 279
    .line 280
    aput-object p1, v5, v1

    .line 281
    .line 282
    invoke-static {v3, v5}, Ll/bnl0;->Y(I[Landroid/view/View;)V

    .line 283
    .line 284
    .line 285
    :goto_3
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->d:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->d:Landroid/widget/ImageView;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public i(Lcom/google/android/material/tabs/TabLayout;)V
    .locals 1

    .line 1
    const/4 p0, -0x1

    .line 2
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 3
    .line 4
    .line 5
    const/high16 p0, 0x7f000000

    .line 6
    .line 7
    const/high16 v0, -0x1000000

    .line 8
    .line 9
    invoke-virtual {p1, p0, v0}, Lcom/google/android/material/tabs/TabLayout;->setTabTextColors(II)V

    .line 10
    .line 11
    .line 12
    const p0, -0x22c7dd

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 p1, 0x410

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getAppTheme()Ll/ux0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/gra;->z()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    new-instance v1, Landroid/view/View;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ll/ux0;->d()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    const/4 v3, -0x1

    .line 34
    invoke-direct {p0, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 35
    .line 36
    .line 37
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/b;->a:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    invoke-virtual {v2, v1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/b;->b:Landroid/view/View;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/ux0;->b()Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/b;->U:Ll/dvl;

    .line 52
    .line 53
    invoke-interface {p0}, Ll/dvl;->i()Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-interface {v1}, Ll/eu9;->b()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->setImageResource(I)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/b;->B:Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;

    .line 69
    .line 70
    invoke-virtual {p0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/b;->C:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 74
    .line 75
    invoke-virtual {p0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-static {}, Ll/s7a;->w()Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-nez p0, :cond_3

    .line 83
    .line 84
    invoke-static {}, Ll/gra;->z()Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-eqz p0, :cond_2

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/b;->U:Ll/dvl;

    .line 92
    .line 93
    invoke-interface {p0}, Ll/dvl;->c()Landroid/widget/FrameLayout;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0}, Ll/ux0;->b()Landroid/graphics/drawable/Drawable;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 102
    .line 103
    .line 104
    :cond_3
    :goto_0
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;Landroid/view/Menu;Landroid/view/MenuInflater;Landroid/view/MenuItem;)V
    .locals 0

    .line 1
    invoke-interface {p4}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/adc0;->p5:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/widget/ImageView;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const p2, -0x4cdededf

    .line 22
    .line 23
    .line 24
    sget-object p3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 25
    .line 26
    invoke-virtual {p1, p2, p3}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final p(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    :try_start_0
    sget-object p0, Lcom/p1/mobile/android/app/Act;->TOOLBAR_MENU_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroidx/appcompat/widget/ActionMenuView;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    new-instance v0, Ll/iu9;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1}, Ll/iu9;-><init>(Landroidx/appcompat/widget/ActionMenuView;Lcom/p1/mobile/android/app/Act;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p0, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :catch_0
    move-exception p0

    .line 39
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method
