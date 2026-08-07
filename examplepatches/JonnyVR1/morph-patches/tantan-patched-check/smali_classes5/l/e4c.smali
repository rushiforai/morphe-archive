.class public Ll/e4c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/x3c;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

.field public c:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

.field public d:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Ll/x3c;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e4c;->e:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/e4c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e4c;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/e4c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e4c;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/e4c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e4c;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/e4c;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/e4c;->m(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic e(Ll/e4c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e4c;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/e4c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e4c;->s(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/e4c;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e4c;->e:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e4c;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic m(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/e4c;->c:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2
    .line 3
    xor-int/lit8 v0, p2, 0x1

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/e4c;->d:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 9
    .line 10
    xor-int/lit8 p1, p2, 0x1

    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/e4c;->b:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/e4c;->c:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/e4c;->d:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 16
    .line 17
    invoke-static {p0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 p1, 0x1

    .line 22
    invoke-static {v0, p1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/e4c;->d:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 26
    .line 27
    invoke-static {p0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/e4c;->c:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/e4c;->b:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p1, v0}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/e4c;->d:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/e4c;->d:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/e4c;->c:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p1, v0}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/e4c;->b:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/e4c;->c:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Ll/th0$a;

    .line 10
    .line 11
    iget-object v0, p0, Ll/e4c;->e:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "\u76ee\u524d\u6211\u4eec\u5c1a\u672a\u5b8c\u5168\u9002\u914d\u6df1\u8272\u6a21\u5f0f\uff0c\u5207\u6362\u540e\u53ef\u80fd\u4f1a\u89c2\u611f\u4e0d\u4f73\uff0c\u6211\u4eec\u5efa\u8bae\u60a8\u4fdd\u6301\u666e\u901a\u6a21\u5f0f"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p1, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "\u4ecd\u8981\u5207\u6362"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/e4c$b;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/e4c$b;-><init>(Ll/e4c;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v0, "\u6682\u4e0d\u5207\u6362"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v0, Ll/e4c$a;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/e4c$a;-><init>(Ll/e4c;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    sget-object p1, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->DAY:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/p1/mobile/android/ui/UIModeHelper;->g(Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/e4c;->e:Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 73
    .line 74
    .line 75
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/x3c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e4c;->k(Ll/x3c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e4c;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f4c;->b(Ll/e4c;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Ll/x3c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e4c;->f:Ll/x3c;

    .line 2
    .line 3
    return-void
.end method

.method public r()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/e4c;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v1, "\u6df1\u8272\u6a21\u5f0f"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/e4c;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/y3c;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/y3c;-><init>(Ll/e4c;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/e4c;->e:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Ll/kec0;->f2:I

    .line 25
    .line 26
    iget-object v2, p0, Ll/e4c;->a:Lv/navigationbar/VNavigationBar;

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lv/VButton;

    .line 34
    .line 35
    iget-object v1, p0, Ll/e4c;->a:Lv/navigationbar/VNavigationBar;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    new-array v4, v2, [Landroid/view/View;

    .line 39
    .line 40
    aput-object v0, v4, v3

    .line 41
    .line 42
    invoke-virtual {v1, v4}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/e4c;->b:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;->d:Lv/VSwitch;

    .line 48
    .line 49
    new-instance v4, Ll/z3c;

    .line 50
    .line 51
    invoke-direct {v4, p0}, Ll/z3c;-><init>(Ll/e4c;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v4}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ll/e4c;->b:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/android/ui/UIModeHelper;->a()Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    sget-object v5, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->FOLLOW_SYSTEM:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 64
    .line 65
    if-ne v4, v5, :cond_0

    .line 66
    .line 67
    move v4, v2

    .line 68
    goto :goto_0

    .line 69
    :cond_0
    move v4, v3

    .line 70
    :goto_0
    invoke-static {v1, v4}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Ll/e4c;->c:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/android/ui/UIModeHelper;->a()Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    sget-object v5, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->DAY:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 80
    .line 81
    if-ne v4, v5, :cond_1

    .line 82
    .line 83
    move v4, v2

    .line 84
    goto :goto_1

    .line 85
    :cond_1
    move v4, v3

    .line 86
    :goto_1
    invoke-static {v1, v4}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Ll/e4c;->d:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/android/ui/UIModeHelper;->a()Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    sget-object v5, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->NIGHT:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 96
    .line 97
    if-ne v4, v5, :cond_2

    .line 98
    .line 99
    move v3, v2

    .line 100
    :cond_2
    invoke-static {v1, v3}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Ll/e4c;->b:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 104
    .line 105
    new-instance v2, Ll/a4c;

    .line 106
    .line 107
    invoke-direct {v2, p0}, Ll/a4c;-><init>(Ll/e4c;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/e4c;->c:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 114
    .line 115
    new-instance v2, Ll/b4c;

    .line 116
    .line 117
    invoke-direct {v2, p0}, Ll/b4c;-><init>(Ll/e4c;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Ll/e4c;->d:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 124
    .line 125
    new-instance v2, Ll/c4c;

    .line 126
    .line 127
    invoke-direct {v2, p0}, Ll/c4c;-><init>(Ll/e4c;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    new-instance v1, Ll/d4c;

    .line 134
    .line 135
    invoke-direct {v1, p0}, Ll/d4c;-><init>(Ll/e4c;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method
