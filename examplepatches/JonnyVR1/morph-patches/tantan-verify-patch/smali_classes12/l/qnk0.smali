.class public Ll/qnk0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Ll/ag60;Ll/bej0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qnk0;->b(Ll/ag60;Ll/bej0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static b(Ll/ag60;Ll/bej0;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-static {v1}, Ll/rmw;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Ll/ag60;->b:Ljava/lang/String;

    .line 17
    .line 18
    new-instance v2, Ll/qnk0$a;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/qnk0$a;-><init>(Ll/ag60;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Lcom/immomo/hdata/android/MDevice;->getMMuidV3(Ljava/lang/String;Lcom/immomo/hdata/android/MDevice$MmuidCallBack;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception v1

    .line 28
    goto/16 :goto_6

    .line 29
    .line 30
    :cond_0
    :goto_0
    invoke-static {}, Ll/rmw;->d()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Ll/l8g0;->c(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    const-string v2, ""

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    move-object v1, v2

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :try_start_1
    invoke-static {}, Ll/rmw;->d()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    :goto_1
    invoke-virtual {p0, v1}, Ll/ag60;->c(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ll/rmw;->e()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Ll/l8g0;->c(Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    move-object v1, v2

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    invoke-static {}, Ll/rmw;->e()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    :goto_2
    invoke-virtual {p0, v1}, Ll/ag60;->e(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 68
    .line 69
    .line 70
    :try_start_2
    invoke-static {}, Ll/rmw;->a()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-static {v1}, Ll/l8g0;->c(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    move-object v1, v2

    .line 81
    goto :goto_3

    .line 82
    :cond_3
    invoke-static {}, Ll/rmw;->a()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    :goto_3
    invoke-virtual {p0, v1}, Ll/ag60;->b(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 87
    .line 88
    .line 89
    goto :goto_4

    .line 90
    :catch_1
    :try_start_3
    invoke-virtual {p0, v2}, Ll/ag60;->b(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :goto_4
    new-instance v1, Lorg/json/JSONObject;

    .line 94
    .line 95
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 96
    .line 97
    .line 98
    const/4 v3, 0x3

    .line 99
    new-array v4, v3, [B

    .line 100
    .line 101
    fill-array-data v4, :array_0

    .line 102
    .line 103
    .line 104
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-static {}, Ll/xiw;->d()I

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 113
    .line 114
    .line 115
    new-array v3, v3, [B

    .line 116
    .line 117
    fill-array-data v3, :array_1

    .line 118
    .line 119
    .line 120
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    const/16 v4, 0x1c

    .line 129
    .line 130
    if-ne v3, v4, :cond_4

    .line 131
    .line 132
    const/4 v3, 0x1

    .line 133
    goto :goto_5

    .line 134
    :cond_4
    move v3, v0

    .line 135
    :goto_5
    sput-boolean v3, Ll/xiw;->d:Z

    .line 136
    .line 137
    invoke-static {p0, p1}, Ll/qnk0;->d(Ll/ag60;Ll/bej0;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    if-eqz p1, :cond_5

    .line 142
    .line 143
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v4

    .line 147
    sget-object v5, Lcom/immomo/utils/tools/TraceData$LogNode;->DATA_COLLECTION_COMPLETED:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 148
    .line 149
    new-array v6, v0, [Ljava/lang/Object;

    .line 150
    .line 151
    invoke-static {v5, p0, v2, v6}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-interface {p1, v4, v2}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    :cond_5
    new-instance v2, Ll/mml;

    .line 159
    .line 160
    invoke-static {p0, v1}, Ll/qnk0;->i(Ll/ag60;Lorg/json/JSONObject;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-direct {v2, v1, v3}, Ll/mml;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v2, p0, p1}, Ll/mml;->a(Ll/ag60;Ll/bej0;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 168
    .line 169
    .line 170
    goto :goto_7

    .line 171
    :goto_6
    if-eqz p1, :cond_6

    .line 172
    .line 173
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    sget-object v3, Lcom/immomo/utils/tools/TraceData$LogNode;->DATA_COLLECTION_FAILED:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 178
    .line 179
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    new-array v0, v0, [Ljava/lang/Object;

    .line 184
    .line 185
    invoke-static {v3, p0, v1, v0}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-interface {p1, v2, p0}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    :cond_6
    :goto_7
    return-void

    .line 193
    :array_0
    .array-data 1
        0x5et
        0x13t
        0x5ct
    .end array-data

    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    :array_1
    .array-data 1
        0x5et
        0x13t
        0x5ct
    .end array-data
.end method

.method private static c()Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ll/l8g0;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object v0

    .line 6
    :catch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    new-array v1, v1, [B

    .line 13
    .line 14
    fill-array-data v1, :array_0

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    return-object v0

    .line 36
    nop

    .line 37
    :array_0
    .array-data 1
        0x42t
        0x3t
        0x40t
        0x68t
    .end array-data
.end method

.method public static d(Ll/ag60;Ll/bej0;)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    invoke-static {v0, p0}, Ll/qnk0;->h(Lorg/json/JSONObject;Ll/ag60;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1, p0}, Ll/qnk0;->h(Lorg/json/JSONObject;Ll/ag60;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception v2

    .line 19
    invoke-static {v2}, Ll/kmw;->a(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    :try_start_1
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2, p0}, Ll/qnk0;->f(Landroid/content/Context;Ll/ag60;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const/16 v3, 0x9

    .line 31
    .line 32
    new-array v4, v3, [B

    .line 33
    .line 34
    fill-array-data v4, :array_0

    .line 35
    .line 36
    .line 37
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    new-array v3, v3, [B

    .line 45
    .line 46
    fill-array-data v3, :array_1

    .line 47
    .line 48
    .line 49
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    new-instance v2, Lorg/json/JSONObject;

    .line 57
    .line 58
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 59
    .line 60
    .line 61
    const/16 v3, 0xb

    .line 62
    .line 63
    new-array v3, v3, [B

    .line 64
    .line 65
    fill-array-data v3, :array_2

    .line 66
    .line 67
    .line 68
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const/16 v2, 0x66

    .line 88
    .line 89
    invoke-static {v0, v2}, Lcom/immomo/hdata/android/Coded;->doCommand([BI)[B

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const/4 v2, 0x0

    .line 94
    if-eqz v0, :cond_0

    .line 95
    .line 96
    array-length v3, v0

    .line 97
    if-lez v3, :cond_0

    .line 98
    .line 99
    invoke-static {v0, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0

    .line 104
    :catch_1
    move-exception p0

    .line 105
    goto :goto_1

    .line 106
    :cond_0
    if-eqz p1, :cond_1

    .line 107
    .line 108
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    sget-object v3, Lcom/immomo/utils/tools/TraceData$LogNode;->DATA_COLLECTION_FAILED:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 113
    .line 114
    const/16 v4, 0x12

    .line 115
    .line 116
    new-array v4, v4, [B

    .line 117
    .line 118
    fill-array-data v4, :array_3

    .line 119
    .line 120
    .line 121
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    new-array v2, v2, [Ljava/lang/Object;

    .line 126
    .line 127
    invoke-static {v3, p0, v4, v2}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-interface {p1, v0, p0}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 132
    .line 133
    .line 134
    goto :goto_2

    .line 135
    :goto_1
    invoke-static {v1, p0}, Ll/qnk0;->g(Lorg/json/JSONObject;Ljava/lang/Exception;)V

    .line 136
    .line 137
    .line 138
    :cond_1
    :goto_2
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0

    .line 143
    :array_0
    .array-data 1
        0x52t
        0x7t
        0x42t
        0x5et
        0x2t
        0xft
        0x5et
        0x0t
        0x5et
    .end array-data

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    nop

    .line 153
    :array_1
    .array-data 1
        0x52t
        0x7t
        0x42t
        0x5et
        0x2t
        0xft
        0x5et
        0x0t
        0x5et
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    nop

    .line 163
    :array_2
    .array-data 1
        0x53t
        0xat
        0x58t
        0x52t
        0xft
        0x12t
        0x6ft
        0xft
        0x5ft
        0x51t
        0xet
    .end array-data

    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    :array_3
    .array-data 1
        -0x2bt
        -0x14t
        -0x6ft
        -0x2et
        -0x32t
        -0x20t
        -0x2at
        -0xdt
        -0x7ft
        -0x2ft
        -0x14t
        -0x38t
        -0x2ct
        -0x22t
        -0x75t
        -0x30t
        -0x38t
        -0x24t
    .end array-data
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/bej0;)V
    .locals 23

    .line 1
    move-object/from16 v1, p6

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :try_start_0
    invoke-static {}, Ll/qnk0;->c()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v10

    .line 8
    new-instance v3, Ll/ag60;

    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v11

    .line 14
    move-object/from16 v4, p0

    .line 15
    .line 16
    move-object/from16 v5, p1

    .line 17
    .line 18
    move-object/from16 v6, p2

    .line 19
    .line 20
    move-object/from16 v7, p3

    .line 21
    .line 22
    move-object/from16 v8, p4

    .line 23
    .line 24
    move-object/from16 v9, p5

    .line 25
    .line 26
    invoke-direct/range {v3 .. v12}, Ll/ag60;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 27
    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v4, Lcom/immomo/utils/tools/TraceData$LogNode;->START_COLLECTION_DATA:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 36
    .line 37
    const-string v5, ""

    .line 38
    .line 39
    new-array v6, v2, [Ljava/lang/Object;

    .line 40
    .line 41
    invoke-static {v4, v3, v5, v6}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-interface {v1, v0, v4}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception v0

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    :goto_0
    invoke-static/range {p5 .. p5}, Ll/qnk0;->j(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    new-instance v0, Ll/vmk0;

    .line 55
    .line 56
    invoke-direct {v0, v3, v1}, Ll/vmk0;-><init>(Ll/ag60;Ll/bej0;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Ll/nyi0;->a(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :goto_1
    :try_start_1
    new-instance v13, Ll/ag60;

    .line 64
    .line 65
    const-string v20, ""

    .line 66
    .line 67
    const-wide/16 v21, 0x0

    .line 68
    .line 69
    move-object/from16 v14, p0

    .line 70
    .line 71
    move-object/from16 v15, p1

    .line 72
    .line 73
    move-object/from16 v16, p2

    .line 74
    .line 75
    move-object/from16 v17, p3

    .line 76
    .line 77
    move-object/from16 v18, p4

    .line 78
    .line 79
    move-object/from16 v19, p5

    .line 80
    .line 81
    invoke-direct/range {v13 .. v22}, Ll/ag60;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 82
    .line 83
    .line 84
    if-eqz v1, :cond_1

    .line 85
    .line 86
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    sget-object v4, Lcom/immomo/utils/tools/TraceData$LogNode;->CALL_SDK_FAILED:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-array v2, v2, [Ljava/lang/Object;

    .line 97
    .line 98
    invoke-static {v4, v13, v0, v2}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-interface {v1, v3, v0}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    .line 104
    .line 105
    :catchall_0
    :cond_1
    return-void
.end method

.method private static f(Landroid/content/Context;Ll/ag60;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ll/vmw;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vmw;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/re5;

    .line 7
    .line 8
    invoke-direct {v1, p0, v0, p1}, Ll/re5;-><init>(Landroid/content/Context;Ll/vmw;Ll/ag60;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p1, Ll/ag60;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Ll/re5;->b(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ll/vmw;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method private static g(Lorg/json/JSONObject;Ljava/lang/Exception;)V
    .locals 9

    .line 1
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    array-length v2, v1

    .line 11
    const/4 v3, 0x0

    .line 12
    move v4, v3

    .line 13
    :goto_0
    if-ge v4, v2, :cond_0

    .line 14
    .line 15
    aget-object v5, v1, v4

    .line 16
    .line 17
    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    new-instance v7, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const/4 v6, 0x1

    .line 34
    new-array v6, v6, [B

    .line 35
    .line 36
    const/16 v8, 0x1e

    .line 37
    .line 38
    aput-byte v8, v6, v3

    .line 39
    .line 40
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    add-int/lit8 v4, v4, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    const/4 v1, 0x5

    .line 61
    new-array v1, v1, [B

    .line 62
    .line 63
    fill-array-data v1, :array_0

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    new-instance v2, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const/4 p1, 0x7

    .line 79
    new-array p1, p1, [B

    .line 80
    .line 81
    fill-array-data p1, :array_1

    .line 82
    .line 83
    .line 84
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .line 100
    .line 101
    :catch_0
    return-void

    .line 102
    nop

    .line 103
    :array_0
    .array-data 1
        0x55t
        0x14t
        0x43t
        0x58t
        0x13t
    .end array-data

    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    nop

    .line 111
    :array_1
    .array-data 1
        0x13t
        0x15t
        0x45t
        0x56t
        0x2t
        0xdt
        0xat
    .end array-data
.end method

.method private static h(Lorg/json/JSONObject;Ll/ag60;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v2, p1, Ll/ag60;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    new-array v0, v0, [B

    .line 18
    .line 19
    fill-array-data v0, :array_1

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p1, Ll/ag60;->c:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x7

    .line 32
    new-array v0, v0, [B

    .line 33
    .line 34
    fill-array-data v0, :array_2

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p1, Ll/ag60;->d:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x6

    .line 47
    new-array v0, v0, [B

    .line 48
    .line 49
    fill-array-data v0, :array_3

    .line 50
    .line 51
    .line 52
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object p1, p1, Ll/ag60;->a:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    const/16 p1, 0xa

    .line 62
    .line 63
    new-array p1, p1, [B

    .line 64
    .line 65
    fill-array-data p1, :array_4

    .line 66
    .line 67
    .line 68
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {}, Ll/xiw;->b()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    nop

    .line 81
    :array_0
    .array-data 1
        0x51t
        0x5t
        0x52t
        0x58t
        0x14t
        0x8t
        0x44t
        0xft
        0x55t
    .end array-data

    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    nop

    .line 91
    :array_1
    .array-data 1
        0x43t
        0x3t
        0x42t
        0x44t
        0x8t
        0x9t
        0x5et
        0xft
        0x55t
    .end array-data

    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    nop

    .line 101
    :array_2
    .array-data 1
        0x53t
        0xet
        0x50t
        0x59t
        0xft
        0x3t
        0x5ct
    .end array-data

    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    :array_3
    .array-data 1
        0x43t
        0x9t
        0x44t
        0x45t
        0x2t
        0x3t
    .end array-data

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    nop

    .line 117
    :array_4
    .array-data 1
        0x43t
        0x2t
        0x5at
        0x41t
        0x4t
        0x14t
        0x43t
        0xft
        0x5et
        0x59t
    .end array-data
.end method

.method private static i(Ll/ag60;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/16 v1, 0x68

    .line 12
    .line 13
    invoke-static {p1, v1}, Lcom/immomo/hdata/android/Coded;->doCommand([BI)[B

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    .line 18
    .line 19
    .line 20
    new-instance p1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const/16 v0, 0xb

    .line 36
    .line 37
    new-array v0, v0, [B

    .line 38
    .line 39
    fill-array-data v0, :array_0

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/ag60;->b:Ljava/lang/String;

    .line 50
    .line 51
    const/4 v1, 0x5

    .line 52
    new-array v1, v1, [B

    .line 53
    .line 54
    fill-array-data v1, :array_1

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v0, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const/16 v0, 0x8

    .line 69
    .line 70
    new-array v0, v0, [B

    .line 71
    .line 72
    fill-array-data v0, :array_2

    .line 73
    .line 74
    .line 75
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/ag60;->g:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    return-object p0

    .line 92
    :catch_0
    move-exception p0

    .line 93
    invoke-static {p0}, Ll/kmw;->a(Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    const/16 p1, 0xf

    .line 97
    .line 98
    new-array p1, p1, [B

    .line 99
    .line 100
    fill-array-data p1, :array_3

    .line 101
    .line 102
    .line 103
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    const/4 p0, 0x0

    .line 111
    return-object p0

    .line 112
    nop

    .line 113
    :array_0
    .array-data 1
        0x16t
        0x7t
        0x52t
        0x54t
        0xet
        0x13t
        0x5et
        0x12t
        0x58t
        0x53t
        0x5ct
    .end array-data

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    :array_1
    .array-data 1
        0x65t
        0x32t
        0x77t
        0x1at
        0x59t
    .end array-data

    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    nop

    .line 131
    :array_2
    .array-data 1
        0x16t
        0x14t
        0x54t
        0x46t
        0x3et
        0xft
        0x54t
        0x5bt
    .end array-data

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    :array_3
    .array-data 1
        0x65t
        0x34t
        0x7dt
        -0x2et
        -0x1at
        -0x20t
        -0x2bt
        -0x3et
        -0x4at
        -0x2et
        -0x3bt
        -0x29t
        -0x28t
        -0x2et
        -0x6ct
    .end array-data
.end method

.method private static j(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/16 p0, 0x1f

    .line 15
    .line 16
    new-array p0, p0, [B

    .line 17
    .line 18
    fill-array-data p0, :array_0

    .line 19
    .line 20
    .line 21
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    const/16 p0, 0x21

    .line 30
    .line 31
    new-array p0, p0, [B

    .line 32
    .line 33
    fill-array-data p0, :array_1

    .line 34
    .line 35
    .line 36
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    nop

    .line 45
    :array_0
    .array-data 1
        0x60t
        0xat
        0x54t
        0x56t
        0x12t
        0x3t
        0x10t
        0x5t
        0x50t
        0x5bt
        0xdt
        0x46t
        0x7dt
        0x22t
        0x54t
        0x41t
        0x8t
        0x5t
        0x55t
        0x48t
        0x58t
        0x59t
        0x8t
        0x12t
        0x10t
        0x0t
        0x58t
        0x45t
        0x12t
        0x12t
        0x11t
    .end array-data

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    :array_1
    .array-data 1
        0x71t
        0x14t
        0x56t
        0x42t
        0xct
        0x3t
        0x5et
        0x12t
        0x11t
        0x10t
        0x2t
        0xat
        0x59t
        0x3t
        0x5ft
        0x43t
        0x46t
        0x46t
        0x53t
        0x7t
        0x5ft
        0x59t
        0xet
        0x12t
        0x10t
        0x4t
        0x54t
        0x17t
        0xft
        0x13t
        0x5ct
        0xat
        0x10t
    .end array-data
.end method
