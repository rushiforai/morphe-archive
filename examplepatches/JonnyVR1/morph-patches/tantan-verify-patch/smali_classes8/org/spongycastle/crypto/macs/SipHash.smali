.class public Lorg/spongycastle/crypto/macs/SipHash;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# instance fields
.field protected final c:I

.field protected final d:I

.field protected k0:J

.field protected k1:J

.field protected m:J

.field protected v0:J

.field protected v1:J

.field protected v2:J

.field protected v3:J

.field protected wordCount:I

.field protected wordPos:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 10
    .line 11
    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->c:I

    .line 15
    .line 16
    const/4 v0, 0x4

    .line 17
    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->d:I

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(II)V
    .locals 2

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 21
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 23
    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    .line 24
    iput p1, p0, Lorg/spongycastle/crypto/macs/SipHash;->c:I

    .line 25
    iput p2, p0, Lorg/spongycastle/crypto/macs/SipHash;->d:I

    return-void
.end method

.method public static rotateLeft(JI)J
    .locals 2

    shl-long v0, p0, p2

    neg-int p2, p2

    ushr-long/2addr p0, p2

    or-long/2addr p0, v0

    return-wide p0
.end method


# virtual methods
.method public applySipRounds(I)V
    .locals 11

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    .line 2
    .line 3
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->v1:J

    .line 4
    .line 5
    iget-wide v4, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    .line 6
    .line 7
    iget-wide v6, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    .line 8
    .line 9
    const/4 v8, 0x0

    .line 10
    :goto_0
    if-ge v8, p1, :cond_0

    .line 11
    .line 12
    add-long/2addr v0, v2

    .line 13
    add-long/2addr v4, v6

    .line 14
    const/16 v9, 0xd

    .line 15
    .line 16
    invoke-static {v2, v3, v9}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    const/16 v9, 0x10

    .line 21
    .line 22
    invoke-static {v6, v7, v9}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    .line 23
    .line 24
    .line 25
    move-result-wide v6

    .line 26
    xor-long/2addr v2, v0

    .line 27
    xor-long/2addr v6, v4

    .line 28
    const/16 v9, 0x20

    .line 29
    .line 30
    invoke-static {v0, v1, v9}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    add-long/2addr v4, v2

    .line 35
    add-long/2addr v0, v6

    .line 36
    const/16 v10, 0x11

    .line 37
    .line 38
    invoke-static {v2, v3, v10}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    const/16 v10, 0x15

    .line 43
    .line 44
    invoke-static {v6, v7, v10}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    .line 45
    .line 46
    .line 47
    move-result-wide v6

    .line 48
    xor-long/2addr v2, v4

    .line 49
    xor-long/2addr v6, v0

    .line 50
    invoke-static {v4, v5, v9}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    .line 51
    .line 52
    .line 53
    move-result-wide v4

    .line 54
    add-int/lit8 v8, v8, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    .line 58
    .line 59
    iput-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->v1:J

    .line 60
    .line 61
    iput-wide v4, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    .line 62
    .line 63
    iput-wide v6, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    .line 64
    .line 65
    return-void
.end method

