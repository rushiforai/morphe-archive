.class public Lorg/seamless/http/CacheControl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private cacheExtensions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private maxAge:I

.field private mustRevalidate:Z

.field private noCache:Z

.field private noCacheFields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private noStore:Z

.field private noTransform:Z

.field private privateFields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private privateFlag:Z

.field private proxyRevalidate:Z

.field private sharedMaxAge:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lorg/seamless/http/CacheControl;->maxAge:I

    .line 6
    .line 7
    iput v0, p0, Lorg/seamless/http/CacheControl;->sharedMaxAge:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lorg/seamless/http/CacheControl;->noCache:Z

    .line 11
    .line 12
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lorg/seamless/http/CacheControl;->noCacheFields:Ljava/util/List;

    .line 18
    .line 19
    iput-boolean v0, p0, Lorg/seamless/http/CacheControl;->privateFlag:Z

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lorg/seamless/http/CacheControl;->privateFields:Ljava/util/List;

    .line 27
    .line 28
    iput-boolean v0, p0, Lorg/seamless/http/CacheControl;->noStore:Z

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    iput-boolean v1, p0, Lorg/seamless/http/CacheControl;->noTransform:Z

    .line 32
    .line 33
    iput-boolean v0, p0, Lorg/seamless/http/CacheControl;->mustRevalidate:Z

    .line 34
    .line 35
    iput-boolean v0, p0, Lorg/seamless/http/CacheControl;->proxyRevalidate:Z

    .line 36
    .line 37
    new-instance v0, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lorg/seamless/http/CacheControl;->cacheExtensions:Ljava/util/Map;

    .line 43
    .line 44
    return-void
.end method

