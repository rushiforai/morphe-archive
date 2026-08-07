.class public final Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J3\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t0\u0008H\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ5\u0010\u000e\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t0\u0008H\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ5\u0010\u0010\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t0\u0008H\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u000fJ\u001f\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u001f\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u00042\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0015\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J1\u0010\u0019\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t0\u0008\u00a2\u0006\u0004\u0008\u0019\u0010\r\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;",
        "",
        "<init>",
        "()V",
        "Ll/zgi;",
        "info",
        "Ll/tgi;",
        "checkResult",
        "",
        "",
        "recordData",
        "",
        "d",
        "(Ll/zgi;Ll/tgi;Ljava/util/Map;)V",
        "f",
        "(Ll/tgi;Ll/zgi;Ljava/util/Map;)Ljava/lang/String;",
        "e",
        "",
        "g",
        "(Ll/zgi;Ll/tgi;)Z",
        "infoCheck",
        "Ll/ngi;",
        "fepGreyState",
        "c",
        "(Ll/zgi;Ll/ngi;)V",
        "h",
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

.method public static final synthetic a(Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;Ll/zgi;Ll/tgi;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->d(Ll/zgi;Ll/tgi;Ljava/util/Map;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic b(Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;Ll/zgi;Ll/tgi;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->g(Ll/zgi;Ll/tgi;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final d(Ll/zgi;Ll/tgi;Ljava/util/Map;)V
    .locals 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/zgi;",
            "Ll/tgi;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-virtual/range {p2 .. p2}, Ll/tgi;->f()J

    .line 4
    .line 5
    .line 6
    move-result-wide v4

    .line 7
    invoke-virtual {v0}, Ll/zgi;->e()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0}, Ll/zgi;->d()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v2}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v15, 0x1

    .line 20
    const/16 v16, 0x0

    .line 21
    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    invoke-static {v3}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    const-wide/16 v6, 0x0

    .line 31
    .line 32
    cmp-long v1, v4, v6

    .line 33
    .line 34
    if-lez v1, :cond_2

    .line 35
    .line 36
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    invoke-virtual {v6, v2, v3, v4, v5}, Ll/chi;->u(Ljava/lang/String;Ljava/lang/String;J)Ljava/io/File;

    .line 43
    .line 44
    .line 45
    move-result-object v17

    .line 46
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->exists()Z

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    if-eqz v6, :cond_2

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->u()Ll/nhi;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v9

    .line 60
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    invoke-virtual/range {p2 .. p2}, Ll/tgi;->c()I

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    if-ne v7, v15, :cond_0

    .line 68
    .line 69
    move v10, v15

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    move/from16 v10, v16

    .line 72
    .line 73
    :goto_0
    const/16 v13, 0x10

    .line 74
    .line 75
    const/4 v14, 0x0

    .line 76
    const/4 v11, 0x0

    .line 77
    move-object/from16 v12, p3

    .line 78
    .line 79
    move-object v7, v2

    .line 80
    move-object v8, v3

    .line 81
    invoke-static/range {v6 .. v14}, Ll/nhi;->m(Ll/nhi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/util/Map;ILjava/lang/Object;)Lkotlin/Pair;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v2}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    check-cast v6, Ljava/lang/Boolean;

    .line 90
    .line 91
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 92
    .line 93
    .line 94
    move-result v8

    .line 95
    if-nez v8, :cond_1

    .line 96
    .line 97
    invoke-static/range {v17 .. v17}, Lcom/hellogroup/common/file/FileUtil;->k(Ljava/io/File;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 101
    .line 102
    .line 103
    move-result-object v18

    .line 104
    const/16 v23, 0x4

    .line 105
    .line 106
    const/16 v24, 0x0

    .line 107
    .line 108
    const/16 v19, -0xbbf

    .line 109
    .line 110
    const-string v20, "Package verify failed\uff0cby check old pkg"

    .line 111
    .line 112
    const/16 v21, 0x0

    .line 113
    .line 114
    move-object/from16 v22, p3

    .line 115
    .line 116
    invoke-static/range {v18 .. v24}, Ll/pgi;->d(Ll/pgi;ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ILjava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_1
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->j()Ll/bhi;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    move-object v6, v7

    .line 125
    move-object v7, v2

    .line 126
    move-object v2, v6

    .line 127
    move-object/from16 v6, v17

    .line 128
    .line 129
    invoke-virtual/range {v1 .. v7}, Ll/bhi;->b(Ljava/lang/String;Ljava/lang/String;JLjava/io/File;Lkotlin/Pair;)V

    .line 130
    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_2
    move/from16 v8, v16

    .line 134
    .line 135
    :goto_1
    if-nez v8, :cond_5

    .line 136
    .line 137
    sget-object v1, Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;->Downloading:Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ll/zgi;->u(Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 140
    .line 141
    .line 142
    move-object/from16 v1, p0

    .line 143
    .line 144
    move-object/from16 v2, p2

    .line 145
    .line 146
    move-object/from16 v12, p3

    .line 147
    .line 148
    invoke-direct {v1, v2, v0, v12}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->f(Ll/tgi;Ll/zgi;Ljava/util/Map;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v19

    .line 152
    if-nez v19, :cond_3

    .line 153
    .line 154
    sget-object v1, Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;->Failed:Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 155
    .line 156
    invoke-virtual {v0, v1}, Ll/zgi;->u(Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_3
    sget-object v1, Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;->Installing:Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ll/zgi;->u(Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 163
    .line 164
    .line 165
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 166
    .line 167
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->j()Ll/bhi;

    .line 168
    .line 169
    .line 170
    move-result-object v18

    .line 171
    invoke-virtual {v0}, Ll/zgi;->e()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v20

    .line 175
    invoke-virtual {v0}, Ll/zgi;->d()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v21

    .line 179
    invoke-virtual {v2}, Ll/tgi;->f()J

    .line 180
    .line 181
    .line 182
    move-result-wide v22

    .line 183
    invoke-virtual {v2}, Ll/tgi;->c()I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-ne v1, v15, :cond_4

    .line 188
    .line 189
    move/from16 v24, v15

    .line 190
    .line 191
    :goto_2
    move-object/from16 v25, v12

    .line 192
    .line 193
    goto :goto_3

    .line 194
    :cond_4
    move/from16 v24, v16

    .line 195
    .line 196
    goto :goto_2

    .line 197
    :goto_3
    invoke-virtual/range {v18 .. v25}, Ll/bhi;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZLjava/util/Map;)Z

    .line 198
    .line 199
    .line 200
    move-result v8

    .line 201
    :cond_5
    if-eqz v8, :cond_6

    .line 202
    .line 203
    sget-object v1, Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;->Ready:Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ll/zgi;->u(Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_6
    sget-object v1, Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;->Failed:Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 210
    .line 211
    invoke-virtual {v0, v1}, Ll/zgi;->u(Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 212
    .line 213
    .line 214
    return-void
.end method

.method private final e(Ll/tgi;Ll/zgi;Ljava/util/Map;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/tgi;",
            "Ll/zgi;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->f()Ll/nc60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Ll/tgi;->i()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p2}, Ll/zgi;->e()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p1}, Ll/tgi;->f()J

    .line 21
    .line 22
    .line 23
    move-result-wide v3

    .line 24
    move-object v5, p3

    .line 25
    invoke-virtual/range {v0 .. v5}, Ll/nc60;->b(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method private final f(Ll/tgi;Ll/zgi;Ljava/util/Map;)Ljava/lang/String;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/tgi;",
            "Ll/zgi;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    move-object/from16 v5, p3

    .line 2
    .line 3
    const-string v0, "patchUrl="

    .line 4
    .line 5
    const/4 v7, 0x0

    .line 6
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ll/tgi;->h()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    sget-object v2, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual/range {p2 .. p2}, Ll/zgi;->e()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual/range {p1 .. p1}, Ll/tgi;->d()J

    .line 31
    .line 32
    .line 33
    move-result-wide v8

    .line 34
    invoke-virtual {v2, v3, v8, v9}, Ll/chi;->p(Ljava/lang/String;J)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    goto :goto_0

    .line 42
    :catch_0
    move-exception v0

    .line 43
    goto/16 :goto_3

    .line 44
    .line 45
    :cond_0
    const/4 v2, 0x0

    .line 46
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v0, "###zipUrl="

    .line 55
    .line 56
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual/range {p1 .. p1}, Ll/tgi;->i()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v5, v0}, Ll/xgi;->a(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    .line 71
    .line 72
    .line 73
    if-eqz v2, :cond_6

    .line 74
    .line 75
    sget-object v8, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 76
    .line 77
    invoke-virtual {v8}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->f()Ll/nc60;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual/range {p2 .. p2}, Ll/zgi;->e()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual/range {p1 .. p1}, Ll/tgi;->f()J

    .line 86
    .line 87
    .line 88
    move-result-wide v3

    .line 89
    invoke-virtual/range {v0 .. v5}, Ll/nc60;->c(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    if-eqz v1, :cond_5

    .line 94
    .line 95
    :try_start_1
    invoke-virtual {v8}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual/range {p2 .. p2}, Ll/zgi;->e()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual/range {p1 .. p1}, Ll/tgi;->d()J

    .line 104
    .line 105
    .line 106
    move-result-wide v3

    .line 107
    const-string v5, ".zip"

    .line 108
    .line 109
    invoke-virtual {v0, v2, v3, v4, v5}, Ll/chi;->l(Ljava/lang/String;JLjava/lang/String;)Ljava/io/File;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v8}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual/range {p2 .. p2}, Ll/zgi;->e()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-virtual/range {p1 .. p1}, Ll/tgi;->d()J

    .line 122
    .line 123
    .line 124
    move-result-wide v4

    .line 125
    const-string v6, ".7z"

    .line 126
    .line 127
    invoke-virtual {v2, v3, v4, v5, v6}, Ll/chi;->l(Ljava/lang/String;JLjava/lang/String;)Ljava/io/File;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    const-wide/16 v4, 0x0

    .line 136
    .line 137
    if-eqz v3, :cond_1

    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 140
    .line 141
    .line 142
    move-result-wide v9

    .line 143
    cmp-long v3, v9, v4

    .line 144
    .line 145
    if-lez v3, :cond_1

    .line 146
    .line 147
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    :goto_1
    move-object v2, v0

    .line 152
    goto :goto_2

    .line 153
    :catch_1
    move-exception v0

    .line 154
    move-object/from16 v5, p3

    .line 155
    .line 156
    goto/16 :goto_3

    .line 157
    .line 158
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_2

    .line 163
    .line 164
    invoke-virtual {v2}, Ljava/io/File;->length()J

    .line 165
    .line 166
    .line 167
    move-result-wide v9

    .line 168
    cmp-long v0, v9, v4

    .line 169
    .line 170
    if-lez v0, :cond_2

    .line 171
    .line 172
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    goto :goto_1

    .line 177
    :cond_2
    move-object v2, v7

    .line 178
    :goto_2
    if-eqz v2, :cond_4

    .line 179
    .line 180
    invoke-virtual {v8}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->n()Ll/ghi;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual/range {p2 .. p2}, Ll/zgi;->e()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-virtual/range {p1 .. p1}, Ll/tgi;->f()J

    .line 189
    .line 190
    .line 191
    move-result-wide v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 192
    move-object/from16 v6, p3

    .line 193
    .line 194
    :try_start_2
    invoke-virtual/range {v0 .. v6}, Ll/ghi;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 198
    move-object v5, v6

    .line 199
    :try_start_3
    new-instance v2, Ljava/io/File;

    .line 200
    .line 201
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 205
    .line 206
    .line 207
    if-eqz v0, :cond_3

    .line 208
    .line 209
    return-object v0

    .line 210
    :cond_3
    invoke-virtual {v8}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 211
    .line 212
    .line 213
    move-result-object v9

    .line 214
    const-string v10, "Patch merge failed, fallback to full download"

    .line 215
    .line 216
    const/16 v14, 0xe

    .line 217
    .line 218
    const/4 v15, 0x0

    .line 219
    const/4 v11, 0x0

    .line 220
    const/4 v12, 0x0

    .line 221
    const/4 v13, 0x0

    .line 222
    invoke-static/range {v9 .. v15}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 223
    .line 224
    .line 225
    invoke-direct/range {p0 .. p3}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->e(Ll/tgi;Ll/zgi;Ljava/util/Map;)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    return-object v0

    .line 230
    :catch_2
    move-exception v0

    .line 231
    move-object v5, v6

    .line 232
    goto :goto_3

    .line 233
    :cond_4
    move-object/from16 v5, p3

    .line 234
    .line 235
    invoke-virtual {v8}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 236
    .line 237
    .line 238
    move-result-object v8

    .line 239
    const-string v9, "Backup package not exists, fallback to full download"

    .line 240
    .line 241
    const/16 v13, 0xe

    .line 242
    .line 243
    const/4 v14, 0x0

    .line 244
    const/4 v10, 0x0

    .line 245
    const/4 v11, 0x0

    .line 246
    const/4 v12, 0x0

    .line 247
    invoke-static/range {v8 .. v14}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 248
    .line 249
    .line 250
    new-instance v0, Ljava/io/File;

    .line 251
    .line 252
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 256
    .line 257
    .line 258
    invoke-direct/range {p0 .. p3}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->e(Ll/tgi;Ll/zgi;Ljava/util/Map;)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    return-object v0

    .line 263
    :cond_5
    move-object/from16 v5, p3

    .line 264
    .line 265
    invoke-virtual {v8}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 266
    .line 267
    .line 268
    move-result-object v8

    .line 269
    const-string v9, "Patch download failed, fallback to full download"

    .line 270
    .line 271
    const/16 v13, 0xe

    .line 272
    .line 273
    const/4 v14, 0x0

    .line 274
    const/4 v10, 0x0

    .line 275
    const/4 v11, 0x0

    .line 276
    const/4 v12, 0x0

    .line 277
    invoke-static/range {v8 .. v14}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 278
    .line 279
    .line 280
    invoke-direct/range {p0 .. p3}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->e(Ll/tgi;Ll/zgi;Ljava/util/Map;)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    return-object v0

    .line 285
    :cond_6
    invoke-direct/range {p0 .. p3}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->e(Ll/tgi;Ll/zgi;Ljava/util/Map;)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 289
    return-object v0

    .line 290
    :goto_3
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 291
    .line 292
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    new-instance v2, Ljava/lang/StringBuilder;

    .line 297
    .line 298
    const-string v3, "Download failed: "

    .line 299
    .line 300
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v3

    .line 307
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    const/16 v3, -0xbbc

    .line 315
    .line 316
    invoke-virtual {v1, v3, v2, v0, v5}, Ll/pgi;->c(ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 317
    .line 318
    .line 319
    return-object v7
.end method

.method private final g(Ll/zgi;Ll/tgi;)Z
    .locals 3

    .line 1
    invoke-virtual {p2}, Ll/tgi;->k()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p2, 0x0

    .line 6
    const/4 v0, 0x1

    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    move p0, v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move p0, p2

    .line 12
    :goto_0
    invoke-virtual {p1}, Ll/zgi;->f()Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;->isSandbox()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    move p1, v0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move p1, p2

    .line 27
    :goto_1
    if-eq p0, p1, :cond_2

    .line 28
    .line 29
    move p2, v0

    .line 30
    :cond_2
    if-eqz p2, :cond_3

    .line 31
    .line 32
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v2, "needSwitchEnv: "

    .line 41
    .line 42
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v2, ", localIsSandbox: "

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p1, ", checkUpdate, isSandbox: "

    .line 57
    .line 58
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const/4 p1, 0x2

    .line 69
    const/4 v1, 0x0

    .line 70
    invoke-static {v0, p0, v1, p1, v1}, Ll/pgi;->b(Ll/pgi;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    :cond_3
    return p2
.end method


# virtual methods
.method public final c(Ll/zgi;Ll/ngi;)V
    .locals 11
    .param p1    # Ll/zgi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/ngi;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 5
    .line 6
    invoke-direct {v0}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 10
    .line 11
    sget-object v1, Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;->CheckingUpdate:Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Ll/zgi;->u(Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p1, Ll/zgi;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/zgi;->k()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    iget-object p1, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Ll/zgi;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/zgi;->e()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v1, "bid"

    .line 33
    .line 34
    invoke-static {v1, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v1, "url"

    .line 39
    .line 40
    invoke-static {v5}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    filled-new-array {p1, v1}, [Lkotlin/Pair;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string v1, "FepPackageUpdateModule-checkAndUpdate"

    .line 57
    .line 58
    invoke-static {p1, v1}, Ll/xgi;->a(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    .line 59
    .line 60
    .line 61
    move-result-object v8

    .line 62
    sget-object p1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->b()Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object p1, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 69
    .line 70
    move-object v2, p1

    .line 71
    check-cast v2, Ll/zgi;

    .line 72
    .line 73
    check-cast p1, Ll/zgi;

    .line 74
    .line 75
    invoke-virtual {p1}, Ll/zgi;->e()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    iget-object p1, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast p1, Ll/zgi;

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/zgi;->d()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    iget-object p1, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast p1, Ll/zgi;

    .line 90
    .line 91
    invoke-virtual {p1}, Ll/zgi;->g()J

    .line 92
    .line 93
    .line 94
    move-result-wide v6

    .line 95
    new-instance v10, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;

    .line 96
    .line 97
    invoke-direct {v10, p0, v0, v5, v8}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;-><init>(Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;Lkotlin/jvm/internal/Ref$ObjectRef;Ljava/lang/String;Ljava/util/Map;)V

    .line 98
    .line 99
    .line 100
    move-object v9, p2

    .line 101
    invoke-virtual/range {v1 .. v10}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule;->a(Ll/zgi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;Ll/ngi;Lkotlin/jvm/functions/Function2;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final h(Ll/zgi;Ll/tgi;Ljava/util/Map;)V
    .locals 4
    .param p1    # Ll/zgi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/tgi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/zgi;",
            "Ll/tgi;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Ll/tgi;->j()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string p3, "Preload: skip "

    .line 25
    .line 26
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ll/zgi;->e()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p3, ", no new version"

    .line 37
    .line 38
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    const/4 p3, 0x2

    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-static {p0, p2, v0, p3, v0}, Ll/pgi;->b(Ll/pgi;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    sget-object p0, Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;->Ready:Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 51
    .line 52
    invoke-virtual {p1, p0}, Ll/zgi;->u(Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p1}, Ll/zgi;->e()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {p1}, Ll/zgi;->d()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v1, v2, v3}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p1}, Ll/zgi;->e()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {p1}, Ll/zgi;->d()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {p2}, Ll/tgi;->c()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-virtual {v0, v1, v2, v3}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->E(Ljava/lang/String;Ljava/lang/String;I)V

    .line 90
    .line 91
    .line 92
    invoke-direct {p0, p1, p2, p3}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->d(Ll/zgi;Ll/tgi;Ljava/util/Map;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method
