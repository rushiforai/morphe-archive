.class public Lorg/spongycastle/util/encoders/HexTranslator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/util/encoders/Translator;


# static fields
.field private static final hexTable:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/util/encoders/HexTranslator;->hexTable:[B

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public decode([BII[BI)I
    .locals 3

    .line 1
    div-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    :goto_0
    if-ge p0, p3, :cond_2

    .line 5
    .line 6
    mul-int/lit8 v0, p0, 0x2

    .line 7
    .line 8
    add-int/2addr v0, p2

    .line 9
    aget-byte v1, p1, v0

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    aget-byte v0, p1, v0

    .line 14
    .line 15
    const/16 v2, 0x61

    .line 16
    .line 17
    if-ge v1, v2, :cond_0

    .line 18
    .line 19
    add-int/lit8 v1, v1, -0x30

    .line 20
    .line 21
    shl-int/lit8 v1, v1, 0x4

    .line 22
    .line 23
    int-to-byte v1, v1

    .line 24
    aput-byte v1, p4, p5

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    add-int/lit8 v1, v1, -0x57

    .line 28
    .line 29
    shl-int/lit8 v1, v1, 0x4

    .line 30
    .line 31
    int-to-byte v1, v1

    .line 32
    aput-byte v1, p4, p5

    .line 33
    .line 34
    :goto_1
    if-ge v0, v2, :cond_1

    .line 35
    .line 36
    aget-byte v1, p4, p5

    .line 37
    .line 38
    add-int/lit8 v0, v0, -0x30

    .line 39
    .line 40
    int-to-byte v0, v0

    .line 41
    add-int/2addr v1, v0

    .line 42
    int-to-byte v0, v1

    .line 43
    aput-byte v0, p4, p5

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_1
    aget-byte v1, p4, p5

    .line 47
    .line 48
    add-int/lit8 v0, v0, -0x57

    .line 49
    .line 50
    int-to-byte v0, v0

    .line 51
    add-int/2addr v1, v0

    .line 52
    int-to-byte v0, v1

    .line 53
    aput-byte v0, p4, p5

    .line 54
    .line 55
    :goto_2
    add-int/lit8 p5, p5, 0x1

    .line 56
    .line 57
    add-int/lit8 p0, p0, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    return p3
.end method

.method public encode([BII[BI)I
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p2

    .line 3
    move p2, p0

    .line 4
    :goto_0
    if-ge p0, p3, :cond_0

    .line 5
    .line 6
    add-int v1, p5, p2

    .line 7
    .line 8
    sget-object v2, Lorg/spongycastle/util/encoders/HexTranslator;->hexTable:[B

    .line 9
    .line 10
    aget-byte v3, p1, v0

    .line 11
    .line 12
    shr-int/lit8 v3, v3, 0x4

    .line 13
    .line 14
    and-int/lit8 v3, v3, 0xf

    .line 15
    .line 16
    aget-byte v3, v2, v3

    .line 17
    .line 18
    aput-byte v3, p4, v1

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    aget-byte v3, p1, v0

    .line 23
    .line 24
    and-int/lit8 v3, v3, 0xf

    .line 25
    .line 26
    aget-byte v2, v2, v3

    .line 27
    .line 28
    aput-byte v2, p4, v1

    .line 29
    .line 30
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    add-int/lit8 p0, p0, 0x1

    .line 33
    .line 34
    add-int/lit8 p2, p2, 0x2

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    mul-int/lit8 p3, p3, 0x2

    .line 38
    .line 39
    return p3
.end method

.method public getDecodedBlockSize()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public getEncodedBlockSize()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method
