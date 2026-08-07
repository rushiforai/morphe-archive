.class public Ll/ul20;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Landroid/net/wifi/WifiManager;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
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

.method private static a(Landroid/content/Context;)Z
    .locals 2

    .line 1
    const/16 v0, 0x24

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
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 21
    .line 22
    const/16 v1, 0x1d

    .line 23
    .line 24
    if-lt v0, v1, :cond_1

    .line 25
    .line 26
    const/16 v0, 0x27

    .line 27
    .line 28
    new-array v0, v0, [B

    .line 29
    .line 30
    fill-array-data v0, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {p0, v0}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_1
    const/16 v0, 0x29

    .line 43
    .line 44
    new-array v0, v0, [B

    .line 45
    .line 46
    fill-array-data v0, :array_2

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {p0, v0}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0

    .line 58
    nop

    .line 59
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
        0x27t
        0x72t
        0x74t
        0x24t
        0x35t
        0x63t
        0x39t
        0x66t
        0x7et
        0x27t
        0x2ft
        0x6ft
        0x35t
        0x65t
        0x76t
        0x35t
        0x23t
    .end array-data

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    :array_1
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
        0x27t
        0x72t
        0x74t
        0x24t
        0x35t
        0x63t
        0x39t
        0x77t
        0x7et
        0x2ft
        0x23t
        0x6ft
        0x2at
        0x7et
        0x74t
        0x20t
        0x32t
        0x79t
        0x29t
        0x7ft
    .end array-data

    :array_2
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
        0x27t
        0x72t
        0x74t
        0x24t
        0x35t
        0x63t
        0x39t
        0x72t
        0x78t
        0x20t
        0x34t
        0x63t
        0x23t
        0x6et
        0x7bt
        0x2et
        0x25t
        0x71t
        0x32t
        0x78t
        0x78t
        0x2ft
    .end array-data
.end method

.method public static b(Landroid/content/Context;)Ljava/util/List;
    .locals 14
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-ge v0, v1, :cond_2

    .line 6
    .line 7
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/16 v1, 0x24

    .line 12
    .line 13
    new-array v1, v1, [B

    .line 14
    .line 15
    fill-array-data v1, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/16 v1, 0x27

    .line 33
    .line 34
    new-array v1, v1, [B

    .line 35
    .line 36
    fill-array-data v1, :array_1

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0, v1}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-static {p0}, Ll/ul20;->i(Landroid/content/Context;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_0

    .line 54
    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    :try_start_0
    sget-object v0, Ll/ul20;->a:Landroid/net/wifi/WifiManager;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_1

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Landroid/net/wifi/WifiConfiguration;

    .line 83
    .line 84
    iget-object v2, v1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 85
    .line 86
    iget-object v3, v1, Landroid/net/wifi/WifiConfiguration;->BSSID:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v1}, Ll/ul20;->c(Landroid/net/wifi/WifiConfiguration;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    new-instance v4, Lorg/json/JSONObject;

    .line 93
    .line 94
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 95
    .line 96
    .line 97
    const/4 v5, 0x4

    .line 98
    new-array v6, v5, [B

    .line 99
    .line 100
    const/16 v7, 0x43

    .line 101
    .line 102
    const/4 v8, 0x0

    .line 103
    aput-byte v7, v6, v8

    .line 104
    .line 105
    const/16 v7, 0x15

    .line 106
    .line 107
    const/4 v9, 0x1

    .line 108
    aput-byte v7, v6, v9

    .line 109
    .line 110
    const/16 v10, 0x58

    .line 111
    .line 112
    const/4 v11, 0x2

    .line 113
    aput-byte v10, v6, v11

    .line 114
    .line 115
    const/16 v10, 0x53

    .line 116
    .line 117
    const/4 v12, 0x3

    .line 118
    aput-byte v10, v6, v12

    .line 119
    .line 120
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    invoke-virtual {v4, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    .line 126
    .line 127
    const/4 v2, 0x5

    .line 128
    new-array v6, v2, [B

    .line 129
    .line 130
    const/16 v10, 0x52

    .line 131
    .line 132
    aput-byte v10, v6, v8

    .line 133
    .line 134
    aput-byte v7, v6, v9

    .line 135
    .line 136
    const/16 v13, 0x42

    .line 137
    .line 138
    aput-byte v13, v6, v11

    .line 139
    .line 140
    const/16 v13, 0x5e

    .line 141
    .line 142
    aput-byte v13, v6, v12

    .line 143
    .line 144
    aput-byte v2, v6, v5

    .line 145
    .line 146
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    invoke-virtual {v4, v6, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 151
    .line 152
    .line 153
    const/16 v3, 0xe

    .line 154
    .line 155
    new-array v3, v3, [B

    .line 156
    .line 157
    const/16 v6, 0x55

    .line 158
    .line 159
    aput-byte v6, v3, v8

    .line 160
    .line 161
    const/16 v6, 0x8

    .line 162
    .line 163
    aput-byte v6, v3, v9

    .line 164
    .line 165
    aput-byte v10, v3, v11

    .line 166
    .line 167
    const/16 v8, 0x45

    .line 168
    .line 169
    aput-byte v8, v3, v12

    .line 170
    .line 171
    const/16 v8, 0x18

    .line 172
    .line 173
    aput-byte v8, v3, v5

    .line 174
    .line 175
    const/16 v5, 0x16

    .line 176
    .line 177
    aput-byte v5, v3, v2

    .line 178
    .line 179
    const/4 v2, 0x6

    .line 180
    const/16 v5, 0x44

    .line 181
    .line 182
    aput-byte v5, v3, v2

    .line 183
    .line 184
    const/4 v2, 0x7

    .line 185
    const/16 v5, 0xf

    .line 186
    .line 187
    aput-byte v5, v3, v2

    .line 188
    .line 189
    aput-byte v13, v3, v6

    .line 190
    .line 191
    const/16 v2, 0x9

    .line 192
    .line 193
    const/16 v5, 0x59

    .line 194
    .line 195
    aput-byte v5, v3, v2

    .line 196
    .line 197
    const/16 v2, 0xa

    .line 198
    .line 199
    aput-byte v7, v3, v2

    .line 200
    .line 201
    const/16 v2, 0x1f

    .line 202
    .line 203
    const/16 v5, 0xb

    .line 204
    .line 205
    aput-byte v2, v3, v5

    .line 206
    .line 207
    const/16 v2, 0xc

    .line 208
    .line 209
    const/16 v5, 0x40

    .line 210
    .line 211
    aput-byte v5, v3, v2

    .line 212
    .line 213
    const/16 v2, 0xd

    .line 214
    .line 215
    aput-byte v12, v3, v2

    .line 216
    .line 217
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    invoke-virtual {v4, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 222
    .line 223
    .line 224
    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :catch_0
    :cond_1
    return-object p0

    .line 230
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 231
    return-object p0

    .line 232
    nop

    .line 233
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
        0x27t
        0x72t
        0x74t
        0x24t
        0x35t
        0x63t
        0x39t
        0x66t
        0x7et
        0x27t
        0x2ft
        0x6ft
        0x35t
        0x65t
        0x76t
        0x35t
        0x23t
    .end array-data

    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
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
    :array_1
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
        0x27t
        0x72t
        0x74t
        0x24t
        0x35t
        0x63t
        0x39t
        0x77t
        0x7et
        0x2ft
        0x23t
        0x6ft
        0x2at
        0x7et
        0x74t
        0x20t
        0x32t
        0x79t
        0x29t
        0x7ft
    .end array-data
.end method

.method public static c(Landroid/net/wifi/WifiConfiguration;)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x7

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-array p0, v1, [B

    .line 12
    .line 13
    fill-array-data p0, :array_0

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    iget-object v0, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    invoke-virtual {v0, v2}, Ljava/util/BitSet;->get(I)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    .line 31
    .line 32
    const/4 v0, 0x3

    .line 33
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/4 p0, 0x4

    .line 41
    new-array p0, p0, [B

    .line 42
    .line 43
    fill-array-data p0, :array_1

    .line 44
    .line 45
    .line 46
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_2
    :goto_0
    new-array p0, v1, [B

    .line 52
    .line 53
    fill-array-data p0, :array_2

    .line 54
    .line 55
    .line 56
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :array_0
    .array-data 1
        0x67t
        0x36t
        0x70t
        0x68t
        0x31t
        0x35t
        0x7bt
    .end array-data

    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    :array_1
    .array-data 1
        0x7ft
        0x16t
        0x54t
        0x59t
    .end array-data

    .line 70
    .line 71
    :array_2
    .array-data 1
        0x67t
        0x36t
        0x70t
        0x68t
        0x31t
        0x35t
        0x7bt
    .end array-data
.end method

.method private static d(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0xc

    .line 7
    .line 8
    const/16 v2, 0x11

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    :try_start_0
    new-array p0, v1, [B

    .line 14
    .line 15
    fill-array-data p0, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 23
    .line 24
    .line 25
    new-array p0, v2, [B

    .line 26
    .line 27
    fill-array-data p0, :array_1

    .line 28
    .line 29
    .line 30
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/16 v1, 0xf

    .line 35
    .line 36
    new-array v1, v1, [B

    .line 37
    .line 38
    fill-array-data v1, :array_2

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 46
    .line 47
    .line 48
    return-object v0

    .line 49
    :cond_0
    const/4 v4, 0x5

    .line 50
    new-array v4, v4, [B

    .line 51
    .line 52
    fill-array-data v4, :array_3

    .line 53
    .line 54
    .line 55
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 64
    .line 65
    if-nez p0, :cond_1

    .line 66
    .line 67
    :try_start_1
    new-array p0, v1, [B

    .line 68
    .line 69
    fill-array-data p0, :array_4

    .line 70
    .line 71
    .line 72
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v0, p0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    new-array p0, v2, [B

    .line 80
    .line 81
    fill-array-data p0, :array_5

    .line 82
    .line 83
    .line 84
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const/16 v1, 0x18

    .line 89
    .line 90
    new-array v1, v1, [B

    .line 91
    .line 92
    fill-array-data v1, :array_6

    .line 93
    .line 94
    .line 95
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 100
    .line 101
    .line 102
    return-object v0

    .line 103
    :cond_1
    const/4 v3, 0x2

    .line 104
    :try_start_2
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    .line 105
    .line 106
    .line 107
    move-result p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 108
    const/16 v4, 0x14

    .line 109
    .line 110
    if-eq p0, v4, :cond_2

    .line 111
    .line 112
    packed-switch p0, :pswitch_data_0

    .line 113
    .line 114
    .line 115
    const/4 v3, 0x5

    .line 116
    goto :goto_0

    .line 117
    :pswitch_0
    const/4 v3, 0x4

    .line 118
    goto :goto_0

    .line 119
    :pswitch_1
    const/4 v3, 0x3

    .line 120
    goto :goto_0

    .line 121
    :cond_2
    const/4 v3, 0x6

    .line 122
    :goto_0
    :pswitch_2
    const/4 p0, 0x0

    .line 123
    goto :goto_1

    .line 124
    :catch_0
    move-exception p0

    .line 125
    new-instance v4, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    new-array v3, v3, [B

    .line 142
    .line 143
    fill-array-data v3, :array_7

    .line 144
    .line 145
    .line 146
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    const/4 v3, -0x1

    .line 165
    :goto_1
    :try_start_3
    new-array v1, v1, [B

    .line 166
    .line 167
    fill-array-data v1, :array_8

    .line 168
    .line 169
    .line 170
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 175
    .line 176
    .line 177
    new-array v1, v2, [B

    .line 178
    .line 179
    fill-array-data v1, :array_9

    .line 180
    .line 181
    .line 182
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 187
    .line 188
    .line 189
    :catch_1
    return-object v0

    .line 190
    nop

    .line 191
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
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
    :array_0
    .array-data 1
        0x5et
        0x3t
        0x45t
        0x40t
        0xet
        0x14t
        0x5bt
        0x39t
        0x45t
        0x4et
        0x11t
        0x3t
    .end array-data

    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    :array_1
    .array-data 1
        0x5et
        0x3t
        0x45t
        0x40t
        0xet
        0x14t
        0x5bt
        0x39t
        0x54t
        0x4ft
        0x2t
        0x3t
        0x40t
        0x12t
        0x58t
        0x58t
        0xft
    .end array-data

    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    nop

    .line 249
    :array_2
    .array-data 1
        0x73t
        0x9t
        0x5ft
        0x43t
        0x4t
        0x1et
        0x44t
        0x46t
        0x58t
        0x44t
        0x41t
        0x8t
        0x45t
        0xat
        0x5dt
    .end array-data

    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    :array_3
    .array-data 1
        0x40t
        0xet
        0x5et
        0x59t
        0x4t
    .end array-data

    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    nop

    .line 269
    :array_4
    .array-data 1
        0x5et
        0x3t
        0x45t
        0x40t
        0xet
        0x14t
        0x5bt
        0x39t
        0x45t
        0x4et
        0x11t
        0x3t
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
    :array_5
    .array-data 1
        0x5et
        0x3t
        0x45t
        0x40t
        0xet
        0x14t
        0x5bt
        0x39t
        0x54t
        0x4ft
        0x2t
        0x3t
        0x40t
        0x12t
        0x58t
        0x58t
        0xft
    .end array-data

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
    nop

    .line 293
    :array_6
    .array-data 1
        0x64t
        0x3t
        0x5dt
        0x52t
        0x11t
        0xet
        0x5ft
        0x8t
        0x48t
        0x7at
        0x0t
        0x8t
        0x51t
        0x1t
        0x54t
        0x45t
        0x41t
        0xft
        0x43t
        0x46t
        0x5ft
        0x42t
        0xdt
        0xat
    .end array-data

    .line 294
    .line 295
    .line 296
    .line 297
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
        0xat
        0x46t
    .end array-data

    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    nop

    .line 315
    :array_8
    .array-data 1
        0x5et
        0x3t
        0x45t
        0x40t
        0xet
        0x14t
        0x5bt
        0x39t
        0x45t
        0x4et
        0x11t
        0x3t
    .end array-data

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
    :array_9
    .array-data 1
        0x5et
        0x3t
        0x45t
        0x40t
        0xet
        0x14t
        0x5bt
        0x39t
        0x54t
        0x4ft
        0x2t
        0x3t
        0x40t
        0x12t
        0x58t
        0x58t
        0xft
    .end array-data
.end method

.method public static e(Landroid/content/Context;)I
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    const/16 v0, 0xc

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
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Landroid/net/ConnectivityManager;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-eqz v1, :cond_8

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    goto/16 :goto_1

    .line 35
    .line 36
    :cond_1
    const/4 v2, 0x1

    .line 37
    invoke-virtual {p0, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    if-eqz v3, :cond_3

    .line 42
    .line 43
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    sget-object v5, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    .line 48
    .line 49
    if-eq v4, v5, :cond_2

    .line 50
    .line 51
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    sget-object v4, Landroid/net/NetworkInfo$State;->CONNECTING:Landroid/net/NetworkInfo$State;

    .line 56
    .line 57
    if-ne v3, v4, :cond_3

    .line 58
    .line 59
    :cond_2
    return v2

    .line 60
    :cond_3
    invoke-virtual {p0, v0}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    if-eqz p0, :cond_8

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    sget-object v3, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    .line 71
    .line 72
    if-eq v2, v3, :cond_4

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    sget-object v3, Landroid/net/NetworkInfo$State;->CONNECTING:Landroid/net/NetworkInfo$State;

    .line 79
    .line 80
    if-ne v2, v3, :cond_8

    .line 81
    .line 82
    :cond_4
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/16 v1, 0x14

    .line 87
    .line 88
    if-eq v0, v1, :cond_7

    .line 89
    .line 90
    const/4 v1, 0x3

    .line 91
    packed-switch v0, :pswitch_data_0

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const/16 v0, 0x8

    .line 99
    .line 100
    new-array v2, v0, [B

    .line 101
    .line 102
    fill-array-data v2, :array_1

    .line 103
    .line 104
    .line 105
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-nez v2, :cond_6

    .line 114
    .line 115
    const/4 v2, 0x5

    .line 116
    new-array v3, v2, [B

    .line 117
    .line 118
    fill-array-data v3, :array_2

    .line 119
    .line 120
    .line 121
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {p0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    if-nez v3, :cond_6

    .line 130
    .line 131
    new-array v0, v0, [B

    .line 132
    .line 133
    fill-array-data v0, :array_3

    .line 134
    .line 135
    .line 136
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 141
    .line 142
    .line 143
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    if-eqz p0, :cond_5

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_5
    return v2

    .line 148
    :cond_6
    :goto_0
    return v1

    .line 149
    :pswitch_0
    const/4 p0, 0x4

    .line 150
    return p0

    .line 151
    :pswitch_1
    return v1

    .line 152
    :pswitch_2
    const/4 p0, 0x2

    .line 153
    return p0

    .line 154
    :cond_7
    const/4 p0, 0x6

    .line 155
    return p0

    .line 156
    :cond_8
    :goto_1
    return v0

    .line 157
    :catch_0
    const/4 p0, -0x1

    .line 158
    return p0

    .line 159
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 160
    .line 161
    .line 162
    .line 163
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
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ft
        0x59t
        0x4t
        0x5t
        0x44t
        0xft
        0x47t
        0x5et
        0x15t
        0x1ft
    .end array-data

    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    :array_1
    .array-data 1
        0x64t
        0x22t
        0x1ct
        0x64t
        0x22t
        0x22t
        0x7dt
        0x27t
    .end array-data

    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    :array_2
    .array-data 1
        0x67t
        0x25t
        0x75t
        0x7at
        0x20t
    .end array-data

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    nop

    .line 219
    :array_3
    .array-data 1
        0x73t
        0x22t
        0x7ct
        0x76t
        0x53t
        0x56t
        0x0t
        0x56t
    .end array-data
.end method

.method public static f(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 38
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 6
    .line 7
    .line 8
    const/16 v8, 0x4e

    .line 9
    .line 10
    const/16 v9, 0x5f

    .line 11
    .line 12
    const/16 v10, 0x10

    .line 13
    .line 14
    const/16 v11, 0x12

    .line 15
    .line 16
    const/16 v12, 0x44

    .line 17
    .line 18
    const/16 v13, 0xd

    .line 19
    .line 20
    const/16 v14, 0x39

    .line 21
    .line 22
    const/16 v15, 0x5b

    .line 23
    .line 24
    const/16 v16, 0x5d

    .line 25
    .line 26
    const/16 v2, 0x11

    .line 27
    .line 28
    const/16 v17, 0x14

    .line 29
    .line 30
    const/16 v18, 0x5e

    .line 31
    .line 32
    const/16 v19, 0x58

    .line 33
    .line 34
    const/16 v20, 0xb

    .line 35
    .line 36
    const/16 v21, 0x41

    .line 37
    .line 38
    const/16 v3, 0xc

    .line 39
    .line 40
    const/16 v22, 0x73

    .line 41
    .line 42
    const/16 v4, 0xf

    .line 43
    .line 44
    const/16 v23, 0x7

    .line 45
    .line 46
    const/16 v24, 0x6

    .line 47
    .line 48
    const/16 v25, 0x5

    .line 49
    .line 50
    const/16 v26, 0x40

    .line 51
    .line 52
    const/16 v27, 0x9

    .line 53
    .line 54
    const/16 v28, 0x8

    .line 55
    .line 56
    const/16 v29, 0x4

    .line 57
    .line 58
    const/16 v30, 0x46

    .line 59
    .line 60
    const/4 v5, 0x1

    .line 61
    const/16 v31, 0xa

    .line 62
    .line 63
    const/16 v32, 0xe

    .line 64
    .line 65
    const/16 v33, 0x45

    .line 66
    .line 67
    const/16 v34, 0x4f

    .line 68
    .line 69
    const/4 v6, 0x2

    .line 70
    const/16 v35, 0x3

    .line 71
    .line 72
    const/16 v36, 0x54

    .line 73
    .line 74
    const/4 v7, 0x0

    .line 75
    if-nez v0, :cond_0

    .line 76
    .line 77
    :try_start_0
    new-array v0, v3, [B

    .line 78
    .line 79
    aput-byte v18, v0, v7

    .line 80
    .line 81
    aput-byte v35, v0, v5

    .line 82
    .line 83
    aput-byte v33, v0, v6

    .line 84
    .line 85
    aput-byte v26, v0, v35

    .line 86
    .line 87
    aput-byte v32, v0, v29

    .line 88
    .line 89
    aput-byte v17, v0, v25

    .line 90
    .line 91
    aput-byte v15, v0, v24

    .line 92
    .line 93
    aput-byte v14, v0, v23

    .line 94
    .line 95
    aput-byte v33, v0, v28

    .line 96
    .line 97
    aput-byte v8, v0, v27

    .line 98
    .line 99
    aput-byte v2, v0, v31

    .line 100
    .line 101
    aput-byte v35, v0, v20

    .line 102
    .line 103
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v1, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 108
    .line 109
    .line 110
    new-array v0, v2, [B

    .line 111
    .line 112
    aput-byte v18, v0, v7

    .line 113
    .line 114
    aput-byte v35, v0, v5

    .line 115
    .line 116
    aput-byte v33, v0, v6

    .line 117
    .line 118
    aput-byte v26, v0, v35

    .line 119
    .line 120
    aput-byte v32, v0, v29

    .line 121
    .line 122
    aput-byte v17, v0, v25

    .line 123
    .line 124
    aput-byte v15, v0, v24

    .line 125
    .line 126
    aput-byte v14, v0, v23

    .line 127
    .line 128
    aput-byte v36, v0, v28

    .line 129
    .line 130
    aput-byte v34, v0, v27

    .line 131
    .line 132
    aput-byte v6, v0, v31

    .line 133
    .line 134
    aput-byte v35, v0, v20

    .line 135
    .line 136
    aput-byte v26, v0, v3

    .line 137
    .line 138
    aput-byte v11, v0, v13

    .line 139
    .line 140
    aput-byte v19, v0, v32

    .line 141
    .line 142
    aput-byte v19, v0, v4

    .line 143
    .line 144
    aput-byte v4, v0, v10

    .line 145
    .line 146
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    new-array v2, v4, [B

    .line 151
    .line 152
    aput-byte v22, v2, v7

    .line 153
    .line 154
    aput-byte v27, v2, v5

    .line 155
    .line 156
    aput-byte v9, v2, v6

    .line 157
    .line 158
    const/16 v4, 0x43

    .line 159
    .line 160
    aput-byte v4, v2, v35

    .line 161
    .line 162
    aput-byte v29, v2, v29

    .line 163
    .line 164
    const/16 v4, 0x1e

    .line 165
    .line 166
    aput-byte v4, v2, v25

    .line 167
    .line 168
    aput-byte v12, v2, v24

    .line 169
    .line 170
    aput-byte v30, v2, v23

    .line 171
    .line 172
    aput-byte v19, v2, v28

    .line 173
    .line 174
    aput-byte v12, v2, v27

    .line 175
    .line 176
    aput-byte v21, v2, v31

    .line 177
    .line 178
    aput-byte v28, v2, v20

    .line 179
    .line 180
    aput-byte v33, v2, v3

    .line 181
    .line 182
    aput-byte v31, v2, v13

    .line 183
    .line 184
    aput-byte v16, v2, v32

    .line 185
    .line 186
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 191
    .line 192
    .line 193
    return-object v1

    .line 194
    :cond_0
    move/from16 v37, v4

    .line 195
    .line 196
    new-array v4, v3, [B

    .line 197
    .line 198
    fill-array-data v4, :array_0

    .line 199
    .line 200
    .line 201
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    check-cast v4, Landroid/net/ConnectivityManager;

    .line 210
    .line 211
    if-nez v4, :cond_1

    .line 212
    .line 213
    :try_start_1
    new-array v0, v3, [B

    .line 214
    .line 215
    aput-byte v18, v0, v7

    .line 216
    .line 217
    aput-byte v35, v0, v5

    .line 218
    .line 219
    aput-byte v33, v0, v6

    .line 220
    .line 221
    aput-byte v26, v0, v35

    .line 222
    .line 223
    aput-byte v32, v0, v29

    .line 224
    .line 225
    aput-byte v17, v0, v25

    .line 226
    .line 227
    aput-byte v15, v0, v24

    .line 228
    .line 229
    aput-byte v14, v0, v23

    .line 230
    .line 231
    aput-byte v33, v0, v28

    .line 232
    .line 233
    aput-byte v8, v0, v27

    .line 234
    .line 235
    aput-byte v2, v0, v31

    .line 236
    .line 237
    aput-byte v35, v0, v20

    .line 238
    .line 239
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {v1, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 244
    .line 245
    .line 246
    new-array v0, v2, [B

    .line 247
    .line 248
    aput-byte v18, v0, v7

    .line 249
    .line 250
    aput-byte v35, v0, v5

    .line 251
    .line 252
    aput-byte v33, v0, v6

    .line 253
    .line 254
    aput-byte v26, v0, v35

    .line 255
    .line 256
    aput-byte v32, v0, v29

    .line 257
    .line 258
    aput-byte v17, v0, v25

    .line 259
    .line 260
    aput-byte v15, v0, v24

    .line 261
    .line 262
    aput-byte v14, v0, v23

    .line 263
    .line 264
    aput-byte v36, v0, v28

    .line 265
    .line 266
    aput-byte v34, v0, v27

    .line 267
    .line 268
    aput-byte v6, v0, v31

    .line 269
    .line 270
    aput-byte v35, v0, v20

    .line 271
    .line 272
    aput-byte v26, v0, v3

    .line 273
    .line 274
    aput-byte v11, v0, v13

    .line 275
    .line 276
    aput-byte v19, v0, v32

    .line 277
    .line 278
    aput-byte v19, v0, v37

    .line 279
    .line 280
    aput-byte v37, v0, v10

    .line 281
    .line 282
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    const/16 v4, 0x1b

    .line 287
    .line 288
    new-array v4, v4, [B

    .line 289
    .line 290
    aput-byte v22, v4, v7

    .line 291
    .line 292
    aput-byte v27, v4, v5

    .line 293
    .line 294
    aput-byte v9, v4, v6

    .line 295
    .line 296
    const/16 v5, 0x59

    .line 297
    .line 298
    aput-byte v5, v4, v35

    .line 299
    .line 300
    aput-byte v29, v4, v29

    .line 301
    .line 302
    aput-byte v25, v4, v25

    .line 303
    .line 304
    aput-byte v12, v4, v24

    .line 305
    .line 306
    aput-byte v37, v4, v23

    .line 307
    .line 308
    const/16 v5, 0x47

    .line 309
    .line 310
    aput-byte v5, v4, v28

    .line 311
    .line 312
    aput-byte v18, v4, v27

    .line 313
    .line 314
    const/16 v5, 0x15

    .line 315
    .line 316
    aput-byte v5, v4, v31

    .line 317
    .line 318
    const/16 v6, 0x1f

    .line 319
    .line 320
    aput-byte v6, v4, v20

    .line 321
    .line 322
    const/16 v6, 0x7d

    .line 323
    .line 324
    aput-byte v6, v4, v3

    .line 325
    .line 326
    aput-byte v23, v4, v13

    .line 327
    .line 328
    aput-byte v9, v4, v32

    .line 329
    .line 330
    const/16 v3, 0x56

    .line 331
    .line 332
    aput-byte v3, v4, v37

    .line 333
    .line 334
    aput-byte v24, v4, v10

    .line 335
    .line 336
    aput-byte v35, v4, v2

    .line 337
    .line 338
    const/16 v2, 0x42

    .line 339
    .line 340
    aput-byte v2, v4, v11

    .line 341
    .line 342
    const/16 v2, 0x13

    .line 343
    .line 344
    aput-byte v30, v4, v2

    .line 345
    .line 346
    aput-byte v19, v4, v17

    .line 347
    .line 348
    aput-byte v12, v4, v5

    .line 349
    .line 350
    const/16 v2, 0x16

    .line 351
    .line 352
    aput-byte v21, v4, v2

    .line 353
    .line 354
    const/16 v2, 0x17

    .line 355
    .line 356
    aput-byte v28, v4, v2

    .line 357
    .line 358
    const/16 v2, 0x18

    .line 359
    .line 360
    aput-byte v33, v4, v2

    .line 361
    .line 362
    const/16 v2, 0x19

    .line 363
    .line 364
    aput-byte v31, v4, v2

    .line 365
    .line 366
    const/16 v2, 0x1a

    .line 367
    .line 368
    aput-byte v16, v4, v2

    .line 369
    .line 370
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v2

    .line 374
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 375
    .line 376
    .line 377
    return-object v1

    .line 378
    :cond_1
    :try_start_2
    invoke-virtual {v4}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    .line 379
    .line 380
    .line 381
    move-result-object v9

    .line 382
    if-nez v9, :cond_3

    .line 383
    .line 384
    :cond_2
    :goto_0
    move v0, v7

    .line 385
    goto :goto_1

    .line 386
    :cond_3
    invoke-virtual {v4, v9}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    .line 387
    .line 388
    .line 389
    move-result-object v4

    .line 390
    if-nez v4, :cond_4

    .line 391
    .line 392
    goto :goto_0

    .line 393
    :cond_4
    invoke-virtual {v4, v5}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    .line 394
    .line 395
    .line 396
    move-result v9

    .line 397
    if-eqz v9, :cond_5

    .line 398
    .line 399
    move v0, v5

    .line 400
    goto :goto_1

    .line 401
    :cond_5
    invoke-virtual {v4, v7}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    .line 402
    .line 403
    .line 404
    move-result v4

    .line 405
    if-eqz v4, :cond_2

    .line 406
    .line 407
    invoke-static {v0}, Ll/ul20;->d(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 408
    .line 409
    .line 410
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 411
    return-object v0

    .line 412
    :catch_0
    move-exception v0

    .line 413
    goto :goto_2

    .line 414
    :goto_1
    const/4 v4, 0x0

    .line 415
    goto :goto_3

    .line 416
    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 417
    .line 418
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 419
    .line 420
    .line 421
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 422
    .line 423
    .line 424
    move-result-object v9

    .line 425
    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v9

    .line 429
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    new-array v9, v6, [B

    .line 433
    .line 434
    fill-array-data v9, :array_1

    .line 435
    .line 436
    .line 437
    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v9

    .line 441
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object v4

    .line 455
    const/4 v0, -0x1

    .line 456
    :goto_3
    :try_start_3
    new-array v9, v3, [B

    .line 457
    .line 458
    aput-byte v18, v9, v7

    .line 459
    .line 460
    aput-byte v35, v9, v5

    .line 461
    .line 462
    aput-byte v33, v9, v6

    .line 463
    .line 464
    aput-byte v26, v9, v35

    .line 465
    .line 466
    aput-byte v32, v9, v29

    .line 467
    .line 468
    aput-byte v17, v9, v25

    .line 469
    .line 470
    aput-byte v15, v9, v24

    .line 471
    .line 472
    aput-byte v14, v9, v23

    .line 473
    .line 474
    aput-byte v33, v9, v28

    .line 475
    .line 476
    aput-byte v8, v9, v27

    .line 477
    .line 478
    aput-byte v2, v9, v31

    .line 479
    .line 480
    aput-byte v35, v9, v20

    .line 481
    .line 482
    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v8

    .line 486
    invoke-virtual {v1, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 487
    .line 488
    .line 489
    new-array v0, v2, [B

    .line 490
    .line 491
    aput-byte v18, v0, v7

    .line 492
    .line 493
    aput-byte v35, v0, v5

    .line 494
    .line 495
    aput-byte v33, v0, v6

    .line 496
    .line 497
    aput-byte v26, v0, v35

    .line 498
    .line 499
    aput-byte v32, v0, v29

    .line 500
    .line 501
    aput-byte v17, v0, v25

    .line 502
    .line 503
    aput-byte v15, v0, v24

    .line 504
    .line 505
    aput-byte v14, v0, v23

    .line 506
    .line 507
    aput-byte v36, v0, v28

    .line 508
    .line 509
    aput-byte v34, v0, v27

    .line 510
    .line 511
    aput-byte v6, v0, v31

    .line 512
    .line 513
    aput-byte v35, v0, v20

    .line 514
    .line 515
    aput-byte v26, v0, v3

    .line 516
    .line 517
    aput-byte v11, v0, v13

    .line 518
    .line 519
    aput-byte v19, v0, v32

    .line 520
    .line 521
    aput-byte v19, v0, v37

    .line 522
    .line 523
    aput-byte v37, v0, v10

    .line 524
    .line 525
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 526
    .line 527
    .line 528
    move-result-object v0

    .line 529
    invoke-virtual {v1, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 530
    .line 531
    .line 532
    :catch_1
    return-object v1

    .line 533
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ft
        0x59t
        0x4t
        0x5t
        0x44t
        0xft
        0x47t
        0x5et
        0x15t
        0x1ft
    .end array-data

    .line 534
    .line 535
    .line 536
    .line 537
    .line 538
    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    :array_1
    .array-data 1
        0xat
        0x46t
    .end array-data
.end method

.method public static g(Landroid/content/Context;Z)Lorg/json/JSONObject;
    .locals 6

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x12

    .line 7
    .line 8
    :try_start_0
    invoke-static {p0}, Ll/ul20;->a(Landroid/content/Context;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x0

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    return-object v3

    .line 16
    :cond_0
    invoke-static {p0}, Ll/ul20;->i(Landroid/content/Context;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    return-object v3

    .line 23
    :cond_1
    sget-object p0, Ll/ul20;->a:Landroid/net/wifi/WifiManager;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const/4 v3, -0x1

    .line 36
    if-eq v2, v3, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const/4 v3, 0x1

    .line 43
    new-array v4, v3, [B

    .line 44
    .line 45
    const/4 v5, 0x0

    .line 46
    aput-byte v1, v4, v5

    .line 47
    .line 48
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_2

    .line 57
    .line 58
    new-array v4, v3, [B

    .line 59
    .line 60
    aput-byte v1, v4, v5

    .line 61
    .line 62
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-eqz v4, :cond_2

    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    sub-int/2addr v4, v3

    .line 77
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    goto :goto_0

    .line 82
    :catch_0
    move-exception p0

    .line 83
    goto/16 :goto_1

    .line 84
    .line 85
    :cond_2
    :goto_0
    const/4 v3, 0x4

    .line 86
    new-array v3, v3, [B

    .line 87
    .line 88
    fill-array-data v3, :array_0

    .line 89
    .line 90
    .line 91
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 96
    .line 97
    .line 98
    const/4 v2, 0x5

    .line 99
    new-array v2, v2, [B

    .line 100
    .line 101
    fill-array-data v2, :array_1

    .line 102
    .line 103
    .line 104
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 113
    .line 114
    .line 115
    const/4 v2, 0x6

    .line 116
    new-array v2, v2, [B

    .line 117
    .line 118
    fill-array-data v2, :array_2

    .line 119
    .line 120
    .line 121
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    sget-object v3, Ll/ul20;->a:Landroid/net/wifi/WifiManager;

    .line 126
    .line 127
    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getRssi()I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    const/16 v4, 0x3e9

    .line 136
    .line 137
    invoke-static {v3, v4}, Landroid/net/wifi/WifiManager;->calculateSignalLevel(II)I

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 142
    .line 143
    .line 144
    if-eqz p1, :cond_3

    .line 145
    .line 146
    const/4 p1, 0x7

    .line 147
    new-array p1, p1, [B

    .line 148
    .line 149
    fill-array-data p1, :array_3

    .line 150
    .line 151
    .line 152
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getIpAddress()I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    invoke-static {v2}, Ll/a2m;->b(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-virtual {v0, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 165
    .line 166
    .line 167
    const/16 p1, 0xf

    .line 168
    .line 169
    new-array v2, p1, [B

    .line 170
    .line 171
    fill-array-data v2, :array_4

    .line 172
    .line 173
    .line 174
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getLinkSpeed()I

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 183
    .line 184
    .line 185
    const/16 v2, 0xe

    .line 186
    .line 187
    new-array v2, v2, [B

    .line 188
    .line 189
    fill-array-data v2, :array_5

    .line 190
    .line 191
    .line 192
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getFrequency()I

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 201
    .line 202
    .line 203
    new-array p1, p1, [B

    .line 204
    .line 205
    fill-array-data p1, :array_6

    .line 206
    .line 207
    .line 208
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 217
    .line 218
    .line 219
    return-object v0

    .line 220
    :goto_1
    :try_start_1
    new-array p1, v1, [B

    .line 221
    .line 222
    fill-array-data p1, :array_7

    .line 223
    .line 224
    .line 225
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 234
    .line 235
    .line 236
    :catch_1
    :cond_3
    return-object v0

    .line 237
    :array_0
    .array-data 1
        0x63t
        0x35t
        0x78t
        0x73t
    .end array-data

    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    :array_1
    .array-data 1
        0x72t
        0x35t
        0x62t
        0x7et
        0x25t
    .end array-data

    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    nop

    .line 251
    :array_2
    .array-data 1
        0x63t
        0xft
        0x56t
        0x59t
        0x0t
        0xat
    .end array-data

    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    nop

    .line 259
    :array_3
    .array-data 1
        0x47t
        0xft
        0x57t
        0x5et
        0x3et
        0xft
        0x40t
    .end array-data

    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    :array_4
    .array-data 1
        0x47t
        0xft
        0x57t
        0x5et
        0x3et
        0xat
        0x59t
        0x8t
        0x5at
        0x68t
        0x12t
        0x16t
        0x55t
        0x3t
        0x55t
    .end array-data

    .line 268
    .line 269
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
    :array_5
    .array-data 1
        0x47t
        0xft
        0x57t
        0x5et
        0x3et
        0x0t
        0x42t
        0x3t
        0x40t
        0x42t
        0x4t
        0x8t
        0x53t
        0x1ft
    .end array-data

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
    nop

    .line 291
    :array_6
    .array-data 1
        0x47t
        0xft
        0x57t
        0x5et
        0x3et
        0x8t
        0x55t
        0x12t
        0x46t
        0x58t
        0x13t
        0xdt
        0x6ft
        0xft
        0x55t
    .end array-data

    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    :array_7
    .array-data 1
        0x47t
        0xft
        0x57t
        0x5et
        0x3et
        0x5t
        0x5ft
        0xat
        0x5dt
        0x52t
        0x2t
        0x12t
        0x6ft
        0x3t
        0x43t
        0x45t
        0xet
        0x14t
    .end array-data
.end method

.method public static h(Landroid/content/Context;)Ljava/util/List;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/16 v2, 0x24

    .line 11
    .line 12
    new-array v2, v2, [B

    .line 13
    .line 14
    fill-array-data v2, :array_0

    .line 15
    .line 16
    .line 17
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v1, v2}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 30
    .line 31
    const/16 v2, 0x21

    .line 32
    .line 33
    const/16 v3, 0x27

    .line 34
    .line 35
    if-lt v1, v2, :cond_1

    .line 36
    .line 37
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    new-array v2, v3, [B

    .line 42
    .line 43
    fill-array-data v2, :array_1

    .line 44
    .line 45
    .line 46
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v1, v2}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_5

    .line 55
    .line 56
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/16 v2, 0x26

    .line 61
    .line 62
    new-array v2, v2, [B

    .line 63
    .line 64
    fill-array-data v2, :array_2

    .line 65
    .line 66
    .line 67
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v1, v2}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_3

    .line 76
    .line 77
    goto/16 :goto_1

    .line 78
    .line 79
    :cond_1
    const/16 v2, 0x1d

    .line 80
    .line 81
    if-lt v1, v2, :cond_2

    .line 82
    .line 83
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    new-array v2, v3, [B

    .line 88
    .line 89
    fill-array-data v2, :array_3

    .line 90
    .line 91
    .line 92
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-static {v1, v2}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_3

    .line 101
    .line 102
    goto/16 :goto_1

    .line 103
    .line 104
    :cond_2
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const/16 v2, 0x29

    .line 109
    .line 110
    new-array v2, v2, [B

    .line 111
    .line 112
    fill-array-data v2, :array_4

    .line 113
    .line 114
    .line 115
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-static {v1, v2}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-nez v1, :cond_3

    .line 124
    .line 125
    goto/16 :goto_1

    .line 126
    .line 127
    :cond_3
    invoke-static/range {p0 .. p0}, Ll/ul20;->i(Landroid/content/Context;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-nez v1, :cond_4

    .line 132
    .line 133
    const/4 v0, 0x0

    .line 134
    return-object v0

    .line 135
    :cond_4
    sget-object v1, Ll/ul20;->a:Landroid/net/wifi/WifiManager;

    .line 136
    .line 137
    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->startScan()Z

    .line 138
    .line 139
    .line 140
    sget-object v1, Ll/ul20;->a:Landroid/net/wifi/WifiManager;

    .line 141
    .line 142
    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    :catch_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    if-eqz v2, :cond_5

    .line 155
    .line 156
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    check-cast v2, Landroid/net/wifi/ScanResult;

    .line 161
    .line 162
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 163
    .line 164
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 165
    .line 166
    .line 167
    const/4 v4, 0x4

    .line 168
    new-array v5, v4, [B

    .line 169
    .line 170
    const/4 v6, 0x0

    .line 171
    const/16 v7, 0x63

    .line 172
    .line 173
    aput-byte v7, v5, v6

    .line 174
    .line 175
    const/16 v7, 0x35

    .line 176
    .line 177
    const/4 v8, 0x1

    .line 178
    aput-byte v7, v5, v8

    .line 179
    .line 180
    const/16 v9, 0x78

    .line 181
    .line 182
    const/4 v10, 0x2

    .line 183
    aput-byte v9, v5, v10

    .line 184
    .line 185
    const/16 v9, 0x73

    .line 186
    .line 187
    const/4 v11, 0x3

    .line 188
    aput-byte v9, v5, v11

    .line 189
    .line 190
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    iget-object v9, v2, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {v3, v5, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 197
    .line 198
    .line 199
    const/4 v5, 0x5

    .line 200
    new-array v9, v5, [B

    .line 201
    .line 202
    const/16 v12, 0x72

    .line 203
    .line 204
    aput-byte v12, v9, v6

    .line 205
    .line 206
    aput-byte v7, v9, v8

    .line 207
    .line 208
    const/16 v7, 0x62

    .line 209
    .line 210
    aput-byte v7, v9, v10

    .line 211
    .line 212
    const/16 v7, 0x7e

    .line 213
    .line 214
    aput-byte v7, v9, v11

    .line 215
    .line 216
    const/16 v7, 0x25

    .line 217
    .line 218
    aput-byte v7, v9, v4

    .line 219
    .line 220
    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v7

    .line 224
    iget-object v9, v2, Landroid/net/wifi/ScanResult;->BSSID:Ljava/lang/String;

    .line 225
    .line 226
    invoke-virtual {v3, v7, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 227
    .line 228
    .line 229
    const/16 v7, 0xc

    .line 230
    .line 231
    new-array v7, v7, [B

    .line 232
    .line 233
    const/16 v9, 0x53

    .line 234
    .line 235
    aput-byte v9, v7, v6

    .line 236
    .line 237
    const/4 v9, 0x7

    .line 238
    aput-byte v9, v7, v8

    .line 239
    .line 240
    const/16 v12, 0x41

    .line 241
    .line 242
    aput-byte v12, v7, v10

    .line 243
    .line 244
    const/16 v13, 0x56

    .line 245
    .line 246
    aput-byte v13, v7, v11

    .line 247
    .line 248
    aput-byte v11, v7, v4

    .line 249
    .line 250
    const/16 v14, 0xf

    .line 251
    .line 252
    aput-byte v14, v7, v5

    .line 253
    .line 254
    const/16 v15, 0x5c

    .line 255
    .line 256
    const/16 v16, 0x6

    .line 257
    .line 258
    aput-byte v15, v7, v16

    .line 259
    .line 260
    aput-byte v14, v7, v9

    .line 261
    .line 262
    const/16 v17, 0x8

    .line 263
    .line 264
    const/16 v18, 0x45

    .line 265
    .line 266
    aput-byte v18, v7, v17

    .line 267
    .line 268
    const/16 v18, 0x5e

    .line 269
    .line 270
    move/from16 p0, v4

    .line 271
    .line 272
    const/16 v4, 0x9

    .line 273
    .line 274
    aput-byte v18, v7, v4

    .line 275
    .line 276
    const/16 v19, 0xa

    .line 277
    .line 278
    aput-byte p0, v7, v19

    .line 279
    .line 280
    const/16 v19, 0xb

    .line 281
    .line 282
    const/16 v20, 0x15

    .line 283
    .line 284
    aput-byte v20, v7, v19

    .line 285
    .line 286
    invoke-static {v7}, Ll/riw;->a([B)Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v7

    .line 290
    move/from16 v20, v6

    .line 291
    .line 292
    iget-object v6, v2, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    .line 293
    .line 294
    invoke-virtual {v3, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 295
    .line 296
    .line 297
    new-array v6, v4, [B

    .line 298
    .line 299
    aput-byte v13, v6, v20

    .line 300
    .line 301
    const/16 v7, 0x14

    .line 302
    .line 303
    aput-byte v7, v6, v8

    .line 304
    .line 305
    const/16 v13, 0x54

    .line 306
    .line 307
    aput-byte v13, v6, v10

    .line 308
    .line 309
    const/16 v13, 0x46

    .line 310
    .line 311
    aput-byte v13, v6, v11

    .line 312
    .line 313
    aput-byte v7, v6, p0

    .line 314
    .line 315
    aput-byte v11, v6, v5

    .line 316
    .line 317
    aput-byte v18, v6, v16

    .line 318
    .line 319
    aput-byte v5, v6, v9

    .line 320
    .line 321
    const/16 v7, 0x48

    .line 322
    .line 323
    aput-byte v7, v6, v17

    .line 324
    .line 325
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v6

    .line 329
    iget v7, v2, Landroid/net/wifi/ScanResult;->frequency:I

    .line 330
    .line 331
    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 332
    .line 333
    .line 334
    new-array v6, v5, [B

    .line 335
    .line 336
    aput-byte v15, v6, v20

    .line 337
    .line 338
    aput-byte v11, v6, v8

    .line 339
    .line 340
    const/16 v7, 0x47

    .line 341
    .line 342
    aput-byte v7, v6, v10

    .line 343
    .line 344
    const/16 v7, 0x52

    .line 345
    .line 346
    aput-byte v7, v6, v11

    .line 347
    .line 348
    const/16 v13, 0xd

    .line 349
    .line 350
    aput-byte v13, v6, p0

    .line 351
    .line 352
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v6

    .line 356
    iget v13, v2, Landroid/net/wifi/ScanResult;->level:I

    .line 357
    .line 358
    invoke-virtual {v3, v6, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 359
    .line 360
    .line 361
    new-array v4, v4, [B

    .line 362
    .line 363
    const/16 v6, 0x44

    .line 364
    .line 365
    aput-byte v6, v4, v20

    .line 366
    .line 367
    aput-byte v14, v4, v8

    .line 368
    .line 369
    aput-byte v15, v4, v10

    .line 370
    .line 371
    aput-byte v7, v4, v11

    .line 372
    .line 373
    const/16 v6, 0x12

    .line 374
    .line 375
    aput-byte v6, v4, p0

    .line 376
    .line 377
    aput-byte v6, v4, v5

    .line 378
    .line 379
    const/16 v5, 0x51

    .line 380
    .line 381
    aput-byte v5, v4, v16

    .line 382
    .line 383
    aput-byte v19, v4, v9

    .line 384
    .line 385
    aput-byte v12, v4, v17

    .line 386
    .line 387
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v4

    .line 391
    iget-wide v5, v2, Landroid/net/wifi/ScanResult;->timestamp:J

    .line 392
    .line 393
    invoke-virtual {v3, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 394
    .line 395
    .line 396
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 397
    .line 398
    .line 399
    goto/16 :goto_0

    .line 400
    .line 401
    :cond_5
    :goto_1
    return-object v0

    .line 402
    nop

    .line 403
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
        0x27t
        0x72t
        0x74t
        0x24t
        0x35t
        0x63t
        0x39t
        0x66t
        0x7et
        0x27t
        0x2ft
        0x6ft
        0x35t
        0x65t
        0x76t
        0x35t
        0x23t
    .end array-data

    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    :array_1
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
        0x27t
        0x72t
        0x74t
        0x24t
        0x35t
        0x63t
        0x39t
        0x77t
        0x7et
        0x2ft
        0x23t
        0x6ft
        0x2at
        0x7et
        0x74t
        0x20t
        0x32t
        0x79t
        0x29t
        0x7ft
    .end array-data

    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    :array_2
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
        0x28t
        0x74t
        0x76t
        0x33t
        0x24t
        0x69t
        0x39t
        0x66t
        0x7et
        0x27t
        0x2ft
        0x6ft
        0x22t
        0x74t
        0x61t
        0x28t
        0x25t
        0x75t
        0x35t
    .end array-data

    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    nop

    .line 473
    :array_3
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
        0x27t
        0x72t
        0x74t
        0x24t
        0x35t
        0x63t
        0x39t
        0x77t
        0x7et
        0x2ft
        0x23t
        0x6ft
        0x2at
        0x7et
        0x74t
        0x20t
        0x32t
        0x79t
        0x29t
        0x7ft
    .end array-data

    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    :array_4
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
        0x27t
        0x72t
        0x74t
        0x24t
        0x35t
        0x63t
        0x39t
        0x72t
        0x78t
        0x20t
        0x34t
        0x63t
        0x23t
        0x6et
        0x7bt
        0x2et
        0x25t
        0x71t
        0x32t
        0x78t
        0x78t
        0x2ft
    .end array-data
.end method

.method private static i(Landroid/content/Context;)Z
    .locals 1

    .line 1
    sget-object v0, Ll/ul20;->a:Landroid/net/wifi/WifiManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 v0, 0x4

    .line 15
    new-array v0, v0, [B

    .line 16
    .line 17
    fill-array-data v0, :array_0

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Landroid/net/wifi/WifiManager;

    .line 29
    .line 30
    sput-object p0, Ll/ul20;->a:Landroid/net/wifi/WifiManager;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    nop

    .line 45
    :array_0
    .array-data 1
        0x47t
        0xft
        0x57t
        0x5et
    .end array-data
.end method

.method public static j(Landroid/content/Context;)Z
    .locals 1

    .line 1
    const/16 p0, 0xe

    .line 2
    .line 3
    new-array v0, p0, [B

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
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-array p0, p0, [B

    .line 17
    .line 18
    fill-array-data p0, :array_1

    .line 19
    .line 20
    .line 21
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x2

    .line 33
    new-array p0, p0, [B

    .line 34
    .line 35
    fill-array-data p0, :array_2

    .line 36
    .line 37
    .line 38
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    const/4 v0, -0x1

    .line 53
    if-eq p0, v0, :cond_1

    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_1
    const/4 p0, 0x0

    .line 58
    return p0

    .line 59
    :array_0
    .array-data 1
        0x58t
        0x12t
        0x45t
        0x47t
        0x4ft
        0x16t
        0x42t
        0x9t
        0x49t
        0x4et
        0x29t
        0x9t
        0x43t
        0x12t
    .end array-data

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    nop

    .line 71
    :array_1
    .array-data 1
        0x58t
        0x12t
        0x45t
        0x47t
        0x4ft
        0x16t
        0x42t
        0x9t
        0x49t
        0x4et
        0x31t
        0x9t
        0x42t
        0x12t
    .end array-data

    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    nop

    .line 83
    :array_2
    .array-data 1
        0x1dt
        0x57t
    .end array-data
.end method
