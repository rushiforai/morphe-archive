.class public Lorg/spongycastle/math/raw/Interleave;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M32:J = 0x55555555L

.field private static final M64:J = 0x5555555555555555L


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

.method public static expand16to32(I)I
    .locals 1

    const v0, 0xffff

    and-int/2addr p0, v0

    shl-int/lit8 v0, p0, 0x8

    or-int/2addr p0, v0

    const v0, 0xff00ff

    and-int/2addr p0, v0

    shl-int/lit8 v0, p0, 0x4

    or-int/2addr p0, v0

    const v0, 0xf0f0f0f

    and-int/2addr p0, v0

    shl-int/lit8 v0, p0, 0x2

    or-int/2addr p0, v0

    const v0, 0x33333333

    and-int/2addr p0, v0

    shl-int/lit8 v0, p0, 0x1

    or-int/2addr p0, v0

    const v0, 0x55555555

    and-int/2addr p0, v0

    return p0
.end method

.method public static expand32to64(I)J
    .locals 6

    ushr-int/lit8 v0, p0, 0x8

    xor-int/2addr v0, p0

    const v1, 0xff00

    and-int/2addr v0, v1

    shl-int/lit8 v1, v0, 0x8

    xor-int/2addr v0, v1

    xor-int/2addr p0, v0

    ushr-int/lit8 v0, p0, 0x4

    xor-int/2addr v0, p0

    const v1, 0xf000f0

    and-int/2addr v0, v1

    shl-int/lit8 v1, v0, 0x4

    xor-int/2addr v0, v1

    xor-int/2addr p0, v0

    ushr-int/lit8 v0, p0, 0x2

    xor-int/2addr v0, p0

    const v1, 0xc0c0c0c

    and-int/2addr v0, v1

    shl-int/lit8 v1, v0, 0x2

    xor-int/2addr v0, v1

    xor-int/2addr p0, v0

    ushr-int/lit8 v0, p0, 0x1

    xor-int/2addr v0, p0

    const v1, 0x22222222

    and-int/2addr v0, v1

    shl-int/lit8 v1, v0, 0x1

    xor-int/2addr v0, v1

    xor-int/2addr p0, v0

    ushr-int/lit8 v0, p0, 0x1

    int-to-long v0, v0

    const-wide/32 v2, 0x55555555

    and-long/2addr v0, v2

    const/16 v4, 0x20

    shl-long/2addr v0, v4

    int-to-long v4, p0

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static expand64To128(J[JI)V
    .locals 5

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    ushr-long v1, p0, v0

    .line 4
    .line 5
    xor-long/2addr v1, p0

    .line 6
    const-wide v3, 0xffff0000L

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    and-long/2addr v1, v3

    .line 12
    shl-long v3, v1, v0

    .line 13
    .line 14
    xor-long v0, v1, v3

    .line 15
    .line 16
    xor-long/2addr p0, v0

    .line 17
    const/16 v0, 0x8

    .line 18
    .line 19
    ushr-long v1, p0, v0

    .line 20
    .line 21
    xor-long/2addr v1, p0

    .line 22
    const-wide v3, 0xff000000ff00L

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    and-long/2addr v1, v3

    .line 28
    shl-long v3, v1, v0

    .line 29
    .line 30
    xor-long v0, v1, v3

    .line 31
    .line 32
    xor-long/2addr p0, v0

    .line 33
    const/4 v0, 0x4

    .line 34
    ushr-long v1, p0, v0

    .line 35
    .line 36
    xor-long/2addr v1, p0

    .line 37
    const-wide v3, 0xf000f000f000f0L

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    and-long/2addr v1, v3

    .line 43
    shl-long v3, v1, v0

    .line 44
    .line 45
    xor-long v0, v1, v3

    .line 46
    .line 47
    xor-long/2addr p0, v0

    .line 48
    const/4 v0, 0x2

    .line 49
    ushr-long v1, p0, v0

    .line 50
    .line 51
    xor-long/2addr v1, p0

    .line 52
    const-wide v3, 0xc0c0c0c0c0c0c0cL

    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    and-long/2addr v1, v3

    .line 58
    shl-long v3, v1, v0

    .line 59
    .line 60
    xor-long v0, v1, v3

    .line 61
    .line 62
    xor-long/2addr p0, v0

    .line 63
    const/4 v0, 0x1

    .line 64
    ushr-long v1, p0, v0

    .line 65
    .line 66
    xor-long/2addr v1, p0

    .line 67
    const-wide v3, 0x2222222222222222L

    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    and-long/2addr v1, v3

    .line 73
    shl-long v3, v1, v0

    .line 74
    .line 75
    xor-long/2addr v1, v3

    .line 76
    xor-long/2addr p0, v1

    .line 77
    const-wide v1, 0x5555555555555555L    # 1.1945305291614955E103

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    and-long v3, p0, v1

    .line 83
    .line 84
    aput-wide v3, p2, p3

    .line 85
    .line 86
    add-int/2addr p3, v0

    .line 87
    ushr-long/2addr p0, v0

    .line 88
    and-long/2addr p0, v1

    .line 89
    aput-wide p0, p2, p3

    .line 90
    .line 91
    return-void
.end method

.method public static expand8to16(I)I
    .locals 1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 v0, p0, 0x4

    or-int/2addr p0, v0

    and-int/lit16 p0, p0, 0xf0f

    shl-int/lit8 v0, p0, 0x2

    or-int/2addr p0, v0

    and-int/lit16 p0, p0, 0x3333

    shl-int/lit8 v0, p0, 0x1

    or-int/2addr p0, v0

    and-int/lit16 p0, p0, 0x5555

    return p0
.end method

.method public static unshuffle(J)J
    .locals 5

    const/4 v0, 0x1

    ushr-long v1, p0, v0

    xor-long/2addr v1, p0

    const-wide v3, 0x2222222222222222L

    and-long/2addr v1, v3

    shl-long v3, v1, v0

    xor-long v0, v1, v3

    xor-long/2addr p0, v0

    const/4 v0, 0x2

    ushr-long v1, p0, v0

    xor-long/2addr v1, p0

    const-wide v3, 0xc0c0c0c0c0c0c0cL

    and-long/2addr v1, v3

    shl-long v3, v1, v0

    xor-long v0, v1, v3

    xor-long/2addr p0, v0

    const/4 v0, 0x4

    ushr-long v1, p0, v0

    xor-long/2addr v1, p0

    const-wide v3, 0xf000f000f000f0L

    and-long/2addr v1, v3

    shl-long v3, v1, v0

    xor-long v0, v1, v3

    xor-long/2addr p0, v0

    const/16 v0, 0x8

    ushr-long v1, p0, v0

    xor-long/2addr v1, p0

    const-wide v3, 0xff000000ff00L

    and-long/2addr v1, v3

    shl-long v3, v1, v0

    xor-long v0, v1, v3

    xor-long/2addr p0, v0

    const/16 v0, 0x10

    ushr-long v1, p0, v0

    xor-long/2addr v1, p0

    const-wide v3, 0xffff0000L

    and-long/2addr v1, v3

    shl-long v3, v1, v0

    xor-long v0, v1, v3

    xor-long/2addr p0, v0

    return-wide p0
.end method
