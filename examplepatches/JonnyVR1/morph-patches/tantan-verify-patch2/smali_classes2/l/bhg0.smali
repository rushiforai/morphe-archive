.class public final Ll/bhg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ljava/lang/String;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Ll/ltg0;

.field public final c:Ll/dzg0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/bhg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/bhg0;->d:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ll/ltg0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/ltg0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/bhg0;->b:Ll/ltg0;

    .line 17
    .line 18
    new-instance v0, Ll/dzg0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/dzg0;-><init>(Ll/bhg0;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/bhg0;->c:Ll/dzg0;

    .line 24
    .line 25
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Ll/jwg0;->a:Ll/ieg0;

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Ll/ieg0;->a:I

    .line 38
    .line 39
    return-void
.end method

.method public static d(Ll/ktg0;)Z
    .locals 10

    .line 1
    iget-object v0, p0, Ll/ktg0;->b:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "SudDownloadManager"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_6

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_6

    .line 13
    .line 14
    iget-object v0, p0, Ll/ktg0;->c:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz v0, :cond_6

    .line 17
    .line 18
    iget-object v3, p0, Ll/ktg0;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_6

    .line 25
    .line 26
    iget-object v0, p0, Ll/ktg0;->a:LSudabstract/Sudfor;

    .line 27
    .line 28
    sget-object v3, LSudabstract/Sudfor;->Sudif:LSudabstract/Sudfor;

    .line 29
    .line 30
    if-eq v0, v3, :cond_5

    .line 31
    .line 32
    sget-object v3, LSudabstract/Sudfor;->Sudint:LSudabstract/Sudfor;

    .line 33
    .line 34
    if-ne v0, v3, :cond_0

    .line 35
    .line 36
    goto/16 :goto_2

    .line 37
    .line 38
    :cond_0
    sget-object v3, LSudabstract/Sudfor;->Suddo:LSudabstract/Sudfor;

    .line 39
    .line 40
    if-eq v0, v3, :cond_1

    .line 41
    .line 42
    sget-object v3, LSudabstract/Sudfor;->Sudfor:LSudabstract/Sudfor;

    .line 43
    .line 44
    if-ne v0, v3, :cond_6

    .line 45
    .line 46
    :cond_1
    iget v0, p0, Ll/ktg0;->g:I

    .line 47
    .line 48
    const-string v3, "TechSudMGPGlobal.sp"

    .line 49
    .line 50
    const-wide/16 v4, 0x0

    .line 51
    .line 52
    const/4 v6, 0x1

    .line 53
    if-ne v0, v6, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Ll/ktg0;->d:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v7, p0, Ll/ktg0;->e:Ljava/lang/String;

    .line 58
    .line 59
    iget-wide v8, p0, Ll/ktg0;->f:J

    .line 60
    .line 61
    invoke-static {v8, v9, v0, v7}, Ll/ing0;->b(JLjava/lang/String;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iget-object v7, p0, Ll/ktg0;->d:Ljava/lang/String;

    .line 66
    .line 67
    const/4 v8, 0x0

    .line 68
    invoke-static {v4, v5, v7, v8}, Ll/ing0;->b(JLjava/lang/String;Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    new-instance v5, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v7, "isCoreInstalled isOK1="

    .line 75
    .line 76
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v8, "  isOk2="

    .line 83
    .line 84
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-static {v1, v5}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    sget-object v5, Ll/bhg0;->d:Ljava/lang/String;

    .line 98
    .line 99
    new-instance v9, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v9, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    invoke-static {v5, v7}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    if-eqz v0, :cond_6

    .line 121
    .line 122
    if-eqz v4, :cond_6

    .line 123
    .line 124
    new-instance v0, Ljava/io/File;

    .line 125
    .line 126
    iget-object p0, p0, Ll/ktg0;->d:Ljava/lang/String;

    .line 127
    .line 128
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v3}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    iget-object v1, p0, Ll/kjg0;->a:Landroid/content/SharedPreferences;

    .line 136
    .line 137
    const-string v3, "key_fix_android14_read_only_cocos"

    .line 138
    .line 139
    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_2
    invoke-virtual {p0, v3}, Ll/kjg0;->e(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v0}, Ll/rsg0;->d(Ljava/io/File;)V

    .line 150
    .line 151
    .line 152
    :goto_0
    return v6

    .line 153
    :cond_3
    const/4 v7, 0x5

    .line 154
    if-ne v0, v7, :cond_6

    .line 155
    .line 156
    new-instance v0, Ljava/io/File;

    .line 157
    .line 158
    iget-object v7, p0, Ll/ktg0;->d:Ljava/lang/String;

    .line 159
    .line 160
    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 164
    .line 165
    .line 166
    move-result v7

    .line 167
    if-eqz v7, :cond_6

    .line 168
    .line 169
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 170
    .line 171
    .line 172
    move-result v7

    .line 173
    if-eqz v7, :cond_6

    .line 174
    .line 175
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 176
    .line 177
    .line 178
    move-result-object v7

    .line 179
    if-eqz v7, :cond_6

    .line 180
    .line 181
    array-length v8, v7

    .line 182
    if-lez v8, :cond_6

    .line 183
    .line 184
    aget-object v8, v7, v2

    .line 185
    .line 186
    invoke-virtual {v8}, Ljava/io/File;->isFile()Z

    .line 187
    .line 188
    .line 189
    move-result v8

    .line 190
    if-eqz v8, :cond_6

    .line 191
    .line 192
    aget-object v7, v7, v2

    .line 193
    .line 194
    invoke-virtual {v7}, Ljava/io/File;->length()J

    .line 195
    .line 196
    .line 197
    move-result-wide v7

    .line 198
    cmp-long v4, v7, v4

    .line 199
    .line 200
    if-lez v4, :cond_6

    .line 201
    .line 202
    invoke-static {v3}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    iget-object v1, p0, Ll/kjg0;->a:Landroid/content/SharedPreferences;

    .line 207
    .line 208
    const-string v3, "key_fix_android14_read_only_unity"

    .line 209
    .line 210
    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    if-eqz v1, :cond_4

    .line 215
    .line 216
    goto :goto_1

    .line 217
    :cond_4
    invoke-virtual {p0, v3}, Ll/kjg0;->e(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-static {v0}, Ll/rsg0;->d(Ljava/io/File;)V

    .line 221
    .line 222
    .line 223
    :goto_1
    return v6

    .line 224
    :cond_5
    :goto_2
    iget-object v0, p0, Ll/ktg0;->d:Ljava/lang/String;

    .line 225
    .line 226
    iget-object v2, p0, Ll/ktg0;->e:Ljava/lang/String;

    .line 227
    .line 228
    iget-wide v3, p0, Ll/ktg0;->f:J

    .line 229
    .line 230
    invoke-static {v3, v4, v0, v2}, Ll/ing0;->b(JLjava/lang/String;Ljava/lang/String;)Z

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    new-instance v0, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    const-string v2, "isPackageInstalled isOk="

    .line 237
    .line 238
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    sget-object v0, Ll/bhg0;->d:Ljava/lang/String;

    .line 252
    .line 253
    new-instance v1, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    return p0

    .line 269
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 270
    .line 271
    const-string v3, "isPackageInstalled not exists:"

    .line 272
    .line 273
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    iget-object v4, p0, Ll/ktg0;->d:Ljava/lang/String;

    .line 277
    .line 278
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 286
    .line 287
    .line 288
    sget-object v0, Ll/bhg0;->d:Ljava/lang/String;

    .line 289
    .line 290
    new-instance v1, Ljava/lang/StringBuilder;

    .line 291
    .line 292
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    iget-object p0, p0, Ll/ktg0;->d:Ljava/lang/String;

    .line 296
    .line 297
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    invoke-static {v0, p0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    return v2
.end method


# virtual methods
.method public final a(Ll/oqg0;Ljava/lang/String;Ljava/lang/String;Ll/wfg0;Ll/prg0;)J
    .locals 14

    .line 1
    move-object/from16 v7, p4

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "downloadPackage:"

    .line 6
    .line 7
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-wide v3, p1, Ll/oqg0;->c:J

    .line 11
    .line 12
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v8, "SudDownloadManager"

    .line 20
    .line 21
    invoke-static {v8, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Ll/bhg0;->d:Ljava/lang/String;

    .line 25
    .line 26
    new-instance v3, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-wide v4, p1, Ll/oqg0;->c:J

    .line 32
    .line 33
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v0, v2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    const/4 v9, 0x0

    .line 50
    move v3, v9

    .line 51
    :cond_0
    :goto_0
    const/4 v10, 0x0

    .line 52
    if-ge v3, v2, :cond_3

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    add-int/lit8 v3, v3, 0x1

    .line 59
    .line 60
    check-cast v4, Ll/sgg0;

    .line 61
    .line 62
    iget-wide v5, p1, Ll/oqg0;->c:J

    .line 63
    .line 64
    iget-object v11, p1, Ll/oqg0;->d:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v4, :cond_2

    .line 67
    .line 68
    iget-wide v12, v4, Ll/sgg0;->b:J

    .line 69
    .line 70
    cmp-long v5, v12, v5

    .line 71
    .line 72
    if-nez v5, :cond_2

    .line 73
    .line 74
    iget-object v5, v4, Ll/sgg0;->a:Ll/aug0;

    .line 75
    .line 76
    iget-object v5, v5, Ll/aug0;->c:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v5, v11}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-eqz v5, :cond_2

    .line 83
    .line 84
    iget-object v5, v4, Ll/sgg0;->d:Ljava/lang/String;

    .line 85
    .line 86
    move-object/from16 v6, p2

    .line 87
    .line 88
    invoke-static {v5, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    if-eqz v5, :cond_1

    .line 93
    .line 94
    iget-object v5, v4, Ll/sgg0;->e:Ljava/lang/String;

    .line 95
    .line 96
    move-object/from16 v11, p3

    .line 97
    .line 98
    invoke-static {v5, v11}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    if-eqz v5, :cond_0

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_1
    :goto_1
    move-object/from16 v11, p3

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_2
    move-object/from16 v6, p2

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    move-object/from16 v6, p2

    .line 112
    .line 113
    move-object/from16 v11, p3

    .line 114
    .line 115
    move-object v4, v10

    .line 116
    :goto_2
    if-nez v4, :cond_5

    .line 117
    .line 118
    :try_start_0
    new-instance v0, Ll/sgg0;

    .line 119
    .line 120
    iget-object v2, p0, Ll/bhg0;->b:Ll/ltg0;

    .line 121
    .line 122
    iget-wide v3, v2, Ll/ltg0;->a:J

    .line 123
    .line 124
    const-wide/16 v12, 0x1

    .line 125
    .line 126
    add-long/2addr v3, v12

    .line 127
    iput-wide v3, v2, Ll/ltg0;->a:J

    .line 128
    .line 129
    iget-object v6, p0, Ll/bhg0;->c:Ll/dzg0;

    .line 130
    .line 131
    move-object v1, p1

    .line 132
    move-wide v2, v3

    .line 133
    move-object v5, v11

    .line 134
    move-object/from16 v4, p2

    .line 135
    .line 136
    invoke-direct/range {v0 .. v6}, Ll/sgg0;-><init>(Ll/oqg0;JLjava/lang/String;Ljava/lang/String;Ll/dzg0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v7}, Ll/sgg0;->c(Ll/wfg0;)V

    .line 140
    .line 141
    .line 142
    move-object/from16 v2, p5

    .line 143
    .line 144
    iput-object v2, v0, Ll/sgg0;->i:Ll/prg0;

    .line 145
    .line 146
    sget-object v2, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 147
    .line 148
    iput-object v2, v0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 149
    .line 150
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 151
    .line 152
    .line 153
    move-result-wide v3

    .line 154
    iput-wide v3, v0, Ll/sgg0;->r:J

    .line 155
    .line 156
    invoke-virtual {v0, v2}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 157
    .line 158
    .line 159
    iget-object v2, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 160
    .line 161
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-object v4, v0

    .line 165
    goto :goto_3

    .line 166
    :catch_0
    move-exception v0

    .line 167
    new-instance v2, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    const-string v3, "create download task error:"

    .line 170
    .line 171
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-static {v8, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 186
    .line 187
    .line 188
    new-instance v2, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    const/4 v2, -0x1

    .line 201
    invoke-interface {v7, v2, v0, v10}, Ll/wfg0;->e(ILjava/lang/String;Ll/bxg0;)V

    .line 202
    .line 203
    .line 204
    move-object v4, v10

    .line 205
    :goto_3
    if-nez v4, :cond_4

    .line 206
    .line 207
    const-wide/16 v0, 0x0

    .line 208
    .line 209
    return-wide v0

    .line 210
    :cond_4
    const/4 v0, 0x1

    .line 211
    goto :goto_4

    .line 212
    :cond_5
    invoke-virtual {v4, v7}, Ll/sgg0;->c(Ll/wfg0;)V

    .line 213
    .line 214
    .line 215
    move v0, v9

    .line 216
    :goto_4
    iget-object v2, v4, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 217
    .line 218
    sget-object v3, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_PAUSE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 219
    .line 220
    if-eq v2, v3, :cond_6

    .line 221
    .line 222
    sget-object v3, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_COMPLETED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 223
    .line 224
    if-eq v2, v3, :cond_6

    .line 225
    .line 226
    sget-object v3, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CANCELED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 227
    .line 228
    if-ne v2, v3, :cond_7

    .line 229
    .line 230
    :cond_6
    sget-object v2, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 231
    .line 232
    iput-object v2, v4, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 233
    .line 234
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 235
    .line 236
    .line 237
    move-result-wide v5

    .line 238
    iput-wide v5, v4, Ll/sgg0;->r:J

    .line 239
    .line 240
    invoke-virtual {v4, v2}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 241
    .line 242
    .line 243
    :cond_7
    iget-object v1, p1, Ll/oqg0;->b:LSudabstract/Sudfor;

    .line 244
    .line 245
    sget-object v2, LSudabstract/Sudfor;->Suddo:LSudabstract/Sudfor;

    .line 246
    .line 247
    if-eq v1, v2, :cond_8

    .line 248
    .line 249
    sget-object v2, LSudabstract/Sudfor;->Sudif:LSudabstract/Sudfor;

    .line 250
    .line 251
    if-ne v1, v2, :cond_9

    .line 252
    .line 253
    :cond_8
    iget-object v1, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 254
    .line 255
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    if-eqz v1, :cond_9

    .line 260
    .line 261
    iget-object v1, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 262
    .line 263
    invoke-virtual {v1, v9, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 264
    .line 265
    .line 266
    :cond_9
    invoke-virtual {p0}, Ll/bhg0;->c()V

    .line 267
    .line 268
    .line 269
    if-eqz v0, :cond_12

    .line 270
    .line 271
    invoke-virtual {v4}, Ll/sgg0;->g()Z

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    if-eqz v0, :cond_12

    .line 276
    .line 277
    iget-object v0, v4, Ll/sgg0;->j:Ljava/util/ArrayList;

    .line 278
    .line 279
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    move v2, v9

    .line 284
    :cond_a
    if-ge v2, v1, :cond_12

    .line 285
    .line 286
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    add-int/lit8 v2, v2, 0x1

    .line 291
    .line 292
    check-cast v3, LSudabstract/Sudfor;

    .line 293
    .line 294
    sget-object v5, LSudabstract/Sudfor;->Sudif:LSudabstract/Sudfor;

    .line 295
    .line 296
    if-eq v3, v5, :cond_b

    .line 297
    .line 298
    sget-object v5, LSudabstract/Sudfor;->Sudint:LSudabstract/Sudfor;

    .line 299
    .line 300
    if-ne v3, v5, :cond_a

    .line 301
    .line 302
    :cond_b
    iget-wide v0, v4, Ll/sgg0;->b:J

    .line 303
    .line 304
    iget-object p0, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 305
    .line 306
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 307
    .line 308
    .line 309
    move-result v2

    .line 310
    move v3, v9

    .line 311
    :cond_c
    if-ge v3, v2, :cond_f

    .line 312
    .line 313
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 314
    .line 315
    .line 316
    move-result-object v5

    .line 317
    add-int/lit8 v3, v3, 0x1

    .line 318
    .line 319
    check-cast v5, Ll/sgg0;

    .line 320
    .line 321
    iget-wide v6, v5, Ll/sgg0;->b:J

    .line 322
    .line 323
    cmp-long v6, v6, v0

    .line 324
    .line 325
    if-nez v6, :cond_c

    .line 326
    .line 327
    invoke-virtual {v5}, Ll/sgg0;->g()Z

    .line 328
    .line 329
    .line 330
    move-result v6

    .line 331
    if-nez v6, :cond_c

    .line 332
    .line 333
    iget-object v6, v5, Ll/sgg0;->j:Ljava/util/ArrayList;

    .line 334
    .line 335
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 336
    .line 337
    .line 338
    move-result v7

    .line 339
    move v11, v9

    .line 340
    :cond_d
    if-ge v11, v7, :cond_c

    .line 341
    .line 342
    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    move-result-object v12

    .line 346
    add-int/lit8 v11, v11, 0x1

    .line 347
    .line 348
    check-cast v12, LSudabstract/Sudfor;

    .line 349
    .line 350
    sget-object v13, LSudabstract/Sudfor;->Sudif:LSudabstract/Sudfor;

    .line 351
    .line 352
    if-eq v12, v13, :cond_e

    .line 353
    .line 354
    sget-object v13, LSudabstract/Sudfor;->Sudint:LSudabstract/Sudfor;

    .line 355
    .line 356
    if-ne v12, v13, :cond_d

    .line 357
    .line 358
    :cond_e
    move-object v10, v5

    .line 359
    :cond_f
    if-eqz v10, :cond_12

    .line 360
    .line 361
    new-instance p0, Ljava/lang/StringBuilder;

    .line 362
    .line 363
    const-string v0, "replaceTask:"

    .line 364
    .line 365
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    iget-wide v0, v4, Ll/sgg0;->c:J

    .line 369
    .line 370
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object p0

    .line 377
    invoke-static {v8, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 378
    .line 379
    .line 380
    if-eq v4, v10, :cond_11

    .line 381
    .line 382
    iget-object p0, v10, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 383
    .line 384
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 385
    .line 386
    .line 387
    move-result v0

    .line 388
    :goto_5
    if-ge v9, v0, :cond_10

    .line 389
    .line 390
    invoke-virtual {p0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    move-result-object v1

    .line 394
    add-int/lit8 v9, v9, 0x1

    .line 395
    .line 396
    check-cast v1, Ll/wfg0;

    .line 397
    .line 398
    invoke-virtual {v4, v1}, Ll/sgg0;->c(Ll/wfg0;)V

    .line 399
    .line 400
    .line 401
    goto :goto_5

    .line 402
    :cond_10
    iget-object p0, v10, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 403
    .line 404
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 405
    .line 406
    .line 407
    :cond_11
    invoke-virtual {v10}, Ll/sgg0;->f()V

    .line 408
    .line 409
    .line 410
    :cond_12
    iget-wide v0, v4, Ll/sgg0;->c:J

    .line 411
    .line 412
    return-wide v0
.end method

.method public final b(J)Ll/sgg0;
    .locals 5

    .line 1
    iget-object p0, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :cond_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    check-cast v2, Ll/sgg0;

    .line 17
    .line 18
    iget-wide v3, v2, Ll/sgg0;->b:J

    .line 19
    .line 20
    cmp-long v3, v3, p1

    .line 21
    .line 22
    if-nez v3, :cond_0

    .line 23
    .line 24
    return-object v2

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public final c()V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :cond_0
    const/4 v4, 0x3

    .line 10
    const/4 v5, 0x0

    .line 11
    if-ge v3, v1, :cond_b

    .line 12
    .line 13
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    add-int/lit8 v3, v3, 0x1

    .line 18
    .line 19
    check-cast v6, Ll/sgg0;

    .line 20
    .line 21
    invoke-virtual {v6}, Ll/sgg0;->g()Z

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    if-eqz v6, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    move v3, v2

    .line 34
    :cond_1
    :goto_0
    if-ge v3, v1, :cond_5

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    add-int/lit8 v3, v3, 0x1

    .line 41
    .line 42
    check-cast v6, Ll/sgg0;

    .line 43
    .line 44
    invoke-virtual {v6}, Ll/sgg0;->g()Z

    .line 45
    .line 46
    .line 47
    move-result v7

    .line 48
    if-nez v7, :cond_1

    .line 49
    .line 50
    invoke-virtual {v6}, Ll/sgg0;->h()Z

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    if-eqz v7, :cond_4

    .line 55
    .line 56
    new-instance v7, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v8, "hangUp:"

    .line 59
    .line 60
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v9, v6, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 64
    .line 65
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v9, "  :mgId:"

    .line 69
    .line 70
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    iget-wide v10, v6, Ll/sgg0;->b:J

    .line 74
    .line 75
    invoke-virtual {v7, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    const-string v10, "SudDownloadTask"

    .line 83
    .line 84
    invoke-static {v10, v7}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    sget-object v7, Ll/sgg0;->u:Ljava/lang/String;

    .line 88
    .line 89
    new-instance v10, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v10, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v8, v6, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 95
    .line 96
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget-wide v8, v6, Ll/sgg0;->b:J

    .line 103
    .line 104
    invoke-virtual {v10, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v8

    .line 111
    invoke-static {v7, v8}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget-object v7, v6, Ll/sgg0;->n:Ll/e0h0;

    .line 115
    .line 116
    if-eqz v7, :cond_2

    .line 117
    .line 118
    iget-object v7, v7, Ll/e0h0;->a:Ljava/lang/ref/WeakReference;

    .line 119
    .line 120
    invoke-virtual {v7}, Ljava/lang/ref/Reference;->clear()V

    .line 121
    .line 122
    .line 123
    iget-object v7, v6, Ll/sgg0;->n:Ll/e0h0;

    .line 124
    .line 125
    invoke-virtual {v7}, Ltech/sud/base/utils/SudCustomCountdownTimer;->cancel()V

    .line 126
    .line 127
    .line 128
    iput-object v5, v6, Ll/sgg0;->n:Ll/e0h0;

    .line 129
    .line 130
    :cond_2
    invoke-virtual {v6}, Ll/sgg0;->h()Z

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    if-eqz v7, :cond_3

    .line 135
    .line 136
    const/4 v7, 0x4

    .line 137
    iput v7, v6, Ll/sgg0;->f:I

    .line 138
    .line 139
    iget-object v6, v6, Ll/sgg0;->a:Ll/aug0;

    .line 140
    .line 141
    invoke-virtual {v6}, Ll/aug0;->n()V

    .line 142
    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_3
    sget-object v7, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 146
    .line 147
    iput-object v7, v6, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 148
    .line 149
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 150
    .line 151
    .line 152
    move-result-wide v8

    .line 153
    iput-wide v8, v6, Ll/sgg0;->r:J

    .line 154
    .line 155
    invoke-virtual {v6, v7}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 156
    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_4
    sget-object v7, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 160
    .line 161
    iput-object v7, v6, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 162
    .line 163
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 164
    .line 165
    .line 166
    move-result-wide v8

    .line 167
    iput-wide v8, v6, Ll/sgg0;->r:J

    .line 168
    .line 169
    invoke-virtual {v6, v7}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 170
    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :cond_5
    :goto_1
    iget-object v0, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 175
    .line 176
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    move v3, v2

    .line 181
    move v6, v3

    .line 182
    :cond_6
    :goto_2
    if-ge v3, v1, :cond_7

    .line 183
    .line 184
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v7

    .line 188
    add-int/lit8 v3, v3, 0x1

    .line 189
    .line 190
    check-cast v7, Ll/sgg0;

    .line 191
    .line 192
    invoke-virtual {v7}, Ll/sgg0;->h()Z

    .line 193
    .line 194
    .line 195
    move-result v7

    .line 196
    if-eqz v7, :cond_6

    .line 197
    .line 198
    add-int/lit8 v6, v6, 0x1

    .line 199
    .line 200
    goto :goto_2

    .line 201
    :cond_7
    if-ge v6, v4, :cond_11

    .line 202
    .line 203
    iget-object v0, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 204
    .line 205
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    move v3, v2

    .line 210
    :cond_8
    if-ge v3, v1, :cond_9

    .line 211
    .line 212
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v6

    .line 216
    add-int/lit8 v3, v3, 0x1

    .line 217
    .line 218
    check-cast v6, Ll/sgg0;

    .line 219
    .line 220
    iget-object v7, v6, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 221
    .line 222
    sget-object v8, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 223
    .line 224
    if-ne v7, v8, :cond_8

    .line 225
    .line 226
    invoke-virtual {v6}, Ll/sgg0;->g()Z

    .line 227
    .line 228
    .line 229
    move-result v7

    .line 230
    if-eqz v7, :cond_8

    .line 231
    .line 232
    goto :goto_3

    .line 233
    :cond_9
    move-object v6, v5

    .line 234
    :goto_3
    if-nez v6, :cond_a

    .line 235
    .line 236
    goto :goto_7

    .line 237
    :cond_a
    invoke-virtual {v6}, Ll/sgg0;->e()V

    .line 238
    .line 239
    .line 240
    goto :goto_1

    .line 241
    :cond_b
    :goto_4
    iget-object v0, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 242
    .line 243
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    move v3, v2

    .line 248
    move v6, v3

    .line 249
    :cond_c
    :goto_5
    if-ge v3, v1, :cond_d

    .line 250
    .line 251
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v7

    .line 255
    add-int/lit8 v3, v3, 0x1

    .line 256
    .line 257
    check-cast v7, Ll/sgg0;

    .line 258
    .line 259
    invoke-virtual {v7}, Ll/sgg0;->h()Z

    .line 260
    .line 261
    .line 262
    move-result v7

    .line 263
    if-eqz v7, :cond_c

    .line 264
    .line 265
    add-int/lit8 v6, v6, 0x1

    .line 266
    .line 267
    goto :goto_5

    .line 268
    :cond_d
    if-ge v6, v4, :cond_11

    .line 269
    .line 270
    iget-object v0, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 271
    .line 272
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    move v3, v2

    .line 277
    :cond_e
    if-ge v3, v1, :cond_f

    .line 278
    .line 279
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v6

    .line 283
    add-int/lit8 v3, v3, 0x1

    .line 284
    .line 285
    check-cast v6, Ll/sgg0;

    .line 286
    .line 287
    iget-object v7, v6, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 288
    .line 289
    sget-object v8, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 290
    .line 291
    if-ne v7, v8, :cond_e

    .line 292
    .line 293
    goto :goto_6

    .line 294
    :cond_f
    move-object v6, v5

    .line 295
    :goto_6
    if-nez v6, :cond_10

    .line 296
    .line 297
    goto :goto_7

    .line 298
    :cond_10
    invoke-virtual {v6}, Ll/sgg0;->e()V

    .line 299
    .line 300
    .line 301
    goto :goto_4

    .line 302
    :cond_11
    :goto_7
    return-void
.end method

.method public final e(J)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    :cond_0
    if-ge v2, v1, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    add-int/lit8 v2, v2, 0x1

    .line 15
    .line 16
    check-cast v3, Ll/sgg0;

    .line 17
    .line 18
    iget-wide v4, v3, Ll/sgg0;->c:J

    .line 19
    .line 20
    cmp-long v4, v4, p1

    .line 21
    .line 22
    if-nez v4, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v3, 0x0

    .line 26
    :goto_0
    if-eqz v3, :cond_9

    .line 27
    .line 28
    iget-object p1, v3, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_4

    .line 39
    .line 40
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    move-object v4, p2

    .line 45
    check-cast v4, Ll/wfg0;

    .line 46
    .line 47
    invoke-interface {v4}, Ll/wfg0;->b()LSudabstract/Sudfor;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    sget-object v0, LSudabstract/Sudfor;->Suddo:LSudabstract/Sudfor;

    .line 52
    .line 53
    if-eq p2, v0, :cond_3

    .line 54
    .line 55
    sget-object v0, LSudabstract/Sudfor;->Sudif:LSudabstract/Sudfor;

    .line 56
    .line 57
    if-ne p2, v0, :cond_2

    .line 58
    .line 59
    :cond_3
    iget-wide v5, v3, Ll/sgg0;->q:J

    .line 60
    .line 61
    iget-wide v7, v3, Ll/sgg0;->p:J

    .line 62
    .line 63
    sget-object v9, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CANCELED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 64
    .line 65
    invoke-interface/range {v4 .. v9}, Ll/wfg0;->c(JJLtech/sud/gip/core/PkgDownloadStatus;)V

    .line 66
    .line 67
    .line 68
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_4
    iget-object p1, v3, Ll/sgg0;->j:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    :cond_5
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-eqz p2, :cond_7

    .line 83
    .line 84
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    check-cast p2, LSudabstract/Sudfor;

    .line 89
    .line 90
    sget-object v0, LSudabstract/Sudfor;->Suddo:LSudabstract/Sudfor;

    .line 91
    .line 92
    if-eq p2, v0, :cond_6

    .line 93
    .line 94
    sget-object v0, LSudabstract/Sudfor;->Sudif:LSudabstract/Sudfor;

    .line 95
    .line 96
    if-ne p2, v0, :cond_5

    .line 97
    .line 98
    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_7
    iget-object p1, v3, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-nez p1, :cond_8

    .line 109
    .line 110
    invoke-virtual {v3}, Ll/sgg0;->f()V

    .line 111
    .line 112
    .line 113
    :cond_8
    invoke-virtual {p0}, Ll/bhg0;->c()V

    .line 114
    .line 115
    .line 116
    :cond_9
    return-void
.end method
