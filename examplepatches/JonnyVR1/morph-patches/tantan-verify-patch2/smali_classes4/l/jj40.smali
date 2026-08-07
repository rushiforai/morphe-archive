.class public Ll/jj40;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

.field public static b:I

.field public static c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;",
            ">;"
        }
    .end annotation
.end field

.field public static d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ij40;",
            ">;"
        }
    .end annotation
.end field

.field public static f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    sput-object v0, Ll/jj40;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    sput v0, Ll/jj40;->b:I

    .line 7
    .line 8
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Ll/jj40;->c:Lrx/subjects/a;

    .line 13
    .line 14
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/jj40;->d:Lrx/subjects/a;

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 26
    .line 27
    new-instance v0, Ljava/util/HashSet;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 30
    .line 31
    .line 32
    sput-object v0, Ll/jj40;->f:Ljava/util/Set;

    .line 33
    .line 34
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    sget-object v0, Ll/jj40;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Ll/ij40;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    sget-object v1, Ll/jj40;->e:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    sget-object v1, Ll/jj40;->e:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/ij40;

    .line 17
    .line 18
    iget-object v2, v1, Ll/ij40;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    return-object v1

    .line 35
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public static c()I
    .locals 1

    .line 1
    sget v0, Ll/jj40;->b:I

    .line 2
    .line 3
    return v0
.end method

