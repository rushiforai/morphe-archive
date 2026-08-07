.class public Ll/r230$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r230$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r230;->E(Lcom/facebook/drawee/view/SimpleDraweeView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public final synthetic b:Ll/r230;


# direct methods
.method public constructor <init>(Ll/r230;Lcom/facebook/drawee/view/SimpleDraweeView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/r230$a;->b:Ll/r230;

    .line 2
    .line 3
    iput-object p2, p0, Ll/r230$a;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Ll/r230$a;Lcom/facebook/imagepipeline/request/ImageRequestBuilder;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r230$a;->c(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;)V

    return-void
.end method


# virtual methods
.method public a(Ll/q3d0;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 2
    .line 3
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/r230$a;->b:Ll/r230;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {v1}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/r230$a;->b:Ll/r230;

    .line 22
    .line 23
    invoke-static {v1}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Ll/r230$j;->h(Ll/r230$j;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget-object v2, p0, Ll/r230$a;->b:Ll/r230;

    .line 32
    .line 33
    invoke-static {v2}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v2, v2, Ll/r230$f;->b:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v3, p0, Ll/r230$a;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 40
    .line 41
    invoke-static {v1, v2, v3, p1}, Ll/r230;->t(ZLjava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/q3d0;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    invoke-static {v1}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v0, v0, Ll/r230$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Ll/r230$a;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 57
    .line 58
    invoke-static {v0, p1}, Ll/wim;->a(Landroid/view/View;Ll/q3d0;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v1, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast v1, Ljava/lang/Integer;

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_2

    .line 71
    .line 72
    iget-object v1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v1, Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    iget-object v2, p0, Ll/r230$a;->b:Ll/r230;

    .line 81
    .line 82
    if-eqz v1, :cond_1

    .line 83
    .line 84
    invoke-static {v2}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iget-object v1, v1, Ll/r230$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 89
    .line 90
    const/4 v2, 0x2

    .line 91
    iput v2, v1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    invoke-static {v2}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget-object v1, v1, Ll/r230$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 99
    .line 100
    const/4 v2, 0x1

    .line 101
    iput v2, v1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    .line 102
    .line 103
    :goto_0
    iget-object v1, p0, Ll/r230$a;->b:Ll/r230;

    .line 104
    .line 105
    invoke-static {v1}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iget-object v1, v1, Ll/r230$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 110
    .line 111
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 112
    .line 113
    check-cast v0, Ljava/lang/Integer;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    invoke-static {v0}, Ll/wim;->c(I)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput v0, v1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 124
    .line 125
    :cond_2
    :goto_1
    new-instance v9, Ll/q230;

    .line 126
    .line 127
    invoke-direct {v9, p0}, Ll/q230;-><init>(Ll/r230$a;)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 131
    .line 132
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-static {v0}, Ll/r230$j;->d(Ll/r230$j;)Ll/fn2;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iget-object v1, p0, Ll/r230$a;->b:Ll/r230;

    .line 141
    .line 142
    invoke-static {v1}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    new-instance v2, Ll/r230$a$a;

    .line 147
    .line 148
    invoke-direct {v2, p0, v0}, Ll/r230$a$a;-><init>(Ll/r230$a;Ll/fn2;)V

    .line 149
    .line 150
    .line 151
    invoke-static {v1, v2}, Ll/r230$j;->j(Ll/r230$j;Ll/fn2;)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 155
    .line 156
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iget-object v0, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-nez v0, :cond_3

    .line 167
    .line 168
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 169
    .line 170
    iget-object v3, p0, Ll/r230$a;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 171
    .line 172
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 173
    .line 174
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iget-object v4, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 179
    .line 180
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 181
    .line 182
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-static {v0}, Ll/r230$j;->f(Ll/r230$j;)Z

    .line 187
    .line 188
    .line 189
    move-result v5

    .line 190
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 191
    .line 192
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    iget-boolean v6, v0, Ll/r230$j;->k:Z

    .line 197
    .line 198
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 199
    .line 200
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-static {v0}, Ll/r230$j;->d(Ll/r230$j;)Ll/fn2;

    .line 205
    .line 206
    .line 207
    move-result-object v8

    .line 208
    move-object v7, p1

    .line 209
    invoke-virtual/range {v2 .. v9}, Ll/fsb0;->U0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;Ll/y20;)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 214
    .line 215
    iget-object p0, p0, Ll/r230$a;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 216
    .line 217
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    iget-object v1, v1, Ll/r230$f;->a:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {v0, p1, p0, v1}, Ll/r230;->h(Ll/r230;Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/view/View;Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    return-void

    .line 227
    :cond_3
    move-object v7, p1

    .line 228
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 229
    .line 230
    iget-object v3, p0, Ll/r230$a;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 231
    .line 232
    iget-object p1, p0, Ll/r230$a;->b:Ll/r230;

    .line 233
    .line 234
    invoke-static {p1}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    iget-object v4, p1, Ll/r230$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 239
    .line 240
    iget-object p1, p0, Ll/r230$a;->b:Ll/r230;

    .line 241
    .line 242
    invoke-static {p1}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    invoke-static {p1}, Ll/r230$j;->f(Ll/r230$j;)Z

    .line 247
    .line 248
    .line 249
    move-result v5

    .line 250
    iget-object p1, p0, Ll/r230$a;->b:Ll/r230;

    .line 251
    .line 252
    invoke-static {p1}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    iget-boolean v6, p1, Ll/r230$j;->k:Z

    .line 257
    .line 258
    iget-object p1, p0, Ll/r230$a;->b:Ll/r230;

    .line 259
    .line 260
    invoke-static {p1}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    invoke-static {p1}, Ll/r230$j;->d(Ll/r230$j;)Ll/fn2;

    .line 265
    .line 266
    .line 267
    move-result-object v8

    .line 268
    invoke-virtual/range {v2 .. v9}, Ll/fsb0;->T0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;ZZLl/q3d0;Ll/fn2;Ll/y20;)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 273
    .line 274
    iget-object p0, p0, Ll/r230$a;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 275
    .line 276
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    iget-object v1, v1, Ll/r230$f;->a:Ljava/lang/String;

    .line 281
    .line 282
    invoke-static {v0, p1, p0, v1}, Ll/r230;->h(Ll/r230;Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/view/View;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    return-void
.end method

.method public final synthetic c(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 2
    .line 3
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/r230$j;->i(Ll/r230$j;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/phm;->b()Ll/qhm;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/qhm;->p(Landroid/graphics/Bitmap$Config;)Ll/qhm;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/qhm;->a()Ll/phm;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->G(Ll/phm;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 31
    .line 32
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Ll/r230$j;->g(Ll/r230$j;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p0, Ll/r230$a;->b:Ll/r230;

    .line 43
    .line 44
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Ll/r230$j;->c(Ll/r230$j;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return-void

    .line 56
    :cond_2
    :goto_0
    new-instance v0, Ll/bkq;

    .line 57
    .line 58
    iget-object v1, p0, Ll/r230$a;->b:Ll/r230;

    .line 59
    .line 60
    invoke-static {v1}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {v1}, Ll/r230$j;->g(Ll/r230$j;)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iget-object p0, p0, Ll/r230$a;->b:Ll/r230;

    .line 69
    .line 70
    invoke-static {p0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0}, Ll/r230$j;->c(Ll/r230$j;)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-direct {v0, v1, p0}, Ll/bkq;-><init>(II)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->K(Ll/fm80;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 82
    .line 83
    .line 84
    return-void
.end method
