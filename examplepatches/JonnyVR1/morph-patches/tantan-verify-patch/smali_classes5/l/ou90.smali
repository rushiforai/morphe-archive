.class public Ll/ou90;
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

.method public static synthetic a(Ll/x20;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/ou90;->k(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const-string p1, "success"

    .line 20
    .line 21
    invoke-static {p1, p0}, Ll/ou90;->i(Ljava/lang/String;Ll/x20;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 28
    .line 29
    const-string p1, "fail"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/ura;->w3(Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    :goto_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public static synthetic b(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ura;->p3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic c(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/ou90;->j(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 p1, 0x0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const-string p0, "p_suggest_users_home_view"

    .line 21
    .line 22
    new-array p2, p1, [Ll/pf60;

    .line 23
    .line 24
    const-string v0, "e_ideal_limit_profile_complete"

    .line 25
    .line 26
    invoke-static {v0, p0, p2}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o8()V

    .line 34
    .line 35
    .line 36
    const-string p0, "\u63a8\u8350\u5df2\u66f4\u65b0"

    .line 37
    .line 38
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return p1
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ou90;->n(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/x20;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/ou90;->k(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const-string p1, "success"

    .line 20
    .line 21
    invoke-static {p1, p0}, Ll/ou90;->i(Ljava/lang/String;Ll/x20;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 28
    .line 29
    const-string p1, "fail"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/ura;->w3(Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    :goto_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static i(Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/ura;->w3(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/lu90;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/lu90;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ll/mu90;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/mu90;-><init>(Ll/x20;)V

    .line 21
    .line 22
    .line 23
    new-instance p1, Ll/nu90;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/nu90;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->PROFESSION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 7
    .line 8
    const-string v2, "from_ideal_guide_dialog"

    .line 9
    .line 10
    invoke-static {v1, p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->J(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFESSION:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUALIFICATION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 22
    .line 23
    invoke-static {v1, p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->J(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->QUALIFICATIONS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HEIGHT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 35
    .line 36
    invoke-static {v1, p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->J(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_2

    .line 41
    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->HEIGHT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SIGNATURE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 48
    .line 49
    invoke-static {v1, p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->J(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_3

    .line 54
    .line 55
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_ABOUT_ME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    const/4 v1, 0x3

    .line 67
    if-ge p0, v1, :cond_4

    .line 68
    .line 69
    sget-object p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_UPLOAD_PHOTOS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    :cond_4
    return-object v0
.end method

.method public static k(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 27
    .line 28
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 29
    .line 30
    sget v5, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 31
    .line 32
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    move v1, v3

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    move v1, v2

    .line 46
    :goto_1
    iget-object v4, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 47
    .line 48
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 49
    .line 50
    if-eqz v4, :cond_3

    .line 51
    .line 52
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-nez v4, :cond_3

    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 61
    .line 62
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 63
    .line 64
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 65
    .line 66
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 67
    .line 68
    sget v6, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 69
    .line 70
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eqz v4, :cond_2

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_2
    move v2, v3

    .line 82
    :cond_3
    :goto_2
    if-nez v1, :cond_4

    .line 83
    .line 84
    if-eqz v2, :cond_6

    .line 85
    .line 86
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 89
    .line 90
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 91
    .line 92
    if-eqz v1, :cond_5

    .line 93
    .line 94
    goto :goto_3

    .line 95
    :cond_5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFESSION:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    :cond_6
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 101
    .line 102
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 103
    .line 104
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 105
    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 109
    .line 110
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-nez v1, :cond_7

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 117
    .line 118
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 119
    .line 120
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 121
    .line 122
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    check-cast v1, Ljava/lang/CharSequence;

    .line 129
    .line 130
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eqz v1, :cond_8

    .line 135
    .line 136
    :cond_7
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->QUALIFICATIONS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 142
    .line 143
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 144
    .line 145
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 146
    .line 147
    if-eqz v1, :cond_c

    .line 148
    .line 149
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 150
    .line 151
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-nez v1, :cond_9

    .line 156
    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 158
    .line 159
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 160
    .line 161
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 162
    .line 163
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 164
    .line 165
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    check-cast v1, Ljava/lang/CharSequence;

    .line 170
    .line 171
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_d

    .line 176
    .line 177
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 178
    .line 179
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 180
    .line 181
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 182
    .line 183
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 184
    .line 185
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-nez v1, :cond_a

    .line 190
    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 192
    .line 193
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 194
    .line 195
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 196
    .line 197
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 198
    .line 199
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    check-cast v1, Ljava/lang/CharSequence;

    .line 204
    .line 205
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    if-eqz v1, :cond_d

    .line 210
    .line 211
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 212
    .line 213
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 214
    .line 215
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 216
    .line 217
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 218
    .line 219
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    if-nez v1, :cond_b

    .line 224
    .line 225
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 226
    .line 227
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 228
    .line 229
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 230
    .line 231
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 232
    .line 233
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    check-cast v1, Ljava/lang/CharSequence;

    .line 238
    .line 239
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    if-eqz v1, :cond_d

    .line 244
    .line 245
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 246
    .line 247
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 248
    .line 249
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    if-eqz v1, :cond_d

    .line 254
    .line 255
    :cond_c
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->ADDRESS_HOMETOWN:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 256
    .line 257
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 261
    .line 262
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 263
    .line 264
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 265
    .line 266
    if-eqz v1, :cond_e

    .line 267
    .line 268
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 269
    .line 270
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    if-eqz v1, :cond_f

    .line 275
    .line 276
    :cond_e
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_FRIEND_PURPOSE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 277
    .line 278
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 282
    .line 283
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 284
    .line 285
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 286
    .line 287
    if-eqz v1, :cond_10

    .line 288
    .line 289
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 290
    .line 291
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    if-nez v1, :cond_10

    .line 296
    .line 297
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 298
    .line 299
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 300
    .line 301
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 302
    .line 303
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 304
    .line 305
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    check-cast v1, Ljava/lang/CharSequence;

    .line 310
    .line 311
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 312
    .line 313
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 314
    .line 315
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    if-eqz v1, :cond_11

    .line 324
    .line 325
    :cond_10
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->HEIGHT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 326
    .line 327
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 331
    .line 332
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 333
    .line 334
    .line 335
    move-result v1

    .line 336
    if-nez v1, :cond_12

    .line 337
    .line 338
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 339
    .line 340
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 341
    .line 342
    .line 343
    move-result v1

    .line 344
    const/16 v2, 0xf

    .line 345
    .line 346
    if-lt v1, v2, :cond_12

    .line 347
    .line 348
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 349
    .line 350
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 351
    .line 352
    invoke-virtual {v1}, Ll/ura;->n3()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v1

    .line 356
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 357
    .line 358
    .line 359
    move-result v1

    .line 360
    if-nez v1, :cond_13

    .line 361
    .line 362
    :cond_12
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_ABOUT_ME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 363
    .line 364
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 365
    .line 366
    .line 367
    :cond_13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 368
    .line 369
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 370
    .line 371
    .line 372
    move-result p0

    .line 373
    const/4 v1, 0x3

    .line 374
    if-ge p0, v1, :cond_14

    .line 375
    .line 376
    sget-object p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_UPLOAD_PHOTOS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 377
    .line 378
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    :cond_14
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 382
    .line 383
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 384
    .line 385
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 386
    .line 387
    .line 388
    move-result-object p0

    .line 389
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 390
    .line 391
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 392
    .line 393
    const-string v2, "verified"

    .line 394
    .line 395
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    if-nez v1, :cond_15

    .line 400
    .line 401
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 402
    .line 403
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 404
    .line 405
    const-string v1, "pending"

    .line 406
    .line 407
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 408
    .line 409
    .line 410
    move-result p0

    .line 411
    if-nez p0, :cond_15

    .line 412
    .line 413
    sget-object p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_AVATAR_AUTHENTICATION:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 414
    .line 415
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 416
    .line 417
    .line 418
    :cond_15
    return-object v0
.end method

.method public static l(Lcom/p1/mobile/android/app/Act;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {v2}, Ll/ou90;->j(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    const/4 v6, 0x0

    .line 21
    const/4 v4, 0x0

    .line 22
    move-object v1, p0

    .line 23
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/util/ArrayList;ZZZ)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "from"

    .line 28
    .line 29
    const-string v2, "from_ideal_type_swipe_guide"

    .line 30
    .line 31
    invoke-virtual {p0, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/gu90;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/gu90;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p0, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public static m(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ura;->p3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/hu90;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1, p2}, Ll/hu90;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/iu90;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/iu90;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static n(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V
    .locals 6

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->am()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p2}, Ll/x20;->call()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void

    .line 25
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->bn()Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_2

    .line 38
    .line 39
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p2, "other"

    .line 48
    .line 49
    invoke-interface {p1, p0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Fa(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 56
    .line 57
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v1}, Ll/ou90;->k(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_3

    .line 70
    .line 71
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 74
    .line 75
    invoke-virtual {p2}, Ll/ura;->n3()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    if-eqz p2, :cond_3

    .line 84
    .line 85
    const-string p0, "good_user"

    .line 86
    .line 87
    invoke-static {p0, p1}, Ll/ou90;->i(Ljava/lang/String;Ll/x20;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->v4()Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eqz p2, :cond_4

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    new-instance v0, Ll/ju90;

    .line 114
    .line 115
    invoke-direct {v0, p1}, Ll/ju90;-><init>(Ll/x20;)V

    .line 116
    .line 117
    .line 118
    invoke-interface {p2, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->dm(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/a$a;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_4
    const/4 v4, 0x1

    .line 123
    const/4 v5, 0x0

    .line 124
    const/4 v3, 0x0

    .line 125
    move-object v0, p0

    .line 126
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/util/ArrayList;ZZZ)Landroid/content/Intent;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const-string p2, "from_profile_featured"

    .line 131
    .line 132
    const/4 v1, 0x1

    .line 133
    invoke-virtual {p0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 134
    .line 135
    .line 136
    new-instance p2, Ll/ku90;

    .line 137
    .line 138
    invoke-direct {p2, p1}, Ll/ku90;-><init>(Ll/x20;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, p0, p2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method
