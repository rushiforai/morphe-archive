.class final Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final ˊ:[B = null

.field private static ˋ:I = 0x0

.field private static ˎ:Ljava/lang/String; = null

.field private static final ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;

.field private static ॱ:I = 0x0

.field private static ॱॱ:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    invoke-static {}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˎ()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/math/BigInteger;

    .line 5
    .line 6
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱ:I

    .line 7
    .line 8
    and-int/lit8 v2, v1, -0x4

    .line 9
    .line 10
    or-int/lit8 v1, v1, -0x4

    .line 11
    .line 12
    add-int/2addr v2, v1

    .line 13
    int-to-byte v1, v2

    .line 14
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˊ:[B

    .line 15
    .line 16
    const/16 v3, 0x56

    .line 17
    .line 18
    aget-byte v3, v2, v3

    .line 19
    .line 20
    neg-int v3, v3

    .line 21
    int-to-byte v3, v3

    .line 22
    const/16 v4, 0x4d

    .line 23
    .line 24
    invoke-static {v4, v1, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ(IBI)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/16 v3, 0x10

    .line 29
    .line 30
    invoke-direct {v0, v1, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ljava/math/BigInteger;

    .line 34
    .line 35
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱ:I

    .line 36
    .line 37
    xor-int/lit8 v4, v1, -0x4

    .line 38
    .line 39
    and-int/lit8 v1, v1, -0x4

    .line 40
    .line 41
    shl-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    add-int/2addr v4, v1

    .line 44
    int-to-byte v1, v4

    .line 45
    const/16 v4, 0xe

    .line 46
    .line 47
    aget-byte v5, v2, v4

    .line 48
    .line 49
    int-to-byte v5, v5

    .line 50
    const/16 v6, 0x8b

    .line 51
    .line 52
    invoke-static {v6, v1, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ(IBI)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-direct {v0, v1, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    new-instance v0, Ljava/math/BigInteger;

    .line 60
    .line 61
    const/16 v1, 0x16

    .line 62
    .line 63
    aget-byte v1, v2, v1

    .line 64
    .line 65
    neg-int v1, v1

    .line 66
    int-to-short v1, v1

    .line 67
    sget v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱ:I

    .line 68
    .line 69
    const/4 v7, 0x4

    .line 70
    sub-int/2addr v5, v7

    .line 71
    int-to-byte v5, v5

    .line 72
    aget-byte v8, v2, v4

    .line 73
    .line 74
    xor-int/lit8 v8, v8, -0x1

    .line 75
    .line 76
    rsub-int/lit8 v8, v8, -0x2

    .line 77
    .line 78
    int-to-byte v8, v8

    .line 79
    invoke-static {v1, v5, v8}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ(IBI)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-direct {v0, v1, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 84
    .line 85
    .line 86
    new-instance v0, Ljava/math/BigInteger;

    .line 87
    .line 88
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱ:I

    .line 89
    .line 90
    or-int/lit8 v5, v1, -0x4

    .line 91
    .line 92
    shl-int/lit8 v5, v5, 0x1

    .line 93
    .line 94
    xor-int/lit8 v1, v1, -0x4

    .line 95
    .line 96
    sub-int/2addr v5, v1

    .line 97
    int-to-byte v1, v5

    .line 98
    aget-byte v5, v2, v7

    .line 99
    .line 100
    int-to-byte v5, v5

    .line 101
    const/16 v8, 0xaa

    .line 102
    .line 103
    invoke-static {v8, v1, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ(IBI)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-direct {v0, v1, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 108
    .line 109
    .line 110
    new-instance v0, Ljava/math/BigInteger;

    .line 111
    .line 112
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱ:I

    .line 113
    .line 114
    sub-int/2addr v1, v7

    .line 115
    int-to-byte v1, v1

    .line 116
    const/16 v5, 0x46

    .line 117
    .line 118
    aget-byte v5, v2, v5

    .line 119
    .line 120
    int-to-byte v5, v5

    .line 121
    const/16 v7, 0x6c

    .line 122
    .line 123
    invoke-static {v7, v1, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ(IBI)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-direct {v0, v1, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 128
    .line 129
    .line 130
    new-instance v0, Ljava/math/BigInteger;

    .line 131
    .line 132
    aget-byte v1, v2, v6

    .line 133
    .line 134
    int-to-short v1, v1

    .line 135
    and-int/lit8 v5, v1, 0x1f

    .line 136
    .line 137
    int-to-byte v5, v5

    .line 138
    aget-byte v2, v2, v4

    .line 139
    .line 140
    int-to-byte v2, v2

    .line 141
    invoke-static {v1, v5, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ(IBI)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-direct {v0, v1, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 146
    .line 147
    .line 148
    new-instance v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;

    .line 149
    .line 150
    invoke-direct {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;-><init>()V

    .line 151
    .line 152
    .line 153
    const/4 v0, 0x0

    .line 154
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˎ:Ljava/lang/String;

    .line 155
    .line 156
    new-instance v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;

    .line 157
    .line 158
    invoke-direct {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;-><init>()V

    .line 159
    .line 160
    .line 161
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;

    .line 162
    .line 163
    new-instance v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;

    .line 164
    .line 165
    invoke-direct {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;-><init>()V

    .line 166
    .line 167
    .line 168
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱॱ:I

    .line 169
    .line 170
    and-int/lit8 v1, v0, 0x2f

    .line 171
    .line 172
    or-int/lit8 v0, v0, 0x2f

    .line 173
    .line 174
    add-int/2addr v1, v0

    .line 175
    rem-int/lit16 v1, v1, 0x80

    .line 176
    .line 177
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˋ:I

    .line 178
    .line 179
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

.method public static ˊ()Ljava/lang/String;
    .locals 11

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˋ:I

    .line 2
    .line 3
    xor-int/lit8 v1, v0, 0x5d

    .line 4
    .line 5
    and-int/lit8 v0, v0, 0x5d

    .line 6
    .line 7
    shl-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    add-int/2addr v1, v0

    .line 10
    rem-int/lit16 v1, v1, 0x80

    .line 11
    .line 12
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱॱ:I

    .line 13
    .line 14
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˎ:Ljava/lang/String;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    new-instance v0, Ljava/io/File;

    .line 19
    .line 20
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˊ:[B

    .line 21
    .line 22
    const/16 v2, 0x2a

    .line 23
    .line 24
    aget-byte v2, v1, v2

    .line 25
    .line 26
    int-to-byte v2, v2

    .line 27
    const/16 v3, 0xb

    .line 28
    .line 29
    aget-byte v1, v1, v3

    .line 30
    .line 31
    int-to-byte v1, v1

    .line 32
    const/16 v4, 0x44

    .line 33
    .line 34
    invoke-static {v4, v2, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ(IBI)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    array-length v1, v0

    .line 46
    const/4 v2, 0x0

    .line 47
    :goto_0
    if-ge v2, v1, :cond_1

    .line 48
    .line 49
    aget-object v4, v0, v2

    .line 50
    .line 51
    new-instance v5, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    sget-object v6, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˊ:[B

    .line 57
    .line 58
    const/16 v7, 0x9

    .line 59
    .line 60
    aget-byte v7, v6, v7

    .line 61
    .line 62
    int-to-byte v7, v7

    .line 63
    aget-byte v8, v6, v3

    .line 64
    .line 65
    int-to-byte v8, v8

    .line 66
    const/16 v9, 0x48

    .line 67
    .line 68
    invoke-static {v9, v7, v8}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ(IBI)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    sget v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱ:I

    .line 79
    .line 80
    add-int/lit8 v4, v4, -0x5

    .line 81
    .line 82
    int-to-short v4, v4

    .line 83
    const/4 v7, 0x6

    .line 84
    aget-byte v7, v6, v7

    .line 85
    .line 86
    int-to-byte v7, v7

    .line 87
    aget-byte v8, v6, v3

    .line 88
    .line 89
    int-to-byte v8, v8

    .line 90
    invoke-static {v4, v7, v8}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ(IBI)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    const/16 v5, 0x8b

    .line 102
    .line 103
    aget-byte v5, v6, v5

    .line 104
    .line 105
    int-to-short v5, v5

    .line 106
    const/16 v7, 0x46

    .line 107
    .line 108
    aget-byte v8, v6, v7

    .line 109
    .line 110
    int-to-byte v8, v8

    .line 111
    xor-int/lit8 v9, v8, 0x64

    .line 112
    .line 113
    and-int/lit8 v10, v8, 0x64

    .line 114
    .line 115
    or-int/2addr v9, v10

    .line 116
    int-to-byte v9, v9

    .line 117
    invoke-static {v5, v8, v9}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ(IBI)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    sget-object v8, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;

    .line 122
    .line 123
    invoke-static {v4, v5, v8}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(Ljava/lang/String;Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    new-instance v5, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .line 131
    .line 132
    sget-object v8, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˎ:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result v8

    .line 141
    if-eqz v8, :cond_0

    .line 142
    .line 143
    sget v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱॱ:I

    .line 144
    .line 145
    add-int/lit8 v4, v4, 0x31

    .line 146
    .line 147
    rem-int/lit16 v4, v4, 0x80

    .line 148
    .line 149
    sput v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˋ:I

    .line 150
    .line 151
    or-int/lit8 v6, v4, 0x21

    .line 152
    .line 153
    shl-int/lit8 v6, v6, 0x1

    .line 154
    .line 155
    xor-int/lit8 v4, v4, 0x21

    .line 156
    .line 157
    sub-int/2addr v6, v4

    .line 158
    rem-int/lit16 v6, v6, 0x80

    .line 159
    .line 160
    sput v6, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱॱ:I

    .line 161
    .line 162
    const-string v4, ""

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    sget v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱ:I

    .line 174
    .line 175
    add-int/lit8 v4, v4, -0x5

    .line 176
    .line 177
    int-to-short v4, v4

    .line 178
    aget-byte v6, v6, v7

    .line 179
    .line 180
    int-to-byte v6, v6

    .line 181
    xor-int/lit8 v7, v6, 0x5a

    .line 182
    .line 183
    and-int/lit8 v9, v6, 0x5a

    .line 184
    .line 185
    or-int/2addr v7, v9

    .line 186
    int-to-byte v7, v7

    .line 187
    invoke-static {v4, v6, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˏ(IBI)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    sget v6, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˋ:I

    .line 199
    .line 200
    or-int/lit8 v7, v6, 0x23

    .line 201
    .line 202
    shl-int/lit8 v7, v7, 0x1

    .line 203
    .line 204
    xor-int/lit8 v6, v6, 0x23

    .line 205
    .line 206
    sub-int/2addr v7, v6

    .line 207
    rem-int/lit16 v7, v7, 0x80

    .line 208
    .line 209
    sput v7, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱॱ:I

    .line 210
    .line 211
    :goto_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v4

    .line 218
    sput-object v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˎ:Ljava/lang/String;

    .line 219
    .line 220
    xor-int/lit8 v4, v2, 0x1

    .line 221
    .line 222
    and-int/lit8 v2, v2, 0x1

    .line 223
    .line 224
    shl-int/lit8 v2, v2, 0x1

    .line 225
    .line 226
    add-int/2addr v2, v4

    .line 227
    sget v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˋ:I

    .line 228
    .line 229
    or-int/lit8 v5, v4, 0x47

    .line 230
    .line 231
    shl-int/lit8 v5, v5, 0x1

    .line 232
    .line 233
    xor-int/lit8 v4, v4, 0x47

    .line 234
    .line 235
    sub-int/2addr v5, v4

    .line 236
    rem-int/lit16 v5, v5, 0x80

    .line 237
    .line 238
    sput v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱॱ:I

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :cond_1
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˎ:Ljava/lang/String;

    .line 243
    .line 244
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˋ:I

    .line 245
    .line 246
    add-int/lit8 v1, v1, 0x3f

    .line 247
    .line 248
    rem-int/lit16 v1, v1, 0x80

    .line 249
    .line 250
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱॱ:I

    .line 251
    .line 252
    return-object v0
.end method

.method private static ˎ()V
    .locals 1

    const/16 v0, 0xce

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˊ:[B

    const/16 v0, 0x23

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱ:I

    return-void

    :array_0
    .array-data 1
        0x3dt
        -0x8t
        -0x15t
        0xat
        0x2t
        -0x2bt
        0x7t
        0x7t
        0x36t
        0x5t
        -0x29t
        0x35t
        -0x28t
        0x8t
        0x33t
        0xat
        0x1t
        -0x29t
        0x9t
        0x33t
        -0x2bt
        0x35t
        -0x25t
        0x6t
        0x2et
        0x7t
        0xet
        0x1t
        -0x29t
        0x9t
        0x1t
        0x3at
        -0x2et
        0xat
        0x2t
        -0x2et
        -0x4t
        0xft
        -0x2t
        0x9t
        0x1t
        0xft
        0x4t
        -0x27t
        0x3t
        0x34t
        0x4t
        0x8t
        -0x29t
        0x8t
        0x31t
        0xbt
        -0x2bt
        0x31t
        0xft
        0x2t
        0x7t
        0x5t
        0x3t
        -0x26t
        0x34t
        -0x26t
        0x2et
        0xet
        0x1t
        -0x25t
        0x4t
        0x7t
        0x3t
        0x3at
        0x0t
        0x6t
        0x4t
        -0x3bt
        0x4t
        0x9t
        0x12t
        -0x3bt
        0x4t
        0x9t
        0x12t
        0x3at
        0x8t
        0x5t
        0xdt
        0x5t
        -0x2ct
        0x7t
        0x2ft
        0xat
        0x3t
        -0x25t
        0x33t
        0x3t
        -0x25t
        0x34t
        0x8t
        -0x29t
        0x5t
        0x35t
        0x2t
        0xct
        0x7t
        0x6t
        -0x2ct
        0x4t
        0x7t
        0x9t
        0x7t
        0x4t
        0x4t
        0x7t
        0x5t
        0x33t
        0x7t
        0x9t
        0x1t
        0x8t
        -0x28t
        0x6t
        0x4t
        0x3at
        -0x2bt
        0x30t
        0x9t
        -0x25t
        0x2et
        -0x22t
        0x2et
        0xdt
        -0x2et
        0x9t
        0x35t
        -0x28t
        0x5t
        0x31t
        -0x28t
        0x34t
        0xct
        -0x1t
        0xet
        0x0t
        0xat
        -0x2at
        -0x2t
        0xct
        0x1t
        0x9t
        -0x26t
        0x6t
        0x1t
        0xat
        0x6t
        0x34t
        0x5t
        0x9t
        -0x2et
        0x39t
        0x0t
        -0x23t
        0x33t
        0xbt
        -0x1t
        0x4t
        0xat
        0xat
        0x4t
        -0x2dt
        0x36t
        0x6t
        0x4t
        -0x24t
        0x6t
        0x3t
        0x9t
        0x30t
        -0x25t
        0x31t
        0xct
        0x3t
        0x6t
        -0x2bt
        0x7t
        0x9t
        0x5t
        0x33t
        -0x27t
        0x35t
        0x4t
        -0x25t
        0x34t
        -0x2ct
        0x37t
        0x7t
        -0x29t
        0x35t
        0x3t
        0x3t
        0xdt
        0x6t
        0x3t
        -0x29t
        0x5t
        0x7t
        0x37t
        -0x2ct
    .end array-data
.end method

.method private static ˏ(IBI)Ljava/lang/String;
    .locals 6

    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱॱ:I

    add-int/lit8 v0, v0, 0x79

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˋ:I

    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˊ:[B

    rsub-int/lit8 p2, p2, 0x64

    add-int/lit8 p0, p0, 0x4

    add-int/lit8 v1, p1, 0x1

    new-array v1, v1, [B

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v4, p2

    move v3, v2

    move p2, p0

    goto :goto_1

    :cond_0
    move v3, v2

    :goto_0
    add-int/lit8 p0, p0, 0x1

    int-to-byte v4, p2

    aput-byte v4, v1, v3

    if-ne v3, p1, :cond_1

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p0

    sget p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ॱॱ:I

    add-int/lit8 p1, p1, 0x17

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˋ:I

    return-object p0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    aget-byte v4, v0, p0

    move v5, p2

    move p2, p0

    move p0, v5

    :goto_1
    sub-int/2addr p0, v4

    add-int/lit8 p0, p0, 0x6

    move v5, p2

    move p2, p0

    move p0, v5

    goto :goto_0
.end method
