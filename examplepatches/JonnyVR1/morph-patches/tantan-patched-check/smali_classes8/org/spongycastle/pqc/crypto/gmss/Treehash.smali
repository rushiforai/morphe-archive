.class public Lorg/spongycastle/pqc/crypto/gmss/Treehash;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private firstNode:[B

.field private firstNodeHeight:I

.field private heightOfNodes:Ljava/util/Vector;

.field private isFinished:Z

.field private isInitialized:Z

.field private maxHeight:I

.field private messDigestTree:Lorg/spongycastle/crypto/Digest;

.field private seedActive:[B

.field private seedInitialized:Z

.field private seedNext:[B

.field private tailLength:I

.field private tailStack:Ljava/util/Vector;


# direct methods
.method public constructor <init>(Ljava/util/Vector;ILorg/spongycastle/crypto/Digest;)V
    .locals 0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailStack:Ljava/util/Vector;

    .line 117
    iput p2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->maxHeight:I

    const/4 p1, 0x0

    .line 118
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    const/4 p1, 0x0

    .line 119
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isInitialized:Z

    .line 120
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isFinished:Z

    .line 121
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedInitialized:Z

    .line 122
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 123
    invoke-interface {p3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result p1

    new-array p1, p1, [B

    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedNext:[B

    .line 124
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result p1

    new-array p1, p1, [B

    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedActive:[B

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/Digest;[[B[I)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    aget v0, p3, p1

    .line 8
    .line 9
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->maxHeight:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    aget v1, p3, v0

    .line 13
    .line 14
    iput v1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    aget v2, p3, v1

    .line 18
    .line 19
    iput v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 20
    .line 21
    const/4 v2, 0x3

    .line 22
    aget v2, p3, v2

    .line 23
    .line 24
    if-ne v2, v0, :cond_0

    .line 25
    .line 26
    iput-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isFinished:Z

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isFinished:Z

    .line 30
    .line 31
    :goto_0
    const/4 v2, 0x4

    .line 32
    aget v2, p3, v2

    .line 33
    .line 34
    if-ne v2, v0, :cond_1

    .line 35
    .line 36
    iput-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isInitialized:Z

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isInitialized:Z

    .line 40
    .line 41
    :goto_1
    const/4 v2, 0x5

    .line 42
    aget v2, p3, v2

    .line 43
    .line 44
    if-ne v2, v0, :cond_2

    .line 45
    .line 46
    iput-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedInitialized:Z

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_2
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedInitialized:Z

    .line 50
    .line 51
    :goto_2
    new-instance v2, Ljava/util/Vector;

    .line 52
    .line 53
    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->heightOfNodes:Ljava/util/Vector;

    .line 57
    .line 58
    move v2, p1

    .line 59
    :goto_3
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 60
    .line 61
    if-ge v2, v3, :cond_3

    .line 62
    .line 63
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->heightOfNodes:Ljava/util/Vector;

    .line 64
    .line 65
    add-int/lit8 v4, v2, 0x6

    .line 66
    .line 67
    aget v4, p3, v4

    .line 68
    .line 69
    invoke-static {v4}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {v3, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    add-int/lit8 v2, v2, 0x1

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_3
    aget-object p3, p2, p1

    .line 80
    .line 81
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 82
    .line 83
    aget-object p3, p2, v0

    .line 84
    .line 85
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedActive:[B

    .line 86
    .line 87
    aget-object p3, p2, v1

    .line 88
    .line 89
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedNext:[B

    .line 90
    .line 91
    new-instance p3, Ljava/util/Vector;

    .line 92
    .line 93
    invoke-direct {p3}, Ljava/util/Vector;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailStack:Ljava/util/Vector;

    .line 97
    .line 98
    :goto_4
    iget p3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 99
    .line 100
    if-ge p1, p3, :cond_4

    .line 101
    .line 102
    iget-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailStack:Ljava/util/Vector;

    .line 103
    .line 104
    add-int/lit8 v0, p1, 0x3

    .line 105
    .line 106
    aget-object v0, p2, v0

    .line 107
    .line 108
    invoke-virtual {p3, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    add-int/lit8 p1, p1, 0x1

    .line 112
    .line 113
    goto :goto_4

    .line 114
    :cond_4
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isInitialized:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isFinished:Z

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 8
    .line 9
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 13
    .line 14
    return-void
.end method

.method public getFirstNode()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getFirstNodeHeight()I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->maxHeight:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 9
    .line 10
    return p0
.end method

.method public getLowestNodeHeight()I
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->maxHeight:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 9
    .line 10
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    return v1

    .line 15
    :cond_1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->heightOfNodes:Ljava/util/Vector;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public getSeedActive()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedActive:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getStatByte()[[B
    .locals 5

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x3

    .line 4
    .line 5
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 6
    .line 7
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x2

    .line 12
    new-array v3, v2, [I

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    aput v1, v3, v4

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    aput v0, v3, v1

    .line 19
    .line 20
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    invoke-static {v0, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, [[B

    .line 27
    .line 28
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 29
    .line 30
    aput-object v3, v0, v1

    .line 31
    .line 32
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedActive:[B

    .line 33
    .line 34
    aput-object v3, v0, v4

    .line 35
    .line 36
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedNext:[B

    .line 37
    .line 38
    aput-object v3, v0, v2

    .line 39
    .line 40
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 41
    .line 42
    if-ge v1, v2, :cond_0

    .line 43
    .line 44
    add-int/lit8 v2, v1, 0x3

    .line 45
    .line 46
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailStack:Ljava/util/Vector;

    .line 47
    .line 48
    invoke-virtual {v3, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, [B

    .line 53
    .line 54
    aput-object v3, v0, v2

    .line 55
    .line 56
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    return-object v0
.end method

.method public getStatInt()[I
    .locals 5

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x6

    .line 4
    .line 5
    new-array v1, v1, [I

    .line 6
    .line 7
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->maxHeight:I

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    aput v2, v1, v3

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    aput v0, v1, v2

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 17
    .line 18
    aput v4, v1, v0

    .line 19
    .line 20
    iget-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isFinished:Z

    .line 21
    .line 22
    const/4 v4, 0x3

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    aput v2, v1, v4

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    aput v3, v1, v4

    .line 29
    .line 30
    :goto_0
    iget-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isInitialized:Z

    .line 31
    .line 32
    const/4 v4, 0x4

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    aput v2, v1, v4

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    aput v3, v1, v4

    .line 39
    .line 40
    :goto_1
    iget-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedInitialized:Z

    .line 41
    .line 42
    const/4 v4, 0x5

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    aput v2, v1, v4

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    aput v3, v1, v4

    .line 49
    .line 50
    :goto_2
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 51
    .line 52
    if-ge v3, v0, :cond_3

    .line 53
    .line 54
    add-int/lit8 v0, v3, 0x6

    .line 55
    .line 56
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->heightOfNodes:Ljava/util/Vector;

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Ljava/lang/Integer;

    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    aput v2, v1, v0

    .line 69
    .line 70
    add-int/lit8 v3, v3, 0x1

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_3
    return-object v1
.end method

.method public getTailStack()Ljava/util/Vector;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailStack:Ljava/util/Vector;

    .line 2
    .line 3
    return-object p0
.end method

.method public initialize()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedInitialized:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "Seed "

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->maxHeight:I

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, " not initialized"

    .line 20
    .line 21
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance v0, Ljava/util/Vector;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->heightOfNodes:Ljava/util/Vector;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 44
    .line 45
    const/4 v1, -0x1

    .line 46
    iput v1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    iput-boolean v1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isInitialized:Z

    .line 50
    .line 51
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedNext:[B

    .line 52
    .line 53
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedActive:[B

    .line 54
    .line 55
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 56
    .line 57
    invoke-interface {p0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    invoke-static {v1, v0, v2, v0, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public initializeSeed([B)V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedNext:[B

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 4
    .line 5
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedInitialized:Z

    .line 15
    .line 16
    return-void
.end method

.method public setFirstNode([B)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isInitialized:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->initialize()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 9
    .line 10
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->maxHeight:I

    .line 11
    .line 12
    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isFinished:Z

    .line 16
    .line 17
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    const-string v0, "Treehash    : "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 6
    .line 7
    add-int/lit8 v3, v3, 0x6

    .line 8
    .line 9
    const-string v4, " "

    .line 10
    .line 11
    if-ge v2, v3, :cond_0

    .line 12
    .line 13
    new-instance v3, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->getStatInt()[I

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    aget v0, v0, v2

    .line 26
    .line 27
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    :goto_1
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 41
    .line 42
    add-int/lit8 v2, v2, 0x3

    .line 43
    .line 44
    if-ge v1, v2, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->getStatByte()[[B

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    aget-object v2, v2, v1

    .line 51
    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    new-instance v2, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    new-instance v0, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->getStatByte()[[B

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    aget-object v3, v3, v1

    .line 69
    .line 70
    invoke-static {v3}, Lorg/spongycastle/util/encoders/Hex;->encode([B)[B

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([B)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    goto :goto_2

    .line 88
    :cond_1
    const-string v2, "null "

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v0, "  "

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 111
    .line 112
    invoke-interface {p0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0
.end method

.method public update(Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;[B)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isFinished:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 6
    .line 7
    const-string p1, "No more update possible for treehash instance!"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isInitialized:Z

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 18
    .line 19
    const-string p1, "Treehash instance not initialized before update"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 26
    .line 27
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    new-array v0, v0, [B

    .line 32
    .line 33
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedActive:[B

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;->nextSeed([B)[B

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    const/4 v1, 0x0

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    iput-object p2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 45
    .line 46
    iput v1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 47
    .line 48
    goto/16 :goto_1

    .line 49
    .line 50
    :cond_2
    move p1, v1

    .line 51
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 52
    .line 53
    if-lez v2, :cond_3

    .line 54
    .line 55
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->heightOfNodes:Ljava/util/Vector;

    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Ljava/lang/Integer;

    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-ne p1, v2, :cond_3

    .line 68
    .line 69
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 70
    .line 71
    invoke-interface {v2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    shl-int/2addr v2, v0

    .line 76
    new-array v3, v2, [B

    .line 77
    .line 78
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailStack:Ljava/util/Vector;

    .line 79
    .line 80
    invoke-virtual {v4}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 85
    .line 86
    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    invoke-static {v4, v1, v3, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    .line 92
    .line 93
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailStack:Ljava/util/Vector;

    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    sub-int/2addr v5, v0

    .line 100
    invoke-virtual {v4, v5}, Ljava/util/Vector;->removeElementAt(I)V

    .line 101
    .line 102
    .line 103
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->heightOfNodes:Ljava/util/Vector;

    .line 104
    .line 105
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    sub-int/2addr v5, v0

    .line 110
    invoke-virtual {v4, v5}, Ljava/util/Vector;->removeElementAt(I)V

    .line 111
    .line 112
    .line 113
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 114
    .line 115
    invoke-interface {v4}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 120
    .line 121
    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    invoke-static {p2, v1, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 126
    .line 127
    .line 128
    iget-object p2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 129
    .line 130
    invoke-interface {p2, v3, v1, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 131
    .line 132
    .line 133
    iget-object p2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 134
    .line 135
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    new-array p2, p2, [B

    .line 140
    .line 141
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 142
    .line 143
    invoke-interface {v2, p2, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 144
    .line 145
    .line 146
    add-int/lit8 p1, p1, 0x1

    .line 147
    .line 148
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 149
    .line 150
    sub-int/2addr v2, v0

    .line 151
    iput v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_3
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailStack:Ljava/util/Vector;

    .line 155
    .line 156
    invoke-virtual {v2, p2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    iget-object p2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->heightOfNodes:Ljava/util/Vector;

    .line 160
    .line 161
    invoke-static {p1}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p2, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 169
    .line 170
    add-int/2addr p1, v0

    .line 171
    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 172
    .line 173
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->heightOfNodes:Ljava/util/Vector;

    .line 174
    .line 175
    invoke-virtual {p1}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    check-cast p1, Ljava/lang/Integer;

    .line 180
    .line 181
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    iget p2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 186
    .line 187
    if-ne p1, p2, :cond_4

    .line 188
    .line 189
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 190
    .line 191
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    shl-int/2addr p1, v0

    .line 196
    new-array p2, p1, [B

    .line 197
    .line 198
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 199
    .line 200
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 201
    .line 202
    invoke-interface {v3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    invoke-static {v2, v1, p2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 207
    .line 208
    .line 209
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailStack:Ljava/util/Vector;

    .line 210
    .line 211
    invoke-virtual {v2}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 216
    .line 217
    invoke-interface {v3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 218
    .line 219
    .line 220
    move-result v3

    .line 221
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 222
    .line 223
    invoke-interface {v4}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    invoke-static {v2, v1, p2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 228
    .line 229
    .line 230
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailStack:Ljava/util/Vector;

    .line 231
    .line 232
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    sub-int/2addr v3, v0

    .line 237
    invoke-virtual {v2, v3}, Ljava/util/Vector;->removeElementAt(I)V

    .line 238
    .line 239
    .line 240
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->heightOfNodes:Ljava/util/Vector;

    .line 241
    .line 242
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    .line 243
    .line 244
    .line 245
    move-result v3

    .line 246
    sub-int/2addr v3, v0

    .line 247
    invoke-virtual {v2, v3}, Ljava/util/Vector;->removeElementAt(I)V

    .line 248
    .line 249
    .line 250
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 251
    .line 252
    invoke-interface {v2, p2, v1, p1}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 253
    .line 254
    .line 255
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 256
    .line 257
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    new-array p1, p1, [B

    .line 262
    .line 263
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNode:[B

    .line 264
    .line 265
    iget-object p2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 266
    .line 267
    invoke-interface {p2, p1, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 268
    .line 269
    .line 270
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 271
    .line 272
    add-int/2addr p1, v0

    .line 273
    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 274
    .line 275
    iput v1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->tailLength:I

    .line 276
    .line 277
    :cond_4
    :goto_1
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->firstNodeHeight:I

    .line 278
    .line 279
    iget p2, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->maxHeight:I

    .line 280
    .line 281
    if-ne p1, p2, :cond_5

    .line 282
    .line 283
    iput-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isFinished:Z

    .line 284
    .line 285
    :cond_5
    return-void
.end method

.method public updateNextSeed(Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->seedNext:[B

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;->nextSeed([B)[B

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public wasFinished()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isFinished:Z

    .line 2
    .line 3
    return p0
.end method

.method public wasInitialized()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/spongycastle/pqc/crypto/gmss/Treehash;->isInitialized:Z

    .line 2
    .line 3
    return p0
.end method
