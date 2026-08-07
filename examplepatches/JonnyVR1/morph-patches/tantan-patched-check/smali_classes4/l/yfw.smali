.class public Ll/yfw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/xfw;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroidx/core/widget/NestedScrollView;

.field public c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;

.field public d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;

.field public e:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VButton;

.field public j:Lv/VProgressBar;

.field public final k:Lcom/p1/mobile/android/app/Act;

.field public l:Ll/xfw;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yfw;->k:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method private static c()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 56
    .line 57
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1, v0}, Ll/gj40;->P(Ljava/util/List;)Ll/gj40$h;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/gj40$h;->b()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    return-object v0

    .line 70
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    return-object v0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yfw;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zfw;->b(Ll/yfw;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/xfw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yfw;->l:Ll/xfw;

    .line 2
    .line 3
    return-void
.end method

.method public d(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    new-instance p1, Lv/VText;

    .line 2
    .line 3
    iget-object v0, p0, Ll/yfw;->k:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p1, v0}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "\u7f18\u5206\u96f7\u8fbe\u8bbe\u7f6e"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    const/high16 v0, 0x41a80000    # 21.0f

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/yfw;->k:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Ll/b9c0;->c:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    const/high16 v0, 0x40000000    # 2.0f

    .line 34
    .line 35
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {p1, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    const/4 v2, 0x1

    .line 45
    invoke-virtual {p1, v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/yfw;->a:Lv/navigationbar/VNavigationBar;

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationBar;->setTitleView(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/yfw;->a:Lv/navigationbar/VNavigationBar;

    .line 54
    .line 55
    iget-object v0, p0, Ll/yfw;->k:Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/yfw;->i:Lv/VButton;

    .line 61
    .line 62
    new-instance v0, Ll/yfw$a;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/yfw$a;-><init>(Ll/yfw;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Ll/yfw;->c()Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget-object p0, p0, Ll/yfw;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;

    .line 79
    .line 80
    if-eqz p1, :cond_0

    .line 81
    .line 82
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->setShowInterest(Z)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_0
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->setShowInterest(Z)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yfw;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Ll/yfw$f;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/yfw$f;-><init>(Ll/yfw;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x64

    .line 9
    .line 10
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yfw;->b:Landroidx/core/widget/NestedScrollView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/yfw;->f:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/yfw;->j:Lv/VProgressBar;

    .line 14
    .line 15
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yfw;->b:Landroidx/core/widget/NestedScrollView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/yfw;->f:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/yfw;->j:Lv/VProgressBar;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xfw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yfw;->b(Ll/xfw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yfw;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/core/data/FateRadar;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/yfw;->b:Landroidx/core/widget/NestedScrollView;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/yfw;->f:Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/yfw;->j:Lv/VProgressBar;

    .line 17
    .line 18
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FateRadar;->switchSetting:Lcom/p1/mobile/putong/core/data/FateRadarSwitchStatus;

    .line 22
    .line 23
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/FateRadarSwitchStatus;->status:Z

    .line 24
    .line 25
    iget-object v3, p0, Ll/yfw;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string v0, "open"

    .line 30
    .line 31
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->setCurState(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string v0, "close"

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->setCurState(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    move v1, v2

    .line 41
    :goto_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v2, "switch_config_type"

    .line 50
    .line 51
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    filled-new-array {v1}, [Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v2, "e_love_radar_switch"

    .line 64
    .line 65
    invoke-static {v2, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/yfw;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;

    .line 69
    .line 70
    new-instance v1, Ll/yfw$b;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/yfw$b;-><init>(Ll/yfw;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->setAfterChangeStateListener(Ll/y20;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/yfw;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;

    .line 79
    .line 80
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->c(Lcom/p1/mobile/putong/core/data/FateRadar;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FateRadar;->searchConditions:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;->option:Ljava/lang/String;

    .line 86
    .line 87
    const-string v1, "custom"

    .line 88
    .line 89
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iget-object v2, p0, Ll/yfw;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;

    .line 94
    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->d()V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->e()V

    .line 102
    .line 103
    .line 104
    :goto_1
    iget-object v0, p0, Ll/yfw;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;

    .line 105
    .line 106
    new-instance v2, Ll/yfw$c;

    .line 107
    .line 108
    invoke-direct {v2, p0, p1}, Ll/yfw$c;-><init>(Ll/yfw;Lcom/p1/mobile/putong/core/data/FateRadar;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->setAfterChangeStateListener(Ll/y20;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/yfw;->e:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 115
    .line 116
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->f(Lcom/p1/mobile/putong/core/data/FateRadar;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/yfw;->e:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 120
    .line 121
    new-instance v2, Ll/yfw$d;

    .line 122
    .line 123
    invoke-direct {v2, p0, p1}, Ll/yfw$d;-><init>(Ll/yfw;Lcom/p1/mobile/putong/core/data/FateRadar;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->setAfterChangeStateListener(Ll/y20;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/yfw;->e:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 130
    .line 131
    new-instance v2, Ll/yfw$e;

    .line 132
    .line 133
    invoke-direct {v2, p0}, Ll/yfw$e;-><init>(Ll/yfw;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->setDelGreetingListener(Ll/y20;)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/FateRadar;->greetings:Lcom/p1/mobile/putong/core/data/FateRadarGreeting;

    .line 140
    .line 141
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/FateRadarGreeting;->option:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    iget-object p0, p0, Ll/yfw;->e:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 148
    .line 149
    if-eqz p1, :cond_3

    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->i()V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->j()V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yfw;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "open"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p1, "close"

    .line 9
    .line 10
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->d(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
