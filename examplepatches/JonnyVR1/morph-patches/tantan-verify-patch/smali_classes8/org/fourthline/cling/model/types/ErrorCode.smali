.class public final enum Lorg/fourthline/cling/model/types/ErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/model/types/ErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum ACTION_FAILED:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum ACTION_NOT_AUTHORIZED:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum ARGUMENT_TOO_LONG:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum ARGUMENT_VALUE_INVALID:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum ARGUMENT_VALUE_OUT_OF_RANGE:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum HUMAN_INTERVENTION_REQUIRED:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum ILLEGAL_MIME_TYPE:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum INVALID_ACTION:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum INVALID_ARGS:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum INVALID_CONTROL_URL:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum INVALID_SEQUENCE:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum NOT_ENCRYPTED:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum NO_SUCH_SESSION:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum OPTIONAL_ACTION:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum OUT_OF_MEMORY:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum SIGNATURE_FAILURE:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum SIGNATURE_MISSING:Lorg/fourthline/cling/model/types/ErrorCode;

.field public static final enum TRANSPORT_LOCKED:Lorg/fourthline/cling/model/types/ErrorCode;


# instance fields
.field private code:I

.field private description:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 22

    .line 1
    new-instance v1, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 2
    .line 3
    const/16 v0, 0x191

    .line 4
    .line 5
    const-string v2, "No action by that name at this service"

    .line 6
    .line 7
    const-string v3, "INVALID_ACTION"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v1, v3, v4, v0, v2}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lorg/fourthline/cling/model/types/ErrorCode;->INVALID_ACTION:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 14
    .line 15
    new-instance v2, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 16
    .line 17
    const/16 v0, 0x192

    .line 18
    .line 19
    const-string v3, "Not enough IN args, too many IN args, no IN arg by that name, one or more IN args are of the wrong data type"

    .line 20
    .line 21
    const-string v4, "INVALID_ARGS"

    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    invoke-direct {v2, v4, v5, v0, v3}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v2, Lorg/fourthline/cling/model/types/ErrorCode;->INVALID_ARGS:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 28
    .line 29
    new-instance v3, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 30
    .line 31
    const/16 v0, 0x1f5

    .line 32
    .line 33
    const-string v4, "Current state of service prevents invoking that action"

    .line 34
    .line 35
    const-string v5, "ACTION_FAILED"

    .line 36
    .line 37
    const/4 v6, 0x2

    .line 38
    invoke-direct {v3, v5, v6, v0, v4}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sput-object v3, Lorg/fourthline/cling/model/types/ErrorCode;->ACTION_FAILED:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 42
    .line 43
    new-instance v4, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 44
    .line 45
    const/16 v0, 0x258

    .line 46
    .line 47
    const-string v5, "The argument value is invalid"

    .line 48
    .line 49
    const-string v6, "ARGUMENT_VALUE_INVALID"

    .line 50
    .line 51
    const/4 v7, 0x3

    .line 52
    invoke-direct {v4, v6, v7, v0, v5}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sput-object v4, Lorg/fourthline/cling/model/types/ErrorCode;->ARGUMENT_VALUE_INVALID:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 56
    .line 57
    new-instance v5, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 58
    .line 59
    const/16 v0, 0x259

    .line 60
    .line 61
    const-string v6, "An argument value is less than the minimum or more than the maximum value of the allowedValueRange, or is not in the allowedValueList"

    .line 62
    .line 63
    const-string v7, "ARGUMENT_VALUE_OUT_OF_RANGE"

    .line 64
    .line 65
    const/4 v8, 0x4

    .line 66
    invoke-direct {v5, v7, v8, v0, v6}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sput-object v5, Lorg/fourthline/cling/model/types/ErrorCode;->ARGUMENT_VALUE_OUT_OF_RANGE:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 70
    .line 71
    new-instance v6, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 72
    .line 73
    const/16 v0, 0x25a

    .line 74
    .line 75
    const-string v7, "The requested action is optional and is not implemented by the device"

    .line 76
    .line 77
    const-string v8, "OPTIONAL_ACTION"

    .line 78
    .line 79
    const/4 v9, 0x5

    .line 80
    invoke-direct {v6, v8, v9, v0, v7}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sput-object v6, Lorg/fourthline/cling/model/types/ErrorCode;->OPTIONAL_ACTION:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 84
    .line 85
    new-instance v7, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 86
    .line 87
    const/16 v0, 0x25b

    .line 88
    .line 89
    const-string v8, "The device does not have sufficient memory available to complete the action"

    .line 90
    .line 91
    const-string v9, "OUT_OF_MEMORY"

    .line 92
    .line 93
    const/4 v10, 0x6

    .line 94
    invoke-direct {v7, v9, v10, v0, v8}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    sput-object v7, Lorg/fourthline/cling/model/types/ErrorCode;->OUT_OF_MEMORY:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 98
    .line 99
    new-instance v8, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 100
    .line 101
    const/16 v0, 0x25c

    .line 102
    .line 103
    const-string v9, "The device has encountered an error condition which it cannot resolve itself"

    .line 104
    .line 105
    const-string v10, "HUMAN_INTERVENTION_REQUIRED"

    .line 106
    .line 107
    const/4 v11, 0x7

    .line 108
    invoke-direct {v8, v10, v11, v0, v9}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 109
    .line 110
    .line 111
    sput-object v8, Lorg/fourthline/cling/model/types/ErrorCode;->HUMAN_INTERVENTION_REQUIRED:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 112
    .line 113
    new-instance v9, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 114
    .line 115
    const/16 v0, 0x25d

    .line 116
    .line 117
    const-string v10, "A string argument is too long for the device to handle properly"

    .line 118
    .line 119
    const-string v11, "ARGUMENT_TOO_LONG"

    .line 120
    .line 121
    const/16 v12, 0x8

    .line 122
    .line 123
    invoke-direct {v9, v11, v12, v0, v10}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 124
    .line 125
    .line 126
    sput-object v9, Lorg/fourthline/cling/model/types/ErrorCode;->ARGUMENT_TOO_LONG:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 127
    .line 128
    new-instance v10, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 129
    .line 130
    const/16 v0, 0x25e

    .line 131
    .line 132
    const-string v11, "The action requested requires authorization and the sender was not authorized"

    .line 133
    .line 134
    const-string v12, "ACTION_NOT_AUTHORIZED"

    .line 135
    .line 136
    const/16 v13, 0x9

    .line 137
    .line 138
    invoke-direct {v10, v12, v13, v0, v11}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 139
    .line 140
    .line 141
    sput-object v10, Lorg/fourthline/cling/model/types/ErrorCode;->ACTION_NOT_AUTHORIZED:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 142
    .line 143
    new-instance v11, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 144
    .line 145
    const/16 v0, 0x25f

    .line 146
    .line 147
    const-string v12, "The sender\'s signature failed to verify"

    .line 148
    .line 149
    const-string v13, "SIGNATURE_FAILURE"

    .line 150
    .line 151
    const/16 v14, 0xa

    .line 152
    .line 153
    invoke-direct {v11, v13, v14, v0, v12}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 154
    .line 155
    .line 156
    sput-object v11, Lorg/fourthline/cling/model/types/ErrorCode;->SIGNATURE_FAILURE:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 157
    .line 158
    new-instance v12, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 159
    .line 160
    const/16 v0, 0x260

    .line 161
    .line 162
    const-string v13, "The action requested requires a digital signature and there was none provided"

    .line 163
    .line 164
    const-string v14, "SIGNATURE_MISSING"

    .line 165
    .line 166
    const/16 v15, 0xb

    .line 167
    .line 168
    invoke-direct {v12, v14, v15, v0, v13}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 169
    .line 170
    .line 171
    sput-object v12, Lorg/fourthline/cling/model/types/ErrorCode;->SIGNATURE_MISSING:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 172
    .line 173
    new-instance v13, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 174
    .line 175
    const/16 v0, 0x261

    .line 176
    .line 177
    const-string v14, "This action requires confidentiality but the action was not delivered encrypted"

    .line 178
    .line 179
    const-string v15, "NOT_ENCRYPTED"

    .line 180
    .line 181
    move-object/from16 v16, v1

    .line 182
    .line 183
    const/16 v1, 0xc

    .line 184
    .line 185
    invoke-direct {v13, v15, v1, v0, v14}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 186
    .line 187
    .line 188
    sput-object v13, Lorg/fourthline/cling/model/types/ErrorCode;->NOT_ENCRYPTED:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 189
    .line 190
    new-instance v14, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 191
    .line 192
    const/16 v0, 0x262

    .line 193
    .line 194
    const-string v1, "The sequence provided was not valid"

    .line 195
    .line 196
    const-string v15, "INVALID_SEQUENCE"

    .line 197
    .line 198
    move-object/from16 v17, v2

    .line 199
    .line 200
    const/16 v2, 0xd

    .line 201
    .line 202
    invoke-direct {v14, v15, v2, v0, v1}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 203
    .line 204
    .line 205
    sput-object v14, Lorg/fourthline/cling/model/types/ErrorCode;->INVALID_SEQUENCE:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 206
    .line 207
    new-instance v15, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 208
    .line 209
    const/16 v0, 0x263

    .line 210
    .line 211
    const-string v1, "The controlURL within the freshness element does not match the controlURL of the action actually invoked"

    .line 212
    .line 213
    const-string v2, "INVALID_CONTROL_URL"

    .line 214
    .line 215
    move-object/from16 v18, v3

    .line 216
    .line 217
    const/16 v3, 0xe

    .line 218
    .line 219
    invoke-direct {v15, v2, v3, v0, v1}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 220
    .line 221
    .line 222
    sput-object v15, Lorg/fourthline/cling/model/types/ErrorCode;->INVALID_CONTROL_URL:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 223
    .line 224
    new-instance v0, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 225
    .line 226
    const/16 v1, 0x264

    .line 227
    .line 228
    const-string v2, "The session key reference is to a non-existent session"

    .line 229
    .line 230
    const-string v3, "NO_SUCH_SESSION"

    .line 231
    .line 232
    move-object/from16 v19, v4

    .line 233
    .line 234
    const/16 v4, 0xf

    .line 235
    .line 236
    invoke-direct {v0, v3, v4, v1, v2}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 237
    .line 238
    .line 239
    sput-object v0, Lorg/fourthline/cling/model/types/ErrorCode;->NO_SUCH_SESSION:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 240
    .line 241
    new-instance v1, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 242
    .line 243
    const/16 v2, 0x2c1

    .line 244
    .line 245
    const-string v3, "Transport locked"

    .line 246
    .line 247
    const-string v4, "TRANSPORT_LOCKED"

    .line 248
    .line 249
    move-object/from16 v20, v0

    .line 250
    .line 251
    const/16 v0, 0x10

    .line 252
    .line 253
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 254
    .line 255
    .line 256
    sput-object v1, Lorg/fourthline/cling/model/types/ErrorCode;->TRANSPORT_LOCKED:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 257
    .line 258
    new-instance v0, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 259
    .line 260
    const/16 v2, 0x2ca

    .line 261
    .line 262
    const-string v3, "Illegal mime-type"

    .line 263
    .line 264
    const-string v4, "ILLEGAL_MIME_TYPE"

    .line 265
    .line 266
    move-object/from16 v21, v1

    .line 267
    .line 268
    const/16 v1, 0x11

    .line 269
    .line 270
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/fourthline/cling/model/types/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 271
    .line 272
    .line 273
    sput-object v0, Lorg/fourthline/cling/model/types/ErrorCode;->ILLEGAL_MIME_TYPE:Lorg/fourthline/cling/model/types/ErrorCode;

    .line 274
    .line 275
    move-object/from16 v1, v16

    .line 276
    .line 277
    move-object/from16 v2, v17

    .line 278
    .line 279
    move-object/from16 v3, v18

    .line 280
    .line 281
    move-object/from16 v4, v19

    .line 282
    .line 283
    move-object/from16 v16, v20

    .line 284
    .line 285
    move-object/from16 v17, v21

    .line 286
    .line 287
    move-object/from16 v18, v0

    .line 288
    .line 289
    filled-new-array/range {v1 .. v18}, [Lorg/fourthline/cling/model/types/ErrorCode;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    sput-object v0, Lorg/fourthline/cling/model/types/ErrorCode;->$VALUES:[Lorg/fourthline/cling/model/types/ErrorCode;

    .line 294
    .line 295
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lorg/fourthline/cling/model/types/ErrorCode;->code:I

    .line 5
    .line 6
    iput-object p4, p0, Lorg/fourthline/cling/model/types/ErrorCode;->description:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static getByCode(I)Lorg/fourthline/cling/model/types/ErrorCode;
    .locals 5

    .line 1
    invoke-static {}, Lorg/fourthline/cling/model/types/ErrorCode;->values()[Lorg/fourthline/cling/model/types/ErrorCode;

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
    invoke-virtual {v3}, Lorg/fourthline/cling/model/types/ErrorCode;->getCode()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/model/types/ErrorCode;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/model/types/ErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/model/types/ErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/model/types/ErrorCode;->$VALUES:[Lorg/fourthline/cling/model/types/ErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/model/types/ErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/model/types/ErrorCode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/model/types/ErrorCode;->code:I

    .line 2
    .line 3
    return p0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/types/ErrorCode;->description:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
