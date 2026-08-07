.class public Ll/zoe;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:Landroid/widget/LinearLayout;

.field public C:Lv/VText;

.field public D:Landroid/widget/ImageView;

.field public E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

.field public F:Lv/VLinear;

.field public G:Lv/VText;

.field public u:Lv/VLinear_Dividers;

.field public v:Lv/VText;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

.field public x:Lv/VImage;

.field public y:Lv/VText;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Ll/zoe;Lcom/p1/mobile/putong/data/CharacterEvaluate;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zoe;->a0(Lcom/p1/mobile/putong/data/CharacterEvaluate;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Ll/zoe;[ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zoe;->Z([ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic U(Ll/zoe;[ZLjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zoe;->Y([ZLjava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V([ZLcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    aget-boolean p0, p0, v1

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-boolean p0, p0, Ll/aw90;->c:Z

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic W(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public X(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ape;->b(Ll/zoe;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic Y([ZLjava/lang/String;Landroid/view/View;)V
    .locals 8

    .line 1
    const/4 p3, 0x0

    .line 2
    new-array v0, p3, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_test_mbti"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-boolean p3, v0, Ll/aw90;->c:Z

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    aput-boolean v0, p1, p3

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v6, 0x1

    .line 39
    const/4 v7, 0x0

    .line 40
    const-string v1, ""

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    const/4 v4, 0x1

    .line 44
    const/4 v5, 0x1

    .line 45
    move-object v2, p2

    .line 46
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->g2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic Z([ZLandroid/view/View;)V
    .locals 8

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->mbti:Ljava/util/List;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    check-cast p2, Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-boolean v0, v1, Ll/aw90;->c:Z

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    aput-boolean v1, p1, v0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance p0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    sget-object v1, Ll/tr90;->n:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p2, "&uid="

    .line 65
    .line 66
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    const/4 v6, 0x1

    .line 85
    const/4 v7, 0x0

    .line 86
    const-string v1, ""

    .line 87
    .line 88
    const/4 v3, 0x1

    .line 89
    const/4 v4, 0x1

    .line 90
    const/4 v5, 0x1

    .line 91
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->g2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/data/CharacterEvaluate;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/api/o;->T:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->hideCharacter:Z

    .line 30
    .line 31
    const-string v2, "my_profile"

    .line 32
    .line 33
    invoke-static {v1, p0, p1, v2}, Lcom/p1/mobile/putong/core/api/o;->s3(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p2, v0, p0}, Lcom/p1/mobile/putong/core/api/o;->r3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/zoe;->X(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/zoe;->G:Lv/VText;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/zoe;->v:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/zoe;->C:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    new-array v1, v0, [Z

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    aput-boolean v2, v1, v2

    .line 23
    .line 24
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {v3}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v3}, Ll/aw90;->Q(Lcom/p1/mobile/putong/data/User;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    iget-object v4, p0, Ll/zoe;->B:Landroid/widget/LinearLayout;

    .line 37
    .line 38
    if-nez v3, :cond_0

    .line 39
    .line 40
    invoke-static {v4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v3, p0, Ll/zoe;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 44
    .line 45
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    sget-object v3, Ll/tr90;->o:Ljava/lang/String;

    .line 49
    .line 50
    const-string v4, "edit_profile"

    .line 51
    .line 52
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    new-instance v4, Ll/toe;

    .line 61
    .line 62
    invoke-direct {v4, p0, v1, v3}, Ll/toe;-><init>(Ll/zoe;[ZLjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object v3, p0, Ll/zoe;->B:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    iget-object v3, p0, Ll/zoe;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 75
    .line 76
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object v3, p0, Ll/zoe;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 80
    .line 81
    new-instance v4, Ll/uoe;

    .line 82
    .line 83
    invoke-direct {v4, p0, v1}, Ll/uoe;-><init>(Ll/zoe;[Z)V

    .line 84
    .line 85
    .line 86
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    iget-object v3, p0, Ll/zoe;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-interface {v4}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->f(Lcom/p1/mobile/putong/data/User;)V

    .line 100
    .line 101
    .line 102
    iget-object v3, p0, Ll/zoe;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 103
    .line 104
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->e()V

    .line 105
    .line 106
    .line 107
    :goto_0
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 110
    .line 111
    iget-object v3, v3, Ll/dkb;->R:Ll/gyd0;

    .line 112
    .line 113
    invoke-virtual {v3}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 118
    .line 119
    iget-object v3, v3, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 120
    .line 121
    if-eqz v3, :cond_2

    .line 122
    .line 123
    iget-object v4, v3, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v4

    .line 129
    if-eqz v4, :cond_1

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_1
    iget-object v4, p0, Ll/zoe;->F:Lv/VLinear;

    .line 133
    .line 134
    new-instance v5, Ll/voe;

    .line 135
    .line 136
    invoke-direct {v5, p0, v3}, Ll/voe;-><init>(Ll/zoe;Lcom/p1/mobile/putong/data/CharacterEvaluate;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v4, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 140
    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_2
    :goto_1
    iget-object v3, p0, Ll/zoe;->F:Lv/VLinear;

    .line 144
    .line 145
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    :goto_2
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    invoke-interface {v3}, Ll/t3m;->lifecycle()Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    new-instance v4, Ll/woe;

    .line 157
    .line 158
    invoke-direct {v4, v1}, Ll/woe;-><init>([Z)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v3, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    new-instance v3, Ll/xoe;

    .line 170
    .line 171
    invoke-direct {v3}, Ll/xoe;-><init>()V

    .line 172
    .line 173
    .line 174
    new-instance v4, Ll/yoe;

    .line 175
    .line 176
    invoke-direct {v4}, Ll/yoe;-><init>()V

    .line 177
    .line 178
    .line 179
    invoke-static {v3, v4}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    invoke-virtual {v1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 184
    .line 185
    .line 186
    iget-object v1, p0, Ll/zoe;->v:Lv/VText;

    .line 187
    .line 188
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 189
    .line 190
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 191
    .line 192
    invoke-virtual {v3}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    invoke-static {v3}, Ll/aw90;->Q(Lcom/p1/mobile/putong/data/User;)Z

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    if-eqz v3, :cond_3

    .line 201
    .line 202
    move v3, v2

    .line 203
    goto :goto_3

    .line 204
    :cond_3
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 209
    .line 210
    iget v3, v3, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->socialPersonalityTest:I

    .line 211
    .line 212
    :goto_3
    const-string v4, "\u6211\u7684\u793e\u4ea4\u6027\u683c"

    .line 213
    .line 214
    invoke-virtual {p0, v1, v4, v3}, Ll/ep90;->P(Landroid/widget/TextView;Ljava/lang/String;I)V

    .line 215
    .line 216
    .line 217
    invoke-static {}, Ll/gra;->L3()Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-eqz v1, :cond_6

    .line 222
    .line 223
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 228
    .line 229
    iget v1, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

    .line 230
    .line 231
    if-lez v1, :cond_5

    .line 232
    .line 233
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 234
    .line 235
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 236
    .line 237
    invoke-virtual {v3}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    invoke-static {v3}, Ll/aw90;->Q(Lcom/p1/mobile/putong/data/User;)Z

    .line 242
    .line 243
    .line 244
    move-result v3

    .line 245
    if-eqz v3, :cond_4

    .line 246
    .line 247
    move v2, v1

    .line 248
    :cond_4
    iget-object v3, p0, Ll/zoe;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 249
    .line 250
    const-string v4, "\u6d4b\u8bd5\u6211\u7684MBTI"

    .line 251
    .line 252
    invoke-virtual {v3, v2, v1, v4}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;->P(IILjava/lang/String;)V

    .line 253
    .line 254
    .line 255
    iget-object p0, p0, Ll/zoe;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 256
    .line 257
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 258
    .line 259
    .line 260
    return-void

    .line 261
    :cond_5
    iget-object p0, p0, Ll/zoe;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 262
    .line 263
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 264
    .line 265
    .line 266
    return-void

    .line 267
    :cond_6
    iget-object p0, p0, Ll/zoe;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 268
    .line 269
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 270
    .line 271
    .line 272
    return-void
.end method
