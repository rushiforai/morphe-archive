.class public Ll/rt60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VProgressBar;

.field public d:Lv/VScroll;

.field public e:Lv/VLinear;

.field public f:Lv/VText;

.field public g:Lv/VLinear;

.field public h:Lv/VText;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lv/VLinear;

.field public l:Lv/VText;

.field public m:Lv/VLinear;

.field public n:Lv/VText;

.field public o:Lv/VDraweeView;

.field public p:Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;

.field public q:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

.field public s:Z

.field public t:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/rt60;->s:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/rt60;->t:Z

    .line 9
    .line 10
    iput-object p1, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 11
    .line 12
    return-void
.end method

.method private synthetic A(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rt60;->p:Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->E0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 2
    .line 3
    invoke-static {p1}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p1, v0}, Ll/w1e$b;->E(I)Ll/w1e$b;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/16 v0, 0x32

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ll/w1e$b;->D(I)Ll/w1e$b;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/rt60;->p:Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->p0()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Ll/w1e$b;->H(Ljava/lang/String;)Ll/w1e$b;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/qt60;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/qt60;-><init>(Ll/rt60;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Ll/bt60;

    .line 38
    .line 39
    invoke-direct {p1}, Ll/bt60;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/w1e$b;->J(Ll/qcj;)Ll/w1e$b;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private synthetic E(Landroid/view/View;)V
    .locals 5

    .line 1
    new-instance p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Lcom/p1/mobile/putong/core/R$string;->s0:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Lcom/p1/mobile/putong/core/R$string;->u0:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/core/R$string;->v0:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sget v1, Lcom/p1/mobile/putong/core/R$string;->t0:I

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget v1, Lcom/p1/mobile/putong/core/R$string;->w0:I

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    const-string v0, "AB"

    .line 92
    .line 93
    const-string v1, "UNKNOWN"

    .line 94
    .line 95
    const-string v2, "A"

    .line 96
    .line 97
    const-string v3, "B"

    .line 98
    .line 99
    const-string v4, "O"

    .line 100
    .line 101
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    const-string v2, "p_blood_type_dialog"

    .line 116
    .line 117
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    sget v3, Lcom/p1/mobile/putong/core/R$string;->r0:I

    .line 133
    .line 134
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-virtual {v2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    new-instance v3, Ll/ot60;

    .line 143
    .line 144
    invoke-direct {v3, p0, p1, v0}, Ll/ot60;-><init>(Ll/rt60;Ljava/util/List;Ljava/util/List;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    new-instance p1, Ll/pt60;

    .line 158
    .line 159
    invoke-direct {p1, v1}, Ll/pt60;-><init>(Ll/l4g0;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/rt60;->C0()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "personal_information"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/settings/addemoji/AddEmojiAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/16 v0, 0x214

    .line 16
    .line 17
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private M()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 2
    .line 3
    new-instance v1, Ll/dt60;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/dt60;-><init>(Ll/rt60;)V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ll/et60;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ll/et60;-><init>(Ll/rt60;)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ll/ft60;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/ft60;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->I1(Lcom/p1/mobile/android/app/Act;Ll/pcj;Ll/y20;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "e_edit_basic_info_calendar"

    .line 22
    .line 23
    const-string v0, "p_edit_basic_info_view"

    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Ll/rt60;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rt60;->z(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic b(Ll/rt60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rt60;->M()V

    return-void
.end method

.method public static synthetic c(Ll/rt60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rt60;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/rt60;Ljava/lang/Double;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rt60;->I(Ljava/lang/Double;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Ll/rt60;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/rt60;->C(Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic i(Ll/rt60;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rt60;->A(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j(Ll/rt60;Ljava/lang/Double;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rt60;->H(Ljava/lang/Double;)V

    return-void
.end method

.method public static synthetic k(Ll/rt60;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rt60;->K(Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Landroid/text/Spannable;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bsj0;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic m(Ll/rt60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rt60;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/rt60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rt60;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Ll/rt60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rt60;->J()V

    return-void
.end method

.method public static synthetic s(Ll/rt60;)Ljava/lang/Double;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rt60;->G()Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v(Ll/rt60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rt60;->E(Landroid/view/View;)V

    return-void
.end method

.method private synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

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
.method public final synthetic C(Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ge p5, p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/rt60;->p:Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;

    .line 8
    .line 9
    invoke-interface {p2, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/data/BloodType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BloodType;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->C0(Lcom/p1/mobile/putong/data/BloodType;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic G()Ljava/lang/Double;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rt60;->p:Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->o0()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic H(Ljava/lang/Double;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rt60;->p:Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->A0(D)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic I(Ljava/lang/Double;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/rt60;->p:Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->o0()D

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    cmpl-double v0, v0, v2

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :cond_0
    new-instance v0, Ll/jl80$a;

    .line 18
    .line 19
    iget-object v1, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    sget-object v1, Ll/pzi0;->b:Ljava/text/SimpleDateFormat;

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 35
    .line 36
    sget v2, Lcom/p1/mobile/putong/core/R$string;->w9:I

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 47
    .line 48
    sget v2, Lcom/p1/mobile/putong/core/R$string;->h:I

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v2, Ll/gt60;

    .line 55
    .line 56
    invoke-direct {v2, p0, p1}, Ll/gt60;-><init>(Ll/rt60;Ljava/lang/Double;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1, v2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v1, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 64
    .line 65
    sget v2, Lcom/p1/mobile/putong/core/R$string;->y:I

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    new-instance v2, Ll/nt60;

    .line 72
    .line 73
    invoke-direct {v2, p0}, Ll/nt60;-><init>(Ll/rt60;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1, v2}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const/4 v1, 0x1

    .line 81
    invoke-virtual {v0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 86
    .line 87
    .line 88
    iget-boolean v0, p0, Ll/rt60;->t:Z

    .line 89
    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 95
    .line 96
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-nez p1, :cond_1

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 117
    .line 118
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 123
    .line 124
    const/4 v1, 0x0

    .line 125
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Al:I

    .line 136
    .line 137
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    new-instance v2, Ll/ht60;

    .line 142
    .line 143
    invoke-direct {v2}, Ll/ht60;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-static {p1, v1, v0, p0, v2}, Ll/qtk;->V0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 147
    .line 148
    .line 149
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic J()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rt60;->i:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic K(Ljava/util/List;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/vb0;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const-string v0, "edit_failed_reason"

    .line 6
    .line 7
    const-string v1, "p_edit_basic_info_view"

    .line 8
    .line 9
    const-string v2, "e_age_verify_edit_age"

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const-string p0, "verify_pending"

    .line 14
    .line 15
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    filled-new-array {p0}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v2, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    sget p0, Lcom/p1/mobile/putong/core/R$string;->L:I

    .line 27
    .line 28
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-static {}, Ll/vb0;->e()Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    const-string p0, "verify_succeed"

    .line 39
    .line 40
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    filled-new-array {p0}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {v2, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    sget p0, Lcom/p1/mobile/putong/core/R$string;->K:I

    .line 52
    .line 53
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-nez p2, :cond_2

    .line 62
    .line 63
    const/4 p2, 0x0

    .line 64
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 71
    .line 72
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->birthChanged:Z

    .line 73
    .line 74
    if-nez p1, :cond_2

    .line 75
    .line 76
    new-instance p1, Ll/jl80$a;

    .line 77
    .line 78
    iget-object p2, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 79
    .line 80
    invoke-direct {p1, p2}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 81
    .line 82
    .line 83
    iget-object p2, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 84
    .line 85
    sget v0, Lcom/p1/mobile/putong/core/R$string;->y9:I

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p1, p2}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-object p2, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 96
    .line 97
    sget v0, Lcom/p1/mobile/putong/core/R$string;->x9:I

    .line 98
    .line 99
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-virtual {p1, p2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object p2, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 108
    .line 109
    sget v0, Lcom/p1/mobile/putong/core/R$string;->v9:I

    .line 110
    .line 111
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    new-instance v0, Ll/nt60;

    .line 116
    .line 117
    invoke-direct {v0, p0}, Ll/nt60;-><init>(Ll/rt60;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, p2, v0}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const/4 p1, 0x1

    .line 125
    invoke-virtual {p0, p1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 130
    .line 131
    .line 132
    :cond_2
    return-void
.end method

.method public L()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rt60;->d:Lv/VScroll;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x4

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/rt60;->d:Lv/VScroll;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/rt60;->c:Lv/VProgressBar;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/rt60;->t:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/ct60;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/ct60;-><init>(Ll/rt60;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rt60;->f:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/rt60;->q:Ljava/util/Map;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/CharSequence;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/rt60;->h:Lv/VText;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/rt60;->j:Lv/VText;

    .line 28
    .line 29
    sget-object v1, Ll/pzi0;->b:Ljava/text/SimpleDateFormat;

    .line 30
    .line 31
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const/4 v1, 0x0

    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    iget-object v0, p0, Ll/rt60;->l:Lv/VText;

    .line 58
    .line 59
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 62
    .line 63
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 64
    .line 65
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/p1/mobile/putong/data/BloodType;

    .line 72
    .line 73
    invoke-static {v2}, Ll/r43;->a(Lcom/p1/mobile/putong/data/BloodType;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 81
    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 83
    .line 84
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_1

    .line 89
    .line 90
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 97
    .line 98
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->birthChanged:Z

    .line 99
    .line 100
    if-nez v0, :cond_1

    .line 101
    .line 102
    iget-object v0, p0, Ll/rt60;->j:Lv/VText;

    .line 103
    .line 104
    sget v1, Ll/c9c0;->S1:I

    .line 105
    .line 106
    invoke-static {v1}, Ll/k3d0;->a(I)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/rt60;->i:Lv/VLinear;

    .line 114
    .line 115
    new-instance v1, Ll/at60;

    .line 116
    .line 117
    invoke-direct {v1, p0, p1}, Ll/at60;-><init>(Ll/rt60;Ljava/util/List;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_1
    iget-object p1, p0, Ll/rt60;->j:Lv/VText;

    .line 125
    .line 126
    sget v0, Ll/c9c0;->c0:I

    .line 127
    .line 128
    invoke-static {v0}, Ll/k3d0;->a(I)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Ll/rt60;->i:Lv/VLinear;

    .line 136
    .line 137
    const/4 p1, 0x0

    .line 138
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public P()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/rt60;->m:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget-object v3, p0, Ll/rt60;->n:Lv/VText;

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/rt60;->o:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Ll/rt60;->m:Lv/VLinear;

    .line 41
    .line 42
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 46
    .line 47
    iget-object p0, p0, Ll/rt60;->o:Lv/VDraweeView;

    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    sget-object v3, Ll/uqb0;->X:Ll/hj5;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v3, v0}, Ll/hj5;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v0, ".png"

    .line 78
    .line 79
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v1, p0, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_0
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ll/rt60;->o:Lv/VDraweeView;

    .line 94
    .line 95
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 2
    .line 3
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
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rt60;->x(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rt60;->w(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rt60;->j:Lv/VText;

    .line 2
    .line 3
    sget v1, Ll/c9c0;->c0:I

    .line 4
    .line 5
    invoke-static {v1}, Ll/k3d0;->a(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/rt60;->b:Lv/navigationbar/VNavigationBar;

    .line 13
    .line 14
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/dbc0;->q:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/rt60;->b:Lv/navigationbar/VNavigationBar;

    .line 24
    .line 25
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Vn:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/rt60;->b:Lv/navigationbar/VNavigationBar;

    .line 31
    .line 32
    new-instance v1, Ll/it60;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/it60;-><init>(Ll/rt60;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/l01;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Ll/rt60;->q:Ljava/util/Map;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ap:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v2, "male"

    .line 62
    .line 63
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/rt60;->q:Ljava/util/Map;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Zo:I

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const-string v2, "female"

    .line 83
    .line 84
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    new-instance v0, Ll/jt60;

    .line 88
    .line 89
    invoke-direct {v0, p0}, Ll/jt60;-><init>(Ll/rt60;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/rt60;->g:Lv/VLinear;

    .line 93
    .line 94
    new-instance v1, Ll/kt60;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/kt60;-><init>(Ll/rt60;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/rt60;->k:Lv/VLinear;

    .line 103
    .line 104
    invoke-static {}, Ll/r43;->b()Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/rt60;->k:Lv/VLinear;

    .line 112
    .line 113
    new-instance v1, Ll/lt60;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/lt60;-><init>(Ll/rt60;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ll/rt60;->P()V

    .line 122
    .line 123
    .line 124
    new-instance v0, Ll/mt60;

    .line 125
    .line 126
    invoke-direct {v0, p0}, Ll/mt60;-><init>(Ll/rt60;)V

    .line 127
    .line 128
    .line 129
    iget-object v1, p0, Ll/rt60;->m:Lv/VLinear;

    .line 130
    .line 131
    invoke-virtual {v1, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Ll/rt60;->o:Lv/VDraweeView;

    .line 135
    .line 136
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public w(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/st60;->b(Ll/rt60;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public x(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rt60;->p:Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic z(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/rt60;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/rt60;->s:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/rt60;->r:Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget v1, Lcom/p1/mobile/putong/core/R$string;->b4:I

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget v1, Lcom/p1/mobile/putong/core/R$string;->c4:I

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget v1, Lcom/p1/mobile/putong/core/R$string;->T:I

    .line 27
    .line 28
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 48
    .line 49
    .line 50
    return-void
.end method
