.class public Lcom/meituan/robust/PatchExecutor;
.super Ljava/lang/Thread;
.source "SourceFile"


# static fields
.field private static final ROBUST_PATCH_CACHE_DIR:Ljava/lang/String; = "patch_cache"


# instance fields
.field protected context:Landroid/content/Context;

.field protected patchManipulate:Lcom/meituan/robust/PatchManipulate;

.field protected robustCallBack:Lcom/meituan/robust/RobustCallBack;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/meituan/robust/PatchManipulate;Lcom/meituan/robust/RobustCallBack;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/meituan/robust/PatchExecutor;->context:Landroid/content/Context;

    .line 9
    .line 10
    iput-object p2, p0, Lcom/meituan/robust/PatchExecutor;->patchManipulate:Lcom/meituan/robust/PatchManipulate;

    .line 11
    .line 12
    iput-object p3, p0, Lcom/meituan/robust/PatchExecutor;->robustCallBack:Lcom/meituan/robust/RobustCallBack;

    .line 13
    .line 14
    return-void
.end method

.method private static getPatchCacheDirPath(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "patch_cache"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/io/File;->mkdir()Z

    .line 27
    .line 28
    .line 29
    :cond_0
    return-object p0
.end method


# virtual methods
.method public applyPatchList(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/meituan/robust/Patch;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_3

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_4

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/meituan/robust/Patch;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/meituan/robust/Patch;->isAppliedSuccess()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/meituan/robust/Patch;->getLocalPath()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    iget-object v1, p0, Lcom/meituan/robust/PatchExecutor;->patchManipulate:Lcom/meituan/robust/PatchManipulate;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Lcom/meituan/robust/PatchManipulate;->ensurePatchExist(Lcom/meituan/robust/Patch;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    :try_start_0
    iget-object v2, p0, Lcom/meituan/robust/PatchExecutor;->context:Landroid/content/Context;

    .line 49
    .line 50
    invoke-virtual {p0, v2, v0}, Lcom/meituan/robust/PatchExecutor;->patch(Landroid/content/Context;Lcom/meituan/robust/Patch;)Z

    .line 51
    .line 52
    .line 53
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    goto :goto_1

    .line 55
    :catchall_0
    move-exception v2

    .line 56
    iget-object v3, p0, Lcom/meituan/robust/PatchExecutor;->robustCallBack:Lcom/meituan/robust/RobustCallBack;

    .line 57
    .line 58
    const-string v4, "class:PatchExecutor method:applyPatchList line:69"

    .line 59
    .line 60
    invoke-interface {v3, v2, v4}, Lcom/meituan/robust/RobustCallBack;->exceptionNotify(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    move v2, v1

    .line 64
    :goto_1
    if-eqz v2, :cond_3

    .line 65
    .line 66
    const/4 v1, 0x1

    .line 67
    invoke-virtual {v0, v1}, Lcom/meituan/robust/Patch;->setAppliedSuccess(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v2, p0, Lcom/meituan/robust/PatchExecutor;->robustCallBack:Lcom/meituan/robust/RobustCallBack;

    .line 71
    .line 72
    invoke-interface {v2, v1, v0}, Lcom/meituan/robust/RobustCallBack;->onPatchApplied(ZLcom/meituan/robust/Patch;)V

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    iget-object v2, p0, Lcom/meituan/robust/PatchExecutor;->robustCallBack:Lcom/meituan/robust/RobustCallBack;

    .line 77
    .line 78
    invoke-interface {v2, v1, v0}, Lcom/meituan/robust/RobustCallBack;->onPatchApplied(ZLcom/meituan/robust/Patch;)V

    .line 79
    .line 80
    .line 81
    :goto_2
    invoke-virtual {v0}, Lcom/meituan/robust/Patch;->getLocalPath()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    :goto_3
    return-void
.end method

.method public fetchPatchList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/meituan/robust/Patch;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/meituan/robust/PatchExecutor;->patchManipulate:Lcom/meituan/robust/PatchManipulate;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/meituan/robust/PatchExecutor;->context:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/meituan/robust/PatchManipulate;->fetchPatchList(Landroid/content/Context;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public patch(Landroid/content/Context;Lcom/meituan/robust/Patch;)Z
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const-string v2, "patch failed! "

    .line 6
    .line 7
    const-string v3, "robust"

    .line 8
    .line 9
    iget-object v4, v1, Lcom/meituan/robust/PatchExecutor;->patchManipulate:Lcom/meituan/robust/PatchManipulate;

    .line 10
    .line 11
    move-object/from16 v5, p2

    .line 12
    .line 13
    invoke-virtual {v4, v0, v5}, Lcom/meituan/robust/PatchManipulate;->verifyPatch(Landroid/content/Context;Lcom/meituan/robust/Patch;)Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    const-string v6, ",md5 = "

    .line 18
    .line 19
    const/4 v7, 0x0

    .line 20
    if-nez v4, :cond_0

    .line 21
    .line 22
    iget-object v0, v1, Lcom/meituan/robust/PatchExecutor;->robustCallBack:Lcom/meituan/robust/RobustCallBack;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v2, "verifyPatch failure, patch info:id = "

    .line 27
    .line 28
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getMd5()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v2, "class:PatchExecutor method:patch line:107"

    .line 53
    .line 54
    invoke-interface {v0, v1, v2}, Lcom/meituan/robust/RobustCallBack;->logNotify(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return v7

    .line 58
    :cond_0
    const/4 v4, 0x0

    .line 59
    :try_start_0
    new-instance v8, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v9

    .line 68
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getMd5()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    invoke-static {v0, v8}, Lcom/meituan/robust/PatchExecutor;->getPatchCacheDirPath(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v8, Ldalvik/system/DexClassLoader;

    .line 87
    .line 88
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getTempPath()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v9

    .line 92
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const-class v10, Lcom/meituan/robust/PatchExecutor;

    .line 97
    .line 98
    invoke-virtual {v10}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 99
    .line 100
    .line 101
    move-result-object v10

    .line 102
    invoke-direct {v8, v9, v0, v4, v10}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :catchall_0
    move-exception v0

    .line 107
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 108
    .line 109
    .line 110
    move-object v8, v4

    .line 111
    :goto_0
    if-nez v8, :cond_1

    .line 112
    .line 113
    return v7

    .line 114
    :cond_1
    :try_start_1
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getPatchesInfoImplClassFullName()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getPatchesInfoImplClassFullName()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v8, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Lcom/meituan/robust/PatchesInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :catchall_1
    move-exception v0

    .line 133
    const-string v9, "patch failed 188 "

    .line 134
    .line 135
    invoke-static {v3, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 136
    .line 137
    .line 138
    move-object v0, v4

    .line 139
    :goto_1
    if-nez v0, :cond_2

    .line 140
    .line 141
    iget-object v0, v1, Lcom/meituan/robust/PatchExecutor;->robustCallBack:Lcom/meituan/robust/RobustCallBack;

    .line 142
    .line 143
    new-instance v1, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string v2, "patchesInfo is null, patch info:id = "

    .line 146
    .line 147
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getName()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getMd5()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    const-string v2, "class:PatchExecutor method:patch line:114"

    .line 172
    .line 173
    invoke-interface {v0, v1, v2}, Lcom/meituan/robust/RobustCallBack;->logNotify(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    return v7

    .line 177
    :cond_2
    invoke-interface {v0}, Lcom/meituan/robust/PatchesInfo;->getPatchedClassesInfo()Ljava/util/List;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    const/4 v9, 0x1

    .line 182
    if-eqz v0, :cond_a

    .line 183
    .line 184
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 185
    .line 186
    .line 187
    move-result v10

    .line 188
    if-eqz v10, :cond_3

    .line 189
    .line 190
    goto/16 :goto_c

    .line 191
    .line 192
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 193
    .line 194
    .line 195
    move-result-object v10

    .line 196
    move v11, v7

    .line 197
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-eqz v0, :cond_9

    .line 202
    .line 203
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    check-cast v0, Lcom/meituan/robust/PatchedClassInfo;

    .line 208
    .line 209
    iget-object v12, v0, Lcom/meituan/robust/PatchedClassInfo;->patchedClassName:Ljava/lang/String;

    .line 210
    .line 211
    iget-object v0, v0, Lcom/meituan/robust/PatchedClassInfo;->patchClassName:Ljava/lang/String;

    .line 212
    .line 213
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 214
    .line 215
    .line 216
    move-result v13

    .line 217
    if-nez v13, :cond_4

    .line 218
    .line 219
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 220
    .line 221
    .line 222
    move-result v13

    .line 223
    if-eqz v13, :cond_5

    .line 224
    .line 225
    :cond_4
    move/from16 v18, v7

    .line 226
    .line 227
    move-object v7, v4

    .line 228
    goto/16 :goto_a

    .line 229
    .line 230
    :cond_5
    :try_start_2
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v12

    .line 234
    invoke-virtual {v8, v12}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 235
    .line 236
    .line 237
    move-result-object v12
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 238
    :try_start_3
    invoke-virtual {v12}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 239
    .line 240
    .line 241
    move-result-object v13

    .line 242
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    array-length v14, v13

    .line 246
    array-length v14, v13

    .line 247
    move v15, v7

    .line 248
    :goto_3
    if-ge v15, v14, :cond_7

    .line 249
    .line 250
    aget-object v16, v13, v15

    .line 251
    .line 252
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    .line 253
    .line 254
    .line 255
    move-result-object v17
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 256
    move/from16 v18, v7

    .line 257
    .line 258
    :try_start_4
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v7

    .line 262
    const-class v17, Lcom/meituan/robust/ChangeQuickRedirect;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 263
    .line 264
    :try_start_5
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v4

    .line 268
    invoke-static {v7, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 269
    .line 270
    .line 271
    move-result v4

    .line 272
    if-eqz v4, :cond_6

    .line 273
    .line 274
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    .line 275
    .line 276
    .line 277
    move-result-object v4

    .line 278
    invoke-virtual {v4}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v4

    .line 282
    invoke-virtual {v12}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v7

    .line 286
    invoke-static {v4, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 287
    .line 288
    .line 289
    move-result v4

    .line 290
    if-eqz v4, :cond_6

    .line 291
    .line 292
    move-object/from16 v4, v16

    .line 293
    .line 294
    goto :goto_5

    .line 295
    :catchall_2
    const/4 v7, 0x0

    .line 296
    goto :goto_7

    .line 297
    :cond_6
    add-int/lit8 v15, v15, 0x1

    .line 298
    .line 299
    move/from16 v7, v18

    .line 300
    .line 301
    const/4 v4, 0x0

    .line 302
    goto :goto_3

    .line 303
    :catchall_3
    :goto_4
    move-object v7, v4

    .line 304
    goto :goto_7

    .line 305
    :catchall_4
    move/from16 v18, v7

    .line 306
    .line 307
    goto :goto_4

    .line 308
    :cond_7
    move/from16 v18, v7

    .line 309
    .line 310
    const/4 v4, 0x0

    .line 311
    :goto_5
    if-nez v4, :cond_8

    .line 312
    .line 313
    iget-object v0, v1, Lcom/meituan/robust/PatchExecutor;->robustCallBack:Lcom/meituan/robust/RobustCallBack;

    .line 314
    .line 315
    new-instance v4, Ljava/lang/StringBuilder;

    .line 316
    .line 317
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 318
    .line 319
    .line 320
    const-string v7, "changeQuickRedirectField  is null, patch info:id = "

    .line 321
    .line 322
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getName()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v7

    .line 329
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getMd5()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v7

    .line 339
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v4

    .line 346
    const-string v7, "class:PatchExecutor method:patch line:147"

    .line 347
    .line 348
    invoke-interface {v0, v4, v7}, Lcom/meituan/robust/RobustCallBack;->logNotify(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 349
    .line 350
    .line 351
    const/4 v7, 0x0

    .line 352
    goto :goto_b

    .line 353
    :cond_8
    :try_start_6
    invoke-virtual {v8, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    invoke-virtual {v4, v9}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    .line 362
    .line 363
    .line 364
    const/4 v7, 0x0

    .line 365
    :try_start_7
    invoke-virtual {v4, v7, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 366
    .line 367
    .line 368
    goto :goto_b

    .line 369
    :catchall_5
    move-exception v0

    .line 370
    goto :goto_6

    .line 371
    :catchall_6
    move-exception v0

    .line 372
    const/4 v7, 0x0

    .line 373
    :goto_6
    :try_start_8
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    .line 375
    .line 376
    iget-object v4, v1, Lcom/meituan/robust/PatchExecutor;->robustCallBack:Lcom/meituan/robust/RobustCallBack;

    .line 377
    .line 378
    const-string v12, "class:PatchExecutor method:patch line:163"

    .line 379
    .line 380
    invoke-interface {v4, v0, v12}, Lcom/meituan/robust/RobustCallBack;->exceptionNotify(Ljava/lang/Throwable;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_7

    .line 381
    .line 382
    .line 383
    goto :goto_b

    .line 384
    :catch_0
    move/from16 v18, v7

    .line 385
    .line 386
    move-object v7, v4

    .line 387
    goto :goto_8

    .line 388
    :catchall_7
    :goto_7
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    .line 390
    .line 391
    goto :goto_b

    .line 392
    :goto_8
    move-object v4, v7

    .line 393
    move v11, v9

    .line 394
    :goto_9
    move/from16 v7, v18

    .line 395
    .line 396
    goto/16 :goto_2

    .line 397
    .line 398
    :goto_a
    iget-object v0, v1, Lcom/meituan/robust/PatchExecutor;->robustCallBack:Lcom/meituan/robust/RobustCallBack;

    .line 399
    .line 400
    new-instance v4, Ljava/lang/StringBuilder;

    .line 401
    .line 402
    const-string v12, "patchedClasses or patchClassName is empty, patch info:id = "

    .line 403
    .line 404
    invoke-direct {v4, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 405
    .line 406
    .line 407
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getName()Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v12

    .line 411
    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    invoke-virtual {v5}, Lcom/meituan/robust/Patch;->getMd5()Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v12

    .line 421
    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    .line 423
    .line 424
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v4

    .line 428
    const-string v12, "class:PatchExecutor method:patch line:131"

    .line 429
    .line 430
    invoke-interface {v0, v4, v12}, Lcom/meituan/robust/RobustCallBack;->logNotify(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    .line 432
    .line 433
    :goto_b
    move-object v4, v7

    .line 434
    goto :goto_9

    .line 435
    :cond_9
    move/from16 v18, v7

    .line 436
    .line 437
    if-eqz v11, :cond_a

    .line 438
    .line 439
    return v18

    .line 440
    :cond_a
    :goto_c
    return v9
.end method

.method public run()V
    .locals 3

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/meituan/robust/PatchExecutor;->fetchPatchList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/meituan/robust/PatchExecutor;->applyPatchList(Ljava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    const-string v1, "robust"

    .line 11
    .line 12
    const-string v2, "PatchExecutor run"

    .line 13
    .line 14
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/meituan/robust/PatchExecutor;->robustCallBack:Lcom/meituan/robust/RobustCallBack;

    .line 18
    .line 19
    const-string v1, "class:PatchExecutor,method:run,line:36"

    .line 20
    .line 21
    invoke-interface {p0, v0, v1}, Lcom/meituan/robust/RobustCallBack;->exceptionNotify(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
