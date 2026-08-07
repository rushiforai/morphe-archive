.class public Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private A:[[S

.field x:[S


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private computeZerosAbove()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    add-int/lit8 v0, v0, -0x1

    .line 5
    .line 6
    :goto_0
    if-lez v0, :cond_3

    .line 7
    .line 8
    add-int/lit8 v1, v0, -0x1

    .line 9
    .line 10
    :goto_1
    if-ltz v1, :cond_2

    .line 11
    .line 12
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 13
    .line 14
    aget-object v3, v2, v1

    .line 15
    .line 16
    aget-short v3, v3, v0

    .line 17
    .line 18
    aget-object v2, v2, v0

    .line 19
    .line 20
    aget-short v2, v2, v0

    .line 21
    .line 22
    invoke-static {v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->invElem(S)S

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    move v4, v0

    .line 29
    :goto_2
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 30
    .line 31
    array-length v6, v5

    .line 32
    mul-int/lit8 v6, v6, 0x2

    .line 33
    .line 34
    if-ge v4, v6, :cond_0

    .line 35
    .line 36
    aget-object v5, v5, v0

    .line 37
    .line 38
    aget-short v5, v5, v4

    .line 39
    .line 40
    invoke-static {v5, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    invoke-static {v3, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 49
    .line 50
    aget-object v6, v6, v1

    .line 51
    .line 52
    aget-short v7, v6, v4

    .line 53
    .line 54
    invoke-static {v7, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    aput-short v5, v6, v4

    .line 59
    .line 60
    add-int/lit8 v4, v4, 0x1

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    const-string p0, "The matrix is not invertible"

    .line 67
    .line 68
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    add-int/lit8 v0, v0, -0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    return-void
.end method

.method private computeZerosUnder(Z)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    array-length p1, v0

    .line 6
    mul-int/lit8 p1, p1, 0x2

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    array-length p1, v0

    .line 10
    add-int/lit8 p1, p1, 0x1

    .line 11
    .line 12
    :goto_0
    const/4 v0, 0x0

    .line 13
    :goto_1
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 14
    .line 15
    array-length v1, v1

    .line 16
    add-int/lit8 v1, v1, -0x1

    .line 17
    .line 18
    if-ge v0, v1, :cond_4

    .line 19
    .line 20
    add-int/lit8 v1, v0, 0x1

    .line 21
    .line 22
    move v2, v1

    .line 23
    :goto_2
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 24
    .line 25
    array-length v4, v3

    .line 26
    if-ge v2, v4, :cond_3

    .line 27
    .line 28
    aget-object v4, v3, v2

    .line 29
    .line 30
    aget-short v4, v4, v0

    .line 31
    .line 32
    aget-object v3, v3, v0

    .line 33
    .line 34
    aget-short v3, v3, v0

    .line 35
    .line 36
    invoke-static {v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->invElem(S)S

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_2

    .line 41
    .line 42
    move v5, v0

    .line 43
    :goto_3
    if-ge v5, p1, :cond_1

    .line 44
    .line 45
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 46
    .line 47
    aget-object v6, v6, v0

    .line 48
    .line 49
    aget-short v6, v6, v5

    .line 50
    .line 51
    invoke-static {v6, v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    invoke-static {v4, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    iget-object v7, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 60
    .line 61
    aget-object v7, v7, v2

    .line 62
    .line 63
    aget-short v8, v7, v5

    .line 64
    .line 65
    invoke-static {v8, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    aput-short v6, v7, v5

    .line 70
    .line 71
    add-int/lit8 v5, v5, 0x1

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    const-string p0, "Matrix not invertible! We have to choose another one!"

    .line 78
    .line 79
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    move v0, v1

    .line 84
    goto :goto_1

    .line 85
    :cond_4
    return-void
.end method

.method private substitute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    add-int/lit8 v1, v1, -0x1

    .line 5
    .line 6
    aget-object v1, v0, v1

    .line 7
    .line 8
    array-length v0, v0

    .line 9
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    aget-short v0, v1, v0

    .line 12
    .line 13
    invoke-static {v0}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->invElem(S)S

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->x:[S

    .line 20
    .line 21
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 22
    .line 23
    array-length v3, v2

    .line 24
    add-int/lit8 v3, v3, -0x1

    .line 25
    .line 26
    array-length v4, v2

    .line 27
    add-int/lit8 v4, v4, -0x1

    .line 28
    .line 29
    aget-object v4, v2, v4

    .line 30
    .line 31
    array-length v2, v2

    .line 32
    aget-short v2, v4, v2

    .line 33
    .line 34
    invoke-static {v2, v0}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    aput-short v0, v1, v3

    .line 39
    .line 40
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 41
    .line 42
    array-length v0, v0

    .line 43
    add-int/lit8 v0, v0, -0x2

    .line 44
    .line 45
    :goto_0
    if-ltz v0, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 48
    .line 49
    aget-object v2, v1, v0

    .line 50
    .line 51
    array-length v3, v1

    .line 52
    aget-short v2, v2, v3

    .line 53
    .line 54
    array-length v1, v1

    .line 55
    add-int/lit8 v1, v1, -0x1

    .line 56
    .line 57
    :goto_1
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 58
    .line 59
    if-le v1, v0, :cond_0

    .line 60
    .line 61
    aget-object v3, v3, v0

    .line 62
    .line 63
    aget-short v3, v3, v1

    .line 64
    .line 65
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->x:[S

    .line 66
    .line 67
    aget-short v4, v4, v1

    .line 68
    .line 69
    invoke-static {v3, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    invoke-static {v2, v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    add-int/lit8 v1, v1, -0x1

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_0
    aget-object v1, v3, v0

    .line 81
    .line 82
    aget-short v1, v1, v0

    .line 83
    .line 84
    invoke-static {v1}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->invElem(S)S

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_1

    .line 89
    .line 90
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->x:[S

    .line 91
    .line 92
    invoke-static {v2, v1}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    aput-short v1, v3, v0

    .line 97
    .line 98
    add-int/lit8 v0, v0, -0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    const-string p0, "Not solvable equation system"

    .line 102
    .line 103
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    return-void

    .line 107
    :cond_3
    const-string p0, "The equation system is not solvable"

    .line 108
    .line 109
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method


# virtual methods
.method public addSquareMatrix([[S[[S)[[S
    .locals 6

    .line 1
    array-length p0, p1

    .line 2
    array-length v0, p2

    .line 3
    if-ne p0, v0, :cond_2

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    aget-object v0, p1, p0

    .line 7
    .line 8
    array-length v0, v0

    .line 9
    aget-object v1, p2, p0

    .line 10
    .line 11
    array-length v1, v1

    .line 12
    if-ne v0, v1, :cond_2

    .line 13
    .line 14
    array-length v0, p1

    .line 15
    array-length v1, p1

    .line 16
    const/4 v2, 0x2

    .line 17
    new-array v2, v2, [I

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    aput v1, v2, v3

    .line 21
    .line 22
    aput v0, v2, p0

    .line 23
    .line 24
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 25
    .line 26
    invoke-static {v0, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, [[S

    .line 31
    .line 32
    move v1, p0

    .line 33
    :goto_0
    array-length v2, p1

    .line 34
    if-ge v1, v2, :cond_1

    .line 35
    .line 36
    move v2, p0

    .line 37
    :goto_1
    array-length v3, p2

    .line 38
    if-ge v2, v3, :cond_0

    .line 39
    .line 40
    aget-object v3, v0, v1

    .line 41
    .line 42
    aget-object v4, p1, v1

    .line 43
    .line 44
    aget-short v4, v4, v2

    .line 45
    .line 46
    aget-object v5, p2, v1

    .line 47
    .line 48
    aget-short v5, v5, v2

    .line 49
    .line 50
    invoke-static {v4, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    aput-short v4, v3, v2

    .line 55
    .line 56
    add-int/lit8 v2, v2, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return-object v0

    .line 63
    :cond_2
    const-string p0, "Addition is not possible!"

    .line 64
    .line 65
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const/4 p0, 0x0

    .line 69
    return-object p0
.end method

.method public addVect([S[S)[S
    .locals 4

    .line 1
    array-length p0, p1

    .line 2
    array-length v0, p2

    .line 3
    if-ne p0, v0, :cond_1

    .line 4
    .line 5
    array-length p0, p1

    .line 6
    new-array v0, p0, [S

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, p0, :cond_0

    .line 10
    .line 11
    aget-short v2, p1, v1

    .line 12
    .line 13
    aget-short v3, p2, v1

    .line 14
    .line 15
    invoke-static {v2, v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    aput-short v2, v0, v1

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-object v0

    .line 25
    :cond_1
    const-string p0, "Multiplication is not possible!"

    .line 26
    .line 27
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public inverse([[S)[[S
    .locals 8

    .line 1
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 2
    .line 3
    :try_start_0
    array-length v1, p1

    .line 4
    array-length v2, p1

    .line 5
    const/4 v3, 0x2

    .line 6
    mul-int/2addr v2, v3

    .line 7
    new-array v4, v3, [I

    .line 8
    .line 9
    const/4 v5, 0x1

    .line 10
    aput v2, v4, v5

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    aput v1, v4, v2

    .line 14
    .line 15
    invoke-static {v0, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, [[S

    .line 20
    .line 21
    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 22
    .line 23
    array-length v1, p1

    .line 24
    aget-object v4, p1, v2

    .line 25
    .line 26
    array-length v4, v4

    .line 27
    if-ne v1, v4, :cond_7

    .line 28
    .line 29
    move v1, v2

    .line 30
    :goto_0
    array-length v4, p1

    .line 31
    if-ge v1, v4, :cond_2

    .line 32
    .line 33
    move v4, v2

    .line 34
    :goto_1
    array-length v6, p1

    .line 35
    if-ge v4, v6, :cond_0

    .line 36
    .line 37
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 38
    .line 39
    aget-object v6, v6, v1

    .line 40
    .line 41
    aget-object v7, p1, v1

    .line 42
    .line 43
    aget-short v7, v7, v4

    .line 44
    .line 45
    aput-short v7, v6, v4

    .line 46
    .line 47
    add-int/lit8 v4, v4, 0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    array-length v4, p1

    .line 51
    :goto_2
    array-length v6, p1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    mul-int/2addr v6, v3

    .line 53
    iget-object v7, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 54
    .line 55
    if-ge v4, v6, :cond_1

    .line 56
    .line 57
    :try_start_1
    aget-object v6, v7, v1

    .line 58
    .line 59
    aput-short v2, v6, v4

    .line 60
    .line 61
    add-int/lit8 v4, v4, 0x1

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_1
    aget-object v4, v7, v1

    .line 65
    .line 66
    array-length v6, v7

    .line 67
    add-int/2addr v6, v1

    .line 68
    aput-short v5, v4, v6

    .line 69
    .line 70
    add-int/lit8 v1, v1, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    invoke-direct {p0, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->computeZerosUnder(Z)V

    .line 74
    .line 75
    .line 76
    move p1, v2

    .line 77
    :goto_3
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 78
    .line 79
    array-length v4, v1

    .line 80
    if-ge p1, v4, :cond_4

    .line 81
    .line 82
    aget-object v1, v1, p1

    .line 83
    .line 84
    aget-short v1, v1, p1

    .line 85
    .line 86
    invoke-static {v1}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->invElem(S)S

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    move v4, p1

    .line 91
    :goto_4
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 92
    .line 93
    array-length v7, v6

    .line 94
    mul-int/2addr v7, v3

    .line 95
    if-ge v4, v7, :cond_3

    .line 96
    .line 97
    aget-object v6, v6, p1

    .line 98
    .line 99
    aget-short v7, v6, v4

    .line 100
    .line 101
    invoke-static {v7, v1}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 102
    .line 103
    .line 104
    move-result v7

    .line 105
    aput-short v7, v6, v4

    .line 106
    .line 107
    add-int/lit8 v4, v4, 0x1

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_3
    add-int/lit8 p1, p1, 0x1

    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_4
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->computeZerosAbove()V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 117
    .line 118
    array-length v1, p1

    .line 119
    array-length p1, p1

    .line 120
    new-array v4, v3, [I

    .line 121
    .line 122
    aput p1, v4, v5

    .line 123
    .line 124
    aput v1, v4, v2

    .line 125
    .line 126
    invoke-static {v0, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    check-cast p1, [[S

    .line 131
    .line 132
    :goto_5
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 133
    .line 134
    array-length v1, v0

    .line 135
    if-ge v2, v1, :cond_6

    .line 136
    .line 137
    array-length v0, v0

    .line 138
    :goto_6
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 139
    .line 140
    array-length v4, v1

    .line 141
    mul-int/2addr v4, v3

    .line 142
    if-ge v0, v4, :cond_5

    .line 143
    .line 144
    aget-object v4, p1, v2

    .line 145
    .line 146
    array-length v5, v1

    .line 147
    sub-int v5, v0, v5

    .line 148
    .line 149
    aget-object v1, v1, v2

    .line 150
    .line 151
    aget-short v1, v1, v0

    .line 152
    .line 153
    aput-short v1, v4, v5

    .line 154
    .line 155
    add-int/lit8 v0, v0, 0x1

    .line 156
    .line 157
    goto :goto_6

    .line 158
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 159
    .line 160
    goto :goto_5

    .line 161
    :cond_6
    return-object p1

    .line 162
    :cond_7
    new-instance p0, Ljava/lang/RuntimeException;

    .line 163
    .line 164
    const-string p1, "The matrix is not invertible. Please choose another one!"

    .line 165
    .line 166
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    throw p0
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 170
    :catch_0
    const/4 p0, 0x0

    .line 171
    return-object p0
.end method

.method public multMatrix(S[[S)[[S
    .locals 5

    .line 1
    array-length p0, p2

    .line 2
    const/4 v0, 0x0

    .line 3
    aget-object v1, p2, v0

    .line 4
    .line 5
    array-length v1, v1

    .line 6
    const/4 v2, 0x2

    .line 7
    new-array v2, v2, [I

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    aput v1, v2, v3

    .line 11
    .line 12
    aput p0, v2, v0

    .line 13
    .line 14
    sget-object p0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 15
    .line 16
    invoke-static {p0, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, [[S

    .line 21
    .line 22
    move v1, v0

    .line 23
    :goto_0
    array-length v2, p2

    .line 24
    if-ge v1, v2, :cond_1

    .line 25
    .line 26
    move v2, v0

    .line 27
    :goto_1
    aget-object v3, p2, v0

    .line 28
    .line 29
    array-length v3, v3

    .line 30
    if-ge v2, v3, :cond_0

    .line 31
    .line 32
    aget-object v3, p0, v1

    .line 33
    .line 34
    aget-object v4, p2, v1

    .line 35
    .line 36
    aget-short v4, v4, v2

    .line 37
    .line 38
    invoke-static {p1, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    aput-short v4, v3, v2

    .line 43
    .line 44
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-object p0
.end method

.method public multVect(S[S)[S
    .locals 3

    .line 1
    array-length p0, p2

    .line 2
    new-array v0, p0, [S

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, p0, :cond_0

    .line 6
    .line 7
    aget-short v2, p2, v1

    .line 8
    .line 9
    invoke-static {p1, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    aput-short v2, v0, v1

    .line 14
    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-object v0
.end method

.method public multVects([S[S)[[S
    .locals 6

    .line 1
    array-length p0, p1

    .line 2
    array-length v0, p2

    .line 3
    if-ne p0, v0, :cond_2

    .line 4
    .line 5
    array-length p0, p1

    .line 6
    array-length v0, p2

    .line 7
    const/4 v1, 0x2

    .line 8
    new-array v1, v1, [I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    aput v0, v1, v2

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    aput p0, v1, v0

    .line 15
    .line 16
    sget-object p0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 17
    .line 18
    invoke-static {p0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, [[S

    .line 23
    .line 24
    move v1, v0

    .line 25
    :goto_0
    array-length v2, p1

    .line 26
    if-ge v1, v2, :cond_1

    .line 27
    .line 28
    move v2, v0

    .line 29
    :goto_1
    array-length v3, p2

    .line 30
    if-ge v2, v3, :cond_0

    .line 31
    .line 32
    aget-object v3, p0, v1

    .line 33
    .line 34
    aget-short v4, p1, v1

    .line 35
    .line 36
    aget-short v5, p2, v2

    .line 37
    .line 38
    invoke-static {v4, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    aput-short v4, v3, v2

    .line 43
    .line 44
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-object p0

    .line 51
    :cond_2
    const-string p0, "Multiplication is not possible!"

    .line 52
    .line 53
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return-object p0
.end method

.method public multiplyMatrix([[S[S)[S
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    const/4 p0, 0x0

    .line 87
    aget-object v0, p1, p0

    array-length v0, v0

    array-length v1, p2

    if-ne v0, v1, :cond_2

    .line 88
    array-length v0, p1

    new-array v0, v0, [S

    move v1, p0

    .line 89
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    move v2, p0

    .line 90
    :goto_1
    array-length v3, p2

    if-ge v2, v3, :cond_0

    .line 91
    aget-object v3, p1, v1

    aget-short v3, v3, v2

    aget-short v4, p2, v2

    invoke-static {v3, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    move-result v3

    .line 92
    aget-short v4, v0, v1

    invoke-static {v4, v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    move-result v3

    aput-short v3, v0, v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0

    .line 93
    :cond_2
    const-string p0, "Multiplication is not possible!"

    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public multiplyMatrix([[S[[S)[[S
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p1, v0

    .line 3
    .line 4
    array-length v1, v1

    .line 5
    array-length v2, p2

    .line 6
    if-ne v1, v2, :cond_3

    .line 7
    .line 8
    array-length v1, p1

    .line 9
    aget-object v2, p2, v0

    .line 10
    .line 11
    array-length v2, v2

    .line 12
    const/4 v3, 0x2

    .line 13
    new-array v3, v3, [I

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    aput v2, v3, v4

    .line 17
    .line 18
    aput v1, v3, v0

    .line 19
    .line 20
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    invoke-static {v1, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, [[S

    .line 27
    .line 28
    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 29
    .line 30
    move v1, v0

    .line 31
    :goto_0
    array-length v2, p1

    .line 32
    if-ge v1, v2, :cond_2

    .line 33
    .line 34
    move v2, v0

    .line 35
    :goto_1
    array-length v3, p2

    .line 36
    if-ge v2, v3, :cond_1

    .line 37
    .line 38
    move v3, v0

    .line 39
    :goto_2
    aget-object v4, p2, v0

    .line 40
    .line 41
    array-length v4, v4

    .line 42
    if-ge v3, v4, :cond_0

    .line 43
    .line 44
    aget-object v4, p1, v1

    .line 45
    .line 46
    aget-short v4, v4, v2

    .line 47
    .line 48
    aget-object v5, p2, v2

    .line 49
    .line 50
    aget-short v5, v5, v3

    .line 51
    .line 52
    invoke-static {v4, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 57
    .line 58
    aget-object v5, v5, v1

    .line 59
    .line 60
    aget-short v6, v5, v3

    .line 61
    .line 62
    invoke-static {v6, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    aput-short v4, v5, v3

    .line 67
    .line 68
    add-int/lit8 v3, v3, 0x1

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 78
    .line 79
    return-object p0

    .line 80
    :cond_3
    const-string p0, "Multiplication is not possible!"

    .line 81
    .line 82
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    const/4 p0, 0x0

    .line 86
    return-object p0
.end method

.method public solveEquation([[S[S)[S
    .locals 5

    .line 1
    :try_start_0
    array-length v0, p1

    .line 2
    array-length v1, p2

    .line 3
    if-ne v0, v1, :cond_3

    .line 4
    .line 5
    array-length v0, p1

    .line 6
    array-length v1, p1

    .line 7
    const/4 v2, 0x1

    .line 8
    add-int/2addr v1, v2

    .line 9
    const/4 v3, 0x2

    .line 10
    new-array v3, v3, [I

    .line 11
    .line 12
    aput v1, v3, v2

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    aput v0, v3, v1

    .line 16
    .line 17
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 18
    .line 19
    invoke-static {v0, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, [[S

    .line 24
    .line 25
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 26
    .line 27
    array-length v0, p1

    .line 28
    new-array v0, v0, [S

    .line 29
    .line 30
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->x:[S

    .line 31
    .line 32
    move v0, v1

    .line 33
    :goto_0
    array-length v2, p1

    .line 34
    if-ge v0, v2, :cond_1

    .line 35
    .line 36
    move v2, v1

    .line 37
    :goto_1
    aget-object v3, p1, v1

    .line 38
    .line 39
    array-length v3, v3

    .line 40
    if-ge v2, v3, :cond_0

    .line 41
    .line 42
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 43
    .line 44
    aget-object v3, v3, v0

    .line 45
    .line 46
    aget-object v4, p1, v0

    .line 47
    .line 48
    aget-short v4, v4, v2

    .line 49
    .line 50
    aput-short v4, v3, v2

    .line 51
    .line 52
    add-int/lit8 v2, v2, 0x1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    move p1, v1

    .line 59
    :goto_2
    array-length v0, p2

    .line 60
    if-ge p1, v0, :cond_2

    .line 61
    .line 62
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->A:[[S

    .line 63
    .line 64
    aget-object v0, v0, p1

    .line 65
    .line 66
    array-length v2, p2

    .line 67
    aget-short v3, p2, p1

    .line 68
    .line 69
    array-length v4, p2

    .line 70
    aget-short v4, v0, v4

    .line 71
    .line 72
    invoke-static {v3, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    aput-short v3, v0, v2

    .line 77
    .line 78
    add-int/lit8 p1, p1, 0x1

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_2
    invoke-direct {p0, v1}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->computeZerosUnder(Z)V

    .line 82
    .line 83
    .line 84
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->substitute()V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->x:[S

    .line 88
    .line 89
    return-object p0

    .line 90
    :cond_3
    new-instance p0, Ljava/lang/RuntimeException;

    .line 91
    .line 92
    const-string p1, "The equation system is not solvable"

    .line 93
    .line 94
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    throw p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    :catch_0
    const/4 p0, 0x0

    .line 99
    return-object p0
.end method
