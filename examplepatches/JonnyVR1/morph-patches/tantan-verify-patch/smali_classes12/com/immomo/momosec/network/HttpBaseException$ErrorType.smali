.class public final enum Lcom/immomo/momosec/network/HttpBaseException$ErrorType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momosec/network/HttpBaseException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ErrorType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/momosec/network/HttpBaseException$ErrorType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

.field public static final enum DECRYPTION:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

.field public static final enum JSON_PARSE:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

.field public static final enum NETWORK:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

.field public static final enum SERVER_ERROR:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

.field public static final enum UNKNOWN:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;


# instance fields
.field private final description:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    new-array v2, v1, [B

    .line 5
    .line 6
    fill-array-data v2, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/16 v3, 0xd

    .line 14
    .line 15
    new-array v3, v3, [B

    .line 16
    .line 17
    fill-array-data v3, :array_1

    .line 18
    .line 19
    .line 20
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const/4 v4, 0x0

    .line 25
    invoke-direct {v0, v2, v4, v3}, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->NETWORK:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 29
    .line 30
    new-instance v2, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 31
    .line 32
    const/16 v3, 0xa

    .line 33
    .line 34
    new-array v3, v3, [B

    .line 35
    .line 36
    fill-array-data v3, :array_2

    .line 37
    .line 38
    .line 39
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const/16 v4, 0x10

    .line 44
    .line 45
    new-array v5, v4, [B

    .line 46
    .line 47
    fill-array-data v5, :array_3

    .line 48
    .line 49
    .line 50
    invoke-static {v5}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    const/4 v6, 0x1

    .line 55
    invoke-direct {v2, v3, v6, v5}, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-object v2, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->DECRYPTION:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 59
    .line 60
    new-instance v3, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 61
    .line 62
    const/16 v5, 0xa

    .line 63
    .line 64
    new-array v5, v5, [B

    .line 65
    .line 66
    fill-array-data v5, :array_4

    .line 67
    .line 68
    .line 69
    invoke-static {v5}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    new-array v4, v4, [B

    .line 74
    .line 75
    fill-array-data v4, :array_5

    .line 76
    .line 77
    .line 78
    invoke-static {v4}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    const/4 v6, 0x2

    .line 83
    invoke-direct {v3, v5, v6, v4}, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 84
    .line 85
    .line 86
    sput-object v3, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->JSON_PARSE:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 87
    .line 88
    new-instance v4, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 89
    .line 90
    const/16 v5, 0xc

    .line 91
    .line 92
    new-array v5, v5, [B

    .line 93
    .line 94
    fill-array-data v5, :array_6

    .line 95
    .line 96
    .line 97
    invoke-static {v5}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    const/16 v6, 0xc

    .line 102
    .line 103
    new-array v6, v6, [B

    .line 104
    .line 105
    fill-array-data v6, :array_7

    .line 106
    .line 107
    .line 108
    invoke-static {v6}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    const/4 v7, 0x3

    .line 113
    invoke-direct {v4, v5, v7, v6}, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sput-object v4, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->SERVER_ERROR:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 117
    .line 118
    new-instance v5, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 119
    .line 120
    new-array v1, v1, [B

    .line 121
    .line 122
    fill-array-data v1, :array_8

    .line 123
    .line 124
    .line 125
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    const/16 v6, 0xd

    .line 130
    .line 131
    new-array v6, v6, [B

    .line 132
    .line 133
    fill-array-data v6, :array_9

    .line 134
    .line 135
    .line 136
    invoke-static {v6}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    const/4 v7, 0x4

    .line 141
    invoke-direct {v5, v1, v7, v6}, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 142
    .line 143
    .line 144
    sput-object v5, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->UNKNOWN:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 145
    .line 146
    filled-new-array {v0, v2, v3, v4, v5}, [Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    sput-object v0, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->$VALUES:[Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 151
    .line 152
    return-void

    .line 153
    :array_0
    .array-data 1
        0x7et
        0x23t
        0x65t
        0x60t
        0x2et
        0x34t
        0x7bt
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    :array_1
    .array-data 1
        0x7et
        0x3t
        0x45t
        0x40t
        0xet
        0x14t
        0x5bt
        0x46t
        0x74t
        0x45t
        0x13t
        0x9t
        0x42t
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
    .line 171
    .line 172
    nop

    .line 173
    :array_2
    .array-data 1
        0x74t
        0x23t
        0x72t
        0x65t
        0x38t
        0x36t
        0x64t
        0x2ft
        0x7et
        0x79t
    .end array-data

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    nop

    .line 183
    :array_3
    .array-data 1
        0x74t
        0x3t
        0x52t
        0x45t
        0x18t
        0x16t
        0x44t
        0xft
        0x5et
        0x59t
        0x41t
        0x23t
        0x42t
        0x14t
        0x5et
        0x45t
    .end array-data

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
    .line 194
    .line 195
    :array_4
    .array-data 1
        0x7at
        0x35t
        0x7et
        0x79t
        0x3et
        0x36t
        0x71t
        0x34t
        0x62t
        0x72t
    .end array-data

    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    nop

    .line 205
    :array_5
    .array-data 1
        0x7at
        0x35t
        0x7et
        0x79t
        0x41t
        0x36t
        0x51t
        0x14t
        0x42t
        0x52t
        0x41t
        0x23t
        0x42t
        0x14t
        0x5et
        0x45t
    .end array-data

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
    :array_6
    .array-data 1
        0x63t
        0x23t
        0x63t
        0x61t
        0x24t
        0x34t
        0x6ft
        0x23t
        0x63t
        0x65t
        0x2et
        0x34t
    .end array-data

    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    :array_7
    .array-data 1
        0x63t
        0x3t
        0x43t
        0x41t
        0x4t
        0x14t
        0x10t
        0x23t
        0x43t
        0x45t
        0xet
        0x14t
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
    :array_8
    .array-data 1
        0x65t
        0x28t
        0x7at
        0x79t
        0x2et
        0x31t
        0x7et
    .end array-data

    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    :array_9
    .array-data 1
        0x65t
        0x8t
        0x5at
        0x59t
        0xet
        0x11t
        0x5et
        0x46t
        0x74t
        0x45t
        0x13t
        0x9t
        0x42t
    .end array-data
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->description:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$ErrorType;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/momosec/network/HttpBaseException$ErrorType;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->$VALUES:[Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->description:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
