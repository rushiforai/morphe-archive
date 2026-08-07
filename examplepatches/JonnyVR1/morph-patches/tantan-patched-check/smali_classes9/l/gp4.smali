.class public Ll/gp4;
.super Ll/q27;
.source "SourceFile"


# instance fields
.field public g:Lv/VLinear;

.field public h:Lv/VText_NoTopPadding;

.field public i:Lv/VText_NoTopPadding;

.field public j:Lv/VDraweeView;

.field public k:Lv/VImage;

.field public l:Landroid/view/View;

.field public m:Lv/VText_NoTopPadding;

.field public n:Lv/VDraweeView;

.field public o:Landroid/view/View;

.field public p:Lv/VText_NoTopPadding;

.field public q:Lv/VText_NoTopPadding;

.field public r:Lv/VText_NoTopPadding;

.field public final s:Lcom/p1/mobile/android/app/Act;

.field public final t:Lcom/p1/mobile/putong/data/Picture;

.field public final u:Lcom/p1/mobile/putong/data/Picture;

.field public final v:Ljava/lang/Runnable;

.field public w:Ljava/lang/Runnable;

.field public x:Ljava/lang/Runnable;

.field public y:Z

.field public final z:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/Picture;Ljava/lang/Runnable;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/Picture;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/data/Picture;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/q27;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/gp4;->w:Ljava/lang/Runnable;

    .line 6
    .line 7
    iput-object v0, p0, Ll/gp4;->x:Ljava/lang/Runnable;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/gp4;->y:Z

    .line 11
    .line 12
    iput-object p1, p0, Ll/gp4;->s:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    iput-object p2, p0, Ll/gp4;->t:Lcom/p1/mobile/putong/data/Picture;

    .line 15
    .line 16
    iput-object p3, p0, Ll/gp4;->u:Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    iput-object p4, p0, Ll/gp4;->v:Ljava/lang/Runnable;

    .line 19
    .line 20
    const-string p1, "p_authentication_failure_popup"

    .line 21
    .line 22
    iput-object p1, p0, Ll/gp4;->z:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/Picture;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/Picture;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/data/Picture;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 25
    invoke-direct {p0, p1}, Ll/q27;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Ll/gp4;->x:Ljava/lang/Runnable;

    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Ll/gp4;->y:Z

    .line 28
    iput-object p1, p0, Ll/gp4;->s:Lcom/p1/mobile/android/app/Act;

    .line 29
    iput-object p2, p0, Ll/gp4;->t:Lcom/p1/mobile/putong/data/Picture;

    .line 30
    iput-object p3, p0, Ll/gp4;->u:Lcom/p1/mobile/putong/data/Picture;

    .line 31
    iput-object p4, p0, Ll/gp4;->v:Ljava/lang/Runnable;

    .line 32
    iput-object p5, p0, Ll/gp4;->w:Ljava/lang/Runnable;

    .line 33
    const-string p1, "p_save_second_authentication_prompt_popup"

    iput-object p1, p0, Ll/gp4;->z:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/Picture;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/Picture;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/data/Picture;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 34
    invoke-direct {p0, p1}, Ll/q27;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    .line 35
    iput-boolean v0, p0, Ll/gp4;->y:Z

    .line 36
    iput-object p1, p0, Ll/gp4;->s:Lcom/p1/mobile/android/app/Act;

    .line 37
    iput-object p2, p0, Ll/gp4;->t:Lcom/p1/mobile/putong/data/Picture;

    .line 38
    iput-object p3, p0, Ll/gp4;->u:Lcom/p1/mobile/putong/data/Picture;

    .line 39
    iput-object p4, p0, Ll/gp4;->v:Ljava/lang/Runnable;

    .line 40
    iput-object p5, p0, Ll/gp4;->w:Ljava/lang/Runnable;

    .line 41
    iput-object p6, p0, Ll/gp4;->x:Ljava/lang/Runnable;

    .line 42
    const-string p1, "p_return_second_authentication_prompt_popup"

    iput-object p1, p0, Ll/gp4;->z:Ljava/lang/String;

    return-void
.end method

