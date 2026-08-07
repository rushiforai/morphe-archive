.class public Ll/p0a0;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public A:Landroid/widget/TextView;

.field public B:Landroid/widget/TextView;

.field public C:Landroid/widget/LinearLayout;

.field public D:Landroid/widget/TextView;

.field public E:Landroid/widget/FrameLayout;

.field public F:Landroid/view/View;

.field public G:Landroid/widget/TextView;

.field public H:Landroid/widget/FrameLayout;

.field public I:Landroid/view/View;

.field public J:Landroid/widget/TextView;

.field public K:Landroid/widget/FrameLayout;

.field public L:Landroid/view/View;

.field public u:Landroid/widget/RelativeLayout;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Landroid/widget/RelativeLayout;

.field public y:Landroid/widget/ImageView;

.field public z:Landroid/widget/TextView;


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

.method public static synthetic R(Lcom/p1/mobile/android/app/c;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->J7()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic S(Ll/p0a0;[ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0a0;->o0([ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic U(Ll/p0a0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p0a0;->j0()V

    return-void
.end method

.method public static synthetic V(Ll/p0a0;Lcom/p1/mobile/putong/data/CharacterEvaluate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p0a0;->m0(Lcom/p1/mobile/putong/data/CharacterEvaluate;)V

    return-void
.end method

.method public static synthetic W(Ll/p0a0;Lcom/p1/mobile/putong/data/CharacterEvaluate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p0a0;->k0(Lcom/p1/mobile/putong/data/CharacterEvaluate;)V

    return-void
.end method

.method public static synthetic X(Ll/p0a0;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p0a0;->i0(Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/android/app/c;)V
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

.method public static synthetic Z(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic a0(Lcom/p1/mobile/android/app/c;)V
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

.method public static synthetic b0([ZLcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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
    const/4 v1, 0x1

    .line 11
    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic c0(Ll/p0a0;Lcom/p1/mobile/putong/data/CharacterEvaluate;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0a0;->l0(Lcom/p1/mobile/putong/data/CharacterEvaluate;Ll/x20;)V

    return-void
.end method

.method public static synthetic d0([ZLcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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
    const/4 v1, 0x1

    .line 11
    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Ll/p0a0;[ZLl/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/CharacterEvaluate;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/p0a0;->n0([ZLl/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/CharacterEvaluate;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public g0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/q0a0;->b(Ll/p0a0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final h0(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "p_edit_profile_view"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "p_suggest_user_profile_info_view"

    .line 7
    .line 8
    return-object p0
.end method

.method public final synthetic i0(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p0a0;->p0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/p0a0;->v:Lv/VText;

    .line 5
    .line 6
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ll/t3m;->P1()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Ll/t3m;->lifecycle()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Ll/g0a0;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/g0a0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v0, Ll/h0a0;

    .line 39
    .line 40
    invoke-direct {v0}, Ll/h0a0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v0, Ll/i0a0;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/i0a0;-><init>(Ll/p0a0;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public final synthetic j0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Ll/p0a0;->h0(Z)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/p1/mobile/putong/core/api/o;->n3(Lcom/p1/mobile/putong/data/User;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string v0, "match"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v0, "test_too"

    .line 31
    .line 32
    :goto_0
    const-string v1, "tab_status"

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    filled-new-array {v0}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "e_character"

    .line 43
    .line 44
    invoke-static {v1, p0, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/data/CharacterEvaluate;)V
    .locals 3

    .line 1
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->hideCharacter:Z

    .line 2
    .line 3
    const-string v0, "tab_status"

    .line 4
    .line 5
    const-string v1, "e_character"

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Ll/p0a0;->h0(Z)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v2, "hide"

    .line 22
    .line 23
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    filled-new-array {v0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v1, p1, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/p0a0;->w:Lv/VText;

    .line 35
    .line 36
    const-string v0, "\u5df2\u9690\u85cf"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    invoke-virtual {p0, p1}, Ll/p0a0;->h0(Z)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string v2, "none"

    .line 55
    .line 56
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    filled-new-array {v0}, [Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v1, p1, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/p0a0;->w:Lv/VText;

    .line 68
    .line 69
    const-string v0, ""

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    iget-object p0, p0, Ll/p0a0;->w:Lv/VText;

    .line 75
    .line 76
    const/4 p1, 0x1

    .line 77
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public l()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    invoke-static {}, Ll/xra;->o()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Lcom/p1/mobile/putong/core/api/o;->n3(Lcom/p1/mobile/putong/data/User;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    return v2

    .line 35
    :cond_1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/o;->n3(Lcom/p1/mobile/putong/data/User;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_3

    .line 62
    .line 63
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/o;->m3(Lcom/p1/mobile/putong/data/User;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_4

    .line 76
    .line 77
    :cond_3
    return v1

    .line 78
    :cond_4
    return v2
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/data/CharacterEvaluate;Ll/x20;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Ll/p0a0;->h0(Z)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->hideCharacter:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p1, "hide"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p1, "none"

    .line 21
    .line 22
    :goto_0
    const-string v0, "tab_status"

    .line 23
    .line 24
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {p1}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "e_character"

    .line 33
    .line 34
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p2}, Ll/x20;->call()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/data/CharacterEvaluate;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p0a0;->F:Landroid/view/View;

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->actionTemperature:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/p0a0;->t0(Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/p0a0;->I:Landroid/view/View;

    .line 9
    .line 10
    iget v1, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->characterSweetness:I

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Ll/p0a0;->t0(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/p0a0;->L:Landroid/view/View;

    .line 16
    .line 17
    iget p1, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->alcoholConcentration:I

    .line 18
    .line 19
    invoke-virtual {p0, v0, p1}, Ll/p0a0;->t0(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic n0([ZLl/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/CharacterEvaluate;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p6, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    aput-boolean v0, p1, p6

    .line 4
    .line 5
    invoke-interface {p2}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-interface {p2}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-boolean p4, p4, Lcom/p1/mobile/putong/data/CharacterEvaluate;->hideCharacter:Z

    .line 35
    .line 36
    invoke-static {p3, p0, p4, p5}, Lcom/p1/mobile/putong/core/api/o;->s3(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/putong/core/api/o;->r3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic o0([ZLandroid/view/View;)V
    .locals 3

    .line 1
    const/4 p2, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    aput-boolean p2, p1, v0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Ll/p0a0;->h0(Z)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string p2, "tab_status"

    .line 18
    .line 19
    const-string v1, "test"

    .line 20
    .line 21
    invoke-static {p2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    filled-new-array {p2}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const-string v1, "e_character"

    .line 30
    .line 31
    invoke-static {v1, p1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-interface {p2}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/api/o;->U:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-interface {p0}, Ll/t3m;->P1()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    const-string p0, "my_profile"

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    const-string p0, "other_profile"

    .line 68
    .line 69
    :goto_0
    const-string v2, ""

    .line 70
    .line 71
    invoke-static {v1, v2, v0, p0}, Lcom/p1/mobile/putong/core/api/o;->s3(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/putong/core/api/o;->r3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final p0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->R:Ll/gyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    new-instance v1, Ll/n0a0;

    .line 30
    .line 31
    invoke-direct {v1, p0, v0}, Ll/n0a0;-><init>(Ll/p0a0;Lcom/p1/mobile/putong/data/CharacterEvaluate;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v1}, Ll/x20;->call()V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ll/o0a0;

    .line 38
    .line 39
    invoke-direct {v2, p0, v0, v1}, Ll/o0a0;-><init>(Ll/p0a0;Lcom/p1/mobile/putong/data/CharacterEvaluate;Ll/x20;)V

    .line 40
    .line 41
    .line 42
    const-string v1, "my_profile"

    .line 43
    .line 44
    invoke-virtual {p0, v0, v2, v1}, Ll/p0a0;->q0(Lcom/p1/mobile/putong/data/CharacterEvaluate;Ll/x20;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iget-object v0, p0, Ll/p0a0;->w:Lv/VText;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/p0a0;->r0()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final q0(Lcom/p1/mobile/putong/data/CharacterEvaluate;Ll/x20;Ljava/lang/String;)V
    .locals 9
    .param p1    # Lcom/p1/mobile/putong/data/CharacterEvaluate;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->tags:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/p0a0;->u0(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/p0a0;->z:Landroid/widget/TextView;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/p0a0;->s0(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/p0a0;->C:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/p0a0;->F:Landroid/view/View;

    .line 25
    .line 26
    new-instance v2, Ll/b0a0;

    .line 27
    .line 28
    invoke-direct {v2, p0, p1}, Ll/b0a0;-><init>(Ll/p0a0;Lcom/p1/mobile/putong/data/CharacterEvaluate;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Lcom/p1/mobile/putong/core/api/o;->m3(Lcom/p1/mobile/putong/data/User;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/api/o;->T:Ljava/lang/String;

    .line 49
    .line 50
    :goto_0
    move-object v6, v0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/api/o;->U:Ljava/lang/String;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :goto_1
    new-array v4, v1, [Z

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    aput-boolean v0, v4, v0

    .line 59
    .line 60
    new-instance v2, Ll/c0a0;

    .line 61
    .line 62
    move-object v3, p0

    .line 63
    move-object v7, p1

    .line 64
    move-object v5, p2

    .line 65
    move-object v8, p3

    .line 66
    invoke-direct/range {v2 .. v8}, Ll/c0a0;-><init>(Ll/p0a0;[ZLl/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/CharacterEvaluate;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, v3, Ll/p0a0;->w:Lv/VText;

    .line 70
    .line 71
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, v3, Ll/p0a0;->x:Landroid/widget/RelativeLayout;

    .line 75
    .line 76
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, v3, Ll/p0a0;->C:Landroid/widget/LinearLayout;

    .line 80
    .line 81
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3}, Ll/ep90;->O()Ll/t3m;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p0}, Ll/t3m;->P1()Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    iget-object p1, v3, Ll/p0a0;->B:Landroid/widget/TextView;

    .line 93
    .line 94
    if-eqz p0, :cond_1

    .line 95
    .line 96
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/o;->m3(Lcom/p1/mobile/putong/data/User;)Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-eqz p0, :cond_2

    .line 113
    .line 114
    const-string p0, "\u5339\u914d\u89e3\u6790"

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_2
    const-string p0, "\u6211\u4e5f\u53bb\u6d4b"

    .line 118
    .line 119
    :goto_2
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object p0, v3, Ll/p0a0;->B:Landroid/widget/TextView;

    .line 123
    .line 124
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    :goto_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/o;->m3(Lcom/p1/mobile/putong/data/User;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-nez p0, :cond_3

    .line 140
    .line 141
    invoke-virtual {v3}, Ll/ep90;->O()Ll/t3m;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-interface {p0}, Ll/t3m;->lifecycle()Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    new-instance p1, Ll/d0a0;

    .line 150
    .line 151
    invoke-direct {p1, v4}, Ll/d0a0;-><init>([Z)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    new-instance p1, Ll/e0a0;

    .line 163
    .line 164
    invoke-direct {p1}, Ll/e0a0;-><init>()V

    .line 165
    .line 166
    .line 167
    new-instance p2, Ll/f0a0;

    .line 168
    .line 169
    invoke-direct {p2}, Ll/f0a0;-><init>()V

    .line 170
    .line 171
    .line 172
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 177
    .line 178
    .line 179
    :cond_3
    return-void
.end method

.method public final r0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Ll/p0a0;->h0(Z)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "tab_status"

    .line 14
    .line 15
    const-string v2, "test"

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "e_character"

    .line 26
    .line 27
    invoke-static {v2, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/p0a0;->B:Landroid/widget/TextView;

    .line 31
    .line 32
    const-string v1, "\u53bb\u6d4b\u8bd5"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/p0a0;->B:Landroid/widget/TextView;

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/p0a0;->w:Lv/VText;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/p0a0;->C:Landroid/widget/LinearLayout;

    .line 50
    .line 51
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/p0a0;->y:Landroid/widget/ImageView;

    .line 55
    .line 56
    sget v3, Ll/dbc0;->zd:I

    .line 57
    .line 58
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/p0a0;->x:Landroid/widget/RelativeLayout;

    .line 62
    .line 63
    sget v3, Ll/dbc0;->wd:I

    .line 64
    .line 65
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/p0a0;->z:Landroid/widget/TextView;

    .line 69
    .line 70
    const-string v3, "\u5b8c\u6210\u793e\u4ea4\u6027\u683c\u6d4b\u8bd5"

    .line 71
    .line 72
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/p0a0;->A:Landroid/widget/TextView;

    .line 76
    .line 77
    const-string v3, "\u8ba9\u559c\u6b22\u7684\u4eba\u66f4\u76f4\u89c2\u4e86\u89e3\u4f60"

    .line 78
    .line 79
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    new-array v0, v1, [Z

    .line 83
    .line 84
    aput-boolean v2, v0, v2

    .line 85
    .line 86
    iget-object v2, p0, Ll/p0a0;->x:Landroid/widget/RelativeLayout;

    .line 87
    .line 88
    new-instance v3, Ll/j0a0;

    .line 89
    .line 90
    invoke-direct {v3, p0, v0}, Ll/j0a0;-><init>(Ll/p0a0;[Z)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-interface {p0}, Ll/t3m;->lifecycle()Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    new-instance v2, Ll/k0a0;

    .line 105
    .line 106
    invoke-direct {v2, v0}, Ll/k0a0;-><init>([Z)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    new-instance v0, Ll/l0a0;

    .line 118
    .line 119
    invoke-direct {v0}, Ll/l0a0;-><init>()V

    .line 120
    .line 121
    .line 122
    new-instance v1, Ll/m0a0;

    .line 123
    .line 124
    invoke-direct {v1}, Ll/m0a0;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

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
    invoke-virtual {p0, v0, p1}, Ll/p0a0;->g0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final s0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "\u51b0\u5c71\u5a01\u58eb\u5fcc"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/p0a0;->y:Landroid/widget/ImageView;

    .line 10
    .line 11
    sget v0, Ll/dbc0;->jd:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/p0a0;->x:Landroid/widget/RelativeLayout;

    .line 17
    .line 18
    sget p1, Ll/dbc0;->pd:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-string v0, "\u9648\u5e74\u62c9\u83f2\u9152"

    .line 25
    .line 26
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Ll/p0a0;->y:Landroid/widget/ImageView;

    .line 33
    .line 34
    sget v0, Ll/dbc0;->kd:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/p0a0;->x:Landroid/widget/RelativeLayout;

    .line 40
    .line 41
    sget p1, Ll/dbc0;->qd:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    const-string v0, "\u6e05\u9192\u51b0\u7f8e\u5f0f"

    .line 48
    .line 49
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    iget-object p1, p0, Ll/p0a0;->y:Landroid/widget/ImageView;

    .line 56
    .line 57
    sget v0, Ll/dbc0;->yd:I

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/p0a0;->x:Landroid/widget/RelativeLayout;

    .line 63
    .line 64
    sget p1, Ll/dbc0;->vd:I

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    const-string v0, "\u624b\u6253\u67e0\u6aac\u8336"

    .line 71
    .line 72
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    iget-object p1, p0, Ll/p0a0;->y:Landroid/widget/ImageView;

    .line 79
    .line 80
    sget v0, Ll/dbc0;->Ad:I

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/p0a0;->x:Landroid/widget/RelativeLayout;

    .line 86
    .line 87
    sget p1, Ll/dbc0;->xd:I

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    const-string v0, "\u5965\u5229\u5965\u5976\u8336"

    .line 94
    .line 95
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_4

    .line 100
    .line 101
    iget-object p1, p0, Ll/p0a0;->y:Landroid/widget/ImageView;

    .line 102
    .line 103
    sget v0, Ll/dbc0;->od:I

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/p0a0;->x:Landroid/widget/RelativeLayout;

    .line 109
    .line 110
    sget p1, Ll/dbc0;->ud:I

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_4
    const-string v0, "\u6a58\u5b50\u76d0\u6c7d\u6c34"

    .line 117
    .line 118
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_5

    .line 123
    .line 124
    iget-object p1, p0, Ll/p0a0;->y:Landroid/widget/ImageView;

    .line 125
    .line 126
    sget v0, Ll/dbc0;->nd:I

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Ll/p0a0;->x:Landroid/widget/RelativeLayout;

    .line 132
    .line 133
    sget p1, Ll/dbc0;->td:I

    .line 134
    .line 135
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_5
    const-string v0, "\u7eaf\u7eaf\u51c9\u767d\u5f00"

    .line 140
    .line 141
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    iget-object v0, p0, Ll/p0a0;->y:Landroid/widget/ImageView;

    .line 146
    .line 147
    if-eqz p1, :cond_6

    .line 148
    .line 149
    sget p1, Ll/dbc0;->ld:I

    .line 150
    .line 151
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 152
    .line 153
    .line 154
    iget-object p0, p0, Ll/p0a0;->x:Landroid/widget/RelativeLayout;

    .line 155
    .line 156
    sget p1, Ll/dbc0;->rd:I

    .line 157
    .line 158
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_6
    sget p1, Ll/dbc0;->md:I

    .line 163
    .line 164
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Ll/p0a0;->x:Landroid/widget/RelativeLayout;

    .line 168
    .line 169
    sget p1, Ll/dbc0;->sd:I

    .line 170
    .line 171
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public t()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/core/api/o;->n3(Lcom/p1/mobile/putong/data/User;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/core/api/o;->m3(Lcom/p1/mobile/putong/data/User;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Ll/p0a0;->w:Lv/VText;

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/p0a0;->r0()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getUserCharacter()Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    new-instance p0, Lcom/tantanapp/common/utils/NullChecker$TantanNullException;

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/tantanapp/common/utils/NullChecker$TantanNullException;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-interface {v2}, Ll/t3m;->m0()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-virtual {p0, v2}, Ll/p0a0;->h0(Z)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 90
    .line 91
    invoke-virtual {v3}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-static {v3}, Lcom/p1/mobile/putong/core/api/o;->n3(Lcom/p1/mobile/putong/data/User;)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_3

    .line 100
    .line 101
    const-string v3, "match"

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_3
    const-string v3, "test_too"

    .line 105
    .line 106
    :goto_0
    const-string v4, "tab_status"

    .line 107
    .line 108
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    filled-new-array {v3}, [Ll/pf60;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    const-string v4, "e_character"

    .line 117
    .line 118
    invoke-static {v4, v2, v3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 119
    .line 120
    .line 121
    iget-object v2, p0, Ll/p0a0;->w:Lv/VText;

    .line 122
    .line 123
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    new-instance v1, Ll/a0a0;

    .line 127
    .line 128
    invoke-direct {v1, p0}, Ll/a0a0;-><init>(Ll/p0a0;)V

    .line 129
    .line 130
    .line 131
    const-string v2, "other_profile"

    .line 132
    .line 133
    invoke-virtual {p0, v0, v1, v2}, Ll/p0a0;->q0(Lcom/p1/mobile/putong/data/CharacterEvaluate;Ll/x20;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public final t0(Landroid/view/View;I)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-gez p2, :cond_0

    .line 3
    .line 4
    move p2, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v1, 0x7

    .line 7
    if-le p2, v1, :cond_1

    .line 8
    .line 9
    move p2, v1

    .line 10
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 15
    .line 16
    const/4 v2, 0x3

    .line 17
    if-gt p2, v2, :cond_2

    .line 18
    .line 19
    const/4 v2, 0x5

    .line 20
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_2
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 24
    .line 25
    :goto_1
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 26
    .line 27
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 28
    .line 29
    const v0, 0x3ed1eb85    # 0.41f

    .line 30
    .line 31
    .line 32
    const v2, 0x3e8a3d71    # 0.27f

    .line 33
    .line 34
    .line 35
    const v3, 0x3e0f5c29    # 0.14f

    .line 36
    .line 37
    .line 38
    packed-switch p2, :pswitch_data_0

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :pswitch_0
    iget-object p0, p0, Ll/p0a0;->E:Landroid/widget/FrameLayout;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    int-to-float p0, p0

    .line 49
    mul-float/2addr p0, v3

    .line 50
    float-to-int p0, p0

    .line 51
    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :pswitch_1
    iget-object p0, p0, Ll/p0a0;->E:Landroid/widget/FrameLayout;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    int-to-float p0, p0

    .line 61
    mul-float/2addr p0, v2

    .line 62
    float-to-int p0, p0

    .line 63
    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :pswitch_2
    iget-object p0, p0, Ll/p0a0;->E:Landroid/widget/FrameLayout;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    int-to-float p0, p0

    .line 73
    mul-float/2addr p0, v0

    .line 74
    float-to-int p0, p0

    .line 75
    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :pswitch_3
    iget-object p0, p0, Ll/p0a0;->E:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    int-to-float p0, p0

    .line 85
    mul-float/2addr p0, v0

    .line 86
    float-to-int p0, p0

    .line 87
    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :pswitch_4
    iget-object p0, p0, Ll/p0a0;->E:Landroid/widget/FrameLayout;

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    int-to-float p0, p0

    .line 97
    mul-float/2addr p0, v2

    .line 98
    float-to-int p0, p0

    .line 99
    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :pswitch_5
    iget-object p0, p0, Ll/p0a0;->E:Landroid/widget/FrameLayout;

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    int-to-float p0, p0

    .line 109
    mul-float/2addr p0, v3

    .line 110
    float-to-int p0, p0

    .line 111
    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 112
    .line 113
    :goto_2
    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final u0(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/tantanapp/common/utils/NullChecker$TantanNullException;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/tantanapp/common/utils/NullChecker$TantanNullException;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ge v1, v2, :cond_2

    .line 27
    .line 28
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    add-int/lit8 v2, v2, -0x1

    .line 42
    .line 43
    if-eq v1, v2, :cond_1

    .line 44
    .line 45
    const-string v2, " \u00b7 "

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    iget-object p0, p0, Ll/p0a0;->A:Landroid/widget/TextView;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
