.class public Lcom/p1/mobile/android/app/Dialog;
.super Ll/g1e;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/app/Dialog$e;,
        Lcom/p1/mobile/android/app/Dialog$Theme;,
        Lcom/p1/mobile/android/app/Dialog$f;,
        Lcom/p1/mobile/android/app/Dialog$g;,
        Lcom/p1/mobile/android/app/Dialog$ListType;,
        Lcom/p1/mobile/android/app/Dialog$h;,
        Lcom/p1/mobile/android/app/Dialog$Action;,
        Lcom/p1/mobile/android/app/Dialog$i;
    }
.end annotation


# static fields
.field public static final K:I

.field public static final L:I

.field public static final M:I

.field public static final N:I

.field public static final O:I

.field public static final P:I

.field public static final Q:I

.field public static final R:I

.field public static final S:I

.field public static final T:I

.field public static final U:I

.field public static final V:I


# instance fields
.field public A:Landroid/widget/FrameLayout;

.field public B:Landroid/widget/FrameLayout;

.field public C:Landroid/widget/TextView;

.field public D:Z

.field public E:Z

.field public F:I

.field public G:Lcom/p1/mobile/android/app/Dialog$ListType;

.field public H:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public I:Z

.field public J:Z

.field public final j:Lv/VLinear_Foreground;

.field public k:Lv/VLinear_Foreground;

.field public final l:Lcom/p1/mobile/android/app/Dialog$e;

.field public m:Lv/VList;

.field public n:Landroid/view/View;

.field public o:Landroid/widget/TextView;

.field public p:Landroid/widget/TextView;

.field public q:Landroid/widget/TextView;

.field public r:Landroid/widget/LinearLayout;

.field public s:Landroid/widget/FrameLayout;

.field public t:Landroid/widget/FrameLayout;

.field public u:Landroid/widget/LinearLayout;

.field public v:Landroid/widget/FrameLayout;

.field public w:Landroid/view/ViewGroup;

.field public x:Landroid/widget/TextView;

.field public y:Landroid/widget/FrameLayout;

