.class public Ltech/sud/runtime/component/e/d;
.super Landroid/widget/ScrollView;
.source "SourceFile"


# instance fields
.field private final a:Ltech/sud/runtime/component/e/c;

.field private b:I

.field private c:D

.field private d:D

.field private final e:F

.field private final f:Ltech/sud/runtime/core/g;

.field private final g:Ltech/sud/runtime/component/e/c$a;

.field private h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltech/sud/runtime/core/g;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ltech/sud/runtime/component/e/d;->b:I

    .line 6
    .line 7
    new-instance v1, Ltech/sud/runtime/component/e/c$a;

    .line 8
    .line 9
    invoke-direct {v1}, Ltech/sud/runtime/component/e/c$a;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ltech/sud/runtime/component/e/d;->g:Ltech/sud/runtime/component/e/c$a;

    .line 13
    .line 14
    iput-boolean v0, p0, Ltech/sud/runtime/component/e/d;->h:Z

    .line 15
    .line 16
    iput-object p2, p0, Ltech/sud/runtime/component/e/d;->f:Ltech/sud/runtime/core/g;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 31
    .line 32
    iput v1, p0, Ltech/sud/runtime/component/e/d;->e:F

    .line 33
    .line 34
    new-instance v1, Ltech/sud/runtime/component/e/c;

    .line 35
    .line 36
    invoke-direct {v1, p1, p2}, Ltech/sud/runtime/component/e/c;-><init>(Landroid/content/Context;Ltech/sud/runtime/core/g;)V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Ltech/sud/runtime/component/e/d;->a:Ltech/sud/runtime/component/e/c;

    .line 40
    .line 41
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 42
    .line 43
    const/4 p2, -0x2

    .line 44
    invoke-direct {p1, p2, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x4

    .line 57
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private a(DD)V
    .locals 6

    .line 273
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 274
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    const/4 v2, -0x1

    mul-int/2addr v1, v2

    .line 275
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    mul-int/2addr v3, v2

    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    add-double/2addr p1, v4

    double-to-int p1, p1

    add-int/2addr v1, p1

    double-to-int p1, p3

    add-int/2addr v3, p1

    .line 276
    invoke-virtual {v0, v1, v3, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 277
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 278
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 5

    .line 282
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 283
    const-string p1, "y"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    move-result-wide v1

    iget p1, p0, Ltech/sud/runtime/component/e/d;->e:F

    float-to-double v3, p1

    mul-double/2addr v1, v3

    .line 284
    const-string p1, "height"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 285
    iget-wide v3, p0, Ltech/sud/runtime/component/e/d;->c:D

    invoke-direct {p0, v3, v4, v1, v2}, Ltech/sud/runtime/component/e/d;->a(DD)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 286
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method public a(Ljava/lang/String;I)V
    .locals 2

    const/high16 v0, -0x1000000

    and-int v1, p2, v0

    if-nez v1, :cond_0

    or-int/2addr p2, v0

    .line 279
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/e/d;->a:Ltech/sud/runtime/component/e/c;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 280
    iget-object p2, p0, Ltech/sud/runtime/component/e/d;->a:Ltech/sud/runtime/component/e/c;

    invoke-virtual {p2, p1}, Ltech/sud/runtime/component/e/c;->a(Ljava/lang/String;)V

    .line 281
    iget-object p0, p0, Ltech/sud/runtime/component/e/d;->a:Ltech/sud/runtime/component/e/c;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    return-void
.end method

.method public a(Ljava/lang/String;IFFZ)V
    .locals 5

    .line 1
    const-string p3, "lineHeight"

    .line 2
    .line 3
    iput p2, p0, Ltech/sud/runtime/component/e/d;->b:I

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    :try_start_0
    new-instance p4, Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-direct {p4, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ltech/sud/runtime/component/e/d;->g:Ltech/sud/runtime/component/e/c$a;

    .line 12
    .line 13
    const-string v0, "inputType"

    .line 14
    .line 15
    invoke-virtual {p4, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p1, Ltech/sud/runtime/component/e/c$a;->f:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p1, p0, Ltech/sud/runtime/component/e/d;->g:Ltech/sud/runtime/component/e/c$a;

    .line 22
    .line 23
    const-string v0, "maxLength"

    .line 24
    .line 25
    invoke-virtual {p4, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p1, Ltech/sud/runtime/component/e/c$a;->g:I

    .line 30
    .line 31
    const-string p1, "text"

    .line 32
    .line 33
    invoke-virtual {p4, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "x"

    .line 38
    .line 39
    invoke-virtual {p4, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    iget v2, p0, Ltech/sud/runtime/component/e/d;->e:F

    .line 44
    .line 45
    float-to-double v2, v2

    .line 46
    mul-double/2addr v0, v2

    .line 47
    iput-wide v0, p0, Ltech/sud/runtime/component/e/d;->c:D

    .line 48
    .line 49
    const-string v0, "y"

    .line 50
    .line 51
    invoke-virtual {p4, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    iget v2, p0, Ltech/sud/runtime/component/e/d;->e:F

    .line 56
    .line 57
    float-to-double v2, v2

    .line 58
    mul-double/2addr v0, v2

    .line 59
    iput-wide v0, p0, Ltech/sud/runtime/component/e/d;->d:D

    .line 60
    .line 61
    iget-object v0, p0, Ltech/sud/runtime/component/e/d;->g:Ltech/sud/runtime/component/e/c$a;

    .line 62
    .line 63
    const-string v1, "w"

    .line 64
    .line 65
    invoke-virtual {p4, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 66
    .line 67
    .line 68
    move-result-wide v1

    .line 69
    double-to-float v1, v1

    .line 70
    iget v2, p0, Ltech/sud/runtime/component/e/d;->e:F

    .line 71
    .line 72
    mul-float/2addr v1, v2

    .line 73
    iput v1, v0, Ltech/sud/runtime/component/e/c$a;->a:F

    .line 74
    .line 75
    iget-object v0, p0, Ltech/sud/runtime/component/e/d;->g:Ltech/sud/runtime/component/e/c$a;

    .line 76
    .line 77
    const-string v1, "h"

    .line 78
    .line 79
    invoke-virtual {p4, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 80
    .line 81
    .line 82
    move-result-wide v1

    .line 83
    double-to-float v1, v1

    .line 84
    iget v2, p0, Ltech/sud/runtime/component/e/d;->e:F

    .line 85
    .line 86
    mul-float/2addr v1, v2

    .line 87
    iput v1, v0, Ltech/sud/runtime/component/e/c$a;->b:F

    .line 88
    .line 89
    iget-object v0, p0, Ltech/sud/runtime/component/e/d;->g:Ltech/sud/runtime/component/e/c$a;

    .line 90
    .line 91
    const-string v1, "font_size"

    .line 92
    .line 93
    invoke-virtual {p4, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 94
    .line 95
    .line 96
    move-result-wide v1

    .line 97
    double-to-float v1, v1

    .line 98
    iget v2, p0, Ltech/sud/runtime/component/e/d;->e:F

    .line 99
    .line 100
    mul-float/2addr v1, v2

    .line 101
    iput v1, v0, Ltech/sud/runtime/component/e/c$a;->c:F

    .line 102
    .line 103
    const-string v0, "font_color"

    .line 104
    .line 105
    invoke-virtual {p4, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    const/high16 v1, -0x1000000

    .line 110
    .line 111
    and-int v2, v0, v1

    .line 112
    .line 113
    if-nez v2, :cond_0

    .line 114
    .line 115
    or-int/2addr v0, v1

    .line 116
    :cond_0
    const-string v1, "textAlign"

    .line 117
    .line 118
    invoke-virtual {p4, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    const-string v2, "verticalAlign"

    .line 123
    .line 124
    invoke-virtual {p4, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    const-string v3, "center"

    .line 129
    .line 130
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    if-eqz v3, :cond_1

    .line 135
    .line 136
    move v1, p2

    .line 137
    goto :goto_0

    .line 138
    :cond_1
    const-string v3, "right"

    .line 139
    .line 140
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-eqz v1, :cond_2

    .line 145
    .line 146
    const v1, 0x800005

    .line 147
    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_2
    const v1, 0x800003

    .line 151
    .line 152
    .line 153
    :goto_0
    const-string v3, "middle"

    .line 154
    .line 155
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    if-eqz v3, :cond_3

    .line 160
    .line 161
    or-int/lit8 v1, v1, 0x10

    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_3
    const-string v3, "bottom"

    .line 165
    .line 166
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    if-eqz v2, :cond_4

    .line 171
    .line 172
    or-int/lit8 v1, v1, 0x50

    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_4
    or-int/lit8 v1, v1, 0x30

    .line 176
    .line 177
    :goto_1
    iget-object v2, p0, Ltech/sud/runtime/component/e/d;->g:Ltech/sud/runtime/component/e/c$a;

    .line 178
    .line 179
    iput v1, v2, Ltech/sud/runtime/component/e/c$a;->d:I

    .line 180
    .line 181
    iput-boolean p5, v2, Ltech/sud/runtime/component/e/c$a;->e:Z

    .line 182
    .line 183
    invoke-virtual {p4, p3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 184
    .line 185
    .line 186
    move-result-wide p4

    .line 187
    iget v1, p0, Ltech/sud/runtime/component/e/d;->e:F

    .line 188
    .line 189
    float-to-double v3, v1

    .line 190
    mul-double/2addr p4, v3

    .line 191
    double-to-float p4, p4

    .line 192
    iput p4, v2, Ltech/sud/runtime/component/e/c$a;->h:F

    .line 193
    .line 194
    new-instance p4, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 197
    .line 198
    .line 199
    iget-object p5, p0, Ltech/sud/runtime/component/e/d;->g:Ltech/sud/runtime/component/e/c$a;

    .line 200
    .line 201
    iget p5, p5, Ltech/sud/runtime/component/e/c$a;->h:F

    .line 202
    .line 203
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    const-string p5, ""

    .line 207
    .line 208
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p4

    .line 215
    invoke-static {p3, p4}, Ltech/sud/runtime/component/h/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    iget-wide p3, p0, Ltech/sud/runtime/component/e/d;->c:D

    .line 219
    .line 220
    iget-wide v1, p0, Ltech/sud/runtime/component/e/d;->d:D

    .line 221
    .line 222
    invoke-direct {p0, p3, p4, v1, v2}, Ltech/sud/runtime/component/e/d;->a(DD)V

    .line 223
    .line 224
    .line 225
    iget-object p3, p0, Ltech/sud/runtime/component/e/d;->a:Ltech/sud/runtime/component/e/c;

    .line 226
    .line 227
    iget-object p4, p0, Ltech/sud/runtime/component/e/d;->g:Ltech/sud/runtime/component/e/c$a;

    .line 228
    .line 229
    invoke-virtual {p3, p1, p4}, Ltech/sud/runtime/component/e/c;->a(Ljava/lang/String;Ltech/sud/runtime/component/e/c$a;)V

    .line 230
    .line 231
    .line 232
    iget-object p1, p0, Ltech/sud/runtime/component/e/d;->a:Ltech/sud/runtime/component/e/c;

    .line 233
    .line 234
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 235
    .line 236
    .line 237
    const/4 p1, 0x0

    .line 238
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 239
    .line 240
    .line 241
    iget-object p3, p0, Ltech/sud/runtime/component/e/d;->a:Ltech/sud/runtime/component/e/c;

    .line 242
    .line 243
    invoke-virtual {p3}, Landroid/view/View;->requestFocus()Z

    .line 244
    .line 245
    .line 246
    iget-object p3, p0, Ltech/sud/runtime/component/e/d;->a:Ltech/sud/runtime/component/e/c;

    .line 247
    .line 248
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 249
    .line 250
    .line 251
    move-result-object p3

    .line 252
    const-string p4, "input_method"

    .line 253
    .line 254
    invoke-virtual {p3, p4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object p3

    .line 258
    check-cast p3, Landroid/view/inputmethod/InputMethodManager;

    .line 259
    .line 260
    iget-object p4, p0, Ltech/sud/runtime/component/e/d;->a:Ltech/sud/runtime/component/e/c;

    .line 261
    .line 262
    invoke-virtual {p3, p4, p1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    .line 264
    .line 265
    goto :goto_2

    .line 266
    :catch_0
    move-exception p1

    .line 267
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 268
    .line 269
    .line 270
    :goto_2
    iput-boolean p2, p0, Ltech/sud/runtime/component/e/d;->h:Z

    .line 271
    .line 272
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ltech/sud/runtime/component/e/d;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Ltech/sud/runtime/component/e/d;->h:Z

    .line 8
    .line 9
    iget-object v1, p0, Ltech/sud/runtime/component/e/d;->a:Ltech/sud/runtime/component/e/c;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "input_method"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 22
    .line 23
    iget-object v2, p0, Ltech/sud/runtime/component/e/d;->a:Ltech/sud/runtime/component/e/c;

    .line 24
    .line 25
    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x4

    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ltech/sud/runtime/component/e/d;->f:Ltech/sud/runtime/core/g;

    .line 37
    .line 38
    iget p0, p0, Ltech/sud/runtime/component/e/d;->b:I

    .line 39
    .line 40
    const/4 v1, 0x7

    .line 41
    invoke-virtual {v0, v1, p0}, Ltech/sud/runtime/core/g;->b(II)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltech/sud/runtime/component/e/d;->h:Z

    .line 2
    .line 3
    return p0
.end method
