.class public final Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final BYTE_1:I = 0x1

.field private static final BYTE_1_MASK:I = 0xff00

.field private static final BYTE_1_SHIFT:I = 0x8

.field private static final BYTE_2:I = 0x2

.field private static final BYTE_2_MASK:I = 0xff0000

.field private static final BYTE_2_SHIFT:I = 0x10

.field private static final BYTE_3:I = 0x3

.field private static final BYTE_3_MASK:J = 0xff000000L

.field private static final BYTE_3_SHIFT:I = 0x18

.field private static final BYTE_4:I = 0x4

.field private static final BYTE_4_MASK:J = 0xff00000000L

.field private static final BYTE_4_SHIFT:I = 0x20

.field private static final BYTE_5:I = 0x5

.field private static final BYTE_5_MASK:J = 0xff0000000000L

.field private static final BYTE_5_SHIFT:I = 0x28

.field private static final BYTE_6:I = 0x6

.field private static final BYTE_6_MASK:J = 0xff000000000000L

.field private static final BYTE_6_SHIFT:I = 0x30

.field private static final BYTE_7:I = 0x7

.field private static final BYTE_7_MASK:J = 0x7f00000000000000L

.field private static final BYTE_7_SHIFT:I = 0x38

.field private static final LEFTMOST_BIT:B = -0x80t

.field private static final LEFTMOST_BIT_SHIFT:I = 0x3f