.method public static synthetic I(Ll/gp4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gp4;->a0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/gp4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gp4;->b0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/gp4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gp4;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Ll/gp4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gp4;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Ll/gp4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gp4;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N(Ll/gp4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gp4;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Ll/gp4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gp4;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P(Ll/gp4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gp4;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Ll/gp4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gp4;->U(Landroid/view/View;)V

    return-void
.end method

.method private S()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/gp4;->s:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/gp4;->R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/gp4;->h:Lv/VText_NoTopPadding;

    .line 31
    .line 32
    const-string v2, "#CC000000"

    .line 33
    .line 34
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/gp4;->m:Lv/VText_NoTopPadding;

    .line 42
    .line 43
    sget v2, Ll/kbc0;->G0:I

    .line 44
    .line 45
    invoke-virtual {v0, v2, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/gp4;->p:Lv/VText_NoTopPadding;

    .line 49
    .line 50
    sget v2, Ll/kbc0;->F0:I

    .line 51
    .line 52
    invoke-virtual {v0, v2, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/gp4;->q:Lv/VText_NoTopPadding;

    .line 56
    .line 57
    sget v2, Ll/kbc0;->D0:I

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/gp4;->l:Landroid/view/View;

    .line 63
    .line 64
    sget v2, Ll/kbc0;->q:I

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 67
    .line 68
    .line 69
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v0}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->e(Lcom/p1/mobile/putong/data/User;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iget-object v2, p0, Ll/gp4;->k:Lv/VImage;

    .line 82
    .line 83
    const/4 v3, 0x1

    .line 84
    const/4 v4, -0x1

    .line 85
    if-ne v0, v4, :cond_1

    .line 86
    .line 87
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    invoke-virtual {v2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/gp4;->k:Lv/VImage;

    .line 95
    .line 96
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    :goto_0
    iget-object v0, p0, Ll/gp4;->i:Lv/VText_NoTopPadding;

    .line 100
    .line 101
    sget-object v2, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 102
    .line 103
    invoke-static {}, Ll/xra;->w()Z

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    const/4 v5, 0x6

    .line 108
    const/16 v6, 0x9

    .line 109
    .line 110
    if-eqz v4, :cond_2

    .line 111
    .line 112
    move v4, v6

    .line 113
    goto :goto_1

    .line 114
    :cond_2
    move v4, v5

    .line 115
    :goto_1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    const-string v7, "\u5efa\u8bae\u4fdd\u7559\u539f\u5934\u50cf\u53ca\u8ba4\u8bc1\u6743\u76ca\uff0c\u7167\u7247\u672a\u6ee1%d\u5f20\uff0c\u65b0\u5934\u50cf\u4f1a\u4fdd\u5b58\u4e3a\u5176\u4ed6\u7167\u7247"

    .line 124
    .line 125
    invoke-static {v2, v7, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    .line 131
    .line 132
    invoke-static {}, Ll/bnl0;->y0()I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    const/high16 v4, 0x42ba0000    # 93.0f

    .line 137
    .line 138
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    sub-int/2addr v0, v4

    .line 143
    mul-int/lit16 v0, v0, 0xad

    .line 144
    .line 145
    div-int/lit16 v0, v0, 0x8d

    .line 146
    .line 147
    shr-int/2addr v0, v3

    .line 148
    iget-object v4, p0, Ll/gp4;->j:Lv/VDraweeView;

    .line 149
    .line 150
    invoke-static {v4, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 151
    .line 152
    .line 153
    iget-object v4, p0, Ll/gp4;->n:Lv/VDraweeView;

    .line 154
    .line 155
    invoke-static {v4, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 156
    .line 157
    .line 158
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 159
    .line 160
    iget-object v4, p0, Ll/gp4;->j:Lv/VDraweeView;

    .line 161
    .line 162
    iget-object v8, p0, Ll/gp4;->t:Lcom/p1/mobile/putong/data/Picture;

    .line 163
    .line 164
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 165
    .line 166
    .line 167
    move-result-object v8

    .line 168
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v8

    .line 172
    invoke-virtual {v0, v4, v8}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 176
    .line 177
    iget-object v4, p0, Ll/gp4;->n:Lv/VDraweeView;

    .line 178
    .line 179
    iget-object v8, p0, Ll/gp4;->u:Lcom/p1/mobile/putong/data/Picture;

    .line 180
    .line 181
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 182
    .line 183
    .line 184
    move-result-object v8

    .line 185
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v8

    .line 189
    invoke-virtual {v0, v4, v8}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Ll/gp4;->j:Lv/VDraweeView;

    .line 193
    .line 194
    new-instance v4, Ll/xo4;

    .line 195
    .line 196
    invoke-direct {v4, p0}, Ll/xo4;-><init>(Ll/gp4;)V

    .line 197
    .line 198
    .line 199
    invoke-static {v0, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Ll/gp4;->n:Lv/VDraweeView;

    .line 203
    .line 204
    new-instance v4, Ll/yo4;

    .line 205
    .line 206
    invoke-direct {v4, p0}, Ll/yo4;-><init>(Ll/gp4;)V

    .line 207
    .line 208
    .line 209
    invoke-static {v0, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 210
    .line 211
    .line 212
    iget-object v0, p0, Ll/gp4;->l:Landroid/view/View;

    .line 213
    .line 214
    new-instance v4, Ll/zo4;

    .line 215
    .line 216
    invoke-direct {v4, p0}, Ll/zo4;-><init>(Ll/gp4;)V

    .line 217
    .line 218
    .line 219
    invoke-static {v0, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Ll/gp4;->o:Landroid/view/View;

    .line 223
    .line 224
    new-instance v4, Ll/ap4;

    .line 225
    .line 226
    invoke-direct {v4, p0}, Ll/ap4;-><init>(Ll/gp4;)V

    .line 227
    .line 228
    .line 229
    invoke-static {v0, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 230
    .line 231
    .line 232
    iget-object v0, p0, Ll/gp4;->w:Ljava/lang/Runnable;

    .line 233
    .line 234
    const-string v4, "\u65b0\u5934\u50cf\u4f1a\u5bfc\u81f4\u8ba4\u8bc1\u5931\u6548"

    .line 235
    .line 236
    if-nez v0, :cond_4

    .line 237
    .line 238
    iget-object v0, p0, Ll/gp4;->h:Lv/VText_NoTopPadding;

    .line 239
    .line 240
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    iget-object v0, p0, Ll/gp4;->i:Lv/VText_NoTopPadding;

    .line 244
    .line 245
    invoke-static {}, Ll/xra;->w()Z

    .line 246
    .line 247
    .line 248
    move-result v4

    .line 249
    if-eqz v4, :cond_3

    .line 250
    .line 251
    move v5, v6

    .line 252
    :cond_3
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v4

    .line 260
    invoke-static {v2, v7, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 265
    .line 266
    .line 267
    iget-object v0, p0, Ll/gp4;->l:Landroid/view/View;

    .line 268
    .line 269
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 270
    .line 271
    .line 272
    iget-object v0, p0, Ll/gp4;->o:Landroid/view/View;

    .line 273
    .line 274
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 275
    .line 276
    .line 277
    iget-object v0, p0, Ll/gp4;->q:Lv/VText_NoTopPadding;

    .line 278
    .line 279
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 280
    .line 281
    .line 282
    iget-object v0, p0, Ll/gp4;->r:Lv/VText_NoTopPadding;

    .line 283
    .line 284
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 285
    .line 286
    .line 287
    iget-object v0, p0, Ll/gp4;->q:Lv/VText_NoTopPadding;

    .line 288
    .line 289
    const-string v1, "\u786e\u5b9a"

    .line 290
    .line 291
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    .line 293
    .line 294
    iget-object v0, p0, Ll/gp4;->q:Lv/VText_NoTopPadding;

    .line 295
    .line 296
    new-instance v1, Ll/bp4;

    .line 297
    .line 298
    invoke-direct {v1, p0}, Ll/bp4;-><init>(Ll/gp4;)V

    .line 299
    .line 300
    .line 301
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 302
    .line 303
    .line 304
    return-void

    .line 305
    :cond_4
    iget-object v0, p0, Ll/gp4;->x:Ljava/lang/Runnable;

    .line 306
    .line 307
    iget-object v2, p0, Ll/gp4;->h:Lv/VText_NoTopPadding;

    .line 308
    .line 309
    if-nez v0, :cond_5

    .line 310
    .line 311
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    .line 313
    .line 314
    iget-object v0, p0, Ll/gp4;->i:Lv/VText_NoTopPadding;

    .line 315
    .line 316
    const-string v2, "\u8ba4\u8bc1\u5931\u6548\u540e\u7cfb\u7edf\u4f1a\u56de\u6536\u8ba4\u8bc1\u6807\u8bc6\u3001\u53ea\u770b\u8ba4\u8bc1\u6743\u76ca"

    .line 317
    .line 318
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 319
    .line 320
    .line 321
    iget-object v0, p0, Ll/gp4;->l:Landroid/view/View;

    .line 322
    .line 323
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 324
    .line 325
    .line 326
    iget-object v0, p0, Ll/gp4;->o:Landroid/view/View;

    .line 327
    .line 328
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 329
    .line 330
    .line 331
    iget-object v0, p0, Ll/gp4;->q:Lv/VText_NoTopPadding;

    .line 332
    .line 333
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 334
    .line 335
    .line 336
    iget-object v0, p0, Ll/gp4;->r:Lv/VText_NoTopPadding;

    .line 337
    .line 338
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 339
    .line 340
    .line 341
    iget-object v0, p0, Ll/gp4;->q:Lv/VText_NoTopPadding;

    .line 342
    .line 343
    const-string v1, "\u4f7f\u7528\u539f\u5934\u50cf\uff0c\u5e76\u4fdd\u5b58\u5176\u4ed6\u8d44\u6599"

    .line 344
    .line 345
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 346
    .line 347
    .line 348
    iget-object v0, p0, Ll/gp4;->r:Lv/VText_NoTopPadding;

    .line 349
    .line 350
    const-string v1, "\u4f7f\u7528\u65b0\u5934\u50cf\uff0c\u5e76\u4fdd\u5b58\u5176\u4ed6\u8d44\u6599"

    .line 351
    .line 352
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 353
    .line 354
    .line 355
    iget-object v0, p0, Ll/gp4;->q:Lv/VText_NoTopPadding;

    .line 356
    .line 357
    new-instance v1, Ll/cp4;

    .line 358
    .line 359
    invoke-direct {v1, p0}, Ll/cp4;-><init>(Ll/gp4;)V

    .line 360
    .line 361
    .line 362
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 363
    .line 364
    .line 365
    iget-object v0, p0, Ll/gp4;->r:Lv/VText_NoTopPadding;

    .line 366
    .line 367
    new-instance v1, Ll/dp4;

    .line 368
    .line 369
    invoke-direct {v1, p0}, Ll/dp4;-><init>(Ll/gp4;)V

    .line 370
    .line 371
    .line 372
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 373
    .line 374
    .line 375
    return-void

    .line 376
    :cond_5
    const-string v0, "\u5934\u50cf\u548c\u5176\u4ed6\u8d44\u6599\u4fee\u6539\u672a\u4fdd\u5b58"

    .line 377
    .line 378
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 379
    .line 380
    .line 381
    iget-object v0, p0, Ll/gp4;->i:Lv/VText_NoTopPadding;

    .line 382
    .line 383
    const-string v2, "\u65b0\u5934\u50cf\u4f1a\u5bfc\u81f4\u8ba4\u8bc1\u5931\u6548\uff0c\u662f\u5426\u4fdd\u5b58\u539f\u5934\u50cf\u548c\u5176\u4ed6\u8d44\u6599"

    .line 384
    .line 385
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 386
    .line 387
    .line 388
    iget-object v0, p0, Ll/gp4;->l:Landroid/view/View;

    .line 389
    .line 390
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 391
    .line 392
    .line 393
    iget-object v0, p0, Ll/gp4;->o:Landroid/view/View;

    .line 394
    .line 395
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 396
    .line 397
    .line 398
    iget-object v0, p0, Ll/gp4;->q:Lv/VText_NoTopPadding;

    .line 399
    .line 400
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 401
    .line 402
    .line 403
    iget-object v0, p0, Ll/gp4;->r:Lv/VText_NoTopPadding;

    .line 404
    .line 405
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 406
    .line 407
    .line 408
    iget-object v0, p0, Ll/gp4;->q:Lv/VText_NoTopPadding;

    .line 409
    .line 410
    const-string v1, "\u4f7f\u7528\u539f\u5934\u50cf\uff0c\u5e76\u4fdd\u5b58\u5176\u4ed6\u4fee\u6539"

    .line 411
    .line 412
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 413
    .line 414
    .line 415
    iget-object v0, p0, Ll/gp4;->r:Lv/VText_NoTopPadding;

    .line 416
    .line 417
    const-string v1, "\u4e0d\u4fdd\u5b58\u672c\u6b21\u4fee\u6539"

    .line 418
    .line 419
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 420
    .line 421
    .line 422
    iget-object v0, p0, Ll/gp4;->q:Lv/VText_NoTopPadding;

    .line 423
    .line 424
    new-instance v1, Ll/ep4;

    .line 425
    .line 426
    invoke-direct {v1, p0}, Ll/ep4;-><init>(Ll/gp4;)V

    .line 427
    .line 428
    .line 429
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 430
    .line 431
    .line 432
    iget-object v0, p0, Ll/gp4;->r:Lv/VText_NoTopPadding;

    .line 433
    .line 434
    new-instance v1, Ll/fp4;

    .line 435
    .line 436
    invoke-direct {v1, p0}, Ll/fp4;-><init>(Ll/gp4;)V

    .line 437
    .line 438
    .line 439
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 440
    .line 441
    .line 442
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gp4;->l:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic U(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gp4;->o:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/gp4;->y:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/gp4;->c0()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/gp4;->w:Ljava/lang/Runnable;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const-string p1, "e_select_avatar"

    .line 12
    .line 13
    iget-object p0, p0, Ll/gp4;->z:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/gp4;->y:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/gp4;->c0()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/gp4;->w:Ljava/lang/Runnable;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const-string p1, "e_select_avatar"

    .line 12
    .line 13
    iget-object p0, p0, Ll/gp4;->z:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/gp4;->y:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/gp4;->v:Ljava/lang/Runnable;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/gp4;->z:Ljava/lang/String;

    .line 16
    .line 17
    iget-boolean p0, p0, Ll/gp4;->y:Z

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string p0, "old"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string p0, "new"

    .line 25
    .line 26
    :goto_0
    const-string v0, "select_type"

    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    filled-new-array {p0}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string v0, "e_confirm_selection"

    .line 37
    .line 38
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/gp4;->v:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Ll/gp4;->w:Ljava/lang/Runnable;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 13
    .line 14
    .line 15
    :cond_1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 16
    .line 17
    .line 18
    const-string p1, "e_save_original_avatar_other_modify"

    .line 19
    .line 20
    iget-object p0, p0, Ll/gp4;->z:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic Z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/gp4;->w:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 9
    .line 10
    .line 11
    const-string p1, "e_save_new_avatar_other_modify"

    .line 12
    .line 13
    iget-object p0, p0, Ll/gp4;->z:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic a0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/gp4;->v:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Ll/gp4;->w:Ljava/lang/Runnable;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 13
    .line 14
    .line 15
    :cond_1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 16
    .line 17
    .line 18
    const-string p1, "e_save_original_avatar_other_modify"

    .line 19
    .line 20
    iget-object p0, p0, Ll/gp4;->z:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic b0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/gp4;->x:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 9
    .line 10
    .line 11
    const-string p1, "e_not_save"

    .line 12
    .line 13
    iget-object p0, p0, Ll/gp4;->z:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public C()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public F()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gp4;->z:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public G()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gp4;->g:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public H()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hp4;->b(Ll/gp4;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/gp4;->y:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/gp4;->l:Landroid/view/View;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Ll/kbc0;->U1:I

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/gp4;->o:Landroid/view/View;

    .line 13
    .line 14
    sget v0, Ll/kbc0;->T1:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget v0, Ll/kbc0;->T1:I

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/gp4;->o:Landroid/view/View;

    .line 26
    .line 27
    sget v0, Ll/kbc0;->U1:I

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/q27;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/gp4;->S()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public z()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
