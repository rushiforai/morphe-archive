.class public Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/pqc/crypto/MessageSigner;


# instance fields
.field private currentAuthPaths:[[[B

.field private digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

.field private gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

.field private gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

.field private gmssUtil:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;

.field private index:[I

.field key:Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyParameters;

.field private mdLength:I

.field private messDigestOTS:Lorg/spongycastle/crypto/Digest;

.field private messDigestTrees:Lorg/spongycastle/crypto/Digest;

.field private numLayer:I

.field private ots:Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;

.field private pubKeyBytes:[B

.field private random:Ljava/security/SecureRandom;

.field private subtreeRootSig:[[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssUtil:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;

    .line 10
    .line 11
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 12
    .line 13
    invoke-interface {p1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->messDigestTrees:Lorg/spongycastle/crypto/Digest;

    .line 18
    .line 19
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 20
    .line 21
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 26
    .line 27
    new-instance p1, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 28
    .line 29
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->messDigestTrees:Lorg/spongycastle/crypto/Digest;

    .line 30
    .line 31
    invoke-direct {p1, v0}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 35
    .line 36
    return-void
.end method

.method private initSign()V
    .locals 9

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->messDigestTrees:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->key:Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyParameters;

    .line 7
    .line 8
    check-cast v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;

    .line 9
    .line 10
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;->isUsed()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_4

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;->getIndex(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;->getNumLeafs(I)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-ge v2, v3, :cond_3

    .line 26
    .line 27
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyParameters;->getParameters()Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iput-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 32
    .line 33
    invoke-virtual {v2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getNumOfLayers()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iput v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 38
    .line 39
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;->getCurrentSeeds()[[B

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 44
    .line 45
    const/4 v4, 0x1

    .line 46
    sub-int/2addr v3, v4

    .line 47
    aget-object v2, v2, v3

    .line 48
    .line 49
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 50
    .line 51
    new-array v5, v3, [B

    .line 52
    .line 53
    new-array v5, v3, [B

    .line 54
    .line 55
    invoke-static {v2, v1, v5, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 59
    .line 60
    invoke-virtual {v2, v5}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;->nextSeed([B)[B

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    new-instance v3, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;

    .line 65
    .line 66
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 67
    .line 68
    invoke-interface {v5}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 73
    .line 74
    invoke-virtual {v6}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getWinternitzParameter()[I

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    iget v7, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 79
    .line 80
    sub-int/2addr v7, v4

    .line 81
    aget v6, v6, v7

    .line 82
    .line 83
    invoke-direct {v3, v2, v5, v6}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;-><init>([BLorg/spongycastle/crypto/Digest;I)V

    .line 84
    .line 85
    .line 86
    iput-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->ots:Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;

    .line 87
    .line 88
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;->getCurrentAuthPaths()[[[B

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 93
    .line 94
    new-array v3, v3, [[[B

    .line 95
    .line 96
    iput-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->currentAuthPaths:[[[B

    .line 97
    .line 98
    move v3, v1

    .line 99
    :goto_0
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 100
    .line 101
    if-ge v3, v5, :cond_1

    .line 102
    .line 103
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->currentAuthPaths:[[[B

    .line 104
    .line 105
    aget-object v6, v2, v3

    .line 106
    .line 107
    array-length v6, v6

    .line 108
    iget v7, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 109
    .line 110
    const/4 v8, 0x2

    .line 111
    new-array v8, v8, [I

    .line 112
    .line 113
    aput v7, v8, v4

    .line 114
    .line 115
    aput v6, v8, v1

    .line 116
    .line 117
    sget-object v6, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 118
    .line 119
    invoke-static {v6, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    check-cast v6, [[B

    .line 124
    .line 125
    aput-object v6, v5, v3

    .line 126
    .line 127
    move v5, v1

    .line 128
    :goto_1
    aget-object v6, v2, v3

    .line 129
    .line 130
    array-length v7, v6

    .line 131
    if-ge v5, v7, :cond_0

    .line 132
    .line 133
    aget-object v6, v6, v5

    .line 134
    .line 135
    iget-object v7, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->currentAuthPaths:[[[B

    .line 136
    .line 137
    aget-object v7, v7, v3

    .line 138
    .line 139
    aget-object v7, v7, v5

    .line 140
    .line 141
    iget v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 142
    .line 143
    invoke-static {v6, v1, v7, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 144
    .line 145
    .line 146
    add-int/lit8 v5, v5, 0x1

    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_1
    new-array v2, v5, [I

    .line 153
    .line 154
    iput-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->index:[I

    .line 155
    .line 156
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;->getIndex()[I

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->index:[I

    .line 161
    .line 162
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 163
    .line 164
    invoke-static {v2, v1, v3, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 165
    .line 166
    .line 167
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 168
    .line 169
    sub-int/2addr v2, v4

    .line 170
    new-array v2, v2, [[B

    .line 171
    .line 172
    iput-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->subtreeRootSig:[[B

    .line 173
    .line 174
    move v2, v1

    .line 175
    :goto_2
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 176
    .line 177
    sub-int/2addr v3, v4

    .line 178
    if-ge v2, v3, :cond_2

    .line 179
    .line 180
    invoke-virtual {v0, v2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;->getSubtreeRootSig(I)[B

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->subtreeRootSig:[[B

    .line 185
    .line 186
    array-length v6, v3

    .line 187
    new-array v6, v6, [B

    .line 188
    .line 189
    aput-object v6, v5, v2

    .line 190
    .line 191
    array-length v5, v3

    .line 192
    invoke-static {v3, v1, v6, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 193
    .line 194
    .line 195
    add-int/lit8 v2, v2, 0x1

    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_2
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;->markUsed()V

    .line 199
    .line 200
    .line 201
    return-void

    .line 202
    :cond_3
    const-string p0, "No more signatures can be generated"

    .line 203
    .line 204
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    :cond_4
    const-string p0, "Private key already used"

    .line 209
    .line 210
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    return-void
.end method

.method private initVerify()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->messDigestTrees:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->key:Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyParameters;

    .line 7
    .line 8
    check-cast v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSPublicKeyParameters;

    .line 9
    .line 10
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSPublicKeyParameters;->getPublicKey()[B

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->pubKeyBytes:[B

    .line 15
    .line 16
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyParameters;->getParameters()Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 21
    .line 22
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getNumOfLayers()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public generateSignature([B)[B
    .locals 10

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->ots:Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->getSignature([B)[B

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssUtil:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;

    .line 12
    .line 13
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->currentAuthPaths:[[[B

    .line 14
    .line 15
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 16
    .line 17
    add-int/lit8 v2, v2, -0x1

    .line 18
    .line 19
    aget-object v1, v1, v2

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;->concatenateArray([[B)[B

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssUtil:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;

    .line 26
    .line 27
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->index:[I

    .line 28
    .line 29
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 30
    .line 31
    add-int/lit8 v3, v3, -0x1

    .line 32
    .line 33
    aget v2, v2, v3

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;->intToBytesLittleEndian(I)[B

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    array-length v2, v1

    .line 40
    array-length v3, p1

    .line 41
    add-int/2addr v2, v3

    .line 42
    array-length v3, v0

    .line 43
    add-int/2addr v2, v3

    .line 44
    new-array v3, v2, [B

    .line 45
    .line 46
    array-length v4, v1

    .line 47
    const/4 v5, 0x0

    .line 48
    invoke-static {v1, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 49
    .line 50
    .line 51
    array-length v4, v1

    .line 52
    array-length v6, p1

    .line 53
    invoke-static {p1, v5, v3, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    .line 55
    .line 56
    array-length v1, v1

    .line 57
    array-length p1, p1

    .line 58
    add-int/2addr v1, p1

    .line 59
    array-length p1, v0

    .line 60
    invoke-static {v0, v5, v3, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 61
    .line 62
    .line 63
    new-array p1, v5, [B

    .line 64
    .line 65
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 66
    .line 67
    add-int/lit8 v0, v0, -0x2

    .line 68
    .line 69
    :goto_0
    if-ltz v0, :cond_0

    .line 70
    .line 71
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssUtil:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;

    .line 72
    .line 73
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->currentAuthPaths:[[[B

    .line 74
    .line 75
    aget-object v4, v4, v0

    .line 76
    .line 77
    invoke-virtual {v1, v4}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;->concatenateArray([[B)[B

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssUtil:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;

    .line 82
    .line 83
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->index:[I

    .line 84
    .line 85
    aget v6, v6, v0

    .line 86
    .line 87
    invoke-virtual {v4, v6}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;->intToBytesLittleEndian(I)[B

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    array-length v6, p1

    .line 92
    new-array v7, v6, [B

    .line 93
    .line 94
    array-length v8, p1

    .line 95
    invoke-static {p1, v5, v7, v5, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 96
    .line 97
    .line 98
    array-length p1, v4

    .line 99
    add-int/2addr p1, v6

    .line 100
    iget-object v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->subtreeRootSig:[[B

    .line 101
    .line 102
    aget-object v8, v8, v0

    .line 103
    .line 104
    array-length v8, v8

    .line 105
    add-int/2addr p1, v8

    .line 106
    array-length v8, v1

    .line 107
    add-int/2addr p1, v8

    .line 108
    new-array p1, p1, [B

    .line 109
    .line 110
    invoke-static {v7, v5, p1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 111
    .line 112
    .line 113
    array-length v7, v4

    .line 114
    invoke-static {v4, v5, p1, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 115
    .line 116
    .line 117
    iget-object v7, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->subtreeRootSig:[[B

    .line 118
    .line 119
    aget-object v7, v7, v0

    .line 120
    .line 121
    array-length v8, v4

    .line 122
    add-int/2addr v8, v6

    .line 123
    array-length v9, v7

    .line 124
    invoke-static {v7, v5, p1, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 125
    .line 126
    .line 127
    array-length v4, v4

    .line 128
    add-int/2addr v6, v4

    .line 129
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->subtreeRootSig:[[B

    .line 130
    .line 131
    aget-object v4, v4, v0

    .line 132
    .line 133
    array-length v4, v4

    .line 134
    add-int/2addr v6, v4

    .line 135
    array-length v4, v1

    .line 136
    invoke-static {v1, v5, p1, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 137
    .line 138
    .line 139
    add-int/lit8 v0, v0, -0x1

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_0
    array-length p0, p1

    .line 143
    add-int/2addr p0, v2

    .line 144
    new-array p0, p0, [B

    .line 145
    .line 146
    invoke-static {v3, v5, p0, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 147
    .line 148
    .line 149
    array-length v0, p1

    .line 150
    invoke-static {p1, v5, p0, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 151
    .line 152
    .line 153
    return-object p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    instance-of p1, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 8
    .line 9
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getRandom()Ljava/security/SecureRandom;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->random:Ljava/security/SecureRandom;

    .line 14
    .line 15
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;

    .line 20
    .line 21
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->key:Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyParameters;

    .line 22
    .line 23
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->initSign()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance p1, Ljava/security/SecureRandom;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/security/SecureRandom;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->random:Ljava/security/SecureRandom;

    .line 33
    .line 34
    check-cast p2, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;

    .line 35
    .line 36
    iput-object p2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->key:Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyParameters;

    .line 37
    .line 38
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->initSign()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    check-cast p2, Lorg/spongycastle/pqc/crypto/gmss/GMSSPublicKeyParameters;

    .line 43
    .line 44
    iput-object p2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->key:Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyParameters;

    .line 45
    .line 46
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->initVerify()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public verifySignature([B[B)Z
    .locals 12

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->numLayer:I

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    const/4 v2, 0x0

    .line 11
    move v3, v2

    .line 12
    :goto_0
    if-ltz v0, :cond_4

    .line 13
    .line 14
    new-instance v4, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;

    .line 15
    .line 16
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 17
    .line 18
    invoke-interface {v5}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 23
    .line 24
    invoke-virtual {v6}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getWinternitzParameter()[I

    .line 25
    .line 26
    .line 27
    move-result-object v6

    .line 28
    aget v6, v6, v0

    .line 29
    .line 30
    invoke-direct {v4, v5, v6}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;-><init>(Lorg/spongycastle/crypto/Digest;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v4}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->getSignatureLength()I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssUtil:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;

    .line 38
    .line 39
    invoke-virtual {v6, p2, v3}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSUtil;->bytesToIntLittleEndian([BI)I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    add-int/lit8 v3, v3, 0x4

    .line 44
    .line 45
    new-array v7, v5, [B

    .line 46
    .line 47
    invoke-static {p2, v3, v7, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    .line 49
    .line 50
    add-int/2addr v3, v5

    .line 51
    invoke-virtual {v4, p1, v7}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->Verify([B[B)[B

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    if-nez p1, :cond_0

    .line 56
    .line 57
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 58
    .line 59
    const-string p1, "OTS Public Key is null in GMSSSignature.verify"

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return v2

    .line 65
    :cond_0
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 66
    .line 67
    invoke-virtual {v4}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getHeightOfTrees()[I

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    aget v4, v4, v0

    .line 72
    .line 73
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 74
    .line 75
    const/4 v7, 0x2

    .line 76
    new-array v8, v7, [I

    .line 77
    .line 78
    aput v5, v8, v1

    .line 79
    .line 80
    aput v4, v8, v2

    .line 81
    .line 82
    sget-object v4, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 83
    .line 84
    invoke-static {v4, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, [[B

    .line 89
    .line 90
    move v5, v2

    .line 91
    :goto_1
    array-length v8, v4

    .line 92
    if-ge v5, v8, :cond_1

    .line 93
    .line 94
    aget-object v8, v4, v5

    .line 95
    .line 96
    iget v9, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 97
    .line 98
    invoke-static {p2, v3, v8, v2, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 99
    .line 100
    .line 101
    iget v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 102
    .line 103
    add-int/2addr v3, v8

    .line 104
    add-int/lit8 v5, v5, 0x1

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_1
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 108
    .line 109
    new-array v5, v5, [B

    .line 110
    .line 111
    array-length v5, v4

    .line 112
    shl-int v5, v1, v5

    .line 113
    .line 114
    add-int/2addr v5, v6

    .line 115
    move v6, v2

    .line 116
    :goto_2
    array-length v8, v4

    .line 117
    if-ge v6, v8, :cond_3

    .line 118
    .line 119
    iget v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 120
    .line 121
    shl-int/lit8 v9, v8, 0x1

    .line 122
    .line 123
    new-array v10, v9, [B

    .line 124
    .line 125
    rem-int/lit8 v11, v5, 0x2

    .line 126
    .line 127
    if-nez v11, :cond_2

    .line 128
    .line 129
    invoke-static {p1, v2, v10, v2, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    .line 131
    .line 132
    aget-object p1, v4, v6

    .line 133
    .line 134
    iget v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 135
    .line 136
    invoke-static {p1, v2, v10, v8, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 137
    .line 138
    .line 139
    div-int/lit8 v5, v5, 0x2

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_2
    aget-object v11, v4, v6

    .line 143
    .line 144
    invoke-static {v11, v2, v10, v2, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 145
    .line 146
    .line 147
    iget v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->mdLength:I

    .line 148
    .line 149
    array-length v11, p1

    .line 150
    invoke-static {p1, v2, v10, v8, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 151
    .line 152
    .line 153
    add-int/lit8 v5, v5, -0x1

    .line 154
    .line 155
    div-int/2addr v5, v7

    .line 156
    :goto_3
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->messDigestTrees:Lorg/spongycastle/crypto/Digest;

    .line 157
    .line 158
    invoke-interface {p1, v10, v2, v9}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->messDigestTrees:Lorg/spongycastle/crypto/Digest;

    .line 162
    .line 163
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    new-array p1, p1, [B

    .line 168
    .line 169
    iget-object v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->messDigestTrees:Lorg/spongycastle/crypto/Digest;

    .line 170
    .line 171
    invoke-interface {v8, p1, v2}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 172
    .line 173
    .line 174
    add-int/lit8 v6, v6, 0x1

    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_3
    add-int/lit8 v0, v0, -0x1

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :cond_4
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSSigner;->pubKeyBytes:[B

    .line 182
    .line 183
    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    return p0
.end method
