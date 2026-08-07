.class public Ll/no90;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public A:Landroid/widget/LinearLayout;

.field public B:Lv/VImage;

.field public C:Lv/VImage;

.field public D:Lcom/p1/mobile/putong/core/newui/home/VerificationTagView;

.field public E:Landroid/widget/LinearLayout;

.field public F:Lv/VText;

.field public G:Lv/VText;

.field public H:Lv/VImage;

.field public I:Lcom/p1/mobile/putong/core/newui/home/views/WealthLevelView;

.field public J:Lv/VText;

.field public K:Lv/VText;

.field public L:Lv/VText;

.field public M:Lv/VLinear;

.field public N:Lv/VText_AutoFit;

.field public O:Lv/VLinear;

.field public P:Lv/VImage;

.field public Q:Lv/VText;

.field public R:Lv/VText;

.field public S:Landroid/widget/RelativeLayout;

.field public T:Ljava/lang/Runnable;

.field public U:Landroidx/recyclerview/widget/RecyclerView$t;

.field public V:Z

.field public W:Ll/sgj;

.field public u:Landroid/widget/LinearLayout;

.field public v:Landroid/widget/RelativeLayout;

.field public w:Lv/VLinear_FillerMeasure;

.field public x:Lv/VText;

.field public y:Lv/VDraweeView;

