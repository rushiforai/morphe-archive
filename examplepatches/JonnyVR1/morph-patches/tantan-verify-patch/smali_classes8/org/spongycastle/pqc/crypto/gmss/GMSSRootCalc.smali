.class public Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private AuthPath:[[B

.field private K:I

.field private digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

.field private heightOfNextSeed:I

.field private heightOfNodes:Ljava/util/Vector;

.field private heightOfTree:I

.field private index:[I

.field private indexForNextSeed:I

.field private isFinished:Z

.field private isInitialized:Z

.field private mdLength:I

.field private messDigestTree:Lorg/spongycastle/crypto/Digest;

.field private retain:[Ljava/util/Vector;

.field private root:[B

.field private tailStack:Ljava/util/Vector;

.field private treehash:[Lorg/spongycastle/pqc/crypto/gmss/Treehash;


# direct methods
.method public constructor <init>(IILorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;)V
    .locals 2

    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 190
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 191
    invoke-interface {p3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    move-result-object p3

    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 192
    invoke-interface {p3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result p3

    iput p3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    .line 193
    iput p2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    .line 194
    new-array v0, p1, [I

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    const/4 v0, 0x2

    .line 195
    new-array v0, v0, [I

    const/4 v1, 0x1

    aput p3, v0, v1

    const/4 p3, 0x0

    aput p1, v0, p3

    sget-object p1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [[B

    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->AuthPath:[[B

    .line 196
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    new-array p1, p1, [B

    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->root:[B

    .line 197
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    sub-int/2addr p1, v1

    new-array p1, p1, [Ljava/util/Vector;

    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->retain:[Ljava/util/Vector;

    :goto_0
    add-int/lit8 p1, p2, -0x1

    if-ge p3, p1, :cond_0

    .line 198
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->retain:[Ljava/util/Vector;

    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    aput-object v0, p1, p3

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/Digest;[[B[I[Lorg/spongycastle/pqc/crypto/gmss/Treehash;[Ljava/util/Vector;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 5
    .line 6
    invoke-interface {p1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 11
    .line 12
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 13
    .line 14
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    aget v0, p3, p1

    .line 18
    .line 19
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    aget v2, p3, v1

    .line 23
    .line 24
    iput v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    aget v3, p3, v2

    .line 28
    .line 29
    iput v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    .line 30
    .line 31
    const/4 v3, 0x3

    .line 32
    aget v3, p3, v3

    .line 33
    .line 34
    iput v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->indexForNextSeed:I

    .line 35
    .line 36
    const/4 v3, 0x4

    .line 37
    aget v3, p3, v3

    .line 38
    .line 39
    iput v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNextSeed:I

    .line 40
    .line 41
    const/4 v3, 0x5

    .line 42
    aget v3, p3, v3

    .line 43
    .line 44
    if-ne v3, v1, :cond_0

    .line 45
    .line 46
    iput-boolean v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isFinished:Z

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isFinished:Z

    .line 50
    .line 51
    :goto_0
    const/4 v3, 0x6

    .line 52
    aget v3, p3, v3

    .line 53
    .line 54
    if-ne v3, v1, :cond_1

    .line 55
    .line 56
    iput-boolean v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isInitialized:Z

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isInitialized:Z

    .line 60
    .line 61
    :goto_1
    const/4 v3, 0x7

    .line 62
    aget v3, p3, v3

    .line 63
    .line 64
    new-array v0, v0, [I

    .line 65
    .line 66
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    .line 67
    .line 68
    move v0, p1

    .line 69
    :goto_2
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 70
    .line 71
    if-ge v0, v4, :cond_2

    .line 72
    .line 73
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    .line 74
    .line 75
    add-int/lit8 v5, v0, 0x8

    .line 76
    .line 77
    aget v5, p3, v5

    .line 78
    .line 79
    aput v5, v4, v0

    .line 80
    .line 81
    add-int/lit8 v0, v0, 0x1

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    new-instance v0, Ljava/util/Vector;

    .line 85
    .line 86
    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNodes:Ljava/util/Vector;

    .line 90
    .line 91
    move v0, p1

    .line 92
    :goto_3
    if-ge v0, v3, :cond_3

    .line 93
    .line 94
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNodes:Ljava/util/Vector;

    .line 95
    .line 96
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 97
    .line 98
    add-int/lit8 v5, v5, 0x8

    .line 99
    .line 100
    add-int/2addr v5, v0

    .line 101
    aget v5, p3, v5

    .line 102
    .line 103
    invoke-static {v5}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    add-int/lit8 v0, v0, 0x1

    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_3
    aget-object p3, p2, p1

    .line 114
    .line 115
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->root:[B

    .line 116
    .line 117
    iget p3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 118
    .line 119
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    .line 120
    .line 121
    new-array v2, v2, [I

    .line 122
    .line 123
    aput v0, v2, v1

    .line 124
    .line 125
    aput p3, v2, p1

    .line 126
    .line 127
    sget-object p3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 128
    .line 129
    invoke-static {p3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p3

    .line 133
    check-cast p3, [[B

    .line 134
    .line 135
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->AuthPath:[[B

    .line 136
    .line 137
    move p3, p1

    .line 138
    :goto_4
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 139
    .line 140
    if-ge p3, v0, :cond_4

    .line 141
    .line 142
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->AuthPath:[[B

    .line 143
    .line 144
    add-int/lit8 v2, p3, 0x1

    .line 145
    .line 146
    aget-object v4, p2, v2

    .line 147
    .line 148
    aput-object v4, v0, p3

    .line 149
    .line 150
    move p3, v2

    .line 151
    goto :goto_4

    .line 152
    :cond_4
    new-instance p3, Ljava/util/Vector;

    .line 153
    .line 154
    invoke-direct {p3}, Ljava/util/Vector;-><init>()V

    .line 155
    .line 156
    .line 157
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 158
    .line 159
    :goto_5
    if-ge p1, v3, :cond_5

    .line 160
    .line 161
    iget-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 162
    .line 163
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 164
    .line 165
    add-int/2addr v0, v1

    .line 166
    add-int/2addr v0, p1

    .line 167
    aget-object v0, p2, v0

    .line 168
    .line 169
    invoke-virtual {p3, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    add-int/lit8 p1, p1, 0x1

    .line 173
    .line 174
    goto :goto_5

    .line 175
    :cond_5
    invoke-static {p4}, Lorg/spongycastle/pqc/crypto/gmss/GMSSUtils;->clone([Lorg/spongycastle/pqc/crypto/gmss/Treehash;)[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->treehash:[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 180
    .line 181
    invoke-static {p5}, Lorg/spongycastle/pqc/crypto/gmss/GMSSUtils;->clone([Ljava/util/Vector;)[Ljava/util/Vector;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->retain:[Ljava/util/Vector;

    .line 186
    .line 187
    return-void
.end method


# virtual methods
.method public getAuthPath()[[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->AuthPath:[[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSUtils;->clone([[B)[[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRetain()[Ljava/util/Vector;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->retain:[Ljava/util/Vector;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSUtils;->clone([Ljava/util/Vector;)[Ljava/util/Vector;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRoot()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->root:[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getStack()Ljava/util/Vector;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/Vector;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-object v0
.end method

.method public getStatByte()[[B
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    add-int/2addr v2, v3

    .line 16
    add-int/2addr v2, v0

    .line 17
    const/4 v4, 0x2

    .line 18
    new-array v4, v4, [I

    .line 19
    .line 20
    const/16 v5, 0x40

    .line 21
    .line 22
    aput v5, v4, v3

    .line 23
    .line 24
    aput v2, v4, v1

    .line 25
    .line 26
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 27
    .line 28
    invoke-static {v2, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, [[B

    .line 33
    .line 34
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->root:[B

    .line 35
    .line 36
    aput-object v4, v2, v1

    .line 37
    .line 38
    move v4, v1

    .line 39
    :goto_1
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 40
    .line 41
    if-ge v4, v5, :cond_1

    .line 42
    .line 43
    add-int/lit8 v5, v4, 0x1

    .line 44
    .line 45
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->AuthPath:[[B

    .line 46
    .line 47
    aget-object v4, v6, v4

    .line 48
    .line 49
    aput-object v4, v2, v5

    .line 50
    .line 51
    move v4, v5

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    :goto_2
    if-ge v1, v0, :cond_2

    .line 54
    .line 55
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 56
    .line 57
    add-int/2addr v4, v3

    .line 58
    add-int/2addr v4, v1

    .line 59
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 60
    .line 61
    invoke-virtual {v5, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    check-cast v5, [B

    .line 66
    .line 67
    aput-object v5, v2, v4

    .line 68
    .line 69
    add-int/lit8 v1, v1, 0x1

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    return-object v2
.end method

.method public getStatInt()[I
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 13
    .line 14
    add-int/lit8 v3, v2, 0x8

    .line 15
    .line 16
    add-int/2addr v3, v0

    .line 17
    new-array v3, v3, [I

    .line 18
    .line 19
    aput v2, v3, v1

    .line 20
    .line 21
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    aput v2, v3, v4

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    .line 28
    .line 29
    aput v5, v3, v2

    .line 30
    .line 31
    const/4 v2, 0x3

    .line 32
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->indexForNextSeed:I

    .line 33
    .line 34
    aput v5, v3, v2

    .line 35
    .line 36
    const/4 v2, 0x4

    .line 37
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNextSeed:I

    .line 38
    .line 39
    aput v5, v3, v2

    .line 40
    .line 41
    iget-boolean v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isFinished:Z

    .line 42
    .line 43
    const/4 v5, 0x5

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    aput v4, v3, v5

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    aput v1, v3, v5

    .line 50
    .line 51
    :goto_1
    iget-boolean v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isInitialized:Z

    .line 52
    .line 53
    const/4 v5, 0x6

    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    aput v4, v3, v5

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_2
    aput v1, v3, v5

    .line 60
    .line 61
    :goto_2
    const/4 v2, 0x7

    .line 62
    aput v0, v3, v2

    .line 63
    .line 64
    move v2, v1

    .line 65
    :goto_3
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 66
    .line 67
    if-ge v2, v4, :cond_3

    .line 68
    .line 69
    add-int/lit8 v4, v2, 0x8

    .line 70
    .line 71
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    .line 72
    .line 73
    aget v5, v5, v2

    .line 74
    .line 75
    aput v5, v3, v4

    .line 76
    .line 77
    add-int/lit8 v2, v2, 0x1

    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_3
    :goto_4
    if-ge v1, v0, :cond_4

    .line 81
    .line 82
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 83
    .line 84
    add-int/lit8 v2, v2, 0x8

    .line 85
    .line 86
    add-int/2addr v2, v1

    .line 87
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNodes:Ljava/util/Vector;

    .line 88
    .line 89
    invoke-virtual {v4, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    check-cast v4, Ljava/lang/Integer;

    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    aput v4, v3, v2

    .line 100
    .line 101
    add-int/lit8 v1, v1, 0x1

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_4
    return-object v3
.end method

.method public getTreehash()[Lorg/spongycastle/pqc/crypto/gmss/Treehash;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->treehash:[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSUtils;->clone([Lorg/spongycastle/pqc/crypto/gmss/Treehash;)[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initialize(Ljava/util/Vector;)V
    .locals 5

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    new-array v0, v0, [Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 7
    .line 8
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->treehash:[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    move v1, v0

    .line 12
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 13
    .line 14
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    .line 15
    .line 16
    sub-int v3, v2, v3

    .line 17
    .line 18
    if-ge v1, v3, :cond_0

    .line 19
    .line 20
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->treehash:[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 21
    .line 22
    new-instance v3, Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 23
    .line 24
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 25
    .line 26
    invoke-interface {v4}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-direct {v3, p1, v1, v4}, Lorg/spongycastle/pqc/crypto/gmss/Treehash;-><init>(Ljava/util/Vector;ILorg/spongycastle/crypto/Digest;)V

    .line 31
    .line 32
    .line 33
    aput-object v3, v2, v1

    .line 34
    .line 35
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    new-array p1, v2, [I

    .line 39
    .line 40
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    .line 41
    .line 42
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    .line 43
    .line 44
    const/4 v1, 0x2

    .line 45
    new-array v1, v1, [I

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    aput p1, v1, v3

    .line 49
    .line 50
    aput v2, v1, v0

    .line 51
    .line 52
    sget-object p1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 53
    .line 54
    invoke-static {p1, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, [[B

    .line 59
    .line 60
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->AuthPath:[[B

    .line 61
    .line 62
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    .line 63
    .line 64
    new-array p1, p1, [B

    .line 65
    .line 66
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->root:[B

    .line 67
    .line 68
    new-instance p1, Ljava/util/Vector;

    .line 69
    .line 70
    invoke-direct {p1}, Ljava/util/Vector;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 74
    .line 75
    new-instance p1, Ljava/util/Vector;

    .line 76
    .line 77
    invoke-direct {p1}, Ljava/util/Vector;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNodes:Ljava/util/Vector;

    .line 81
    .line 82
    iput-boolean v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isInitialized:Z

    .line 83
    .line 84
    iput-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isFinished:Z

    .line 85
    .line 86
    move p1, v0

    .line 87
    :goto_1
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 88
    .line 89
    if-ge p1, v1, :cond_1

    .line 90
    .line 91
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    .line 92
    .line 93
    const/4 v2, -0x1

    .line 94
    aput v2, v1, p1

    .line 95
    .line 96
    add-int/lit8 p1, p1, 0x1

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_1
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    .line 100
    .line 101
    sub-int/2addr p1, v3

    .line 102
    new-array p1, p1, [Ljava/util/Vector;

    .line 103
    .line 104
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->retain:[Ljava/util/Vector;

    .line 105
    .line 106
    move p1, v0

    .line 107
    :goto_2
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    .line 108
    .line 109
    sub-int/2addr v1, v3

    .line 110
    if-ge p1, v1, :cond_2

    .line 111
    .line 112
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->retain:[Ljava/util/Vector;

    .line 113
    .line 114
    new-instance v2, Ljava/util/Vector;

    .line 115
    .line 116
    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 117
    .line 118
    .line 119
    aput-object v2, v1, p1

    .line 120
    .line 121
    add-int/lit8 p1, p1, 0x1

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_2
    const/4 p1, 0x3

    .line 125
    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->indexForNextSeed:I

    .line 126
    .line 127
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNextSeed:I

    .line 128
    .line 129
    return-void
.end method

.method public initializeTreehashSeed([BI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->treehash:[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 2
    .line 3
    aget-object p0, p0, p2

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->initializeSeed([B)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    :goto_0
    const-string v2, ""

    .line 13
    .line 14
    move v3, v1

    .line 15
    :goto_1
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 16
    .line 17
    add-int/lit8 v4, v4, 0x8

    .line 18
    .line 19
    add-int/2addr v4, v0

    .line 20
    const-string v5, " "

    .line 21
    .line 22
    if-ge v3, v4, :cond_1

    .line 23
    .line 24
    new-instance v4, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->getStatInt()[I

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    aget v2, v2, v3

    .line 37
    .line 38
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    add-int/lit8 v3, v3, 0x1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    :goto_2
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 52
    .line 53
    add-int/lit8 v3, v3, 0x1

    .line 54
    .line 55
    add-int/2addr v3, v0

    .line 56
    if-ge v1, v3, :cond_2

    .line 57
    .line 58
    new-instance v3, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    new-instance v2, Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->getStatByte()[[B

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    aget-object v4, v4, v1

    .line 73
    .line 74
    invoke-static {v4}, Lorg/spongycastle/util/encoders/Hex;->encode([B)[B

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-direct {v2, v4}, Ljava/lang/String;-><init>([B)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    add-int/lit8 v1, v1, 0x1

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v1, "  "

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 108
    .line 109
    invoke-interface {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-interface {p0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0
.end method

.method public update([B)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isFinished:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 6
    .line 7
    const-string p1, "Too much updates for Tree!!"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isInitialized:Z

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 18
    .line 19
    const-string p1, "GMSSRootCalc not initialized!"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    aget v2, v0, v1

    .line 29
    .line 30
    const/4 v3, 0x1

    .line 31
    add-int/2addr v2, v3

    .line 32
    aput v2, v0, v1

    .line 33
    .line 34
    const/4 v0, 0x3

    .line 35
    if-ne v2, v3, :cond_2

    .line 36
    .line 37
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->AuthPath:[[B

    .line 38
    .line 39
    aget-object v2, v2, v1

    .line 40
    .line 41
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    .line 42
    .line 43
    invoke-static {p1, v1, v2, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    if-ne v2, v0, :cond_3

    .line 48
    .line 49
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 50
    .line 51
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    .line 52
    .line 53
    if-le v2, v4, :cond_3

    .line 54
    .line 55
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->treehash:[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 56
    .line 57
    aget-object v2, v2, v1

    .line 58
    .line 59
    invoke-virtual {v2, p1}, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->setFirstNode([B)V

    .line 60
    .line 61
    .line 62
    :cond_3
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    .line 63
    .line 64
    aget v2, v2, v1

    .line 65
    .line 66
    add-int/lit8 v4, v2, -0x3

    .line 67
    .line 68
    rem-int/lit8 v4, v4, 0x2

    .line 69
    .line 70
    if-nez v4, :cond_4

    .line 71
    .line 72
    if-lt v2, v0, :cond_4

    .line 73
    .line 74
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 75
    .line 76
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    .line 77
    .line 78
    if-ne v2, v4, :cond_4

    .line 79
    .line 80
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->retain:[Ljava/util/Vector;

    .line 81
    .line 82
    aget-object v2, v2, v1

    .line 83
    .line 84
    invoke-virtual {v2, p1, v1}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 85
    .line 86
    .line 87
    :cond_4
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    .line 88
    .line 89
    aget v2, v2, v1

    .line 90
    .line 91
    if-nez v2, :cond_5

    .line 92
    .line 93
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 94
    .line 95
    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNodes:Ljava/util/Vector;

    .line 99
    .line 100
    invoke-static {v1}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_5
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    .line 109
    .line 110
    new-array v4, v2, [B

    .line 111
    .line 112
    shl-int/lit8 v5, v2, 0x1

    .line 113
    .line 114
    new-array v6, v5, [B

    .line 115
    .line 116
    invoke-static {p1, v1, v4, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 117
    .line 118
    .line 119
    move p1, v1

    .line 120
    :cond_6
    :goto_1
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 121
    .line 122
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-lez v2, :cond_a

    .line 127
    .line 128
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNodes:Ljava/util/Vector;

    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    check-cast v2, Ljava/lang/Integer;

    .line 135
    .line 136
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    if-ne p1, v2, :cond_a

    .line 141
    .line 142
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 143
    .line 144
    invoke-virtual {v2}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    iget v7, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    .line 149
    .line 150
    invoke-static {v2, v1, v6, v1, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 151
    .line 152
    .line 153
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 154
    .line 155
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    .line 156
    .line 157
    .line 158
    move-result v7

    .line 159
    sub-int/2addr v7, v3

    .line 160
    invoke-virtual {v2, v7}, Ljava/util/Vector;->removeElementAt(I)V

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNodes:Ljava/util/Vector;

    .line 164
    .line 165
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    sub-int/2addr v7, v3

    .line 170
    invoke-virtual {v2, v7}, Ljava/util/Vector;->removeElementAt(I)V

    .line 171
    .line 172
    .line 173
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    .line 174
    .line 175
    invoke-static {v4, v1, v6, v2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 176
    .line 177
    .line 178
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 179
    .line 180
    invoke-interface {v2, v6, v1, v5}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 181
    .line 182
    .line 183
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 184
    .line 185
    invoke-interface {v2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    new-array v4, v2, [B

    .line 190
    .line 191
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 192
    .line 193
    invoke-interface {v2, v4, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 194
    .line 195
    .line 196
    add-int/lit8 p1, p1, 0x1

    .line 197
    .line 198
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 199
    .line 200
    if-ge p1, v2, :cond_6

    .line 201
    .line 202
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    .line 203
    .line 204
    aget v7, v2, p1

    .line 205
    .line 206
    add-int/2addr v7, v3

    .line 207
    aput v7, v2, p1

    .line 208
    .line 209
    if-ne v7, v3, :cond_7

    .line 210
    .line 211
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->AuthPath:[[B

    .line 212
    .line 213
    aget-object v2, v2, p1

    .line 214
    .line 215
    iget v7, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->mdLength:I

    .line 216
    .line 217
    invoke-static {v4, v1, v2, v1, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 218
    .line 219
    .line 220
    :cond_7
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 221
    .line 222
    iget v7, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    .line 223
    .line 224
    sub-int/2addr v2, v7

    .line 225
    if-lt p1, v2, :cond_9

    .line 226
    .line 227
    if-nez p1, :cond_8

    .line 228
    .line 229
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 230
    .line 231
    const-string v7, "M\ufffd\ufffd\ufffdP"

    .line 232
    .line 233
    invoke-virtual {v2, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    :cond_8
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    .line 237
    .line 238
    aget v2, v2, p1

    .line 239
    .line 240
    add-int/lit8 v7, v2, -0x3

    .line 241
    .line 242
    rem-int/lit8 v7, v7, 0x2

    .line 243
    .line 244
    if-nez v7, :cond_6

    .line 245
    .line 246
    if-lt v2, v0, :cond_6

    .line 247
    .line 248
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->retain:[Ljava/util/Vector;

    .line 249
    .line 250
    iget v7, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 251
    .line 252
    iget v8, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    .line 253
    .line 254
    sub-int/2addr v7, v8

    .line 255
    sub-int v7, p1, v7

    .line 256
    .line 257
    aget-object v2, v2, v7

    .line 258
    .line 259
    invoke-virtual {v2, v4, v1}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 260
    .line 261
    .line 262
    goto/16 :goto_1

    .line 263
    .line 264
    :cond_9
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    .line 265
    .line 266
    aget v2, v2, p1

    .line 267
    .line 268
    if-ne v2, v0, :cond_6

    .line 269
    .line 270
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->treehash:[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 271
    .line 272
    aget-object v2, v2, p1

    .line 273
    .line 274
    invoke-virtual {v2, v4}, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->setFirstNode([B)V

    .line 275
    .line 276
    .line 277
    goto/16 :goto_1

    .line 278
    .line 279
    :cond_a
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 280
    .line 281
    invoke-virtual {v0, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 282
    .line 283
    .line 284
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNodes:Ljava/util/Vector;

    .line 285
    .line 286
    invoke-static {p1}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 287
    .line 288
    .line 289
    move-result-object v2

    .line 290
    invoke-virtual {v0, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 291
    .line 292
    .line 293
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    .line 294
    .line 295
    if-ne p1, v0, :cond_b

    .line 296
    .line 297
    iput-boolean v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isFinished:Z

    .line 298
    .line 299
    iput-boolean v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isInitialized:Z

    .line 300
    .line 301
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->tailStack:Ljava/util/Vector;

    .line 302
    .line 303
    invoke-virtual {p1}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    check-cast p1, [B

    .line 308
    .line 309
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->root:[B

    .line 310
    .line 311
    :cond_b
    return-void
.end method

.method public update([B[B)V
    .locals 4

    .line 312
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNextSeed:I

    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfTree:I

    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->K:I

    sub-int/2addr v1, v2

    if-ge v0, v1, :cond_0

    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->indexForNextSeed:I

    add-int/lit8 v1, v1, -0x2

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->index:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    if-ne v1, v2, :cond_0

    .line 313
    invoke-virtual {p0, p1, v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->initializeTreehashSeed([BI)V

    .line 314
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNextSeed:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->heightOfNextSeed:I

    .line 315
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->indexForNextSeed:I

    mul-int/lit8 p1, p1, 0x2

    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->indexForNextSeed:I

    .line 316
    :cond_0
    invoke-virtual {p0, p2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->update([B)V

    return-void
.end method

.method public wasFinished()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isFinished:Z

    .line 2
    .line 3
    return p0
.end method

.method public wasInitialized()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->isInitialized:Z

    .line 2
    .line 3
    return p0
.end method
