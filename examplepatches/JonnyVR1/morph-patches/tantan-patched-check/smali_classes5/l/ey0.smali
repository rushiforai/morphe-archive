.class public Ll/ey0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;[Ll/th0;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "-1"

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-interface {p2, p0, v0, v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startMessagesAct(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    aget-object p0, p1, v2

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic b([Ll/th0;ZLcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p3, 0x0

    .line 2
    aget-object p0, p0, p3

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic c([Ll/th0;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic d([Ll/th0;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    aget-object p0, p0, p2

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;[Ll/th0;ZLandroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const-string v0, "-1"

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-interface {p3, p0, v0, v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startMessagesAct(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p0, p3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    aget-object p1, p1, v2

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/th0;->c()V

    .line 19
    .line 20
    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ln()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    if-nez p0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    const/4 v0, 0x1

    .line 20
    new-array v0, v0, [Ll/th0;

    .line 21
    .line 22
    new-instance v1, Ll/th0$a;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v1, v2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1, v2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->N:I

    .line 37
    .line 38
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v1, v3}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->L:I

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v1, v3}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    new-instance v3, Ll/zx0;

    .line 61
    .line 62
    invoke-direct {v3, v0, p0}, Ll/zx0;-><init>([Ll/th0;Lcom/p1/mobile/android/app/Act;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v3}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    aput-object p0, v0, v2

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;)V
    .locals 6

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 v0, 0x1

    .line 5
    new-array v0, v0, [Ll/th0;

    .line 6
    .line 7
    new-instance v1, Ll/th0$a;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v1, v2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, v2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->L:I

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v1, v3}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v3, Ll/ay0;

    .line 36
    .line 37
    invoke-direct {v3, v0}, Ll/ay0;-><init>([Ll/th0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v3}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->M:I

    .line 45
    .line 46
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v1, v3}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    sget v5, Lcom/p1/mobile/putong/core/profile/R$string;->K:I

    .line 59
    .line 60
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v3, v4}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    new-instance v4, Ll/by0;

    .line 69
    .line 70
    invoke-direct {v4, p0, v0}, Ll/by0;-><init>(Lcom/p1/mobile/android/app/Act;[Ll/th0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, v4}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ll/th0$a;->a()Ll/th0;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    aput-object p0, v0, v2

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public static h(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/ey0;->i(Lcom/p1/mobile/android/app/Act;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 6

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 v0, 0x1

    .line 5
    new-array v0, v0, [Ll/th0;

    .line 6
    .line 7
    new-instance v1, Ll/th0$a;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v1, v2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, v2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->L:I

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v1, v3}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v3, Ll/cy0;

    .line 36
    .line 37
    invoke-direct {v3, v0, p1, p0}, Ll/cy0;-><init>([Ll/th0;ZLcom/p1/mobile/android/app/Act;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v3}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->O:I

    .line 45
    .line 46
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v1, v3}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    sget v5, Lcom/p1/mobile/putong/core/profile/R$string;->K:I

    .line 59
    .line 60
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v3, v4}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    new-instance v4, Ll/dy0;

    .line 69
    .line 70
    invoke-direct {v4, p0, v0, p1}, Ll/dy0;-><init>(Lcom/p1/mobile/android/app/Act;[Ll/th0;Z)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, v4}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ll/th0$a;->a()Ll/th0;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    aput-object p0, v0, v2

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 83
    .line 84
    .line 85
    return-void
.end method