.method public static d()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ij40;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/gra;->e2()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/dkb;->a8()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {}, Ll/ij40;->a()Ll/ij40$a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->MARRY_MODE:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ll/ij40$a;->b(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Ll/ij40$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "\u7406\u60f3\u4f34\u4fa3"

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ll/ij40$a;->c(Ljava/lang/String;)Ll/ij40$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ll/ij40$a;->a()Ll/ij40;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 48
    .line 49
    return-object v0

    .line 50
    :cond_0
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 51
    .line 52
    invoke-static {}, Ll/ij40;->a()Ll/ij40$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ll/ij40$a;->b(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Ll/ij40$a;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    sget v2, Ll/c9c0;->I:I

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ll/ij40$a;->d(I)Ll/ij40$a;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    sget v2, Ll/c9c0;->F:I

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ll/ij40$a;->e(I)Ll/ij40$a;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 75
    .line 76
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Df:I

    .line 81
    .line 82
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v1, v2}, Ll/ij40$a;->c(Ljava/lang/String;)Ll/ij40$a;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v1}, Ll/ij40$a;->a()Ll/ij40;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    invoke-static {}, Ll/gra;->Z2()Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_2

    .line 102
    .line 103
    invoke-static {}, Ll/spl0;->B()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_1

    .line 108
    .line 109
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 110
    .line 111
    invoke-static {}, Ll/ij40;->a()Ll/ij40$a;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->YOUTH_VIP:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ll/ij40$a;->b(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Ll/ij40$a;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const-string v2, "\u9752\u6625"

    .line 122
    .line 123
    invoke-virtual {v1, v2}, Ll/ij40$a;->c(Ljava/lang/String;)Ll/ij40$a;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v1}, Ll/ij40$a;->a()Ll/ij40;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_1
    invoke-static {}, Ll/spl0;->A()Z

    .line 136
    .line 137
    .line 138
    :goto_0
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 139
    .line 140
    return-object v0

    .line 141
    :cond_2
    invoke-static {}, Ll/s7a;->z()Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_3

    .line 146
    .line 147
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 148
    .line 149
    invoke-static {}, Ll/ij40;->a()Ll/ij40$a;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->YOUTH_VIP:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 154
    .line 155
    invoke-virtual {v1, v2}, Ll/ij40$a;->b(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Ll/ij40$a;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    const-string v2, "\u9752\u6625\u4e13\u533a"

    .line 160
    .line 161
    invoke-virtual {v1, v2}, Ll/ij40$a;->c(Ljava/lang/String;)Ll/ij40$a;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v1}, Ll/ij40$a;->a()Ll/ij40;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 173
    .line 174
    return-object v0

    .line 175
    :cond_3
    invoke-static {}, Ll/gra;->I0()Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;->enabled:Z

    .line 180
    .line 181
    if-nez v0, :cond_4

    .line 182
    .line 183
    invoke-static {}, Ll/nh00;->b()Ll/nh00;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {v0}, Ll/nh00;->f()Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-eqz v0, :cond_6

    .line 192
    .line 193
    :cond_4
    invoke-static {}, Ll/nh00;->b()Ll/nh00;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v0}, Ll/nh00;->f()Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-eqz v0, :cond_5

    .line 202
    .line 203
    invoke-static {}, Ll/nh00;->b()Ll/nh00;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v0}, Ll/nh00;->d()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    goto :goto_1

    .line 212
    :cond_5
    invoke-static {}, Ll/gra;->I0()Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;->tabTitle:Ljava/lang/String;

    .line 217
    .line 218
    :goto_1
    sget-object v1, Ll/jj40;->e:Ljava/util/List;

    .line 219
    .line 220
    invoke-static {}, Ll/ij40;->a()Ll/ij40$a;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->MOMENT_THEME_CARD:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 225
    .line 226
    invoke-virtual {v2, v3}, Ll/ij40$a;->b(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Ll/ij40$a;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    invoke-virtual {v2, v0}, Ll/ij40$a;->c(Ljava/lang/String;)Ll/ij40$a;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-virtual {v0}, Ll/ij40$a;->a()Ll/ij40;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    :cond_6
    sget-object v0, Ll/r5j0;->INSTANCE:Ll/r5j0;

    .line 242
    .line 243
    invoke-virtual {v0}, Ll/r5j0;->f()Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-eqz v0, :cond_7

    .line 248
    .line 249
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 250
    .line 251
    invoke-static {}, Ll/ij40;->a()Ll/ij40$a;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->TOP_PICKS:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 256
    .line 257
    invoke-virtual {v1, v2}, Ll/ij40$a;->b(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Ll/ij40$a;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    const-string v2, "TOP PICKS"

    .line 262
    .line 263
    invoke-virtual {v1, v2}, Ll/ij40$a;->c(Ljava/lang/String;)Ll/ij40$a;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    invoke-virtual {v1}, Ll/ij40$a;->a()Ll/ij40;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    :cond_7
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->enable:Z

    .line 279
    .line 280
    if-eqz v0, :cond_8

    .line 281
    .line 282
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->title:Ljava/lang/String;

    .line 287
    .line 288
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    if-nez v0, :cond_8

    .line 293
    .line 294
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->title:Ljava/lang/String;

    .line 299
    .line 300
    sget-object v1, Ll/jj40;->e:Ljava/util/List;

    .line 301
    .line 302
    invoke-static {}, Ll/ij40;->a()Ll/ij40$a;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->WEBVIEW_CONFIG:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 307
    .line 308
    invoke-virtual {v2, v3}, Ll/ij40$a;->b(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Ll/ij40$a;

    .line 309
    .line 310
    .line 311
    move-result-object v2

    .line 312
    invoke-virtual {v2, v0}, Ll/ij40$a;->c(Ljava/lang/String;)Ll/ij40$a;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    invoke-virtual {v0}, Ll/ij40$a;->a()Ll/ij40;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 321
    .line 322
    .line 323
    :cond_8
    invoke-static {}, Ll/gra;->J3()Z

    .line 324
    .line 325
    .line 326
    move-result v0

    .line 327
    if-eqz v0, :cond_9

    .line 328
    .line 329
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 330
    .line 331
    invoke-static {}, Ll/ij40;->a()Ll/ij40$a;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->ALREADY_AUTH:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 336
    .line 337
    invoke-virtual {v1, v2}, Ll/ij40$a;->b(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Ll/ij40$a;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    const-string v2, "\u5df2\u8ba4\u8bc1"

    .line 342
    .line 343
    invoke-virtual {v1, v2}, Ll/ij40$a;->c(Ljava/lang/String;)Ll/ij40$a;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    invoke-virtual {v1}, Ll/ij40$a;->a()Ll/ij40;

    .line 348
    .line 349
    .line 350
    move-result-object v1

    .line 351
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    :cond_9
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 355
    .line 356
    return-object v0
.end method

.method public static e()Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;
    .locals 1

    .line 1
    sget-object v0, Ll/jj40;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    return-object v0
.end method

.method public static f()I
    .locals 1

    .line 1
    sget-object v0, Ll/jj40;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static g(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Landroid/os/Bundle;)Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    sget-object p1, Ll/jj40$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, p1, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, "should add your own Frag"

    .line 13
    .line 14
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :pswitch_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Pp()Lcom/p1/mobile/android/app/Frag;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :pswitch_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Hn()Lcom/p1/mobile/android/app/Frag;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :pswitch_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->lg()Lcom/p1/mobile/android/app/Frag;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :pswitch_3
    new-instance p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;

    .line 59
    .line 60
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;-><init>()V

    .line 61
    .line 62
    .line 63
    return-object p0

    .line 64
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;

    .line 65
    .line 66
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;-><init>()V

    .line 67
    .line 68
    .line 69
    return-object p0

    .line 70
    :pswitch_5
    new-instance p0, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksTabFrag;

    .line 71
    .line 72
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksTabFrag;-><init>()V

    .line 73
    .line 74
    .line 75
    return-object p0

    .line 76
    :pswitch_6
    new-instance p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 77
    .line 78
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;-><init>()V

    .line 79
    .line 80
    .line 81
    return-object p0

    .line 82
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 83
    .line 84
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;-><init>()V

    .line 85
    .line 86
    .line 87
    return-object p0

    .line 88
    nop

    .line 89
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static h(I)V
    .locals 2

    .line 1
    sget v0, Ll/jj40;->b:I

    .line 2
    .line 3
    if-eq v0, p0, :cond_0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/jj40;->d:Lrx/subjects/a;

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sput p0, Ll/jj40;->b:I

    .line 17
    .line 18
    return-void
.end method

.method public static i(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 1

    .line 1
    sput-object p0, Ll/jj40;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    sget-object v0, Ll/jj40;->c:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
