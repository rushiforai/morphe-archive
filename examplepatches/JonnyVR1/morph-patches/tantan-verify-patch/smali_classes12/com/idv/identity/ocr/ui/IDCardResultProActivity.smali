.class public Lcom/idv/identity/ocr/ui/IDCardResultProActivity;
.super Lcom/idv/identity/platform/IntlFaceBaseActivity;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;
    }
.end annotation


# instance fields
.field private c:J

.field private d:Z

.field private final e:I

.field private final f:I

.field private final g:I

.field private final h:I

.field private i:I

.field private final j:Ljava/lang/String;

.field protected k:Lcom/idv/identity/platform/iOSLoadingView;

.field public l:Landroid/widget/TextView;

.field private m:Landroid/widget/Button;

.field private n:Landroidx/recyclerview/widget/RecyclerView;

.field public o:Landroid/widget/RelativeLayout;

.field public p:Landroid/widget/ImageView;

.field private q:Ll/gb50;

.field public r:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->c:J

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->d:Z

    .line 12
    .line 13
    const/16 v0, 0x3e8

    .line 14
    .line 15
    iput v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->e:I

    .line 16
    .line 17
    const/16 v0, 0x3e9

    .line 18
    .line 19
    iput v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->f:I

    .line 20
    .line 21
    const/16 v0, 0x3ea

    .line 22
    .line 23
    iput v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->g:I

    .line 24
    .line 25
    const/16 v0, 0x3eb

    .line 26
    .line 27
    iput v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->h:I

    .line 28
    .line 29
    sget v0, Ll/hfm;->j:I

    .line 30
    .line 31
    iput v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->i:I

    .line 32
    .line 33
    const-string v0, "200"

    .line 34
    .line 35
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->j:Ljava/lang/String;

    .line 36
    .line 37
    new-instance v0, Landroid/os/Handler;

    .line 38
    .line 39
    new-instance v1, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V

    .line 42
    .line 43
    .line 44
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->r:Landroid/os/Handler;

    .line 48
    .line 49
    return-void
.end method

