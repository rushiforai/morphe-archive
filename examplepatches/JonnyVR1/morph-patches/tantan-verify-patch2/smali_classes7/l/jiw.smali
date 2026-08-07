.class Ll/jiw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:[I

.field b:J

.field c:[B


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x40

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Ll/jiw;->c:[B

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, Ll/jiw;->b:J

    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    new-array v0, v0, [I

    .line 16
    .line 17
    iput-object v0, p0, Ll/jiw;->a:[I

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    const v1, 0x67452301

    .line 21
    .line 22
    .line 23
    aput v1, v0, p0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    const v1, -0x10325477

    .line 27
    .line 28
    .line 29
    aput v1, v0, p0

    .line 30
    .line 31
    const/4 p0, 0x2

    .line 32
    const v1, -0x67452302

    .line 33
    .line 34
    .line 35
    aput v1, v0, p0

    .line 36
    .line 37
    const/4 p0, 0x3

    .line 38
    const v1, 0x10325476

    .line 39
    .line 40
    .line 41
    aput v1, v0, p0

    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>(Ll/jiw;)V
    .locals 4

    .line 44
    invoke-direct {p0}, Ll/jiw;-><init>()V

    const/4 v0, 0x0

    move v1, v0

    .line 45
    :goto_0
    iget-object v2, p0, Ll/jiw;->c:[B

    array-length v3, v2

    if-ge v1, v3, :cond_0

    iget-object v3, p1, Ll/jiw;->c:[B

    aget-byte v3, v3, v1

    aput-byte v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 46
    :cond_0
    :goto_1
    iget-object v1, p0, Ll/jiw;->a:[I

    array-length v2, v1

    if-ge v0, v2, :cond_1

    iget-object v2, p1, Ll/jiw;->a:[I

    aget v2, v2, v0

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 47
    :cond_1
    iget-wide v0, p1, Ll/jiw;->b:J

    iput-wide v0, p0, Ll/jiw;->b:J

    return-void
.end method