.method private append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const-string p0, ", "

    .line 8
    .line 9
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    return-object p2
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/seamless/http/CacheControl;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    new-instance v1, Lorg/seamless/http/CacheControl;

    .line 6
    .line 7
    invoke-direct {v1}, Lorg/seamless/http/CacheControl;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, ","

    .line 11
    .line 12
    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    array-length v2, p0

    .line 17
    const/4 v3, 0x0

    .line 18
    move v4, v3

    .line 19
    :goto_0
    if-ge v4, v2, :cond_11

    .line 20
    .line 21
    aget-object v5, p0, v4

    .line 22
    .line 23
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    const-string v6, "="

    .line 28
    .line 29
    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    aget-object v6, v5, v3

    .line 34
    .line 35
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    array-length v7, v5

    .line 40
    const/4 v8, 0x1

    .line 41
    if-le v7, v8, :cond_2

    .line 42
    .line 43
    aget-object v5, v5, v8

    .line 44
    .line 45
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    const-string v7, "\""

    .line 50
    .line 51
    invoke-virtual {v5, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v9

    .line 55
    if-eqz v9, :cond_1

    .line 56
    .line 57
    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    :cond_1
    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    if-eqz v7, :cond_3

    .line 66
    .line 67
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    sub-int/2addr v7, v8

    .line 72
    invoke-virtual {v5, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    goto :goto_1

    .line 77
    :cond_2
    move-object v5, v0

    .line 78
    :cond_3
    :goto_1
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    const-string v9, "no-cache"

    .line 83
    .line 84
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v9

    .line 88
    const-string v10, ""

    .line 89
    .line 90
    if-eqz v9, :cond_4

    .line 91
    .line 92
    invoke-virtual {v1, v8}, Lorg/seamless/http/CacheControl;->setNoCache(Z)V

    .line 93
    .line 94
    .line 95
    if-eqz v5, :cond_10

    .line 96
    .line 97
    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    if-nez v6, :cond_10

    .line 102
    .line 103
    invoke-virtual {v1}, Lorg/seamless/http/CacheControl;->getNoCacheFields()Ljava/util/List;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    goto/16 :goto_2

    .line 111
    .line 112
    :cond_4
    const-string v9, "private"

    .line 113
    .line 114
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v9

    .line 118
    if-eqz v9, :cond_5

    .line 119
    .line 120
    invoke-virtual {v1, v8}, Lorg/seamless/http/CacheControl;->setPrivateFlag(Z)V

    .line 121
    .line 122
    .line 123
    if-eqz v5, :cond_10

    .line 124
    .line 125
    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    if-nez v6, :cond_10

    .line 130
    .line 131
    invoke-virtual {v1}, Lorg/seamless/http/CacheControl;->getPrivateFields()Ljava/util/List;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    goto/16 :goto_2

    .line 139
    .line 140
    :cond_5
    const-string v9, "no-store"

    .line 141
    .line 142
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v9

    .line 146
    if-eqz v9, :cond_6

    .line 147
    .line 148
    invoke-virtual {v1, v8}, Lorg/seamless/http/CacheControl;->setNoStore(Z)V

    .line 149
    .line 150
    .line 151
    goto/16 :goto_2

    .line 152
    .line 153
    :cond_6
    const-string v9, "max-age"

    .line 154
    .line 155
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v9

    .line 159
    if-eqz v9, :cond_8

    .line 160
    .line 161
    if-eqz v5, :cond_7

    .line 162
    .line 163
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 168
    .line 169
    .line 170
    move-result v5

    .line 171
    invoke-virtual {v1, v5}, Lorg/seamless/http/CacheControl;->setMaxAge(I)V

    .line 172
    .line 173
    .line 174
    goto :goto_2

    .line 175
    :cond_7
    const-string p0, "CacheControl max-age header does not have a value: "

    .line 176
    .line 177
    invoke-static {p0, v5}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    return-object v0

    .line 181
    :cond_8
    const-string v9, "s-maxage"

    .line 182
    .line 183
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v9

    .line 187
    if-eqz v9, :cond_a

    .line 188
    .line 189
    if-eqz v5, :cond_9

    .line 190
    .line 191
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 192
    .line 193
    .line 194
    move-result-object v5

    .line 195
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    invoke-virtual {v1, v5}, Lorg/seamless/http/CacheControl;->setSharedMaxAge(I)V

    .line 200
    .line 201
    .line 202
    goto :goto_2

    .line 203
    :cond_9
    const-string p0, "CacheControl s-maxage header does not have a value: "

    .line 204
    .line 205
    invoke-static {p0, v5}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    return-object v0

    .line 209
    :cond_a
    const-string v9, "no-transform"

    .line 210
    .line 211
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v9

    .line 215
    if-eqz v9, :cond_b

    .line 216
    .line 217
    invoke-virtual {v1, v8}, Lorg/seamless/http/CacheControl;->setNoTransform(Z)V

    .line 218
    .line 219
    .line 220
    goto :goto_2

    .line 221
    :cond_b
    const-string v9, "must-revalidate"

    .line 222
    .line 223
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v9

    .line 227
    if-eqz v9, :cond_c

    .line 228
    .line 229
    invoke-virtual {v1, v8}, Lorg/seamless/http/CacheControl;->setMustRevalidate(Z)V

    .line 230
    .line 231
    .line 232
    goto :goto_2

    .line 233
    :cond_c
    const-string v9, "proxy-revalidate"

    .line 234
    .line 235
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v9

    .line 239
    if-eqz v9, :cond_d

    .line 240
    .line 241
    invoke-virtual {v1, v8}, Lorg/seamless/http/CacheControl;->setProxyRevalidate(Z)V

    .line 242
    .line 243
    .line 244
    goto :goto_2

    .line 245
    :cond_d
    const-string v8, "public"

    .line 246
    .line 247
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v7

    .line 251
    if-eqz v7, :cond_e

    .line 252
    .line 253
    goto :goto_2

    .line 254
    :cond_e
    if-nez v5, :cond_f

    .line 255
    .line 256
    move-object v5, v10

    .line 257
    :cond_f
    invoke-virtual {v1}, Lorg/seamless/http/CacheControl;->getCacheExtensions()Ljava/util/Map;

    .line 258
    .line 259
    .line 260
    move-result-object v7

    .line 261
    invoke-interface {v7, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    :cond_10
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :cond_11
    return-object v1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_d

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lorg/seamless/http/CacheControl;

    .line 20
    .line 21
    iget v2, p0, Lorg/seamless/http/CacheControl;->maxAge:I

    .line 22
    .line 23
    iget v3, p1, Lorg/seamless/http/CacheControl;->maxAge:I

    .line 24
    .line 25
    if-eq v2, v3, :cond_2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_2
    iget-boolean v2, p0, Lorg/seamless/http/CacheControl;->mustRevalidate:Z

    .line 29
    .line 30
    iget-boolean v3, p1, Lorg/seamless/http/CacheControl;->mustRevalidate:Z

    .line 31
    .line 32
    if-eq v2, v3, :cond_3

    .line 33
    .line 34
    return v1

    .line 35
    :cond_3
    iget-boolean v2, p0, Lorg/seamless/http/CacheControl;->noCache:Z

    .line 36
    .line 37
    iget-boolean v3, p1, Lorg/seamless/http/CacheControl;->noCache:Z

    .line 38
    .line 39
    if-eq v2, v3, :cond_4

    .line 40
    .line 41
    return v1

    .line 42
    :cond_4
    iget-boolean v2, p0, Lorg/seamless/http/CacheControl;->noStore:Z

    .line 43
    .line 44
    iget-boolean v3, p1, Lorg/seamless/http/CacheControl;->noStore:Z

    .line 45
    .line 46
    if-eq v2, v3, :cond_5

    .line 47
    .line 48
    return v1

    .line 49
    :cond_5
    iget-boolean v2, p0, Lorg/seamless/http/CacheControl;->noTransform:Z

    .line 50
    .line 51
    iget-boolean v3, p1, Lorg/seamless/http/CacheControl;->noTransform:Z

    .line 52
    .line 53
    if-eq v2, v3, :cond_6

    .line 54
    .line 55
    return v1

    .line 56
    :cond_6
    iget-boolean v2, p0, Lorg/seamless/http/CacheControl;->privateFlag:Z

    .line 57
    .line 58
    iget-boolean v3, p1, Lorg/seamless/http/CacheControl;->privateFlag:Z

    .line 59
    .line 60
    if-eq v2, v3, :cond_7

    .line 61
    .line 62
    return v1

    .line 63
    :cond_7
    iget-boolean v2, p0, Lorg/seamless/http/CacheControl;->proxyRevalidate:Z

    .line 64
    .line 65
    iget-boolean v3, p1, Lorg/seamless/http/CacheControl;->proxyRevalidate:Z

    .line 66
    .line 67
    if-eq v2, v3, :cond_8

    .line 68
    .line 69
    return v1

    .line 70
    :cond_8
    iget v2, p0, Lorg/seamless/http/CacheControl;->sharedMaxAge:I

    .line 71
    .line 72
    iget v3, p1, Lorg/seamless/http/CacheControl;->sharedMaxAge:I

    .line 73
    .line 74
    if-eq v2, v3, :cond_9

    .line 75
    .line 76
    return v1

    .line 77
    :cond_9
    iget-object v2, p0, Lorg/seamless/http/CacheControl;->cacheExtensions:Ljava/util/Map;

    .line 78
    .line 79
    iget-object v3, p1, Lorg/seamless/http/CacheControl;->cacheExtensions:Ljava/util/Map;

    .line 80
    .line 81
    invoke-interface {v2, v3}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-nez v2, :cond_a

    .line 86
    .line 87
    return v1

    .line 88
    :cond_a
    iget-object v2, p0, Lorg/seamless/http/CacheControl;->noCacheFields:Ljava/util/List;

    .line 89
    .line 90
    iget-object v3, p1, Lorg/seamless/http/CacheControl;->noCacheFields:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-nez v2, :cond_b

    .line 97
    .line 98
    return v1

    .line 99
    :cond_b
    iget-object p0, p0, Lorg/seamless/http/CacheControl;->privateFields:Ljava/util/List;

    .line 100
    .line 101
    iget-object p1, p1, Lorg/seamless/http/CacheControl;->privateFields:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {p0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-nez p0, :cond_c

    .line 108
    .line 109
    return v1

    .line 110
    :cond_c
    return v0

    .line 111
    :cond_d
    :goto_0
    return v1
.end method

.method public getCacheExtensions()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/seamless/http/CacheControl;->cacheExtensions:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaxAge()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/seamless/http/CacheControl;->maxAge:I

    .line 2
    .line 3
    return p0
.end method

.method public getNoCacheFields()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/seamless/http/CacheControl;->noCacheFields:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPrivateFields()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/seamless/http/CacheControl;->privateFields:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSharedMaxAge()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/seamless/http/CacheControl;->sharedMaxAge:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lorg/seamless/http/CacheControl;->maxAge:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget v1, p0, Lorg/seamless/http/CacheControl;->sharedMaxAge:I

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    mul-int/lit8 v0, v0, 0x1f

    .line 9
    .line 10
    iget-boolean v1, p0, Lorg/seamless/http/CacheControl;->noCache:Z

    .line 11
    .line 12
    add-int/2addr v0, v1

    .line 13
    mul-int/lit8 v0, v0, 0x1f

    .line 14
    .line 15
    iget-object v1, p0, Lorg/seamless/http/CacheControl;->noCacheFields:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    add-int/2addr v0, v1

    .line 22
    mul-int/lit8 v0, v0, 0x1f

    .line 23
    .line 24
    iget-boolean v1, p0, Lorg/seamless/http/CacheControl;->privateFlag:Z

    .line 25
    .line 26
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x1f

    .line 28
    .line 29
    iget-object v1, p0, Lorg/seamless/http/CacheControl;->privateFields:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x1f

    .line 37
    .line 38
    iget-boolean v1, p0, Lorg/seamless/http/CacheControl;->noStore:Z

    .line 39
    .line 40
    add-int/2addr v0, v1

    .line 41
    mul-int/lit8 v0, v0, 0x1f

    .line 42
    .line 43
    iget-boolean v1, p0, Lorg/seamless/http/CacheControl;->noTransform:Z

    .line 44
    .line 45
    add-int/2addr v0, v1

    .line 46
    mul-int/lit8 v0, v0, 0x1f

    .line 47
    .line 48
    iget-boolean v1, p0, Lorg/seamless/http/CacheControl;->mustRevalidate:Z

    .line 49
    .line 50
    add-int/2addr v0, v1

    .line 51
    mul-int/lit8 v0, v0, 0x1f

    .line 52
    .line 53
    iget-boolean v1, p0, Lorg/seamless/http/CacheControl;->proxyRevalidate:Z

    .line 54
    .line 55
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x1f

    .line 57
    .line 58
    iget-object p0, p0, Lorg/seamless/http/CacheControl;->cacheExtensions:Ljava/util/Map;

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/util/Map;->hashCode()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    add-int/2addr v0, p0

    .line 65
    return v0
.end method

.method public isMustRevalidate()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/seamless/http/CacheControl;->mustRevalidate:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNoCache()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/seamless/http/CacheControl;->noCache:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNoStore()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/seamless/http/CacheControl;->noStore:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNoTransform()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/seamless/http/CacheControl;->noTransform:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPrivateFlag()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/seamless/http/CacheControl;->privateFlag:Z

    .line 2
    .line 3
    return p0
.end method

.method public isProxyRevalidate()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/seamless/http/CacheControl;->proxyRevalidate:Z

    .line 2
    .line 3
    return p0
.end method

.method public setCacheExtensions(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/seamless/http/CacheControl;->cacheExtensions:Ljava/util/Map;

    .line 2
    .line 3
    return-void
.end method

.method public setMaxAge(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/seamless/http/CacheControl;->maxAge:I

    .line 2
    .line 3
    return-void
.end method

.method public setMustRevalidate(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/seamless/http/CacheControl;->mustRevalidate:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNoCache(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/seamless/http/CacheControl;->noCache:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNoCacheFields(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/seamless/http/CacheControl;->noCacheFields:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setNoStore(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/seamless/http/CacheControl;->noStore:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNoTransform(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/seamless/http/CacheControl;->noTransform:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPrivateFields(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/seamless/http/CacheControl;->privateFields:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setPrivateFlag(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/seamless/http/CacheControl;->privateFlag:Z

    .line 2
    .line 3
    return-void
.end method

.method public setProxyRevalidate(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/seamless/http/CacheControl;->proxyRevalidate:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSharedMaxAge(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/seamless/http/CacheControl;->sharedMaxAge:I

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->isPrivateFlag()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string v1, "public"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->isMustRevalidate()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    const-string v1, "must-revalidate"

    .line 24
    .line 25
    invoke-direct {p0, v1, v0}, Lorg/seamless/http/CacheControl;->append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    :cond_1
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->isNoTransform()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    const-string v1, "no-transform"

    .line 35
    .line 36
    invoke-direct {p0, v1, v0}, Lorg/seamless/http/CacheControl;->append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    :cond_2
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->isNoStore()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    const-string v1, "no-store"

    .line 46
    .line 47
    invoke-direct {p0, v1, v0}, Lorg/seamless/http/CacheControl;->append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    :cond_3
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->isProxyRevalidate()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_4

    .line 55
    .line 56
    const-string v1, "proxy-revalidate"

    .line 57
    .line 58
    invoke-direct {p0, v1, v0}, Lorg/seamless/http/CacheControl;->append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    :cond_4
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->getSharedMaxAge()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    const-string v2, "="

    .line 66
    .line 67
    const/4 v3, -0x1

    .line 68
    if-le v1, v3, :cond_5

    .line 69
    .line 70
    const-string v1, "s-maxage"

    .line 71
    .line 72
    invoke-direct {p0, v1, v0}, Lorg/seamless/http/CacheControl;->append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->getSharedMaxAge()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    :cond_5
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->getMaxAge()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-le v1, v3, :cond_6

    .line 91
    .line 92
    const-string v1, "max-age"

    .line 93
    .line 94
    invoke-direct {p0, v1, v0}, Lorg/seamless/http/CacheControl;->append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->getMaxAge()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    :cond_6
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->isNoCache()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    const/4 v2, 0x1

    .line 113
    const-string v3, "\""

    .line 114
    .line 115
    const-string v4, "=\""

    .line 116
    .line 117
    if-eqz v1, :cond_8

    .line 118
    .line 119
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->getNoCacheFields()Ljava/util/List;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    const-string v5, "no-cache"

    .line 128
    .line 129
    if-ge v1, v2, :cond_7

    .line 130
    .line 131
    invoke-direct {p0, v5, v0}, Lorg/seamless/http/CacheControl;->append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_7
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->getNoCacheFields()Ljava/util/List;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    if-eqz v6, :cond_8

    .line 148
    .line 149
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v6

    .line 153
    check-cast v6, Ljava/lang/String;

    .line 154
    .line 155
    invoke-direct {p0, v5, v0}, Lorg/seamless/http/CacheControl;->append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_8
    :goto_1
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->isPrivateFlag()Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-eqz v1, :cond_a

    .line 174
    .line 175
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->getPrivateFields()Ljava/util/List;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    const-string v5, "private"

    .line 184
    .line 185
    if-ge v1, v2, :cond_9

    .line 186
    .line 187
    invoke-direct {p0, v5, v0}, Lorg/seamless/http/CacheControl;->append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_9
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->getPrivateFields()Ljava/util/List;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    if-eqz v2, :cond_a

    .line 204
    .line 205
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    check-cast v2, Ljava/lang/String;

    .line 210
    .line 211
    invoke-direct {p0, v5, v0}, Lorg/seamless/http/CacheControl;->append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    move-result-object v6

    .line 215
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_a
    :goto_3
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->getCacheExtensions()Ljava/util/Map;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    :cond_b
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 238
    .line 239
    .line 240
    move-result v2

    .line 241
    if-eqz v2, :cond_c

    .line 242
    .line 243
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    check-cast v2, Ljava/lang/String;

    .line 248
    .line 249
    invoke-virtual {p0}, Lorg/seamless/http/CacheControl;->getCacheExtensions()Ljava/util/Map;

    .line 250
    .line 251
    .line 252
    move-result-object v5

    .line 253
    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v5

    .line 257
    check-cast v5, Ljava/lang/String;

    .line 258
    .line 259
    invoke-direct {p0, v2, v0}, Lorg/seamless/http/CacheControl;->append(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    if-eqz v5, :cond_b

    .line 263
    .line 264
    const-string v2, ""

    .line 265
    .line 266
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    if-nez v2, :cond_b

    .line 271
    .line 272
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    goto :goto_4

    .line 282
    :cond_c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    return-object p0
.end method
