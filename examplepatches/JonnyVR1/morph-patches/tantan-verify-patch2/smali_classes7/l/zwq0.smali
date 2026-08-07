.class public abstract Ll/zwq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zwq0$a;
    }
.end annotation


# direct methods
.method public static a(II)I
    .locals 1

    .line 1
    add-int/lit16 v0, p1, 0xf3

    .line 2
    .line 3
    div-int/lit16 v0, v0, 0x5a8

    .line 4
    .line 5
    mul-int/lit16 v0, v0, 0x84

    .line 6
    .line 7
    add-int/lit16 v0, v0, 0x438

    .line 8
    .line 9
    add-int/2addr v0, p0

    .line 10
    add-int/2addr v0, p1

    .line 11
    return v0
.end method

.method public static b(III)I
    .locals 1

    .line 1
    add-int/lit16 v0, p1, 0xc8

    .line 2
    .line 3
    div-int/lit16 v0, v0, 0x5a8

    .line 4
    .line 5
    mul-int/lit16 v0, v0, 0x84

    .line 6
    .line 7
    add-int/lit16 v0, v0, 0x3f3

    .line 8
    .line 9
    add-int/2addr v0, p1

    .line 10
    add-int/2addr v0, p0

    .line 11
    add-int/2addr v0, p2

    .line 12
    return v0
.end method

.method public static c(Ljava/lang/String;)I
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_0
    const-string v0, "UTF-8"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    array-length p0, p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    return p0

    .line 17
    :catch_0
    return v1
.end method

