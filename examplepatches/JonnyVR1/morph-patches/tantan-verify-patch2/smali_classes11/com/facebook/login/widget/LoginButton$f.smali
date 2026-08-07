.class public Lcom/facebook/login/widget/LoginButton$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/login/widget/LoginButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "f"
.end annotation


# instance fields
.field public final synthetic a:Lcom/facebook/login/widget/LoginButton;


# direct methods
.method public constructor <init>(Lcom/facebook/login/widget/LoginButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/z0w;
    .locals 3

    .line 1
    invoke-static {p0}, Ll/ztb;->d(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    :try_start_0
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/facebook/login/widget/LoginButton;->getDefaultAudience()Lcom/facebook/login/DefaultAudience;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v2}, Ll/z0w;->C(Lcom/facebook/login/DefaultAudience;)Ll/z0w;

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/facebook/login/widget/LoginButton;->getLoginBehavior()Lcom/facebook/login/LoginBehavior;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v2}, Ll/z0w;->F(Lcom/facebook/login/LoginBehavior;)Ll/z0w;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/facebook/login/widget/LoginButton$f;->b()Lcom/facebook/login/LoginTargetApp;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v2}, Ll/z0w;->G(Lcom/facebook/login/LoginTargetApp;)Ll/z0w;

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/facebook/login/widget/LoginButton;->getAuthType()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v2}, Ll/z0w;->B(Ljava/lang/String;)Ll/z0w;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/facebook/login/widget/LoginButton$f;->c()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    invoke-virtual {v0, v2}, Ll/z0w;->E(Z)Ll/z0w;

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 55
    .line 56
    invoke-virtual {v2}, Lcom/facebook/login/widget/LoginButton;->getShouldSkipAccountDeduplication()Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {v0, v2}, Ll/z0w;->J(Z)Ll/z0w;

    .line 61
    .line 62
    .line 63
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/facebook/login/widget/LoginButton;->getMessengerPageId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v0, v2}, Ll/z0w;->H(Ljava/lang/String;)Ll/z0w;

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 73
    .line 74
    invoke-virtual {v2}, Lcom/facebook/login/widget/LoginButton;->getResetMessengerState()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    invoke-virtual {v0, v2}, Ll/z0w;->I(Z)Ll/z0w;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    .line 80
    .line 81
    return-object v0

    .line 82
    :catchall_0
    move-exception v0

    .line 83
    invoke-static {v0, p0}, Ll/ztb;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return-object v1
.end method

