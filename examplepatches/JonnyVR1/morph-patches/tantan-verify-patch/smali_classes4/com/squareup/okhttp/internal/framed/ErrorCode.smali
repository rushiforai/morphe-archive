.class public final enum Lcom/squareup/okhttp/internal/framed/ErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/squareup/okhttp/internal/framed/ErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum CANCEL:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum COMPRESSION_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum CONNECT_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum ENHANCE_YOUR_CALM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum FLOW_CONTROL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum FRAME_TOO_LARGE:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum HTTP_1_1_REQUIRED:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum INADEQUATE_SECURITY:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum INTERNAL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum INVALID_CREDENTIALS:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum INVALID_STREAM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum NO_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum PROTOCOL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum REFUSED_STREAM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum STREAM_ALREADY_CLOSED:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum STREAM_CLOSED:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum STREAM_IN_USE:Lcom/squareup/okhttp/internal/framed/ErrorCode;

.field public static final enum UNSUPPORTED_VERSION:Lcom/squareup/okhttp/internal/framed/ErrorCode;


# instance fields
.field public final httpCode:I

.field public final spdyGoAwayCode:I

.field public final spdyRstCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 1
    new-instance v0, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 2
    .line 3
    const/4 v4, -0x1

    .line 4
    const/4 v5, 0x0

    .line 5
    const-string v1, "NO_ERROR"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-direct/range {v0 .. v5}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->NO_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 13
    .line 14
    new-instance v1, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 15
    .line 16
    const/4 v5, 0x1

    .line 17
    const/4 v6, 0x1

    .line 18
    const-string v2, "PROTOCOL_ERROR"

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    const/4 v4, 0x1

    .line 22
    invoke-direct/range {v1 .. v6}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 23
    .line 24
    .line 25
    sput-object v1, Lcom/squareup/okhttp/internal/framed/ErrorCode;->PROTOCOL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 26
    .line 27
    new-instance v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 28
    .line 29
    const/4 v6, 0x2

    .line 30
    const/4 v7, -0x1

    .line 31
    const-string v3, "INVALID_STREAM"

    .line 32
    .line 33
    const/4 v4, 0x2

    .line 34
    invoke-direct/range {v2 .. v7}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 35
    .line 36
    .line 37
    sput-object v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INVALID_STREAM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 38
    .line 39
    new-instance v3, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 40
    .line 41
    const/4 v7, 0x4

    .line 42
    const/4 v8, -0x1

    .line 43
    const-string v4, "UNSUPPORTED_VERSION"

    .line 44
    .line 45
    const/4 v5, 0x3

    .line 46
    const/4 v6, 0x1

    .line 47
    invoke-direct/range {v3 .. v8}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 48
    .line 49
    .line 50
    sput-object v3, Lcom/squareup/okhttp/internal/framed/ErrorCode;->UNSUPPORTED_VERSION:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 51
    .line 52
    new-instance v4, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 53
    .line 54
    const/16 v8, 0x8

    .line 55
    .line 56
    const/4 v9, -0x1

    .line 57
    const-string v5, "STREAM_IN_USE"

    .line 58
    .line 59
    const/4 v6, 0x4

    .line 60
    const/4 v7, 0x1

    .line 61
    invoke-direct/range {v4 .. v9}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 62
    .line 63
    .line 64
    sput-object v4, Lcom/squareup/okhttp/internal/framed/ErrorCode;->STREAM_IN_USE:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 65
    .line 66
    new-instance v5, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 67
    .line 68
    const/16 v9, 0x9

    .line 69
    .line 70
    const/4 v10, -0x1

    .line 71
    const-string v6, "STREAM_ALREADY_CLOSED"

    .line 72
    .line 73
    const/4 v7, 0x5

    .line 74
    const/4 v8, 0x1

    .line 75
    invoke-direct/range {v5 .. v10}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 76
    .line 77
    .line 78
    sput-object v5, Lcom/squareup/okhttp/internal/framed/ErrorCode;->STREAM_ALREADY_CLOSED:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 79
    .line 80
    new-instance v6, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 81
    .line 82
    const/4 v10, 0x6

    .line 83
    const/4 v11, 0x2

    .line 84
    const-string v7, "INTERNAL_ERROR"

    .line 85
    .line 86
    const/4 v8, 0x6

    .line 87
    const/4 v9, 0x2

    .line 88
    invoke-direct/range {v6 .. v11}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 89
    .line 90
    .line 91
    sput-object v6, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INTERNAL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 92
    .line 93
    new-instance v7, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 94
    .line 95
    const/4 v11, 0x7

    .line 96
    const/4 v12, -0x1

    .line 97
    const-string v8, "FLOW_CONTROL_ERROR"

    .line 98
    .line 99
    const/4 v9, 0x7

    .line 100
    const/4 v10, 0x3

    .line 101
    invoke-direct/range {v7 .. v12}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 102
    .line 103
    .line 104
    sput-object v7, Lcom/squareup/okhttp/internal/framed/ErrorCode;->FLOW_CONTROL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 105
    .line 106
    new-instance v8, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 107
    .line 108
    const/4 v13, -0x1

    .line 109
    const-string v9, "STREAM_CLOSED"

    .line 110
    .line 111
    const/16 v10, 0x8

    .line 112
    .line 113
    const/4 v11, 0x5

    .line 114
    invoke-direct/range {v8 .. v13}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 115
    .line 116
    .line 117
    sput-object v8, Lcom/squareup/okhttp/internal/framed/ErrorCode;->STREAM_CLOSED:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 118
    .line 119
    new-instance v9, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 120
    .line 121
    const/16 v13, 0xb

    .line 122
    .line 123
    const/4 v14, -0x1

    .line 124
    const-string v10, "FRAME_TOO_LARGE"

    .line 125
    .line 126
    const/16 v11, 0x9

    .line 127
    .line 128
    const/4 v12, 0x6

    .line 129
    invoke-direct/range {v9 .. v14}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 130
    .line 131
    .line 132
    sput-object v9, Lcom/squareup/okhttp/internal/framed/ErrorCode;->FRAME_TOO_LARGE:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 133
    .line 134
    new-instance v10, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 135
    .line 136
    const/4 v14, 0x3

    .line 137
    const/4 v15, -0x1

    .line 138
    const-string v11, "REFUSED_STREAM"

    .line 139
    .line 140
    const/16 v12, 0xa

    .line 141
    .line 142
    const/4 v13, 0x7

    .line 143
    invoke-direct/range {v10 .. v15}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 144
    .line 145
    .line 146
    sput-object v10, Lcom/squareup/okhttp/internal/framed/ErrorCode;->REFUSED_STREAM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 147
    .line 148
    new-instance v11, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 149
    .line 150
    const/4 v15, 0x5

    .line 151
    const/16 v16, -0x1

    .line 152
    .line 153
    const-string v12, "CANCEL"

    .line 154
    .line 155
    const/16 v13, 0xb

    .line 156
    .line 157
    const/16 v14, 0x8

    .line 158
    .line 159
    invoke-direct/range {v11 .. v16}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 160
    .line 161
    .line 162
    sput-object v11, Lcom/squareup/okhttp/internal/framed/ErrorCode;->CANCEL:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 163
    .line 164
    new-instance v12, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 165
    .line 166
    const/16 v17, -0x1

    .line 167
    .line 168
    const-string v13, "COMPRESSION_ERROR"

    .line 169
    .line 170
    const/16 v14, 0xc

    .line 171
    .line 172
    const/16 v15, 0x9

    .line 173
    .line 174
    invoke-direct/range {v12 .. v17}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 175
    .line 176
    .line 177
    sput-object v12, Lcom/squareup/okhttp/internal/framed/ErrorCode;->COMPRESSION_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 178
    .line 179
    new-instance v13, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 180
    .line 181
    const/16 v18, -0x1

    .line 182
    .line 183
    const-string v14, "CONNECT_ERROR"

    .line 184
    .line 185
    const/16 v15, 0xd

    .line 186
    .line 187
    const/16 v16, 0xa

    .line 188
    .line 189
    invoke-direct/range {v13 .. v18}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 190
    .line 191
    .line 192
    sput-object v13, Lcom/squareup/okhttp/internal/framed/ErrorCode;->CONNECT_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 193
    .line 194
    new-instance v14, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 195
    .line 196
    const/16 v19, -0x1

    .line 197
    .line 198
    const-string v15, "ENHANCE_YOUR_CALM"

    .line 199
    .line 200
    const/16 v16, 0xe

    .line 201
    .line 202
    const/16 v17, 0xb

    .line 203
    .line 204
    invoke-direct/range {v14 .. v19}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 205
    .line 206
    .line 207
    sput-object v14, Lcom/squareup/okhttp/internal/framed/ErrorCode;->ENHANCE_YOUR_CALM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 208
    .line 209
    new-instance v16, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 210
    .line 211
    const/16 v20, -0x1

    .line 212
    .line 213
    move-object/from16 v15, v16

    .line 214
    .line 215
    const-string v16, "INADEQUATE_SECURITY"

    .line 216
    .line 217
    const/16 v17, 0xf

    .line 218
    .line 219
    const/16 v18, 0xc

    .line 220
    .line 221
    invoke-direct/range {v15 .. v20}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 222
    .line 223
    .line 224
    sput-object v15, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INADEQUATE_SECURITY:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 225
    .line 226
    new-instance v16, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 227
    .line 228
    const/16 v21, -0x1

    .line 229
    .line 230
    const-string v17, "HTTP_1_1_REQUIRED"

    .line 231
    .line 232
    const/16 v18, 0x10

    .line 233
    .line 234
    const/16 v19, 0xd

    .line 235
    .line 236
    invoke-direct/range {v16 .. v21}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 237
    .line 238
    .line 239
    sput-object v16, Lcom/squareup/okhttp/internal/framed/ErrorCode;->HTTP_1_1_REQUIRED:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 240
    .line 241
    new-instance v17, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 242
    .line 243
    const/16 v21, 0xa

    .line 244
    .line 245
    const/16 v22, -0x1

    .line 246
    .line 247
    const-string v18, "INVALID_CREDENTIALS"

    .line 248
    .line 249
    const/16 v19, 0x11

    .line 250
    .line 251
    invoke-direct/range {v17 .. v22}, Lcom/squareup/okhttp/internal/framed/ErrorCode;-><init>(Ljava/lang/String;IIII)V

    .line 252
    .line 253
    .line 254
    sput-object v17, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INVALID_CREDENTIALS:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 255
    .line 256
    move-object/from16 v18, v17

    .line 257
    .line 258
    move-object/from16 v17, v16

    .line 259
    .line 260
    move-object/from16 v16, v15

    .line 261
    .line 262
    move-object v15, v14

    .line 263
    move-object v14, v13

    .line 264
    move-object v13, v12

    .line 265
    move-object v12, v11

    .line 266
    move-object v11, v10

    .line 267
    move-object v10, v9

    .line 268
    move-object v9, v8

    .line 269
    move-object v8, v7

    .line 270
    move-object v7, v6

    .line 271
    move-object v6, v5

    .line 272
    move-object v5, v4

    .line 273
    move-object v4, v3

    .line 274
    move-object v3, v2

    .line 275
    move-object v2, v1

    .line 276
    move-object v1, v0

    .line 277
    filled-new-array/range {v1 .. v18}, [Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    sput-object v0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->$VALUES:[Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 282
    .line 283
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->httpCode:I

    .line 5
    .line 6
    iput p4, p0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->spdyRstCode:I

    .line 7
    .line 8
    iput p5, p0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->spdyGoAwayCode:I

    .line 9
    .line 10
    return-void
.end method

.method public static fromHttp2(I)Lcom/squareup/okhttp/internal/framed/ErrorCode;
    .locals 5

    .line 1
    invoke-static {}, Lcom/squareup/okhttp/internal/framed/ErrorCode;->values()[Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    iget v4, v3, Lcom/squareup/okhttp/internal/framed/ErrorCode;->httpCode:I

    .line 12
    .line 13
    if-ne v4, p0, :cond_0

    .line 14
    .line 15
    return-object v3

    .line 16
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public static fromSpdy3Rst(I)Lcom/squareup/okhttp/internal/framed/ErrorCode;
    .locals 5

    .line 1
    invoke-static {}, Lcom/squareup/okhttp/internal/framed/ErrorCode;->values()[Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    iget v4, v3, Lcom/squareup/okhttp/internal/framed/ErrorCode;->spdyRstCode:I

    .line 12
    .line 13
    if-ne v4, p0, :cond_0

    .line 14
    .line 15
    return-object v3

    .line 16
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public static fromSpdyGoAway(I)Lcom/squareup/okhttp/internal/framed/ErrorCode;
    .locals 5

    .line 1
    invoke-static {}, Lcom/squareup/okhttp/internal/framed/ErrorCode;->values()[Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    iget v4, v3, Lcom/squareup/okhttp/internal/framed/ErrorCode;->spdyGoAwayCode:I

    .line 12
    .line 13
    if-ne v4, p0, :cond_0

    .line 14
    .line 15
    return-object v3

    .line 16
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/squareup/okhttp/internal/framed/ErrorCode;
    .locals 1

    .line 1
    const-class v0, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/squareup/okhttp/internal/framed/ErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->$VALUES:[Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/squareup/okhttp/internal/framed/ErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 8
    .line 9
    return-object v0
.end method
