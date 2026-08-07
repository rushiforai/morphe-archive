.class public final Ll/cmx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fex0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/List;

.field public final c:Ll/fex0;

.field public d:Ll/fex0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ll/fex0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Ll/fex0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Ll/fex0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Ll/fex0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Ll/fex0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Ll/fex0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:Ll/fex0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/fex0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/cmx0;->a:Landroid/content/Context;

    .line 9
    .line 10
    iput-object p2, p0, Ll/cmx0;->c:Ll/fex0;

    .line 11
    .line 12
    new-instance p1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/cmx0;->b:Ljava/util/List;

    .line 18
    .line 19
    return-void
.end method

.method public static final l(Ll/fex0;Ll/btx0;)V
    .locals 0
    .param p0    # Ll/fex0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/fex0;->f(Ll/btx0;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method


# virtual methods
.method public final a([BII)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, p1, p2, p3}, Ll/nyy0;->a([BII)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final e(Ll/akx0;)J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Ll/akx0;->a:Landroid/net/Uri;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p1, Ll/akx0;->a:Landroid/net/Uri;

    .line 18
    .line 19
    sget v2, Ll/mpw0;->a:I

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_e

    .line 30
    .line 31
    const-string v2, "file"

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    goto/16 :goto_4

    .line 40
    .line 41
    :cond_1
    const-string v1, "asset"

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/cmx0;->j()Ll/fex0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 54
    .line 55
    goto/16 :goto_5

    .line 56
    .line 57
    :cond_2
    const-string v1, "content"

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    iget-object v0, p0, Ll/cmx0;->f:Ll/fex0;

    .line 66
    .line 67
    if-nez v0, :cond_3

    .line 68
    .line 69
    iget-object v0, p0, Ll/cmx0;->a:Landroid/content/Context;

    .line 70
    .line 71
    new-instance v1, Ll/rbx0;

    .line 72
    .line 73
    invoke-direct {v1, v0}, Ll/rbx0;-><init>(Landroid/content/Context;)V

    .line 74
    .line 75
    .line 76
    iput-object v1, p0, Ll/cmx0;->f:Ll/fex0;

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Ll/cmx0;->k(Ll/fex0;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    iget-object v0, p0, Ll/cmx0;->f:Ll/fex0;

    .line 82
    .line 83
    iput-object v0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 84
    .line 85
    goto/16 :goto_5

    .line 86
    .line 87
    :cond_4
    const-string v1, "rtmp"

    .line 88
    .line 89
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_6

    .line 94
    .line 95
    iget-object v0, p0, Ll/cmx0;->g:Ll/fex0;

    .line 96
    .line 97
    if-nez v0, :cond_5

    .line 98
    .line 99
    :try_start_0
    const-string v0, "androidx.media3.datasource.rtmp.RtmpDataSource"

    .line 100
    .line 101
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const/4 v1, 0x0

    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Ll/fex0;

    .line 115
    .line 116
    iput-object v0, p0, Ll/cmx0;->g:Ll/fex0;

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Ll/cmx0;->k(Ll/fex0;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :catch_0
    move-exception p0

    .line 123
    const-string p1, "Error instantiating RTMP extension"

    .line 124
    .line 125
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 126
    .line 127
    .line 128
    const-wide/16 p0, 0x0

    .line 129
    .line 130
    return-wide p0

    .line 131
    :catch_1
    const-string v0, "DefaultDataSource"

    .line 132
    .line 133
    const-string v1, "Attempting to play RTMP stream without depending on the RTMP extension"

    .line 134
    .line 135
    invoke-static {v0, v1}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    :goto_1
    iget-object v0, p0, Ll/cmx0;->g:Ll/fex0;

    .line 139
    .line 140
    if-nez v0, :cond_5

    .line 141
    .line 142
    iget-object v0, p0, Ll/cmx0;->c:Ll/fex0;

    .line 143
    .line 144
    iput-object v0, p0, Ll/cmx0;->g:Ll/fex0;

    .line 145
    .line 146
    :cond_5
    iget-object v0, p0, Ll/cmx0;->g:Ll/fex0;

    .line 147
    .line 148
    iput-object v0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 149
    .line 150
    goto/16 :goto_5

    .line 151
    .line 152
    :cond_6
    const-string v1, "udp"

    .line 153
    .line 154
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-eqz v1, :cond_8

    .line 159
    .line 160
    iget-object v0, p0, Ll/cmx0;->h:Ll/fex0;

    .line 161
    .line 162
    if-nez v0, :cond_7

    .line 163
    .line 164
    new-instance v0, Ll/bux0;

    .line 165
    .line 166
    const/16 v1, 0x7d0

    .line 167
    .line 168
    invoke-direct {v0, v1}, Ll/bux0;-><init>(I)V

    .line 169
    .line 170
    .line 171
    iput-object v0, p0, Ll/cmx0;->h:Ll/fex0;

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Ll/cmx0;->k(Ll/fex0;)V

    .line 174
    .line 175
    .line 176
    :cond_7
    iget-object v0, p0, Ll/cmx0;->h:Ll/fex0;

    .line 177
    .line 178
    iput-object v0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 179
    .line 180
    goto/16 :goto_5

    .line 181
    .line 182
    :cond_8
    const-string v1, "data"

    .line 183
    .line 184
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_a

    .line 189
    .line 190
    iget-object v0, p0, Ll/cmx0;->i:Ll/fex0;

    .line 191
    .line 192
    if-nez v0, :cond_9

    .line 193
    .line 194
    new-instance v0, Ll/ocx0;

    .line 195
    .line 196
    invoke-direct {v0}, Ll/ocx0;-><init>()V

    .line 197
    .line 198
    .line 199
    iput-object v0, p0, Ll/cmx0;->i:Ll/fex0;

    .line 200
    .line 201
    invoke-virtual {p0, v0}, Ll/cmx0;->k(Ll/fex0;)V

    .line 202
    .line 203
    .line 204
    :cond_9
    iget-object v0, p0, Ll/cmx0;->i:Ll/fex0;

    .line 205
    .line 206
    iput-object v0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 207
    .line 208
    goto :goto_5

    .line 209
    :cond_a
    const-string v1, "rawresource"

    .line 210
    .line 211
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    if-nez v1, :cond_c

    .line 216
    .line 217
    const-string v1, "android.resource"

    .line 218
    .line 219
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_b

    .line 224
    .line 225
    goto :goto_3

    .line 226
    :cond_b
    iget-object v0, p0, Ll/cmx0;->c:Ll/fex0;

    .line 227
    .line 228
    :goto_2
    iput-object v0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 229
    .line 230
    goto :goto_5

    .line 231
    :cond_c
    :goto_3
    iget-object v0, p0, Ll/cmx0;->j:Ll/fex0;

    .line 232
    .line 233
    if-nez v0, :cond_d

    .line 234
    .line 235
    iget-object v0, p0, Ll/cmx0;->a:Landroid/content/Context;

    .line 236
    .line 237
    new-instance v1, Ll/usx0;

    .line 238
    .line 239
    invoke-direct {v1, v0}, Ll/usx0;-><init>(Landroid/content/Context;)V

    .line 240
    .line 241
    .line 242
    iput-object v1, p0, Ll/cmx0;->j:Ll/fex0;

    .line 243
    .line 244
    invoke-virtual {p0, v1}, Ll/cmx0;->k(Ll/fex0;)V

    .line 245
    .line 246
    .line 247
    :cond_d
    iget-object v0, p0, Ll/cmx0;->j:Ll/fex0;

    .line 248
    .line 249
    goto :goto_2

    .line 250
    :cond_e
    :goto_4
    iget-object v0, p1, Ll/akx0;->a:Landroid/net/Uri;

    .line 251
    .line 252
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    if-eqz v0, :cond_f

    .line 257
    .line 258
    const-string v1, "/android_asset/"

    .line 259
    .line 260
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-eqz v0, :cond_f

    .line 265
    .line 266
    invoke-virtual {p0}, Ll/cmx0;->j()Ll/fex0;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    iput-object v0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 271
    .line 272
    goto :goto_5

    .line 273
    :cond_f
    iget-object v0, p0, Ll/cmx0;->d:Ll/fex0;

    .line 274
    .line 275
    if-nez v0, :cond_10

    .line 276
    .line 277
    new-instance v0, Ll/irx0;

    .line 278
    .line 279
    invoke-direct {v0}, Ll/irx0;-><init>()V

    .line 280
    .line 281
    .line 282
    iput-object v0, p0, Ll/cmx0;->d:Ll/fex0;

    .line 283
    .line 284
    invoke-virtual {p0, v0}, Ll/cmx0;->k(Ll/fex0;)V

    .line 285
    .line 286
    .line 287
    :cond_10
    iget-object v0, p0, Ll/cmx0;->d:Ll/fex0;

    .line 288
    .line 289
    iput-object v0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 290
    .line 291
    :goto_5
    iget-object p0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 292
    .line 293
    invoke-interface {p0, p1}, Ll/fex0;->e(Ll/akx0;)J

    .line 294
    .line 295
    .line 296
    move-result-wide p0

    .line 297
    return-wide p0
.end method

.method public final f(Ll/btx0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cmx0;->c:Ll/fex0;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ll/fex0;->f(Ll/btx0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/cmx0;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/cmx0;->d:Ll/fex0;

    .line 15
    .line 16
    invoke-static {v0, p1}, Ll/cmx0;->l(Ll/fex0;Ll/btx0;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/cmx0;->e:Ll/fex0;

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/cmx0;->l(Ll/fex0;Ll/btx0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/cmx0;->f:Ll/fex0;

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/cmx0;->l(Ll/fex0;Ll/btx0;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/cmx0;->g:Ll/fex0;

    .line 30
    .line 31
    invoke-static {v0, p1}, Ll/cmx0;->l(Ll/fex0;Ll/btx0;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/cmx0;->h:Ll/fex0;

    .line 35
    .line 36
    invoke-static {v0, p1}, Ll/cmx0;->l(Ll/fex0;Ll/btx0;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/cmx0;->i:Ll/fex0;

    .line 40
    .line 41
    invoke-static {v0, p1}, Ll/cmx0;->l(Ll/fex0;Ll/btx0;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/cmx0;->j:Ll/fex0;

    .line 45
    .line 46
    invoke-static {p0, p1}, Ll/cmx0;->l(Ll/fex0;Ll/btx0;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final j()Ll/fex0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cmx0;->e:Ll/fex0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/cmx0;->a:Landroid/content/Context;

    .line 6
    .line 7
    new-instance v1, Ll/i7x0;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Ll/i7x0;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/cmx0;->e:Ll/fex0;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ll/cmx0;->k(Ll/fex0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/cmx0;->e:Ll/fex0;

    .line 18
    .line 19
    return-object p0
.end method

.method public final k(Ll/fex0;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/cmx0;->b:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ll/cmx0;->b:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/btx0;

    .line 17
    .line 18
    invoke-interface {p1, v1}, Ll/fex0;->f(Ll/btx0;)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public final zzc()Landroid/net/Uri;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/fex0;->zzc()Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final zzd()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    invoke-interface {v0}, Ll/fex0;->zzd()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/cmx0;->k:Ll/fex0;

    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    iput-object v1, p0, Ll/cmx0;->k:Ll/fex0;

    .line 14
    .line 15
    throw v0

    .line 16
    :cond_0
    return-void
.end method

.method public final zze()Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cmx0;->k:Ll/fex0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-interface {p0}, Ll/fex0;->zze()Ljava/util/Map;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
