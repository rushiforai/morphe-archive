.class public Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Landroidx/recyclerview/widget/RecyclerView;

.field public final B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public final C:Ll/cpt;

.field public final D:Ll/cpt;

.field public final E:Ll/cpt;

.field public final F:Ll/apt;

.field public final G:Ll/apt;

.field public final H:Ll/cpt;

.field public final I:Ll/cpt;

.field public J:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveSettingArgs;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public z:Lv/navigationbar/VNavigationBar;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 10
    .line 11
    new-instance v0, Ll/cpt;

    .line 12
    .line 13
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 14
    .line 15
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->j0:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-direct {v0, v1, v2}, Ll/cpt;-><init>(Ljava/lang/CharSequence;Z)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->C:Ll/cpt;

    .line 26
    .line 27
    new-instance v0, Ll/cpt;

    .line 28
    .line 29
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 30
    .line 31
    sget v3, Lcom/p1/mobile/putong/live/base/R$string;->t0:I

    .line 32
    .line 33
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, v1, v2}, Ll/cpt;-><init>(Ljava/lang/CharSequence;Z)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->D:Ll/cpt;

    .line 41
    .line 42
    new-instance v0, Ll/cpt;

    .line 43
    .line 44
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 45
    .line 46
    sget v3, Lcom/p1/mobile/putong/live/base/R$string;->E1:I

    .line 47
    .line 48
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const/4 v3, 0x1

    .line 53
    invoke-direct {v0, v1, v3}, Ll/cpt;-><init>(Ljava/lang/CharSequence;Z)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->E:Ll/cpt;

    .line 57
    .line 58
    new-instance v0, Ll/apt;

    .line 59
    .line 60
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 61
    .line 62
    sget v3, Lcom/p1/mobile/putong/live/base/R$string;->y0:I

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-direct {v0, v1}, Ll/apt;-><init>(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->F:Ll/apt;

    .line 72
    .line 73
    new-instance v0, Ll/apt;

    .line 74
    .line 75
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 76
    .line 77
    sget v3, Lcom/p1/mobile/putong/live/base/R$string;->i0:I

    .line 78
    .line 79
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-direct {v0, v1}, Ll/apt;-><init>(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->G:Ll/apt;

    .line 87
    .line 88
    new-instance v0, Ll/cpt;

    .line 89
    .line 90
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 91
    .line 92
    sget v3, Lcom/p1/mobile/putong/live/base/R$string;->S:I

    .line 93
    .line 94
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-direct {v0, v1, v2}, Ll/cpt;-><init>(Ljava/lang/CharSequence;Z)V

    .line 99
    .line 100
    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->H:Ll/cpt;

    .line 102
    .line 103
    new-instance v0, Ll/cpt;

    .line 104
    .line 105
    const-string v1, "\u5207\u6362\u540e\u53f0\u65f6\u81ea\u52a8\u5524\u8d77\u5c0f\u7a97"

    .line 106
    .line 107
    invoke-direct {v0, v1, v2}, Ll/cpt;-><init>(Ljava/lang/CharSequence;Z)V

    .line 108
    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->I:Ll/cpt;

    .line 111
    .line 112
    const/4 v0, 0x0

    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->J:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveSettingArgs;

    .line 114
    .line 115
    new-instance v0, Ll/pot;

    .line 116
    .line 117
    invoke-direct {v0, p0}, Ll/pot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public static D5(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static F5(Z)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "off"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "on"

    .line 7
    .line 8
    :goto_0
    const-string v0, "type"

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "e_live_change_profile_entrance"

    .line 19
    .line 20
    const-string v1, "p_live_setting"

    .line 21
    .line 22
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;ZLcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->r5(ZLcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic N4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic O4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->p5(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->v5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;ZLcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->A5(ZLcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;ZLcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B5(ZLcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic T4(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->y5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic U4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/wrv;->v0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->w5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->u5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->x5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->q5(Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic Z4(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->k5(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic a5(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->o5()V

    return-void
.end method

.method public static synthetic b5(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->s5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c5(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;ZLcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->C5(ZLcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic d5(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->t5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e5(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->z5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private k5(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->n5()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Ll/ynp0;->k(Landroidx/appcompat/widget/Toolbar;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/mbs;->x()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/rot;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/rot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/sot;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/sot;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic z5(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic A5(ZLcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/wya0;->b()Ll/wya0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2, p1}, Ll/wya0;->c(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->C:Ll/cpt;

    .line 11
    .line 12
    new-instance v0, Ll/j0f;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ll/j0f;-><init>(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2, p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic B5(ZLcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->D:Ll/cpt;

    .line 4
    .line 5
    new-instance v0, Ll/j0f;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/j0f;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic C5(ZLcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->E:Ll/cpt;

    .line 4
    .line 5
    new-instance v0, Ll/j0f;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/j0f;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final E5()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->s()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->m()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/mqr;->p()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    :cond_0
    invoke-static {}, Ll/mbs;->w()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->C:Ll/cpt;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {v3, v2}, Ll/cpt;->I(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->C:Ll/cpt;

    .line 49
    .line 50
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    sget-object v2, Ll/tbs;->b:Ll/vwt;

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/vwt;->Q6()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    invoke-static {}, Ll/mbs;->w()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 68
    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-nez v2, :cond_2

    .line 76
    .line 77
    const/4 v2, 0x1

    .line 78
    goto :goto_0

    .line 79
    :cond_2
    const/4 v2, 0x0

    .line 80
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->D:Ll/cpt;

    .line 81
    .line 82
    invoke-virtual {v3, v2}, Ll/cpt;->I(Z)V

    .line 83
    .line 84
    .line 85
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->D:Ll/cpt;

    .line 86
    .line 87
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_3
    invoke-static {}, Ll/mbs;->w()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 95
    .line 96
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 97
    .line 98
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->E:Ll/cpt;

    .line 103
    .line 104
    invoke-virtual {v3, v2}, Ll/cpt;->I(Z)V

    .line 105
    .line 106
    .line 107
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->E:Ll/cpt;

    .line 108
    .line 109
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    sget-object v2, Ll/tbs;->b:Ll/vwt;

    .line 113
    .line 114
    invoke-virtual {v2}, Ll/vwt;->Q6()Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-eqz v2, :cond_4

    .line 119
    .line 120
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v2}, Ll/p6s;->G1()Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_4

    .line 129
    .line 130
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {v2, v3}, Ll/wrv;->P(Landroid/content/Context;)Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->I:Ll/cpt;

    .line 141
    .line 142
    invoke-virtual {v3, v2}, Ll/cpt;->I(Z)V

    .line 143
    .line 144
    .line 145
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->I:Ll/cpt;

    .line 146
    .line 147
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    :cond_4
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-nez v1, :cond_5

    .line 155
    .line 156
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->s()Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-eqz v1, :cond_7

    .line 161
    .line 162
    :cond_5
    invoke-static {}, Ll/mqr;->d()Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-eqz v1, :cond_6

    .line 167
    .line 168
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->H:Ll/cpt;

    .line 169
    .line 170
    invoke-static {}, Ll/mbs;->w()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 175
    .line 176
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 177
    .line 178
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    invoke-virtual {v1, v2}, Ll/cpt;->I(Z)V

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->H:Ll/cpt;

    .line 186
    .line 187
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    :cond_6
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v1}, Ll/ppi0;->k()Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    if-eqz v1, :cond_7

    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->F:Ll/apt;

    .line 201
    .line 202
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    :cond_7
    invoke-static {}, Ll/zw80;->e()Z

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    if-eqz v1, :cond_8

    .line 210
    .line 211
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->G:Ll/apt;

    .line 212
    .line 213
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 217
    .line 218
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 219
    .line 220
    .line 221
    return-void
.end method

.method public final G5(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->l5()Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {v0}, Ll/mbs;->N(Lcom/p1/mobile/putong/data/UserLiveSettings;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/jot;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1}, Ll/jot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Z)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/kot;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/kot;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final H5(Z)V
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->d:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/bk3;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/bk3;->e(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final I5(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->l5()Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    xor-int/lit8 v1, p1, 0x1

    .line 6
    .line 7
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-static {v0}, Ll/mbs;->N(Lcom/p1/mobile/putong/data/UserLiveSettings;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/not;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, Ll/not;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Z)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/oot;

    .line 27
    .line 28
    invoke-direct {p0}, Ll/oot;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final J5(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->l5()Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {v0}, Ll/mbs;->N(Lcom/p1/mobile/putong/data/UserLiveSettings;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/lot;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1}, Ll/lot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Z)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/mot;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/mot;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "live_setting_frag_arg"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveSettingArgs;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->J:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveSettingArgs;

    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->z:Lv/navigationbar/VNavigationBar;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->U:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->z:Lv/navigationbar/VNavigationBar;

    .line 20
    .line 21
    new-instance v0, Ll/eot;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/eot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->A:Landroidx/recyclerview/widget/RecyclerView;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->E5()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public h5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zot;->b(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final i5()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->H5(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->I:Ll/cpt;

    .line 8
    .line 9
    new-instance v2, Ll/j0f;

    .line 10
    .line 11
    invoke-direct {v2, v0}, Ll/j0f;-><init>(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p0, v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->h5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j5()V
    .locals 2

    .line 1
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->i5()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/nti;->a(Landroid/content/Context;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->front()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/got;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/got;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/hot;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/hot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final l5()Lcom/p1/mobile/putong/data/UserLiveSettings;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserLiveSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->D:Ll/cpt;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/cpt;->H()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    xor-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->E:Ll/cpt;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/cpt;->H()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->E:Ll/cpt;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/cpt;->H()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->H:Ll/cpt;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/cpt;->H()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 55
    .line 56
    return-object v0
.end method

.method public final m5(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "on"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "off"

    .line 7
    .line 8
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->pageId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "live_setting_switch"

    .line 13
    .line 14
    invoke-static {v2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    filled-new-array {v0}, [Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v2, "e_live_setting_hide_voice_status"

    .line 23
    .line 24
    invoke-static {v2, v1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->l5()Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-static {v0}, Ll/mbs;->N(Lcom/p1/mobile/putong/data/UserLiveSettings;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/iot;

    .line 46
    .line 47
    invoke-direct {v1, p0, p1}, Ll/iot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;Z)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final n5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->F:Ll/apt;

    .line 2
    .line 3
    new-instance v1, Ll/tot;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/tot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->C:Ll/cpt;

    .line 12
    .line 13
    new-instance v1, Ll/uot;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/uot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->D:Ll/cpt;

    .line 22
    .line 23
    new-instance v1, Ll/vot;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/vot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->E:Ll/cpt;

    .line 32
    .line 33
    new-instance v1, Ll/wot;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/wot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->G:Ll/apt;

    .line 42
    .line 43
    new-instance v1, Ll/xot;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/xot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->H:Ll/cpt;

    .line 52
    .line 53
    new-instance v1, Ll/yot;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/yot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->I:Ll/cpt;

    .line 62
    .line 63
    new-instance v1, Ll/fot;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/fot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic o5()V
    .locals 2

    .line 1
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->j5()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->I:Ll/cpt;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->I:Ll/cpt;

    .line 27
    .line 28
    new-instance v3, Ll/j0f;

    .line 29
    .line 30
    invoke-direct {v3, v0}, Ll/j0f;-><init>(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 34
    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->H5(Z)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final synthetic p5(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->i5()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance p1, Ll/qot;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ll/qot;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;)V

    .line 20
    .line 21
    .line 22
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 23
    .line 24
    const-wide/16 v0, 0x7d0

    .line 25
    .line 26
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_setting"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic q5(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->E5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r5(ZLcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->H:Ll/cpt;

    .line 4
    .line 5
    new-instance v0, Ll/j0f;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/j0f;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic s5(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ll/ppi0;->C(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic t5(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->C:Ll/cpt;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/cpt;->H()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->F5(Z)V

    .line 8
    .line 9
    .line 10
    xor-int/lit8 p1, p1, 0x1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->G5(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic u5(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->D:Ll/cpt;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/cpt;->H()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->I5(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic v5(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->E:Ll/cpt;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/cpt;->H()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->J5(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic w5(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "privacy_setting"

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic x5(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->H:Ll/cpt;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/cpt;->H()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->m5(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic y5(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->I:Ll/cpt;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/cpt;->H()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->B:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->I:Ll/cpt;

    .line 12
    .line 13
    new-instance v1, Ll/j0f;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {v1, v2}, Ll/j0f;-><init>(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->H5(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->j5()V

    .line 27
    .line 28
    .line 29
    return-void
.end method