.field public static final ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final value:Ljava/math/BigInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 14
    invoke-static {p1, p2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>(Ljava/math/BigInteger;)V

    return-void
.end method

.method public constructor <init>(Ljava/math/BigInteger;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->value:Ljava/math/BigInteger;

    return-void
.end method

.method public constructor <init>([B)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getValue([BI)Ljava/math/BigInteger;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->value:Ljava/math/BigInteger;

    .line 9
    .line 10
    return-void
.end method

.method public static getBytes(J)[B
    .locals 0

    .line 119
    invoke-static {p0, p1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object p0

    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(Ljava/math/BigInteger;)[B

    move-result-object p0

    return-object p0
.end method

.method public static getBytes(Ljava/math/BigInteger;)[B
    .locals 6

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/math/BigInteger;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const-wide/16 v4, 0xff

    .line 10
    .line 11
    and-long/2addr v4, v2

    .line 12
    long-to-int v4, v4

    .line 13
    int-to-byte v4, v4

    .line 14
    const/4 v5, 0x0

    .line 15
    aput-byte v4, v1, v5

    .line 16
    .line 17
    const-wide/32 v4, 0xff00

    .line 18
    .line 19
    .line 20
    and-long/2addr v4, v2

    .line 21
    shr-long/2addr v4, v0

    .line 22
    long-to-int v0, v4

    .line 23
    int-to-byte v0, v0

    .line 24
    const/4 v4, 0x1

    .line 25
    aput-byte v0, v1, v4

    .line 26
    .line 27
    const-wide/32 v4, 0xff0000

    .line 28
    .line 29
    .line 30
    and-long/2addr v4, v2

    .line 31
    const/16 v0, 0x10

    .line 32
    .line 33
    shr-long/2addr v4, v0

    .line 34
    long-to-int v0, v4

    .line 35
    int-to-byte v0, v0

    .line 36
    const/4 v4, 0x2

    .line 37
    aput-byte v0, v1, v4

    .line 38
    .line 39
    const-wide v4, 0xff000000L

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    and-long/2addr v4, v2

    .line 45
    const/16 v0, 0x18

    .line 46
    .line 47
    shr-long/2addr v4, v0

    .line 48
    long-to-int v0, v4

    .line 49
    int-to-byte v0, v0

    .line 50
    const/4 v4, 0x3

    .line 51
    aput-byte v0, v1, v4

    .line 52
    .line 53
    const-wide v4, 0xff00000000L

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    and-long/2addr v4, v2

    .line 59
    const/16 v0, 0x20

    .line 60
    .line 61
    shr-long/2addr v4, v0

    .line 62
    long-to-int v0, v4

    .line 63
    int-to-byte v0, v0

    .line 64
    const/4 v4, 0x4

    .line 65
    aput-byte v0, v1, v4

    .line 66
    .line 67
    const-wide v4, 0xff0000000000L

    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    and-long/2addr v4, v2

    .line 73
    const/16 v0, 0x28

    .line 74
    .line 75
    shr-long/2addr v4, v0

    .line 76
    long-to-int v0, v4

    .line 77
    int-to-byte v0, v0

    .line 78
    const/4 v4, 0x5

    .line 79
    aput-byte v0, v1, v4

    .line 80
    .line 81
    const-wide/high16 v4, 0xff000000000000L

    .line 82
    .line 83
    and-long/2addr v4, v2

    .line 84
    const/16 v0, 0x30

    .line 85
    .line 86
    shr-long/2addr v4, v0

    .line 87
    long-to-int v0, v4

    .line 88
    int-to-byte v0, v0

    .line 89
    const/4 v4, 0x6

    .line 90
    aput-byte v0, v1, v4

    .line 91
    .line 92
    const-wide/high16 v4, 0x7f00000000000000L    # 5.486124068793689E303

    .line 93
    .line 94
    and-long/2addr v2, v4

    .line 95
    const/16 v0, 0x38

    .line 96
    .line 97
    shr-long/2addr v2, v0

    .line 98
    long-to-int v0, v2

    .line 99
    int-to-byte v0, v0

    .line 100
    const/4 v2, 0x7

    .line 101
    aput-byte v0, v1, v2

    .line 102
    .line 103
    const/16 v0, 0x3f

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->testBit(I)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-eqz p0, :cond_0

    .line 110
    .line 111
    aget-byte p0, v1, v2

    .line 112
    .line 113
    or-int/lit8 p0, p0, -0x80

    .line 114
    .line 115
    int-to-byte p0, p0

    .line 116
    aput-byte p0, v1, v2

    .line 117
    .line 118
    :cond_0
    return-object v1
.end method

.method public static getLongValue([B)J
    .locals 2

    const/4 v0, 0x0

    .line 11
    invoke-static {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue([BI)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getLongValue([BI)J
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getValue([BI)Ljava/math/BigInteger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/math/BigInteger;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public static getValue([B)Ljava/math/BigInteger;
    .locals 1

    const/4 v0, 0x0

    .line 122
    invoke-static {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getValue([BI)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static getValue([BI)Ljava/math/BigInteger;
    .locals 7

    .line 1
    add-int/lit8 v0, p1, 0x7

    .line 2
    .line 3
    aget-byte v1, p0, v0

    .line 4
    .line 5
    int-to-long v1, v1

    .line 6
    const/16 v3, 0x38

    .line 7
    .line 8
    shl-long/2addr v1, v3

    .line 9
    const-wide/high16 v3, 0x7f00000000000000L    # 5.486124068793689E303

    .line 10
    .line 11
    and-long/2addr v1, v3

    .line 12
    add-int/lit8 v3, p1, 0x6

    .line 13
    .line 14
    aget-byte v3, p0, v3

    .line 15
    .line 16
    int-to-long v3, v3

    .line 17
    const/16 v5, 0x30

    .line 18
    .line 19
    shl-long/2addr v3, v5

    .line 20
    const-wide/high16 v5, 0xff000000000000L

    .line 21
    .line 22
    and-long/2addr v3, v5

    .line 23
    add-long/2addr v1, v3

    .line 24
    add-int/lit8 v3, p1, 0x5

    .line 25
    .line 26
    aget-byte v3, p0, v3

    .line 27
    .line 28
    int-to-long v3, v3

    .line 29
    const/16 v5, 0x28

    .line 30
    .line 31
    shl-long/2addr v3, v5

    .line 32
    const-wide v5, 0xff0000000000L

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    and-long/2addr v3, v5

    .line 38
    add-long/2addr v1, v3

    .line 39
    add-int/lit8 v3, p1, 0x4

    .line 40
    .line 41
    aget-byte v3, p0, v3

    .line 42
    .line 43
    int-to-long v3, v3

    .line 44
    const/16 v5, 0x20

    .line 45
    .line 46
    shl-long/2addr v3, v5

    .line 47
    const-wide v5, 0xff00000000L

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    and-long/2addr v3, v5

    .line 53
    add-long/2addr v1, v3

    .line 54
    add-int/lit8 v3, p1, 0x3

    .line 55
    .line 56
    aget-byte v3, p0, v3

    .line 57
    .line 58
    int-to-long v3, v3

    .line 59
    const/16 v5, 0x18

    .line 60
    .line 61
    shl-long/2addr v3, v5

    .line 62
    const-wide v5, 0xff000000L

    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    and-long/2addr v3, v5

    .line 68
    add-long/2addr v1, v3

    .line 69
    add-int/lit8 v3, p1, 0x2

    .line 70
    .line 71
    aget-byte v3, p0, v3

    .line 72
    .line 73
    int-to-long v3, v3

    .line 74
    const/16 v5, 0x10

    .line 75
    .line 76
    shl-long/2addr v3, v5

    .line 77
    const-wide/32 v5, 0xff0000

    .line 78
    .line 79
    .line 80
    and-long/2addr v3, v5

    .line 81
    add-long/2addr v1, v3

    .line 82
    add-int/lit8 v3, p1, 0x1

    .line 83
    .line 84
    aget-byte v3, p0, v3

    .line 85
    .line 86
    int-to-long v3, v3

    .line 87
    const/16 v5, 0x8

    .line 88
    .line 89
    shl-long/2addr v3, v5

    .line 90
    const-wide/32 v5, 0xff00

    .line 91
    .line 92
    .line 93
    and-long/2addr v3, v5

    .line 94
    add-long/2addr v1, v3

    .line 95
    aget-byte p1, p0, p1

    .line 96
    .line 97
    int-to-long v3, p1

    .line 98
    const-wide/16 v5, 0xff

    .line 99
    .line 100
    and-long/2addr v3, v5

    .line 101
    add-long/2addr v1, v3

    .line 102
    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    aget-byte p0, p0, v0

    .line 107
    .line 108
    const/16 v0, -0x80

    .line 109
    .line 110
    and-int/2addr p0, v0

    .line 111
    if-ne p0, v0, :cond_0

    .line 112
    .line 113
    const/16 p0, 0x3f

    .line 114
    .line 115
    invoke-virtual {p1, p0}, Ljava/math/BigInteger;->setBit(I)Ljava/math/BigInteger;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0

    .line 120
    :cond_0
    return-object p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->value:Ljava/math/BigInteger;

    .line 9
    .line 10
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 11
    .line 12
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getValue()Ljava/math/BigInteger;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public getBytes()[B
    .locals 0

    .line 120
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->value:Ljava/math/BigInteger;

    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(Ljava/math/BigInteger;)[B

    move-result-object p0

    return-object p0
.end method

.method public getLongValue()J
    .locals 2

    .line 10
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->value:Ljava/math/BigInteger;

    invoke-virtual {p0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getValue()Ljava/math/BigInteger;
    .locals 0

    .line 121
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->value:Ljava/math/BigInteger;

    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->value:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/math/BigInteger;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ZipEightByteInteger value: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->value:Ljava/math/BigInteger;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
