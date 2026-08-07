.class public final Ll/bhi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010%\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJI\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000c\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u000e2\u0012\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\u0010\u00a2\u0006\u0004\u0008\u0012\u0010\u0013JC\u0010\u0019\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000c\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u00142\u0014\u0010\u0018\u001a\u0010\u0012\u0004\u0012\u00020\u000e\u0012\u0006\u0012\u0004\u0018\u00010\u00170\u0016\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ9\u0010\u001d\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u001b\u001a\u00020\u00042\u0008\u0010\u001c\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u001d\u0010\u001e\u00a8\u0006\u001f"
    }
    d2 = {
        "Ll/bhi;",
        "",
        "<init>",
        "()V",
        "",
        "bid",
        "",
        "keepVersion",
        "",
        "a",
        "(Ljava/lang/String;J)V",
        "zipPath",
        "baseVersion",
        "newVersion",
        "",
        "useRSA",
        "",
        "recordData",
        "c",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZLjava/util/Map;)Z",
        "Ljava/io/File;",
        "finalPackageDir",
        "Lkotlin/Pair;",
        "Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;",
        "verifySuccess",
        "b",
        "(Ljava/lang/String;Ljava/lang/String;JLjava/io/File;Lkotlin/Pair;)V",
        "version",
        "prefix",
        "d",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z",
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

