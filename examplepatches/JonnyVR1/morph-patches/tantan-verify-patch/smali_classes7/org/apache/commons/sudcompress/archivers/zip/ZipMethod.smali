.class public final enum Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum AES_ENCRYPTED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum BZIP2:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum ENHANCED_DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum EXPANDING_LEVEL_1:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum EXPANDING_LEVEL_2:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum EXPANDING_LEVEL_3:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum EXPANDING_LEVEL_4:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum IMPLODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum JPEG:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum LZMA:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum PKWARE_IMPLODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum PPMD:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum STORED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum TOKENIZATION:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum UNKNOWN:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field static final UNKNOWN_CODE:I = -0x1

.field public static final enum UNSHRINKING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum WAVPACK:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field public static final enum XZ:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

.field private static final codeToEnum:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final code:I


# direct methods
.method private static synthetic $values()[Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;
    .locals 20

    .line 1
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->STORED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 2
    .line 3
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->UNSHRINKING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 4
    .line 5
    sget-object v3, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->EXPANDING_LEVEL_1:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 6
    .line 7
    sget-object v4, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->EXPANDING_LEVEL_2:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 8
    .line 9
    sget-object v5, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->EXPANDING_LEVEL_3:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 10
    .line 11
    sget-object v6, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->EXPANDING_LEVEL_4:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 12
    .line 13
    sget-object v7, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->IMPLODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 14
    .line 15
    sget-object v8, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->TOKENIZATION:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 16
    .line 17
    sget-object v9, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 18
    .line 19
    sget-object v10, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->ENHANCED_DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 20
    .line 21
    sget-object v11, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->PKWARE_IMPLODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 22
    .line 23
    sget-object v12, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->BZIP2:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 24
    .line 25
    sget-object v13, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->LZMA:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 26
    .line 27
    sget-object v14, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->XZ:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 28
    .line 29
    sget-object v15, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->JPEG:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 30
    .line 31
    sget-object v16, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->WAVPACK:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 32
    .line 33
    sget-object v17, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->PPMD:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 34
    .line 35
    sget-object v18, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->AES_ENCRYPTED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 36
    .line 37
    sget-object v19, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->UNKNOWN:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 38
    .line 39
    filled-new-array/range {v1 .. v19}, [Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 2
    .line 3
    const-string v1, "STORED"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->STORED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 10
    .line 11
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 12
    .line 13
    const-string v1, "UNSHRINKING"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v0, v1, v3, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->UNSHRINKING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 20
    .line 21
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 22
    .line 23
    const-string v1, "EXPANDING_LEVEL_1"

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    invoke-direct {v0, v1, v3, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->EXPANDING_LEVEL_1:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 30
    .line 31
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 32
    .line 33
    const-string v1, "EXPANDING_LEVEL_2"

    .line 34
    .line 35
    const/4 v3, 0x3

    .line 36
    invoke-direct {v0, v1, v3, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->EXPANDING_LEVEL_2:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 40
    .line 41
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 42
    .line 43
    const-string v1, "EXPANDING_LEVEL_3"

    .line 44
    .line 45
    const/4 v3, 0x4

    .line 46
    invoke-direct {v0, v1, v3, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->EXPANDING_LEVEL_3:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 50
    .line 51
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 52
    .line 53
    const-string v1, "EXPANDING_LEVEL_4"

    .line 54
    .line 55
    const/4 v3, 0x5

    .line 56
    invoke-direct {v0, v1, v3, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->EXPANDING_LEVEL_4:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 60
    .line 61
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 62
    .line 63
    const-string v1, "IMPLODING"

    .line 64
    .line 65
    const/4 v3, 0x6

    .line 66
    invoke-direct {v0, v1, v3, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->IMPLODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 70
    .line 71
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 72
    .line 73
    const-string v1, "TOKENIZATION"

    .line 74
    .line 75
    const/4 v3, 0x7

    .line 76
    invoke-direct {v0, v1, v3, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->TOKENIZATION:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 80
    .line 81
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 82
    .line 83
    const-string v1, "DEFLATED"

    .line 84
    .line 85
    const/16 v3, 0x8

    .line 86
    .line 87
    invoke-direct {v0, v1, v3, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 88
    .line 89
    .line 90
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 91
    .line 92
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 93
    .line 94
    const-string v1, "ENHANCED_DEFLATED"

    .line 95
    .line 96
    const/16 v3, 0x9

    .line 97
    .line 98
    invoke-direct {v0, v1, v3, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 99
    .line 100
    .line 101
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->ENHANCED_DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 102
    .line 103
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 104
    .line 105
    const-string v1, "PKWARE_IMPLODING"

    .line 106
    .line 107
    const/16 v3, 0xa

    .line 108
    .line 109
    invoke-direct {v0, v1, v3, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 110
    .line 111
    .line 112
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->PKWARE_IMPLODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 113
    .line 114
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 115
    .line 116
    const-string v1, "BZIP2"

    .line 117
    .line 118
    const/16 v3, 0xb

    .line 119
    .line 120
    const/16 v4, 0xc

    .line 121
    .line 122
    invoke-direct {v0, v1, v3, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 123
    .line 124
    .line 125
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->BZIP2:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 126
    .line 127
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 128
    .line 129
    const-string v1, "LZMA"

    .line 130
    .line 131
    const/16 v3, 0xe

    .line 132
    .line 133
    invoke-direct {v0, v1, v4, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 134
    .line 135
    .line 136
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->LZMA:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 137
    .line 138
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 139
    .line 140
    const/16 v1, 0xd

    .line 141
    .line 142
    const/16 v4, 0x5f

    .line 143
    .line 144
    const-string v5, "XZ"

    .line 145
    .line 146
    invoke-direct {v0, v5, v1, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 147
    .line 148
    .line 149
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->XZ:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 150
    .line 151
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 152
    .line 153
    const-string v1, "JPEG"

    .line 154
    .line 155
    const/16 v4, 0x60

    .line 156
    .line 157
    invoke-direct {v0, v1, v3, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 158
    .line 159
    .line 160
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->JPEG:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 161
    .line 162
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 163
    .line 164
    const/16 v1, 0xf

    .line 165
    .line 166
    const/16 v3, 0x61

    .line 167
    .line 168
    const-string v4, "WAVPACK"

    .line 169
    .line 170
    invoke-direct {v0, v4, v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 171
    .line 172
    .line 173
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->WAVPACK:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 174
    .line 175
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 176
    .line 177
    const/16 v1, 0x10

    .line 178
    .line 179
    const/16 v3, 0x62

    .line 180
    .line 181
    const-string v4, "PPMD"

    .line 182
    .line 183
    invoke-direct {v0, v4, v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 184
    .line 185
    .line 186
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->PPMD:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 187
    .line 188
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 189
    .line 190
    const/16 v1, 0x11

    .line 191
    .line 192
    const/16 v3, 0x63

    .line 193
    .line 194
    const-string v4, "AES_ENCRYPTED"

    .line 195
    .line 196
    invoke-direct {v0, v4, v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    .line 197
    .line 198
    .line 199
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->AES_ENCRYPTED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 200
    .line 201
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 202
    .line 203
    const-string v1, "UNKNOWN"

    .line 204
    .line 205
    const/16 v3, 0x12

    .line 206
    .line 207
    invoke-direct {v0, v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;I)V

    .line 208
    .line 209
    .line 210
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->UNKNOWN:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 211
    .line 212
    invoke-static {}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->$values()[Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->$VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 217
    .line 218
    new-instance v0, Ljava/util/HashMap;

    .line 219
    .line 220
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 221
    .line 222
    .line 223
    invoke-static {}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->values()[Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    array-length v3, v1

    .line 228
    :goto_0
    if-ge v2, v3, :cond_0

    .line 229
    .line 230
    aget-object v4, v1, v2

    .line 231
    .line 232
    invoke-virtual {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 233
    .line 234
    .line 235
    move-result v5

    .line 236
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 237
    .line 238
    .line 239
    move-result-object v5

    .line 240
    invoke-virtual {v0, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    add-int/lit8 v2, v2, 0x1

    .line 244
    .line 245
    goto :goto_0

    .line 246
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->codeToEnum:Ljava/util/Map;

    .line 251
    .line 252
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    const/4 v0, -0x1

    .line 7
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;-><init>(Ljava/lang/String;II)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->code:I

    .line 5
    .line 6
    return-void
.end method

.method public static getMethodByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->codeToEnum:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 12
    .line 13
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;
    .locals 1

    .line 1
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->$VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->code:I

    .line 2
    .line 3
    return p0
.end method
