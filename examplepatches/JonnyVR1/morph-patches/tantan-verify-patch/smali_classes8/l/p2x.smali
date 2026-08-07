.class public Ll/p2x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/i2x;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VButton;

.field public e:Lv/VText;

.field public f:Lv/VButton;

.field public g:Lv/VText;

.field public h:Lv/VButton;

.field public i:Lv/navigationbar/VNavigationBar;

.field public j:Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;

.field public k:Ll/i2x;

.field public l:I

.field public m:I

.field public n:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/p2x;->l:I

    .line 6
    .line 7
    iput v0, p0, Ll/p2x;->m:I

    .line 8
    .line 9
    iput v0, p0, Ll/p2x;->n:I

    .line 10
    .line 11
    iput-object p1, p0, Ll/p2x;->j:Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/p2x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p2x;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic d(Ll/p2x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p2x;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/p2x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p2x;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/p2x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p2x;->n()V

    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_marry_profile"

    .line 2
    .line 3
    const-string v0, "p_marriage_intro"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "jump_loop_type_default"

    .line 17
    .line 18
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 7

    .line 1
    const-string p1, "e_go_verify"

    .line 2
    .line 3
    const-string v0, "p_marriage_intro"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget p1, p0, Ll/p2x;->m:I

    .line 9
    .line 10
    if-ltz p1, :cond_2

    .line 11
    .line 12
    iget p1, p0, Ll/p2x;->l:I

    .line 13
    .line 14
    if-gez p1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget p1, p0, Ll/p2x;->n:I

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    new-instance v3, Ll/m2x;

    .line 27
    .line 28
    invoke-direct {v3}, Ll/m2x;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v6, Ll/n2x;

    .line 32
    .line 33
    invoke-direct {v6}, Ll/n2x;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v2, ""

    .line 37
    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v5, 0x0

    .line 40
    invoke-static/range {v1 .. v6}, Ll/qtk;->P0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;ZZLl/x20;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void

    .line 44
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/p2x;->j:Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;

    .line 45
    .line 46
    invoke-static {p0}, Ll/pq4;->n(Lcom/p1/mobile/android/app/Act;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p1, p1, Ll/dkb;->F4:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ll/i5x;

    .line 20
    .line 21
    iget-object v0, p0, Ll/p2x;->j:Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;

    .line 22
    .line 23
    new-instance v1, Ll/o2x;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/o2x;-><init>(Ll/p2x;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p1, v0, v1}, Ll/i5x;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ll/i5x;->show()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p0, p0, Ll/p2x;->k:Ll/i2x;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/i2x;->g0()V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p2x;->j:Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;

    .line 2
    .line 3
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
    invoke-static {p0, p1, p2}, Ll/q2x;->b(Ll/p2x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    check-cast p1, Ll/i2x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p2x;->j(Ll/i2x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p2x;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/i2x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p2x;->k:Ll/i2x;

    .line 2
    .line 3
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_1

    .line 38
    .line 39
    :cond_0
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public final synthetic n()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p2x;->k:Ll/i2x;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i2x;->g0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p2x;->g:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/p2x;->f:Lv/VButton;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getUserInfoForMarryStatus()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isAudit()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_4

    .line 21
    .line 22
    const-string p1, "audit"

    .line 23
    .line 24
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_4

    .line 29
    .line 30
    const-string p1, "auditing"

    .line 31
    .line 32
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_4

    .line 37
    .line 38
    const-string p1, "pending"

    .line 39
    .line 40
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    const-string p1, ""

    .line 48
    .line 49
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    const-string v2, "denied"

    .line 54
    .line 55
    if-nez p1, :cond_2

    .line 56
    .line 57
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const-string p1, "passed"

    .line 65
    .line 66
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    iget-object p1, p0, Ll/p2x;->f:Lv/VButton;

    .line 73
    .line 74
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/p2x;->f:Lv/VButton;

    .line 78
    .line 79
    const-string v0, "\u5df2\u5b8c\u5584"

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/p2x;->f:Lv/VButton;

    .line 85
    .line 86
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    sget v0, Ll/c9c0;->g:I

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/p2x;->f:Lv/VButton;

    .line 105
    .line 106
    const-string v1, "\u53bb\u5b8c\u5584"

    .line 107
    .line 108
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ll/p2x;->f:Lv/VButton;

    .line 112
    .line 113
    const/4 v1, 0x1

    .line 114
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/p2x;->f:Lv/VButton;

    .line 118
    .line 119
    const/4 v3, -0x1

    .line 120
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Ll/p2x;->f:Lv/VButton;

    .line 124
    .line 125
    sget v3, Ll/dbc0;->v:I

    .line 126
    .line 127
    invoke-virtual {p1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 128
    .line 129
    .line 130
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_3

    .line 135
    .line 136
    iget-object p0, p0, Ll/p2x;->g:Lv/VText;

    .line 137
    .line 138
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    :cond_3
    return-void

    .line 142
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/p2x;->f:Lv/VButton;

    .line 143
    .line 144
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Ll/p2x;->f:Lv/VButton;

    .line 148
    .line 149
    const-string v0, "\u5ba1\u6838\u4e2d"

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Ll/p2x;->f:Lv/VButton;

    .line 155
    .line 156
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    sget v0, Ll/c9c0;->g:I

    .line 165
    .line 166
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p2x;->b:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/p2x;->c:Lv/VText;

    .line 13
    .line 14
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/p2x;->e:Lv/VText;

    .line 22
    .line 23
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/p2x;->d:Lv/VButton;

    .line 31
    .line 32
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/p2x;->f:Lv/VButton;

    .line 40
    .line 41
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/p2x;->i:Lv/navigationbar/VNavigationBar;

    .line 49
    .line 50
    iget-object v1, p0, Ll/p2x;->j:Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/p2x;->i:Lv/navigationbar/VNavigationBar;

    .line 56
    .line 57
    new-array v1, v3, [Landroid/view/View;

    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    aput-object v0, v1, v2

    .line 61
    .line 62
    invoke-static {v1}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/p2x;->i:Lv/navigationbar/VNavigationBar;

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/p2x;->f:Lv/VButton;

    .line 71
    .line 72
    new-instance v1, Ll/j2x;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/j2x;-><init>(Ll/p2x;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/p2x;->d:Lv/VButton;

    .line 81
    .line 82
    new-instance v1, Ll/k2x;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/k2x;-><init>(Ll/p2x;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/p2x;->h:Lv/VButton;

    .line 91
    .line 92
    new-instance v1, Ll/l2x;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/l2x;-><init>(Ll/p2x;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/core/data/VerificationCenter;Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    invoke-virtual {p0, p2}, Ll/p2x;->q(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/p2x;->l:I

    .line 6
    .line 7
    iput v0, p0, Ll/p2x;->m:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput v1, p0, Ll/p2x;->n:I

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, -0x2

    .line 17
    const-string v4, "rejected"

    .line 18
    .line 19
    const-string v5, "prePending"

    .line 20
    .line 21
    const-string v6, "pending"

    .line 22
    .line 23
    const-string v7, "verified"

    .line 24
    .line 25
    const/4 v8, 0x0

    .line 26
    if-eqz v2, :cond_3

    .line 27
    .line 28
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_3

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 39
    .line 40
    invoke-static {v2, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    iput v1, p0, Ll/p2x;->l:I

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 52
    .line 53
    invoke-static {v2, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-nez v2, :cond_2

    .line 58
    .line 59
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 62
    .line 63
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 71
    .line 72
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 73
    .line 74
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_3

    .line 79
    .line 80
    iput v3, p0, Ll/p2x;->l:I

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    :goto_0
    iput v8, p0, Ll/p2x;->l:I

    .line 84
    .line 85
    :cond_3
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_8

    .line 90
    .line 91
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 92
    .line 93
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_8

    .line 98
    .line 99
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 100
    .line 101
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 102
    .line 103
    invoke-static {v2, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-eqz v2, :cond_4

    .line 108
    .line 109
    iput v1, p0, Ll/p2x;->m:I

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_4
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 113
    .line 114
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 115
    .line 116
    invoke-static {v2, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    if-nez v2, :cond_7

    .line 121
    .line 122
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 123
    .line 124
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 125
    .line 126
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-eqz v2, :cond_5

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_5
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 134
    .line 135
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 136
    .line 137
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-eqz v2, :cond_6

    .line 142
    .line 143
    iput v3, p0, Ll/p2x;->m:I

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 147
    .line 148
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 149
    .line 150
    const-string v2, "invalid"

    .line 151
    .line 152
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-eqz p1, :cond_8

    .line 157
    .line 158
    const/4 p1, -0x3

    .line 159
    iput p1, p0, Ll/p2x;->m:I

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_7
    :goto_2
    iput v8, p0, Ll/p2x;->m:I

    .line 163
    .line 164
    :cond_8
    :goto_3
    invoke-virtual {p0, p2}, Ll/p2x;->k(Lcom/p1/mobile/putong/data/User;)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-eqz p1, :cond_9

    .line 169
    .line 170
    iput v1, p0, Ll/p2x;->n:I

    .line 171
    .line 172
    :cond_9
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 173
    .line 174
    invoke-virtual {p1, v8}, Landroid/view/View;->setEnabled(Z)V

    .line 175
    .line 176
    .line 177
    iget p1, p0, Ll/p2x;->l:I

    .line 178
    .line 179
    if-ltz p1, :cond_d

    .line 180
    .line 181
    iget v2, p0, Ll/p2x;->m:I

    .line 182
    .line 183
    if-ltz v2, :cond_d

    .line 184
    .line 185
    iget v3, p0, Ll/p2x;->n:I

    .line 186
    .line 187
    if-gez v3, :cond_a

    .line 188
    .line 189
    goto :goto_5

    .line 190
    :cond_a
    if-eqz p1, :cond_c

    .line 191
    .line 192
    if-nez v2, :cond_b

    .line 193
    .line 194
    goto :goto_4

    .line 195
    :cond_b
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 196
    .line 197
    const-string v2, "\u5df2\u8ba4\u8bc1"

    .line 198
    .line 199
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 203
    .line 204
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 208
    .line 209
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 210
    .line 211
    .line 212
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 213
    .line 214
    invoke-virtual {p1, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 215
    .line 216
    .line 217
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 218
    .line 219
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    sget v2, Ll/c9c0;->g:I

    .line 228
    .line 229
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 234
    .line 235
    .line 236
    goto :goto_6

    .line 237
    :cond_c
    :goto_4
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 238
    .line 239
    invoke-virtual {p1, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 243
    .line 244
    const-string v0, "\u5ba1\u6838\u4e2d"

    .line 245
    .line 246
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    .line 248
    .line 249
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 250
    .line 251
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    sget v2, Ll/c9c0;->g:I

    .line 260
    .line 261
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 266
    .line 267
    .line 268
    goto :goto_6

    .line 269
    :cond_d
    :goto_5
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 270
    .line 271
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 272
    .line 273
    .line 274
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 275
    .line 276
    const-string v2, "\u53bb\u8ba4\u8bc1"

    .line 277
    .line 278
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 279
    .line 280
    .line 281
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 282
    .line 283
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 284
    .line 285
    .line 286
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 287
    .line 288
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 289
    .line 290
    .line 291
    iget-object p1, p0, Ll/p2x;->d:Lv/VButton;

    .line 292
    .line 293
    sget v0, Ll/dbc0;->v:I

    .line 294
    .line 295
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 296
    .line 297
    .line 298
    const-string p1, "e_go_verify"

    .line 299
    .line 300
    const-string v0, "p_marriage_intro"

    .line 301
    .line 302
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    :goto_6
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->getUserInfoForMarryStatus()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    const-string p2, "passed"

    .line 310
    .line 311
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 312
    .line 313
    .line 314
    move-result p1

    .line 315
    if-eqz p1, :cond_e

    .line 316
    .line 317
    iget p1, p0, Ll/p2x;->l:I

    .line 318
    .line 319
    if-ne p1, v1, :cond_e

    .line 320
    .line 321
    iget p1, p0, Ll/p2x;->m:I

    .line 322
    .line 323
    if-ne p1, v1, :cond_e

    .line 324
    .line 325
    iget p1, p0, Ll/p2x;->n:I

    .line 326
    .line 327
    if-ne p1, v1, :cond_e

    .line 328
    .line 329
    goto :goto_7

    .line 330
    :cond_e
    move v1, v8

    .line 331
    :goto_7
    iget-object p1, p0, Ll/p2x;->h:Lv/VButton;

    .line 332
    .line 333
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 334
    .line 335
    .line 336
    iget-object p0, p0, Ll/p2x;->h:Lv/VButton;

    .line 337
    .line 338
    if-eqz v1, :cond_f

    .line 339
    .line 340
    sget p1, Ll/dbc0;->T:I

    .line 341
    .line 342
    goto :goto_8

    .line 343
    :cond_f
    sget p1, Ll/dbc0;->s:I

    .line 344
    .line 345
    :goto_8
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 346
    .line 347
    .line 348
    return-void
.end method
