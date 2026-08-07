.class public Lcom/momo/mcamera/liveprocessor/ByteDanceToMMPointUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static LANDMARK_ORDER_96:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x60

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/momo/mcamera/liveprocessor/ByteDanceToMMPointUtils;->LANDMARK_ORDER_96:[I

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x12
        0x11
        0x10
        0xf
        0xe
        0xd
        0xc
        0xb
        0xa
        0x9
        0x8
        0x7
        0x6
        0x5
        0x4
        0x3
        0x2
        0x1
        0x0
        0x22
        0x21
        0x20
        0x1f
        0x1e
        0x1d
        0x26
        0x25
        0x24
        0x23
        0x18
        0x17
        0x16
        0x15
        0x14
        0x13
        0x1c
        0x1b
        0x1a
        0x19
        0x39
        0x38
        0x37
        0x36
        0x35
        0x34
        0x33
        0x3e
        0x3d
        0x3c
        0x3b
        0x3a
        0x2d
        0x2c
        0x2b
        0x2a
        0x29
        0x28
        0x27
        0x32
        0x31
        0x30
        0x2f
        0x2e
        0x4a
        0x49
        0x48
        0x47
        0x46
        0x45
        0x44
        0x43
        0x42
        0x41
        0x40
        0x3f
        0x4b
        0x52
        0x51
        0x50
        0x4f
        0x4e
        0x4d
        0x4c
        0x57
        0x56
        0x55
        0x54
        0x53
        0x5c
        0x5b
        0x5a
        0x59
        0x58
        0x5f
        0x5e
        0x5d
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

.method private static rotationFlip([FFZFFF)[F
    .locals 7

    .line 1
    array-length v0, p0

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    array-length v1, p0

    .line 5
    div-int/lit8 v1, v1, 0x2

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, v1, :cond_4

    .line 9
    .line 10
    aget v3, p0, v2

    .line 11
    .line 12
    div-float/2addr v3, p5

    .line 13
    add-int v4, v2, v1

    .line 14
    .line 15
    aget v5, p0, v4

    .line 16
    .line 17
    div-float/2addr v5, p5

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    sub-float v3, p4, v3

    .line 21
    .line 22
    :cond_0
    const/high16 v6, 0x42b40000    # 90.0f

    .line 23
    .line 24
    cmpl-float v6, p1, v6

    .line 25
    .line 26
    if-nez v6, :cond_1

    .line 27
    .line 28
    sub-float v5, p3, v5

    .line 29
    .line 30
    aput v5, v0, v2

    .line 31
    .line 32
    aput v3, v0, v4

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    const/high16 v6, 0x43340000    # 180.0f

    .line 36
    .line 37
    cmpl-float v6, p1, v6

    .line 38
    .line 39
    if-nez v6, :cond_2

    .line 40
    .line 41
    sub-float v3, p3, v3

    .line 42
    .line 43
    aput v3, v0, v2

    .line 44
    .line 45
    sub-float v3, p4, v5

    .line 46
    .line 47
    aput v3, v0, v4

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    const/high16 v6, 0x43870000    # 270.0f

    .line 51
    .line 52
    cmpl-float v6, p1, v6

    .line 53
    .line 54
    if-nez v6, :cond_3

    .line 55
    .line 56
    aput v5, v0, v2

    .line 57
    .line 58
    sub-float v3, p4, v3

    .line 59
    .line 60
    aput v3, v0, v4

    .line 61
    .line 62
    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_4
    return-object v0
.end method

.method public static transByteFaceRectToOriginFaceRect([FIZIIF)[F
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    int-to-float p3, p3

    .line 3
    int-to-float p4, p4

    .line 4
    invoke-static/range {p0 .. p5}, Lcom/momo/mcamera/liveprocessor/ByteDanceToMMPointUtils;->rotationFlip([FFZFFF)[F

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    aget p2, p0, p1

    .line 12
    .line 13
    const/4 p3, 0x2

    .line 14
    aget p4, p0, p3

    .line 15
    .line 16
    aput p4, p0, p1

    .line 17
    .line 18
    aput p2, p0, p3

    .line 19
    .line 20
    :cond_0
    return-object p0
.end method

.method public static transBytePoint96ToOriginal96([FIZIIF)[F
    .locals 1

    .line 1
    array-length v0, p0

    .line 2
    div-int/lit8 v0, v0, 0x2

    .line 3
    .line 4
    int-to-float p1, p1

    .line 5
    int-to-float p3, p3

    .line 6
    int-to-float p4, p4

    .line 7
    invoke-static/range {p0 .. p5}, Lcom/momo/mcamera/liveprocessor/ByteDanceToMMPointUtils;->rotationFlip([FFZFFF)[F

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    mul-int/lit8 p1, v0, 0x2

    .line 14
    .line 15
    new-array p1, p1, [F

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    :goto_0
    if-ge p2, v0, :cond_0

    .line 19
    .line 20
    sget-object p3, Lcom/momo/mcamera/liveprocessor/ByteDanceToMMPointUtils;->LANDMARK_ORDER_96:[I

    .line 21
    .line 22
    aget p3, p3, p2

    .line 23
    .line 24
    aget p4, p0, p3

    .line 25
    .line 26
    aput p4, p1, p2

    .line 27
    .line 28
    add-int p4, p2, v0

    .line 29
    .line 30
    add-int/2addr p3, v0

    .line 31
    aget p3, p0, p3

    .line 32
    .line 33
    aput p3, p1, p4

    .line 34
    .line 35
    add-int/lit8 p2, p2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-object p1

    .line 39
    :cond_1
    return-object p0
.end method
