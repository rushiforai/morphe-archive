.class public Lcom/immomo/utils/tools/TraceData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/utils/tools/TraceData$LogNode;
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

.method public static varargs a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0xb

    .line 7
    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    fill-array-data v1, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0, p3}, Lcom/immomo/utils/tools/TraceData$LogNode;->getChineseDescription([Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v0, v1, v2}, Lcom/immomo/utils/tools/TraceData;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x5

    .line 25
    new-array v1, v1, [B

    .line 26
    .line 27
    fill-array-data v1, :array_1

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p0, p3}, Lcom/immomo/utils/tools/TraceData$LogNode;->getEnglishName([Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {v0, v1, p0}, Lcom/immomo/utils/tools/TraceData;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    const/16 p0, 0x9

    .line 42
    .line 43
    new-array p3, p0, [B

    .line 44
    .line 45
    fill-array-data p3, :array_2

    .line 46
    .line 47
    .line 48
    invoke-static {p3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 53
    .line 54
    .line 55
    move-result-wide v1

    .line 56
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v0, p3, v1}, Lcom/immomo/utils/tools/TraceData;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    new-array p3, p0, [B

    .line 64
    .line 65
    fill-array-data p3, :array_3

    .line 66
    .line 67
    .line 68
    invoke-static {p3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    iget-object v1, p1, Ll/ag60;->b:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v0, p3, v1}, Lcom/immomo/utils/tools/TraceData;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    const/4 p3, 0x6

    .line 78
    new-array v1, p3, [B

    .line 79
    .line 80
    fill-array-data v1, :array_4

    .line 81
    .line 82
    .line 83
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object v2, p1, Ll/ag60;->a:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v0, v1, v2}, Lcom/immomo/utils/tools/TraceData;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    const/4 v1, 0x7

    .line 93
    new-array v1, v1, [B

    .line 94
    .line 95
    fill-array-data v1, :array_5

    .line 96
    .line 97
    .line 98
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iget-object v2, p1, Ll/ag60;->f:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {v0, v1, v2}, Lcom/immomo/utils/tools/TraceData;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    new-array p3, p3, [B

    .line 108
    .line 109
    fill-array-data p3, :array_6

    .line 110
    .line 111
    .line 112
    invoke-static {p3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p3

    .line 116
    iget-object p1, p1, Ll/ag60;->g:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v0, p3, p1}, Lcom/immomo/utils/tools/TraceData;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    const/4 p1, 0x3

    .line 122
    new-array p1, p1, [B

    .line 123
    .line 124
    fill-array-data p1, :array_7

    .line 125
    .line 126
    .line 127
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    new-instance p3, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, ""

    .line 144
    .line 145
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p3

    .line 152
    invoke-static {v0, p1, p3}, Lcom/immomo/utils/tools/TraceData;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    const/16 p1, 0xa

    .line 156
    .line 157
    new-array p1, p1, [B

    .line 158
    .line 159
    fill-array-data p1, :array_8

    .line 160
    .line 161
    .line 162
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-static {}, Ll/xiw;->b()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p3

    .line 170
    invoke-static {v0, p1, p3}, Lcom/immomo/utils/tools/TraceData;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    new-array p0, p0, [B

    .line 174
    .line 175
    fill-array-data p0, :array_9

    .line 176
    .line 177
    .line 178
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    if-eqz p1, :cond_0

    .line 187
    .line 188
    move-object p2, v1

    .line 189
    :cond_0
    invoke-static {v0, p0, p2}, Lcom/immomo/utils/tools/TraceData;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    return-object p0

    .line 197
    :array_0
    .array-data 1
        0x54t
        0x3t
        0x42t
        0x54t
        0x13t
        0xft
        0x40t
        0x12t
        0x58t
        0x58t
        0xft
    .end array-data

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
    :array_1
    .array-data 1
        0x40t
        0x9t
        0x58t
        0x59t
        0x15t
    .end array-data

    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    nop

    .line 215
    :array_2
    .array-data 1
        0x44t
        0xft
        0x5ct
        0x52t
        0x12t
        0x12t
        0x51t
        0xbt
        0x41t
    .end array-data

    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    nop

    .line 225
    :array_3
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

    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    nop

    .line 235
    :array_4
    .array-data 1
        0x43t
        0x9t
        0x44t
        0x45t
        0x2t
        0x3t
    .end array-data

    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    nop

    .line 243
    :array_5
    .array-data 1
        0x51t
        0x16t
        0x41t
        0x59t
        0x0t
        0xbt
        0x55t
    .end array-data

    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    :array_6
    .array-data 1
        0x42t
        0x3t
        0x40t
        0x68t
        0x8t
        0x2t
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
    :array_7
    .array-data 1
        0x40t
        0xft
        0x55t
    .end array-data

    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    :array_8
    .array-data 1
        0x43t
        0x2t
        0x5at
        0x61t
        0x4t
        0x14t
        0x43t
        0xft
        0x5et
        0x59t
    .end array-data

    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    nop

    .line 275
    :array_9
    .array-data 1
        0x55t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
    .end array-data
.end method

.method private static b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    const/16 p0, 0x9

    .line 6
    .line 7
    new-array p1, p0, [B

    .line 8
    .line 9
    fill-array-data p1, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    const/16 p1, 0x13

    .line 16
    .line 17
    new-array p1, p1, [B

    .line 18
    .line 19
    fill-array-data p1, :array_1

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    new-array p0, p0, [B

    .line 26
    .line 27
    fill-array-data p0, :array_2

    .line 28
    .line 29
    .line 30
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :array_0
    .array-data 1
        0x64t
        0x14t
        0x50t
        0x54t
        0x4t
        0x22t
        0x51t
        0x12t
        0x50t
    .end array-data

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    nop

    .line 47
    :array_1
    .array-data 1
        0x76t
        0x7t
        0x58t
        0x5bt
        0x4t
        0x2t
        0x10t
        0x12t
        0x5et
        0x17t
        0x11t
        0x13t
        0x44t
        0x46t
        0x5at
        0x52t
        0x18t
        0x5ct
        0x10t
    .end array-data

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
    :array_2
    .array-data 1
        0x1ct
        0x46t
        0x47t
        0x56t
        0xdt
        0x13t
        0x55t
        0x5ct
        0x11t
    .end array-data
.end method