.field public z:Lv/VImage;


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
    new-instance p1, Ll/no90$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/no90$a;-><init>(Ll/no90;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/no90;->U:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/no90;->V:Z

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic R(Ll/no90;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/no90;->e0(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Ll/no90;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/no90;->d0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic U(Ll/no90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/no90;->c0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic W(Ll/no90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/no90;->f0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic X(Ll/no90;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/no90;->T:Ljava/lang/Runnable;

    return-object p0
.end method

.method private Z()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0
.end method

.method private synthetic c0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/no90;->Z()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct;->Companion:Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v1, "profile"

    .line 16
    .line 17
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct$a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic d0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/t3m;->P1()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/t3m;->m0()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method


# virtual methods
.method public O()Ll/t3m;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/on2;->w()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/t3m;

    .line 6
    .line 7
    return-object p0
.end method

.method public final Y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oo90;->a(Ll/no90;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/d79;->r0(Lcom/p1/mobile/putong/data/User;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p0, Ll/no90;->F:Lv/VText;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/no90;->G:Lv/VText;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    :cond_0
    invoke-direct {p0}, Ll/no90;->Z()Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0, p1}, Ll/e1b;->M0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method

.method public b0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final synthetic e0(ZLandroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-direct {p0}, Ll/no90;->Z()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    xor-int/2addr p1, v1

    .line 11
    const-string v2, "name"

    .line 12
    .line 13
    invoke-static {v0, v1, p1, v2}, Lcom/p1/mobile/putong/core/ui/settings/addemoji/AddEmojiAct;->b2(Landroid/content/Context;ZZLjava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p2, p1}, Ll/t3m;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Ll/no90;->Z()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget p1, Ll/x7c0;->y:I

    .line 25
    .line 26
    sget p2, Ll/x7c0;->q:I

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic f0(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_profile_page_hide_active_time_button"

    .line 2
    .line 3
    const-string v0, "p_suggest_user_profile_info_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Landroid/content/Intent;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/no90;->Z()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-class v1, Lcom/p1/mobile/putong/core/newui/container/NewUI1ContainerActivity;

    .line 15
    .line 16
    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 17
    .line 18
    .line 19
    const-class v0, Lcom/p1/mobile/putong/core/ui/settings/SettingsFragOld;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "fragmentName"

    .line 26
    .line 27
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0, p1}, Ll/t3m;->startActivity(Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public g0(Z)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ll/t3m;->P1()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_0

    .line 20
    .line 21
    :cond_0
    iget-object v2, p0, Ll/no90;->z:Lv/VImage;

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Ll/no90;->z:Lv/VImage;

    .line 28
    .line 29
    new-instance v4, Ll/ko90;

    .line 30
    .line 31
    invoke-direct {v4, p0, v1}, Ll/ko90;-><init>(Ll/no90;Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 44
    .line 45
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    const/4 v4, 0x0

    .line 50
    if-nez v2, :cond_2

    .line 51
    .line 52
    iget-object v1, p0, Ll/no90;->y:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 58
    .line 59
    iget-object v2, p0, Ll/no90;->y:Lv/VDraweeView;

    .line 60
    .line 61
    new-instance v5, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    sget-object v6, Ll/uqb0;->X:Ll/hj5;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v6, v0}, Ll/hj5;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v0, ".png"

    .line 90
    .line 91
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v1, v2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/no90;->z:Lv/VImage;

    .line 102
    .line 103
    if-eqz p1, :cond_1

    .line 104
    .line 105
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/no90;->z:Lv/VImage;

    .line 109
    .line 110
    sget p1, Ll/dbc0;->fs:I

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_1
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_2
    if-nez p1, :cond_3

    .line 121
    .line 122
    iget-object v0, p0, Ll/no90;->z:Lv/VImage;

    .line 123
    .line 124
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    :cond_3
    iget-object v0, p0, Ll/no90;->y:Lv/VDraweeView;

    .line 128
    .line 129
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/no90;->z:Lv/VImage;

    .line 133
    .line 134
    sget v2, Ll/dbc0;->b:I

    .line 135
    .line 136
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 137
    .line 138
    .line 139
    if-eqz p1, :cond_5

    .line 140
    .line 141
    if-nez v1, :cond_4

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_4
    iget-object p1, p0, Ll/no90;->z:Lv/VImage;

    .line 145
    .line 146
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    iget-object p0, p0, Ll/no90;->z:Lv/VImage;

    .line 150
    .line 151
    new-instance p1, Ll/lo90;

    .line 152
    .line 153
    invoke-direct {p1}, Ll/lo90;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 157
    .line 158
    .line 159
    :cond_5
    :goto_0
    return-void
.end method

.method public h0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/no90;->O:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/no90;->Q:Lv/VText;

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/core/R$string;->U9:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/no90;->O:Lv/VLinear;

    .line 14
    .line 15
    new-instance v1, Ll/mo90;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/mo90;-><init>(Ll/no90;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget-boolean p1, p0, Ll/no90;->V:Z

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    const-string p1, "e_profile_page_hide_active_time_button"

    .line 30
    .line 31
    const-string v0, "p_suggest_user_profile_info_view"

    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    iput-boolean p1, p0, Ll/no90;->V:Z

    .line 38
    .line 39
    :cond_0
    iget-object p1, p0, Ll/no90;->W:Ll/sgj;

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    new-instance p1, Ll/sgj;

    .line 44
    .line 45
    iget-object v0, p0, Ll/no90;->P:Lv/VImage;

    .line 46
    .line 47
    invoke-direct {p1, v0}, Ll/sgj;-><init>(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Ll/no90;->W:Ll/sgj;

    .line 51
    .line 52
    :cond_1
    iget-object p0, p0, Ll/no90;->W:Ll/sgj;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/sgj;->c()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    iget-object p1, p0, Ll/no90;->W:Ll/sgj;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    iget-object p0, p0, Ll/no90;->W:Ll/sgj;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/sgj;->a()V

    .line 69
    .line 70
    .line 71
    :cond_3
    return-void
.end method

.method public final i0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/no90;->A:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/no90;->D:Lcom/p1/mobile/putong/core/newui/home/VerificationTagView;

    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/no90;->D:Lcom/p1/mobile/putong/core/newui/home/VerificationTagView;

    .line 24
    .line 25
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/no90;->N:Lv/VText_AutoFit;

    .line 5
    .line 6
    iget-object v0, p0, Ll/no90;->M:Lv/VLinear;

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ll/t3m;->W()Landroidx/recyclerview/widget/RecyclerView;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Ll/no90;->U:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p1}, Ll/t3m;->D2()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-interface {p1}, Ll/t3m;->S()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iget-object p1, p0, Ll/no90;->u:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    sget v0, Ll/c9c0;->l1:I

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 59
    .line 60
    .line 61
    :cond_0
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    iget-object p1, p0, Ll/no90;->u:Landroid/widget/LinearLayout;

    .line 72
    .line 73
    new-instance v0, Ll/go90;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/go90;-><init>(Ll/no90;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-interface {p1}, Ll/s7m;->userId()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    const/16 v0, 0x8

    .line 94
    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    iget-object p1, p0, Ll/no90;->F:Lv/VText;

    .line 98
    .line 99
    invoke-virtual {p0, p1, v0}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Ll/no90;->G:Lv/VText;

    .line 103
    .line 104
    invoke-virtual {p0, p1, v0}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Ll/no90;->N:Lv/VText_AutoFit;

    .line 108
    .line 109
    invoke-virtual {p0, p1, v0}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 110
    .line 111
    .line 112
    :cond_2
    invoke-virtual {p0}, Ll/on2;->p()Ll/ner;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 117
    .line 118
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 119
    .line 120
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-interface {p1, v1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    new-instance v1, Ll/ho90;

    .line 129
    .line 130
    invoke-direct {v1, p0}, Ll/ho90;-><init>(Ll/no90;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    new-instance v1, Ll/io90;

    .line 138
    .line 139
    invoke-direct {v1}, Ll/io90;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    new-instance v1, Ll/jo90;

    .line 147
    .line 148
    invoke-direct {v1, p0}, Ll/jo90;-><init>(Ll/no90;)V

    .line 149
    .line 150
    .line 151
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    if-eqz p1, :cond_4

    .line 167
    .line 168
    invoke-static {}, Ll/r43;->b()Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-eqz p1, :cond_3

    .line 173
    .line 174
    iget-object p0, p0, Ll/no90;->R:Lv/VText;

    .line 175
    .line 176
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Xk:I

    .line 177
    .line 178
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 179
    .line 180
    .line 181
    :cond_3
    return-void

    .line 182
    :cond_4
    iget-object p1, p0, Ll/no90;->R:Lv/VText;

    .line 183
    .line 184
    invoke-virtual {p0, p1, v0}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/data/User;)V
    .locals 12

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

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
    invoke-virtual {p0}, Ll/no90;->b0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {p1}, Ll/br5;->q(Lcom/p1/mobile/putong/data/User;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/no90;->x:Lv/VText;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-interface {v2}, Ll/nol;->act()Landroid/app/Activity;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    sget v3, Ll/dbc0;->oq:I

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v0, v1, v1, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/no90;->x:Lv/VText;

    .line 46
    .line 47
    const-string v2, "#03aeff"

    .line 48
    .line 49
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/no90;->x:Lv/VText;

    .line 57
    .line 58
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget-object v0, p0, Ll/no90;->x:Lv/VText;

    .line 65
    .line 66
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/pgj;->d()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->gpHideVip()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_1

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVip()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_1

    .line 94
    .line 95
    iget-object v0, p0, Ll/no90;->x:Lv/VText;

    .line 96
    .line 97
    invoke-direct {p0}, Ll/no90;->Z()Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    sget v3, Ll/c9c0;->O1:I

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 108
    .line 109
    .line 110
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/no90;->F:Lv/VText;

    .line 111
    .line 112
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 113
    .line 114
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    invoke-static {}, Ll/vq8;->b()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    const/4 v2, 0x1

    .line 126
    if-eqz v0, :cond_2

    .line 127
    .line 128
    iget-object v0, p0, Ll/no90;->I:Lcom/p1/mobile/putong/core/newui/home/views/WealthLevelView;

    .line 129
    .line 130
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 131
    .line 132
    const-string v4, "p_suggest_user_profile_info_view"

    .line 133
    .line 134
    invoke-virtual {v0, v3, v4, v2, v1}, Lcom/p1/mobile/putong/core/newui/home/views/WealthLevelView;->u(Lcom/p1/mobile/putong/data/LiveUserLevel;Ljava/lang/String;ZLl/x20;)V

    .line 135
    .line 136
    .line 137
    :cond_2
    iget-object v0, p0, Ll/no90;->N:Lv/VText_AutoFit;

    .line 138
    .line 139
    invoke-virtual {p0, p1, v0}, Ll/no90;->k0(Lcom/p1/mobile/putong/data/User;Lv/VText_AutoFit;)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 143
    .line 144
    iget-object v1, p0, Ll/no90;->F:Lv/VText;

    .line 145
    .line 146
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 147
    .line 148
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 149
    .line 150
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 151
    .line 152
    .line 153
    move-result v4

    .line 154
    const/4 v5, 0x0

    .line 155
    invoke-static {v1, v3, v4, v5, p1}, Ll/rgk0;->d(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/Gender;IZLcom/p1/mobile/putong/data/User;)V

    .line 156
    .line 157
    .line 158
    invoke-static {}, Ll/r43;->b()Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    const/high16 v3, 0x40800000    # 4.0f

    .line 163
    .line 164
    const-string v4, "UNKNOWN"

    .line 165
    .line 166
    if-eqz v1, :cond_3

    .line 167
    .line 168
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 169
    .line 170
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 171
    .line 172
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 173
    .line 174
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-nez v1, :cond_3

    .line 179
    .line 180
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 181
    .line 182
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 183
    .line 184
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 185
    .line 186
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    check-cast v1, Lcom/p1/mobile/putong/data/BloodType;

    .line 191
    .line 192
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-nez v1, :cond_3

    .line 197
    .line 198
    iget-object v1, p0, Ll/no90;->G:Lv/VText;

    .line 199
    .line 200
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 201
    .line 202
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 203
    .line 204
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 205
    .line 206
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v6

    .line 210
    check-cast v6, Lcom/p1/mobile/putong/data/BloodType;

    .line 211
    .line 212
    invoke-static {v6}, Ll/r43;->a(Lcom/p1/mobile/putong/data/BloodType;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v6

    .line 216
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    .line 218
    .line 219
    iget-object v1, p0, Ll/no90;->G:Lv/VText;

    .line 220
    .line 221
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 222
    .line 223
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 224
    .line 225
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 226
    .line 227
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    check-cast v0, Lcom/p1/mobile/putong/data/BloodType;

    .line 232
    .line 233
    invoke-static {v0}, Ll/q8g0;->o(Lcom/p1/mobile/putong/data/BloodType;)I

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 238
    .line 239
    .line 240
    move-result v3

    .line 241
    int-to-float v3, v3

    .line 242
    invoke-static {v0, v3}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 247
    .line 248
    .line 249
    goto :goto_1

    .line 250
    :cond_3
    iget-object v0, p0, Ll/no90;->G:Lv/VText;

    .line 251
    .line 252
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 253
    .line 254
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 255
    .line 256
    invoke-static {v1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    .line 262
    .line 263
    iget-object v0, p0, Ll/no90;->G:Lv/VText;

    .line 264
    .line 265
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 266
    .line 267
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 268
    .line 269
    invoke-static {v1}, Ll/q8g0;->l0(Lcom/p1/mobile/putong/data/ProfileZodiac;)I

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    int-to-float v3, v3

    .line 278
    invoke-static {v1, v3}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 283
    .line 284
    .line 285
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {v0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 290
    .line 291
    .line 292
    move-result-object v6

    .line 293
    invoke-direct {p0}, Ll/no90;->Z()Lcom/p1/mobile/android/app/Act;

    .line 294
    .line 295
    .line 296
    move-result-object v7

    .line 297
    iget-object v9, p0, Ll/no90;->H:Lv/VImage;

    .line 298
    .line 299
    const/4 v10, 0x1

    .line 300
    const/4 v11, 0x0

    .line 301
    move-object v8, p1

    .line 302
    invoke-interface/range {v6 .. v11}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->o7(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-interface {p1}, Ll/t3m;->P1()Z

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    if-nez p1, :cond_4

    .line 314
    .line 315
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 316
    .line 317
    .line 318
    move-result p1

    .line 319
    if-nez p1, :cond_4

    .line 320
    .line 321
    iget-object p1, p0, Ll/no90;->H:Lv/VImage;

    .line 322
    .line 323
    const/16 v0, 0x8

    .line 324
    .line 325
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 326
    .line 327
    .line 328
    :cond_4
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 329
    .line 330
    .line 331
    move-result-object p1

    .line 332
    invoke-interface {p1}, Ll/t3m;->P1()Z

    .line 333
    .line 334
    .line 335
    move-result p1

    .line 336
    iget-object v0, p0, Ll/no90;->J:Lv/VText;

    .line 337
    .line 338
    if-eqz p1, :cond_5

    .line 339
    .line 340
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 341
    .line 342
    .line 343
    iget-object p1, p0, Ll/no90;->K:Lv/VText;

    .line 344
    .line 345
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 346
    .line 347
    .line 348
    goto :goto_2

    .line 349
    :cond_5
    iget-object p1, p0, Ll/no90;->K:Lv/VText;

    .line 350
    .line 351
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    invoke-interface {v1}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 356
    .line 357
    .line 358
    move-result-object v1

    .line 359
    invoke-static {v0, p1, v8, v1, v5}, Ll/rgk0;->e(Lv/VText;Lv/VText;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Z)V

    .line 360
    .line 361
    .line 362
    :goto_2
    invoke-static {}, Ll/r43;->b()Z

    .line 363
    .line 364
    .line 365
    move-result p1

    .line 366
    if-eqz p1, :cond_8

    .line 367
    .line 368
    iget-object p1, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 369
    .line 370
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 371
    .line 372
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 373
    .line 374
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 375
    .line 376
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 377
    .line 378
    .line 379
    move-result p1

    .line 380
    if-nez p1, :cond_7

    .line 381
    .line 382
    iget-object p1, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 383
    .line 384
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 385
    .line 386
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 387
    .line 388
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 389
    .line 390
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    move-result-object p1

    .line 394
    check-cast p1, Lcom/p1/mobile/putong/data/BloodType;

    .line 395
    .line 396
    const-string v0, "unknown_"

    .line 397
    .line 398
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 399
    .line 400
    .line 401
    move-result p1

    .line 402
    if-nez p1, :cond_7

    .line 403
    .line 404
    iget-object p1, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 405
    .line 406
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 407
    .line 408
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 409
    .line 410
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 411
    .line 412
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    move-result-object p1

    .line 416
    check-cast p1, Lcom/p1/mobile/putong/data/BloodType;

    .line 417
    .line 418
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 419
    .line 420
    .line 421
    move-result p1

    .line 422
    iget-object p0, p0, Ll/no90;->G:Lv/VText;

    .line 423
    .line 424
    if-eqz p1, :cond_6

    .line 425
    .line 426
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 427
    .line 428
    .line 429
    return-void

    .line 430
    :cond_6
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 431
    .line 432
    .line 433
    return-void

    .line 434
    :cond_7
    iget-object p0, p0, Ll/no90;->G:Lv/VText;

    .line 435
    .line 436
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 437
    .line 438
    .line 439
    return-void

    .line 440
    :cond_8
    iget-object p0, p0, Ll/no90;->G:Lv/VText;

    .line 441
    .line 442
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 443
    .line 444
    .line 445
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/data/User;Lv/VText_AutoFit;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 22
    .line 23
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolName()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ll/no90;->a0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 81
    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v1, "  "

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, p1}, Ll/no90;->a0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_1
    invoke-virtual {p0, p1}, Ll/no90;->a0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_2

    .line 116
    .line 117
    const/16 p1, 0x8

    .line 118
    .line 119
    invoke-virtual {p0, p2, p1}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_2
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    :goto_0
    invoke-virtual {p2}, Lv/VText_AutoFit;->p()V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public l0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/no90;->L:Lv/VText;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

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
    sget v1, Ll/kec0;->ga:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/no90;->Y(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-object p1
.end method

.method public t()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

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
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

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
    :goto_0
    invoke-virtual {p0, v0}, Ll/no90;->j0(Lcom/p1/mobile/putong/data/User;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v1}, Ll/t3m;->m0()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p0, v1}, Ll/no90;->g0(Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/no90;->l0(Lcom/p1/mobile/putong/data/User;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/no90;->i0(Lcom/p1/mobile/putong/data/User;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/nrb0;->b()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    iget-object v1, p0, Ll/no90;->L:Lv/VText;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Ll/no90;->A:Landroid/widget/LinearLayout;

    .line 61
    .line 62
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/no90;->D:Lcom/p1/mobile/putong/core/newui/home/VerificationTagView;

    .line 66
    .line 67
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 71
    .line 72
    iget-object v1, v1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 73
    .line 74
    invoke-direct {p0}, Ll/no90;->Z()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    iget-object v3, p0, Ll/no90;->C:Lv/VImage;

    .line 79
    .line 80
    invoke-interface {v1, v2, v0, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_3

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const-string v1, "home_card"

    .line 102
    .line 103
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_3

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_2

    .line 122
    .line 123
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->letter()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_3

    .line 136
    .line 137
    :cond_2
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-static {v0}, Ll/br5;->q(Lcom/p1/mobile/putong/data/User;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_3

    .line 150
    .line 151
    iget-object v0, p0, Ll/no90;->x:Lv/VText;

    .line 152
    .line 153
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 162
    .line 163
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    sget v2, Ll/dbc0;->oq:I

    .line 168
    .line 169
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    const/4 v2, 0x0

    .line 174
    invoke-virtual {v0, v2, v2, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 175
    .line 176
    .line 177
    iget-object p0, p0, Ll/no90;->x:Lv/VText;

    .line 178
    .line 179
    const-string v0, "#03aeff"

    .line 180
    .line 181
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 186
    .line 187
    .line 188
    :cond_3
    return-void
.end method
