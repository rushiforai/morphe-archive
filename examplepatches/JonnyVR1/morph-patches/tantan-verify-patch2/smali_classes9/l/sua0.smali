.class public Ll/sua0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/oua0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Lv/VEditText;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public g:Landroid/content/Context;

.field public h:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSingleLineTextFrag;

.field public i:Ll/oua0;

.field public j:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSingleLineTextFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xf

    .line 5
    .line 6
    iput v0, p0, Ll/sua0;->k:I

    .line 7
    .line 8
    iput-object p1, p0, Ll/sua0;->g:Landroid/content/Context;

    .line 9
    .line 10
    iput-object p2, p0, Ll/sua0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSingleLineTextFrag;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ll/sua0;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sua0;->l(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic b(Ll/sua0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sua0;->n()V

    return-void
.end method

.method public static synthetic c(Ll/sua0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sua0;->m(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/sua0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/sua0;->k:I

    return p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sua0;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

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

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tua0;->b(Ll/sua0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/oua0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sua0;->i:Ll/oua0;

    .line 2
    .line 3
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    sget-object v0, Ll/sua0$b;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Ll/sua0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 20
    .line 21
    iget-object p0, p0, Ll/sua0;->d:Lv/VEditText;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p0}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ExtensionGame;->level:Ljava/util/List;

    .line 44
    .line 45
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/oua0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sua0;->f(Ll/oua0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sua0;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sua0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSingleLineTextFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sua0;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public final synthetic l(Landroid/view/View;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sua0;->d:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/sua0;->d:Lv/VEditText;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/sua0;->e:Lv/VImage;

    .line 9
    .line 10
    const/16 v0, 0x8

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/sua0;->d:Lv/VEditText;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sua0;->d:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/sua0;->k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/sua0;->d:Lv/VEditText;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/sua0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    iget-object v0, p0, Ll/sua0;->b:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/sua0$b;->a:[I

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    aget p1, v0, p1

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    if-eq p1, v0, :cond_0

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/sua0;->k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/sua0;->k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/data/ExtensionGame;->new_()Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 64
    .line 65
    :cond_1
    invoke-virtual {p0}, Ll/sua0;->k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 82
    .line 83
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/ExtensionGame;->nullCheck()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/sua0;->k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 99
    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ExtensionGame;->level:Ljava/util/List;

    .line 105
    .line 106
    invoke-static {p1}, Ll/td8;->t0(Ljava/util/List;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    check-cast p1, Ljava/lang/String;

    .line 111
    .line 112
    const/16 v1, 0xf

    .line 113
    .line 114
    iput v1, p0, Ll/sua0;->k:I

    .line 115
    .line 116
    :goto_0
    iget-object v1, p0, Ll/sua0;->d:Lv/VEditText;

    .line 117
    .line 118
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    iget-object v1, p0, Ll/sua0;->d:Lv/VEditText;

    .line 122
    .line 123
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_2

    .line 128
    .line 129
    const/4 p1, 0x0

    .line 130
    goto :goto_1

    .line 131
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    :goto_1
    invoke-virtual {v1, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/sua0;->d:Lv/VEditText;

    .line 139
    .line 140
    new-instance v1, Ll/pua0;

    .line 141
    .line 142
    invoke-direct {v1, p0}, Ll/pua0;-><init>(Ll/sua0;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Ll/sua0;->d:Lv/VEditText;

    .line 149
    .line 150
    new-instance v1, Ll/sua0$a;

    .line 151
    .line 152
    invoke-direct {v1, p0}, Ll/sua0$a;-><init>(Ll/sua0;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, Ll/sua0;->e:Lv/VImage;

    .line 159
    .line 160
    iget-object v1, p0, Ll/sua0;->d:Lv/VEditText;

    .line 161
    .line 162
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    xor-int/2addr v0, v1

    .line 175
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Ll/sua0;->e:Lv/VImage;

    .line 179
    .line 180
    new-instance v0, Ll/qua0;

    .line 181
    .line 182
    invoke-direct {v0, p0}, Ll/qua0;-><init>(Ll/sua0;)V

    .line 183
    .line 184
    .line 185
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Ll/sua0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSingleLineTextFrag;

    .line 189
    .line 190
    new-instance v0, Ll/rua0;

    .line 191
    .line 192
    invoke-direct {v0, p0}, Ll/rua0;-><init>(Ll/sua0;)V

    .line 193
    .line 194
    .line 195
    const-wide/16 v1, 0x12c

    .line 196
    .line 197
    invoke-static {p1, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Ll/sua0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 201
    .line 202
    iget-object v0, p0, Ll/sua0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSingleLineTextFrag;

    .line 203
    .line 204
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0}, Ll/sua0;->k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    iget-object p0, p0, Ll/sua0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSingleLineTextFrag;

    .line 216
    .line 217
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 218
    .line 219
    .line 220
    return-void
.end method
