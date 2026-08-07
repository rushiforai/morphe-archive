.class public final enum Lorg/fourthline/cling/model/types/Datatype$Default;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/model/types/Datatype;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Default"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/model/types/Datatype$Default;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum BOOLEAN:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum BOOLEAN_PRIMITIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum BYTES:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum CALENDAR:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum CHAR:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum CHAR_PRIMITIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum DOUBLE:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum DOUBLE_PRIMTIIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum FLOAT:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum FLOAT_PRIMITIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum INTEGER:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum INTEGER_PRIMITIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum SHORT:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum SHORT_PRIMITIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum STRING:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum UNSIGNED_INTEGER_FOUR_BYTES:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum UNSIGNED_INTEGER_ONE_BYTE:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum UNSIGNED_INTEGER_TWO_BYTES:Lorg/fourthline/cling/model/types/Datatype$Default;

.field public static final enum URI:Lorg/fourthline/cling/model/types/Datatype$Default;


# instance fields
.field private builtinType:Lorg/fourthline/cling/model/types/Datatype$Builtin;

.field private javaType:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 1
    new-instance v1, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 2
    .line 3
    sget-object v0, Lorg/fourthline/cling/model/types/Datatype$Builtin;->BOOLEAN:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 4
    .line 5
    const-string v2, "BOOLEAN"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const-class v4, Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-direct {v1, v2, v3, v4, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lorg/fourthline/cling/model/types/Datatype$Default;->BOOLEAN:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 14
    .line 15
    new-instance v2, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 19
    .line 20
    const-string v5, "BOOLEAN_PRIMITIVE"

    .line 21
    .line 22
    invoke-direct {v2, v5, v3, v4, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 23
    .line 24
    .line 25
    sput-object v2, Lorg/fourthline/cling/model/types/Datatype$Default;->BOOLEAN_PRIMITIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 26
    .line 27
    new-instance v3, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 28
    .line 29
    sget-object v0, Lorg/fourthline/cling/model/types/Datatype$Builtin;->I2_SHORT:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 30
    .line 31
    const-string v4, "SHORT"

    .line 32
    .line 33
    const/4 v5, 0x2

    .line 34
    const-class v6, Ljava/lang/Short;

    .line 35
    .line 36
    invoke-direct {v3, v4, v5, v6, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lorg/fourthline/cling/model/types/Datatype$Default;->SHORT:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 40
    .line 41
    new-instance v4, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 42
    .line 43
    const/4 v5, 0x3

    .line 44
    sget-object v6, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 45
    .line 46
    const-string v7, "SHORT_PRIMITIVE"

    .line 47
    .line 48
    invoke-direct {v4, v7, v5, v6, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 49
    .line 50
    .line 51
    sput-object v4, Lorg/fourthline/cling/model/types/Datatype$Default;->SHORT_PRIMITIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 52
    .line 53
    new-instance v5, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 54
    .line 55
    sget-object v0, Lorg/fourthline/cling/model/types/Datatype$Builtin;->I4:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 56
    .line 57
    const-string v6, "INTEGER"

    .line 58
    .line 59
    const/4 v7, 0x4

    .line 60
    const-class v8, Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-direct {v5, v6, v7, v8, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 63
    .line 64
    .line 65
    sput-object v5, Lorg/fourthline/cling/model/types/Datatype$Default;->INTEGER:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 66
    .line 67
    new-instance v6, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 68
    .line 69
    const/4 v7, 0x5

    .line 70
    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 71
    .line 72
    const-string v9, "INTEGER_PRIMITIVE"

    .line 73
    .line 74
    invoke-direct {v6, v9, v7, v8, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 75
    .line 76
    .line 77
    sput-object v6, Lorg/fourthline/cling/model/types/Datatype$Default;->INTEGER_PRIMITIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 78
    .line 79
    new-instance v7, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 80
    .line 81
    const-class v0, Lorg/fourthline/cling/model/types/UnsignedIntegerOneByte;

    .line 82
    .line 83
    sget-object v8, Lorg/fourthline/cling/model/types/Datatype$Builtin;->UI1:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 84
    .line 85
    const-string v9, "UNSIGNED_INTEGER_ONE_BYTE"

    .line 86
    .line 87
    const/4 v10, 0x6

    .line 88
    invoke-direct {v7, v9, v10, v0, v8}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 89
    .line 90
    .line 91
    sput-object v7, Lorg/fourthline/cling/model/types/Datatype$Default;->UNSIGNED_INTEGER_ONE_BYTE:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 92
    .line 93
    new-instance v8, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 94
    .line 95
    const-class v0, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 96
    .line 97
    sget-object v9, Lorg/fourthline/cling/model/types/Datatype$Builtin;->UI2:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 98
    .line 99
    const-string v10, "UNSIGNED_INTEGER_TWO_BYTES"

    .line 100
    .line 101
    const/4 v11, 0x7

    .line 102
    invoke-direct {v8, v10, v11, v0, v9}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 103
    .line 104
    .line 105
    sput-object v8, Lorg/fourthline/cling/model/types/Datatype$Default;->UNSIGNED_INTEGER_TWO_BYTES:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 106
    .line 107
    new-instance v9, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 108
    .line 109
    const-class v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 110
    .line 111
    sget-object v10, Lorg/fourthline/cling/model/types/Datatype$Builtin;->UI4:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 112
    .line 113
    const-string v11, "UNSIGNED_INTEGER_FOUR_BYTES"

    .line 114
    .line 115
    const/16 v12, 0x8

    .line 116
    .line 117
    invoke-direct {v9, v11, v12, v0, v10}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 118
    .line 119
    .line 120
    sput-object v9, Lorg/fourthline/cling/model/types/Datatype$Default;->UNSIGNED_INTEGER_FOUR_BYTES:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 121
    .line 122
    new-instance v10, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 123
    .line 124
    sget-object v0, Lorg/fourthline/cling/model/types/Datatype$Builtin;->R4:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 125
    .line 126
    const-string v11, "FLOAT"

    .line 127
    .line 128
    const/16 v12, 0x9

    .line 129
    .line 130
    const-class v13, Ljava/lang/Float;

    .line 131
    .line 132
    invoke-direct {v10, v11, v12, v13, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 133
    .line 134
    .line 135
    sput-object v10, Lorg/fourthline/cling/model/types/Datatype$Default;->FLOAT:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 136
    .line 137
    new-instance v11, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 138
    .line 139
    const/16 v12, 0xa

    .line 140
    .line 141
    sget-object v13, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 142
    .line 143
    const-string v14, "FLOAT_PRIMITIVE"

    .line 144
    .line 145
    invoke-direct {v11, v14, v12, v13, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 146
    .line 147
    .line 148
    sput-object v11, Lorg/fourthline/cling/model/types/Datatype$Default;->FLOAT_PRIMITIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 149
    .line 150
    new-instance v12, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 151
    .line 152
    sget-object v0, Lorg/fourthline/cling/model/types/Datatype$Builtin;->FLOAT:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 153
    .line 154
    const-string v13, "DOUBLE"

    .line 155
    .line 156
    const/16 v14, 0xb

    .line 157
    .line 158
    const-class v15, Ljava/lang/Double;

    .line 159
    .line 160
    invoke-direct {v12, v13, v14, v15, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 161
    .line 162
    .line 163
    sput-object v12, Lorg/fourthline/cling/model/types/Datatype$Default;->DOUBLE:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 164
    .line 165
    new-instance v13, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 166
    .line 167
    const/16 v14, 0xc

    .line 168
    .line 169
    sget-object v15, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 170
    .line 171
    move-object/from16 v16, v1

    .line 172
    .line 173
    const-string v1, "DOUBLE_PRIMTIIVE"

    .line 174
    .line 175
    invoke-direct {v13, v1, v14, v15, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 176
    .line 177
    .line 178
    sput-object v13, Lorg/fourthline/cling/model/types/Datatype$Default;->DOUBLE_PRIMTIIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 179
    .line 180
    new-instance v14, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 181
    .line 182
    sget-object v0, Lorg/fourthline/cling/model/types/Datatype$Builtin;->CHAR:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 183
    .line 184
    const-string v1, "CHAR"

    .line 185
    .line 186
    const/16 v15, 0xd

    .line 187
    .line 188
    move-object/from16 v17, v2

    .line 189
    .line 190
    const-class v2, Ljava/lang/Character;

    .line 191
    .line 192
    invoke-direct {v14, v1, v15, v2, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 193
    .line 194
    .line 195
    sput-object v14, Lorg/fourthline/cling/model/types/Datatype$Default;->CHAR:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 196
    .line 197
    new-instance v15, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 198
    .line 199
    const/16 v1, 0xe

    .line 200
    .line 201
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    .line 202
    .line 203
    move-object/from16 v18, v3

    .line 204
    .line 205
    const-string v3, "CHAR_PRIMITIVE"

    .line 206
    .line 207
    invoke-direct {v15, v3, v1, v2, v0}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 208
    .line 209
    .line 210
    sput-object v15, Lorg/fourthline/cling/model/types/Datatype$Default;->CHAR_PRIMITIVE:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 211
    .line 212
    new-instance v0, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 213
    .line 214
    const-class v1, Ljava/lang/String;

    .line 215
    .line 216
    sget-object v2, Lorg/fourthline/cling/model/types/Datatype$Builtin;->STRING:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 217
    .line 218
    const-string v3, "STRING"

    .line 219
    .line 220
    move-object/from16 v19, v4

    .line 221
    .line 222
    const/16 v4, 0xf

    .line 223
    .line 224
    invoke-direct {v0, v3, v4, v1, v2}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 225
    .line 226
    .line 227
    sput-object v0, Lorg/fourthline/cling/model/types/Datatype$Default;->STRING:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 228
    .line 229
    new-instance v1, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 230
    .line 231
    const-class v2, Ljava/util/Calendar;

    .line 232
    .line 233
    sget-object v3, Lorg/fourthline/cling/model/types/Datatype$Builtin;->DATETIME:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 234
    .line 235
    const-string v4, "CALENDAR"

    .line 236
    .line 237
    move-object/from16 v20, v0

    .line 238
    .line 239
    const/16 v0, 0x10

    .line 240
    .line 241
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 242
    .line 243
    .line 244
    sput-object v1, Lorg/fourthline/cling/model/types/Datatype$Default;->CALENDAR:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 245
    .line 246
    new-instance v0, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 247
    .line 248
    const-class v2, [B

    .line 249
    .line 250
    sget-object v3, Lorg/fourthline/cling/model/types/Datatype$Builtin;->BIN_BASE64:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 251
    .line 252
    const-string v4, "BYTES"

    .line 253
    .line 254
    move-object/from16 v21, v1

    .line 255
    .line 256
    const/16 v1, 0x11

    .line 257
    .line 258
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 259
    .line 260
    .line 261
    sput-object v0, Lorg/fourthline/cling/model/types/Datatype$Default;->BYTES:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 262
    .line 263
    new-instance v1, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 264
    .line 265
    const-class v2, Ljava/net/URI;

    .line 266
    .line 267
    sget-object v3, Lorg/fourthline/cling/model/types/Datatype$Builtin;->URI:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 268
    .line 269
    const-string v4, "URI"

    .line 270
    .line 271
    move-object/from16 v22, v0

    .line 272
    .line 273
    const/16 v0, 0x12

    .line 274
    .line 275
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/fourthline/cling/model/types/Datatype$Default;-><init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V

    .line 276
    .line 277
    .line 278
    sput-object v1, Lorg/fourthline/cling/model/types/Datatype$Default;->URI:Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 279
    .line 280
    move-object/from16 v2, v17

    .line 281
    .line 282
    move-object/from16 v3, v18

    .line 283
    .line 284
    move-object/from16 v4, v19

    .line 285
    .line 286
    move-object/from16 v17, v21

    .line 287
    .line 288
    move-object/from16 v18, v22

    .line 289
    .line 290
    move-object/from16 v19, v1

    .line 291
    .line 292
    move-object/from16 v1, v16

    .line 293
    .line 294
    move-object/from16 v16, v20

    .line 295
    .line 296
    filled-new-array/range {v1 .. v19}, [Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    sput-object v0, Lorg/fourthline/cling/model/types/Datatype$Default;->$VALUES:[Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 301
    .line 302
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/Class;Lorg/fourthline/cling/model/types/Datatype$Builtin;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            "Lorg/fourthline/cling/model/types/Datatype$Builtin;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/fourthline/cling/model/types/Datatype$Default;->javaType:Ljava/lang/Class;

    .line 5
    .line 6
    iput-object p4, p0, Lorg/fourthline/cling/model/types/Datatype$Default;->builtinType:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 7
    .line 8
    return-void
.end method

.method public static getByJavaType(Ljava/lang/Class;)Lorg/fourthline/cling/model/types/Datatype$Default;
    .locals 5

    .line 1
    invoke-static {}, Lorg/fourthline/cling/model/types/Datatype$Default;->values()[Lorg/fourthline/cling/model/types/Datatype$Default;

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
    invoke-virtual {v3}, Lorg/fourthline/cling/model/types/Datatype$Default;->getJavaType()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {v4, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    return-object v3

    .line 22
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/model/types/Datatype$Default;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/model/types/Datatype$Default;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/model/types/Datatype$Default;->$VALUES:[Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/model/types/Datatype$Default;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/model/types/Datatype$Default;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getBuiltinType()Lorg/fourthline/cling/model/types/Datatype$Builtin;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/types/Datatype$Default;->builtinType:Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 2
    .line 3
    return-object p0
.end method

.method public getJavaType()Ljava/lang/Class;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/types/Datatype$Default;->javaType:Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/fourthline/cling/model/types/Datatype$Default;->getJavaType()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " => "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/fourthline/cling/model/types/Datatype$Default;->getBuiltinType()Lorg/fourthline/cling/model/types/Datatype$Builtin;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
