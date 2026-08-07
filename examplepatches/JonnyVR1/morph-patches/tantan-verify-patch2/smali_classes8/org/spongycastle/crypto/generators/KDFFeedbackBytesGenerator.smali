.class public Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/MacDerivationFunction;


# static fields
.field private static final INTEGER_MAX:Ljava/math/BigInteger;

.field private static final TWO:Ljava/math/BigInteger;


# instance fields
.field private fixedInputData:[B

.field private generatedBytes:I

.field private final h:I

.field private ios:[B

.field private iv:[B

.field private k:[B

.field private maxSizeExcl:I

.field private final prf:Lorg/spongycastle/crypto/Mac;

.field private useCounter:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/32 v0, 0x7fffffff

    .line 2
    .line 3
    .line 4
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->INTEGER_MAX:Ljava/math/BigInteger;

    .line 9
    .line 10
    const-wide/16 v0, 0x2

    .line 11
    .line 12
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->TWO:Ljava/math/BigInteger;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/Mac;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->prf:Lorg/spongycastle/crypto/Mac;

    .line 5
    .line 6
    invoke-interface {p1}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->h:I

    .line 11
    .line 12
    new-array p1, p1, [B

    .line 13
    .line 14
    iput-object p1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->k:[B

    .line 15
    .line 16
    return-void
.end method

.method private generateNext()V
    .locals 8

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->generatedBytes:I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->prf:Lorg/spongycastle/crypto/Mac;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->iv:[B

    .line 9
    .line 10
    array-length v3, v0

    .line 11
    invoke-interface {v1, v0, v2, v3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->k:[B

    .line 16
    .line 17
    array-length v3, v0

    .line 18
    invoke-interface {v1, v0, v2, v3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-boolean v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->useCounter:Z

    .line 22
    .line 23
    if-eqz v0, :cond_5

    .line 24
    .line 25
    iget v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->generatedBytes:I

    .line 26
    .line 27
    iget v1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->h:I

    .line 28
    .line 29
    div-int/2addr v0, v1

    .line 30
    const/4 v1, 0x1

    .line 31
    add-int/2addr v0, v1

    .line 32
    iget-object v3, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->ios:[B

    .line 33
    .line 34
    array-length v4, v3

    .line 35
    if-eq v4, v1, :cond_4

    .line 36
    .line 37
    const/4 v5, 0x2

    .line 38
    if-eq v4, v5, :cond_3

    .line 39
    .line 40
    const/4 v6, 0x3

    .line 41
    if-eq v4, v6, :cond_2

    .line 42
    .line 43
    const/4 v7, 0x4

    .line 44
    if-ne v4, v7, :cond_1

    .line 45
    .line 46
    ushr-int/lit8 v4, v0, 0x18

    .line 47
    .line 48
    int-to-byte v4, v4

    .line 49
    aput-byte v4, v3, v2

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    const-string p0, "Unsupported size of counter i"

    .line 53
    .line 54
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    :goto_1
    array-length v4, v3

    .line 59
    sub-int/2addr v4, v6

    .line 60
    ushr-int/lit8 v6, v0, 0x10

    .line 61
    .line 62
    int-to-byte v6, v6

    .line 63
    aput-byte v6, v3, v4

    .line 64
    .line 65
    :cond_3
    array-length v4, v3

    .line 66
    sub-int/2addr v4, v5

    .line 67
    ushr-int/lit8 v5, v0, 0x8

    .line 68
    .line 69
    int-to-byte v5, v5

    .line 70
    aput-byte v5, v3, v4

    .line 71
    .line 72
    :cond_4
    array-length v4, v3

    .line 73
    sub-int/2addr v4, v1

    .line 74
    int-to-byte v0, v0

    .line 75
    aput-byte v0, v3, v4

    .line 76
    .line 77
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->prf:Lorg/spongycastle/crypto/Mac;

    .line 78
    .line 79
    array-length v1, v3

    .line 80
    invoke-interface {v0, v3, v2, v1}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 81
    .line 82
    .line 83
    :cond_5
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->prf:Lorg/spongycastle/crypto/Mac;

    .line 84
    .line 85
    iget-object v1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->fixedInputData:[B

    .line 86
    .line 87
    array-length v3, v1

    .line 88
    invoke-interface {v0, v1, v2, v3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->prf:Lorg/spongycastle/crypto/Mac;

    .line 92
    .line 93
    iget-object p0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->k:[B

    .line 94
    .line 95
    invoke-interface {v0, p0, v2}, Lorg/spongycastle/crypto/Mac;->doFinal([BI)I

    .line 96
    .line 97
    .line 98
    return-void
.end method


# virtual methods
.method public generateBytes([BII)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->generatedBytes:I

    .line 2
    .line 3
    add-int v1, v0, p3

    .line 4
    .line 5
    if-ltz v1, :cond_2

    .line 6
    .line 7
    iget v2, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->maxSizeExcl:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_2

    .line 10
    .line 11
    iget v1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->h:I

    .line 12
    .line 13
    rem-int/2addr v0, v1

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-direct {p0}, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->generateNext()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->generatedBytes:I

    .line 20
    .line 21
    iget v1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->h:I

    .line 22
    .line 23
    rem-int v2, v0, v1

    .line 24
    .line 25
    rem-int/2addr v0, v1

    .line 26
    sub-int/2addr v1, v0

    .line 27
    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->k:[B

    .line 32
    .line 33
    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    iget v1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->generatedBytes:I

    .line 37
    .line 38
    add-int/2addr v1, v0

    .line 39
    iput v1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->generatedBytes:I

    .line 40
    .line 41
    sub-int v1, p3, v0

    .line 42
    .line 43
    :goto_0
    add-int/2addr p2, v0

    .line 44
    if-lez v1, :cond_1

    .line 45
    .line 46
    invoke-direct {p0}, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->generateNext()V

    .line 47
    .line 48
    .line 49
    iget v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->h:I

    .line 50
    .line 51
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iget-object v2, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->k:[B

    .line 56
    .line 57
    const/4 v3, 0x0

    .line 58
    invoke-static {v2, v3, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    .line 60
    .line 61
    iget v2, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->generatedBytes:I

    .line 62
    .line 63
    add-int/2addr v2, v0

    .line 64
    iput v2, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->generatedBytes:I

    .line 65
    .line 66
    sub-int/2addr v1, v0

    .line 67
    goto :goto_0

    .line 68
    :cond_1
    return p3

    .line 69
    :cond_2
    iget p0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->maxSizeExcl:I

    .line 70
    .line 71
    const-string p1, " bytes"

    .line 72
    .line 73
    const-string p2, "Current KDFCTR may only be used for "

    .line 74
    .line 75
    invoke-static {p2, p0, p1}, Ll/gx50;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    const/4 p0, 0x0

    .line 79
    return p0
.end method

.method public getMac()Lorg/spongycastle/crypto/Mac;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->prf:Lorg/spongycastle/crypto/Mac;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Lorg/spongycastle/crypto/DerivationParameters;)V
    .locals 5

    .line 1
    instance-of v0, p1, Lorg/spongycastle/crypto/params/KDFFeedbackParameters;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Lorg/spongycastle/crypto/params/KDFFeedbackParameters;

    .line 6
    .line 7
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->prf:Lorg/spongycastle/crypto/Mac;

    .line 8
    .line 9
    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 10
    .line 11
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KDFFeedbackParameters;->getKI()[B

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/Mac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KDFFeedbackParameters;->getFixedInputData()[B

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->fixedInputData:[B

    .line 26
    .line 27
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KDFFeedbackParameters;->getR()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    div-int/lit8 v1, v0, 0x8

    .line 32
    .line 33
    new-array v1, v1, [B

    .line 34
    .line 35
    iput-object v1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->ios:[B

    .line 36
    .line 37
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KDFFeedbackParameters;->useCounter()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const v2, 0x7fffffff

    .line 42
    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    sget-object v1, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->TWO:Ljava/math/BigInteger;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget v1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->h:I

    .line 53
    .line 54
    int-to-long v3, v1

    .line 55
    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sget-object v1, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->INTEGER_MAX:Ljava/math/BigInteger;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    const/4 v3, 0x1

    .line 70
    if-ne v1, v3, :cond_0

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    :goto_0
    iput v2, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->maxSizeExcl:I

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    iput v2, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->maxSizeExcl:I

    .line 81
    .line 82
    :goto_1
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KDFFeedbackParameters;->getIV()[B

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iput-object v0, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->iv:[B

    .line 87
    .line 88
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KDFFeedbackParameters;->useCounter()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput-boolean p1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->useCounter:Z

    .line 93
    .line 94
    const/4 p1, 0x0

    .line 95
    iput p1, p0, Lorg/spongycastle/crypto/generators/KDFFeedbackBytesGenerator;->generatedBytes:I

    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    const-string p0, "Wrong type of arguments given"

    .line 99
    .line 100
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method
