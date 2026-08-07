.class public Ll/sxa0;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VLinear;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VText;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Lcom/p1/mobile/android/app/Act;

.field public p:Ljava/lang/String;

.field public q:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public r:Ll/l4g0;

.field public s:Ljava/lang/String;

.field public final t:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget v0, Ll/agc0;->c:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    iput-object v0, p0, Ll/sxa0;->p:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/sxa0;->s:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v0, Ll/sxa0$d;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/sxa0$d;-><init>(Ll/sxa0;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/sxa0;->t:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 18
    .line 19
    iput-object p1, p0, Ll/sxa0;->o:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    iput-object p2, p0, Ll/sxa0;->p:Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {p0, p1}, Ll/sxa0;->G(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static bridge synthetic A(Ll/sxa0;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxa0;->q:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method public static bridge synthetic C(Ll/sxa0;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sxa0;->E(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private E(I)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_3

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_3

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-ne p1, p0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const/4 p0, 0x4

    .line 12
    if-eq p1, p0, :cond_2

    .line 13
    .line 14
    const/4 p0, 0x5

    .line 15
    if-ne p1, p0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const-string p0, ""

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_2
    :goto_0
    const-string p0, "p_selected_users_profile_review"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_3
    :goto_1
    const-string p0, "p_selected_users_complete_profile"

    .line 25
    .line 26
    return-object p0
.end method

.method private G(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/sxa0;->D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic H(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxa0;->r:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ll/sxa0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sxa0;->H(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic y(Ll/sxa0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sxa0;->I(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic z(Ll/sxa0;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxa0;->o:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method


# virtual methods
.method public D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/txa0;->b(Ll/sxa0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final F(I)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_3

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_3

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-ne p1, p0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const/4 p0, 0x4

    .line 12
    if-eq p1, p0, :cond_2

    .line 13
    .line 14
    const/4 p0, 0x5

    .line 15
    if-ne p1, p0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const-string p0, ""

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_2
    :goto_0
    const-string p0, "selected_users_profile_review_showfrom"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_3
    :goto_1
    const-string p0, "selected_users_complete_profile_showfrom"

    .line 25
    .line 26
    return-object p0
.end method

.method public J(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sxa0;->s:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public K(ILl/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/sxa0;->L(ILl/x20;Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public L(ILl/x20;Ll/x20;)V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/vcc0;->E:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, p0, Ll/sxa0;->q:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 17
    .line 18
    const/4 v2, 0x3

    .line 19
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/sxa0;->q:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 23
    .line 24
    iget-object v3, p0, Ll/sxa0;->t:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 25
    .line 26
    invoke-virtual {v1, v3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 27
    .line 28
    .line 29
    sget v1, Ll/dbc0;->f1:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/sxa0;->m:Landroid/widget/TextView;

    .line 35
    .line 36
    const/16 v1, 0x8

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/sxa0;->n:Landroid/widget/TextView;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Ll/gra;->z()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    iget-object v0, p0, Ll/sxa0;->l:Landroid/widget/TextView;

    .line 53
    .line 54
    sget v1, Ll/dbc0;->R:I

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    const/4 v0, 0x4

    .line 60
    const-string v1, "home_selected_users_card"

    .line 61
    .line 62
    const/4 v3, 0x1

    .line 63
    if-eq p1, v0, :cond_5

    .line 64
    .line 65
    const/4 v0, 0x5

    .line 66
    if-ne p1, v0, :cond_1

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    if-eq p1, v3, :cond_2

    .line 70
    .line 71
    const/4 v0, 0x2

    .line 72
    if-eq p1, v0, :cond_2

    .line 73
    .line 74
    if-ne p1, v2, :cond_8

    .line 75
    .line 76
    :cond_2
    const-string v0, "e_selected_users_complete_profile"

    .line 77
    .line 78
    invoke-direct {p0, p1}, Ll/sxa0;->E(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-static {v0, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/sxa0;->i:Lv/VImage;

    .line 86
    .line 87
    invoke-static {}, Ll/gra;->z()Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_3

    .line 92
    .line 93
    sget v2, Ll/dbc0;->ji:I

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_3
    sget v2, Ll/dbc0;->Kn:I

    .line 97
    .line 98
    :goto_0
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/sxa0;->p:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_4

    .line 108
    .line 109
    iget-object v0, p0, Ll/sxa0;->m:Landroid/widget/TextView;

    .line 110
    .line 111
    const/4 v1, 0x0

    .line 112
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/sxa0;->m:Landroid/widget/TextView;

    .line 116
    .line 117
    const-string v1, "\u72e0\u5fc3\u9519\u8fc7"

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/sxa0;->m:Landroid/widget/TextView;

    .line 123
    .line 124
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 125
    .line 126
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    sget v2, Ll/c9c0;->W:I

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/sxa0;->m:Landroid/widget/TextView;

    .line 140
    .line 141
    new-instance v1, Ll/sxa0$b;

    .line 142
    .line 143
    invoke-direct {v1, p0, p3}, Ll/sxa0$b;-><init>(Ll/sxa0;Ll/x20;)V

    .line 144
    .line 145
    .line 146
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 147
    .line 148
    .line 149
    :cond_4
    iget-object p3, p0, Ll/sxa0;->l:Landroid/widget/TextView;

    .line 150
    .line 151
    new-instance v0, Ll/sxa0$c;

    .line 152
    .line 153
    invoke-direct {v0, p0, p1, p2}, Ll/sxa0$c;-><init>(Ll/sxa0;ILl/x20;)V

    .line 154
    .line 155
    .line 156
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 157
    .line 158
    .line 159
    goto :goto_4

    .line 160
    :cond_5
    :goto_1
    iget-object p2, p0, Ll/sxa0;->i:Lv/VImage;

    .line 161
    .line 162
    invoke-static {}, Ll/gra;->z()Z

    .line 163
    .line 164
    .line 165
    move-result p3

    .line 166
    if-eqz p3, :cond_6

    .line 167
    .line 168
    sget p3, Ll/dbc0;->ii:I

    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_6
    sget p3, Ll/dbc0;->Jn:I

    .line 172
    .line 173
    :goto_2
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 174
    .line 175
    .line 176
    iget-object p2, p0, Ll/sxa0;->j:Landroid/widget/TextView;

    .line 177
    .line 178
    const-string p3, "\u8d44\u6599\u6b63\u5728\u5ba1\u6838\u4e2d"

    .line 179
    .line 180
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    .line 182
    .line 183
    iget-object p2, p0, Ll/sxa0;->l:Landroid/widget/TextView;

    .line 184
    .line 185
    const-string p3, "\u77e5\u9053\u4e86"

    .line 186
    .line 187
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    .line 189
    .line 190
    iget-object p2, p0, Ll/sxa0;->p:Ljava/lang/String;

    .line 191
    .line 192
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    iget-object p3, p0, Ll/sxa0;->k:Lv/VText;

    .line 197
    .line 198
    if-eqz p2, :cond_7

    .line 199
    .line 200
    const-string p2, "\u5ba1\u6838\u901a\u8fc7\u540e\uff0c\u4f60\u7684\u559c\u6b22\u5c06\u81ea\u52a8\u9001\u8fbe\u7ed9\u5bf9\u65b9"

    .line 201
    .line 202
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_7
    const-string p2, "\u5ba1\u6838\u7ed3\u679c\u5c06\u901a\u8fc7\u5c0f\u52a9\u624b\u544a\u77e5\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85"

    .line 207
    .line 208
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    .line 210
    .line 211
    :goto_3
    iget-object p2, p0, Ll/sxa0;->l:Landroid/widget/TextView;

    .line 212
    .line 213
    new-instance p3, Ll/sxa0$a;

    .line 214
    .line 215
    invoke-direct {p3, p0}, Ll/sxa0$a;-><init>(Ll/sxa0;)V

    .line 216
    .line 217
    .line 218
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 219
    .line 220
    .line 221
    :cond_8
    :goto_4
    iget-object p2, p0, Ll/sxa0;->r:Ll/l4g0;

    .line 222
    .line 223
    if-nez p2, :cond_9

    .line 224
    .line 225
    invoke-direct {p0, p1}, Ll/sxa0;->E(I)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p2

    .line 229
    const-class p3, Ll/sxa0;

    .line 230
    .line 231
    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p3

    .line 235
    invoke-static {p2, p3}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    iput-object p2, p0, Ll/sxa0;->r:Ll/l4g0;

    .line 240
    .line 241
    :cond_9
    :try_start_0
    new-instance p2, Lorg/json/JSONObject;

    .line 242
    .line 243
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0, p1}, Ll/sxa0;->F(I)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    iget-object p3, p0, Ll/sxa0;->p:Ljava/lang/String;

    .line 251
    .line 252
    invoke-virtual {p2, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 253
    .line 254
    .line 255
    iget-object p1, p0, Ll/sxa0;->r:Ll/l4g0;

    .line 256
    .line 257
    invoke-virtual {p1, p2}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    .line 259
    .line 260
    :catch_0
    iget-object p1, p0, Ll/sxa0;->r:Ll/l4g0;

    .line 261
    .line 262
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 263
    .line 264
    .line 265
    new-instance p1, Ll/qxa0;

    .line 266
    .line 267
    invoke-direct {p1, p0}, Ll/qxa0;-><init>(Ll/sxa0;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p0, v3}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 274
    .line 275
    .line 276
    iget-object p1, p0, Ll/sxa0;->h:Lv/VImage;

    .line 277
    .line 278
    new-instance p2, Ll/rxa0;

    .line 279
    .line 280
    invoke-direct {p2, p0}, Ll/rxa0;-><init>(Ll/sxa0;)V

    .line 281
    .line 282
    .line 283
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 284
    .line 285
    .line 286
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 287
    .line 288
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 289
    .line 290
    invoke-virtual {p0}, Ll/ura;->p3()Lrx/c;

    .line 291
    .line 292
    .line 293
    return-void
.end method

.method public show()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    return-void
.end method
