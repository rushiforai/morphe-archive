.class Ll/xe5$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xe5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field a:I

.field b:I

.field c:F

.field d:I

.field e:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field f:I

.field g:I

.field h:Landroid/util/SizeF;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/xe5$e;->a:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Ll/xe5$e;->b:I

    .line 9
    .line 10
    iput v0, p0, Ll/xe5$e;->d:I

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-object v1, p0, Ll/xe5$e;->e:Landroid/util/Range;

    .line 14
    .line 15
    iput v0, p0, Ll/xe5$e;->f:I

    .line 16
    .line 17
    iput v0, p0, Ll/xe5$e;->g:I

    .line 18
    .line 19
    iput-object v1, p0, Ll/xe5$e;->h:Landroid/util/SizeF;

    .line 20
    .line 21
    return-void
.end method

.method public synthetic constructor <init>(Ll/xe5$a;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ll/xe5$e;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Lorg/json/JSONObject;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    :try_start_0
    new-array v1, v1, [B

    .line 8
    .line 9
    fill-array-data v1, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget v2, p0, Ll/xe5$e;->a:I

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x6

    .line 22
    new-array v2, v1, [B

    .line 23
    .line 24
    fill-array-data v2, :array_1

    .line 25
    .line 26
    .line 27
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget v3, p0, Ll/xe5$e;->b:I

    .line 32
    .line 33
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 34
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
    iget v2, p0, Ll/xe5$e;->c:F

    .line 46
    .line 47
    float-to-double v2, v2

    .line 48
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 49
    .line 50
    .line 51
    const/16 v1, 0xb

    .line 52
    .line 53
    new-array v1, v1, [B

    .line 54
    .line 55
    fill-array-data v1, :array_3

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget v2, p0, Ll/xe5$e;->d:I

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Ll/xe5$e;->e:Landroid/util/Range;

    .line 68
    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    const/16 v1, 0xc

    .line 72
    .line 73
    new-array v1, v1, [B

    .line 74
    .line 75
    fill-array-data v1, :array_4

    .line 76
    .line 77
    .line 78
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    new-instance v2, Lorg/json/JSONArray;

    .line 83
    .line 84
    iget-object v3, p0, Ll/xe5$e;->e:Landroid/util/Range;

    .line 85
    .line 86
    invoke-virtual {v3}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Ljava/lang/Integer;

    .line 91
    .line 92
    iget-object v4, p0, Ll/xe5$e;->e:Landroid/util/Range;

    .line 93
    .line 94
    invoke-virtual {v4}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    check-cast v4, Ljava/lang/Integer;

    .line 99
    .line 100
    filled-new-array {v3, v4}, [Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-direct {v2, v3}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :catch_0
    move-exception p0

    .line 116
    goto :goto_1

    .line 117
    :cond_0
    :goto_0
    const/16 v1, 0x9

    .line 118
    .line 119
    new-array v2, v1, [B

    .line 120
    .line 121
    fill-array-data v2, :array_5

    .line 122
    .line 123
    .line 124
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iget v3, p0, Ll/xe5$e;->f:I

    .line 129
    .line 130
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 131
    .line 132
    .line 133
    new-array v1, v1, [B

    .line 134
    .line 135
    fill-array-data v1, :array_6

    .line 136
    .line 137
    .line 138
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    iget v2, p0, Ll/xe5$e;->g:I

    .line 143
    .line 144
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Ll/xe5$e;->h:Landroid/util/SizeF;

    .line 148
    .line 149
    if-eqz v1, :cond_1

    .line 150
    .line 151
    const/16 v1, 0xc

    .line 152
    .line 153
    new-array v1, v1, [B

    .line 154
    .line 155
    fill-array-data v1, :array_7

    .line 156
    .line 157
    .line 158
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    new-instance v2, Lorg/json/JSONArray;

    .line 163
    .line 164
    iget-object v3, p0, Ll/xe5$e;->h:Landroid/util/SizeF;

    .line 165
    .line 166
    invoke-virtual {v3}, Landroid/util/SizeF;->getWidth()F

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    iget-object p0, p0, Ll/xe5$e;->h:Landroid/util/SizeF;

    .line 175
    .line 176
    invoke-virtual {p0}, Landroid/util/SizeF;->getHeight()F

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    filled-new-array {v3, p0}, [Ljava/lang/Float;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    .line 197
    .line 198
    :cond_1
    return-object v0

    .line 199
    :goto_1
    const/16 v1, 0x8

    .line 200
    .line 201
    new-array v1, v1, [B

    .line 202
    .line 203
    fill-array-data v1, :array_8

    .line 204
    .line 205
    .line 206
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    const/16 v2, 0x1b

    .line 211
    .line 212
    new-array v2, v2, [B

    .line 213
    .line 214
    fill-array-data v2, :array_9

    .line 215
    .line 216
    .line 217
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 222
    .line 223
    .line 224
    return-object v0

    .line 225
    :array_0
    .array-data 1
        0x56t
        0x7t
        0x52t
        0x52t
    .end array-data

    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    :array_1
    .array-data 1
        0x40t
        0xft
        0x49t
        0x52t
        0xdt
        0x15t
    .end array-data

    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    nop

    .line 239
    :array_2
    .array-data 1
        0x56t
        0x9t
        0x52t
        0x56t
        0xdt
        0x15t
    .end array-data

    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    nop

    .line 247
    :array_3
    .array-data 1
        0x5ft
        0x14t
        0x58t
        0x52t
        0xft
        0x12t
        0x51t
        0x12t
        0x58t
        0x58t
        0xft
    .end array-data

    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    :array_4
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x47t
        0x4t
        0x8t
        0x43t
        0x7t
        0x45t
        0x5et
        0xet
        0x8t
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
    :array_5
    .array-data 1
        0x51t
        0x3t
        0x63t
        0x52t
        0x6t
        0xft
        0x5ft
        0x8t
        0x42t
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
    nop

    .line 277
    :array_6
    .array-data 1
        0x51t
        0x0t
        0x63t
        0x52t
        0x6t
        0xft
        0x5ft
        0x8t
        0x42t
    .end array-data

    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    nop

    .line 287
    :array_7
    .array-data 1
        0x40t
        0xet
        0x48t
        0x44t
        0x8t
        0x5t
        0x51t
        0xat
        0x62t
        0x5et
        0x1bt
        0x3t
    .end array-data

    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    :array_8
    .array-data 1
        0x7dt
        0x2bt
        0x75t
        0x52t
        0x17t
        0xft
        0x53t
        0x3t
    .end array-data

    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    :array_9
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x73t
        0x7t
        0x5ct
        0x52t
        0x13t
        0x7t
        0x74t
        0x3t
        0x45t
        0x56t
        0x8t
        0xat
        0x10t
        0x12t
        0x5et
        0x7dt
        0x12t
        0x9t
        0x5et
        0x5ct
        0x11t
    .end array-data
.end method
