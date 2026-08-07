.class public Ll/vwd0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:B

.field private b:B

.field private c:B

.field private d:B

.field private e:B

.field private f:B

.field private g:Z

.field private h:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/y0q;->k(Ljava/nio/ByteBuffer;)J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    const-wide/32 v2, -0x10000000

    .line 9
    .line 10
    .line 11
    and-long/2addr v2, v0

    .line 12
    const/16 p1, 0x1c

    .line 13
    .line 14
    shr-long/2addr v2, p1

    .line 15
    long-to-int p1, v2

    .line 16
    int-to-byte p1, p1

    .line 17
    iput-byte p1, p0, Ll/vwd0;->a:B

    .line 18
    .line 19
    const-wide/32 v2, 0xc000000

    .line 20
    .line 21
    .line 22
    and-long/2addr v2, v0

    .line 23
    const/16 p1, 0x1a

    .line 24
    .line 25
    shr-long/2addr v2, p1

    .line 26
    long-to-int p1, v2

    .line 27
    int-to-byte p1, p1

    .line 28
    iput-byte p1, p0, Ll/vwd0;->b:B

    .line 29
    .line 30
    const-wide/32 v2, 0x3000000

    .line 31
    .line 32
    .line 33
    and-long/2addr v2, v0

    .line 34
    const/16 p1, 0x18

    .line 35
    .line 36
    shr-long/2addr v2, p1

    .line 37
    long-to-int p1, v2

    .line 38
    int-to-byte p1, p1

    .line 39
    iput-byte p1, p0, Ll/vwd0;->c:B

    .line 40
    .line 41
    const-wide/32 v2, 0xc00000

    .line 42
    .line 43
    .line 44
    and-long/2addr v2, v0

    .line 45
    const/16 p1, 0x16

    .line 46
    .line 47
    shr-long/2addr v2, p1

    .line 48
    long-to-int p1, v2

    .line 49
    int-to-byte p1, p1

    .line 50
    iput-byte p1, p0, Ll/vwd0;->d:B

    .line 51
    .line 52
    const-wide/32 v2, 0x300000

    .line 53
    .line 54
    .line 55
    and-long/2addr v2, v0

    .line 56
    const/16 p1, 0x14

    .line 57
    .line 58
    shr-long/2addr v2, p1

    .line 59
    long-to-int p1, v2

    .line 60
    int-to-byte p1, p1

    .line 61
    iput-byte p1, p0, Ll/vwd0;->e:B

    .line 62
    .line 63
    const-wide/32 v2, 0xe0000

    .line 64
    .line 65
    .line 66
    and-long/2addr v2, v0

    .line 67
    const/16 p1, 0x11

    .line 68
    .line 69
    shr-long/2addr v2, p1

    .line 70
    long-to-int p1, v2

    .line 71
    int-to-byte p1, p1

    .line 72
    iput-byte p1, p0, Ll/vwd0;->f:B

    .line 73
    .line 74
    const-wide/32 v2, 0x10000

    .line 75
    .line 76
    .line 77
    and-long/2addr v2, v0

    .line 78
    const/16 p1, 0x10

    .line 79
    .line 80
    shr-long/2addr v2, p1

    .line 81
    const-wide/16 v4, 0x0

    .line 82
    .line 83
    cmp-long p1, v2, v4

    .line 84
    .line 85
    if-lez p1, :cond_0

    .line 86
    .line 87
    const/4 p1, 0x1

    .line 88
    goto :goto_0

    .line 89
    :cond_0
    const/4 p1, 0x0

    .line 90
    :goto_0
    iput-boolean p1, p0, Ll/vwd0;->g:Z

    .line 91
    .line 92
    const-wide/32 v2, 0xffff

    .line 93
    .line 94
    .line 95
    and-long/2addr v0, v2

    .line 96
    long-to-int p1, v0

    .line 97
    iput p1, p0, Ll/vwd0;->h:I

    .line 98
    .line 99
    return-void
.end method


