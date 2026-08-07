.class public Ll/tk5;
.super Ll/oof;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tk5$a;
    }
.end annotation


# instance fields
.field public h:Landroid/view/View;

.field public i:Landroid/widget/LinearLayout;

.field public j:Landroid/widget/ImageView;

.field public k:Lv/VDraweeView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Lcom/p1/mobile/android/app/Act;

.field public p:Ll/l4g0;

.field public final q:Ll/tk5$a;


# direct methods
.method public constructor <init>(Ll/tk5$a;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/tk5$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/oof;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 7
    .line 8
    iget-object p1, p1, Ll/tk5$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ll/tk5;->H(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic C(Ll/tk5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tk5;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic D(Ll/tk5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tk5;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/tk5;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tk5;->M(Landroid/content/DialogInterface;)V

    return-void
.end method

.method private G()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/tk5$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 12
    .line 13
    iget-object p0, p0, Ll/tk5$a;->b:Ljava/lang/String;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const-class p0, Ll/tk5;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method private H(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iput-object v0, p0, Ll/tk5;->o:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Ll/tk5;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/tk5;->p:Ll/l4g0;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    invoke-direct {p0}, Ll/tk5;->G()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-class v0, Ll/tk5;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {p1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/tk5;->p:Ll/l4g0;

    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method private I()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tk5;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 4
    .line 5
    iget-object v1, v1, Ll/tk5$a;->c:Ljava/lang/CharSequence;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 11
    .line 12
    iget-object v0, v0, Ll/tk5$a;->d:Ljava/lang/CharSequence;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Ll/tk5;->m:Landroid/widget/TextView;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 24
    .line 25
    iget-object v0, v0, Ll/tk5$a;->d:Ljava/lang/CharSequence;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object v0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 35
    .line 36
    iget-object v0, v0, Ll/tk5$a;->h:Ljava/lang/CharSequence;

    .line 37
    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Ll/tk5;->n:Landroid/widget/TextView;

    .line 45
    .line 46
    iget-object v1, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 47
    .line 48
    iget-object v1, v1, Ll/tk5$a;->h:Ljava/lang/CharSequence;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 54
    .line 55
    iget-boolean v0, v0, Ll/tk5$a;->j:Z

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object v0, p0, Ll/tk5;->i:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    new-instance v1, Ll/ok5;

    .line 62
    .line 63
    invoke-direct {v1}, Ll/ok5;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/tk5;->h:Landroid/view/View;

    .line 70
    .line 71
    new-instance v1, Ll/pk5;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/pk5;-><init>(Ll/tk5;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    iget-object v0, p0, Ll/tk5;->j:Landroid/widget/ImageView;

    .line 80
    .line 81
    iget-object v1, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 82
    .line 83
    iget-boolean v1, v1, Ll/tk5$a;->i:Z

    .line 84
    .line 85
    const/4 v3, 0x1

    .line 86
    xor-int/2addr v1, v3

    .line 87
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 91
    .line 92
    iget v1, v0, Ll/tk5$a;->l:I

    .line 93
    .line 94
    if-eqz v1, :cond_3

    .line 95
    .line 96
    iget v0, v0, Ll/tk5$a;->k:I

    .line 97
    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    iget-object v1, p0, Ll/tk5;->k:Lv/VDraweeView;

    .line 101
    .line 102
    new-array v3, v3, [Landroid/view/View;

    .line 103
    .line 104
    aput-object v1, v3, v2

    .line 105
    .line 106
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/tk5;->k:Lv/VDraweeView;

    .line 110
    .line 111
    iget-object v1, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 112
    .line 113
    iget v1, v1, Ll/tk5$a;->l:I

    .line 114
    .line 115
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 116
    .line 117
    .line 118
    :cond_3
    iget-object v0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 119
    .line 120
    iget-object v0, v0, Ll/tk5$a;->e:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_4

    .line 127
    .line 128
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 129
    .line 130
    iget-object v1, p0, Ll/tk5;->k:Lv/VDraweeView;

    .line 131
    .line 132
    iget-object v2, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 133
    .line 134
    iget-object v2, v2, Ll/tk5$a;->e:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_4
    iget-object v0, p0, Ll/tk5;->k:Lv/VDraweeView;

    .line 141
    .line 142
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 143
    .line 144
    .line 145
    :goto_1
    iget-object v0, p0, Ll/tk5;->n:Landroid/widget/TextView;

    .line 146
    .line 147
    new-instance v1, Ll/qk5;

    .line 148
    .line 149
    invoke-direct {v1, p0}, Ll/qk5;-><init>(Ll/tk5;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Ll/tk5;->j:Landroid/widget/ImageView;

    .line 156
    .line 157
    new-instance v1, Ll/rk5;

    .line 158
    .line 159
    invoke-direct {v1, p0}, Ll/rk5;-><init>(Ll/tk5;)V

    .line 160
    .line 161
    .line 162
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 166
    .line 167
    iget-object v0, v0, Ll/tk5$a;->g:Ll/x20;

    .line 168
    .line 169
    if-eqz v0, :cond_5

    .line 170
    .line 171
    new-instance v0, Ll/sk5;

    .line 172
    .line 173
    invoke-direct {v0, p0}, Ll/sk5;-><init>(Ll/tk5;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 177
    .line 178
    .line 179
    :cond_5
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/tk5$a;->f:Landroid/view/View$OnClickListener;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic M(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tk5$a;->g:Ll/x20;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic y(Ll/tk5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tk5;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/tk5;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tk5;->N(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/uk5;->b(Ll/tk5;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic N(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tk5;->p:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public show()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/oof;->show()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/tk5;->q:Ll/tk5$a;

    .line 5
    .line 6
    iget-object v0, v0, Ll/tk5$a;->m:[Ll/pf60;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ll/tk5;->p:Ll/l4g0;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/tk5;->p:Ll/l4g0;

    .line 16
    .line 17
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/nk5;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/nk5;-><init>(Ll/tk5;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Ll/tk5;->I()V

    .line 29
    .line 30
    .line 31
    return-void
.end method
