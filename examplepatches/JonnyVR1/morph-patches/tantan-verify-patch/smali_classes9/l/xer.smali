.class public Ll/xer;
.super Ll/gp90;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/zq90;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gp90;-><init>(Ll/zq90;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/xer;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xer;->h(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic f(Ll/xer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xer;->i()V

    return-void
.end method

.method public static synthetic g(Ll/xer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xer;->j()V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/gp90;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 5
    .line 6
    iget-boolean v0, p1, Ll/zq90;->k:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 11
    .line 12
    sget p1, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p1}, Ll/zq90;->E()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    const-string p1, "e_push_profile_like"

    .line 29
    .line 30
    const-string v0, "p_push_profile"

    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 36
    .line 37
    iget-object p1, p1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 48
    .line 49
    iget-object v0, p0, Ll/gp90;->a:Ll/zq90;

    .line 50
    .line 51
    iget-object v0, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/s;->k4(Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object v0, p0, Ll/gp90;->a:Ll/zq90;

    .line 68
    .line 69
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {p1, v0}, Ll/dby;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_2

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/zq90;->D()Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 87
    .line 88
    iget-object p1, p1, Ll/zq90;->d:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/xer;->k(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_3

    .line 95
    .line 96
    :goto_0
    return-void

    .line 97
    :cond_3
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 98
    .line 99
    invoke-virtual {p1}, Ll/zq90;->W()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-object v0, p0, Ll/gp90;->a:Ll/zq90;

    .line 104
    .line 105
    iget-object v0, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 108
    .line 109
    const-string v1, "moments_user_id"

    .line 110
    .line 111
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    filled-new-array {v0}, [Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    const-string v1, "e_likeButton"

    .line 120
    .line 121
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 125
    .line 126
    invoke-virtual {p1}, Ll/zq90;->I()Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 131
    .line 132
    if-eqz p1, :cond_4

    .line 133
    .line 134
    iget-object p0, p0, Ll/zq90;->i:Ll/hp90;

    .line 135
    .line 136
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 137
    .line 138
    invoke-interface {p0, p1}, Ll/hp90;->a(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_4
    iget-object p0, p0, Ll/zq90;->i:Ll/hp90;

    .line 143
    .line 144
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 145
    .line 146
    invoke-interface {p0, p1}, Ll/hp90;->b(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final synthetic h(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->i:Ll/hp90;

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hp90;->a(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic i()V
    .locals 3

    .line 1
    invoke-static {}, Ll/o2c;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/sxa0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/gp90;->a:Ll/zq90;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "other"

    .line 16
    .line 17
    invoke-direct {v0, v1, v2}, Ll/sxa0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v1, v2}, Ll/sxa0;->K(ILl/x20;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Ll/wer;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/wer;-><init>(Ll/xer;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final synthetic j()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->i:Ll/hp90;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    invoke-interface {p0, v0}, Ll/hp90;->a(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k(Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-static {}, Ll/joa;->H3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_6

    .line 7
    .line 8
    invoke-static {}, Ll/o2c;->e()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p0, Ll/gp90;->a:Ll/zq90;

    .line 16
    .line 17
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "p_picks_profile_card"

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string v0, "home_selected_users_card"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v0, "selected_users_card"

    .line 31
    .line 32
    :goto_0
    new-instance v1, Ll/sxa0;

    .line 33
    .line 34
    iget-object v3, p0, Ll/gp90;->a:Ll/zq90;

    .line 35
    .line 36
    invoke-virtual {v3}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-direct {v1, v3, v0}, Ll/sxa0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    const-string p1, "female"

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    const-string p1, "male"

    .line 67
    .line 68
    :goto_1
    invoke-virtual {v1, p1}, Ll/sxa0;->J(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    new-instance p1, Ll/uer;

    .line 72
    .line 73
    invoke-direct {p1, p0}, Ll/uer;-><init>(Ll/xer;)V

    .line 74
    .line 75
    .line 76
    new-instance v0, Ll/ver;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Ll/ver;-><init>(Ll/xer;)V

    .line 79
    .line 80
    .line 81
    const/4 p0, 0x3

    .line 82
    invoke-virtual {v1, p0, p1, v0}, Ll/sxa0;->L(ILl/x20;Ll/x20;)V

    .line 83
    .line 84
    .line 85
    return v2

    .line 86
    :cond_3
    invoke-static {}, Ll/o2c;->g()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_4

    .line 91
    .line 92
    new-instance p1, Ll/sxa0;

    .line 93
    .line 94
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 95
    .line 96
    invoke-virtual {p0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string v0, "other"

    .line 101
    .line 102
    invoke-direct {p1, p0, v0}, Ll/sxa0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    const/4 p0, 0x4

    .line 106
    const/4 v0, 0x0

    .line 107
    invoke-virtual {p1, p0, v0}, Ll/sxa0;->K(ILl/x20;)V

    .line 108
    .line 109
    .line 110
    return v2

    .line 111
    :cond_4
    invoke-static {}, Ll/o2c;->f()Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-eqz p0, :cond_5

    .line 116
    .line 117
    return v1

    .line 118
    :cond_5
    return v2

    .line 119
    :cond_6
    return v1
.end method
