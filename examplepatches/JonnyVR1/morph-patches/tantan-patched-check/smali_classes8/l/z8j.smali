.class public Ll/z8j;
.super Ll/g1e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/z8j$a;
    }
.end annotation


# instance fields
.field public j:Landroid/widget/ImageView;

.field public k:Landroid/widget/ImageView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/widget/TextView;

.field public p:Landroid/widget/TextView;

.field public q:Landroid/view/View;

.field public r:Ll/z8j$a;


# direct methods
.method public constructor <init>(Ll/z8j$a;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/z8j$a;->g(Ll/z8j$a;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/z8j;->I()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {p0, v0, v2, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic E(Ll/z8j;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z8j;->M(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic F(Ll/z8j;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z8j;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/z8j;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z8j;->K(Landroid/view/View;)V

    return-void
.end method

.method private static I()I
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x438

    .line 6
    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    sget v0, Ll/tgc0;->j:I

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    sget v0, Ll/tgc0;->i:I

    .line 13
    .line 14
    return v0
.end method

.method private J()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 2
    .line 3
    invoke-static {v0}, Ll/z8j$a;->a(Ll/z8j$a;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/z8j;->j:Landroid/widget/ImageView;

    .line 11
    .line 12
    iget-object v2, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 13
    .line 14
    invoke-static {v2}, Ll/z8j$a;->a(Ll/z8j$a;)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 22
    .line 23
    invoke-static {v0}, Ll/z8j$a;->i(Ll/z8j$a;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eq v0, v1, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/z8j;->k:Landroid/widget/ImageView;

    .line 30
    .line 31
    iget-object v1, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 32
    .line 33
    invoke-static {v1}, Ll/z8j$a;->i(Ll/z8j$a;)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object v0, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 41
    .line 42
    invoke-static {v0}, Ll/z8j$a;->k(Ll/z8j$a;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Ll/z8j;->l:Landroid/widget/TextView;

    .line 53
    .line 54
    iget-object v1, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 55
    .line 56
    invoke-static {v1}, Ll/z8j$a;->k(Ll/z8j$a;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-object v0, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 64
    .line 65
    invoke-static {v0}, Ll/z8j$a;->j(Ll/z8j$a;)Ljava/lang/CharSequence;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iget-object v1, p0, Ll/z8j;->m:Landroid/widget/TextView;

    .line 74
    .line 75
    const/16 v2, 0x8

    .line 76
    .line 77
    if-nez v0, :cond_3

    .line 78
    .line 79
    iget-object v0, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 80
    .line 81
    invoke-static {v0}, Ll/z8j$a;->j(Ll/z8j$a;)Ljava/lang/CharSequence;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_3
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 90
    .line 91
    .line 92
    :goto_0
    iget-object v0, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 93
    .line 94
    invoke-static {v0}, Ll/z8j$a;->e(Ll/z8j$a;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_4

    .line 103
    .line 104
    iget-object v0, p0, Ll/z8j;->n:Landroid/widget/TextView;

    .line 105
    .line 106
    iget-object v1, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 107
    .line 108
    invoke-static {v1}, Ll/z8j$a;->e(Ll/z8j$a;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/z8j;->n:Landroid/widget/TextView;

    .line 116
    .line 117
    new-instance v1, Ll/w8j;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/w8j;-><init>(Ll/z8j;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    :cond_4
    iget-object v0, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 126
    .line 127
    invoke-static {v0}, Ll/z8j$a;->c(Ll/z8j$a;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_5

    .line 136
    .line 137
    iget-object v0, p0, Ll/z8j;->o:Landroid/widget/TextView;

    .line 138
    .line 139
    iget-object v1, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 140
    .line 141
    invoke-static {v1}, Ll/z8j$a;->c(Ll/z8j$a;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Ll/z8j;->o:Landroid/widget/TextView;

    .line 149
    .line 150
    new-instance v1, Ll/x8j;

    .line 151
    .line 152
    invoke-direct {v1, p0}, Ll/x8j;-><init>(Ll/z8j;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 156
    .line 157
    .line 158
    :cond_5
    iget-object v0, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 159
    .line 160
    invoke-static {v0}, Ll/z8j$a;->b(Ll/z8j$a;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    iget-object v1, p0, Ll/z8j;->p:Landroid/widget/TextView;

    .line 169
    .line 170
    if-nez v0, :cond_6

    .line 171
    .line 172
    iget-object v0, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 173
    .line 174
    invoke-static {v0}, Ll/z8j$a;->b(Ll/z8j$a;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_6
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 183
    .line 184
    .line 185
    :goto_1
    invoke-virtual {p0}, Ll/g1e;->x()V

    .line 186
    .line 187
    .line 188
    new-instance v0, Ll/y8j;

    .line 189
    .line 190
    invoke-direct {v0, p0}, Ll/y8j;-><init>(Ll/z8j;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 2
    .line 3
    invoke-static {p1}, Ll/z8j$a;->f(Ll/z8j$a;)Ll/x20;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 14
    .line 15
    invoke-static {p1}, Ll/z8j$a;->f(Ll/z8j$a;)Ll/x20;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p1}, Ll/x20;->call()V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 2
    .line 3
    invoke-static {p1}, Ll/z8j$a;->d(Ll/z8j$a;)Ll/x20;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 14
    .line 15
    invoke-static {p1}, Ll/z8j$a;->d(Ll/z8j$a;)Ll/x20;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p1}, Ll/x20;->call()V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic M(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 2
    .line 3
    invoke-static {p1}, Ll/z8j$a;->h(Ll/z8j$a;)Ll/x20;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 14
    .line 15
    invoke-static {p0}, Ll/z8j$a;->h(Ll/z8j$a;)Ll/x20;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/x20;->call()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method


# virtual methods
.method public H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/a9j;->b(Ll/z8j;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/z8j;->r:Ll/z8j$a;

    .line 5
    .line 6
    invoke-static {p1}, Ll/z8j$a;->g(Ll/z8j$a;)Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, v0}, Ll/z8j;->H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/z8j;->q:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Ll/z8j;->J()V

    .line 25
    .line 26
    .line 27
    return-void
.end method
