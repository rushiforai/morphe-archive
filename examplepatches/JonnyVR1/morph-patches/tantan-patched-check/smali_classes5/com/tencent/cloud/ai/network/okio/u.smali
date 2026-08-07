.class public final Lcom/tencent/cloud/ai/network/okio/u;
.super Lcom/tencent/cloud/ai/network/okio/ByteString;
.source "SourceFile"


# instance fields
.field public final transient e:[[B

.field public final transient f:[I


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/e;I)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    .line 3
    .line 4
    .line 5
    iget-wide v1, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 6
    .line 7
    int-to-long v5, p2

    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    invoke-static/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    move v3, v2

    .line 17
    move v4, v3

    .line 18
    :goto_0
    if-ge v3, p2, :cond_1

    .line 19
    .line 20
    iget v5, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 21
    .line 22
    iget v6, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 23
    .line 24
    if-eq v5, v6, :cond_0

    .line 25
    .line 26
    sub-int/2addr v5, v6

    .line 27
    add-int/2addr v3, v5

    .line 28
    add-int/lit8 v4, v4, 0x1

    .line 29
    .line 30
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string p0, "s.limit == s.pos"

    .line 34
    .line 35
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    throw v0

    .line 39
    :cond_1
    new-array v0, v4, [[B

    .line 40
    .line 41
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 42
    .line 43
    mul-int/lit8 v4, v4, 0x2

    .line 44
    .line 45
    new-array v0, v4, [I

    .line 46
    .line 47
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 48
    .line 49
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 50
    .line 51
    move v0, v2

    .line 52
    :goto_1
    if-ge v2, p2, :cond_3

    .line 53
    .line 54
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 55
    .line 56
    iget-object v3, p1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 57
    .line 58
    aput-object v3, v1, v0

    .line 59
    .line 60
    iget v3, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 61
    .line 62
    iget v4, p1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 63
    .line 64
    sub-int/2addr v3, v4

    .line 65
    add-int/2addr v2, v3

    .line 66
    if-le v2, p2, :cond_2

    .line 67
    .line 68
    move v2, p2

    .line 69
    :cond_2
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 70
    .line 71
    aput v2, v3, v0

    .line 72
    .line 73
    array-length v1, v1

    .line 74
    add-int/2addr v1, v0

    .line 75
    aput v4, v3, v1

    .line 76
    .line 77
    const/4 v1, 0x1

    .line 78
    iput-boolean v1, p1, Lcom/tencent/cloud/ai/network/okio/s;->d:Z

    .line 79
    .line 80
    add-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    return-void
.end method


# virtual methods
.method public final a(I)I
    .locals 2

    .line 58
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    array-length p0, p0

    add-int/lit8 p1, p1, 0x1

    const/4 v1, 0x0

    invoke-static {v0, v1, p0, p1}, Ljava/util/Arrays;->binarySearch([IIII)I

    move-result p0

    if-ltz p0, :cond_0

    return p0

    :cond_0
    not-int p0, p0

    return p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/e;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 9
    .line 10
    add-int v4, v0, v1

    .line 11
    .line 12
    aget v7, v3, v4

    .line 13
    .line 14
    aget v3, v3, v1

    .line 15
    .line 16
    new-instance v5, Lcom/tencent/cloud/ai/network/okio/s;

    .line 17
    .line 18
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 19
    .line 20
    aget-object v6, v4, v1

    .line 21
    .line 22
    add-int v4, v7, v3

    .line 23
    .line 24
    sub-int v8, v4, v2

    .line 25
    .line 26
    const/4 v9, 0x1

    .line 27
    const/4 v10, 0x0

    .line 28
    invoke-direct/range {v5 .. v10}, Lcom/tencent/cloud/ai/network/okio/s;-><init>([BIIZZ)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 32
    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    iput-object v5, v5, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 36
    .line 37
    iput-object v5, v5, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 38
    .line 39
    iput-object v5, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_0
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 43
    .line 44
    invoke-virtual {v2, v5}, Lcom/tencent/cloud/ai/network/okio/s;->a(Lcom/tencent/cloud/ai/network/okio/s;)Lcom/tencent/cloud/ai/network/okio/s;

    .line 45
    .line 46
    .line 47
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    move v2, v3

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-wide v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 52
    .line 53
    int-to-long v2, v2

    .line 54
    add-long/2addr v0, v2

    .line 55
    iput-wide v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 56
    .line 57
    return-void
.end method

.method public a()[B
    .locals 0

    .line 59
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->toByteArray()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final b()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->toByteArray()[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public base64()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->base64()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public base64Url()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->base64Url()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    check-cast p1, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->size()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-ne v1, v3, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p0, v2, p1, v2, v1}, Lcom/tencent/cloud/ai/network/okio/u;->rangeEquals(ILcom/tencent/cloud/ai/network/okio/ByteString;II)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    return v0

    .line 33
    :cond_1
    return v2
.end method

.method public getByte(I)B
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 4
    .line 5
    array-length v1, v1

    .line 6
    add-int/lit8 v1, v1, -0x1

    .line 7
    .line 8
    aget v0, v0, v1

    .line 9
    .line 10
    int-to-long v1, v0

    .line 11
    int-to-long v3, p1

    .line 12
    const-wide/16 v5, 0x1

    .line 13
    .line 14
    invoke-static/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/u;->a(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 26
    .line 27
    add-int/lit8 v2, v0, -0x1

    .line 28
    .line 29
    aget v1, v1, v2

    .line 30
    .line 31
    :goto_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 32
    .line 33
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 34
    .line 35
    array-length v3, p0

    .line 36
    add-int/2addr v3, v0

    .line 37
    aget v2, v2, v3

    .line 38
    .line 39
    aget-object p0, p0, v0

    .line 40
    .line 41
    sub-int/2addr p1, v1

    .line 42
    add-int/2addr p1, v2

    .line 43
    aget-byte p0, p0, p1

    .line 44
    .line 45
    return p0
.end method

.method public hashCode()I
    .locals 8

    .line 1
    iget v0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->b:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 7
    .line 8
    array-length v0, v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    move v3, v2

    .line 12
    move v2, v1

    .line 13
    :goto_0
    if-ge v1, v0, :cond_2

    .line 14
    .line 15
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 16
    .line 17
    aget-object v4, v4, v1

    .line 18
    .line 19
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 20
    .line 21
    add-int v6, v0, v1

    .line 22
    .line 23
    aget v6, v5, v6

    .line 24
    .line 25
    aget v5, v5, v1

    .line 26
    .line 27
    sub-int v2, v5, v2

    .line 28
    .line 29
    add-int/2addr v2, v6

    .line 30
    :goto_1
    if-ge v6, v2, :cond_1

    .line 31
    .line 32
    mul-int/lit8 v3, v3, 0x1f

    .line 33
    .line 34
    aget-byte v7, v4, v6

    .line 35
    .line 36
    add-int/2addr v3, v7

    .line 37
    add-int/lit8 v6, v6, 0x1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    move v2, v5

    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iput v3, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->b:I

    .line 45
    .line 46
    return v3
.end method

.method public hex()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->hex()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hmacSha1(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->hmacSha1(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hmacSha256(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->hmacSha256(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public indexOf([BI)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/ByteString;->indexOf([BI)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public lastIndexOf([BI)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/ByteString;->lastIndexOf([BI)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public md5()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->md5()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public rangeEquals(ILcom/tencent/cloud/ai/network/okio/ByteString;II)Z
    .locals 7

    const/4 v0, 0x0

    if-ltz p1, :cond_4

    .line 74
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->size()I

    move-result v1

    sub-int/2addr v1, p4

    if-le p1, v1, :cond_0

    goto :goto_2

    .line 75
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/u;->a(I)I

    move-result v1

    :goto_0
    if-lez p4, :cond_3

    if-nez v1, :cond_1

    move v2, v0

    goto :goto_1

    .line 76
    :cond_1
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    add-int/lit8 v3, v1, -0x1

    aget v2, v2, v3

    .line 77
    :goto_1
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    aget v3, v3, v1

    sub-int/2addr v3, v2

    add-int/2addr v3, v2

    sub-int/2addr v3, p1

    .line 78
    invoke-static {p4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 79
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    array-length v6, v5

    add-int/2addr v6, v1

    aget v4, v4, v6

    sub-int v2, p1, v2

    add-int/2addr v2, v4

    .line 80
    aget-object v4, v5, v1

    invoke-virtual {p2, p3, v4, v2, v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->rangeEquals(I[BII)Z

    move-result v2

    if-nez v2, :cond_2

    return v0

    :cond_2
    add-int/2addr p1, v3

    add-int/2addr p3, v3

    sub-int/2addr p4, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    const/4 p0, 0x1

    return p0

    :cond_4
    :goto_2
    return v0
.end method

.method public rangeEquals(I[BII)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_4

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    sub-int/2addr v1, p4

    .line 9
    if-gt p1, v1, :cond_4

    .line 10
    .line 11
    if-ltz p3, :cond_4

    .line 12
    .line 13
    array-length v1, p2

    .line 14
    sub-int/2addr v1, p4

    .line 15
    if-le p3, v1, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/u;->a(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    :goto_0
    if-lez p4, :cond_3

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    move v2, v0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 29
    .line 30
    add-int/lit8 v3, v1, -0x1

    .line 31
    .line 32
    aget v2, v2, v3

    .line 33
    .line 34
    :goto_1
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 35
    .line 36
    aget v3, v3, v1

    .line 37
    .line 38
    sub-int/2addr v3, v2

    .line 39
    add-int/2addr v3, v2

    .line 40
    sub-int/2addr v3, p1

    .line 41
    invoke-static {p4, v3}, Ljava/lang/Math;->min(II)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 46
    .line 47
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 48
    .line 49
    array-length v6, v5

    .line 50
    add-int/2addr v6, v1

    .line 51
    aget v4, v4, v6

    .line 52
    .line 53
    sub-int v2, p1, v2

    .line 54
    .line 55
    add-int/2addr v2, v4

    .line 56
    aget-object v4, v5, v1

    .line 57
    .line 58
    invoke-static {v4, v2, p2, p3, v3}, Lcom/tencent/cloud/ai/network/okio/y;->a([BI[BII)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-nez v2, :cond_2

    .line 63
    .line 64
    return v0

    .line 65
    :cond_2
    add-int/2addr p1, v3

    .line 66
    add-int/2addr p3, v3

    .line 67
    sub-int/2addr p4, v3

    .line 68
    add-int/lit8 v1, v1, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    const/4 p0, 0x1

    .line 72
    return p0

    .line 73
    :cond_4
    :goto_2
    return v0
.end method

.method public sha1()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->sha1()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public sha256()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->sha256()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public size()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 4
    .line 5
    array-length p0, p0

    .line 6
    add-int/lit8 p0, p0, -0x1

    .line 7
    .line 8
    aget p0, v0, p0

    .line 9
    .line 10
    return p0
.end method

.method public string(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->string(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public substring(I)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->substring(I)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public substring(II)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 0

    .line 10
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/ByteString;->substring(II)Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public toAsciiLowercase()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->toAsciiLowercase()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public toAsciiUppercase()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->toAsciiUppercase()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public toByteArray()[B
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    add-int/lit8 v2, v2, -0x1

    .line 7
    .line 8
    aget v0, v0, v2

    .line 9
    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    array-length v1, v1

    .line 13
    const/4 v2, 0x0

    .line 14
    move v3, v2

    .line 15
    :goto_0
    if-ge v2, v1, :cond_0

    .line 16
    .line 17
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 18
    .line 19
    add-int v5, v1, v2

    .line 20
    .line 21
    aget v5, v4, v5

    .line 22
    .line 23
    aget v4, v4, v2

    .line 24
    .line 25
    iget-object v6, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 26
    .line 27
    aget-object v6, v6, v2

    .line 28
    .line 29
    sub-int v7, v4, v3

    .line 30
    .line 31
    invoke-static {v6, v5, v0, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 32
    .line 33
    .line 34
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    move v3, v4

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public utf8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/u;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->utf8()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public write(Ljava/io/OutputStream;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 4
    .line 5
    array-length v0, v0

    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/u;->f:[I

    .line 11
    .line 12
    add-int v4, v0, v1

    .line 13
    .line 14
    aget v4, v3, v4

    .line 15
    .line 16
    aget v3, v3, v1

    .line 17
    .line 18
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okio/u;->e:[[B

    .line 19
    .line 20
    aget-object v5, v5, v1

    .line 21
    .line 22
    sub-int v2, v3, v2

    .line 23
    .line 24
    invoke-virtual {p1, v5, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    move v2, v3

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void

    .line 32
    :cond_1
    const-string p0, "out == null"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