.method private final a(Ljava/lang/String;J)V
    .locals 10

    .line 1
    const-string p0, "backup_"

    .line 2
    .line 3
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 4
    .line 5
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->d()Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;->d()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "backup"

    .line 16
    .line 17
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    goto/16 :goto_3

    .line 27
    .line 28
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const/16 v2, 0x76

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v3, ".zip"

    .line 45
    .line 46
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v3, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v3, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string p2, ".7z"

    .line 68
    .line 69
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    if-eqz p3, :cond_5

    .line 81
    .line 82
    new-instance v0, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .line 86
    .line 87
    array-length v2, p3

    .line 88
    const/4 v3, 0x0

    .line 89
    move v4, v3

    .line 90
    :goto_0
    const/4 v5, 0x2

    .line 91
    const/4 v6, 0x0

    .line 92
    if-ge v4, v2, :cond_2

    .line 93
    .line 94
    aget-object v7, p3, v4

    .line 95
    .line 96
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    .line 100
    .line 101
    .line 102
    move-result v8

    .line 103
    if-eqz v8, :cond_1

    .line 104
    .line 105
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    new-instance v9, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v9

    .line 127
    invoke-static {v8, v9, v3, v5, v6}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v5

    .line 131
    if-eqz v5, :cond_1

    .line 132
    .line 133
    invoke-interface {v0, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    goto :goto_1

    .line 137
    :catch_0
    move-exception v0

    .line 138
    move-object p0, v0

    .line 139
    move-object v2, p0

    .line 140
    goto :goto_4

    .line 141
    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_2
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    :cond_3
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 149
    .line 150
    .line 151
    move-result p3

    .line 152
    if-eqz p3, :cond_5

    .line 153
    .line 154
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p3

    .line 158
    check-cast p3, Ljava/io/File;

    .line 159
    .line 160
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-nez v0, :cond_3

    .line 172
    .line 173
    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-static {v0, p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-eqz v0, :cond_4

    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_4
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 185
    .line 186
    .line 187
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 188
    .line 189
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    new-instance v2, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .line 197
    .line 198
    const-string v3, "Deleted old backup: "

    .line 199
    .line 200
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p3

    .line 207
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p3

    .line 214
    invoke-static {v0, p3, v6, v5, v6}, Ll/pgi;->b(Ll/pgi;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    .line 216
    .line 217
    goto :goto_2

    .line 218
    :cond_5
    :goto_3
    return-void

    .line 219
    :goto_4
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 220
    .line 221
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    new-instance p0, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    const-string p2, "Delete old backups failed: "

    .line 228
    .line 229
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p2

    .line 236
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    const-string p0, "bid"

    .line 244
    .line 245
    invoke-static {p0, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    invoke-static {p0}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    const/4 v5, 0x4

    .line 254
    const/4 v6, 0x0

    .line 255
    const/4 v3, 0x0

    .line 256
    invoke-static/range {v0 .. v6}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 257
    .line 258
    .line 259
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;Ljava/lang/String;JLjava/io/File;Lkotlin/Pair;)V
    .locals 9
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Lkotlin/Pair;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/io/File;",
            "Lkotlin/Pair<",
            "Ljava/lang/Boolean;",
            "Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->B(Ljava/lang/String;Ljava/lang/String;J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->g()Ll/ygi;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p1, p5, p3, p4}, Ll/ygi;->a(Ljava/lang/String;Ljava/io/File;J)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->i()Ll/ahi;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, p1, p2}, Ll/ahi;->g(Ljava/lang/String;Ljava/lang/String;)Ll/zgi;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p6}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p6

    .line 43
    check-cast p6, Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;

    .line 44
    .line 45
    if-eqz p6, :cond_0

    .line 46
    .line 47
    invoke-virtual {p6}, Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;->getVersion()J

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    invoke-virtual {p5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p5

    .line 55
    invoke-virtual {v0, v1, v2, p5, p6}, Ll/zgi;->v(JLjava/lang/String;Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    new-instance p0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string p5, "Package install success: "

    .line 65
    .line 66
    invoke-direct {p0, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const/16 p5, 0x2f

    .line 73
    .line 74
    invoke-virtual {p0, p5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, p5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    const-string p0, "bid"

    .line 91
    .line 92
    invoke-static {p0, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string p1, "baseVersion"

    .line 97
    .line 98
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    filled-new-array {p0, p1}, [Lkotlin/Pair;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    const/4 v7, 0x4

    .line 111
    const/4 v8, 0x0

    .line 112
    const/4 v6, 0x0

    .line 113
    invoke-static/range {v3 .. v8}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZLjava/util/Map;)Z
    .locals 15
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
    .param p7    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "JZ",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    move-wide/from16 v9, p4

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
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual/range {p7 .. p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    new-instance v11, Ljava/io/File;

    .line 22
    .line 23
    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    const/4 v12, 0x0

    .line 31
    if-nez v3, :cond_0

    .line 32
    .line 33
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v3, "Zip file not exists: "

    .line 42
    .line 43
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/4 v2, 0x4

    .line 54
    const/4 v3, 0x0

    .line 55
    const/16 v4, -0xbbf

    .line 56
    .line 57
    const/4 v5, 0x0

    .line 58
    move-object/from16 p4, p7

    .line 59
    .line 60
    move-object/from16 p2, v0

    .line 61
    .line 62
    move-object p0, v1

    .line 63
    move/from16 p5, v2

    .line 64
    .line 65
    move-object/from16 p6, v3

    .line 66
    .line 67
    move/from16 p1, v4

    .line 68
    .line 69
    move-object/from16 p3, v5

    .line 70
    .line 71
    invoke-static/range {p0 .. p6}, Ll/pgi;->d(Ll/pgi;ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return v12

    .line 75
    :cond_0
    sget-object v13, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 76
    .line 77
    invoke-virtual {v13}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3, v1, v2, v9, v10}, Ll/chi;->x(Ljava/lang/String;Ljava/lang/String;J)Ljava/io/File;

    .line 82
    .line 83
    .line 84
    move-result-object v14

    .line 85
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-nez v3, :cond_1

    .line 90
    .line 91
    invoke-virtual {v14}, Ljava/io/File;->mkdirs()Z

    .line 92
    .line 93
    .line 94
    :cond_1
    invoke-virtual {v13}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->s()Lcom/hellogroup/fep/feppkg/internal/module/install/FepPackageUnzipModule;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    .line 104
    .line 105
    move-object/from16 v6, p7

    .line 106
    .line 107
    invoke-virtual {v3, v0, v4, v6}, Lcom/hellogroup/fep/feppkg/internal/module/install/FepPackageUnzipModule;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_2

    .line 112
    .line 113
    invoke-virtual {v14}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v0}, Lcom/hellogroup/common/file/FileUtil;->k(Ljava/io/File;)V

    .line 118
    .line 119
    .line 120
    return v12

    .line 121
    :cond_2
    invoke-virtual {v13}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->u()Ll/nhi;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    .line 131
    .line 132
    const/16 v7, 0x10

    .line 133
    .line 134
    const/4 v8, 0x0

    .line 135
    const/4 v5, 0x0

    .line 136
    move/from16 v4, p6

    .line 137
    .line 138
    invoke-static/range {v0 .. v8}, Ll/nhi;->m(Ll/nhi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/util/Map;ILjava/lang/Object;)Lkotlin/Pair;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v0}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    check-cast v3, Ljava/lang/Boolean;

    .line 147
    .line 148
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    if-nez v3, :cond_3

    .line 153
    .line 154
    invoke-virtual {v14}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-static {v0}, Lcom/hellogroup/common/file/FileUtil;->k(Ljava/io/File;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v13}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    const/4 v1, 0x4

    .line 166
    const/4 v2, 0x0

    .line 167
    const/16 v3, -0xbbf

    .line 168
    .line 169
    const-string v4, "Package verify failed"

    .line 170
    .line 171
    const/4 v5, 0x0

    .line 172
    move-object/from16 p4, p7

    .line 173
    .line 174
    move-object p0, v0

    .line 175
    move/from16 p5, v1

    .line 176
    .line 177
    move-object/from16 p6, v2

    .line 178
    .line 179
    move/from16 p1, v3

    .line 180
    .line 181
    move-object/from16 p2, v4

    .line 182
    .line 183
    move-object/from16 p3, v5

    .line 184
    .line 185
    invoke-static/range {p0 .. p6}, Ll/pgi;->d(Ll/pgi;ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ILjava/lang/Object;)V

    .line 186
    .line 187
    .line 188
    return v12

    .line 189
    :cond_3
    invoke-virtual {v13}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    invoke-virtual {v3, v1, v2, v9, v10}, Ll/chi;->u(Ljava/lang/String;Ljava/lang/String;J)Ljava/io/File;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    if-nez v3, :cond_4

    .line 202
    .line 203
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 204
    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_4
    invoke-static {v5}, Lcom/hellogroup/common/file/FileUtil;->k(Ljava/io/File;)V

    .line 208
    .line 209
    .line 210
    :goto_0
    invoke-virtual {v13}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    invoke-virtual {v3, v14, v5}, Ll/chi;->r(Ljava/io/File;Ljava/io/File;)Z

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    if-nez v3, :cond_5

    .line 219
    .line 220
    invoke-virtual {v14}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-static {v0}, Lcom/hellogroup/common/file/FileUtil;->k(Ljava/io/File;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {v13}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    const/4 v1, 0x4

    .line 232
    const/4 v2, 0x0

    .line 233
    const/16 v3, -0xbbf

    .line 234
    .line 235
    const-string v4, "Move package to final path failed"

    .line 236
    .line 237
    const/4 v5, 0x0

    .line 238
    move-object/from16 p4, p7

    .line 239
    .line 240
    move-object p0, v0

    .line 241
    move/from16 p5, v1

    .line 242
    .line 243
    move-object/from16 p6, v2

    .line 244
    .line 245
    move/from16 p1, v3

    .line 246
    .line 247
    move-object/from16 p2, v4

    .line 248
    .line 249
    move-object/from16 p3, v5

    .line 250
    .line 251
    invoke-static/range {p0 .. p6}, Ll/pgi;->d(Ll/pgi;ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ILjava/lang/Object;)V

    .line 252
    .line 253
    .line 254
    return v12

    .line 255
    :cond_5
    invoke-virtual {v11}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 260
    .line 261
    .line 262
    const/4 v4, 0x2

    .line 263
    const/4 v6, 0x0

    .line 264
    const-string v7, ".7z"

    .line 265
    .line 266
    invoke-static {v3, v7, v12, v4, v6}, Lkotlin/text/d;->w(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    if-eqz v3, :cond_6

    .line 271
    .line 272
    goto :goto_1

    .line 273
    :cond_6
    const-string v7, ".zip"

    .line 274
    .line 275
    :goto_1
    invoke-virtual {v13}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 276
    .line 277
    .line 278
    move-result-object v3

    .line 279
    invoke-virtual {v3, v1, v9, v10, v7}, Ll/chi;->l(Ljava/lang/String;JLjava/lang/String;)Ljava/io/File;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 284
    .line 285
    .line 286
    move-result v4

    .line 287
    if-eqz v4, :cond_7

    .line 288
    .line 289
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 290
    .line 291
    .line 292
    :cond_7
    invoke-virtual {v13}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 293
    .line 294
    .line 295
    move-result-object v4

    .line 296
    invoke-virtual {v4, v11, v3}, Ll/chi;->a(Ljava/io/File;Ljava/io/File;)Z

    .line 297
    .line 298
    .line 299
    invoke-direct {p0, v1, v9, v10}, Ll/bhi;->a(Ljava/lang/String;J)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    .line 303
    .line 304
    .line 305
    invoke-virtual {v14}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 306
    .line 307
    .line 308
    move-result-object v4

    .line 309
    invoke-static {v4}, Lcom/hellogroup/common/file/FileUtil;->k(Ljava/io/File;)V

    .line 310
    .line 311
    .line 312
    move-object v6, v0

    .line 313
    move-wide v3, v9

    .line 314
    move-object v0, p0

    .line 315
    invoke-virtual/range {v0 .. v6}, Ll/bhi;->b(Ljava/lang/String;Ljava/lang/String;JLjava/io/File;Lkotlin/Pair;)V

    .line 316
    .line 317
    .line 318
    const/4 v0, 0x1

    .line 319
    return v0
.end method

.method public final d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    if-eqz p3, :cond_1

    .line 11
    .line 12
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move-object p0, p3

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    const-string p0, "default"

    .line 22
    .line 23
    :goto_1
    new-instance v0, Ljava/io/File;

    .line 24
    .line 25
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2, p2, p0}, Ll/chi;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-direct {v0, v2, p4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    if-eqz p5, :cond_3

    .line 43
    .line 44
    invoke-interface {p5}, Ljava/lang/CharSequence;->length()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-nez v3, :cond_2

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    :cond_3
    :goto_2
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->s()Lcom/hellogroup/fep/feppkg/internal/module/install/FepPackageUnzipModule;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    const-string v3, "bid"

    .line 83
    .line 84
    invoke-static {v3, p2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    const-string v4, "zipPath"

    .line 89
    .line 90
    invoke-static {v4, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    const-string v5, "baseVersion"

    .line 95
    .line 96
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    invoke-static {v5, p3}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    const-string v5, "fepVersion"

    .line 105
    .line 106
    invoke-static {v5, p4}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    const-string v6, "prefix"

    .line 111
    .line 112
    invoke-static {p5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p5

    .line 116
    invoke-static {v6, p5}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 117
    .line 118
    .line 119
    move-result-object p5

    .line 120
    filled-new-array {v3, v4, p3, v5, p5}, [Lkotlin/Pair;

    .line 121
    .line 122
    .line 123
    move-result-object p3

    .line 124
    invoke-static {p3}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 125
    .line 126
    .line 127
    move-result-object p3

    .line 128
    const-string p5, "FepPackageInstallModule-installCustom"

    .line 129
    .line 130
    invoke-static {p3, p5}, Ll/xgi;->a(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    .line 131
    .line 132
    .line 133
    move-result-object p3

    .line 134
    invoke-virtual {v0, p1, v2, p3}, Lcom/hellogroup/fep/feppkg/internal/module/install/FepPackageUnzipModule;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 139
    .line 140
    .line 141
    move-result-object p3

    .line 142
    invoke-static {p4}, Lkotlin/text/StringsKt;->p(Ljava/lang/String;)Ljava/lang/Long;

    .line 143
    .line 144
    .line 145
    move-result-object p4

    .line 146
    if-eqz p4, :cond_4

    .line 147
    .line 148
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    .line 149
    .line 150
    .line 151
    move-result-wide p4

    .line 152
    goto :goto_3

    .line 153
    :cond_4
    const-wide/16 p4, 0x0

    .line 154
    .line 155
    :goto_3
    invoke-virtual {p3, p2, p0, p4, p5}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->B(Ljava/lang/String;Ljava/lang/String;J)V

    .line 156
    .line 157
    .line 158
    return p1
.end method
