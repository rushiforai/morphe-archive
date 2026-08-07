.class public Ll/th0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/th0$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/CharSequence;

.field public b:Ljava/lang/CharSequence;

.field public c:I

.field public d:Ljava/lang/CharSequence;

.field public e:Ljava/lang/CharSequence;

.field public f:Z

.field public g:Z

.field public h:Landroid/view/View$OnClickListener;

.field public i:Landroid/view/View$OnClickListener;

.field public j:Landroid/content/DialogInterface$OnCancelListener;

.field public k:Landroid/content/DialogInterface$OnShowListener;

.field public l:Landroid/content/DialogInterface$OnDismissListener;

.field public m:I

.field public n:I

.field public o:I

.field public p:Z

.field public q:Z

.field public r:Landroid/content/Context;

.field public s:Landroidx/appcompat/app/a;

.field public t:Lv/VText;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Landroid/view/View;

.field public y:Z

.field public z:Landroid/text/method/MovementMethod;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;Landroid/content/DialogInterface$OnCancelListener;Landroid/content/DialogInterface$OnShowListener;Landroid/content/DialogInterface$OnDismissListener;IIIZZLandroid/text/method/MovementMethod;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Ll/th0;->a:Ljava/lang/CharSequence;

    .line 3
    iput-object p2, p0, Ll/th0;->b:Ljava/lang/CharSequence;

    .line 4
    iput p3, p0, Ll/th0;->c:I

    .line 5
    iput-object p4, p0, Ll/th0;->d:Ljava/lang/CharSequence;

    .line 6
    iput-object p5, p0, Ll/th0;->e:Ljava/lang/CharSequence;

    .line 7
    iput-boolean p6, p0, Ll/th0;->f:Z

    .line 8
    iput-boolean p7, p0, Ll/th0;->g:Z

    .line 9
    iput-object p8, p0, Ll/th0;->h:Landroid/view/View$OnClickListener;

    .line 10
    iput-object p9, p0, Ll/th0;->i:Landroid/view/View$OnClickListener;

    .line 11
    iput-object p10, p0, Ll/th0;->j:Landroid/content/DialogInterface$OnCancelListener;

    .line 12
    iput-object p11, p0, Ll/th0;->k:Landroid/content/DialogInterface$OnShowListener;

    .line 13
    iput-object p12, p0, Ll/th0;->l:Landroid/content/DialogInterface$OnDismissListener;

    .line 14
    iput p13, p0, Ll/th0;->m:I

    .line 15
    iput p14, p0, Ll/th0;->n:I

    .line 16
    iput p15, p0, Ll/th0;->o:I

    move/from16 p1, p16

    .line 17
    iput-boolean p1, p0, Ll/th0;->p:Z

    move/from16 p1, p17

    .line 18
    iput-boolean p1, p0, Ll/th0;->q:Z

    move-object/from16 p1, p18

    .line 19
    iput-object p1, p0, Ll/th0;->z:Landroid/text/method/MovementMethod;

    move-object/from16 p1, p19

    .line 20
    iput-object p1, p0, Ll/th0;->r:Landroid/content/Context;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;Landroid/content/DialogInterface$OnCancelListener;Landroid/content/DialogInterface$OnShowListener;Landroid/content/DialogInterface$OnDismissListener;IIIZZLandroid/text/method/MovementMethod;Landroid/content/Context;Ll/uh0;)V
    .locals 0

    .line 21
    invoke-direct/range {p0 .. p19}, Ll/th0;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;Landroid/content/DialogInterface$OnCancelListener;Landroid/content/DialogInterface$OnShowListener;Landroid/content/DialogInterface$OnDismissListener;IIIZZLandroid/text/method/MovementMethod;Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Ll/th0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/th0;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/th0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/th0;->e(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    iget-object p0, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/th0;->y:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/th0;->y:Z

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/th0;->p:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object p0, p0, Ll/th0;->h:Landroid/view/View$OnClickListener;

    .line 19
    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/th0;->y:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/th0;->y:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/th0;->i:Landroid/view/View$OnClickListener;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public g()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/th0;->r:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/gec0;->g:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Landroidx/appcompat/app/a$a;

    .line 15
    .line 16
    iget-object v2, p0, Ll/th0;->r:Landroid/content/Context;

    .line 17
    .line 18
    iget v3, p0, Ll/th0;->o:I

    .line 19
    .line 20
    invoke-direct {v1, v2, v3}, Landroidx/appcompat/app/a$a;-><init>(Landroid/content/Context;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroidx/appcompat/app/a$a;->setView(Landroid/view/View;)Landroidx/appcompat/app/a$a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroidx/appcompat/app/a$a;->create()Landroidx/appcompat/app/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const v2, 0x3e99999a    # 0.3f

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/view/Window;->setDimAmount(F)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 44
    .line 45
    iget-boolean v3, p0, Ll/th0;->f:Z

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 51
    .line 52
    iget-boolean v3, p0, Ll/th0;->g:Z

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 55
    .line 56
    .line 57
    sget v2, Ll/vcc0;->e:I

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Lv/VText;

    .line 64
    .line 65
    iput-object v2, p0, Ll/th0;->t:Lv/VText;

    .line 66
    .line 67
    const/4 v3, 0x3

    .line 68
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 73
    .line 74
    .line 75
    sget v2, Ll/vcc0;->b:I

    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Lv/VText;

    .line 82
    .line 83
    iput-object v2, p0, Ll/th0;->u:Lv/VText;

    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    const/4 v5, 0x0

    .line 90
    invoke-virtual {v2, v4, v5}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 91
    .line 92
    .line 93
    sget v2, Ll/vcc0;->d:I

    .line 94
    .line 95
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    check-cast v2, Lv/VText;

    .line 100
    .line 101
    iput-object v2, p0, Ll/th0;->v:Lv/VText;

    .line 102
    .line 103
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 108
    .line 109
    .line 110
    sget v2, Ll/vcc0;->c:I

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Lv/VText;

    .line 117
    .line 118
    iput-object v2, p0, Ll/th0;->w:Lv/VText;

    .line 119
    .line 120
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 125
    .line 126
    .line 127
    sget v2, Ll/vcc0;->F:I

    .line 128
    .line 129
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Ll/th0;->x:Landroid/view/View;

    .line 134
    .line 135
    iget-boolean v0, p0, Ll/th0;->q:Z

    .line 136
    .line 137
    iget-object v2, p0, Ll/th0;->t:Lv/VText;

    .line 138
    .line 139
    const/4 v3, 0x1

    .line 140
    if-eqz v0, :cond_0

    .line 141
    .line 142
    const v0, 0x7fffffff

    .line 143
    .line 144
    .line 145
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 146
    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 150
    .line 151
    .line 152
    :goto_0
    iget-object v0, p0, Ll/th0;->a:Ljava/lang/CharSequence;

    .line 153
    .line 154
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    iget-object v2, p0, Ll/th0;->t:Lv/VText;

    .line 159
    .line 160
    const/16 v4, 0x8

    .line 161
    .line 162
    if-nez v0, :cond_1

    .line 163
    .line 164
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Ll/th0;->t:Lv/VText;

    .line 168
    .line 169
    iget-object v2, p0, Ll/th0;->a:Ljava/lang/CharSequence;

    .line 170
    .line 171
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    .line 173
    .line 174
    move v0, v3

    .line 175
    goto :goto_1

    .line 176
    :cond_1
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 177
    .line 178
    .line 179
    move v0, v5

    .line 180
    :goto_1
    iget-object v2, p0, Ll/th0;->b:Ljava/lang/CharSequence;

    .line 181
    .line 182
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    iget-object v6, p0, Ll/th0;->u:Lv/VText;

    .line 187
    .line 188
    if-nez v2, :cond_2

    .line 189
    .line 190
    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    .line 191
    .line 192
    .line 193
    iget-object v2, p0, Ll/th0;->u:Lv/VText;

    .line 194
    .line 195
    iget-object v6, p0, Ll/th0;->b:Ljava/lang/CharSequence;

    .line 196
    .line 197
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    .line 199
    .line 200
    iget-object v2, p0, Ll/th0;->u:Lv/VText;

    .line 201
    .line 202
    iget v6, p0, Ll/th0;->c:I

    .line 203
    .line 204
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 205
    .line 206
    .line 207
    goto :goto_2

    .line 208
    :cond_2
    invoke-virtual {v6, v4}, Landroid/view/View;->setVisibility(I)V

    .line 209
    .line 210
    .line 211
    move v3, v5

    .line 212
    :goto_2
    if-eqz v0, :cond_4

    .line 213
    .line 214
    if-eqz v3, :cond_3

    .line 215
    .line 216
    iget-object v0, p0, Ll/th0;->t:Lv/VText;

    .line 217
    .line 218
    iget-object v2, p0, Ll/th0;->r:Landroid/content/Context;

    .line 219
    .line 220
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    sget v3, Ll/z8c0;->c:I

    .line 225
    .line 226
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 227
    .line 228
    .line 229
    move-result v2

    .line 230
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Ll/th0;->t:Lv/VText;

    .line 234
    .line 235
    const/high16 v2, 0x41900000    # 18.0f

    .line 236
    .line 237
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Ll/th0;->u:Lv/VText;

    .line 241
    .line 242
    iget-object v2, p0, Ll/th0;->r:Landroid/content/Context;

    .line 243
    .line 244
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 245
    .line 246
    .line 247
    move-result-object v2

    .line 248
    sget v3, Ll/z8c0;->b:I

    .line 249
    .line 250
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 251
    .line 252
    .line 253
    move-result v2

    .line 254
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 255
    .line 256
    .line 257
    iget-object v0, p0, Ll/th0;->u:Lv/VText;

    .line 258
    .line 259
    const/high16 v2, 0x41600000    # 14.0f

    .line 260
    .line 261
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Ll/th0;->t:Lv/VText;

    .line 265
    .line 266
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 271
    .line 272
    sget v2, Ll/qa00;->v:I

    .line 273
    .line 274
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 275
    .line 276
    sget v2, Ll/qa00;->j:I

    .line 277
    .line 278
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 279
    .line 280
    iget-object v0, p0, Ll/th0;->u:Lv/VText;

    .line 281
    .line 282
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 287
    .line 288
    sget v2, Ll/qa00;->n:I

    .line 289
    .line 290
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 291
    .line 292
    goto :goto_3

    .line 293
    :cond_3
    const-string p0, "Title and Content must be set simultaneously"

    .line 294
    .line 295
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    return-void

    .line 299
    :cond_4
    if-eqz v3, :cond_f

    .line 300
    .line 301
    iget-object v0, p0, Ll/th0;->u:Lv/VText;

    .line 302
    .line 303
    const/high16 v2, 0x42500000    # 52.0f

    .line 304
    .line 305
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 306
    .line 307
    .line 308
    move-result v2

    .line 309
    invoke-virtual {v0, v2}, Landroid/view/View;->setMinimumHeight(I)V

    .line 310
    .line 311
    .line 312
    iget-object v0, p0, Ll/th0;->u:Lv/VText;

    .line 313
    .line 314
    const/high16 v2, 0x41800000    # 16.0f

    .line 315
    .line 316
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 317
    .line 318
    .line 319
    iget-object v0, p0, Ll/th0;->u:Lv/VText;

    .line 320
    .line 321
    iget-object v2, p0, Ll/th0;->r:Landroid/content/Context;

    .line 322
    .line 323
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 324
    .line 325
    .line 326
    move-result-object v2

    .line 327
    sget v3, Ll/z8c0;->c:I

    .line 328
    .line 329
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 330
    .line 331
    .line 332
    move-result v2

    .line 333
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 334
    .line 335
    .line 336
    iget-object v0, p0, Ll/th0;->u:Lv/VText;

    .line 337
    .line 338
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 343
    .line 344
    sget v2, Ll/qa00;->v:I

    .line 345
    .line 346
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 347
    .line 348
    sget v2, Ll/qa00;->n:I

    .line 349
    .line 350
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 351
    .line 352
    :goto_3
    iget-object v0, p0, Ll/th0;->d:Ljava/lang/CharSequence;

    .line 353
    .line 354
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    iget-object v2, p0, Ll/th0;->v:Lv/VText;

    .line 359
    .line 360
    if-nez v0, :cond_5

    .line 361
    .line 362
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 363
    .line 364
    .line 365
    iget-object v0, p0, Ll/th0;->v:Lv/VText;

    .line 366
    .line 367
    iget-object v2, p0, Ll/th0;->d:Ljava/lang/CharSequence;

    .line 368
    .line 369
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 370
    .line 371
    .line 372
    goto :goto_4

    .line 373
    :cond_5
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 374
    .line 375
    .line 376
    :goto_4
    iget-object v0, p0, Ll/th0;->e:Ljava/lang/CharSequence;

    .line 377
    .line 378
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    iget-object v2, p0, Ll/th0;->w:Lv/VText;

    .line 383
    .line 384
    if-nez v0, :cond_6

    .line 385
    .line 386
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 387
    .line 388
    .line 389
    iget-object v0, p0, Ll/th0;->w:Lv/VText;

    .line 390
    .line 391
    iget-object v2, p0, Ll/th0;->e:Ljava/lang/CharSequence;

    .line 392
    .line 393
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 394
    .line 395
    .line 396
    goto :goto_5

    .line 397
    :cond_6
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 398
    .line 399
    .line 400
    :goto_5
    iget-object v0, p0, Ll/th0;->d:Ljava/lang/CharSequence;

    .line 401
    .line 402
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 403
    .line 404
    .line 405
    move-result v0

    .line 406
    if-nez v0, :cond_8

    .line 407
    .line 408
    iget-object v0, p0, Ll/th0;->e:Ljava/lang/CharSequence;

    .line 409
    .line 410
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    if-eqz v0, :cond_7

    .line 415
    .line 416
    goto :goto_6

    .line 417
    :cond_7
    iget-object v0, p0, Ll/th0;->x:Landroid/view/View;

    .line 418
    .line 419
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 420
    .line 421
    .line 422
    goto :goto_7

    .line 423
    :cond_8
    :goto_6
    iget-object v0, p0, Ll/th0;->x:Landroid/view/View;

    .line 424
    .line 425
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 426
    .line 427
    .line 428
    :goto_7
    iget v0, p0, Ll/th0;->m:I

    .line 429
    .line 430
    if-lez v0, :cond_9

    .line 431
    .line 432
    iget-object v0, p0, Ll/th0;->r:Landroid/content/Context;

    .line 433
    .line 434
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    iget v2, p0, Ll/th0;->m:I

    .line 439
    .line 440
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 441
    .line 442
    .line 443
    move-result-object v0

    .line 444
    if-eqz v0, :cond_9

    .line 445
    .line 446
    iget-object v2, p0, Ll/th0;->v:Lv/VText;

    .line 447
    .line 448
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 449
    .line 450
    .line 451
    :cond_9
    iget v0, p0, Ll/th0;->n:I

    .line 452
    .line 453
    if-lez v0, :cond_a

    .line 454
    .line 455
    iget-object v0, p0, Ll/th0;->r:Landroid/content/Context;

    .line 456
    .line 457
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    iget v2, p0, Ll/th0;->n:I

    .line 462
    .line 463
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 464
    .line 465
    .line 466
    move-result-object v0

    .line 467
    if-eqz v0, :cond_a

    .line 468
    .line 469
    iget-object v2, p0, Ll/th0;->w:Lv/VText;

    .line 470
    .line 471
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 472
    .line 473
    .line 474
    :cond_a
    iget-object v0, p0, Ll/th0;->j:Landroid/content/DialogInterface$OnCancelListener;

    .line 475
    .line 476
    if-eqz v0, :cond_b

    .line 477
    .line 478
    iget-object v2, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 479
    .line 480
    invoke-virtual {v2, v0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 481
    .line 482
    .line 483
    :cond_b
    iget-object v0, p0, Ll/th0;->k:Landroid/content/DialogInterface$OnShowListener;

    .line 484
    .line 485
    if-eqz v0, :cond_c

    .line 486
    .line 487
    iget-object v2, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 488
    .line 489
    invoke-virtual {v2, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 490
    .line 491
    .line 492
    :cond_c
    iget-object v0, p0, Ll/th0;->l:Landroid/content/DialogInterface$OnDismissListener;

    .line 493
    .line 494
    if-eqz v0, :cond_d

    .line 495
    .line 496
    iget-object v2, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 497
    .line 498
    invoke-virtual {v2, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 499
    .line 500
    .line 501
    :cond_d
    iget-object v0, p0, Ll/th0;->v:Lv/VText;

    .line 502
    .line 503
    new-instance v2, Ll/rh0;

    .line 504
    .line 505
    invoke-direct {v2, p0}, Ll/rh0;-><init>(Ll/th0;)V

    .line 506
    .line 507
    .line 508
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 509
    .line 510
    .line 511
    iget-object v0, p0, Ll/th0;->w:Lv/VText;

    .line 512
    .line 513
    new-instance v2, Ll/sh0;

    .line 514
    .line 515
    invoke-direct {v2, p0}, Ll/sh0;-><init>(Ll/th0;)V

    .line 516
    .line 517
    .line 518
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 519
    .line 520
    .line 521
    iget-object v0, p0, Ll/th0;->z:Landroid/text/method/MovementMethod;

    .line 522
    .line 523
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 524
    .line 525
    .line 526
    move-result v0

    .line 527
    if-eqz v0, :cond_e

    .line 528
    .line 529
    iget-object v0, p0, Ll/th0;->u:Lv/VText;

    .line 530
    .line 531
    iget-object v2, p0, Ll/th0;->z:Landroid/text/method/MovementMethod;

    .line 532
    .line 533
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 534
    .line 535
    .line 536
    :cond_e
    iget-object p0, p0, Ll/th0;->s:Landroidx/appcompat/app/a;

    .line 537
    .line 538
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 539
    .line 540
    .line 541
    const p0, 0x438b8000    # 279.0f

    .line 542
    .line 543
    .line 544
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 545
    .line 546
    .line 547
    move-result p0

    .line 548
    const/4 v0, -0x2

    .line 549
    invoke-virtual {v1, p0, v0}, Landroid/view/Window;->setLayout(II)V

    .line 550
    .line 551
    .line 552
    return-void

    .line 553
    :cond_f
    const-string p0, "Title and Content are empty"

    .line 554
    .line 555
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 556
    .line 557
    .line 558
    return-void
.end method