# virtual methods
.method public a(Ljava/nio/ByteBuffer;)V
    .locals 4

    .line 1
    iget-byte v0, p0, Ll/vwd0;->a:B

    .line 2
    .line 3
    shl-int/lit8 v0, v0, 0x1c

    .line 4
    .line 5
    int-to-long v0, v0

    .line 6
    iget-byte v2, p0, Ll/vwd0;->b:B

    .line 7
    .line 8
    shl-int/lit8 v2, v2, 0x1a

    .line 9
    .line 10
    int-to-long v2, v2

    .line 11
    or-long/2addr v0, v2

    .line 12
    iget-byte v2, p0, Ll/vwd0;->c:B

    .line 13
    .line 14
    shl-int/lit8 v2, v2, 0x18

    .line 15
    .line 16
    int-to-long v2, v2

    .line 17
    or-long/2addr v0, v2

    .line 18
    iget-byte v2, p0, Ll/vwd0;->d:B

    .line 19
    .line 20
    shl-int/lit8 v2, v2, 0x16

    .line 21
    .line 22
    int-to-long v2, v2

    .line 23
    or-long/2addr v0, v2

    .line 24
    iget-byte v2, p0, Ll/vwd0;->e:B

    .line 25
    .line 26
    shl-int/lit8 v2, v2, 0x14

    .line 27
    .line 28
    int-to-long v2, v2

    .line 29
    or-long/2addr v0, v2

    .line 30
    iget-byte v2, p0, Ll/vwd0;->f:B

    .line 31
    .line 32
    shl-int/lit8 v2, v2, 0x11

    .line 33
    .line 34
    int-to-long v2, v2

    .line 35
    or-long/2addr v0, v2

    .line 36
    iget-boolean v2, p0, Ll/vwd0;->g:Z

    .line 37
    .line 38
    shl-int/lit8 v2, v2, 0x10

    .line 39
    .line 40
    int-to-long v2, v2

    .line 41
    or-long/2addr v0, v2

    .line 42
    iget p0, p0, Ll/vwd0;->h:I

    .line 43
    .line 44
    int-to-long v2, p0

    .line 45
    or-long/2addr v0, v2

    .line 46
    invoke-static {p1, v0, v1}, Ll/b1q;->g(Ljava/nio/ByteBuffer;J)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_a

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Ll/vwd0;

    .line 20
    .line 21
    iget-byte v2, p0, Ll/vwd0;->b:B

    .line 22
    .line 23
    iget-byte v3, p1, Ll/vwd0;->b:B

    .line 24
    .line 25
    if-eq v2, v3, :cond_2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_2
    iget-byte v2, p0, Ll/vwd0;->a:B

    .line 29
    .line 30
    iget-byte v3, p1, Ll/vwd0;->a:B

    .line 31
    .line 32
    if-eq v2, v3, :cond_3

    .line 33
    .line 34
    return v1

    .line 35
    :cond_3
    iget v2, p0, Ll/vwd0;->h:I

    .line 36
    .line 37
    iget v3, p1, Ll/vwd0;->h:I

    .line 38
    .line 39
    if-eq v2, v3, :cond_4

    .line 40
    .line 41
    return v1

    .line 42
    :cond_4
    iget-byte v2, p0, Ll/vwd0;->c:B

    .line 43
    .line 44
    iget-byte v3, p1, Ll/vwd0;->c:B

    .line 45
    .line 46
    if-eq v2, v3, :cond_5

    .line 47
    .line 48
    return v1

    .line 49
    :cond_5
    iget-byte v2, p0, Ll/vwd0;->e:B

    .line 50
    .line 51
    iget-byte v3, p1, Ll/vwd0;->e:B

    .line 52
    .line 53
    if-eq v2, v3, :cond_6

    .line 54
    .line 55
    return v1

    .line 56
    :cond_6
    iget-byte v2, p0, Ll/vwd0;->d:B

    .line 57
    .line 58
    iget-byte v3, p1, Ll/vwd0;->d:B

    .line 59
    .line 60
    if-eq v2, v3, :cond_7

    .line 61
    .line 62
    return v1

    .line 63
    :cond_7
    iget-boolean v2, p0, Ll/vwd0;->g:Z

    .line 64
    .line 65
    iget-boolean v3, p1, Ll/vwd0;->g:Z

    .line 66
    .line 67
    if-eq v2, v3, :cond_8

    .line 68
    .line 69
    return v1

    .line 70
    :cond_8
    iget-byte p0, p0, Ll/vwd0;->f:B

    .line 71
    .line 72
    iget-byte p1, p1, Ll/vwd0;->f:B

    .line 73
    .line 74
    if-eq p0, p1, :cond_9

    .line 75
    .line 76
    return v1

    .line 77
    :cond_9
    return v0

    .line 78
    :cond_a
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-byte v0, p0, Ll/vwd0;->a:B

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget-byte v1, p0, Ll/vwd0;->b:B

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    mul-int/lit8 v0, v0, 0x1f

    .line 9
    .line 10
    iget-byte v1, p0, Ll/vwd0;->c:B

    .line 11
    .line 12
    add-int/2addr v0, v1

    .line 13
    mul-int/lit8 v0, v0, 0x1f

    .line 14
    .line 15
    iget-byte v1, p0, Ll/vwd0;->d:B

    .line 16
    .line 17
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x1f

    .line 19
    .line 20
    iget-byte v1, p0, Ll/vwd0;->e:B

    .line 21
    .line 22
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x1f

    .line 24
    .line 25
    iget-byte v1, p0, Ll/vwd0;->f:B

    .line 26
    .line 27
    add-int/2addr v0, v1

    .line 28
    mul-int/lit8 v0, v0, 0x1f

    .line 29
    .line 30
    iget-boolean v1, p0, Ll/vwd0;->g:Z

    .line 31
    .line 32
    add-int/2addr v0, v1

    .line 33
    mul-int/lit8 v0, v0, 0x1f

    .line 34
    .line 35
    iget p0, p0, Ll/vwd0;->h:I

    .line 36
    .line 37
    add-int/2addr v0, p0

    .line 38
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SampleFlags{reserved="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-byte v1, p0, Ll/vwd0;->a:B

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", isLeading="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-byte v1, p0, Ll/vwd0;->b:B

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", depOn="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-byte v1, p0, Ll/vwd0;->c:B

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", isDepOn="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-byte v1, p0, Ll/vwd0;->d:B

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", hasRedundancy="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-byte v1, p0, Ll/vwd0;->e:B

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", padValue="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-byte v1, p0, Ll/vwd0;->f:B

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", isDiffSample="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean v1, p0, Ll/vwd0;->g:Z

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", degradPrio="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget p0, p0, Ll/vwd0;->h:I

    .line 79
    .line 80
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const/16 p0, 0x7d

    .line 84
    .line 85
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method