.method public static d(Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ltq0;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/ltq0;

    .line 17
    .line 18
    invoke-interface {v1}, Ll/ltq0;->a()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_1

    .line 27
    .line 28
    invoke-interface {v1}, Ll/ltq0;->a()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    add-int/2addr v0, v2

    .line 37
    :cond_1
    invoke-interface {v1}, Ll/ltq0;->b()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-nez v2, :cond_0

    .line 46
    .line 47
    invoke-interface {v1}, Ll/ltq0;->b()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    add-int/2addr v0, v1

    .line 56
    goto :goto_0

    .line 57
    :cond_2
    mul-int/lit8 v0, v0, 0x2

    .line 58
    .line 59
    return v0
.end method

.method private static e(Ll/ywq0;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ywq0;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/ltq0;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ywq0;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p3}, Ll/zwq0;->c(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-static {p0, p1}, Ll/zwq0;->a(II)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/ywq0;->a()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/4 v0, 0x2

    .line 26
    if-ne p0, v0, :cond_1

    .line 27
    .line 28
    invoke-static {p2}, Ll/zwq0;->d(Ljava/util/List;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-static {p3}, Ll/zwq0;->c(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    invoke-static {p1, p0, p2}, Ll/zwq0;->b(III)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_1
    const/4 p0, -0x1

    .line 46
    return p0
.end method

.method public static f(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/ltq0;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/zwq0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zwq0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {p0, p1, p2, v0, v1}, Ll/zwq0;->g(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Ll/ywq0;Z)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static g(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Ll/ywq0;Z)Ljava/lang/String;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/ltq0;",
            ">;",
            "Ll/ywq0;",
            "Z)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    invoke-static {v1}, Ll/mtq0;->t(Landroid/content/Context;)Z

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    if-eqz v4, :cond_a

    .line 14
    .line 15
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    if-eqz p4, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/xwq0;->a()Ll/xwq0;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    invoke-virtual {v6, v0}, Ll/xwq0;->a(Ljava/lang/String;)Ll/swq0;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    if-eqz v6, :cond_1

    .line 31
    .line 32
    invoke-virtual {v6, v0}, Ll/swq0;->c(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 38
    const/16 v16, 0x0

    .line 39
    .line 40
    goto/16 :goto_a

    .line 41
    .line 42
    :cond_0
    const/4 v6, 0x0

    .line 43
    :cond_1
    :goto_0
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    if-nez v7, :cond_2

    .line 48
    .line 49
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_2
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    const/4 v7, 0x0

    .line 57
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_9

    .line 62
    .line 63
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    move-object v8, v0

    .line 68
    check-cast v8, Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    new-instance v0, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 75
    .line 76
    .line 77
    move-object v13, v0

    .line 78
    goto :goto_2

    .line 79
    :cond_3
    const/4 v13, 0x0

    .line 80
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 81
    .line 82
    .line 83
    move-result-wide v14
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    :try_start_1
    invoke-virtual {v3, v1, v8, v13}, Ll/ywq0;->c(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_4

    .line 89
    .line 90
    goto/16 :goto_9

    .line 91
    .line 92
    :cond_4
    invoke-virtual {v3, v1, v8, v13}, Ll/ywq0;->b(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v12
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5

    .line 96
    :try_start_2
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    .line 100
    if-nez v0, :cond_6

    .line 101
    .line 102
    if-eqz v6, :cond_5

    .line 103
    .line 104
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 105
    .line 106
    .line 107
    move-result-wide v9

    .line 108
    sub-long/2addr v9, v14

    .line 109
    invoke-static {v3, v8, v13, v12}, Ll/zwq0;->e(Ll/ywq0;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 113
    move-object/from16 p4, v6

    .line 114
    .line 115
    const/16 v16, 0x0

    .line 116
    .line 117
    int-to-long v5, v0

    .line 118
    move-object v7, v8

    .line 119
    move-wide v8, v9

    .line 120
    move-wide v10, v5

    .line 121
    move-object/from16 v6, p4

    .line 122
    .line 123
    :try_start_4
    invoke-virtual/range {v6 .. v11}, Ll/swq0;->k(Ljava/lang/String;JJ)V

    .line 124
    .line 125
    .line 126
    goto :goto_5

    .line 127
    :catch_1
    move-exception v0

    .line 128
    move-object v8, v7

    .line 129
    :goto_3
    move-object v5, v12

    .line 130
    :goto_4
    move-object v12, v0

    .line 131
    goto :goto_7

    .line 132
    :catch_2
    move-exception v0

    .line 133
    move-object v7, v8

    .line 134
    const/16 v16, 0x0

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_5
    :goto_5
    move-object v7, v12

    .line 138
    goto :goto_9

    .line 139
    :cond_6
    move-object v7, v8

    .line 140
    const/16 v16, 0x0

    .line 141
    .line 142
    if-eqz v6, :cond_7

    .line 143
    .line 144
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 145
    .line 146
    .line 147
    move-result-wide v8

    .line 148
    sub-long/2addr v8, v14

    .line 149
    invoke-static {v3, v7, v13, v12}, Ll/zwq0;->e(Ll/ywq0;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 153
    int-to-long v10, v0

    .line 154
    move-object v5, v12

    .line 155
    const/4 v12, 0x0

    .line 156
    :try_start_5
    invoke-virtual/range {v6 .. v12}, Ll/swq0;->l(Ljava/lang/String;JJLjava/lang/Exception;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 157
    .line 158
    .line 159
    goto :goto_6

    .line 160
    :catch_3
    move-exception v0

    .line 161
    move-object v8, v7

    .line 162
    goto :goto_4

    .line 163
    :cond_7
    move-object v5, v12

    .line 164
    :goto_6
    move-object v7, v5

    .line 165
    goto :goto_1

    .line 166
    :catch_4
    move-exception v0

    .line 167
    move-object v5, v12

    .line 168
    const/16 v16, 0x0

    .line 169
    .line 170
    goto :goto_4

    .line 171
    :catch_5
    move-exception v0

    .line 172
    const/16 v16, 0x0

    .line 173
    .line 174
    move-object v12, v0

    .line 175
    move-object v5, v7

    .line 176
    :goto_7
    if-eqz v6, :cond_8

    .line 177
    .line 178
    :try_start_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 179
    .line 180
    .line 181
    move-result-wide v9

    .line 182
    sub-long/2addr v9, v14

    .line 183
    invoke-static {v3, v8, v13, v5}, Ll/zwq0;->e(Ll/ywq0;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    int-to-long v13, v0

    .line 188
    move-object v7, v8

    .line 189
    move-wide v8, v9

    .line 190
    move-wide v10, v13

    .line 191
    invoke-virtual/range {v6 .. v12}, Ll/swq0;->l(Ljava/lang/String;JJLjava/lang/Exception;)V

    .line 192
    .line 193
    .line 194
    goto :goto_8

    .line 195
    :catch_6
    move-exception v0

    .line 196
    goto :goto_a

    .line 197
    :cond_8
    :goto_8
    invoke-virtual {v12}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_6
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_6} :catch_6

    .line 198
    .line 199
    .line 200
    goto :goto_6

    .line 201
    :cond_9
    :goto_9
    return-object v7

    .line 202
    :goto_a
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 203
    .line 204
    .line 205
    goto :goto_b

    .line 206
    :cond_a
    const/16 v16, 0x0

    .line 207
    .line 208
    :goto_b
    return-object v16
.end method
