.class public abstract Lcom/google/protobuf/CodedOutputStream$b;
.super Lcom/google/protobuf/CodedOutputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/CodedOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "b"
.end annotation


# instance fields
.field public final d:[B

.field public final e:I

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/CodedOutputStream;-><init>(Lcom/google/protobuf/CodedOutputStream$a;)V

    .line 3
    .line 4
    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x14

    .line 8
    .line 9
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    new-array p1, p1, [B

    .line 14
    .line 15
    iput-object p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->d:[B

    .line 16
    .line 17
    array-length p1, p1

    .line 18
    iput p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->e:I

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string p0, "bufferSize must be >= 0"

    .line 22
    .line 23
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    throw p0
.end method


# virtual methods
.method public final K0(B)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->d:[B

    .line 2
    .line 3
    iget v1, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 8
    .line 9
    aput-byte p1, v0, v1

    .line 10
    .line 11
    iget p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 12
    .line 13
    add-int/lit8 p1, p1, 0x1

    .line 14
    .line 15
    iput p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 16
    .line 17
    return-void
.end method

.method public final L0(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->d:[B

    .line 2
    .line 3
    iget v1, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 8
    .line 9
    and-int/lit16 v3, p1, 0xff

    .line 10
    .line 11
    int-to-byte v3, v3

    .line 12
    aput-byte v3, v0, v1

    .line 13
    .line 14
    add-int/lit8 v3, v1, 0x2

    .line 15
    .line 16
    iput v3, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 17
    .line 18
    shr-int/lit8 v4, p1, 0x8

    .line 19
    .line 20
    and-int/lit16 v4, v4, 0xff

    .line 21
    .line 22
    int-to-byte v4, v4

    .line 23
    aput-byte v4, v0, v2

    .line 24
    .line 25
    add-int/lit8 v2, v1, 0x3

    .line 26
    .line 27
    iput v2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 28
    .line 29
    shr-int/lit8 v4, p1, 0x10

    .line 30
    .line 31
    and-int/lit16 v4, v4, 0xff

    .line 32
    .line 33
    int-to-byte v4, v4

    .line 34
    aput-byte v4, v0, v3

    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x4

    .line 37
    .line 38
    iput v1, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 39
    .line 40
    shr-int/lit8 p1, p1, 0x18

    .line 41
    .line 42
    and-int/lit16 p1, p1, 0xff

    .line 43
    .line 44
    int-to-byte p1, p1

    .line 45
    aput-byte p1, v0, v2

    .line 46
    .line 47
    iget p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 48
    .line 49
    add-int/lit8 p1, p1, 0x4

    .line 50
    .line 51
    iput p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 52
    .line 53
    return-void
.end method

.method public final M0(J)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->d:[B

    .line 2
    .line 3
    iget v1, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 8
    .line 9
    const-wide/16 v3, 0xff

    .line 10
    .line 11
    and-long v5, p1, v3

    .line 12
    .line 13
    long-to-int v5, v5

    .line 14
    int-to-byte v5, v5

    .line 15
    aput-byte v5, v0, v1

    .line 16
    .line 17
    add-int/lit8 v5, v1, 0x2

    .line 18
    .line 19
    iput v5, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 20
    .line 21
    const/16 v6, 0x8

    .line 22
    .line 23
    shr-long v7, p1, v6

    .line 24
    .line 25
    and-long/2addr v7, v3

    .line 26
    long-to-int v7, v7

    .line 27
    int-to-byte v7, v7

    .line 28
    aput-byte v7, v0, v2

    .line 29
    .line 30
    add-int/lit8 v2, v1, 0x3

    .line 31
    .line 32
    iput v2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 33
    .line 34
    const/16 v7, 0x10

    .line 35
    .line 36
    shr-long v7, p1, v7

    .line 37
    .line 38
    and-long/2addr v7, v3

    .line 39
    long-to-int v7, v7

    .line 40
    int-to-byte v7, v7

    .line 41
    aput-byte v7, v0, v5

    .line 42
    .line 43
    add-int/lit8 v5, v1, 0x4

    .line 44
    .line 45
    iput v5, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 46
    .line 47
    const/16 v7, 0x18

    .line 48
    .line 49
    shr-long v7, p1, v7

    .line 50
    .line 51
    and-long/2addr v3, v7

    .line 52
    long-to-int v3, v3

    .line 53
    int-to-byte v3, v3

    .line 54
    aput-byte v3, v0, v2

    .line 55
    .line 56
    add-int/lit8 v2, v1, 0x5

    .line 57
    .line 58
    iput v2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 59
    .line 60
    const/16 v3, 0x20

    .line 61
    .line 62
    shr-long v3, p1, v3

    .line 63
    .line 64
    long-to-int v3, v3

    .line 65
    and-int/lit16 v3, v3, 0xff

    .line 66
    .line 67
    int-to-byte v3, v3

    .line 68
    aput-byte v3, v0, v5

    .line 69
    .line 70
    add-int/lit8 v3, v1, 0x6

    .line 71
    .line 72
    iput v3, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 73
    .line 74
    const/16 v4, 0x28

    .line 75
    .line 76
    shr-long v4, p1, v4

    .line 77
    .line 78
    long-to-int v4, v4

    .line 79
    and-int/lit16 v4, v4, 0xff

    .line 80
    .line 81
    int-to-byte v4, v4

    .line 82
    aput-byte v4, v0, v2

    .line 83
    .line 84
    add-int/lit8 v2, v1, 0x7

    .line 85
    .line 86
    iput v2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 87
    .line 88
    const/16 v4, 0x30

    .line 89
    .line 90
    shr-long v4, p1, v4

    .line 91
    .line 92
    long-to-int v4, v4

    .line 93
    and-int/lit16 v4, v4, 0xff

    .line 94
    .line 95
    int-to-byte v4, v4

    .line 96
    aput-byte v4, v0, v3

    .line 97
    .line 98
    add-int/2addr v1, v6

    .line 99
    iput v1, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 100
    .line 101
    const/16 v1, 0x38

    .line 102
    .line 103
    shr-long/2addr p1, v1

    .line 104
    long-to-int p1, p1

    .line 105
    and-int/lit16 p1, p1, 0xff

    .line 106
    .line 107
    int-to-byte p1, p1

    .line 108
    aput-byte p1, v0, v2

    .line 109
    .line 110
    iget p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 111
    .line 112
    add-int/2addr p1, v6

    .line 113
    iput p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 114
    .line 115
    return-void
.end method

.method public final N0(I)V
    .locals 2

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/protobuf/CodedOutputStream$b;->P0(I)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    int-to-long v0, p1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream$b;->Q0(J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final O0(II)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/google/protobuf/WireFormat;->c(II)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/protobuf/CodedOutputStream$b;->P0(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final P0(I)V
    .locals 8

    .line 1
    invoke-static {}, Lcom/google/protobuf/CodedOutputStream;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/google/protobuf/CodedOutputStream;->d()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget v2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 12
    .line 13
    int-to-long v2, v2

    .line 14
    add-long/2addr v0, v2

    .line 15
    move-wide v2, v0

    .line 16
    :goto_0
    and-int/lit8 v4, p1, -0x80

    .line 17
    .line 18
    iget-object v5, p0, Lcom/google/protobuf/CodedOutputStream$b;->d:[B

    .line 19
    .line 20
    const-wide/16 v6, 0x1

    .line 21
    .line 22
    if-nez v4, :cond_0

    .line 23
    .line 24
    add-long/2addr v6, v2

    .line 25
    int-to-byte p1, p1

    .line 26
    invoke-static {v5, v2, v3, p1}, Ll/kyj0;->m([BJB)V

    .line 27
    .line 28
    .line 29
    sub-long/2addr v6, v0

    .line 30
    long-to-int p1, v6

    .line 31
    iget v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 32
    .line 33
    add-int/2addr v0, p1

    .line 34
    iput v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 35
    .line 36
    iget v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 37
    .line 38
    add-int/2addr v0, p1

    .line 39
    iput v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    add-long/2addr v6, v2

    .line 43
    and-int/lit8 v4, p1, 0x7f

    .line 44
    .line 45
    or-int/lit16 v4, v4, 0x80

    .line 46
    .line 47
    int-to-byte v4, v4

    .line 48
    invoke-static {v5, v2, v3, v4}, Ll/kyj0;->m([BJB)V

    .line 49
    .line 50
    .line 51
    ushr-int/lit8 p1, p1, 0x7

    .line 52
    .line 53
    move-wide v2, v6

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    :goto_1
    and-int/lit8 v0, p1, -0x80

    .line 56
    .line 57
    iget-object v1, p0, Lcom/google/protobuf/CodedOutputStream$b;->d:[B

    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    iget v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 62
    .line 63
    add-int/lit8 v2, v0, 0x1

    .line 64
    .line 65
    iput v2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 66
    .line 67
    int-to-byte p1, p1

    .line 68
    aput-byte p1, v1, v0

    .line 69
    .line 70
    iget p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 71
    .line 72
    add-int/lit8 p1, p1, 0x1

    .line 73
    .line 74
    iput p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    iget v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 78
    .line 79
    add-int/lit8 v2, v0, 0x1

    .line 80
    .line 81
    iput v2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 82
    .line 83
    and-int/lit8 v2, p1, 0x7f

    .line 84
    .line 85
    or-int/lit16 v2, v2, 0x80

    .line 86
    .line 87
    int-to-byte v2, v2

    .line 88
    aput-byte v2, v1, v0

    .line 89
    .line 90
    iget v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 91
    .line 92
    add-int/lit8 v0, v0, 0x1

    .line 93
    .line 94
    iput v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 95
    .line 96
    ushr-int/lit8 p1, p1, 0x7

    .line 97
    .line 98
    goto :goto_1
.end method

.method public final Q0(J)V
    .locals 13

    .line 1
    invoke-static {}, Lcom/google/protobuf/CodedOutputStream;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x7

    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    const-wide/16 v4, -0x80

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/google/protobuf/CodedOutputStream;->d()J

    .line 13
    .line 14
    .line 15
    move-result-wide v6

    .line 16
    iget v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 17
    .line 18
    int-to-long v8, v0

    .line 19
    add-long/2addr v6, v8

    .line 20
    move-wide v8, v6

    .line 21
    :goto_0
    and-long v10, p1, v4

    .line 22
    .line 23
    cmp-long v0, v10, v2

    .line 24
    .line 25
    iget-object v10, p0, Lcom/google/protobuf/CodedOutputStream$b;->d:[B

    .line 26
    .line 27
    const-wide/16 v11, 0x1

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    add-long/2addr v11, v8

    .line 32
    long-to-int p1, p1

    .line 33
    int-to-byte p1, p1

    .line 34
    invoke-static {v10, v8, v9, p1}, Ll/kyj0;->m([BJB)V

    .line 35
    .line 36
    .line 37
    sub-long/2addr v11, v6

    .line 38
    long-to-int p1, v11

    .line 39
    iget p2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 40
    .line 41
    add-int/2addr p2, p1

    .line 42
    iput p2, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 43
    .line 44
    iget p2, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 45
    .line 46
    add-int/2addr p2, p1

    .line 47
    iput p2, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    add-long/2addr v11, v8

    .line 51
    long-to-int v0, p1

    .line 52
    and-int/lit8 v0, v0, 0x7f

    .line 53
    .line 54
    or-int/lit16 v0, v0, 0x80

    .line 55
    .line 56
    int-to-byte v0, v0

    .line 57
    invoke-static {v10, v8, v9, v0}, Ll/kyj0;->m([BJB)V

    .line 58
    .line 59
    .line 60
    ushr-long/2addr p1, v1

    .line 61
    move-wide v8, v11

    .line 62
    goto :goto_0

    .line 63
    :cond_1
    :goto_1
    and-long v6, p1, v4

    .line 64
    .line 65
    cmp-long v0, v6, v2

    .line 66
    .line 67
    iget-object v6, p0, Lcom/google/protobuf/CodedOutputStream$b;->d:[B

    .line 68
    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    iget v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 72
    .line 73
    add-int/lit8 v1, v0, 0x1

    .line 74
    .line 75
    iput v1, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 76
    .line 77
    long-to-int p1, p1

    .line 78
    int-to-byte p1, p1

    .line 79
    aput-byte p1, v6, v0

    .line 80
    .line 81
    iget p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 82
    .line 83
    add-int/lit8 p1, p1, 0x1

    .line 84
    .line 85
    iput p1, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    iget v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 89
    .line 90
    add-int/lit8 v7, v0, 0x1

    .line 91
    .line 92
    iput v7, p0, Lcom/google/protobuf/CodedOutputStream$b;->f:I

    .line 93
    .line 94
    long-to-int v7, p1

    .line 95
    and-int/lit8 v7, v7, 0x7f

    .line 96
    .line 97
    or-int/lit16 v7, v7, 0x80

    .line 98
    .line 99
    int-to-byte v7, v7

    .line 100
    aput-byte v7, v6, v0

    .line 101
    .line 102
    iget v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 103
    .line 104
    add-int/lit8 v0, v0, 0x1

    .line 105
    .line 106
    iput v0, p0, Lcom/google/protobuf/CodedOutputStream$b;->g:I

    .line 107
    .line 108
    ushr-long/2addr p1, v1

    .line 109
    goto :goto_1
.end method

.method public final Y()I
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v0, "spaceLeft() can only be called on CodedOutputStreams that are writing to a flat array or ByteBuffer."

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method
