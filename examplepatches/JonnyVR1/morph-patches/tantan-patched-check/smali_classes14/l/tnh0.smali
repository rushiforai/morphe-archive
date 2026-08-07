.class public Ll/tnh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/mnh0;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VImage;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

.field public g:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

.field public h:Lv/VButton_FakeShadowSmall;

.field public i:Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

.field public j:Z

.field public k:Ll/mnh0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/tnh0;->j:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/tnh0;->i:Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Ll/tnh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tnh0;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/tnh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tnh0;->q()V

    return-void
.end method

.method public static synthetic e(Ll/tnh0;Lcom/p1/mobile/putong/data/RememberUserInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/tnh0;->s(Lcom/p1/mobile/putong/data/RememberUserInfo;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/tnh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tnh0;->p()V

    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tnh0;->j()Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic p()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tnh0;->k:Ll/mnh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mnh0;->s0()Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/tnh0;->f:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 8
    .line 9
    new-instance v2, Ll/rnh0;

    .line 10
    .line 11
    invoke-direct {v2}, Ll/rnh0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;->d(Ll/x20;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-direct {p0, v1}, Ll/tnh0;->w(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/tnh0;->f:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;->setData(Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/tnh0;->g:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;->setData(Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tnh0;->k:Ll/mnh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mnh0;->t0()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/tnh0;->g:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 7
    .line 8
    new-instance v1, Ll/snh0;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/snh0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;->d(Ll/x20;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-direct {p0, v0}, Ll/tnh0;->w(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic s(Lcom/p1/mobile/putong/data/RememberUserInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/tnh0;->k:Ll/mnh0;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Ll/mnh0;->q0(Lcom/p1/mobile/putong/data/RememberUserInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/tnh0;->f:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 10
    .line 11
    new-instance p2, Ll/pnh0;

    .line 12
    .line 13
    invoke-direct {p2, p0}, Ll/pnh0;-><init>(Ll/tnh0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;->d(Ll/x20;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p1, p0, Ll/tnh0;->g:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 22
    .line 23
    new-instance p2, Ll/qnh0;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/qnh0;-><init>(Ll/tnh0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;->d(Ll/x20;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    :goto_0
    invoke-direct {p0, p1}, Ll/tnh0;->w(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private w(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tnh0;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/tnh0;->j()Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->U3:I

    .line 15
    .line 16
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/tnh0;->h:Lv/VButton_FakeShadowSmall;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/tnh0;->j()Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->W:I

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/tnh0;->e:Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/tnh0;->f:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/tnh0;->g:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    invoke-virtual {p0}, Ll/tnh0;->j()Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->T3:I

    .line 67
    .line 68
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/tnh0;->e:Landroid/widget/TextView;

    .line 76
    .line 77
    const/4 v0, 0x4

    .line 78
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/tnh0;->f:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 82
    .line 83
    const/4 v0, 0x1

    .line 84
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/tnh0;->g:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/tnh0;->k:Ll/mnh0;

    .line 93
    .line 94
    invoke-virtual {p1}, Ll/mnh0;->x0()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    iget-object v0, p0, Ll/tnh0;->h:Lv/VButton_FakeShadowSmall;

    .line 99
    .line 100
    if-eqz p1, :cond_1

    .line 101
    .line 102
    const/16 p0, 0x8

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ll/tnh0;->h:Lv/VButton_FakeShadowSmall;

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/tnh0;->j()Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->U3:I

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tnh0;->i:Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tnh0;->j()Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/unh0;->b(Ll/tnh0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mnh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tnh0;->k(Ll/mnh0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tnh0;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j()Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tnh0;->i:Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ll/mnh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tnh0;->k:Ll/mnh0;

    .line 2
    .line 3
    return-void
.end method

.method public l(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Ll/tnh0;->j:Z

    .line 5
    .line 6
    :cond_0
    iget-object v0, p0, Ll/tnh0;->f:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/tnh0;->g:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/tnh0;->h:Lv/VButton_FakeShadowSmall;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/RememberUserInfo;Lcom/p1/mobile/putong/data/RememberUserInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tnh0;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    new-instance v1, Ll/nnh0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/nnh0;-><init>(Ll/tnh0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/tnh0;->f:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;->setData(Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/tnh0;->f:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/tnh0;->g:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;->setData(Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/tnh0;->g:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Ll/tnh0;->h:Lv/VButton_FakeShadowSmall;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/tnh0;->h:Lv/VButton_FakeShadowSmall;

    .line 44
    .line 45
    new-instance v1, Ll/onh0;

    .line 46
    .line 47
    invoke-direct {v1, p0, p1}, Ll/onh0;-><init>(Ll/tnh0;Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/tnh0;->u(Lcom/p1/mobile/putong/data/RememberUserInfo;Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/tnh0;->l(Z)V

    .line 3
    .line 4
    .line 5
    iget-boolean v0, p0, Ll/tnh0;->j:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/tnh0;->j:Z

    .line 12
    .line 13
    iget-object v0, p0, Ll/tnh0;->f:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Ll/tnh0;->k:Ll/mnh0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/mnh0;->o0()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object v0, p0, Ll/tnh0;->g:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 24
    .line 25
    if-ne p1, v0, :cond_2

    .line 26
    .line 27
    iget-object p0, p0, Ll/tnh0;->k:Ll/mnh0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/mnh0;->p0()V

    .line 30
    .line 31
    .line 32
    :cond_2
    :goto_0
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/data/RememberUserInfo;Lcom/p1/mobile/putong/data/RememberUserInfo;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tnh0;->j()Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/tnh0;->k:Ll/mnh0;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/mnh0;->q0(Lcom/p1/mobile/putong/data/RememberUserInfo;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    iget-object p1, p0, Ll/tnh0;->k:Ll/mnh0;

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ll/mnh0;->q0(Lcom/p1/mobile/putong/data/RememberUserInfo;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object p0, p0, Ll/tnh0;->b:Lv/navigationbar/VNavigationBar;

    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/tnh0;->b:Lv/navigationbar/VNavigationBar;

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/data/RememberUserInfo;Lcom/p1/mobile/putong/data/RememberUserInfo;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tnh0;->j()Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/tnh0;->f:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;->setData(Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/tnh0;->g:Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;

    .line 15
    .line 16
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/account/view/AccountViewV2;->setData(Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Ll/tnh0;->u(Lcom/p1/mobile/putong/data/RememberUserInfo;Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
