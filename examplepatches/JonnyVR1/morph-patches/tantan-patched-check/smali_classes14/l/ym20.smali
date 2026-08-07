.class public Ll/ym20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/qm20;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VProgressBar;

.field public d:Lv/VRecyclerView;

.field public e:Lv/VLinear;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public final h:Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

.field public i:Ll/qm20;

.field public j:Ll/an20;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ym20;->h:Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/ym20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ym20;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/ym20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ym20;->k(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/ym20;)Ll/qm20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ym20;->i:Ll/qm20;

    return-object p0
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

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

.method private synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/account/AccountDeleteAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private r()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ym20;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->o3:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ym20;->b:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    new-instance v1, Ll/rm20;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/rm20;-><init>(Ll/ym20;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/ym20;->e:Lv/VLinear;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->Z3:I

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->Y3:I

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object v3, p0, Ll/ym20;->f:Lv/VText;

    .line 53
    .line 54
    new-instance v4, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    filled-new-array {v2}, [Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {v4}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    sget v5, Ll/j9c0;->f:I

    .line 86
    .line 87
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 92
    .line 93
    invoke-static {v0, v2, v4, v5}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->i()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iget-object v2, p0, Ll/ym20;->g:Lv/VText;

    .line 105
    .line 106
    if-eqz v0, :cond_0

    .line 107
    .line 108
    new-instance v0, Ll/sm20;

    .line 109
    .line 110
    invoke-direct {v0, p0}, Ll/sm20;-><init>(Ll/ym20;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/ym20;->g:Lv/VText;

    .line 117
    .line 118
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->M0:I

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->m0:I

    .line 125
    .line 126
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/ym20;->g:Lv/VText;

    .line 130
    .line 131
    new-instance v2, Ll/ym20$a;

    .line 132
    .line 133
    invoke-direct {v2, p0}, Ll/ym20$a;-><init>(Ll/ym20;)V

    .line 134
    .line 135
    .line 136
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 137
    .line 138
    .line 139
    :goto_0
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 140
    .line 141
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-direct {v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Ll/ym20;->d:Lv/VRecyclerView;

    .line 152
    .line 153
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 154
    .line 155
    .line 156
    new-instance v0, Ll/an20;

    .line 157
    .line 158
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-direct {v0, v1}, Ll/an20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 163
    .line 164
    .line 165
    iput-object v0, p0, Ll/ym20;->j:Ll/an20;

    .line 166
    .line 167
    iget-object v1, p0, Ll/ym20;->d:Lv/VRecyclerView;

    .line 168
    .line 169
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0}, Ll/ym20;->j()V

    .line 173
    .line 174
    .line 175
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ym20;->h:Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zm20;->b(Ll/ym20;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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

.method public e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ym20;->h:Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ll/qm20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ym20;->i:Ll/qm20;

    .line 2
    .line 3
    return-void
.end method

.method public i(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ym20;->c:Lv/VProgressBar;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qm20;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ym20;->f(Ll/qm20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ym20;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/ym20;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ym20;->c:Lv/VProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ym20;->i:Ll/qm20;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/qm20;->I0()Lcom/p1/mobile/putong/data/CommonData;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/ym20;->j:Ll/an20;

    .line 14
    .line 15
    iget-object p0, p0, Ll/ym20;->i:Ll/qm20;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/qm20;->L0()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v1, p0, v0}, Ll/an20;->K(Ljava/util/List;Lcom/p1/mobile/putong/data/CommonData;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
