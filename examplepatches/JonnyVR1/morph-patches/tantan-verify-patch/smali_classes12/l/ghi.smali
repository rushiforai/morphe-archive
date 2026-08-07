.class public final Ll/ghi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010%\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003JC\u0010\u000c\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u00082\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\n\u00a2\u0006\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/ghi;",
        "",
        "<init>",
        "()V",
        "",
        "patchPath",
        "originZipPath",
        "bid",
        "",
        "newVersion",
        "",
        "recordData",
        "a",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)Ljava/lang/String;",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)Ljava/lang/String;
    .locals 17
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const-string v2, "Patch merge failed, result code: "

    .line 6
    .line 7
    const-string v3, "Patch merge success: "

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual/range {p6 .. p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    new-instance v4, Ljava/io/File;

    .line 22
    .line 23
    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v5, Ljava/io/File;

    .line 27
    .line 28
    invoke-direct {v5, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sget-object v6, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 32
    .line 33
    invoke-virtual {v6}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 34
    .line 35
    .line 36
    move-result-object v7

    .line 37
    const/4 v8, 0x2

    .line 38
    const/4 v9, 0x0

    .line 39
    move-object/from16 v10, p3

    .line 40
    .line 41
    invoke-static {v7, v10, v9, v8, v9}, Ll/chi;->d(Ll/chi;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/io/File;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 46
    .line 47
    .line 48
    move-result v8

    .line 49
    if-eqz v8, :cond_0

    .line 50
    .line 51
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    if-eqz v8, :cond_0

    .line 56
    .line 57
    invoke-virtual {v5}, Ljava/io/File;->length()J

    .line 58
    .line 59
    .line 60
    move-result-wide v10

    .line 61
    const-wide/16 v12, 0x0

    .line 62
    .line 63
    cmp-long v8, v10, v12

    .line 64
    .line 65
    if-gtz v8, :cond_1

    .line 66
    .line 67
    :cond_0
    move-object/from16 v14, p6

    .line 68
    .line 69
    goto/16 :goto_2

    .line 70
    .line 71
    :cond_1
    :try_start_0
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    if-eqz v8, :cond_2

    .line 76
    .line 77
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catch_0
    move-exception v0

    .line 82
    goto/16 :goto_1

    .line 83
    .line 84
    :cond_2
    :goto_0
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-static {v5, v8, v4}, Limmomo/com/mklibrary/core/offline/bsdiff/BsdiffUtil;->apply_patch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    if-lez v4, :cond_4

    .line 101
    .line 102
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eqz v2, :cond_3

    .line 107
    .line 108
    invoke-virtual {v7}, Ljava/io/File;->length()J

    .line 109
    .line 110
    .line 111
    move-result-wide v4

    .line 112
    cmp-long v2, v4, v12

    .line 113
    .line 114
    if-lez v2, :cond_3

    .line 115
    .line 116
    invoke-virtual {v6}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    new-instance v4, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v0, " + "

    .line 129
    .line 130
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v0, " -> "

    .line 137
    .line 138
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    const/4 v1, 0x4

    .line 153
    const/4 v3, 0x0

    .line 154
    const/4 v4, 0x0

    .line 155
    move-object/from16 p2, p6

    .line 156
    .line 157
    move-object/from16 p1, v0

    .line 158
    .line 159
    move/from16 p4, v1

    .line 160
    .line 161
    move-object/from16 p0, v2

    .line 162
    .line 163
    move-object/from16 p5, v3

    .line 164
    .line 165
    move/from16 p3, v4

    .line 166
    .line 167
    invoke-static/range {p0 .. p5}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    return-object v0

    .line 175
    :cond_3
    invoke-virtual {v6}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 176
    .line 177
    .line 178
    move-result-object v10

    .line 179
    const-string v12, "Write merged file failed"

    .line 180
    .line 181
    const/4 v15, 0x4

    .line 182
    const/16 v16, 0x0

    .line 183
    .line 184
    const/16 v11, -0xbc2

    .line 185
    .line 186
    const/4 v13, 0x0

    .line 187
    move-object/from16 v14, p6

    .line 188
    .line 189
    invoke-static/range {v10 .. v16}, Ll/pgi;->d(Ll/pgi;ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ILjava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 193
    .line 194
    .line 195
    return-object v9

    .line 196
    :cond_4
    invoke-virtual {v6}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 197
    .line 198
    .line 199
    move-result-object v10

    .line 200
    new-instance v0, Ljava/lang/StringBuilder;

    .line 201
    .line 202
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v12

    .line 212
    const/4 v15, 0x4

    .line 213
    const/16 v16, 0x0

    .line 214
    .line 215
    const/16 v11, -0xbc2

    .line 216
    .line 217
    const/4 v13, 0x0

    .line 218
    move-object/from16 v14, p6

    .line 219
    .line 220
    invoke-static/range {v10 .. v16}, Ll/pgi;->d(Ll/pgi;ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ILjava/lang/Object;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v7}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    .line 225
    .line 226
    return-object v9

    .line 227
    :goto_1
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 228
    .line 229
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    const/16 v2, -0xbc2

    .line 234
    .line 235
    const-string v3, "Patch merge failed"

    .line 236
    .line 237
    move-object/from16 v14, p6

    .line 238
    .line 239
    invoke-virtual {v1, v2, v3, v0, v14}, Ll/pgi;->c(ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 243
    .line 244
    .line 245
    return-object v9

    .line 246
    :goto_2
    invoke-virtual {v6}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 247
    .line 248
    .line 249
    move-result-object v10

    .line 250
    const/4 v15, 0x4

    .line 251
    const/16 v16, 0x0

    .line 252
    .line 253
    const/16 v11, -0xbc2

    .line 254
    .line 255
    const-string v12, "Read patch/origin file failed"

    .line 256
    .line 257
    const/4 v13, 0x0

    .line 258
    invoke-static/range {v10 .. v16}, Ll/pgi;->d(Ll/pgi;ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ILjava/lang/Object;)V

    .line 259
    .line 260
    .line 261
    return-object v9
.end method
