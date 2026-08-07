.class public final Ll/h13;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[B

.field public b:I

.field public c:I


# direct methods
.method public constructor <init>([B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/h13;->a:[B

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h13;->a:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    iget v1, p0, Ll/h13;->b:I

    .line 5
    .line 6
    sub-int/2addr v0, v1

    .line 7
    mul-int/lit8 v0, v0, 0x8

    .line 8
    .line 9
    iget p0, p0, Ll/h13;->c:I

    .line 10
    .line 11
    sub-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/h13;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/h13;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public d(I)I
    .locals 9

    .line 1
    if-lez p1, :cond_5

    .line 2
    .line 3
    const/16 v0, 0x20

    .line 4
    .line 5
    if-gt p1, v0, :cond_5

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-gt p1, v0, :cond_5

    .line 12
    .line 13
    iget v0, p0, Ll/h13;->c:I

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    const/16 v2, 0xff

    .line 17
    .line 18
    const/16 v3, 0x8

    .line 19
    .line 20
    if-lez v0, :cond_2

    .line 21
    .line 22
    rsub-int/lit8 v4, v0, 0x8

    .line 23
    .line 24
    if-ge p1, v4, :cond_0

    .line 25
    .line 26
    move v5, p1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v5, v4

    .line 29
    :goto_0
    sub-int/2addr v4, v5

    .line 30
    rsub-int/lit8 v6, v5, 0x8

    .line 31
    .line 32
    shr-int v6, v2, v6

    .line 33
    .line 34
    shl-int/2addr v6, v4

    .line 35
    iget-object v7, p0, Ll/h13;->a:[B

    .line 36
    .line 37
    iget v8, p0, Ll/h13;->b:I

    .line 38
    .line 39
    aget-byte v7, v7, v8

    .line 40
    .line 41
    and-int/2addr v6, v7

    .line 42
    shr-int v4, v6, v4

    .line 43
    .line 44
    sub-int/2addr p1, v5

    .line 45
    add-int/2addr v0, v5

    .line 46
    iput v0, p0, Ll/h13;->c:I

    .line 47
    .line 48
    if-ne v0, v3, :cond_1

    .line 49
    .line 50
    iput v1, p0, Ll/h13;->c:I

    .line 51
    .line 52
    add-int/lit8 v8, v8, 0x1

    .line 53
    .line 54
    iput v8, p0, Ll/h13;->b:I

    .line 55
    .line 56
    :cond_1
    move v1, v4

    .line 57
    :cond_2
    if-lez p1, :cond_4

    .line 58
    .line 59
    :goto_1
    if-lt p1, v3, :cond_3

    .line 60
    .line 61
    shl-int/lit8 v0, v1, 0x8

    .line 62
    .line 63
    iget-object v1, p0, Ll/h13;->a:[B

    .line 64
    .line 65
    iget v4, p0, Ll/h13;->b:I

    .line 66
    .line 67
    aget-byte v1, v1, v4

    .line 68
    .line 69
    and-int/2addr v1, v2

    .line 70
    or-int/2addr v1, v0

    .line 71
    add-int/lit8 v4, v4, 0x1

    .line 72
    .line 73
    iput v4, p0, Ll/h13;->b:I

    .line 74
    .line 75
    add-int/lit8 p1, p1, -0x8

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    if-lez p1, :cond_4

    .line 79
    .line 80
    rsub-int/lit8 v0, p1, 0x8

    .line 81
    .line 82
    shr-int/2addr v2, v0

    .line 83
    shl-int/2addr v2, v0

    .line 84
    shl-int/2addr v1, p1

    .line 85
    iget-object v3, p0, Ll/h13;->a:[B

    .line 86
    .line 87
    iget v4, p0, Ll/h13;->b:I

    .line 88
    .line 89
    aget-byte v3, v3, v4

    .line 90
    .line 91
    and-int/2addr v2, v3

    .line 92
    shr-int v0, v2, v0

    .line 93
    .line 94
    or-int/2addr v0, v1

    .line 95
    iget v1, p0, Ll/h13;->c:I

    .line 96
    .line 97
    add-int/2addr v1, p1

    .line 98
    iput v1, p0, Ll/h13;->c:I

    .line 99
    .line 100
    return v0

    .line 101
    :cond_4
    return v1

    .line 102
    :cond_5
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    const/4 p0, 0x0

    .line 110
    return p0
.end method
