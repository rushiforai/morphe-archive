.class public Ll/hnf0;
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

.method public static a(Landroid/content/Context;)I
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    const/16 v0, 0x23

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p0, v0}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    :try_start_0
    invoke-static {p0}, Landroid/telephony/SubscriptionManager;->from(Landroid/content/Context;)Landroid/telephony/SubscriptionManager;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoCount()I

    .line 26
    .line 27
    .line 28
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    return p0

    .line 30
    :catch_0
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 31
    return p0

    .line 32
    nop

    .line 33
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x41t
        0x52t
        0x13t
        0xbt
        0x59t
        0x15t
        0x42t
        0x5et
        0xet
        0x8t
        0x1et
        0x34t
        0x74t
        0x76t
        0x25t
        0x39t
        0x60t
        0x2et
        0x7et
        0x79t
        0x24t
        0x39t
        0x63t
        0x32t
        0x70t
        0x63t
        0x24t
    .end array-data
.end method

.method public static b(I)Ljava/lang/String;
    .locals 32

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/16 v2, 0x1d

    .line 6
    .line 7
    if-lt v0, v2, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    invoke-static {}, Ll/hnf0;->e()Landroid/telephony/TelephonyManager;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_1
    const/16 v3, 0x22

    .line 18
    .line 19
    :try_start_0
    new-array v3, v3, [B

    .line 20
    .line 21
    const/16 v4, 0x51

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    aput-byte v4, v3, v5

    .line 25
    .line 26
    const/16 v6, 0x8

    .line 27
    .line 28
    const/4 v7, 0x1

    .line 29
    aput-byte v6, v3, v7

    .line 30
    .line 31
    const/16 v8, 0x55

    .line 32
    .line 33
    const/4 v9, 0x2

    .line 34
    aput-byte v8, v3, v9

    .line 35
    .line 36
    const/16 v10, 0x45

    .line 37
    .line 38
    const/4 v11, 0x3

    .line 39
    aput-byte v10, v3, v11

    .line 40
    .line 41
    const/4 v12, 0x4

    .line 42
    const/16 v13, 0xe

    .line 43
    .line 44
    aput-byte v13, v3, v12

    .line 45
    .line 46
    const/16 v14, 0xf

    .line 47
    .line 48
    const/4 v15, 0x5

    .line 49
    aput-byte v14, v3, v15

    .line 50
    .line 51
    const/16 v16, 0x54

    .line 52
    .line 53
    const/16 v17, 0x6

    .line 54
    .line 55
    aput-byte v16, v3, v17

    .line 56
    .line 57
    const/16 v18, 0x7

    .line 58
    .line 59
    const/16 v19, 0x48

    .line 60
    .line 61
    aput-byte v19, v3, v18

    .line 62
    .line 63
    aput-byte v10, v3, v6

    .line 64
    .line 65
    const/16 v20, 0x52

    .line 66
    .line 67
    const/16 v21, 0x9

    .line 68
    .line 69
    aput-byte v20, v3, v21

    .line 70
    .line 71
    const/16 v22, 0xa

    .line 72
    .line 73
    const/16 v23, 0xd

    .line 74
    .line 75
    aput-byte v23, v3, v22

    .line 76
    .line 77
    const/16 v24, 0xb

    .line 78
    .line 79
    aput-byte v11, v3, v24

    .line 80
    .line 81
    const/16 v25, 0x40

    .line 82
    .line 83
    const/16 v26, 0xc

    .line 84
    .line 85
    aput-byte v25, v3, v26

    .line 86
    .line 87
    aput-byte v13, v3, v23

    .line 88
    .line 89
    const/16 v25, 0x5e

    .line 90
    .line 91
    aput-byte v25, v3, v13

    .line 92
    .line 93
    const/16 v27, 0x59

    .line 94
    .line 95
    aput-byte v27, v3, v14

    .line 96
    .line 97
    const/16 v27, 0x10

    .line 98
    .line 99
    const/16 v28, 0x18

    .line 100
    .line 101
    aput-byte v28, v3, v27

    .line 102
    .line 103
    const/16 v27, 0x11

    .line 104
    .line 105
    aput-byte v19, v3, v27

    .line 106
    .line 107
    const/16 v29, 0x12

    .line 108
    .line 109
    const/16 v30, 0x64

    .line 110
    .line 111
    aput-byte v30, v3, v29

    .line 112
    .line 113
    const/16 v29, 0x13

    .line 114
    .line 115
    aput-byte v11, v3, v29

    .line 116
    .line 117
    const/16 v29, 0x5d

    .line 118
    .line 119
    const/16 v31, 0x14

    .line 120
    .line 121
    aput-byte v29, v3, v31

    .line 122
    .line 123
    const/16 v29, 0x15

    .line 124
    .line 125
    aput-byte v20, v3, v29

    .line 126
    .line 127
    const/16 v20, 0x16

    .line 128
    .line 129
    aput-byte v27, v3, v20

    .line 130
    .line 131
    const/16 v20, 0x17

    .line 132
    .line 133
    aput-byte v13, v3, v20

    .line 134
    .line 135
    const/16 v20, 0x5f

    .line 136
    .line 137
    aput-byte v20, v3, v28

    .line 138
    .line 139
    const/16 v20, 0x19

    .line 140
    .line 141
    aput-byte v6, v3, v20

    .line 142
    .line 143
    const/16 v20, 0x1a

    .line 144
    .line 145
    aput-byte v19, v3, v20

    .line 146
    .line 147
    const/16 v19, 0x1b

    .line 148
    .line 149
    const/16 v20, 0x7a

    .line 150
    .line 151
    aput-byte v20, v3, v19

    .line 152
    .line 153
    const/16 v19, 0x1c

    .line 154
    .line 155
    aput-byte v5, v3, v19

    .line 156
    .line 157
    aput-byte v6, v3, v2

    .line 158
    .line 159
    const/16 v2, 0x1e

    .line 160
    .line 161
    aput-byte v4, v3, v2

    .line 162
    .line 163
    const/16 v2, 0x1f

    .line 164
    .line 165
    aput-byte v7, v3, v2

    .line 166
    .line 167
    const/16 v2, 0x20

    .line 168
    .line 169
    aput-byte v16, v3, v2

    .line 170
    .line 171
    const/16 v2, 0x21

    .line 172
    .line 173
    aput-byte v10, v3, v2

    .line 174
    .line 175
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    new-array v3, v14, [B

    .line 184
    .line 185
    const/16 v4, 0x57

    .line 186
    .line 187
    aput-byte v4, v3, v5

    .line 188
    .line 189
    aput-byte v11, v3, v7

    .line 190
    .line 191
    aput-byte v10, v3, v9

    .line 192
    .line 193
    aput-byte v30, v3, v11

    .line 194
    .line 195
    aput-byte v31, v3, v12

    .line 196
    .line 197
    aput-byte v12, v3, v15

    .line 198
    .line 199
    const/16 v4, 0x43

    .line 200
    .line 201
    aput-byte v4, v3, v17

    .line 202
    .line 203
    aput-byte v15, v3, v18

    .line 204
    .line 205
    aput-byte v4, v3, v6

    .line 206
    .line 207
    aput-byte v25, v3, v21

    .line 208
    .line 209
    aput-byte v11, v3, v22

    .line 210
    .line 211
    aput-byte v11, v3, v24

    .line 212
    .line 213
    const/16 v4, 0x42

    .line 214
    .line 215
    aput-byte v4, v3, v26

    .line 216
    .line 217
    const/16 v4, 0x2f

    .line 218
    .line 219
    aput-byte v4, v3, v23

    .line 220
    .line 221
    aput-byte v8, v3, v13

    .line 222
    .line 223
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    new-array v4, v7, [Ljava/lang/Class;

    .line 228
    .line 229
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 230
    .line 231
    aput-object v6, v4, v5

    .line 232
    .line 233
    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    if-eqz v2, :cond_2

    .line 238
    .line 239
    new-array v3, v7, [Ljava/lang/Object;

    .line 240
    .line 241
    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 242
    .line 243
    .line 244
    move-result-object v4

    .line 245
    aput-object v4, v3, v5

    .line 246
    .line 247
    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    .line 253
    goto :goto_0

    .line 254
    :catch_0
    :cond_2
    move-object v0, v1

    .line 255
    :goto_0
    if-eqz v0, :cond_3

    .line 256
    .line 257
    move-object v1, v0

    .line 258
    :cond_3
    return-object v1
.end method

.method public static c(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 6

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/hnf0;->a(Landroid/content/Context;)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/16 v2, 0x8

    .line 11
    .line 12
    new-array v3, v2, [B

    .line 13
    .line 14
    fill-array-data v3, :array_0

    .line 15
    .line 16
    .line 17
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-static {v0, v3, v4}, Ll/hnf0;->f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    if-gtz v1, :cond_0

    .line 29
    .line 30
    return-object v0

    .line 31
    :cond_0
    new-instance v1, Lorg/json/JSONArray;

    .line 32
    .line 33
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 34
    .line 35
    .line 36
    const/16 v3, 0x1e

    .line 37
    .line 38
    new-array v3, v3, [B

    .line 39
    .line 40
    fill-array-data v3, :array_1

    .line 41
    .line 42
    .line 43
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Landroid/telephony/SubscriptionManager;

    .line 52
    .line 53
    const/16 v4, 0x10

    .line 54
    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    :try_start_0
    invoke-virtual {v3}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoList()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    if-eqz v3, :cond_1

    .line 62
    .line 63
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-nez v5, :cond_1

    .line 68
    .line 69
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    if-eqz v5, :cond_3

    .line 78
    .line 79
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    check-cast v5, Landroid/telephony/SubscriptionInfo;

    .line 84
    .line 85
    invoke-static {v5, p0}, Ll/hnf0;->d(Landroid/telephony/SubscriptionInfo;Landroid/content/Context;)Lorg/json/JSONObject;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :catch_0
    move-exception p0

    .line 94
    goto :goto_1

    .line 95
    :cond_1
    new-array p0, v4, [B

    .line 96
    .line 97
    fill-array-data p0, :array_2

    .line 98
    .line 99
    .line 100
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const/16 v3, 0x19

    .line 105
    .line 106
    new-array v3, v3, [B

    .line 107
    .line 108
    fill-array-data v3, :array_3

    .line 109
    .line 110
    .line 111
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-static {v0, p0, v3}, Ll/hnf0;->f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :goto_1
    new-array v3, v4, [B

    .line 120
    .line 121
    fill-array-data v3, :array_4

    .line 122
    .line 123
    .line 124
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    new-instance v4, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    const/16 v5, 0x2d

    .line 134
    .line 135
    new-array v5, v5, [B

    .line 136
    .line 137
    fill-array-data v5, :array_5

    .line 138
    .line 139
    .line 140
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-static {v0, v3, p0}, Ll/hnf0;->f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_2
    new-array p0, v4, [B

    .line 163
    .line 164
    fill-array-data p0, :array_6

    .line 165
    .line 166
    .line 167
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    const/16 v3, 0x1b

    .line 172
    .line 173
    new-array v3, v3, [B

    .line 174
    .line 175
    fill-array-data v3, :array_7

    .line 176
    .line 177
    .line 178
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    invoke-static {v0, p0, v3}, Ll/hnf0;->f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    :cond_3
    :goto_2
    new-array p0, v2, [B

    .line 186
    .line 187
    fill-array-data p0, :array_8

    .line 188
    .line 189
    .line 190
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-static {v0, p0, v1}, Ll/hnf0;->f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    return-object v0

    .line 198
    nop

    .line 199
    :array_0
    .array-data 1
        0x43t
        0xft
        0x5ct
        0x74t
        0xet
        0x13t
        0x5et
        0x12t
    .end array-data

    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    :array_1
    .array-data 1
        0x44t
        0x3t
        0x5dt
        0x52t
        0x11t
        0xet
        0x5ft
        0x8t
        0x48t
        0x68t
        0x12t
        0x13t
        0x52t
        0x15t
        0x52t
        0x45t
        0x8t
        0x16t
        0x44t
        0xft
        0x5et
        0x59t
        0x3et
        0x15t
        0x55t
        0x14t
        0x47t
        0x5et
        0x2t
        0x3t
    .end array-data

    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    nop

    .line 227
    :array_2
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x64t
        0x28t
        0x2bt
        0x53t
        0x7t
        0x43t
        0x53t
        0x12t
        0x23t
        0x42t
        0x14t
        0x5et
        0x45t
    .end array-data

    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    :array_3
    .array-data 1
        0x7et
        0x9t
        0x11t
        0x56t
        0x2t
        0x12t
        0x59t
        0x10t
        0x54t
        0x17t
        0x32t
        0x2ft
        0x7dt
        0x46t
        0x52t
        0x56t
        0x13t
        0x2t
        0x43t
        0x46t
        0x57t
        0x58t
        0x14t
        0x8t
        0x54t
    .end array-data

    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    nop

    .line 257
    :array_4
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x64t
        0x28t
        0x2bt
        0x53t
        0x7t
        0x43t
        0x53t
        0x12t
        0x23t
        0x42t
        0x14t
        0x5et
        0x45t
    .end array-data

    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    :array_5
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x43t
        0x8t
        0x8t
        0x57t
        0x46t
        0x50t
        0x54t
        0x15t
        0xft
        0x46t
        0x3t
        0x11t
        0x44t
        0x14t
        0x4t
        0x43t
        0x5t
        0x43t
        0x5et
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x8t
        0x8t
        0x56t
        0x9t
        0x11t
        0x5bt
        0x8t
        0x15t
        0x44t
        0x5ct
        0x11t
    .end array-data

    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    nop

    .line 297
    :array_6
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x64t
        0x28t
        0x2bt
        0x53t
        0x7t
        0x43t
        0x53t
        0x12t
        0x23t
        0x42t
        0x14t
        0x5et
        0x45t
    .end array-data

    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    :array_7
    .array-data 1
        0x63t
        0x13t
        0x53t
        0x44t
        0x2t
        0x14t
        0x59t
        0x16t
        0x45t
        0x5et
        0xet
        0x8t
        0x7dt
        0x7t
        0x5ft
        0x56t
        0x6t
        0x3t
        0x42t
        0x46t
        0x58t
        0x44t
        0x41t
        0x8t
        0x45t
        0xat
        0x5dt
    .end array-data

    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    :array_8
    .array-data 1
        0x43t
        0xft
        0x5ct
        0x74t
        0x0t
        0x14t
        0x54t
        0x15t
    .end array-data
.end method

.method private static d(Landroid/telephony/SubscriptionInfo;Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 5
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x16
    .end annotation

    .line 1
    new-instance p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Landroid/telephony/SubscriptionInfo;->getSimSlotIndex()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {v0}, Ll/hnf0;->b(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p0}, Landroid/telephony/SubscriptionInfo;->getCountryIso()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {p0}, Landroid/telephony/SubscriptionInfo;->getIccId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {p0}, Landroid/telephony/SubscriptionInfo;->getNumber()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/16 v4, 0xc

    .line 27
    .line 28
    new-array v4, v4, [B

    .line 29
    .line 30
    fill-array-data v4, :array_0

    .line 31
    .line 32
    .line 33
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {p1, v4, v0}, Ll/hnf0;->f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x4

    .line 45
    new-array v0, v0, [B

    .line 46
    .line 47
    fill-array-data v0, :array_1

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {p1, v0, v1}, Ll/hnf0;->f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    const/16 v0, 0xa

    .line 58
    .line 59
    new-array v0, v0, [B

    .line 60
    .line 61
    fill-array-data v0, :array_2

    .line 62
    .line 63
    .line 64
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {p1, v0, v2}, Ll/hnf0;->f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    const/4 v0, 0x5

    .line 72
    new-array v0, v0, [B

    .line 73
    .line 74
    fill-array-data v0, :array_3

    .line 75
    .line 76
    .line 77
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {p1, v0, v3}, Ll/hnf0;->f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x6

    .line 85
    new-array v0, v0, [B

    .line 86
    .line 87
    fill-array-data v0, :array_4

    .line 88
    .line 89
    .line 90
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {p1, v0, p0}, Ll/hnf0;->f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .line 96
    .line 97
    return-object p1

    .line 98
    :catch_0
    move-exception p0

    .line 99
    const/16 v0, 0x10

    .line 100
    .line 101
    new-array v0, v0, [B

    .line 102
    .line 103
    fill-array-data v0, :array_5

    .line 104
    .line 105
    .line 106
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    new-instance v1, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .line 114
    .line 115
    const/16 v2, 0x2e

    .line 116
    .line 117
    new-array v2, v2, [B

    .line 118
    .line 119
    fill-array-data v2, :array_6

    .line 120
    .line 121
    .line 122
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {p1, v0, p0}, Ll/hnf0;->f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    return-object p1

    .line 144
    nop

    .line 145
    :array_0
    .array-data 1
        0x43t
        0xft
        0x5ct
        0x64t
        0xdt
        0x9t
        0x44t
        0x2ft
        0x5ft
        0x53t
        0x4t
        0x1et
    .end array-data

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :array_1
    .array-data 1
        0x59t
        0xbt
        0x42t
        0x5et
    .end array-data

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    :array_2
    .array-data 1
        0x53t
        0x9t
        0x44t
        0x59t
        0x15t
        0x14t
        0x49t
        0x2ft
        0x42t
        0x58t
    .end array-data

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    nop

    .line 171
    :array_3
    .array-data 1
        0x59t
        0x5t
        0x52t
        0x7et
        0x5t
    .end array-data

    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    nop

    .line 179
    :array_4
    .array-data 1
        0x5et
        0x13t
        0x5ct
        0x55t
        0x4t
        0x14t
    .end array-data

    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    nop

    .line 187
    :array_5
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x64t
        0x28t
        0x2bt
        0x53t
        0x7t
        0x43t
        0x53t
        0x12t
        0x23t
        0x42t
        0x14t
        0x5et
        0x45t
    .end array-data

    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    :array_6
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x53t
        0x14t
        0x54t
        0x56t
        0x15t
        0xft
        0x5et
        0x1t
        0x11t
        0x7dt
        0x32t
        0x29t
        0x7et
        0x46t
        0x5et
        0x55t
        0xbt
        0x3t
        0x53t
        0x12t
        0x11t
        0x51t
        0xet
        0x14t
        0x10t
        0x35t
        0x78t
        0x7at
        0x41t
        0x5t
        0x51t
        0x14t
        0x55t
        0x17t
        0x8t
        0x8t
        0x56t
        0x9t
        0xbt
        0x17t
    .end array-data
.end method

.method private static e()Landroid/telephony/TelephonyManager;
    .locals 2

    .line 1
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x5

    .line 6
    new-array v1, v1, [B

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 20
    .line 21
    return-object v0

    .line 22
    nop

    .line 23
    :array_0
    .array-data 1
        0x40t
        0xet
        0x5et
        0x59t
        0x4t
    .end array-data
.end method

.method private static f(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method
