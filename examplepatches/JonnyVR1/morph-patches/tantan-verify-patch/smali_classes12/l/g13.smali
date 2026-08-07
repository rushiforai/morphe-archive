.class public Ll/g13;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/nio/ByteBuffer;

.field b:I

.field c:I


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/g13;->a:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/g13;->b:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(I)I
    .locals 6

    .line 1
    iget-object v0, p0, Ll/g13;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    iget v1, p0, Ll/g13;->b:I

    .line 4
    .line 5
    iget v2, p0, Ll/g13;->c:I

    .line 6
    .line 7
    div-int/lit8 v2, v2, 0x8

    .line 8
    .line 9
    add-int/2addr v1, v2

    .line 10
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-gez v0, :cond_0

    .line 15
    .line 16
    add-int/lit16 v0, v0, 0x100

    .line 17
    .line 18
    :cond_0
    iget v1, p0, Ll/g13;->c:I

    .line 19
    .line 20
    rem-int/lit8 v2, v1, 0x8

    .line 21
    .line 22
    rsub-int/lit8 v2, v2, 0x8

    .line 23
    .line 24
    if-gt p1, v2, :cond_1

    .line 25
    .line 26
    rem-int/lit8 v3, v1, 0x8

    .line 27
    .line 28
    shl-int/2addr v0, v3

    .line 29
    and-int/lit16 v0, v0, 0xff

    .line 30
    .line 31
    rem-int/lit8 v3, v1, 0x8

    .line 32
    .line 33
    sub-int/2addr v2, p1

    .line 34
    add-int/2addr v3, v2

    .line 35
    shr-int/2addr v0, v3

    .line 36
    add-int/2addr v1, p1

    .line 37
    iput v1, p0, Ll/g13;->c:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    sub-int/2addr p1, v2

    .line 41
    invoke-virtual {p0, v2}, Ll/g13;->a(I)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    shl-int/2addr v0, p1

    .line 46
    invoke-virtual {p0, p1}, Ll/g13;->a(I)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    add-int/2addr v0, p1

    .line 51
    :goto_0
    iget-object p1, p0, Ll/g13;->a:Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    iget v1, p0, Ll/g13;->b:I

    .line 54
    .line 55
    iget p0, p0, Ll/g13;->c:I

    .line 56
    .line 57
    int-to-double v2, p0

    .line 58
    const-wide/high16 v4, 0x4020000000000000L    # 8.0

    .line 59
    .line 60
    div-double/2addr v2, v4

    .line 61
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 62
    .line 63
    .line 64
    move-result-wide v2

    .line 65
    double-to-int p0, v2

    .line 66
    add-int/2addr v1, p0

    .line 67
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 68
    .line 69
    .line 70
    return v0
.end method

.method public b()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/g13;->a(I)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public c()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g13;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x8

    .line 8
    .line 9
    iget p0, p0, Ll/g13;->c:I

    .line 10
    .line 11
    sub-int/2addr v0, p0

    .line 12
    return v0
.end method
