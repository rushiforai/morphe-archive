.class public Ll/rd1;
.super Ll/bc1;
.source "SourceFile"


# instance fields
.field private d:Ljava/nio/ByteBuffer;

.field private e:F

.field private f:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bc1;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/rd1;->e:F

    .line 7
    .line 8
    return-void
.end method

.method private e(Ljava/nio/ByteBuffer;IF)Ljava/nio/ByteBuffer;
    .locals 6

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-eqz p2, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Ll/rd1;->f:[B

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    array-length v0, v0

    .line 10
    if-ge v0, p2, :cond_1

    .line 11
    .line 12
    :cond_0
    new-array v0, p2, [B

    .line 13
    .line 14
    iput-object v0, p0, Ll/rd1;->f:[B

    .line 15
    .line 16
    :cond_1
    iget-object p0, p0, Ll/rd1;->f:[B

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, p0, v0, p2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    :goto_0
    div-int/lit8 v1, p2, 0x2

    .line 23
    .line 24
    if-ge v0, v1, :cond_2

    .line 25
    .line 26
    mul-int/lit8 v1, v0, 0x2

    .line 27
    .line 28
    add-int/lit8 v2, v1, 0x1

    .line 29
    .line 30
    aget-byte v3, p0, v2

    .line 31
    .line 32
    aget-byte v4, p0, v1

    .line 33
    .line 34
    shl-int/lit8 v3, v3, 0x8

    .line 35
    .line 36
    const v5, 0xff00

    .line 37
    .line 38
    .line 39
    and-int/2addr v3, v5

    .line 40
    and-int/lit16 v4, v4, 0xff

    .line 41
    .line 42
    or-int/2addr v3, v4

    .line 43
    int-to-short v3, v3

    .line 44
    int-to-float v3, v3

    .line 45
    mul-float/2addr v3, p3

    .line 46
    float-to-int v3, v3

    .line 47
    int-to-short v3, v3

    .line 48
    int-to-float v3, v3

    .line 49
    float-to-int v3, v3

    .line 50
    int-to-short v3, v3

    .line 51
    shr-int/lit8 v4, v3, 0x8

    .line 52
    .line 53
    and-int/lit16 v4, v4, 0xff

    .line 54
    .line 55
    int-to-byte v4, v4

    .line 56
    aput-byte v4, p0, v2

    .line 57
    .line 58
    and-int/lit16 v2, v3, 0xff

    .line 59
    .line 60
    int-to-byte v2, v2

    .line 61
    aput-byte v2, p0, v1

    .line 62
    .line 63
    add-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 73
    .line 74
    .line 75
    return-object p1

    .line 76
    :cond_3
    const/4 p0, 0x0

    .line 77
    return-object p0
.end method


# virtual methods
.method public b(Ll/ad60;IJ)Ll/ad60;
    .locals 1

    .line 1
    iget-object p3, p0, Ll/rd1;->d:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-le p2, p3, :cond_1

    .line 10
    .line 11
    :cond_0
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    iput-object p3, p0, Ll/rd1;->d:Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    :cond_1
    invoke-virtual {p1}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    const/4 p4, 0x0

    .line 22
    invoke-virtual {p3, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/rd1;->d:Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p3, v0, p4, p2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Ll/rd1;->d:Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    invoke-virtual {p2, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Ll/rd1;->d:Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/nio/Buffer;->remaining()I

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    iget v0, p0, Ll/rd1;->e:F

    .line 46
    .line 47
    invoke-direct {p0, p2, p3, v0}, Ll/rd1;->e(Ljava/nio/ByteBuffer;IF)Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Ll/rd1;->d:Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    invoke-virtual {p2, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/rd1;->d:Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Ll/ad60;->e(Ljava/nio/ByteBuffer;)V

    .line 58
    .line 59
    .line 60
    return-object p1
.end method

.method public f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/rd1;->d:Ljava/nio/ByteBuffer;

    .line 3
    .line 4
    iput-object v0, p0, Ll/rd1;->f:[B

    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    iput v0, p0, Ll/rd1;->e:F

    .line 9
    .line 10
    return-void
.end method

.method public g(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/rd1;->e:F

    .line 2
    .line 3
    return-void
.end method