.method private B1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->q:Ll/gb50;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-boolean v0, Ll/hfm;->e:Z

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/gb50;->D(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic L0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic N0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->i:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->i:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic O0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->y1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->t1(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->o1(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)Ll/gb50;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->q:Ll/gb50;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic S0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->d:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic T0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->h1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->d1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->u1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private d1()V
    .locals 0

    .line 1
    return-void
.end method

.method private f1(Ljava/lang/String;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->c:J

    .line 11
    .line 12
    sub-long/2addr v1, v3

    .line 13
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "ms"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 30
    .line 31
    const-string v4, "OCR_RESULT_EXIT"

    .line 32
    .line 33
    const-string v5, "OCR_RESULT"

    .line 34
    .line 35
    move-object v7, p1

    .line 36
    invoke-virtual/range {v2 .. v7}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->finish()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private h1()V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$k;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$k;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private j1()V
    .locals 5

    .line 1
    sget v0, Ll/rcc0;->R0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-static {}, Ll/azb;->m()Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    sget v0, Ll/rcc0;->d1:I

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/widget/TextView;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    sget-object v1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 29
    .line 30
    sget v2, Ll/y9c0;->b:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultTitleColor(I)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    :cond_1
    sget v0, Ll/rcc0;->C0:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroid/widget/Button;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->m:Landroid/widget/Button;

    .line 48
    .line 49
    sget v0, Ll/rcc0;->o:I

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 58
    .line 59
    sget v0, Ll/rcc0;->O0:I

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/idv/identity/platform/iOSLoadingView;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->k:Lcom/idv/identity/platform/iOSLoadingView;

    .line 68
    .line 69
    sget v0, Ll/rcc0;->f1:I

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Landroid/widget/TextView;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->l:Landroid/widget/TextView;

    .line 78
    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    sget-object v1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 82
    .line 83
    sget v2, Ll/y9c0;->b:I

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultTipColor(I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    :cond_2
    sget v0, Ll/rcc0;->b1:I

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 99
    .line 100
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->o:Landroid/widget/RelativeLayout;

    .line 101
    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    sget-boolean v1, Ll/hfm;->e:Z

    .line 105
    .line 106
    if-eqz v1, :cond_3

    .line 107
    .line 108
    const/4 v1, 0x0

    .line 109
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_3
    const/16 v1, 0x8

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 116
    .line 117
    .line 118
    :cond_4
    :goto_0
    sget v0, Ll/rcc0;->S0:I

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Landroid/widget/ImageView;

    .line 125
    .line 126
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->p:Landroid/widget/ImageView;

    .line 127
    .line 128
    if-eqz v0, :cond_5

    .line 129
    .line 130
    invoke-static {}, Ll/azb;->i()Landroid/graphics/Bitmap;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    if-eqz v0, :cond_5

    .line 135
    .line 136
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->p:Landroid/widget/ImageView;

    .line 137
    .line 138
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 139
    .line 140
    .line 141
    :cond_5
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->k1()V

    .line 142
    .line 143
    .line 144
    sget v0, Ll/rcc0;->o:I

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 151
    .line 152
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 153
    .line 154
    new-instance v0, Ljava/util/ArrayList;

    .line 155
    .line 156
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .line 158
    .line 159
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 160
    .line 161
    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 162
    .line 163
    .line 164
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    invoke-virtual {v2}, Ll/afm;->Q()Ljava/util/Map;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    iget-object v3, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->l:Landroid/widget/TextView;

    .line 173
    .line 174
    if-eqz v2, :cond_7

    .line 175
    .line 176
    sget v4, Lcom/idv/identity/base/R$string;->m0:I

    .line 177
    .line 178
    invoke-virtual {p0, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    .line 184
    .line 185
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    :cond_6
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    if-eqz v3, :cond_8

    .line 198
    .line 199
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    check-cast v3, Ljava/util/Map$Entry;

    .line 204
    .line 205
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result v4

    .line 213
    if-nez v4, :cond_6

    .line 214
    .line 215
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    check-cast v4, Ljava/lang/String;

    .line 220
    .line 221
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    goto :goto_1

    .line 229
    :cond_7
    sget v2, Lcom/idv/identity/base/R$string;->J0:I

    .line 230
    .line 231
    invoke-virtual {p0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 236
    .line 237
    .line 238
    :cond_8
    sget-boolean v2, Ll/hfm;->d:Z

    .line 239
    .line 240
    if-eqz v2, :cond_a

    .line 241
    .line 242
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    invoke-virtual {v2}, Ll/afm;->P()Ljava/util/Map;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    invoke-interface {v1, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 251
    .line 252
    .line 253
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    invoke-virtual {v2}, Ll/afm;->N()Ljava/util/Map;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    if-eqz v2, :cond_a

    .line 262
    .line 263
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    :cond_9
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 272
    .line 273
    .line 274
    move-result v3

    .line 275
    if-eqz v3, :cond_a

    .line 276
    .line 277
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v3

    .line 281
    check-cast v3, Ljava/util/Map$Entry;

    .line 282
    .line 283
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v4

    .line 287
    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result v4

    .line 291
    if-nez v4, :cond_9

    .line 292
    .line 293
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v4

    .line 297
    check-cast v4, Ljava/lang/String;

    .line 298
    .line 299
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object v3

    .line 303
    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    goto :goto_2

    .line 307
    :cond_a
    new-instance v2, Ljava/lang/StringBuilder;

    .line 308
    .line 309
    const-string v3, "ocrCardProInfo:"

    .line 310
    .line 311
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    const-string v3, "TAG"

    .line 322
    .line 323
    invoke-static {v3, v2}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 331
    .line 332
    .line 333
    move-result-object v1

    .line 334
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 335
    .line 336
    .line 337
    move-result v2

    .line 338
    if-eqz v2, :cond_b

    .line 339
    .line 340
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    check-cast v2, Ljava/util/Map$Entry;

    .line 345
    .line 346
    new-instance v3, Ll/e3q;

    .line 347
    .line 348
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v4

    .line 352
    check-cast v4, Ljava/lang/String;

    .line 353
    .line 354
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    invoke-direct {v3, v4, v2}, Ll/e3q;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    goto :goto_3

    .line 369
    :cond_b
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 370
    .line 371
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 372
    .line 373
    invoke-direct {v2, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 377
    .line 378
    .line 379
    new-instance v1, Ll/gb50;

    .line 380
    .line 381
    invoke-direct {v1, v0}, Ll/gb50;-><init>(Ljava/util/List;)V

    .line 382
    .line 383
    .line 384
    iput-object v1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->q:Ll/gb50;

    .line 385
    .line 386
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 387
    .line 388
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 389
    .line 390
    .line 391
    return-void
.end method

.method private l1()V
    .locals 5

    .line 1
    sget v0, Ll/rcc0;->C:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/rcc0;->i1:I

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, Ll/rcc0;->b1:I

    .line 14
    .line 15
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object v3, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 24
    .line 25
    sget v4, Ll/y9c0;->f:I

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultTipBGColor(I)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 32
    .line 33
    .line 34
    new-instance v3, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$e;

    .line 35
    .line 36
    invoke-direct {v3, p0, v1, v2}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$e;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;Landroid/view/View;Landroid/widget/RelativeLayout;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    if-eqz v0, :cond_1

    .line 43
    .line 44
    new-instance v1, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$f;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$f;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->v1()V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->m:Landroid/widget/Button;

    .line 56
    .line 57
    new-instance v1, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$g;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$g;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method private o1(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->r:Landroid/os/Handler;

    .line 2
    .line 3
    const/16 v1, 0x3e8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p1}, Ll/afm;->e(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->f1(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private t1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x3e9

    .line 6
    .line 7
    iput v1, v0, Landroid/os/Message;->what:I

    .line 8
    .line 9
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->r:Landroid/os/Handler;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private u1()V
    .locals 4

    .line 1
    sget v0, Ll/hfm;->m:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->r:Landroid/os/Handler;

    .line 4
    .line 5
    const/16 v1, 0x3eb

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    sget v0, Ll/hfm;->n:I

    .line 10
    .line 11
    mul-int/lit8 v0, v0, 0x3c

    .line 12
    .line 13
    int-to-long v2, v0

    .line 14
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget v2, Ll/hfm;->n:I

    .line 19
    .line 20
    mul-int/2addr v0, v2

    .line 21
    int-to-long v2, v0

    .line 22
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private y1()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->f0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/idv/identity/base/R$string;->Q:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    new-instance v8, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$a;

    .line 22
    .line 23
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$a;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V

    .line 24
    .line 25
    .line 26
    const-string v4, ""

    .line 27
    .line 28
    const/4 v6, 0x0

    .line 29
    const-string v7, "ocr_over_time_code"

    .line 30
    .line 31
    move-object v2, p0

    .line 32
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->w1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private z1(Z)Z
    .locals 4

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.idv.identity.face.IdentityFaceApi"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "start"

    .line 12
    .line 13
    const-class v2, Landroid/content/Context;

    .line 14
    .line 15
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 16
    .line 17
    filled-new-array {v2, v3}, [Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-virtual {v0, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    return p0

    .line 45
    :catch_0
    move-exception p0

    .line 46
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 54
    .line 55
    const-string v1, "exception"

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v2, "status"

    .line 62
    .line 63
    const-string v3, "catchException"

    .line 64
    .line 65
    filled-new-array {v2, v3, v1, p0}, [Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string v1, "startFace"

    .line 70
    .line 71
    invoke-virtual {p1, v0, v1, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    return p0
.end method


# virtual methods
.method public C1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget-object v1, Ll/ffm;->f:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->s1()V

    .line 28
    .line 29
    .line 30
    :cond_2
    :goto_0
    return-void
.end method

.method public X0()V
    .locals 9

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "exitVerifyBtn"

    .line 8
    .line 9
    const-string v3, "OCR_RESULT"

    .line 10
    .line 11
    const-string v4, "PAGER_BEHAVIOR"

    .line 12
    .line 13
    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Lcom/idv/identity/base/R$string;->T:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Lcom/idv/identity/base/R$string;->Q:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Lcom/idv/identity/base/R$string;->N:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    new-instance v8, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$h;

    .line 47
    .line 48
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$h;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V

    .line 49
    .line 50
    .line 51
    const-string v4, ""

    .line 52
    .line 53
    const-string v7, "ORC_RES_PAGE_EXIT_CODE"

    .line 54
    .line 55
    move-object v2, p0

    .line 56
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->w1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public Y0()V
    .locals 0

    .line 1
    return-void
.end method

.method public a1(Z)V
    .locals 2

    .line 1
    sget v0, Ll/rcc0;->C0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/Button;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 12
    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget-object p1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 17
    .line 18
    sget v0, Ll/y9c0;->j:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultConfirmBtnEnabledTitleColor(I)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    instance-of v0, p1, Landroid/graphics/drawable/GradientDrawable;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    .line 39
    .line 40
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 41
    .line 42
    sget v1, Ll/y8c0;->b:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultConfirmBtnEnabledBGColor(I)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    sget-object p1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 56
    .line 57
    sget v0, Ll/y9c0;->j:I

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultConfirmBtnDisabledTitleColor(I)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    instance-of v0, p1, Landroid/graphics/drawable/GradientDrawable;

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    .line 75
    .line 76
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 77
    .line 78
    sget v1, Ll/y8c0;->i:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultConfirmBtnDisabledBGColor(I)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    return-void
.end method

.method public k1()V
    .locals 2

    .line 1
    sget v0, Ll/rcc0;->a:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/idv/identity/ocr/widget/CardPreviewWidget;

    .line 8
    .line 9
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/afm;->u()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x2

    .line 18
    if-lt v0, v1, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/afm;->Y()Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ll/afm;->U()Landroid/graphics/Bitmap;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p0, v0, v1}, Lcom/idv/identity/ocr/widget/CardPreviewWidget;->d(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/afm;->Y()Landroid/graphics/Bitmap;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/widget/CardPreviewWidget;->e(Landroid/graphics/Bitmap;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public m1(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->n1(Ljava/util/Map;Z[B)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n1(Ljava/util/Map;Z[B)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z[B)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->k:Lcom/idv/identity/platform/iOSLoadingView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    new-instance v2, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j;

    .line 12
    .line 13
    invoke-direct {v2, p0, v0, v1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;J)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, p2, p3, v2}, Ll/qk20;->g(Ljava/util/Map;Z[BLl/kfm;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onBackPressed()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->T:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/idv/identity/base/R$string;->Q:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/idv/identity/base/R$string;->N:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    new-instance v8, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$l;

    .line 32
    .line 33
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$l;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V

    .line 34
    .line 35
    .line 36
    const-string v4, ""

    .line 37
    .line 38
    const-string v7, "ORC_RES_PAGE_EXIT_CODE"

    .line 39
    .line 40
    move-object v2, p0

    .line 41
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->w1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/dec0;->d:I

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroidx/activity/ComponentActivity;->setContentView(I)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->c:J

    .line 14
    .line 15
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 20
    .line 21
    const-string v1, "OCR_RESULT_ENTER"

    .line 22
    .line 23
    const-string v2, "OCR_RESULT"

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->j1()V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->l1()V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->u1()V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->B1()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onDestroy()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->r:Landroid/os/Handler;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->c:J

    .line 20
    .line 21
    sub-long/2addr v1, v3

    .line 22
    long-to-double v1, v1

    .line 23
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    div-double/2addr v1, v3

    .line 29
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, "s"

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 50
    .line 51
    const-string v2, "timeCost"

    .line 52
    .line 53
    filled-new-array {v2, p0}, [Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v2, "destroyIDCardResultActivity"

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/idv/identity/platform/log/RecordService;->flush()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public p1(Landroid/os/Message;)V
    .locals 1

    .line 1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Ll/afm;->e(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->f1(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public q1()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->X:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/idv/identity/base/R$string;->P:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/idv/identity/base/R$string;->R:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget v1, Lcom/idv/identity/base/R$string;->O:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    new-instance v8, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$b;

    .line 42
    .line 43
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$b;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V

    .line 44
    .line 45
    .line 46
    const-string v7, "ORC_RES_PAGE_NET_ERROR_CODE"

    .line 47
    .line 48
    move-object v2, p0

    .line 49
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->w1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public r1()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->J:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/idv/identity/base/R$string;->C0:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/idv/identity/base/R$string;->R:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    new-instance v8, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$c;

    .line 32
    .line 33
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$c;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V

    .line 34
    .line 35
    .line 36
    const/4 v6, 0x0

    .line 37
    const-string v7, "ocr_out_time_code"

    .line 38
    .line 39
    move-object v2, p0

    .line 40
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->w1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public s1()V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->z1(Z)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const-string v1, "success"

    .line 7
    .line 8
    const-string v2, "status"

    .line 9
    .line 10
    const-string v3, "onClickStartFaceView"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 19
    .line 20
    filled-new-array {v2, v1}, [Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v4, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 33
    .line 34
    const-string v5, "error"

    .line 35
    .line 36
    filled-new-array {v2, v5}, [Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v4, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    invoke-direct {p0, v1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->f1(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public v1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->m:Landroid/widget/Button;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    sget-object v1, Ll/hfm;->f:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    sget-object p0, Ll/hfm;->f:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->a1(Z)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public w1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;)V
    .locals 3

    .line 1
    const-string v0, "OCR_RESULT"

    .line 2
    .line 3
    invoke-static {p5, v0}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertAppear(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->d:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->a1(Z)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->d:Z

    .line 17
    .line 18
    sget v2, Ll/rcc0;->b:I

    .line 19
    .line 20
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 25
    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    invoke-virtual {v2, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setTitleText(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, p2}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setMessageText(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    if-eqz p4, :cond_1

    .line 35
    .line 36
    invoke-virtual {v2, p4}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCancelText(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {v2, v0}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 44
    .line 45
    .line 46
    :goto_0
    invoke-virtual {v2, p3}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setConfirmText(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    invoke-static {p5}, Ll/azb;->t(Ljava/lang/String;)Ll/azb$a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {v2, p1}, Ll/azb;->a(Lcom/idv/identity/platform/IdentityAlertOverlay;Ll/azb$a;)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;

    .line 60
    .line 61
    invoke-direct {p1, p0, p5, p6}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;-><init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;Ljava/lang/String;Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCommAlertOverlayListener(Lcom/idv/identity/platform/IdentityAlertOverlay$d;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    :goto_1
    return-void
.end method
