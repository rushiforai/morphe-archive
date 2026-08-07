.class public Lv/VListCell;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/VListCell$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Landroid/widget/LinearLayout;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/ViewStub;

.field public c:Lv/VIcon;

.field public d:Lv/VIcon;

.field public e:Lv/VLinear;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lv/VListCell;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lv/VListCell;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lv/VListCell;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    .line 1
    iget-object v0, p0, Lv/VListCell;->a:Landroid/view/View;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lv/VListCell;->h:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lv/VListCell;->h:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 22
    .line 23
    sget v2, Ll/qa00;->h:I

    .line 24
    .line 25
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lv/VListCell;->c:Lv/VIcon;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v2, 0x0

    .line 34
    if-ne v0, v1, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Lv/VListCell;->d:Lv/VIcon;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-ne v0, v1, :cond_3

    .line 43
    .line 44
    iget-object v0, p0, Lv/VListCell;->h:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-ne v0, v1, :cond_3

    .line 51
    .line 52
    iget-object v0, p0, Lv/VListCell;->a:Landroid/view/View;

    .line 53
    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    iget-object v0, p0, Lv/VListCell;->f:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    const/16 v1, 0x11

    .line 63
    .line 64
    if-nez v0, :cond_1

    .line 65
    .line 66
    iget-object v0, p0, Lv/VListCell;->f:Lv/VText;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 73
    .line 74
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 75
    .line 76
    :cond_1
    iget-object v0, p0, Lv/VListCell;->g:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_2

    .line 83
    .line 84
    iget-object v0, p0, Lv/VListCell;->g:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 91
    .line 92
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 93
    .line 94
    :cond_2
    iget-object p0, p0, Lv/VListCell;->e:Lv/VLinear;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 101
    .line 102
    iput v2, p0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    iget-object v0, p0, Lv/VListCell;->f:Lv/VText;

    .line 106
    .line 107
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    const/4 v1, 0x1

    .line 112
    const v3, 0x800013

    .line 113
    .line 114
    .line 115
    if-nez v0, :cond_4

    .line 116
    .line 117
    iget-object v0, p0, Lv/VListCell;->f:Lv/VText;

    .line 118
    .line 119
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 124
    .line 125
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 126
    .line 127
    move v0, v1

    .line 128
    goto :goto_0

    .line 129
    :cond_4
    move v0, v2

    .line 130
    :goto_0
    iget-object v4, p0, Lv/VListCell;->g:Lv/VText;

    .line 131
    .line 132
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    if-nez v4, :cond_5

    .line 137
    .line 138
    iget-object v4, p0, Lv/VListCell;->g:Lv/VText;

    .line 139
    .line 140
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    check-cast v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 145
    .line 146
    iput v3, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_5
    move v1, v2

    .line 150
    :goto_1
    iget-object v3, p0, Lv/VListCell;->e:Lv/VLinear;

    .line 151
    .line 152
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 157
    .line 158
    sget v4, Ll/qa00;->q:I

    .line 159
    .line 160
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 161
    .line 162
    if-eqz v0, :cond_6

    .line 163
    .line 164
    if-nez v1, :cond_6

    .line 165
    .line 166
    iget-object p0, p0, Lv/VListCell;->f:Lv/VText;

    .line 167
    .line 168
    sget v0, Ll/qa00;->c:I

    .line 169
    .line 170
    invoke-virtual {p0, v2, v0, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_6
    iget-object p0, p0, Lv/VListCell;->f:Lv/VText;

    .line 175
    .line 176
    invoke-virtual {p0, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public final b(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 23
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongViewCast"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    sget v3, Ll/gec0;->m:I

    .line 10
    .line 11
    invoke-virtual {v2, v3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    const/16 v2, 0x10

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 17
    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 21
    .line 22
    .line 23
    sget v4, Ll/vcc0;->V:I

    .line 24
    .line 25
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    check-cast v4, Lv/VIcon;

    .line 30
    .line 31
    iput-object v4, v0, Lv/VListCell;->c:Lv/VIcon;

    .line 32
    .line 33
    sget v4, Ll/vcc0;->W:I

    .line 34
    .line 35
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Lv/VIcon;

    .line 40
    .line 41
    iput-object v4, v0, Lv/VListCell;->d:Lv/VIcon;

    .line 42
    .line 43
    sget v4, Ll/vcc0;->x:I

    .line 44
    .line 45
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Landroid/view/ViewStub;

    .line 50
    .line 51
    iput-object v4, v0, Lv/VListCell;->b:Landroid/view/ViewStub;

    .line 52
    .line 53
    sget v4, Ll/vcc0;->T0:I

    .line 54
    .line 55
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    check-cast v4, Lv/VLinear;

    .line 60
    .line 61
    iput-object v4, v0, Lv/VListCell;->e:Lv/VLinear;

    .line 62
    .line 63
    sget v4, Ll/vcc0;->R0:I

    .line 64
    .line 65
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    check-cast v4, Lv/VText;

    .line 70
    .line 71
    iput-object v4, v0, Lv/VListCell;->f:Lv/VText;

    .line 72
    .line 73
    invoke-virtual {v4}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    const/4 v6, 0x1

    .line 78
    invoke-virtual {v4, v5, v6}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 79
    .line 80
    .line 81
    sget v4, Ll/vcc0;->K0:I

    .line 82
    .line 83
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    check-cast v4, Lv/VText;

    .line 88
    .line 89
    iput-object v4, v0, Lv/VListCell;->g:Lv/VText;

    .line 90
    .line 91
    sget v4, Ll/vcc0;->Z:I

    .line 92
    .line 93
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    check-cast v4, Lv/VText;

    .line 98
    .line 99
    iput-object v4, v0, Lv/VListCell;->h:Lv/VText;

    .line 100
    .line 101
    const v4, 0x7fffffff

    .line 102
    .line 103
    .line 104
    const/4 v5, -0x1

    .line 105
    if-eqz v1, :cond_0

    .line 106
    .line 107
    sget-object v7, Ll/hhc0;->g0:[I

    .line 108
    .line 109
    move-object/from16 v8, p1

    .line 110
    .line 111
    invoke-virtual {v8, v1, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    sget v7, Ll/hhc0;->u0:I

    .line 116
    .line 117
    invoke-virtual {v1, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    sget v8, Ll/hhc0;->v0:I

    .line 122
    .line 123
    invoke-virtual {v1, v8, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 124
    .line 125
    .line 126
    move-result v8

    .line 127
    sget v9, Ll/hhc0;->v0:I

    .line 128
    .line 129
    invoke-virtual {v1, v9}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 130
    .line 131
    .line 132
    move-result-object v9

    .line 133
    sget v10, Ll/hhc0;->w0:I

    .line 134
    .line 135
    invoke-virtual {v1, v10, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 136
    .line 137
    .line 138
    move-result v10

    .line 139
    sget v11, Ll/hhc0;->x0:I

    .line 140
    .line 141
    invoke-virtual {v1, v11, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 142
    .line 143
    .line 144
    move-result v11

    .line 145
    sget v12, Ll/hhc0;->p0:I

    .line 146
    .line 147
    invoke-virtual {v1, v12}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v12

    .line 151
    sget v13, Ll/hhc0;->q0:I

    .line 152
    .line 153
    invoke-virtual {v1, v13, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 154
    .line 155
    .line 156
    move-result v13

    .line 157
    sget v14, Ll/hhc0;->q0:I

    .line 158
    .line 159
    invoke-virtual {v1, v14}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 160
    .line 161
    .line 162
    move-result-object v14

    .line 163
    sget v15, Ll/hhc0;->s0:I

    .line 164
    .line 165
    invoke-virtual {v1, v15, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 166
    .line 167
    .line 168
    move-result v15

    .line 169
    sget v3, Ll/hhc0;->t0:I

    .line 170
    .line 171
    invoke-virtual {v1, v3, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    sget v2, Ll/hhc0;->l0:I

    .line 176
    .line 177
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    sget v6, Ll/hhc0;->m0:I

    .line 182
    .line 183
    invoke-virtual {v1, v6, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 184
    .line 185
    .line 186
    move-result v6

    .line 187
    sget v4, Ll/hhc0;->m0:I

    .line 188
    .line 189
    invoke-virtual {v1, v4}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    move-object/from16 p1, v2

    .line 194
    .line 195
    sget v2, Ll/hhc0;->n0:I

    .line 196
    .line 197
    invoke-virtual {v1, v2, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 198
    .line 199
    .line 200
    move-result v2

    .line 201
    move/from16 p2, v2

    .line 202
    .line 203
    sget v2, Ll/hhc0;->o0:I

    .line 204
    .line 205
    invoke-virtual {v1, v2, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    sget v5, Ll/hhc0;->h0:I

    .line 210
    .line 211
    move/from16 v18, v2

    .line 212
    .line 213
    const v2, 0x7fffffff

    .line 214
    .line 215
    .line 216
    invoke-virtual {v1, v5, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 217
    .line 218
    .line 219
    move-result v5

    .line 220
    sget v2, Ll/hhc0;->h0:I

    .line 221
    .line 222
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    move-object/from16 v19, v2

    .line 227
    .line 228
    sget v2, Ll/hhc0;->j0:I

    .line 229
    .line 230
    move/from16 v20, v3

    .line 231
    .line 232
    const/4 v3, -0x1

    .line 233
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    move/from16 v17, v2

    .line 238
    .line 239
    sget v2, Ll/hhc0;->k0:I

    .line 240
    .line 241
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 242
    .line 243
    .line 244
    move-result v2

    .line 245
    move/from16 v21, v2

    .line 246
    .line 247
    sget v2, Ll/hhc0;->i0:I

    .line 248
    .line 249
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    sget v3, Ll/hhc0;->r0:I

    .line 254
    .line 255
    move/from16 v22, v2

    .line 256
    .line 257
    const/4 v2, 0x1

    .line 258
    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 259
    .line 260
    .line 261
    move-result v3

    .line 262
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 263
    .line 264
    .line 265
    move-object/from16 v1, v19

    .line 266
    .line 267
    move/from16 v19, p2

    .line 268
    .line 269
    move-object/from16 p2, v12

    .line 270
    .line 271
    move v12, v6

    .line 272
    move v6, v5

    .line 273
    move v5, v10

    .line 274
    move-object v10, v9

    .line 275
    move v9, v13

    .line 276
    move-object v13, v7

    .line 277
    move-object v7, v1

    .line 278
    move-object v1, v14

    .line 279
    move v14, v8

    .line 280
    move-object v8, v1

    .line 281
    move-object/from16 v1, p1

    .line 282
    .line 283
    move/from16 v16, v21

    .line 284
    .line 285
    move/from16 p1, v22

    .line 286
    .line 287
    goto :goto_0

    .line 288
    :cond_0
    move v3, v5

    .line 289
    move v2, v6

    .line 290
    const/4 v7, 0x0

    .line 291
    move/from16 p1, v3

    .line 292
    .line 293
    move/from16 v5, p1

    .line 294
    .line 295
    move v11, v5

    .line 296
    move v15, v11

    .line 297
    move/from16 v16, v15

    .line 298
    .line 299
    move/from16 v17, v16

    .line 300
    .line 301
    move/from16 v18, v17

    .line 302
    .line 303
    move/from16 v19, v18

    .line 304
    .line 305
    move/from16 v20, v19

    .line 306
    .line 307
    move-object/from16 p2, v7

    .line 308
    .line 309
    move-object/from16 v1, p2

    .line 310
    .line 311
    move-object v4, v1

    .line 312
    move-object v8, v4

    .line 313
    move-object v10, v8

    .line 314
    move-object v13, v10

    .line 315
    const v6, 0x7fffffff

    .line 316
    .line 317
    .line 318
    const v9, 0x7fffffff

    .line 319
    .line 320
    .line 321
    const v12, 0x7fffffff

    .line 322
    .line 323
    .line 324
    const v14, 0x7fffffff

    .line 325
    .line 326
    .line 327
    move v3, v2

    .line 328
    :goto_0
    if-gt v3, v2, :cond_1

    .line 329
    .line 330
    iget-object v2, v0, Lv/VListCell;->e:Lv/VLinear;

    .line 331
    .line 332
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 333
    .line 334
    .line 335
    move-result-object v2

    .line 336
    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 337
    .line 338
    move-object/from16 v21, v4

    .line 339
    .line 340
    sget v4, Ll/qa00;->E:I

    .line 341
    .line 342
    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 343
    .line 344
    iget-object v2, v0, Lv/VListCell;->e:Lv/VLinear;

    .line 345
    .line 346
    const/16 v4, 0x10

    .line 347
    .line 348
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 349
    .line 350
    .line 351
    :goto_1
    const v2, 0x7fffffff

    .line 352
    .line 353
    .line 354
    goto :goto_2

    .line 355
    :cond_1
    move-object/from16 v21, v4

    .line 356
    .line 357
    goto :goto_1

    .line 358
    :goto_2
    if-eq v6, v2, :cond_2

    .line 359
    .line 360
    invoke-virtual {v0, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 361
    .line 362
    .line 363
    :cond_2
    if-eqz v7, :cond_3

    .line 364
    .line 365
    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 366
    .line 367
    .line 368
    invoke-virtual {v0, v7}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 369
    .line 370
    .line 371
    :cond_3
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 372
    .line 373
    .line 374
    move-result v2

    .line 375
    iget-object v4, v0, Lv/VListCell;->f:Lv/VText;

    .line 376
    .line 377
    const/16 v6, 0x8

    .line 378
    .line 379
    if-nez v2, :cond_4

    .line 380
    .line 381
    const/4 v2, 0x0

    .line 382
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 383
    .line 384
    .line 385
    iget-object v2, v0, Lv/VListCell;->f:Lv/VText;

    .line 386
    .line 387
    invoke-virtual {v2, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 388
    .line 389
    .line 390
    :goto_3
    const v2, 0x7fffffff

    .line 391
    .line 392
    .line 393
    goto :goto_4

    .line 394
    :cond_4
    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 395
    .line 396
    .line 397
    goto :goto_3

    .line 398
    :goto_4
    if-eq v14, v2, :cond_5

    .line 399
    .line 400
    iget-object v2, v0, Lv/VListCell;->f:Lv/VText;

    .line 401
    .line 402
    invoke-virtual {v2, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 403
    .line 404
    .line 405
    :cond_5
    if-eqz v10, :cond_6

    .line 406
    .line 407
    iget-object v2, v0, Lv/VListCell;->f:Lv/VText;

    .line 408
    .line 409
    invoke-virtual {v2, v10}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 410
    .line 411
    .line 412
    :cond_6
    if-lez v5, :cond_7

    .line 413
    .line 414
    iget-object v2, v0, Lv/VListCell;->f:Lv/VText;

    .line 415
    .line 416
    int-to-float v4, v5

    .line 417
    const/4 v5, 0x0

    .line 418
    invoke-virtual {v2, v5, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 419
    .line 420
    .line 421
    :cond_7
    if-lez v11, :cond_9

    .line 422
    .line 423
    iget-object v2, v0, Lv/VListCell;->f:Lv/VText;

    .line 424
    .line 425
    const/4 v4, 0x4

    .line 426
    if-ne v11, v4, :cond_8

    .line 427
    .line 428
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 429
    .line 430
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 431
    .line 432
    .line 433
    goto :goto_5

    .line 434
    :cond_8
    invoke-static {v11}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 435
    .line 436
    .line 437
    move-result-object v4

    .line 438
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 439
    .line 440
    .line 441
    :cond_9
    :goto_5
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 442
    .line 443
    .line 444
    move-result v2

    .line 445
    iget-object v4, v0, Lv/VListCell;->g:Lv/VText;

    .line 446
    .line 447
    if-eqz v2, :cond_a

    .line 448
    .line 449
    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 450
    .line 451
    .line 452
    :goto_6
    const v2, 0x7fffffff

    .line 453
    .line 454
    .line 455
    goto :goto_7

    .line 456
    :cond_a
    const/4 v2, 0x0

    .line 457
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 458
    .line 459
    .line 460
    iget-object v2, v0, Lv/VListCell;->g:Lv/VText;

    .line 461
    .line 462
    move-object/from16 v7, p2

    .line 463
    .line 464
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 465
    .line 466
    .line 467
    goto :goto_6

    .line 468
    :goto_7
    if-eq v9, v2, :cond_b

    .line 469
    .line 470
    iget-object v2, v0, Lv/VListCell;->g:Lv/VText;

    .line 471
    .line 472
    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 473
    .line 474
    .line 475
    :cond_b
    if-eqz v8, :cond_c

    .line 476
    .line 477
    iget-object v2, v0, Lv/VListCell;->g:Lv/VText;

    .line 478
    .line 479
    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 480
    .line 481
    .line 482
    :cond_c
    if-lez v15, :cond_d

    .line 483
    .line 484
    iget-object v2, v0, Lv/VListCell;->g:Lv/VText;

    .line 485
    .line 486
    int-to-float v4, v15

    .line 487
    const/4 v5, 0x0

    .line 488
    invoke-virtual {v2, v5, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 489
    .line 490
    .line 491
    :cond_d
    if-lez v20, :cond_e

    .line 492
    .line 493
    iget-object v2, v0, Lv/VListCell;->g:Lv/VText;

    .line 494
    .line 495
    invoke-static/range {v20 .. v20}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 496
    .line 497
    .line 498
    move-result-object v4

    .line 499
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 500
    .line 501
    .line 502
    :cond_e
    iget-object v2, v0, Lv/VListCell;->g:Lv/VText;

    .line 503
    .line 504
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 505
    .line 506
    .line 507
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 508
    .line 509
    .line 510
    move-result v2

    .line 511
    iget-object v3, v0, Lv/VListCell;->h:Lv/VText;

    .line 512
    .line 513
    if-eqz v2, :cond_f

    .line 514
    .line 515
    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 516
    .line 517
    .line 518
    :goto_8
    const v2, 0x7fffffff

    .line 519
    .line 520
    .line 521
    goto :goto_9

    .line 522
    :cond_f
    const/4 v2, 0x0

    .line 523
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 524
    .line 525
    .line 526
    iget-object v2, v0, Lv/VListCell;->h:Lv/VText;

    .line 527
    .line 528
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 529
    .line 530
    .line 531
    goto :goto_8

    .line 532
    :goto_9
    if-eq v12, v2, :cond_10

    .line 533
    .line 534
    iget-object v1, v0, Lv/VListCell;->h:Lv/VText;

    .line 535
    .line 536
    invoke-virtual {v1, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 537
    .line 538
    .line 539
    :cond_10
    if-eqz v21, :cond_11

    .line 540
    .line 541
    iget-object v1, v0, Lv/VListCell;->h:Lv/VText;

    .line 542
    .line 543
    move-object/from16 v4, v21

    .line 544
    .line 545
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 546
    .line 547
    .line 548
    :cond_11
    if-lez v19, :cond_12

    .line 549
    .line 550
    iget-object v1, v0, Lv/VListCell;->h:Lv/VText;

    .line 551
    .line 552
    move/from16 v3, v19

    .line 553
    .line 554
    int-to-float v2, v3

    .line 555
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 556
    .line 557
    .line 558
    :cond_12
    if-lez v18, :cond_13

    .line 559
    .line 560
    iget-object v1, v0, Lv/VListCell;->h:Lv/VText;

    .line 561
    .line 562
    invoke-static/range {v18 .. v18}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 563
    .line 564
    .line 565
    move-result-object v2

    .line 566
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 567
    .line 568
    .line 569
    :cond_13
    iget-object v1, v0, Lv/VListCell;->c:Lv/VIcon;

    .line 570
    .line 571
    if-lez v17, :cond_14

    .line 572
    .line 573
    const/4 v2, 0x0

    .line 574
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 575
    .line 576
    .line 577
    iget-object v1, v0, Lv/VListCell;->c:Lv/VIcon;

    .line 578
    .line 579
    move/from16 v3, v17

    .line 580
    .line 581
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 582
    .line 583
    .line 584
    goto :goto_a

    .line 585
    :cond_14
    const/4 v2, 0x0

    .line 586
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 587
    .line 588
    .line 589
    :goto_a
    iget-object v1, v0, Lv/VListCell;->d:Lv/VIcon;

    .line 590
    .line 591
    if-lez v16, :cond_15

    .line 592
    .line 593
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 594
    .line 595
    .line 596
    iget-object v1, v0, Lv/VListCell;->d:Lv/VIcon;

    .line 597
    .line 598
    move/from16 v3, v16

    .line 599
    .line 600
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 601
    .line 602
    .line 603
    goto :goto_b

    .line 604
    :cond_15
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 605
    .line 606
    .line 607
    :goto_b
    if-lez p1, :cond_16

    .line 608
    .line 609
    iget-object v1, v0, Lv/VListCell;->b:Landroid/view/ViewStub;

    .line 610
    .line 611
    move/from16 v3, p1

    .line 612
    .line 613
    invoke-virtual {v1, v3}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 614
    .line 615
    .line 616
    iget-object v1, v0, Lv/VListCell;->b:Landroid/view/ViewStub;

    .line 617
    .line 618
    invoke-virtual {v1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 619
    .line 620
    .line 621
    move-result-object v1

    .line 622
    iput-object v1, v0, Lv/VListCell;->a:Landroid/view/View;

    .line 623
    .line 624
    :cond_16
    invoke-virtual {v0}, Lv/VListCell;->a()V

    .line 625
    .line 626
    .line 627
    return-void
.end method

.method public c(Landroid/graphics/Typeface;I)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lv/VListCell;->f:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getDescribeColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VListCell;->h:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRightView()Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lv/VListCell;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubTitleColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VListCell;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getTitleColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VListCell;->f:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setDescribe(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lv/VListCell;->h:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lv/VListCell;->h:Lv/VText;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lv/VListCell;->a()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public setDescribe(Ljava/lang/CharSequence;)V
    .locals 1

    .line 30
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 31
    iget-object v0, p0, Lv/VListCell;->h:Lv/VText;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    iget-object p1, p0, Lv/VListCell;->h:Lv/VText;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 33
    invoke-virtual {p0}, Lv/VListCell;->a()V

    :cond_0
    return-void
.end method

.method public setDescribeColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VListCell;->h:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDescribeSelector(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VListCell;->h:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setDescribeTypeface(Landroid/graphics/Typeface;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lv/VListCell;->h:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setLeftLargeImage(I)V
    .locals 2

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lv/VListCell;->c:Lv/VIcon;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lv/VListCell;->c:Lv/VIcon;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lv/VListCell;->a()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setLeftSmallImage(I)V
    .locals 2

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lv/VListCell;->d:Lv/VIcon;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lv/VListCell;->d:Lv/VIcon;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lv/VListCell;->a()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setLeftSmallImageGravity(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lv/VListCell;->d:Lv/VIcon;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Lv/VListCell;->d:Lv/VIcon;

    .line 14
    .line 15
    const/high16 v1, 0x41300000    # 11.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {p1, v2}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lv/VListCell;->d:Lv/VIcon;

    .line 25
    .line 26
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-static {p1, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lv/VListCell;->d:Lv/VIcon;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public setRightLayoutRes(I)V
    .locals 1

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lv/VListCell;->b:Landroid/view/ViewStub;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lv/VListCell;->b:Landroid/view/ViewStub;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lv/VListCell;->a:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p0}, Lv/VListCell;->a()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public setSubTitle(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lv/VListCell;->g:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lv/VListCell;->g:Lv/VText;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lv/VListCell;->a()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public setSubTitle(Ljava/lang/CharSequence;)V
    .locals 1

    .line 30
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 31
    iget-object v0, p0, Lv/VListCell;->g:Lv/VText;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    iget-object p1, p0, Lv/VListCell;->g:Lv/VText;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 33
    invoke-virtual {p0}, Lv/VListCell;->a()V

    :cond_0
    return-void
.end method

.method public setSubTitleColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VListCell;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSubTitleSelector(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VListCell;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setSubTitleSize(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VListCell;->g:Lv/VText;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setSubTitleTypeface(Landroid/graphics/Typeface;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lv/VListCell;->g:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSubtitleMaxLines(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VListCell;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-le p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lv/VListCell;->e:Lv/VLinear;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 16
    .line 17
    const/4 v0, -0x2

    .line 18
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 19
    .line 20
    iget-object p0, p0, Lv/VListCell;->e:Lv/VLinear;

    .line 21
    .line 22
    const/16 p1, 0x10

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public setTitle(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lv/VListCell;->f:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lv/VListCell;->f:Lv/VText;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lv/VListCell;->a()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1

    .line 30
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 31
    iget-object v0, p0, Lv/VListCell;->f:Lv/VText;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    iget-object p1, p0, Lv/VListCell;->f:Lv/VText;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 33
    invoke-virtual {p0}, Lv/VListCell;->a()V

    :cond_0
    return-void
.end method

.method public setTitleBottomPadding(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lv/VListCell;->f:Lv/VText;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0, v0, v0, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setTitleColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VListCell;->f:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTitleSelector(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VListCell;->f:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setTitleTypeface(Landroid/graphics/Typeface;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lv/VListCell;->f:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
