.class public Lorg/spongycastle/crypto/macs/VMPCMac;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# instance fields
.field private P:[B

.field private T:[B

.field private g:B

.field private n:B

.field private s:B

.field private workingIV:[B

.field private workingKey:[B

.field private x1:B

.field private x2:B

.field private x3:B

.field private x4:B


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-byte v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->n:B

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->P:[B

    .line 9
    .line 10
    iput-byte v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 11
    .line 12
    return-void
.end method

.method private initKey([B[B)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-byte v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 3
    .line 4
    const/16 v1, 0x100

    .line 5
    .line 6
    new-array v2, v1, [B

    .line 7
    .line 8
    iput-object v2, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->P:[B

    .line 9
    .line 10
    move v2, v0

    .line 11
    :goto_0
    if-ge v2, v1, :cond_0

    .line 12
    .line 13
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->P:[B

    .line 14
    .line 15
    int-to-byte v4, v2

    .line 16
    aput-byte v4, v3, v2

    .line 17
    .line 18
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v0

    .line 22
    :goto_1
    const/16 v2, 0x300

    .line 23
    .line 24
    if-ge v1, v2, :cond_1

    .line 25
    .line 26
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->P:[B

    .line 27
    .line 28
    iget-byte v3, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 29
    .line 30
    and-int/lit16 v4, v1, 0xff

    .line 31
    .line 32
    aget-byte v5, v2, v4

    .line 33
    .line 34
    add-int/2addr v3, v5

    .line 35
    array-length v6, p1

    .line 36
    rem-int v6, v1, v6

    .line 37
    .line 38
    aget-byte v6, p1, v6

    .line 39
    .line 40
    add-int/2addr v3, v6

    .line 41
    and-int/lit16 v3, v3, 0xff

    .line 42
    .line 43
    aget-byte v3, v2, v3

    .line 44
    .line 45
    iput-byte v3, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 46
    .line 47
    and-int/lit16 v6, v3, 0xff

    .line 48
    .line 49
    aget-byte v6, v2, v6

    .line 50
    .line 51
    aput-byte v6, v2, v4

    .line 52
    .line 53
    and-int/lit16 v3, v3, 0xff

    .line 54
    .line 55
    aput-byte v5, v2, v3

    .line 56
    .line 57
    add-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    move p1, v0

    .line 61
    :goto_2
    if-ge p1, v2, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->P:[B

    .line 64
    .line 65
    iget-byte v3, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 66
    .line 67
    and-int/lit16 v4, p1, 0xff

    .line 68
    .line 69
    aget-byte v5, v1, v4

    .line 70
    .line 71
    add-int/2addr v3, v5

    .line 72
    array-length v6, p2

    .line 73
    rem-int v6, p1, v6

    .line 74
    .line 75
    aget-byte v6, p2, v6

    .line 76
    .line 77
    add-int/2addr v3, v6

    .line 78
    and-int/lit16 v3, v3, 0xff

    .line 79
    .line 80
    aget-byte v3, v1, v3

    .line 81
    .line 82
    iput-byte v3, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 83
    .line 84
    and-int/lit16 v6, v3, 0xff

    .line 85
    .line 86
    aget-byte v6, v1, v6

    .line 87
    .line 88
    aput-byte v6, v1, v4

    .line 89
    .line 90
    and-int/lit16 v3, v3, 0xff

    .line 91
    .line 92
    aput-byte v5, v1, v3

    .line 93
    .line 94
    add-int/lit8 p1, p1, 0x1

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_2
    iput-byte v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->n:B

    .line 98
    .line 99
    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/16 v2, 0x19

    .line 4
    .line 5
    if-ge v1, v2, :cond_0

    .line 6
    .line 7
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->P:[B

    .line 8
    .line 9
    iget-byte v3, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 10
    .line 11
    iget-byte v4, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->n:B

    .line 12
    .line 13
    and-int/lit16 v5, v4, 0xff

    .line 14
    .line 15
    aget-byte v5, v2, v5

    .line 16
    .line 17
    add-int/2addr v3, v5

    .line 18
    and-int/lit16 v3, v3, 0xff

    .line 19
    .line 20
    aget-byte v3, v2, v3

    .line 21
    .line 22
    iput-byte v3, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 23
    .line 24
    iget-byte v5, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x4:B

    .line 25
    .line 26
    iget-byte v6, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x3:B

    .line 27
    .line 28
    add-int/2addr v5, v6

    .line 29
    add-int/2addr v5, v1

    .line 30
    and-int/lit16 v5, v5, 0xff

    .line 31
    .line 32
    aget-byte v5, v2, v5

    .line 33
    .line 34
    iput-byte v5, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x4:B

    .line 35
    .line 36
    iget-byte v7, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x2:B

    .line 37
    .line 38
    add-int/2addr v6, v7

    .line 39
    add-int/2addr v6, v1

    .line 40
    and-int/lit16 v6, v6, 0xff

    .line 41
    .line 42
    aget-byte v6, v2, v6

    .line 43
    .line 44
    iput-byte v6, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x3:B

    .line 45
    .line 46
    iget-byte v8, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x1:B

    .line 47
    .line 48
    add-int/2addr v7, v8

    .line 49
    add-int/2addr v7, v1

    .line 50
    and-int/lit16 v7, v7, 0xff

    .line 51
    .line 52
    aget-byte v7, v2, v7

    .line 53
    .line 54
    iput-byte v7, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x2:B

    .line 55
    .line 56
    add-int/2addr v8, v3

    .line 57
    add-int/2addr v8, v1

    .line 58
    and-int/lit16 v8, v8, 0xff

    .line 59
    .line 60
    aget-byte v8, v2, v8

    .line 61
    .line 62
    iput-byte v8, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x1:B

    .line 63
    .line 64
    iget-object v9, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->T:[B

    .line 65
    .line 66
    iget-byte v10, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->g:B

    .line 67
    .line 68
    and-int/lit8 v11, v10, 0x1f

    .line 69
    .line 70
    and-int/lit8 v12, v10, 0x1f

    .line 71
    .line 72
    aget-byte v12, v9, v12

    .line 73
    .line 74
    xor-int/2addr v8, v12

    .line 75
    int-to-byte v8, v8

    .line 76
    aput-byte v8, v9, v11

    .line 77
    .line 78
    add-int/lit8 v8, v10, 0x1

    .line 79
    .line 80
    and-int/lit8 v8, v8, 0x1f

    .line 81
    .line 82
    add-int/lit8 v11, v10, 0x1

    .line 83
    .line 84
    and-int/lit8 v11, v11, 0x1f

    .line 85
    .line 86
    aget-byte v11, v9, v11

    .line 87
    .line 88
    xor-int/2addr v7, v11

    .line 89
    int-to-byte v7, v7

    .line 90
    aput-byte v7, v9, v8

    .line 91
    .line 92
    add-int/lit8 v7, v10, 0x2

    .line 93
    .line 94
    and-int/lit8 v7, v7, 0x1f

    .line 95
    .line 96
    add-int/lit8 v8, v10, 0x2

    .line 97
    .line 98
    and-int/lit8 v8, v8, 0x1f

    .line 99
    .line 100
    aget-byte v8, v9, v8

    .line 101
    .line 102
    xor-int/2addr v6, v8

    .line 103
    int-to-byte v6, v6

    .line 104
    aput-byte v6, v9, v7

    .line 105
    .line 106
    add-int/lit8 v6, v10, 0x3

    .line 107
    .line 108
    and-int/lit8 v6, v6, 0x1f

    .line 109
    .line 110
    add-int/lit8 v7, v10, 0x3

    .line 111
    .line 112
    and-int/lit8 v7, v7, 0x1f

    .line 113
    .line 114
    aget-byte v7, v9, v7

    .line 115
    .line 116
    xor-int/2addr v5, v7

    .line 117
    int-to-byte v5, v5

    .line 118
    aput-byte v5, v9, v6

    .line 119
    .line 120
    add-int/lit8 v10, v10, 0x4

    .line 121
    .line 122
    and-int/lit8 v5, v10, 0x1f

    .line 123
    .line 124
    int-to-byte v5, v5

    .line 125
    iput-byte v5, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->g:B

    .line 126
    .line 127
    and-int/lit16 v5, v4, 0xff

    .line 128
    .line 129
    aget-byte v5, v2, v5

    .line 130
    .line 131
    and-int/lit16 v6, v4, 0xff

    .line 132
    .line 133
    and-int/lit16 v7, v3, 0xff

    .line 134
    .line 135
    aget-byte v7, v2, v7

    .line 136
    .line 137
    aput-byte v7, v2, v6

    .line 138
    .line 139
    and-int/lit16 v3, v3, 0xff

    .line 140
    .line 141
    aput-byte v5, v2, v3

    .line 142
    .line 143
    add-int/2addr v4, v0

    .line 144
    and-int/lit16 v2, v4, 0xff

    .line 145
    .line 146
    int-to-byte v2, v2

    .line 147
    iput-byte v2, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->n:B

    .line 148
    .line 149
    add-int/lit8 v1, v1, 0x1

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_0
    const/4 v1, 0x0

    .line 154
    move v2, v1

    .line 155
    :goto_1
    const/16 v3, 0x300

    .line 156
    .line 157
    if-ge v2, v3, :cond_1

    .line 158
    .line 159
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->P:[B

    .line 160
    .line 161
    iget-byte v4, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 162
    .line 163
    and-int/lit16 v5, v2, 0xff

    .line 164
    .line 165
    aget-byte v6, v3, v5

    .line 166
    .line 167
    add-int/2addr v4, v6

    .line 168
    iget-object v7, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->T:[B

    .line 169
    .line 170
    and-int/lit8 v8, v2, 0x1f

    .line 171
    .line 172
    aget-byte v7, v7, v8

    .line 173
    .line 174
    add-int/2addr v4, v7

    .line 175
    and-int/lit16 v4, v4, 0xff

    .line 176
    .line 177
    aget-byte v4, v3, v4

    .line 178
    .line 179
    iput-byte v4, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 180
    .line 181
    and-int/lit16 v7, v4, 0xff

    .line 182
    .line 183
    aget-byte v7, v3, v7

    .line 184
    .line 185
    aput-byte v7, v3, v5

    .line 186
    .line 187
    and-int/lit16 v4, v4, 0xff

    .line 188
    .line 189
    aput-byte v6, v3, v4

    .line 190
    .line 191
    add-int/lit8 v2, v2, 0x1

    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_1
    const/16 v2, 0x14

    .line 195
    .line 196
    new-array v3, v2, [B

    .line 197
    .line 198
    move v4, v1

    .line 199
    :goto_2
    if-ge v4, v2, :cond_2

    .line 200
    .line 201
    iget-object v5, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->P:[B

    .line 202
    .line 203
    iget-byte v6, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 204
    .line 205
    and-int/lit16 v7, v4, 0xff

    .line 206
    .line 207
    aget-byte v8, v5, v7

    .line 208
    .line 209
    add-int/2addr v6, v8

    .line 210
    and-int/lit16 v6, v6, 0xff

    .line 211
    .line 212
    aget-byte v6, v5, v6

    .line 213
    .line 214
    iput-byte v6, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 215
    .line 216
    and-int/lit16 v8, v6, 0xff

    .line 217
    .line 218
    aget-byte v8, v5, v8

    .line 219
    .line 220
    and-int/lit16 v8, v8, 0xff

    .line 221
    .line 222
    aget-byte v8, v5, v8

    .line 223
    .line 224
    add-int/2addr v8, v0

    .line 225
    and-int/lit16 v8, v8, 0xff

    .line 226
    .line 227
    aget-byte v8, v5, v8

    .line 228
    .line 229
    aput-byte v8, v3, v4

    .line 230
    .line 231
    aget-byte v8, v5, v7

    .line 232
    .line 233
    and-int/lit16 v9, v6, 0xff

    .line 234
    .line 235
    aget-byte v9, v5, v9

    .line 236
    .line 237
    aput-byte v9, v5, v7

    .line 238
    .line 239
    and-int/lit16 v6, v6, 0xff

    .line 240
    .line 241
    aput-byte v8, v5, v6

    .line 242
    .line 243
    add-int/lit8 v4, v4, 0x1

    .line 244
    .line 245
    goto :goto_2

    .line 246
    :cond_2
    invoke-static {v3, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/VMPCMac;->reset()V

    .line 250
    .line 251
    .line 252
    return v2
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "VMPC-MAC"

    .line 2
    .line 3
    return-object p0
.end method

.method public getMacSize()I
    .locals 0

    const/16 p0, 0x14

    return p0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 6
    .line 7
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 12
    .line 13
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    instance-of v1, v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->workingIV:[B

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    array-length v1, p1

    .line 30
    const/4 v2, 0x1

    .line 31
    if-lt v1, v2, :cond_0

    .line 32
    .line 33
    array-length p1, p1

    .line 34
    const/16 v1, 0x300

    .line 35
    .line 36
    if-gt p1, v1, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->workingKey:[B

    .line 43
    .line 44
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/VMPCMac;->reset()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    const-string p0, "VMPC-MAC requires 1 to 768 bytes of IV"

    .line 49
    .line 50
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    const-string p0, "VMPC-MAC Init parameters must include a key"

    .line 55
    .line 56
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    const-string p0, "VMPC-MAC Init parameters must include an IV"

    .line 61
    .line 62
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public reset()V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->workingKey:[B

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->workingIV:[B

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/macs/VMPCMac;->initKey([B[B)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-byte v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->n:B

    .line 10
    .line 11
    iput-byte v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x4:B

    .line 12
    .line 13
    iput-byte v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x3:B

    .line 14
    .line 15
    iput-byte v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x2:B

    .line 16
    .line 17
    iput-byte v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x1:B

    .line 18
    .line 19
    iput-byte v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->g:B

    .line 20
    .line 21
    const/16 v1, 0x20

    .line 22
    .line 23
    new-array v2, v1, [B

    .line 24
    .line 25
    iput-object v2, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->T:[B

    .line 26
    .line 27
    move v2, v0

    .line 28
    :goto_0
    if-ge v2, v1, :cond_0

    .line 29
    .line 30
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->T:[B

    .line 31
    .line 32
    aput-byte v0, v3, v2

    .line 33
    .line 34
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method public update(B)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->P:[B

    .line 2
    .line 3
    iget-byte v1, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 4
    .line 5
    iget-byte v2, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->n:B

    .line 6
    .line 7
    and-int/lit16 v3, v2, 0xff

    .line 8
    .line 9
    aget-byte v3, v0, v3

    .line 10
    .line 11
    add-int/2addr v1, v3

    .line 12
    and-int/lit16 v1, v1, 0xff

    .line 13
    .line 14
    aget-byte v1, v0, v1

    .line 15
    .line 16
    iput-byte v1, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->s:B

    .line 17
    .line 18
    and-int/lit16 v3, v1, 0xff

    .line 19
    .line 20
    aget-byte v3, v0, v3

    .line 21
    .line 22
    and-int/lit16 v3, v3, 0xff

    .line 23
    .line 24
    aget-byte v3, v0, v3

    .line 25
    .line 26
    add-int/lit8 v3, v3, 0x1

    .line 27
    .line 28
    and-int/lit16 v3, v3, 0xff

    .line 29
    .line 30
    aget-byte v3, v0, v3

    .line 31
    .line 32
    xor-int/2addr p1, v3

    .line 33
    int-to-byte p1, p1

    .line 34
    iget-byte v3, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x4:B

    .line 35
    .line 36
    iget-byte v4, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x3:B

    .line 37
    .line 38
    add-int/2addr v3, v4

    .line 39
    and-int/lit16 v3, v3, 0xff

    .line 40
    .line 41
    aget-byte v3, v0, v3

    .line 42
    .line 43
    iput-byte v3, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x4:B

    .line 44
    .line 45
    iget-byte v5, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x2:B

    .line 46
    .line 47
    add-int/2addr v4, v5

    .line 48
    and-int/lit16 v4, v4, 0xff

    .line 49
    .line 50
    aget-byte v4, v0, v4

    .line 51
    .line 52
    iput-byte v4, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x3:B

    .line 53
    .line 54
    iget-byte v6, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x1:B

    .line 55
    .line 56
    add-int/2addr v5, v6

    .line 57
    and-int/lit16 v5, v5, 0xff

    .line 58
    .line 59
    aget-byte v5, v0, v5

    .line 60
    .line 61
    iput-byte v5, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x2:B

    .line 62
    .line 63
    add-int/2addr v6, v1

    .line 64
    add-int/2addr v6, p1

    .line 65
    and-int/lit16 p1, v6, 0xff

    .line 66
    .line 67
    aget-byte p1, v0, p1

    .line 68
    .line 69
    iput-byte p1, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->x1:B

    .line 70
    .line 71
    iget-object v6, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->T:[B

    .line 72
    .line 73
    iget-byte v7, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->g:B

    .line 74
    .line 75
    and-int/lit8 v8, v7, 0x1f

    .line 76
    .line 77
    and-int/lit8 v9, v7, 0x1f

    .line 78
    .line 79
    aget-byte v9, v6, v9

    .line 80
    .line 81
    xor-int/2addr p1, v9

    .line 82
    int-to-byte p1, p1

    .line 83
    aput-byte p1, v6, v8

    .line 84
    .line 85
    add-int/lit8 p1, v7, 0x1

    .line 86
    .line 87
    and-int/lit8 p1, p1, 0x1f

    .line 88
    .line 89
    add-int/lit8 v8, v7, 0x1

    .line 90
    .line 91
    and-int/lit8 v8, v8, 0x1f

    .line 92
    .line 93
    aget-byte v8, v6, v8

    .line 94
    .line 95
    xor-int/2addr v5, v8

    .line 96
    int-to-byte v5, v5

    .line 97
    aput-byte v5, v6, p1

    .line 98
    .line 99
    add-int/lit8 p1, v7, 0x2

    .line 100
    .line 101
    and-int/lit8 p1, p1, 0x1f

    .line 102
    .line 103
    add-int/lit8 v5, v7, 0x2

    .line 104
    .line 105
    and-int/lit8 v5, v5, 0x1f

    .line 106
    .line 107
    aget-byte v5, v6, v5

    .line 108
    .line 109
    xor-int/2addr v4, v5

    .line 110
    int-to-byte v4, v4

    .line 111
    aput-byte v4, v6, p1

    .line 112
    .line 113
    add-int/lit8 p1, v7, 0x3

    .line 114
    .line 115
    and-int/lit8 p1, p1, 0x1f

    .line 116
    .line 117
    add-int/lit8 v4, v7, 0x3

    .line 118
    .line 119
    and-int/lit8 v4, v4, 0x1f

    .line 120
    .line 121
    aget-byte v4, v6, v4

    .line 122
    .line 123
    xor-int/2addr v3, v4

    .line 124
    int-to-byte v3, v3

    .line 125
    aput-byte v3, v6, p1

    .line 126
    .line 127
    add-int/lit8 v7, v7, 0x4

    .line 128
    .line 129
    and-int/lit8 p1, v7, 0x1f

    .line 130
    .line 131
    int-to-byte p1, p1

    .line 132
    iput-byte p1, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->g:B

    .line 133
    .line 134
    and-int/lit16 p1, v2, 0xff

    .line 135
    .line 136
    aget-byte p1, v0, p1

    .line 137
    .line 138
    and-int/lit16 v3, v2, 0xff

    .line 139
    .line 140
    and-int/lit16 v4, v1, 0xff

    .line 141
    .line 142
    aget-byte v4, v0, v4

    .line 143
    .line 144
    aput-byte v4, v0, v3

    .line 145
    .line 146
    and-int/lit16 v1, v1, 0xff

    .line 147
    .line 148
    aput-byte p1, v0, v1

    .line 149
    .line 150
    add-int/lit8 v2, v2, 0x1

    .line 151
    .line 152
    and-int/lit16 p1, v2, 0xff

    .line 153
    .line 154
    int-to-byte p1, p1

    .line 155
    iput-byte p1, p0, Lorg/spongycastle/crypto/macs/VMPCMac;->n:B

    .line 156
    .line 157
    return-void
.end method

.method public update([BII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    add-int v0, p2, p3

    .line 158
    array-length v1, p1

    if-gt v0, v1, :cond_1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_0

    add-int v1, p2, v0

    .line 159
    aget-byte v1, p1, v1

    invoke-virtual {p0, v1}, Lorg/spongycastle/crypto/macs/VMPCMac;->update(B)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    .line 160
    :cond_1
    const-string p0, "input buffer too short"

    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    return-void
.end method
