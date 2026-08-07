.class public Ll/bjd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Landroid/content/Intent;

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V
    .locals 8
    .param p2    # Landroid/content/Intent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const-string v0, "backXHS"

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_1
    const-string v2, "backText"

    .line 21
    .line 22
    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v4, "icon"

    .line 27
    .line 28
    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    new-instance v6, Landroid/content/Intent;

    .line 33
    .line 34
    const-string v7, "android.intent.action.VIEW"

    .line 35
    .line 36
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {v6, v7, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Ll/bjd;->d:Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    iput-object v3, p0, Ll/bjd;->a:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v5, p0, Ll/bjd;->b:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v6, p0, Ll/bjd;->c:Landroid/content/Intent;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/bjd;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2, v4}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static synthetic a(Ll/bjd;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bjd;->i(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/bjd;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjd;->h(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/jec0;->s:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/bjd;->e:Landroid/view/View;

    .line 14
    .line 15
    sget v1, Ll/ycc0;->F:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VDraweeView;

    .line 22
    .line 23
    iget-object v1, p0, Ll/bjd;->e:Landroid/view/View;

    .line 24
    .line 25
    sget v2, Ll/ycc0;->q:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Landroid/widget/ImageView;

    .line 32
    .line 33
    iget-object v2, p0, Ll/bjd;->e:Landroid/view/View;

    .line 34
    .line 35
    sget v4, Ll/ycc0;->w0:I

    .line 36
    .line 37
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Landroid/widget/TextView;

    .line 42
    .line 43
    iget-object v4, p0, Ll/bjd;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-nez v4, :cond_0

    .line 50
    .line 51
    iget-object v4, p0, Ll/bjd;->a:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v2, v4}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    :cond_0
    new-instance v2, Ll/zid;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/zid;-><init>(Ll/bjd;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 65
    .line 66
    iget-object v2, p0, Ll/bjd;->b:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v0, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 72
    .line 73
    const/4 v1, -0x2

    .line 74
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 75
    .line 76
    .line 77
    const/16 v1, 0x53

    .line 78
    .line 79
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ll/bjd;->d(Lcom/p1/mobile/android/app/Act;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    const/high16 v2, 0x42920000    # 73.0f

    .line 86
    .line 87
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v1, :cond_1

    .line 92
    .line 93
    invoke-static {p1}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    :cond_1
    add-int/2addr v2, v3

    .line 98
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 99
    .line 100
    const/high16 v1, 0x41f00000    # 30.0f

    .line 101
    .line 102
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 107
    .line 108
    iget-object v1, p0, Ll/bjd;->e:Landroid/view/View;

    .line 109
    .line 110
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Landroid/view/ViewGroup;

    .line 122
    .line 123
    iget-object v1, p0, Ll/bjd;->e:Landroid/view/View;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ll/bjd;->e:Landroid/view/View;

    .line 129
    .line 130
    new-instance v1, Ll/ajd;

    .line 131
    .line 132
    invoke-direct {v1, p0, p1}, Ll/ajd;-><init>(Ll/bjd;Lcom/p1/mobile/android/app/Act;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Ll/bnl0;->F(Landroid/content/Context;)Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 6
    .line 7
    invoke-static {p1}, Ll/bnl0;->J(Landroid/content/Context;)Landroid/graphics/Point;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, p1}, Ll/bjd;->e(Lcom/p1/mobile/android/app/Act;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr v0, p0

    .line 16
    iget p0, v1, Landroid/graphics/Point;->y:I

    .line 17
    .line 18
    if-ge v0, p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public final e(Lcom/p1/mobile/android/app/Act;)I
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "status_bar_height"

    .line 11
    .line 12
    const-string v2, "dimen"

    .line 13
    .line 14
    const-string v3, "android"

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 31
    .line 32
    .line 33
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    return p0

    .line 35
    :catch_0
    move-exception p1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return p0

    .line 38
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    return p0
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/bjd;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/bjd;->e:Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/bjd;->d:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/view/ViewGroup;

    .line 24
    .line 25
    iget-object v1, p0, Ll/bjd;->e:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Ll/bjd;->e:Landroid/view/View;

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjd;->e:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bjd;->f()V

    .line 2
    .line 3
    .line 4
    const-string p0, "e_xiaohongshu_close"

    .line 5
    .line 6
    const-string p1, "p_suggest_users_home_view"

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/bjd;->c:Landroid/content/Intent;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    :try_start_0
    iget-object p2, p0, Ll/bjd;->c:Landroid/content/Intent;

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    const-string p1, "e_xiaohongshu"

    .line 15
    .line 16
    const-string p2, "p_suggest_users_home_view"

    .line 17
    .line 18
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ll/bjd;->f()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/bjd;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "e_xiaohongshu"

    .line 8
    .line 9
    const-string v1, "p_suggest_users_home_view"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/bjd;->e:Landroid/view/View;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