.method public b()Lcom/facebook/login/LoginTargetApp;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/ztb;->d(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    :try_start_0
    sget-object p0, Lcom/facebook/login/LoginTargetApp;->FACEBOOK:Lcom/facebook/login/LoginTargetApp;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    invoke-static {v0, p0}, Ll/ztb;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-object v1
.end method

.method public c()Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ztb;->d(Ljava/lang/Object;)Z

    const/4 p0, 0x0

    return p0
.end method

.method public d()V
    .locals 4

    .line 1
    invoke-static {p0}, Ll/ztb;->d(Ljava/lang/Object;)Z

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
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/login/widget/LoginButton$f;->a()Ll/z0w;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/facebook/login/widget/LoginButton;->q(Lcom/facebook/login/widget/LoginButton;)Ll/c60;

    .line 15
    .line 16
    .line 17
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 19
    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    :try_start_1
    invoke-static {v2}, Lcom/facebook/login/widget/LoginButton;->r(Lcom/facebook/login/widget/LoginButton;)Ll/b94;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/facebook/login/widget/LoginButton;->r(Lcom/facebook/login/widget/LoginButton;)Ll/b94;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    new-instance v0, Lcom/facebook/internal/CallbackManagerImpl;

    .line 38
    .line 39
    invoke-direct {v0}, Lcom/facebook/internal/CallbackManagerImpl;-><init>()V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object v1, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/facebook/login/widget/LoginButton;->q(Lcom/facebook/login/widget/LoginButton;)Ll/c60;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Ll/c60;->a()Ll/x50;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Ll/z0w$c;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ll/z0w$c;->f(Ll/b94;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/facebook/login/widget/LoginButton;->q(Lcom/facebook/login/widget/LoginButton;)Ll/c60;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v1, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/facebook/login/widget/LoginButton;->m:Lcom/facebook/login/widget/LoginButton$e;

    .line 66
    .line 67
    invoke-static {v1}, Lcom/facebook/login/widget/LoginButton$e;->a(Lcom/facebook/login/widget/LoginButton$e;)Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Ll/c60;->b(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    invoke-virtual {v2}, Lcom/facebook/FacebookButtonBase;->getFragment()Landroidx/fragment/app/Fragment;

    .line 76
    .line 77
    .line 78
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 80
    .line 81
    if-eqz v1, :cond_3

    .line 82
    .line 83
    :try_start_2
    invoke-virtual {v2}, Lcom/facebook/FacebookButtonBase;->getFragment()Landroidx/fragment/app/Fragment;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 88
    .line 89
    iget-object v2, v2, Lcom/facebook/login/widget/LoginButton;->m:Lcom/facebook/login/widget/LoginButton$e;

    .line 90
    .line 91
    invoke-static {v2}, Lcom/facebook/login/widget/LoginButton$e;->a(Lcom/facebook/login/widget/LoginButton$e;)Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iget-object v3, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 96
    .line 97
    invoke-virtual {v3}, Lcom/facebook/login/widget/LoginButton;->getLoggerID()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v0, v1, v2, v3}, Ll/z0w;->r(Landroidx/fragment/app/Fragment;Ljava/util/Collection;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    invoke-virtual {v2}, Lcom/facebook/FacebookButtonBase;->getNativeFragment()Landroid/app/Fragment;

    .line 106
    .line 107
    .line 108
    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 109
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 110
    .line 111
    if-eqz v1, :cond_4

    .line 112
    .line 113
    :try_start_3
    invoke-virtual {v2}, Lcom/facebook/FacebookButtonBase;->getNativeFragment()Landroid/app/Fragment;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 118
    .line 119
    iget-object v2, v2, Lcom/facebook/login/widget/LoginButton;->m:Lcom/facebook/login/widget/LoginButton$e;

    .line 120
    .line 121
    invoke-static {v2}, Lcom/facebook/login/widget/LoginButton$e;->a(Lcom/facebook/login/widget/LoginButton$e;)Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    iget-object v3, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 126
    .line 127
    invoke-virtual {v3}, Lcom/facebook/login/widget/LoginButton;->getLoggerID()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {v0, v1, v2, v3}, Ll/z0w;->q(Landroid/app/Fragment;Ljava/util/Collection;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_4
    invoke-static {v2}, Lcom/facebook/login/widget/LoginButton;->s(Lcom/facebook/login/widget/LoginButton;)Landroid/app/Activity;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 140
    .line 141
    iget-object v2, v2, Lcom/facebook/login/widget/LoginButton;->m:Lcom/facebook/login/widget/LoginButton$e;

    .line 142
    .line 143
    invoke-static {v2}, Lcom/facebook/login/widget/LoginButton$e;->a(Lcom/facebook/login/widget/LoginButton$e;)Ljava/util/List;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    iget-object v3, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 148
    .line 149
    invoke-virtual {v3}, Lcom/facebook/login/widget/LoginButton;->getLoggerID()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {v0, v1, v2, v3}, Ll/z0w;->o(Landroid/app/Activity;Ljava/util/Collection;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :goto_1
    invoke-static {v0, p0}, Ll/ztb;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public e(Landroid/content/Context;)V
    .locals 6

    .line 1
    invoke-static {p0}, Ll/ztb;->d(Ljava/lang/Object;)Z

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
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/login/widget/LoginButton$f;->a()Ll/z0w;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/facebook/login/widget/LoginButton;->t(Lcom/facebook/login/widget/LoginButton;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    iget-object v1, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget v2, Lcom/facebook/login/R$string;->d:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sget v3, Lcom/facebook/login/R$string;->a:I

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-static {}, Lcom/facebook/Profile;->b()Lcom/facebook/Profile;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    invoke-virtual {v3}, Lcom/facebook/Profile;->d()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    if-eqz v4, :cond_1

    .line 55
    .line 56
    iget-object v4, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 57
    .line 58
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    sget v5, Lcom/facebook/login/R$string;->f:I

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v3}, Lcom/facebook/Profile;->d()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    goto :goto_0

    .line 81
    :catchall_0
    move-exception p1

    .line 82
    goto :goto_1

    .line 83
    :cond_1
    iget-object v3, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 84
    .line 85
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    sget v4, Lcom/facebook/login/R$string;->g:I

    .line 90
    .line 91
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    :goto_0
    new-instance v4, Landroid/app/AlertDialog$Builder;

    .line 96
    .line 97
    invoke-direct {v4, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v4, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const/4 v3, 0x1

    .line 105
    invoke-virtual {p1, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    new-instance v3, Lcom/facebook/login/widget/LoginButton$f$a;

    .line 110
    .line 111
    invoke-direct {v3, p0, v0}, Lcom/facebook/login/widget/LoginButton$f$a;-><init>(Lcom/facebook/login/widget/LoginButton$f;Ll/z0w;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    const/4 v0, 0x0

    .line 119
    invoke-virtual {p1, v2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_2
    invoke-virtual {v0}, Ll/z0w;->u()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :goto_1
    invoke-static {p1, p0}, Ll/ztb;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/ztb;->d(Ljava/lang/Object;)Z

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
    :try_start_0
    iget-object v0, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 9
    .line 10
    invoke-static {v0, p1}, Lcom/facebook/login/widget/LoginButton;->o(Lcom/facebook/login/widget/LoginButton;Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/facebook/AccessToken;->d()Lcom/facebook/AccessToken;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {}, Lcom/facebook/AccessToken;->p()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Lcom/facebook/login/widget/LoginButton$f;->e(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_2

    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/facebook/login/widget/LoginButton$f;->d()V

    .line 36
    .line 37
    .line 38
    :goto_0
    new-instance v0, Lcom/facebook/appevents/f;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-direct {v0, v1}, Lcom/facebook/appevents/f;-><init>(Landroid/content/Context;)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Landroid/os/Bundle;

    .line 50
    .line 51
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v2, "logging_in"

    .line 55
    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    goto :goto_1

    .line 60
    :cond_2
    const/4 p1, 0x1

    .line 61
    :goto_1
    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    const-string p1, "access_token_expired"

    .line 65
    .line 66
    invoke-static {}, Lcom/facebook/AccessToken;->p()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-virtual {v1, p1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/facebook/login/widget/LoginButton$f;->a:Lcom/facebook/login/widget/LoginButton;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/facebook/login/widget/LoginButton;->p(Lcom/facebook/login/widget/LoginButton;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v0, p1, v1}, Lcom/facebook/appevents/f;->g(Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :goto_2
    invoke-static {p1, p0}, Ll/ztb;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