.method public doFinal([BI)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 56
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->doFinal()J

    move-result-wide v0

    .line 57
    invoke-static {v0, v1, p1, p2}, Lorg/spongycastle/util/Pack;->longToLittleEndian(J[BI)V

    const/16 p0, 0x8

    return p0
.end method

.method public doFinal()J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 2
    .line 3
    iget v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 4
    .line 5
    rsub-int/lit8 v3, v2, 0x7

    .line 6
    .line 7
    shl-int/lit8 v3, v3, 0x3

    .line 8
    .line 9
    ushr-long/2addr v0, v3

    .line 10
    const/16 v3, 0x8

    .line 11
    .line 12
    ushr-long/2addr v0, v3

    .line 13
    iget v3, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    .line 14
    .line 15
    shl-int/lit8 v3, v3, 0x3

    .line 16
    .line 17
    add-int/2addr v3, v2

    .line 18
    int-to-long v2, v3

    .line 19
    const-wide/16 v4, 0xff

    .line 20
    .line 21
    and-long/2addr v2, v4

    .line 22
    const/16 v6, 0x38

    .line 23
    .line 24
    shl-long/2addr v2, v6

    .line 25
    or-long/2addr v0, v2

    .line 26
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 27
    .line 28
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->processMessageWord()V

    .line 29
    .line 30
    .line 31
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    .line 32
    .line 33
    xor-long/2addr v0, v4

    .line 34
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    .line 35
    .line 36
    iget v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->d:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/macs/SipHash;->applySipRounds(I)V

    .line 39
    .line 40
    .line 41
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    .line 42
    .line 43
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->v1:J

    .line 44
    .line 45
    xor-long/2addr v0, v2

    .line 46
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    .line 47
    .line 48
    xor-long/2addr v0, v2

    .line 49
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    .line 50
    .line 51
    xor-long/2addr v0, v2

    .line 52
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->reset()V

    .line 53
    .line 54
    .line 55
    return-wide v0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SipHash-"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lorg/spongycastle/crypto/macs/SipHash;->c:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "-"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lorg/spongycastle/crypto/macs/SipHash;->d:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public getMacSize()I
    .locals 0

    const/16 p0, 0x8

    return p0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 6
    .line 7
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    array-length v0, p1

    .line 12
    const/16 v1, 0x10

    .line 13
    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->littleEndianToLong([BI)J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->k0:J

    .line 22
    .line 23
    const/16 v0, 0x8

    .line 24
    .line 25
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->littleEndianToLong([BI)J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->k1:J

    .line 30
    .line 31
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->reset()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p0, "\'params\' must be a 128-bit key"

    .line 36
    .line 37
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const-string p0, "\'params\' must be an instance of KeyParameter"

    .line 42
    .line 43
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public processMessageWord()V
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    .line 6
    .line 7
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    .line 8
    .line 9
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 10
    .line 11
    xor-long/2addr v0, v2

    .line 12
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    .line 13
    .line 14
    iget v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->c:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/macs/SipHash;->applySipRounds(I)V

    .line 17
    .line 18
    .line 19
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    .line 20
    .line 21
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 22
    .line 23
    xor-long/2addr v0, v2

    .line 24
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    .line 25
    .line 26
    return-void
.end method

.method public reset()V
    .locals 6

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->k0:J

    .line 2
    .line 3
    const-wide v2, 0x736f6d6570736575L    # 1.0986868386607877E248

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    xor-long/2addr v2, v0

    .line 9
    iput-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    .line 10
    .line 11
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->k1:J

    .line 12
    .line 13
    const-wide v4, 0x646f72616e646f6dL    # 6.222199573468475E175

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    xor-long/2addr v4, v2

    .line 19
    iput-wide v4, p0, Lorg/spongycastle/crypto/macs/SipHash;->v1:J

    .line 20
    .line 21
    const-wide v4, 0x6c7967656e657261L    # 3.4208747916531402E214

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    xor-long/2addr v0, v4

    .line 27
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    .line 28
    .line 29
    const-wide v0, 0x7465646279746573L    # 4.901176695720602E252

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    xor-long/2addr v0, v2

    .line 35
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    .line 36
    .line 37
    const-wide/16 v0, 0x0

    .line 38
    .line 39
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 43
    .line 44
    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    .line 45
    .line 46
    return-void
.end method

.method public update(B)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 133
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    const/16 v2, 0x8

    ushr-long/2addr v0, v2

    int-to-long v3, p1

    const-wide/16 v5, 0xff

    and-long/2addr v3, v5

    const/16 p1, 0x38

    shl-long/2addr v3, p1

    or-long/2addr v0, v3

    .line 134
    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 135
    iget p1, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    if-ne p1, v2, :cond_0

    .line 136
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->processMessageWord()V

    const/4 p1, 0x0

    .line 137
    iput p1, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    :cond_0
    return-void
.end method

.method public update([BII)V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    and-int/lit8 v3, v2, -0x8

    .line 8
    .line 9
    iget v4, v0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 10
    .line 11
    const/16 v5, 0x38

    .line 12
    .line 13
    const-wide/16 v6, 0xff

    .line 14
    .line 15
    const/16 v8, 0x8

    .line 16
    .line 17
    const/4 v9, 0x0

    .line 18
    if-nez v4, :cond_2

    .line 19
    .line 20
    :goto_0
    if-ge v9, v3, :cond_0

    .line 21
    .line 22
    add-int v4, p2, v9

    .line 23
    .line 24
    invoke-static {v1, v4}, Lorg/spongycastle/util/Pack;->littleEndianToLong([BI)J

    .line 25
    .line 26
    .line 27
    move-result-wide v10

    .line 28
    iput-wide v10, v0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 29
    .line 30
    invoke-virtual {v0}, Lorg/spongycastle/crypto/macs/SipHash;->processMessageWord()V

    .line 31
    .line 32
    .line 33
    add-int/lit8 v9, v9, 0x8

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    :goto_1
    if-ge v9, v2, :cond_1

    .line 37
    .line 38
    iget-wide v10, v0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 39
    .line 40
    ushr-long/2addr v10, v8

    .line 41
    iput-wide v10, v0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 42
    .line 43
    add-int v4, p2, v9

    .line 44
    .line 45
    aget-byte v4, v1, v4

    .line 46
    .line 47
    int-to-long v12, v4

    .line 48
    and-long/2addr v12, v6

    .line 49
    shl-long/2addr v12, v5

    .line 50
    or-long/2addr v10, v12

    .line 51
    iput-wide v10, v0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 52
    .line 53
    add-int/lit8 v9, v9, 0x1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    sub-int v1, v2, v3

    .line 57
    .line 58
    iput v1, v0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    shl-int/lit8 v4, v4, 0x3

    .line 62
    .line 63
    move v10, v9

    .line 64
    :goto_2
    if-ge v10, v3, :cond_3

    .line 65
    .line 66
    add-int v11, p2, v10

    .line 67
    .line 68
    invoke-static {v1, v11}, Lorg/spongycastle/util/Pack;->littleEndianToLong([BI)J

    .line 69
    .line 70
    .line 71
    move-result-wide v11

    .line 72
    shl-long v13, v11, v4

    .line 73
    .line 74
    move v15, v5

    .line 75
    move-wide/from16 v16, v6

    .line 76
    .line 77
    iget-wide v5, v0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 78
    .line 79
    neg-int v7, v4

    .line 80
    ushr-long/2addr v5, v7

    .line 81
    or-long/2addr v5, v13

    .line 82
    iput-wide v5, v0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 83
    .line 84
    invoke-virtual {v0}, Lorg/spongycastle/crypto/macs/SipHash;->processMessageWord()V

    .line 85
    .line 86
    .line 87
    iput-wide v11, v0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 88
    .line 89
    add-int/lit8 v10, v10, 0x8

    .line 90
    .line 91
    move v5, v15

    .line 92
    move-wide/from16 v6, v16

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_3
    move v15, v5

    .line 96
    move-wide/from16 v16, v6

    .line 97
    .line 98
    :goto_3
    if-ge v10, v2, :cond_5

    .line 99
    .line 100
    iget-wide v3, v0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 101
    .line 102
    ushr-long/2addr v3, v8

    .line 103
    iput-wide v3, v0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 104
    .line 105
    add-int v5, p2, v10

    .line 106
    .line 107
    aget-byte v5, v1, v5

    .line 108
    .line 109
    int-to-long v5, v5

    .line 110
    and-long v5, v5, v16

    .line 111
    .line 112
    shl-long/2addr v5, v15

    .line 113
    or-long/2addr v3, v5

    .line 114
    iput-wide v3, v0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 115
    .line 116
    iget v3, v0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 117
    .line 118
    add-int/lit8 v3, v3, 0x1

    .line 119
    .line 120
    iput v3, v0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 121
    .line 122
    if-ne v3, v8, :cond_4

    .line 123
    .line 124
    invoke-virtual {v0}, Lorg/spongycastle/crypto/macs/SipHash;->processMessageWord()V

    .line 125
    .line 126
    .line 127
    iput v9, v0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 128
    .line 129
    :cond_4
    add-int/lit8 v10, v10, 0x1

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_5
    return-void
.end method