.field public z:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x40c00000    # 6.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/android/app/Dialog;->K:I

    .line 8
    .line 9
    const/high16 v0, 0x41000000    # 8.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/android/app/Dialog;->L:I

    .line 16
    .line 17
    const/high16 v0, 0x41400000    # 12.0f

    .line 18
    .line 19
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sput v0, Lcom/p1/mobile/android/app/Dialog;->M:I

    .line 24
    .line 25
    const/high16 v0, 0x41800000    # 16.0f

    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sput v0, Lcom/p1/mobile/android/app/Dialog;->N:I

    .line 32
    .line 33
    const/high16 v0, 0x41c00000    # 24.0f

    .line 34
    .line 35
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    sput v0, Lcom/p1/mobile/android/app/Dialog;->O:I

    .line 40
    .line 41
    const/high16 v0, 0x42000000    # 32.0f

    .line 42
    .line 43
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    sput v0, Lcom/p1/mobile/android/app/Dialog;->P:I

    .line 48
    .line 49
    const/high16 v0, 0x42200000    # 40.0f

    .line 50
    .line 51
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    sput v0, Lcom/p1/mobile/android/app/Dialog;->Q:I

    .line 56
    .line 57
    const/high16 v0, 0x42280000    # 42.0f

    .line 58
    .line 59
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    sput v0, Lcom/p1/mobile/android/app/Dialog;->R:I

    .line 64
    .line 65
    const/high16 v0, 0x42400000    # 48.0f

    .line 66
    .line 67
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    sput v0, Lcom/p1/mobile/android/app/Dialog;->S:I

    .line 72
    .line 73
    const/high16 v0, 0x42800000    # 64.0f

    .line 74
    .line 75
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    sput v0, Lcom/p1/mobile/android/app/Dialog;->T:I

    .line 80
    .line 81
    const/high16 v0, 0x42900000    # 72.0f

    .line 82
    .line 83
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    sput v0, Lcom/p1/mobile/android/app/Dialog;->U:I

    .line 88
    .line 89
    const/high16 v0, 0x43100000    # 144.0f

    .line 90
    .line 91
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    sput v0, Lcom/p1/mobile/android/app/Dialog;->V:I

    .line 96
    .line 97
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Dialog$e;)V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog;->Q(Lcom/p1/mobile/android/app/Dialog$e;)Landroid/view/ContextThemeWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v1, p1, Lcom/p1/mobile/android/app/Dialog$e;->i0:Z

    .line 6
    .line 7
    iget v2, p1, Lcom/p1/mobile/android/app/Dialog$e;->l0:I

    .line 8
    .line 9
    invoke-direct {p0, v0, v1, v2}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    new-instance v0, Lv/VLinear_Foreground;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 17
    .line 18
    invoke-direct {v0, v1}, Lv/VLinear_Foreground;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->k:Lv/VLinear_Foreground;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->k:Lv/VLinear_Foreground;

    .line 28
    .line 29
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    const/4 v3, -0x1

    .line 32
    const/4 v4, -0x2

    .line 33
    invoke-direct {v2, v3, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->n(Lcom/p1/mobile/android/app/Dialog$e;)Ljava/lang/CharSequence;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->k:Lv/VLinear_Foreground;

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iput-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 52
    .line 53
    goto/16 :goto_1

    .line 54
    .line 55
    :cond_0
    sget v0, Ll/abc0;->b:I

    .line 56
    .line 57
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Lv/VLinear_Foreground;

    .line 61
    .line 62
    iget-object v2, p1, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 63
    .line 64
    invoke-direct {v0, v2}, Lv/VLinear_Foreground;-><init>(Landroid/content/Context;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 70
    .line 71
    .line 72
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 73
    .line 74
    invoke-direct {v2, v3, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    .line 79
    .line 80
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->k:Lv/VLinear_Foreground;

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 83
    .line 84
    .line 85
    new-instance v2, Lv/VText;

    .line 86
    .line 87
    iget-object v5, p1, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 88
    .line 89
    invoke-direct {v2, v5}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 90
    .line 91
    .line 92
    iput-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->x:Landroid/widget/TextView;

    .line 93
    .line 94
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 95
    .line 96
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 97
    .line 98
    .line 99
    sget v4, Lcom/p1/mobile/android/app/Dialog;->M:I

    .line 100
    .line 101
    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 102
    .line 103
    const/16 v4, 0x11

    .line 104
    .line 105
    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 106
    .line 107
    iget-object v5, p0, Lcom/p1/mobile/android/app/Dialog;->x:Landroid/widget/TextView;

    .line 108
    .line 109
    invoke-virtual {v5, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    .line 111
    .line 112
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->x:Landroid/widget/TextView;

    .line 113
    .line 114
    iget v5, p1, Lcom/p1/mobile/android/app/Dialog$e;->j:I

    .line 115
    .line 116
    int-to-float v5, v5

    .line 117
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 118
    .line 119
    .line 120
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->x:Landroid/widget/TextView;

    .line 121
    .line 122
    const/4 v5, 0x2

    .line 123
    invoke-static {v5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 128
    .line 129
    .line 130
    iget v2, p1, Lcom/p1/mobile/android/app/Dialog$e;->i:I

    .line 131
    .line 132
    iget-object v5, p0, Lcom/p1/mobile/android/app/Dialog;->x:Landroid/widget/TextView;

    .line 133
    .line 134
    if-eq v2, v3, :cond_1

    .line 135
    .line 136
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_1
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    sget v6, Ll/z8c0;->p:I

    .line 149
    .line 150
    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 155
    .line 156
    .line 157
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->x:Landroid/widget/TextView;

    .line 158
    .line 159
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->n(Lcom/p1/mobile/android/app/Dialog$e;)Ljava/lang/CharSequence;

    .line 160
    .line 161
    .line 162
    move-result-object v5

    .line 163
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->x:Landroid/widget/TextView;

    .line 167
    .line 168
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 169
    .line 170
    .line 171
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->j(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-eqz v2, :cond_2

    .line 176
    .line 177
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->x:Landroid/widget/TextView;

    .line 178
    .line 179
    new-instance v4, Ll/t0e;

    .line 180
    .line 181
    invoke-direct {v4, p0}, Ll/t0e;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    .line 186
    .line 187
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->x:Landroid/widget/TextView;

    .line 188
    .line 189
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 190
    .line 191
    .line 192
    :goto_1
    new-instance v0, Landroid/widget/LinearLayout;

    .line 193
    .line 194
    iget-object v2, p1, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 195
    .line 196
    invoke-direct {v0, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 197
    .line 198
    .line 199
    iput-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    .line 200
    .line 201
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    .line 205
    .line 206
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 207
    .line 208
    const/high16 v4, 0x3f800000    # 1.0f

    .line 209
    .line 210
    const/4 v5, 0x0

    .line 211
    invoke-direct {v2, v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 215
    .line 216
    .line 217
    iget-boolean v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->k0:Z

    .line 218
    .line 219
    if-eqz v0, :cond_3

    .line 220
    .line 221
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->J(Lcom/p1/mobile/android/app/Dialog$e;)V

    .line 222
    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->K(Lcom/p1/mobile/android/app/Dialog$e;)V

    .line 226
    .line 227
    .line 228
    :goto_2
    iget-object v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->R:Landroid/content/DialogInterface$OnShowListener;

    .line 229
    .line 230
    if-eqz v0, :cond_4

    .line 231
    .line 232
    invoke-virtual {p0, v0}, Ll/g1e;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 233
    .line 234
    .line 235
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->P:Landroid/content/DialogInterface$OnCancelListener;

    .line 236
    .line 237
    if-eqz v0, :cond_5

    .line 238
    .line 239
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 240
    .line 241
    .line 242
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->O:Landroid/content/DialogInterface$OnDismissListener;

    .line 243
    .line 244
    if-eqz v0, :cond_6

    .line 245
    .line 246
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 247
    .line 248
    .line 249
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->Q:Landroid/content/DialogInterface$OnKeyListener;

    .line 250
    .line 251
    if-eqz v0, :cond_7

    .line 252
    .line 253
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 254
    .line 255
    .line 256
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->k:Lv/VLinear_Foreground;

    .line 257
    .line 258
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    .line 259
    .line 260
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 261
    .line 262
    .line 263
    iget-boolean v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->F:Z

    .line 264
    .line 265
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 266
    .line 267
    .line 268
    iget-boolean v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->F:Z

    .line 269
    .line 270
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 271
    .line 272
    .line 273
    iget v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->V:I

    .line 274
    .line 275
    if-nez v0, :cond_8

    .line 276
    .line 277
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    sget v2, Ll/o8c0;->c:I

    .line 282
    .line 283
    invoke-static {v0, v2}, Lcom/p1/mobile/android/app/Dialog;->a0(Landroid/content/Context;I)I

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    iput v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->V:I

    .line 288
    .line 289
    goto :goto_3

    .line 290
    :cond_8
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 291
    .line 292
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 293
    .line 294
    .line 295
    :goto_3
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    sget v2, Ll/o8c0;->b:I

    .line 300
    .line 301
    invoke-static {v0, v2}, Lcom/p1/mobile/android/app/Dialog;->a0(Landroid/content/Context;I)I

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    iget v2, p1, Lcom/p1/mobile/android/app/Dialog$e;->u:I

    .line 306
    .line 307
    if-eqz v2, :cond_9

    .line 308
    .line 309
    move v3, v1

    .line 310
    goto :goto_4

    .line 311
    :cond_9
    move v3, v5

    .line 312
    :goto_4
    iput-boolean v3, p0, Lcom/p1/mobile/android/app/Dialog;->I:Z

    .line 313
    .line 314
    iget v3, p1, Lcom/p1/mobile/android/app/Dialog$e;->v:I

    .line 315
    .line 316
    if-eqz v3, :cond_a

    .line 317
    .line 318
    move v5, v1

    .line 319
    :cond_a
    iput-boolean v5, p0, Lcom/p1/mobile/android/app/Dialog;->J:Z

    .line 320
    .line 321
    if-eqz v0, :cond_e

    .line 322
    .line 323
    if-eqz v2, :cond_b

    .line 324
    .line 325
    goto :goto_5

    .line 326
    :cond_b
    move v2, v0

    .line 327
    :goto_5
    iput v2, p1, Lcom/p1/mobile/android/app/Dialog$e;->u:I

    .line 328
    .line 329
    if-eqz v3, :cond_c

    .line 330
    .line 331
    goto :goto_6

    .line 332
    :cond_c
    move v3, v0

    .line 333
    :goto_6
    iput v3, p1, Lcom/p1/mobile/android/app/Dialog$e;->v:I

    .line 334
    .line 335
    iget v2, p1, Lcom/p1/mobile/android/app/Dialog$e;->w:I

    .line 336
    .line 337
    if-eqz v2, :cond_d

    .line 338
    .line 339
    move v0, v2

    .line 340
    :cond_d
    iput v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->w:I

    .line 341
    .line 342
    :cond_e
    iget-boolean v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->T:Z

    .line 343
    .line 344
    if-nez v0, :cond_f

    .line 345
    .line 346
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->c(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 347
    .line 348
    .line 349
    move-result v0

    .line 350
    if-nez v0, :cond_f

    .line 351
    .line 352
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->b(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 353
    .line 354
    .line 355
    move-result p1

    .line 356
    if-eqz p1, :cond_10

    .line 357
    .line 358
    :cond_f
    iput-boolean v1, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 359
    .line 360
    :cond_10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->T()Z

    .line 361
    .line 362
    .line 363
    invoke-virtual {p0}, Ll/g1e;->y()V

    .line 364
    .line 365
    .line 366
    invoke-virtual {p0}, Ll/g1e;->x()V

    .line 367
    .line 368
    .line 369
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 370
    .line 371
    invoke-virtual {p0, p1}, Ll/g1e;->z(Landroid/view/View;)V

    .line 372
    .line 373
    .line 374
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->W(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic F()I
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/android/app/Dialog;->Q:I

    return v0
.end method

.method public static G(I)I
    .locals 1

    .line 1
    int-to-float p0, p0

    const v0, 0x3f666666    # 0.9f

    mul-float/2addr p0, v0

    float-to-int p0, p0

    return p0
.end method

.method public static H(IF)I
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    mul-float/2addr v0, p1

    .line 7
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p1, v0, v1, p0}, Landroid/graphics/Color;->argb(IIII)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public static Q(Lcom/p1/mobile/android/app/Dialog$e;)Landroid/view/ContextThemeWrapper;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/o8c0;->f:I

    .line 8
    .line 9
    filled-new-array {v1}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog$e;->E:Lcom/p1/mobile/android/app/Dialog$Theme;

    .line 18
    .line 19
    sget-object v2, Lcom/p1/mobile/android/app/Dialog$Theme;->DARK:Lcom/p1/mobile/android/app/Dialog$Theme;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    if-ne v1, v2, :cond_0

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v1, v3

    .line 27
    :goto_0
    if-nez v1, :cond_2

    .line 28
    .line 29
    :try_start_0
    invoke-virtual {v0, v3, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    sget-object v2, Lcom/p1/mobile/android/app/Dialog$Theme;->LIGHT:Lcom/p1/mobile/android/app/Dialog$Theme;

    .line 37
    .line 38
    :goto_1
    iput-object v2, p0, Lcom/p1/mobile/android/app/Dialog$e;->E:Lcom/p1/mobile/android/app/Dialog$Theme;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 41
    .line 42
    .line 43
    goto :goto_2

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 46
    .line 47
    .line 48
    throw p0

    .line 49
    :cond_2
    :goto_2
    new-instance v0, Landroid/view/ContextThemeWrapper;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    sget v1, Ll/tgc0;->e:I

    .line 56
    .line 57
    goto :goto_3

    .line 58
    :cond_3
    sget v1, Ll/tgc0;->f:I

    .line 59
    .line 60
    :goto_3
    invoke-direct {v0, p0, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 61
    .line 62
    .line 63
    return-object v0
.end method

.method public static R(I)I
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    const/16 v0, 0x11

    if-eq p0, v0, :cond_1

    const v0, 0x800005

    if-eq p0, v0, :cond_0

    const/4 p0, 0x5

    return p0

    :cond_0
    const/4 p0, 0x6

    return p0

    :cond_1
    const/4 p0, 0x4

    return p0
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a0(Landroid/content/Context;I)I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog;->b0(Landroid/content/Context;II)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static b0(Landroid/content/Context;II)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    filled-new-array {p1}, [I

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x0

    .line 14
    :try_start_0
    invoke-virtual {p0, p1, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 15
    .line 16
    .line 17
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 19
    .line 20
    .line 21
    return p1

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 24
    .line 25
    .line 26
    throw p1
.end method

.method public static c0(Landroid/content/Context;I)F
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog;->d0(Landroid/content/Context;IF)F

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static d0(Landroid/content/Context;IF)F
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    filled-new-array {p1}, [I

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x0

    .line 14
    :try_start_0
    invoke-virtual {p0, p1, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 15
    .line 16
    .line 17
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 19
    .line 20
    .line 21
    return p1

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 24
    .line 25
    .line 26
    throw p1
.end method

.method public static e0(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog;->f0(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static f0(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    filled-new-array {p1}, [I

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x0

    .line 14
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object p2, p1

    .line 24
    :goto_0
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 25
    .line 26
    .line 27
    return-object p2

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 30
    .line 31
    .line 32
    throw p1
.end method


# virtual methods
.method public I(Z)Lcom/p1/mobile/android/app/Dialog;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    iput-boolean p1, v0, Lcom/p1/mobile/android/app/Dialog$e;->J:Z

    .line 4
    .line 5
    return-object p0
.end method

.method public final J(Lcom/p1/mobile/android/app/Dialog$e;)V
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v6, p1

    .line 1
    iget-object v0, v6, Lcom/p1/mobile/android/app/Dialog$e;->b:Ljava/lang/CharSequence;

    const/4 v2, 0x1

    const/4 v7, 0x0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    move v8, v2

    goto :goto_0

    :cond_0
    move v8, v7

    .line 2
    :goto_0
    iget-object v0, v6, Lcom/p1/mobile/android/app/Dialog$e;->c:Ljava/lang/CharSequence;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    move v9, v2

    goto :goto_1

    :cond_1
    move v9, v7

    .line 3
    :goto_1
    iget-object v0, v6, Lcom/p1/mobile/android/app/Dialog$e;->m:Ljava/lang/CharSequence;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_2

    move v0, v2

    goto :goto_2

    :cond_2
    move v0, v7

    .line 4
    :goto_2
    iget-object v3, v6, Lcom/p1/mobile/android/app/Dialog$e;->t:Landroid/view/View;

    if-eqz v3, :cond_3

    move v3, v2

    goto :goto_3

    :cond_3
    move v3, v7

    .line 5
    :goto_3
    iget-object v4, v6, Lcom/p1/mobile/android/app/Dialog$e;->n:[Ljava/lang/CharSequence;

    if-eqz v4, :cond_4

    array-length v4, v4

    if-gtz v4, :cond_5

    :cond_4
    iget-object v4, v6, Lcom/p1/mobile/android/app/Dialog$e;->N:Landroid/widget/ListAdapter;

    if-eqz v4, :cond_6

    :cond_5
    move v4, v2

    goto :goto_4

    :cond_6
    move v4, v7

    .line 6
    :goto_4
    iget-object v5, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    invoke-static {v5}, Lcom/p1/mobile/android/app/Dialog$e;->l(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v5

    const/4 v10, -0x1

    if-eq v5, v10, :cond_7

    .line 7
    iget-object v5, v1, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    iget-object v11, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    invoke-static {v11}, Lcom/p1/mobile/android/app/Dialog$e;->l(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v11

    invoke-virtual {v5, v7, v11, v7, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 8
    :cond_7
    iget-object v5, v6, Lcom/p1/mobile/android/app/Dialog$e;->K:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_9

    .line 9
    new-instance v5, Landroid/widget/ImageView;

    iget-object v11, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v11, v11, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v5, v11}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 10
    iput-object v5, v1, Lcom/p1/mobile/android/app/Dialog;->n:Landroid/view/View;

    .line 11
    iget-object v11, v6, Lcom/p1/mobile/android/app/Dialog$e;->K:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 12
    iget-object v11, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v11, v11, Lcom/p1/mobile/android/app/Dialog$e;->f0:Landroid/widget/ImageView$ScaleType;

    if-nez v11, :cond_8

    .line 13
    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_5

    .line 14
    :cond_8
    invoke-virtual {v5, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 15
    :cond_9
    :goto_5
    iget-object v5, v6, Lcom/p1/mobile/android/app/Dialog$e;->M:Landroid/view/View;

    if-eqz v5, :cond_a

    .line 16
    iput-object v5, v1, Lcom/p1/mobile/android/app/Dialog;->n:Landroid/view/View;

    .line 17
    :cond_a
    iget-object v5, v1, Lcom/p1/mobile/android/app/Dialog;->n:Landroid/view/View;

    const/4 v11, -0x2

    if-eqz v5, :cond_c

    .line 18
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v12, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget v12, v12, Lcom/p1/mobile/android/app/Dialog$e;->e0:I

    invoke-direct {v5, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 19
    iget v12, v6, Lcom/p1/mobile/android/app/Dialog$e;->L:I

    if-ne v12, v10, :cond_b

    .line 20
    sget v12, Lcom/p1/mobile/android/app/Dialog;->P:I

    iput v12, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    goto :goto_6

    .line 21
    :cond_b
    iput v12, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 22
    :goto_6
    iput v2, v5, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 23
    iget-object v12, v1, Lcom/p1/mobile/android/app/Dialog;->n:Landroid/view/View;

    sget v13, Lcom/p1/mobile/android/app/Dialog;->V:I

    invoke-virtual {v12, v13}, Landroid/view/View;->setMinimumHeight(I)V

    .line 24
    iget-object v12, v1, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    iget-object v13, v1, Lcom/p1/mobile/android/app/Dialog;->n:Landroid/view/View;

    invoke-virtual {v12, v13, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_c
    if-nez v8, :cond_d

    if-nez v9, :cond_d

    if-eqz v0, :cond_1c

    :cond_d
    if-eqz v3, :cond_e

    .line 25
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog$e;->i(Lcom/p1/mobile/android/app/Dialog$e;)Z

    move-result v5

    if-eqz v5, :cond_f

    :cond_e
    if-nez v4, :cond_f

    .line 26
    iget-object v5, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    invoke-static {v5}, Lcom/p1/mobile/android/app/Dialog$e;->h(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v5

    goto :goto_7

    :cond_f
    move v5, v7

    .line 27
    :goto_7
    new-instance v12, Landroid/widget/LinearLayout;

    iget-object v13, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v13, v13, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v12, v13}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 28
    invoke-virtual {v12, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 29
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v2, v10, v7, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 30
    sget v13, Lcom/p1/mobile/android/app/Dialog;->O:I

    .line 31
    invoke-static {}, Ll/bnl0;->w0()I

    move-result v14

    const/16 v15, 0x3c0

    if-ge v14, v15, :cond_10

    sget v14, Lcom/p1/mobile/android/app/Dialog;->L:I

    goto :goto_8

    :cond_10
    sget v14, Lcom/p1/mobile/android/app/Dialog;->P:I

    .line 32
    :goto_8
    invoke-virtual {v2, v13, v14, v13, v5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 33
    invoke-virtual {v12, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v2, 0x2

    const/16 v5, 0x11

    if-eqz v8, :cond_12

    .line 34
    new-instance v13, Lv/VText;

    iget-object v14, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v14, v14, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v13, v14}, Lv/VText;-><init>(Landroid/content/Context;)V

    iput-object v13, v1, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    .line 35
    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v13, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 36
    iput v5, v13, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 37
    iget-object v14, v1, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    invoke-virtual {v14, v13}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    iget-object v13, v1, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    const/high16 v14, 0x41a00000    # 20.0f

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTextSize(F)V

    .line 39
    iget-object v13, v1, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 40
    iget v13, v6, Lcom/p1/mobile/android/app/Dialog$e;->h:I

    if-eq v13, v10, :cond_11

    .line 41
    iget-object v14, v1, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    invoke-virtual {v14, v13}, Landroid/widget/TextView;->setTextColor(I)V

    move/from16 v16, v2

    goto :goto_9

    .line 42
    :cond_11
    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    sget v14, Ll/z8c0;->m:I

    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getColor(I)I

    move-result v13

    .line 43
    iget-object v14, v1, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v15

    move/from16 v16, v2

    sget v2, Ll/o8c0;->j:I

    invoke-static {v15, v2, v13}, Lcom/p1/mobile/android/app/Dialog;->b0(Landroid/content/Context;II)I

    move-result v2

    invoke-virtual {v14, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    :goto_9
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    iget-object v13, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v13, v13, Lcom/p1/mobile/android/app/Dialog$e;->b:Ljava/lang/CharSequence;

    invoke-virtual {v2, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 46
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    invoke-virtual {v12, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_a

    :cond_12
    move/from16 v16, v2

    :goto_a
    const/high16 v2, 0x41600000    # 14.0f

    const/16 v13, 0x10

    if-eqz v9, :cond_15

    .line 47
    new-instance v14, Lv/VText;

    iget-object v15, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v15, v15, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v14, v15}, Lv/VText;-><init>(Landroid/content/Context;)V

    iput-object v14, v1, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    .line 48
    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v14, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 49
    iput v13, v14, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    if-eqz v8, :cond_13

    .line 50
    sget v15, Lcom/p1/mobile/android/app/Dialog;->M:I

    goto :goto_b

    :cond_13
    move v15, v7

    :goto_b
    invoke-virtual {v14, v7, v15, v7, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 51
    iget-object v15, v1, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-virtual {v15, v14}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    iget-object v14, v1, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-virtual {v14, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 53
    iget-object v14, v1, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-static/range {v16 .. v16}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 54
    iget v14, v6, Lcom/p1/mobile/android/app/Dialog$e;->k:I

    if-eq v14, v10, :cond_14

    .line 55
    iget-object v15, v1, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-virtual {v15, v14}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_c

    .line 56
    :cond_14
    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    sget v15, Ll/z8c0;->n:I

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getColor(I)I

    move-result v14

    .line 57
    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v15

    sget v2, Ll/o8c0;->i:I

    invoke-static {v15, v2, v14}, Lcom/p1/mobile/android/app/Dialog;->b0(Landroid/content/Context;II)I

    move-result v2

    .line 58
    iget-object v14, v1, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-virtual {v14, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    :goto_c
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 60
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    iget-object v5, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v5, v5, Lcom/p1/mobile/android/app/Dialog$e;->c:Ljava/lang/CharSequence;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-virtual {v12, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_15
    if-eqz v0, :cond_1b

    .line 62
    new-instance v0, Lv/VText;

    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v2, v2, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v0, v2}, Lv/VText;-><init>(Landroid/content/Context;)V

    iput-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    .line 63
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 64
    iput v13, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    if-nez v8, :cond_17

    if-eqz v9, :cond_16

    goto :goto_d

    :cond_16
    move v2, v7

    goto :goto_e

    .line 65
    :cond_17
    :goto_d
    sget v2, Lcom/p1/mobile/android/app/Dialog;->M:I

    :goto_e
    invoke-virtual {v0, v7, v2, v7, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 66
    iget-boolean v2, v6, Lcom/p1/mobile/android/app/Dialog$e;->g0:Z

    if-eqz v2, :cond_18

    .line 67
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 68
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v13, Ll/z8c0;->E:I

    invoke-virtual {v5, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 69
    :cond_18
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-static/range {v16 .. v16}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 71
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget v2, v2, Lcom/p1/mobile/android/app/Dialog$e;->c0:F

    const/4 v5, 0x0

    cmpl-float v5, v2, v5

    if-lez v5, :cond_19

    goto :goto_f

    :cond_19
    const/high16 v2, 0x41600000    # 14.0f

    :goto_f
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 72
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v2, v2, Lcom/p1/mobile/android/app/Dialog$e;->m:Ljava/lang/CharSequence;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    iget v0, v6, Lcom/p1/mobile/android/app/Dialog$e;->l:I

    if-eq v0, v10, :cond_1a

    .line 74
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_10

    .line 75
    :cond_1a
    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Ll/z8c0;->n:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 76
    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v5, Ll/o8c0;->e:I

    invoke-static {v2, v5, v0}, Lcom/p1/mobile/android/app/Dialog;->b0(Landroid/content/Context;II)I

    move-result v0

    .line 77
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    :goto_10
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    iget v2, v6, Lcom/p1/mobile/android/app/Dialog$e;->g:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 79
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    iget v2, v6, Lcom/p1/mobile/android/app/Dialog$e;->g:I

    invoke-static {v2}, Lcom/p1/mobile/android/app/Dialog;->R(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setTextAlignment(I)V

    .line 80
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-virtual {v12, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 81
    :cond_1b
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_1c
    if-eqz v3, :cond_22

    .line 82
    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v2, v2, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->s:Landroid/widget/FrameLayout;

    .line 83
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 84
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog$e;->e(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v2

    if-ne v2, v10, :cond_1d

    move v2, v7

    goto :goto_11

    :cond_1d
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog$e;->e(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v2

    .line 85
    :goto_11
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog$e;->g(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v3

    if-ne v3, v10, :cond_1e

    move v3, v7

    goto :goto_12

    :cond_1e
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog$e;->g(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v3

    .line 86
    :goto_12
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog$e;->f(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v5

    if-ne v5, v10, :cond_1f

    move v5, v7

    goto :goto_13

    :cond_1f
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog$e;->f(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v5

    .line 87
    :goto_13
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog$e;->d(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v12

    if-ne v12, v10, :cond_20

    move v12, v7

    goto :goto_14

    :cond_20
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog$e;->d(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v12

    .line 88
    :goto_14
    invoke-virtual {v0, v2, v3, v5, v12}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 89
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->s:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->s:Landroid/widget/FrameLayout;

    iget-object v2, v6, Lcom/p1/mobile/android/app/Dialog$e;->t:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 91
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog$e;->i(Lcom/p1/mobile/android/app/Dialog$e;)Z

    move-result v0

    .line 92
    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_21

    .line 93
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->s:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v0, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    goto :goto_15

    .line 94
    :cond_21
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->s:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_22
    :goto_15
    if-eqz v4, :cond_2a

    .line 95
    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v2, v2, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->v:Landroid/widget/FrameLayout;

    .line 96
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 97
    new-instance v0, Lv/VList_ScrollableHeight;

    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v2, v2, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v0, v2}, Lv/VList_ScrollableHeight;-><init>(Landroid/content/Context;)V

    iput-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    .line 98
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v10, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 100
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    invoke-virtual {v0, v7}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 101
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    const/16 v2, 0x3e8

    invoke-virtual {v0, v2}, Landroid/view/View;->setScrollBarDefaultDelayBeforeFade(I)V

    .line 102
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    const/high16 v2, 0x2000000

    invoke-virtual {v0, v2}, Landroid/view/View;->setScrollBarStyle(I)V

    .line 103
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    invoke-static {v2}, Lcom/p1/mobile/android/app/Dialog$e;->k(Lcom/p1/mobile/android/app/Dialog$e;)Z

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/AbsListView;->setFastScrollEnabled(Z)V

    .line 104
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Ll/o8c0;->h:I

    invoke-static {v2, v3}, Lcom/p1/mobile/android/app/Dialog;->e0(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/AbsListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 105
    iget v0, v6, Lcom/p1/mobile/android/app/Dialog$e;->W:I

    if-eqz v0, :cond_23

    .line 106
    iput v0, v1, Lcom/p1/mobile/android/app/Dialog;->F:I

    goto :goto_16

    .line 107
    :cond_23
    iget-object v0, v6, Lcom/p1/mobile/android/app/Dialog$e;->E:Lcom/p1/mobile/android/app/Dialog$Theme;

    sget-object v2, Lcom/p1/mobile/android/app/Dialog$Theme;->LIGHT:Lcom/p1/mobile/android/app/Dialog$Theme;

    if-ne v0, v2, :cond_24

    const/high16 v0, -0x1000000

    .line 108
    iput v0, v1, Lcom/p1/mobile/android/app/Dialog;->F:I

    goto :goto_16

    .line 109
    :cond_24
    iput v10, v1, Lcom/p1/mobile/android/app/Dialog;->F:I

    .line 110
    :goto_16
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v2, v0, Lcom/p1/mobile/android/app/Dialog$e;->N:Landroid/widget/ListAdapter;

    if-nez v2, :cond_26

    .line 111
    iget-object v2, v0, Lcom/p1/mobile/android/app/Dialog$e;->B:Lcom/p1/mobile/android/app/Dialog$g;

    if-eqz v2, :cond_25

    .line 112
    sget-object v0, Lcom/p1/mobile/android/app/Dialog$ListType;->SINGLE:Lcom/p1/mobile/android/app/Dialog$ListType;

    iput-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->G:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 113
    iget-boolean v0, v6, Lcom/p1/mobile/android/app/Dialog$e;->D:Z

    iput-boolean v0, v1, Lcom/p1/mobile/android/app/Dialog;->E:Z

    goto :goto_17

    .line 114
    :cond_25
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 115
    sget-object v0, Lcom/p1/mobile/android/app/Dialog$ListType;->REGULAR:Lcom/p1/mobile/android/app/Dialog$ListType;

    iput-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->G:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 116
    :goto_17
    iget-object v10, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    new-instance v0, Lcom/p1/mobile/android/app/Dialog$h;

    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v2, v2, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    iget-object v3, v1, Lcom/p1/mobile/android/app/Dialog;->G:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 117
    invoke-static {v3}, Lcom/p1/mobile/android/app/Dialog$ListType;->getLayoutForType(Lcom/p1/mobile/android/app/Dialog$ListType;)I

    move-result v3

    sget v4, Ll/vcc0;->R0:I

    iget-object v5, v1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v5, v5, Lcom/p1/mobile/android/app/Dialog$e;->n:[Ljava/lang/CharSequence;

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/android/app/Dialog$h;-><init>(Lcom/p1/mobile/android/app/Dialog;Landroid/content/Context;II[Ljava/lang/CharSequence;)V

    iput-object v0, v10, Lcom/p1/mobile/android/app/Dialog$e;->N:Landroid/widget/ListAdapter;

    .line 118
    :cond_26
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->v:Landroid/widget/FrameLayout;

    if-nez v8, :cond_28

    if-nez v9, :cond_28

    .line 119
    iget-object v2, v6, Lcom/p1/mobile/android/app/Dialog$e;->m:Ljava/lang/CharSequence;

    if-nez v2, :cond_28

    iget-object v2, v6, Lcom/p1/mobile/android/app/Dialog$e;->t:Landroid/view/View;

    if-eqz v2, :cond_27

    goto :goto_18

    :cond_27
    sget v2, Lcom/p1/mobile/android/app/Dialog;->L:I

    goto :goto_19

    :cond_28
    :goto_18
    move v2, v7

    .line 120
    :goto_19
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog;->S()Z

    move-result v3

    if-nez v3, :cond_29

    sget v3, Lcom/p1/mobile/android/app/Dialog;->L:I

    goto :goto_1a

    :cond_29
    move v3, v7

    .line 121
    :goto_1a
    invoke-virtual {v0, v7, v2, v7, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 122
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->v:Landroid/widget/FrameLayout;

    iget-object v2, v1, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 123
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    iget-object v1, v1, Lcom/p1/mobile/android/app/Dialog;->v:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_2a
    return-void
.end method

.method public final K(Lcom/p1/mobile/android/app/Dialog$e;)V
    .locals 13

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/android/app/Dialog$e;->b:Ljava/lang/CharSequence;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 2
    :goto_0
    iget-object v3, p1, Lcom/p1/mobile/android/app/Dialog$e;->c:Ljava/lang/CharSequence;

    if-eqz v3, :cond_1

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    const/16 v4, 0x10

    const/4 v5, -0x2

    const/4 v6, -0x1

    if-eqz v0, :cond_9

    .line 3
    new-instance v7, Landroid/widget/LinearLayout;

    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v8, v8, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->r:Landroid/widget/LinearLayout;

    .line 4
    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-boolean v8, v8, Lcom/p1/mobile/android/app/Dialog$e;->d0:Z

    .line 5
    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 6
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->r:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 7
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->r:Landroid/widget/LinearLayout;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 8
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->r:Landroid/widget/LinearLayout;

    sget v8, Lcom/p1/mobile/android/app/Dialog;->O:I

    .line 9
    iget-object v9, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    invoke-static {v9}, Lcom/p1/mobile/android/app/Dialog$e;->l(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v9

    if-ne v9, v6, :cond_2

    move v9, v8

    goto :goto_2

    :cond_2
    iget-object v9, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    invoke-static {v9}, Lcom/p1/mobile/android/app/Dialog$e;->l(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v9

    :goto_2
    sget v10, Lcom/p1/mobile/android/app/Dialog;->N:I

    .line 10
    invoke-virtual {v7, v8, v9, v8, v10}, Landroid/view/View;->setPadding(IIII)V

    .line 11
    iget-object v7, p1, Lcom/p1/mobile/android/app/Dialog$e;->K:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_3

    .line 12
    new-instance v7, Landroid/widget/ImageView;

    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v8, v8, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 13
    iput-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->n:Landroid/view/View;

    .line 14
    iget-object v8, p1, Lcom/p1/mobile/android/app/Dialog$e;->K:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 15
    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-boolean v8, v8, Lcom/p1/mobile/android/app/Dialog$e;->d0:Z

    if-nez v8, :cond_3

    sget-object v8, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 16
    :cond_3
    iget-object v7, p1, Lcom/p1/mobile/android/app/Dialog$e;->M:Landroid/view/View;

    if-eqz v7, :cond_4

    .line 17
    iput-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->n:Landroid/view/View;

    .line 18
    :cond_4
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->n:Landroid/view/View;

    if-eqz v7, :cond_6

    .line 19
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 20
    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-boolean v8, v8, Lcom/p1/mobile/android/app/Dialog$e;->d0:Z

    if-nez v8, :cond_5

    .line 21
    invoke-virtual {v7, v2, v2, v10, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    goto :goto_3

    .line 22
    :cond_5
    invoke-virtual {v7, v10, v10, v10, v10}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 23
    iput v1, v7, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 24
    :goto_3
    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->n:Landroid/view/View;

    invoke-virtual {v8, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->r:Landroid/widget/LinearLayout;

    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->n:Landroid/view/View;

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 26
    :cond_6
    new-instance v7, Lv/VText;

    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v8, v8, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v7, v8}, Lv/VText;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    .line 27
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 28
    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-boolean v8, v8, Lcom/p1/mobile/android/app/Dialog$e;->d0:Z

    if-eqz v8, :cond_7

    .line 29
    iput v4, v7, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 30
    :cond_7
    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    invoke-virtual {v8, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    const/high16 v8, 0x41900000    # 18.0f

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 32
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    const/4 v8, 0x3

    invoke-static {v8}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    move-result-object v8

    invoke-virtual {v7, v8, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v7, v7, Lcom/p1/mobile/android/app/Dialog$e;->b:Ljava/lang/CharSequence;

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    iget v1, p1, Lcom/p1/mobile/android/app/Dialog$e;->h:I

    if-eq v1, v6, :cond_8

    .line 35
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_4

    .line 36
    :cond_8
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v7, 0x1010036

    invoke-static {v1, v7}, Lcom/p1/mobile/android/app/Dialog;->a0(Landroid/content/Context;I)I

    move-result v1

    .line 37
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v8

    sget v9, Ll/o8c0;->j:I

    invoke-static {v8, v9, v1}, Lcom/p1/mobile/android/app/Dialog;->b0(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    :goto_4
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    iget v7, p1, Lcom/p1/mobile/android/app/Dialog$e;->d:I

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    iget v7, p1, Lcom/p1/mobile/android/app/Dialog$e;->d:I

    invoke-static {v7}, Lcom/p1/mobile/android/app/Dialog;->R(I)I

    move-result v7

    invoke-virtual {v1, v7}, Landroid/view/View;->setTextAlignment(I)V

    .line 40
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->r:Landroid/widget/LinearLayout;

    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 41
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->r:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_9
    const v1, 0x1010038

    const/4 v7, 0x2

    const/high16 v8, 0x41600000    # 14.0f

    if-eqz v3, :cond_d

    .line 42
    new-instance v9, Lv/VText;

    iget-object v10, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v10, v10, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v9, v10}, Lv/VText;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    .line 43
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 44
    iget-object v10, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-boolean v10, v10, Lcom/p1/mobile/android/app/Dialog$e;->d0:Z

    if-eqz v10, :cond_a

    .line 45
    iput v4, v9, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    :cond_a
    if-eqz v0, :cond_b

    move v4, v2

    goto :goto_5

    .line 46
    :cond_b
    sget v4, Lcom/p1/mobile/android/app/Dialog;->O:I

    :goto_5
    sget v10, Lcom/p1/mobile/android/app/Dialog;->N:I

    invoke-virtual {v9, v2, v4, v2, v10}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 47
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-virtual {v4, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 48
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 49
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-static {v7}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    move-result-object v9

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 50
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    iget-object v9, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v9, v9, Lcom/p1/mobile/android/app/Dialog$e;->c:Ljava/lang/CharSequence;

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    sget v9, Lcom/p1/mobile/android/app/Dialog;->O:I

    invoke-virtual {v4, v9, v2, v9, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 52
    iget v4, p1, Lcom/p1/mobile/android/app/Dialog$e;->k:I

    if-eq v4, v6, :cond_c

    .line 53
    iget-object v9, p0, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-virtual {v9, v4}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_6

    .line 54
    :cond_c
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v1}, Lcom/p1/mobile/android/app/Dialog;->a0(Landroid/content/Context;I)I

    move-result v4

    .line 55
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v9

    sget v10, Ll/o8c0;->i:I

    invoke-static {v9, v10, v4}, Lcom/p1/mobile/android/app/Dialog;->b0(Landroid/content/Context;II)I

    move-result v4

    .line 56
    iget-object v9, p0, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-virtual {v9, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    :goto_6
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    iget v9, p1, Lcom/p1/mobile/android/app/Dialog$e;->e:I

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setGravity(I)V

    .line 58
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    iget v9, p1, Lcom/p1/mobile/android/app/Dialog$e;->d:I

    invoke-static {v9}, Lcom/p1/mobile/android/app/Dialog;->R(I)I

    move-result v9

    invoke-virtual {v4, v9}, Landroid/view/View;->setTextAlignment(I)V

    .line 59
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    iget-object v9, p0, Lcom/p1/mobile/android/app/Dialog;->p:Landroid/widget/TextView;

    invoke-virtual {v4, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 60
    :cond_d
    iget-object v4, p1, Lcom/p1/mobile/android/app/Dialog$e;->m:Ljava/lang/CharSequence;

    if-eqz v4, :cond_13

    .line 61
    new-instance v4, Landroid/widget/FrameLayout;

    iget-object v9, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v9, v9, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v4, v9}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->t:Landroid/widget/FrameLayout;

    .line 62
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->t:Landroid/widget/FrameLayout;

    sget v9, Lcom/p1/mobile/android/app/Dialog;->O:I

    sget v10, Lcom/p1/mobile/android/app/Dialog;->N:I

    invoke-virtual {v4, v9, v2, v9, v10}, Landroid/view/View;->setPadding(IIII)V

    .line 64
    new-instance v4, Lv/VText;

    iget-object v11, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v11, v11, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v4, v11}, Lv/VText;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    .line 65
    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v11, v6, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    iget-boolean v4, p1, Lcom/p1/mobile/android/app/Dialog$e;->g0:Z

    if-eqz v4, :cond_e

    .line 67
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v11

    invoke-virtual {v4, v11}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 68
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    sget v12, Ll/z8c0;->E:I

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v4, v11}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 69
    :cond_e
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-static {v7}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 70
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget v7, v7, Lcom/p1/mobile/android/app/Dialog$e;->c0:F

    const/4 v11, 0x0

    cmpl-float v11, v7, v11

    if-lez v11, :cond_f

    move v8, v7

    :cond_f
    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 71
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v7, v7, Lcom/p1/mobile/android/app/Dialog$e;->m:Ljava/lang/CharSequence;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    iget v4, p1, Lcom/p1/mobile/android/app/Dialog$e;->l:I

    if-eq v4, v6, :cond_10

    .line 73
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_7

    .line 74
    :cond_10
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v1}, Lcom/p1/mobile/android/app/Dialog;->a0(Landroid/content/Context;I)I

    move-result v1

    .line 75
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v7, Ll/o8c0;->e:I

    invoke-static {v4, v7, v1}, Lcom/p1/mobile/android/app/Dialog;->b0(Landroid/content/Context;II)I

    move-result v1

    .line 76
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :goto_7
    if-nez v0, :cond_12

    if-eqz v3, :cond_11

    goto :goto_8

    .line 77
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->t:Landroid/widget/FrameLayout;

    sget v4, Lcom/p1/mobile/android/app/Dialog;->U:I

    invoke-virtual {v1, v4}, Landroid/view/View;->setMinimumHeight(I)V

    .line 78
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->t:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v9, v9, v9, v10}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_9

    .line 79
    :cond_12
    :goto_8
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    iget v4, p1, Lcom/p1/mobile/android/app/Dialog$e;->f:I

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 80
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    iget v4, p1, Lcom/p1/mobile/android/app/Dialog$e;->f:I

    invoke-static {v4}, Lcom/p1/mobile/android/app/Dialog;->R(I)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/view/View;->setTextAlignment(I)V

    .line 81
    :goto_9
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->t:Landroid/widget/FrameLayout;

    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->q:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 82
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->t:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 83
    :cond_13
    iget-object v1, p1, Lcom/p1/mobile/android/app/Dialog$e;->t:Landroid/view/View;

    if-eqz v1, :cond_19

    .line 84
    new-instance v1, Landroid/widget/FrameLayout;

    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v4, v4, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v1, v4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->s:Landroid/widget/FrameLayout;

    .line 85
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 86
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->e(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v4

    if-ne v4, v6, :cond_14

    move v4, v2

    goto :goto_a

    :cond_14
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->e(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v4

    .line 87
    :goto_a
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->g(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v7

    if-ne v7, v6, :cond_15

    move v7, v2

    goto :goto_b

    :cond_15
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->g(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v7

    .line 88
    :goto_b
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->f(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v8

    if-ne v8, v6, :cond_16

    move v8, v2

    goto :goto_c

    :cond_16
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->f(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v8

    .line 89
    :goto_c
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->d(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v9

    if-ne v9, v6, :cond_17

    move v9, v2

    goto :goto_d

    :cond_17
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->d(Lcom/p1/mobile/android/app/Dialog$e;)I

    move-result v9

    .line 90
    :goto_d
    invoke-virtual {v1, v4, v7, v8, v9}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 91
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->s:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->s:Landroid/widget/FrameLayout;

    iget-object v4, p1, Lcom/p1/mobile/android/app/Dialog$e;->t:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 93
    invoke-static {p1}, Lcom/p1/mobile/android/app/Dialog$e;->i(Lcom/p1/mobile/android/app/Dialog$e;)Z

    move-result v1

    .line 94
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    if-eqz v1, :cond_18

    .line 95
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->s:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    goto :goto_e

    .line 96
    :cond_18
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->s:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 97
    :cond_19
    :goto_e
    iget-object v1, p1, Lcom/p1/mobile/android/app/Dialog$e;->n:[Ljava/lang/CharSequence;

    if-eqz v1, :cond_1a

    array-length v1, v1

    if-gtz v1, :cond_1b

    :cond_1a
    iget-object v1, p1, Lcom/p1/mobile/android/app/Dialog$e;->N:Landroid/widget/ListAdapter;

    if-eqz v1, :cond_23

    .line 98
    :cond_1b
    new-instance v1, Landroid/widget/FrameLayout;

    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v4, v4, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v1, v4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->v:Landroid/widget/FrameLayout;

    .line 99
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    new-instance v1, Lv/VList_ScrollableHeight;

    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v4, v4, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    invoke-direct {v1, v4}, Lv/VList_ScrollableHeight;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    .line 101
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v6, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 103
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 104
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    const/16 v4, 0x3e8

    invoke-virtual {v1, v4}, Landroid/view/View;->setScrollBarDefaultDelayBeforeFade(I)V

    .line 105
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    const/high16 v4, 0x2000000

    invoke-virtual {v1, v4}, Landroid/view/View;->setScrollBarStyle(I)V

    .line 106
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    invoke-static {v4}, Lcom/p1/mobile/android/app/Dialog$e;->k(Lcom/p1/mobile/android/app/Dialog$e;)Z

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/AbsListView;->setFastScrollEnabled(Z)V

    .line 107
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Ll/o8c0;->h:I

    invoke-static {v4, v5}, Lcom/p1/mobile/android/app/Dialog;->e0(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/AbsListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 108
    iget v1, p1, Lcom/p1/mobile/android/app/Dialog$e;->W:I

    if-eqz v1, :cond_1c

    .line 109
    iput v1, p0, Lcom/p1/mobile/android/app/Dialog;->F:I

    goto :goto_f

    .line 110
    :cond_1c
    iget-object v1, p1, Lcom/p1/mobile/android/app/Dialog$e;->E:Lcom/p1/mobile/android/app/Dialog$Theme;

    sget-object v4, Lcom/p1/mobile/android/app/Dialog$Theme;->LIGHT:Lcom/p1/mobile/android/app/Dialog$Theme;

    if-ne v1, v4, :cond_1d

    const/high16 v1, -0x1000000

    .line 111
    iput v1, p0, Lcom/p1/mobile/android/app/Dialog;->F:I

    goto :goto_f

    .line 112
    :cond_1d
    iput v6, p0, Lcom/p1/mobile/android/app/Dialog;->F:I

    .line 113
    :goto_f
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v4, v1, Lcom/p1/mobile/android/app/Dialog$e;->N:Landroid/widget/ListAdapter;

    if-nez v4, :cond_1f

    .line 114
    iget-object v4, v1, Lcom/p1/mobile/android/app/Dialog$e;->B:Lcom/p1/mobile/android/app/Dialog$g;

    if-eqz v4, :cond_1e

    .line 115
    sget-object v1, Lcom/p1/mobile/android/app/Dialog$ListType;->SINGLE:Lcom/p1/mobile/android/app/Dialog$ListType;

    iput-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->G:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 116
    iget-boolean v1, p1, Lcom/p1/mobile/android/app/Dialog$e;->D:Z

    iput-boolean v1, p0, Lcom/p1/mobile/android/app/Dialog;->E:Z

    goto :goto_10

    .line 117
    :cond_1e
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 118
    sget-object v1, Lcom/p1/mobile/android/app/Dialog$ListType;->REGULAR:Lcom/p1/mobile/android/app/Dialog$ListType;

    iput-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->G:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 119
    :goto_10
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    new-instance v4, Lcom/p1/mobile/android/app/Dialog$h;

    iget-object v5, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v6, v5, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    iget-object v5, p0, Lcom/p1/mobile/android/app/Dialog;->G:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 120
    invoke-static {v5}, Lcom/p1/mobile/android/app/Dialog$ListType;->getLayoutForType(Lcom/p1/mobile/android/app/Dialog$ListType;)I

    move-result v7

    sget v8, Ll/vcc0;->R0:I

    iget-object v5, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    iget-object v9, v5, Lcom/p1/mobile/android/app/Dialog$e;->n:[Ljava/lang/CharSequence;

    move-object v5, p0

    invoke-direct/range {v4 .. v9}, Lcom/p1/mobile/android/app/Dialog$h;-><init>(Lcom/p1/mobile/android/app/Dialog;Landroid/content/Context;II[Ljava/lang/CharSequence;)V

    iput-object v4, v1, Lcom/p1/mobile/android/app/Dialog$e;->N:Landroid/widget/ListAdapter;

    goto :goto_11

    :cond_1f
    move-object v5, p0

    .line 121
    :goto_11
    iget-object p0, v5, Lcom/p1/mobile/android/app/Dialog;->v:Landroid/widget/FrameLayout;

    if-nez v0, :cond_21

    if-nez v3, :cond_21

    .line 122
    iget-object v1, p1, Lcom/p1/mobile/android/app/Dialog$e;->m:Ljava/lang/CharSequence;

    if-nez v1, :cond_21

    iget-object v1, p1, Lcom/p1/mobile/android/app/Dialog$e;->t:Landroid/view/View;

    if-eqz v1, :cond_20

    goto :goto_12

    :cond_20
    sget v1, Lcom/p1/mobile/android/app/Dialog;->L:I

    goto :goto_13

    :cond_21
    :goto_12
    move v1, v2

    .line 123
    :goto_13
    invoke-virtual {v5}, Lcom/p1/mobile/android/app/Dialog;->S()Z

    move-result v4

    if-nez v4, :cond_22

    sget v4, Lcom/p1/mobile/android/app/Dialog;->L:I

    goto :goto_14

    :cond_22
    move v4, v2

    .line 124
    :goto_14
    invoke-virtual {p0, v2, v1, v2, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 125
    iget-object p0, v5, Lcom/p1/mobile/android/app/Dialog;->v:Landroid/widget/FrameLayout;

    iget-object v1, v5, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 126
    iget-object p0, v5, Lcom/p1/mobile/android/app/Dialog;->u:Landroid/widget/LinearLayout;

    iget-object v1, v5, Lcom/p1/mobile/android/app/Dialog;->v:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_15

    :cond_23
    move-object v5, p0

    :goto_15
    if-eqz v0, :cond_25

    if-nez v3, :cond_25

    .line 127
    iget-object p0, p1, Lcom/p1/mobile/android/app/Dialog$e;->m:Ljava/lang/CharSequence;

    if-nez p0, :cond_25

    iget-object p0, p1, Lcom/p1/mobile/android/app/Dialog$e;->t:Landroid/view/View;

    if-nez p0, :cond_25

    iget-object p0, p1, Lcom/p1/mobile/android/app/Dialog$e;->n:[Ljava/lang/CharSequence;

    if-eqz p0, :cond_24

    array-length p0, p0

    if-nez p0, :cond_25

    :cond_24
    iget-object p0, p1, Lcom/p1/mobile/android/app/Dialog$e;->N:Landroid/widget/ListAdapter;

    if-nez p0, :cond_25

    .line 128
    iget-object p0, v5, Lcom/p1/mobile/android/app/Dialog;->r:Landroid/widget/LinearLayout;

    sget p1, Lcom/p1/mobile/android/app/Dialog;->U:I

    invoke-virtual {p0, p1}, Landroid/view/View;->setMinimumHeight(I)V

    :cond_25
    return-void
.end method

.method public final L()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Ll/bac0;->o:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    float-to-int v1, v1

    .line 28
    mul-int/lit8 v1, v1, 0x2

    .line 29
    .line 30
    sub-int/2addr v0, v1

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->Y()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    div-int/2addr v0, p0

    .line 36
    return v0
.end method

.method public final M()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->Y()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    if-gt v1, v2, :cond_0

    .line 9
    .line 10
    goto :goto_3

    .line 11
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    iget-boolean v1, v1, Lcom/p1/mobile/android/app/Dialog$e;->T:Z

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-boolean v1, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iput-boolean v2, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->T()Z

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->L()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v3, 0x0

    .line 32
    iput-boolean v3, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 33
    .line 34
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 35
    .line 36
    iget-object v4, v4, Lcom/p1/mobile/android/app/Dialog$e;->o:Ljava/lang/CharSequence;

    .line 37
    .line 38
    if-eqz v4, :cond_3

    .line 39
    .line 40
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-le v4, v1, :cond_2

    .line 47
    .line 48
    move v4, v2

    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move v4, v3

    .line 51
    :goto_0
    iput-boolean v4, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 52
    .line 53
    :cond_3
    iget-boolean v4, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 54
    .line 55
    if-nez v4, :cond_5

    .line 56
    .line 57
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 58
    .line 59
    iget-object v4, v4, Lcom/p1/mobile/android/app/Dialog$e;->r:Ljava/lang/CharSequence;

    .line 60
    .line 61
    if-eqz v4, :cond_5

    .line 62
    .line 63
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 64
    .line 65
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-le v4, v1, :cond_4

    .line 70
    .line 71
    move v4, v2

    .line 72
    goto :goto_1

    .line 73
    :cond_4
    move v4, v3

    .line 74
    :goto_1
    iput-boolean v4, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 75
    .line 76
    :cond_5
    iget-boolean v4, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 77
    .line 78
    if-nez v4, :cond_7

    .line 79
    .line 80
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 81
    .line 82
    iget-object v4, v4, Lcom/p1/mobile/android/app/Dialog$e;->s:Ljava/lang/CharSequence;

    .line 83
    .line 84
    if-eqz v4, :cond_7

    .line 85
    .line 86
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 87
    .line 88
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-le v4, v1, :cond_6

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_6
    move v2, v3

    .line 96
    :goto_2
    iput-boolean v2, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 97
    .line 98
    :cond_7
    iget-boolean v1, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 99
    .line 100
    if-eq v0, v1, :cond_8

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->T()Z

    .line 103
    .line 104
    .line 105
    :cond_8
    :goto_3
    return-void
.end method

.method public final N(I)Landroid/content/res/ColorStateList;
    .locals 1

    .line 1
    const p0, -0x101009e

    .line 2
    .line 3
    .line 4
    filled-new-array {p0}, [I

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x0

    .line 9
    new-array v0, v0, [I

    .line 10
    .line 11
    filled-new-array {p0, v0}, [[I

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const v0, 0x3ecccccd    # 0.4f

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0}, Lcom/p1/mobile/android/app/Dialog;->H(IF)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    filled-new-array {v0, p1}, [I

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Landroid/content/res/ColorStateList;

    .line 27
    .line 28
    invoke-direct {v0, p0, p1}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public final O()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog$e;->X:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 13
    .line 14
    sget v1, Ll/o8c0;->h:I

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/p1/mobile/android/app/Dialog;->e0(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_1
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog$e;->Y:Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_2
    iget-object v0, v1, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 29
    .line 30
    sget v1, Ll/o8c0;->d:I

    .line 31
    .line 32
    invoke-static {v0, v1}, Lcom/p1/mobile/android/app/Dialog;->e0(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_3
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-boolean p0, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 44
    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    sget p0, Ll/o8c0;->h:I

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_4
    sget p0, Ll/o8c0;->d:I

    .line 51
    .line 52
    :goto_0
    invoke-static {v0, p0}, Lcom/p1/mobile/android/app/Dialog;->e0(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public final P()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$e;->t:Landroid/view/View;

    .line 4
    .line 5
    return-object p0
.end method

.method public final S()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->Y()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final T()Z
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->U()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->k:Lv/VLinear_Foreground;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x2

    .line 18
    if-ge v0, v2, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->v:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return v1

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 31
    .line 32
    const/4 v2, -0x1

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->k:Lv/VLinear_Foreground;

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eq v0, v2, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->k:Lv/VLinear_Foreground;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    new-instance v0, Landroid/widget/FrameLayout;

    .line 51
    .line 52
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 53
    .line 54
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 55
    .line 56
    invoke-direct {v0, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 60
    .line 61
    new-instance v0, Landroid/widget/FrameLayout;

    .line 62
    .line 63
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 66
    .line 67
    invoke-direct {v0, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 71
    .line 72
    new-instance v0, Landroid/widget/FrameLayout;

    .line 73
    .line 74
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 75
    .line 76
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 77
    .line 78
    invoke-direct {v0, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 84
    .line 85
    invoke-static {v0}, Lcom/p1/mobile/android/app/Dialog$e;->c(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    new-instance v0, Lv/VButton_FakeShadow;

    .line 92
    .line 93
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 94
    .line 95
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 96
    .line 97
    invoke-direct {v0, v3}, Lv/VButton_FakeShadow;-><init>(Landroid/content/Context;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_3
    new-instance v0, Lv/VText;

    .line 102
    .line 103
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 104
    .line 105
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 106
    .line 107
    invoke-direct {v0, v3}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 108
    .line 109
    .line 110
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 111
    .line 112
    new-instance v0, Lv/VText;

    .line 113
    .line 114
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 115
    .line 116
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 117
    .line 118
    invoke-direct {v0, v3}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 119
    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 122
    .line 123
    new-instance v0, Lv/VText;

    .line 124
    .line 125
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 126
    .line 127
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 128
    .line 129
    invoke-direct {v0, v3}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 130
    .line 131
    .line 132
    iget-boolean v3, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 133
    .line 134
    const/4 v4, 0x1

    .line 135
    const/16 v5, 0xc

    .line 136
    .line 137
    const/4 v6, -0x2

    .line 138
    if-eqz v3, :cond_6

    .line 139
    .line 140
    new-instance v3, Landroid/widget/LinearLayout;

    .line 141
    .line 142
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 143
    .line 144
    iget-object v7, v7, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 145
    .line 146
    invoke-direct {v3, v7}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 147
    .line 148
    .line 149
    iput-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 150
    .line 151
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 152
    .line 153
    invoke-direct {v3, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 154
    .line 155
    .line 156
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 157
    .line 158
    invoke-virtual {v7, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 159
    .line 160
    .line 161
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 162
    .line 163
    check-cast v3, Landroid/widget/LinearLayout;

    .line 164
    .line 165
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 166
    .line 167
    .line 168
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 169
    .line 170
    invoke-virtual {p0, v3, v1}, Lcom/p1/mobile/android/app/Dialog;->q0(Landroid/widget/FrameLayout;Z)V

    .line 171
    .line 172
    .line 173
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 174
    .line 175
    invoke-static {v3}, Lcom/p1/mobile/android/app/Dialog$e;->c(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    if-eqz v3, :cond_4

    .line 180
    .line 181
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->k0()V

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_4
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 186
    .line 187
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Dialog;->r0(Landroid/widget/TextView;)V

    .line 188
    .line 189
    .line 190
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 191
    .line 192
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 193
    .line 194
    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 195
    .line 196
    .line 197
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 198
    .line 199
    invoke-virtual {p0, v3, v4}, Lcom/p1/mobile/android/app/Dialog;->q0(Landroid/widget/FrameLayout;Z)V

    .line 200
    .line 201
    .line 202
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 203
    .line 204
    invoke-static {v3}, Lcom/p1/mobile/android/app/Dialog$e;->b(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    if-eqz v3, :cond_5

    .line 209
    .line 210
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->j0()V

    .line 211
    .line 212
    .line 213
    goto :goto_2

    .line 214
    :cond_5
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 215
    .line 216
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Dialog;->r0(Landroid/widget/TextView;)V

    .line 217
    .line 218
    .line 219
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 220
    .line 221
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 222
    .line 223
    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 224
    .line 225
    .line 226
    :goto_2
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 227
    .line 228
    invoke-virtual {p0, v3, v1}, Lcom/p1/mobile/android/app/Dialog;->q0(Landroid/widget/FrameLayout;Z)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog;->r0(Landroid/widget/TextView;)V

    .line 232
    .line 233
    .line 234
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 235
    .line 236
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 237
    .line 238
    .line 239
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 240
    .line 241
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 242
    .line 243
    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 244
    .line 245
    .line 246
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 247
    .line 248
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 249
    .line 250
    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 251
    .line 252
    .line 253
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 254
    .line 255
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 256
    .line 257
    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 258
    .line 259
    .line 260
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 261
    .line 262
    sget v7, Ll/vcc0;->n:I

    .line 263
    .line 264
    invoke-virtual {v3, v7}, Landroid/view/View;->setId(I)V

    .line 265
    .line 266
    .line 267
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 268
    .line 269
    sget v7, Ll/vcc0;->o:I

    .line 270
    .line 271
    invoke-virtual {v3, v7}, Landroid/view/View;->setId(I)V

    .line 272
    .line 273
    .line 274
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 275
    .line 276
    sget v7, Ll/vcc0;->m:I

    .line 277
    .line 278
    invoke-virtual {v3, v7}, Landroid/view/View;->setId(I)V

    .line 279
    .line 280
    .line 281
    goto/16 :goto_7

    .line 282
    .line 283
    :cond_6
    new-instance v3, Landroid/widget/RelativeLayout;

    .line 284
    .line 285
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 286
    .line 287
    iget-object v7, v7, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 288
    .line 289
    invoke-direct {v3, v7}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 290
    .line 291
    .line 292
    iput-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 293
    .line 294
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 295
    .line 296
    invoke-static {v3}, Lcom/p1/mobile/android/app/Dialog$e;->c(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 297
    .line 298
    .line 299
    move-result v3

    .line 300
    if-eqz v3, :cond_8

    .line 301
    .line 302
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 303
    .line 304
    invoke-direct {v3, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 305
    .line 306
    .line 307
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 308
    .line 309
    sget v8, Lcom/p1/mobile/android/app/Dialog;->M:I

    .line 310
    .line 311
    iget-object v9, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 312
    .line 313
    iget-object v9, v9, Lcom/p1/mobile/android/app/Dialog$e;->t:Landroid/view/View;

    .line 314
    .line 315
    if-nez v9, :cond_7

    .line 316
    .line 317
    sget v9, Lcom/p1/mobile/android/app/Dialog;->O:I

    .line 318
    .line 319
    goto :goto_3

    .line 320
    :cond_7
    move v9, v1

    .line 321
    :goto_3
    invoke-virtual {v7, v8, v9, v8, v8}, Landroid/view/View;->setPadding(IIII)V

    .line 322
    .line 323
    .line 324
    goto :goto_4

    .line 325
    :cond_8
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 326
    .line 327
    sget v7, Lcom/p1/mobile/android/app/Dialog;->T:I

    .line 328
    .line 329
    invoke-direct {v3, v2, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 330
    .line 331
    .line 332
    :goto_4
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 333
    .line 334
    invoke-virtual {v7, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 335
    .line 336
    .line 337
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 338
    .line 339
    sget v7, Lcom/p1/mobile/android/app/Dialog;->P:I

    .line 340
    .line 341
    invoke-direct {v3, v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 342
    .line 343
    .line 344
    const/16 v8, 0x9

    .line 345
    .line 346
    invoke-virtual {v3, v8, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {v3, v5, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 350
    .line 351
    .line 352
    sget v8, Lcom/p1/mobile/android/app/Dialog;->L:I

    .line 353
    .line 354
    invoke-virtual {v3, v8, v1, v8, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 355
    .line 356
    .line 357
    iget-object v9, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 358
    .line 359
    invoke-virtual {v9, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 360
    .line 361
    .line 362
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 363
    .line 364
    sget v9, Lcom/p1/mobile/android/app/Dialog;->U:I

    .line 365
    .line 366
    invoke-virtual {v3, v9}, Landroid/view/View;->setMinimumWidth(I)V

    .line 367
    .line 368
    .line 369
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog;->l0(Landroid/widget/TextView;)V

    .line 370
    .line 371
    .line 372
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 373
    .line 374
    const/16 v10, 0x11

    .line 375
    .line 376
    invoke-direct {v3, v2, v2, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 377
    .line 378
    .line 379
    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 380
    .line 381
    .line 382
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 383
    .line 384
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 385
    .line 386
    .line 387
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 388
    .line 389
    sget v11, Ll/vcc0;->n:I

    .line 390
    .line 391
    invoke-virtual {v3, v11}, Landroid/view/View;->setId(I)V

    .line 392
    .line 393
    .line 394
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 395
    .line 396
    invoke-static {v3}, Lcom/p1/mobile/android/app/Dialog$e;->b(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 397
    .line 398
    .line 399
    move-result v3

    .line 400
    if-eqz v3, :cond_9

    .line 401
    .line 402
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->j0()V

    .line 403
    .line 404
    .line 405
    goto :goto_5

    .line 406
    :cond_9
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 407
    .line 408
    invoke-direct {v3, v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 409
    .line 410
    .line 411
    invoke-virtual {v3, v5, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 412
    .line 413
    .line 414
    iget-object v11, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 415
    .line 416
    invoke-virtual {v11, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 417
    .line 418
    .line 419
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 420
    .line 421
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Dialog;->l0(Landroid/widget/TextView;)V

    .line 422
    .line 423
    .line 424
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 425
    .line 426
    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    .line 427
    .line 428
    invoke-direct {v11, v2, v2, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 429
    .line 430
    .line 431
    invoke-virtual {v3, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 432
    .line 433
    .line 434
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 435
    .line 436
    invoke-virtual {v3, v9}, Landroid/view/View;->setMinimumWidth(I)V

    .line 437
    .line 438
    .line 439
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 440
    .line 441
    iget-object v11, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 442
    .line 443
    invoke-virtual {v3, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 444
    .line 445
    .line 446
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 447
    .line 448
    sget v11, Ll/vcc0;->m:I

    .line 449
    .line 450
    invoke-virtual {v3, v11}, Landroid/view/View;->setId(I)V

    .line 451
    .line 452
    .line 453
    :goto_5
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 454
    .line 455
    invoke-static {v3}, Lcom/p1/mobile/android/app/Dialog$e;->c(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 456
    .line 457
    .line 458
    move-result v3

    .line 459
    if-eqz v3, :cond_a

    .line 460
    .line 461
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->k0()V

    .line 462
    .line 463
    .line 464
    goto :goto_6

    .line 465
    :cond_a
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 466
    .line 467
    invoke-direct {v3, v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 468
    .line 469
    .line 470
    const/16 v7, 0xb

    .line 471
    .line 472
    invoke-virtual {v3, v7, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {v3, v5, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 476
    .line 477
    .line 478
    invoke-virtual {v3, v8, v1, v8, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 479
    .line 480
    .line 481
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 482
    .line 483
    invoke-virtual {v7, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 484
    .line 485
    .line 486
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 487
    .line 488
    invoke-virtual {v3, v9}, Landroid/view/View;->setMinimumWidth(I)V

    .line 489
    .line 490
    .line 491
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 492
    .line 493
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Dialog;->l0(Landroid/widget/TextView;)V

    .line 494
    .line 495
    .line 496
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 497
    .line 498
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    .line 499
    .line 500
    invoke-direct {v7, v2, v2, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 501
    .line 502
    .line 503
    invoke-virtual {v3, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 504
    .line 505
    .line 506
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 507
    .line 508
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 509
    .line 510
    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 511
    .line 512
    .line 513
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 514
    .line 515
    sget v7, Ll/vcc0;->o:I

    .line 516
    .line 517
    invoke-virtual {v3, v7}, Landroid/view/View;->setId(I)V

    .line 518
    .line 519
    .line 520
    :goto_6
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 521
    .line 522
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 523
    .line 524
    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 525
    .line 526
    .line 527
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 528
    .line 529
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 530
    .line 531
    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 532
    .line 533
    .line 534
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 535
    .line 536
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 537
    .line 538
    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 539
    .line 540
    .line 541
    :goto_7
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 542
    .line 543
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->h0:Landroid/graphics/drawable/Drawable;

    .line 544
    .line 545
    if-eqz v3, :cond_b

    .line 546
    .line 547
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 548
    .line 549
    invoke-static {v7, v3}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 550
    .line 551
    .line 552
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 553
    .line 554
    sget v7, Lcom/p1/mobile/android/app/Dialog;->K:I

    .line 555
    .line 556
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 557
    .line 558
    .line 559
    :cond_b
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 560
    .line 561
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->o:Ljava/lang/CharSequence;

    .line 562
    .line 563
    const/16 v7, 0x8

    .line 564
    .line 565
    if-eqz v3, :cond_c

    .line 566
    .line 567
    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 568
    .line 569
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 570
    .line 571
    .line 572
    move-result-object v3

    .line 573
    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 574
    .line 575
    .line 576
    move-result-object v3

    .line 577
    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 578
    .line 579
    .line 580
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 581
    .line 582
    const-string v8, "POSITIVE"

    .line 583
    .line 584
    invoke-virtual {v3, v8}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 585
    .line 586
    .line 587
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 588
    .line 589
    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 590
    .line 591
    .line 592
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 593
    .line 594
    invoke-static {v3}, Lcom/p1/mobile/android/app/Dialog$e;->c(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 595
    .line 596
    .line 597
    move-result v3

    .line 598
    if-nez v3, :cond_d

    .line 599
    .line 600
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 601
    .line 602
    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 603
    .line 604
    iget v8, v8, Lcom/p1/mobile/android/app/Dialog$e;->u:I

    .line 605
    .line 606
    invoke-virtual {p0, v8}, Lcom/p1/mobile/android/app/Dialog;->N(I)Landroid/content/res/ColorStateList;

    .line 607
    .line 608
    .line 609
    move-result-object v8

    .line 610
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 611
    .line 612
    .line 613
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 614
    .line 615
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->O()Landroid/graphics/drawable/Drawable;

    .line 616
    .line 617
    .line 618
    move-result-object v8

    .line 619
    invoke-virtual {v3, v8}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 620
    .line 621
    .line 622
    goto :goto_8

    .line 623
    :cond_c
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 624
    .line 625
    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 626
    .line 627
    .line 628
    :cond_d
    :goto_8
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 629
    .line 630
    iget-object v8, v3, Lcom/p1/mobile/android/app/Dialog$e;->r:Ljava/lang/CharSequence;

    .line 631
    .line 632
    if-eqz v8, :cond_e

    .line 633
    .line 634
    iget v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->w:I

    .line 635
    .line 636
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Dialog;->N(I)Landroid/content/res/ColorStateList;

    .line 637
    .line 638
    .line 639
    move-result-object v3

    .line 640
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 641
    .line 642
    .line 643
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 644
    .line 645
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->O()Landroid/graphics/drawable/Drawable;

    .line 646
    .line 647
    .line 648
    move-result-object v8

    .line 649
    invoke-virtual {v3, v8}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 650
    .line 651
    .line 652
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 653
    .line 654
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->r:Ljava/lang/CharSequence;

    .line 655
    .line 656
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 657
    .line 658
    .line 659
    move-result-object v3

    .line 660
    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 661
    .line 662
    .line 663
    move-result-object v3

    .line 664
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 665
    .line 666
    .line 667
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 668
    .line 669
    const-string v3, "NEUTRAL"

    .line 670
    .line 671
    invoke-virtual {v0, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 672
    .line 673
    .line 674
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 675
    .line 676
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 677
    .line 678
    .line 679
    goto :goto_9

    .line 680
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 681
    .line 682
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 683
    .line 684
    .line 685
    :goto_9
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 686
    .line 687
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->s:Ljava/lang/CharSequence;

    .line 688
    .line 689
    if-eqz v0, :cond_11

    .line 690
    .line 691
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 692
    .line 693
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 694
    .line 695
    .line 696
    move-result-object v0

    .line 697
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 698
    .line 699
    .line 700
    move-result-object v0

    .line 701
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 702
    .line 703
    .line 704
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 705
    .line 706
    const-string v3, "NEGATIVE"

    .line 707
    .line 708
    invoke-virtual {v0, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 709
    .line 710
    .line 711
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 712
    .line 713
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 714
    .line 715
    .line 716
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 717
    .line 718
    invoke-static {v0}, Lcom/p1/mobile/android/app/Dialog$e;->b(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 719
    .line 720
    .line 721
    move-result v0

    .line 722
    if-nez v0, :cond_f

    .line 723
    .line 724
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 725
    .line 726
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 727
    .line 728
    iget v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->v:I

    .line 729
    .line 730
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Dialog;->N(I)Landroid/content/res/ColorStateList;

    .line 731
    .line 732
    .line 733
    move-result-object v3

    .line 734
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 735
    .line 736
    .line 737
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 738
    .line 739
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->O()Landroid/graphics/drawable/Drawable;

    .line 740
    .line 741
    .line 742
    move-result-object v3

    .line 743
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 744
    .line 745
    .line 746
    :cond_f
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 747
    .line 748
    if-nez v0, :cond_12

    .line 749
    .line 750
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 751
    .line 752
    invoke-static {v0}, Lcom/p1/mobile/android/app/Dialog$e;->b(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 753
    .line 754
    .line 755
    move-result v0

    .line 756
    if-nez v0, :cond_12

    .line 757
    .line 758
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 759
    .line 760
    sget v3, Lcom/p1/mobile/android/app/Dialog;->P:I

    .line 761
    .line 762
    invoke-direct {v0, v6, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 763
    .line 764
    .line 765
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 766
    .line 767
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->o:Ljava/lang/CharSequence;

    .line 768
    .line 769
    if-eqz v3, :cond_10

    .line 770
    .line 771
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 772
    .line 773
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    .line 774
    .line 775
    .line 776
    move-result v3

    .line 777
    const/16 v6, 0x10

    .line 778
    .line 779
    invoke-virtual {v0, v6, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 780
    .line 781
    .line 782
    sget v3, Lcom/p1/mobile/android/app/Dialog;->L:I

    .line 783
    .line 784
    invoke-virtual {v0, v3, v1, v1, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 785
    .line 786
    .line 787
    goto :goto_a

    .line 788
    :cond_10
    const/16 v3, 0x15

    .line 789
    .line 790
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 791
    .line 792
    .line 793
    sget v3, Lcom/p1/mobile/android/app/Dialog;->L:I

    .line 794
    .line 795
    invoke-virtual {v0, v3, v1, v3, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 796
    .line 797
    .line 798
    :goto_a
    invoke-virtual {v0, v5, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 799
    .line 800
    .line 801
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 802
    .line 803
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 804
    .line 805
    .line 806
    goto :goto_b

    .line 807
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 808
    .line 809
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 810
    .line 811
    .line 812
    :cond_12
    :goto_b
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 813
    .line 814
    if-nez v0, :cond_13

    .line 815
    .line 816
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 817
    .line 818
    sget v2, Lcom/p1/mobile/android/app/Dialog;->L:I

    .line 819
    .line 820
    invoke-virtual {v0, v2, v1, v2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 821
    .line 822
    .line 823
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 824
    .line 825
    invoke-virtual {v0, v2, v1, v2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 826
    .line 827
    .line 828
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->A:Landroid/widget/FrameLayout;

    .line 829
    .line 830
    invoke-virtual {v0, v2, v1, v2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 831
    .line 832
    .line 833
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->k:Lv/VLinear_Foreground;

    .line 834
    .line 835
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 836
    .line 837
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 838
    .line 839
    .line 840
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->U()V

    .line 841
    .line 842
    .line 843
    return v4
.end method

.method public final U()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/android/app/Dialog$e;->n:[Ljava/lang/CharSequence;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    array-length v1, v1

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/android/app/Dialog$e;->N:Landroid/widget/ListAdapter;

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->N:Landroid/widget/ListAdapter;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->G:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->m:Lv/VList;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$a;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Dialog$a;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$b;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Dialog$b;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final V(Landroid/content/Context;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-int v0, v0

    .line 6
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    float-to-int p2, p2

    .line 11
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledWindowTouchSlop()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    neg-int v1, p1

    .line 28
    if-lt v0, v1, :cond_1

    .line 29
    .line 30
    if-lt p2, v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    add-int/2addr v1, p1

    .line 37
    if-gt v0, v1, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    add-int/2addr p0, p1

    .line 44
    if-le p2, p0, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    return p0

    .line 49
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 50
    return p0
.end method

.method public X()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    sget v0, Ll/vcc0;->m:I

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final Y()I
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog$e;->o:Ljava/lang/CharSequence;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog$e;->r:Ljava/lang/CharSequence;

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$e;->s:Ljava/lang/CharSequence;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    add-int/2addr v0, v1

    .line 22
    :cond_2
    return v0
.end method

.method public Z()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    sget v0, Ll/vcc0;->o:I

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final g0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/android/app/Dialog$e;->H:I

    .line 4
    .line 5
    if-ltz v1, :cond_0

    .line 6
    .line 7
    iget-object v2, v0, Lcom/p1/mobile/android/app/Dialog$e;->n:[Ljava/lang/CharSequence;

    .line 8
    .line 9
    aget-object v2, v2, v1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v2, 0x0

    .line 13
    :goto_0
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->B:Lcom/p1/mobile/android/app/Dialog$g;

    .line 14
    .line 15
    invoke-interface {v0, p0, p1, v1, v2}, Lcom/p1/mobile/android/app/Dialog$g;->a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public h0(Landroid/view/ViewGroup;F)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-ge p0, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void
.end method

.method public i0(Landroid/view/ViewGroup;F)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-ge p0, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void
.end method

.method public final j0()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    const/4 v2, -0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 8
    .line 9
    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 10
    .line 11
    .line 12
    sget v1, Lcom/p1/mobile/android/app/Dialog;->M:I

    .line 13
    .line 14
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 23
    .line 24
    invoke-direct {v0, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    sget v1, Lcom/p1/mobile/android/app/Dialog;->M:I

    .line 28
    .line 29
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v3, Ll/tgc0;->p:I

    .line 43
    .line 44
    invoke-virtual {v0, v1, v3}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 45
    .line 46
    .line 47
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Dialog;->J:Z

    .line 48
    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 54
    .line 55
    iget v1, v1, Lcom/p1/mobile/android/app/Dialog$e;->v:I

    .line 56
    .line 57
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog;->N(I)Landroid/content/res/ColorStateList;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 65
    .line 66
    const/4 v1, 0x1

    .line 67
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 71
    .line 72
    const/16 v3, 0x11

    .line 73
    .line 74
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->q:Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 87
    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    invoke-virtual {v3, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    sget v4, Ll/abc0;->q6:I

    .line 101
    .line 102
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v3, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 107
    .line 108
    .line 109
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 110
    .line 111
    sget v3, Lcom/p1/mobile/android/app/Dialog;->S:I

    .line 112
    .line 113
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/view/View;->setDuplicateParentStateEnabled(Z)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 122
    .line 123
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 124
    .line 125
    const/16 v3, 0x10

    .line 126
    .line 127
    invoke-direct {v1, v2, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 134
    .line 135
    const/4 v1, 0x0

    .line 136
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 155
    .line 156
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 157
    .line 158
    sget v2, Ll/u7c0;->e:I

    .line 159
    .line 160
    invoke-static {v1, v2}, Landroid/animation/AnimatorInflater;->loadStateListAnimator(Landroid/content/Context;I)Landroid/animation/StateListAnimator;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v0, v1}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 172
    .line 173
    .line 174
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->B:Landroid/widget/FrameLayout;

    .line 175
    .line 176
    sget v0, Ll/vcc0;->m:I

    .line 177
    .line 178
    invoke-virtual {p0, v0}, Landroid/view/View;->setId(I)V

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public final k0()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Dialog;->D:Z

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    const/4 v2, -0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 8
    .line 9
    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 10
    .line 11
    .line 12
    sget v1, Lcom/p1/mobile/android/app/Dialog;->M:I

    .line 13
    .line 14
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 23
    .line 24
    invoke-direct {v0, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    sget v1, Lcom/p1/mobile/android/app/Dialog;->M:I

    .line 28
    .line 29
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    sget v4, Ll/tgc0;->o:I

    .line 49
    .line 50
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 51
    .line 52
    .line 53
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Dialog;->I:Z

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 58
    .line 59
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 60
    .line 61
    iget v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->u:I

    .line 62
    .line 63
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Dialog;->N(I)Landroid/content/res/ColorStateList;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 71
    .line 72
    const/16 v3, 0x11

    .line 73
    .line 74
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->p:Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 87
    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    invoke-virtual {v3, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    sget v4, Ll/abc0;->k6:I

    .line 101
    .line 102
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v3, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 107
    .line 108
    .line 109
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 110
    .line 111
    sget v3, Lcom/p1/mobile/android/app/Dialog;->S:I

    .line 112
    .line 113
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/view/View;->setDuplicateParentStateEnabled(Z)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 122
    .line 123
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 124
    .line 125
    const/16 v3, 0x10

    .line 126
    .line 127
    invoke-direct {v1, v2, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 134
    .line 135
    const/4 v1, 0x0

    .line 136
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->w:Landroid/view/ViewGroup;

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 155
    .line 156
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 157
    .line 158
    sget v2, Ll/u7c0;->e:I

    .line 159
    .line 160
    invoke-static {v1, v2}, Landroid/animation/AnimatorInflater;->loadStateListAnimator(Landroid/content/Context;I)Landroid/animation/StateListAnimator;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v0, v1}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 172
    .line 173
    .line 174
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->y:Landroid/widget/FrameLayout;

    .line 175
    .line 176
    sget v0, Ll/vcc0;->o:I

    .line 177
    .line 178
    invoke-virtual {p0, v0}, Landroid/view/View;->setId(I)V

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public final l0(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    const/high16 p0, 0x41600000    # 14.0f

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 16
    .line 17
    .line 18
    const/16 v0, 0x11

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    sget v0, Lcom/p1/mobile/android/app/Dialog;->R:I

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p0}, Landroid/view/View;->setDuplicateParentStateEnabled(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public m0(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/android/app/Dialog$e;->y:Ljava/lang/Runnable;

    .line 4
    .line 5
    return-void
.end method

.method public n0(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/android/app/Dialog$e;->b(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->C:Landroid/widget/TextView;

    .line 27
    .line 28
    return-object p0
.end method

.method public o0(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/android/app/Dialog$e;->x:Ljava/lang/Runnable;

    .line 4
    .line 5
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "POSITIVE"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->x:Ljava/lang/Runnable;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->B:Lcom/p1/mobile/android/app/Dialog$g;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->g0(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    iget-boolean p1, p1, Lcom/p1/mobile/android/app/Dialog$e;->J:Z

    .line 41
    .line 42
    if-eqz p1, :cond_e

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    const-string v1, "NEGATIVE"

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_4

    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/android/app/Dialog$e;->y:Ljava/lang/Runnable;

    .line 59
    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 66
    .line 67
    iget-boolean p1, p1, Lcom/p1/mobile/android/app/Dialog$e;->J:Z

    .line 68
    .line 69
    if-eqz p1, :cond_e

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_4
    const-string v1, "NEUTRAL"

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 82
    .line 83
    if-eqz v1, :cond_6

    .line 84
    .line 85
    iget-object p1, v2, Lcom/p1/mobile/android/app/Dialog$e;->z:Ljava/lang/Runnable;

    .line 86
    .line 87
    if-eqz p1, :cond_5

    .line 88
    .line 89
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 90
    .line 91
    .line 92
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 93
    .line 94
    iget-boolean p1, p1, Lcom/p1/mobile/android/app/Dialog$e;->J:Z

    .line 95
    .line 96
    if-eqz p1, :cond_e

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_6
    iget-object v1, v2, Lcom/p1/mobile/android/app/Dialog$e;->A:Lcom/p1/mobile/android/app/Dialog$g;

    .line 103
    .line 104
    const/4 v3, 0x1

    .line 105
    if-eqz v1, :cond_a

    .line 106
    .line 107
    iget-boolean v1, v2, Lcom/p1/mobile/android/app/Dialog$e;->J:Z

    .line 108
    .line 109
    if-eqz v1, :cond_7

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 112
    .line 113
    .line 114
    :cond_7
    if-eqz v0, :cond_e

    .line 115
    .line 116
    const-string v1, ":"

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    array-length v1, v0

    .line 123
    const/4 v2, 0x2

    .line 124
    const/4 v4, 0x0

    .line 125
    if-ne v1, v2, :cond_8

    .line 126
    .line 127
    aget-object v1, v0, v4

    .line 128
    .line 129
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    aget-object v0, v0, v3

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_8
    array-length v1, v0

    .line 137
    const-string v2, ""

    .line 138
    .line 139
    if-ne v1, v3, :cond_9

    .line 140
    .line 141
    aget-object v0, v0, v4

    .line 142
    .line 143
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    :cond_9
    move-object v0, v2

    .line 148
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 149
    .line 150
    iget-object v1, v1, Lcom/p1/mobile/android/app/Dialog$e;->A:Lcom/p1/mobile/android/app/Dialog$g;

    .line 151
    .line 152
    invoke-interface {v1, p0, p1, v4, v0}, Lcom/p1/mobile/android/app/Dialog$g;->a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_a
    iget-object v0, v2, Lcom/p1/mobile/android/app/Dialog$e;->B:Lcom/p1/mobile/android/app/Dialog$g;

    .line 157
    .line 158
    if-eqz v0, :cond_d

    .line 159
    .line 160
    move-object v0, p1

    .line 161
    check-cast v0, Landroid/widget/LinearLayout;

    .line 162
    .line 163
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    check-cast v0, Landroid/widget/RadioButton;

    .line 168
    .line 169
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-nez v1, :cond_b

    .line 174
    .line 175
    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 176
    .line 177
    .line 178
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 179
    .line 180
    iget-boolean v1, v0, Lcom/p1/mobile/android/app/Dialog$e;->J:Z

    .line 181
    .line 182
    if-eqz v1, :cond_c

    .line 183
    .line 184
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->o:Ljava/lang/CharSequence;

    .line 185
    .line 186
    if-nez v0, :cond_c

    .line 187
    .line 188
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->g0(Landroid/view/View;)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_c
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Dialog;->E:Z

    .line 196
    .line 197
    if-eqz v0, :cond_e

    .line 198
    .line 199
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->g0(Landroid/view/View;)V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :cond_d
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 204
    .line 205
    .line 206
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 207
    .line 208
    iget-boolean p1, p1, Lcom/p1/mobile/android/app/Dialog$e;->J:Z

    .line 209
    .line 210
    if-eqz p1, :cond_e

    .line 211
    .line 212
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 213
    .line 214
    .line 215
    :cond_e
    return-void
.end method

.method public onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/g1e;->onShow(Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->M()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/android/app/Dialog;->V(Landroid/content/Context;Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->S:Lcom/p1/mobile/android/app/Dialog$i;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {v0, p0}, Lcom/p1/mobile/android/app/Dialog$i;->a(Lcom/p1/mobile/android/app/Dialog;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Dialog;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method public p0(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/android/app/Dialog$e;->c(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->z:Landroid/widget/TextView;

    .line 27
    .line 28
    return-object p0
.end method

.method public final q0(Landroid/widget/FrameLayout;Z)V
    .locals 2

    .line 1
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    sget v1, Lcom/p1/mobile/android/app/Dialog;->S:I

    .line 5
    .line 6
    invoke-direct {p0, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 7
    .line 8
    .line 9
    const v0, 0x800015

    .line 10
    .line 11
    .line 12
    iput v0, p0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    sget p2, Lcom/p1/mobile/android/app/Dialog;->L:I

    .line 18
    .line 19
    invoke-virtual {p0, v0, p2, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 27
    .line 28
    .line 29
    sget p0, Lcom/p1/mobile/android/app/Dialog;->M:I

    .line 30
    .line 31
    invoke-virtual {p1, p0, v0, p0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final r0(Landroid/widget/TextView;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->l0(Landroid/widget/TextView;)V

    .line 2
    .line 3
    .line 4
    sget v0, Lcom/p1/mobile/android/app/Dialog;->L:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p1, v0, v1, v0, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/android/app/Dialog$e;->c(Lcom/p1/mobile/android/app/Dialog$e;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const/16 p0, 0x11

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/16 p0, 0x15

    .line 24
    .line 25
    :goto_0
    const/4 v1, -0x2

    .line 26
    invoke-direct {v0, v1, v1, p0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final setTitle(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->o:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public show()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v0, v1, :cond_3

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/tgc0;->g:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/p1/mobile/android/app/Dialog$e;->m(Lcom/p1/mobile/android/app/Dialog$e;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, -0x1

    .line 27
    if-eq v1, v2, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v3, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    invoke-static {v3}, Lcom/p1/mobile/android/app/Dialog$e;->m(Lcom/p1/mobile/android/app/Dialog$e;)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 45
    .line 46
    iget v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->j0:I

    .line 47
    .line 48
    if-eq v0, v2, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 55
    .line 56
    iget v1, v1, Lcom/p1/mobile/android/app/Dialog$e;->j0:I

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 59
    .line 60
    .line 61
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 62
    .line 63
    iget-boolean v1, v0, Lcom/p1/mobile/android/app/Dialog$e;->m0:Z

    .line 64
    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->i0:Z

    .line 68
    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 72
    .line 73
    sget v1, Ll/abc0;->b:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget v1, Ll/abc0;->b:I

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Landroid/graphics/LightingColorFilter;

    .line 89
    .line 90
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 91
    .line 92
    iget v2, v2, Lcom/p1/mobile/android/app/Dialog$e;->p0:I

    .line 93
    .line 94
    const/4 v3, 0x0

    .line 95
    invoke-direct {v1, v2, v3}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 99
    .line 100
    .line 101
    sget v1, Lcom/p1/mobile/android/app/Dialog;->S:I

    .line 102
    .line 103
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 104
    .line 105
    int-to-float v3, v1

    .line 106
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/android/app/Dialog;->i0(Landroid/view/ViewGroup;F)V

    .line 107
    .line 108
    .line 109
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 110
    .line 111
    const/high16 v3, 0x3f800000    # 1.0f

    .line 112
    .line 113
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/android/app/Dialog;->h0(Landroid/view/ViewGroup;F)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    sget v3, Ll/abc0;->c:I

    .line 121
    .line 122
    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 123
    .line 124
    .line 125
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 126
    .line 127
    invoke-virtual {v2, v0}, Lv/VLinear_Foreground;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    const v3, 0x3f333333    # 0.7f

    .line 135
    .line 136
    .line 137
    invoke-virtual {v2, v3}, Landroid/view/Window;->setDimAmount(F)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    sget v3, Ll/tgc0;->b:I

    .line 145
    .line 146
    invoke-virtual {v2, v3}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 147
    .line 148
    .line 149
    new-instance v2, Lcom/p1/mobile/android/app/Dialog$c;

    .line 150
    .line 151
    invoke-direct {v2, p0, v1, v0}, Lcom/p1/mobile/android/app/Dialog$c;-><init>(Lcom/p1/mobile/android/app/Dialog;ILandroid/graphics/drawable/Drawable;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0, v2}, Ll/g1e;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 155
    .line 156
    .line 157
    :cond_2
    invoke-super {p0}, Ll/g1e;->show()V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_3
    const-string p0, "Dialogs can only be shown from the UI thread."

    .line 162
    .line 163
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method
