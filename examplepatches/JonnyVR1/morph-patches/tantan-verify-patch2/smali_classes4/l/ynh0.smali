.class public Ll/ynh0;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Landroid/view/View;

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Lv/VLinear;

.field public j:Lv/VLinear;

.field public k:Lv/VImage;

.field public l:Lv/VImage;

.field public m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public n:Ll/l4g0;

.field public o:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/agc0;->s:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    iput-object v0, p0, Ll/ynh0;->g:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v0, Ll/ynh0$c;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/ynh0$c;-><init>(Ll/ynh0;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/ynh0;->o:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 16
    .line 17
    iput-object p1, p0, Ll/ynh0;->h:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "p_mode_sidebar_pop"

    .line 32
    .line 33
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Ll/ynh0;->n:Ll/l4g0;

    .line 38
    .line 39
    iput-object p2, p0, Ll/ynh0;->g:Ljava/lang/String;

    .line 40
    .line 41
    sget p1, Ll/kec0;->e7:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    if-nez p1, :cond_0

    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    const p2, 0x1020002

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    sget p2, Ll/adc0;->q2:I

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Landroid/widget/FrameLayout;

    .line 67
    .line 68
    const p2, 0x106000d

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 72
    .line 73
    .line 74
    invoke-static {p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Ll/ynh0;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 79
    .line 80
    const/4 p2, 0x3

    .line 81
    invoke-virtual {p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/ynh0;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 85
    .line 86
    const/4 p2, 0x1

    .line 87
    invoke-virtual {p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Ll/ynh0;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 91
    .line 92
    iget-object p2, p0, Ll/ynh0;->o:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 93
    .line 94
    invoke-virtual {p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 95
    .line 96
    .line 97
    sget p1, Ll/adc0;->V7:I

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput-object p1, p0, Ll/ynh0;->f:Landroid/view/View;

    .line 104
    .line 105
    sget p1, Ll/adc0;->K7:I

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    check-cast p1, Lv/VLinear;

    .line 112
    .line 113
    iput-object p1, p0, Ll/ynh0;->i:Lv/VLinear;

    .line 114
    .line 115
    sget p1, Ll/adc0;->W7:I

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Lv/VLinear;

    .line 122
    .line 123
    iput-object p1, p0, Ll/ynh0;->j:Lv/VLinear;

    .line 124
    .line 125
    sget p1, Ll/adc0;->Bd:I

    .line 126
    .line 127
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    check-cast p1, Lv/VImage;

    .line 132
    .line 133
    iput-object p1, p0, Ll/ynh0;->k:Lv/VImage;

    .line 134
    .line 135
    sget p1, Ll/adc0;->Cd:I

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    check-cast p1, Lv/VImage;

    .line 142
    .line 143
    iput-object p1, p0, Ll/ynh0;->l:Lv/VImage;

    .line 144
    .line 145
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 148
    .line 149
    iget-object p1, p1, Ll/dkb;->Z3:Ll/wyd0;

    .line 150
    .line 151
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    check-cast p1, Ljava/lang/String;

    .line 156
    .line 157
    const-string p2, "marryMode"

    .line 158
    .line 159
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    iget-object p2, p0, Ll/ynh0;->k:Lv/VImage;

    .line 164
    .line 165
    if-eqz p1, :cond_1

    .line 166
    .line 167
    sget p1, Ll/dbc0;->gr:I

    .line 168
    .line 169
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Ll/ynh0;->l:Lv/VImage;

    .line 173
    .line 174
    sget p2, Ll/dbc0;->fr:I

    .line 175
    .line 176
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 177
    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_1
    sget p1, Ll/dbc0;->fr:I

    .line 181
    .line 182
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Ll/ynh0;->l:Lv/VImage;

    .line 186
    .line 187
    sget p2, Ll/dbc0;->gr:I

    .line 188
    .line 189
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 190
    .line 191
    .line 192
    :goto_0
    iget-object p1, p0, Ll/ynh0;->f:Landroid/view/View;

    .line 193
    .line 194
    new-instance p2, Ll/xnh0;

    .line 195
    .line 196
    invoke-direct {p2, p0}, Ll/xnh0;-><init>(Ll/ynh0;)V

    .line 197
    .line 198
    .line 199
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Ll/ynh0;->i:Lv/VLinear;

    .line 203
    .line 204
    new-instance p2, Ll/ynh0$a;

    .line 205
    .line 206
    invoke-direct {p2, p0}, Ll/ynh0$a;-><init>(Ll/ynh0;)V

    .line 207
    .line 208
    .line 209
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 210
    .line 211
    .line 212
    iget-object p1, p0, Ll/ynh0;->j:Lv/VLinear;

    .line 213
    .line 214
    new-instance p2, Ll/ynh0$b;

    .line 215
    .line 216
    invoke-direct {p2, p0}, Ll/ynh0$b;-><init>(Ll/ynh0;)V

    .line 217
    .line 218
    .line 219
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 220
    .line 221
    .line 222
    return-void
.end method

.method public static bridge synthetic A(Ll/ynh0;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ynh0;->l:Lv/VImage;

    return-object p0
.end method

.method public static bridge synthetic C(Ll/ynh0;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ynh0;->D()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private D()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_mode_sidebar_pop"

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ll/ynh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ynh0;->E(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic y(Ll/ynh0;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ynh0;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method public static bridge synthetic z(Ll/ynh0;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ynh0;->k:Lv/VImage;

    return-object p0
.end method


# virtual methods
.method public g(Ll/al80;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/f3m;->g(Ll/al80;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ynh0;->n:Ll/l4g0;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/ynh0;->n:Ll/l4g0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/ynh0;->n:Ll/l4g0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public show()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ynh0;->n:Ll/l4g0;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/ynh0;->n:Ll/l4g0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/l4g0;->c()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ynh0;->n:Ll/l4g0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/l4g0;->r()V

    .line 20
    .line 21
    .line 22
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    iget-object v0, v0, Ll/dkb;->Z3:Ll/wyd0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, "marryMode"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    const-string v0, "marry"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const-string v0, "love"

    .line 46
    .line 47
    :goto_0
    invoke-direct {p0}, Ll/ynh0;->D()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v1, "mode_select"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    filled-new-array {v0}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v1, "e_mode_sidebar"

    .line 62
    .line 63
    invoke-static {v1, p0, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
