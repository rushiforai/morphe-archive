.class public final Lcom/guardsquare/dexguard/unregisterForContextMenu;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method private static onOptionsItemSelected([I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    array-length v1, p0

    .line 3
    div-int/lit8 v1, v1, 0x2

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    aget v1, p0, v0

    .line 8
    .line 9
    array-length v2, p0

    .line 10
    sub-int/2addr v2, v0

    .line 11
    add-int/lit8 v2, v2, -0x1

    .line 12
    .line 13
    aget v2, p0, v2

    .line 14
    .line 15
    aput v2, p0, v0

    .line 16
    .line 17
    array-length v2, p0

    .line 18
    sub-int/2addr v2, v0

    .line 19
    add-int/lit8 v2, v2, -0x1

    .line 20
    .line 21
    aput v1, p0, v2

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public static unregisterForContextMenu(IIZI[I[[I[I)V
    .locals 11

    .line 1
    move-object v0, p4

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    invoke-static {p4}, Lcom/guardsquare/dexguard/unregisterForContextMenu;->onOptionsItemSelected([I)V

    .line 5
    .line 6
    .line 7
    :cond_0
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    const/4 v3, 0x2

    .line 10
    const/4 v4, 0x1

    .line 11
    if-ge v2, p3, :cond_1

    .line 12
    .line 13
    aget v5, v0, v2

    .line 14
    .line 15
    xor-int/2addr p0, v5

    .line 16
    ushr-int/lit8 v5, p0, 0x18

    .line 17
    .line 18
    ushr-int/lit8 v6, p0, 0x10

    .line 19
    .line 20
    and-int/lit16 v6, v6, 0xff

    .line 21
    .line 22
    ushr-int/lit8 v7, p0, 0x8

    .line 23
    .line 24
    and-int/lit16 v7, v7, 0xff

    .line 25
    .line 26
    and-int/lit16 v8, p0, 0xff

    .line 27
    .line 28
    aget-object v9, p5, v1

    .line 29
    .line 30
    aget v5, v9, v5

    .line 31
    .line 32
    aget-object v4, p5, v4

    .line 33
    .line 34
    aget v4, v4, v6

    .line 35
    .line 36
    add-int/2addr v5, v4

    .line 37
    aget-object v3, p5, v3

    .line 38
    .line 39
    aget v3, v3, v7

    .line 40
    .line 41
    xor-int/2addr v3, v5

    .line 42
    const/4 v4, 0x3

    .line 43
    aget-object v4, p5, v4

    .line 44
    .line 45
    aget v4, v4, v8

    .line 46
    .line 47
    add-int/2addr v3, v4

    .line 48
    xor-int/2addr p1, v3

    .line 49
    add-int/lit8 v2, v2, 0x1

    .line 50
    .line 51
    move v10, p1

    .line 52
    move p1, p0

    .line 53
    move p0, v10

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    array-length v2, v0

    .line 56
    sub-int/2addr v2, v3

    .line 57
    aget v2, v0, v2

    .line 58
    .line 59
    xor-int/2addr p0, v2

    .line 60
    array-length v2, v0

    .line 61
    sub-int/2addr v2, v4

    .line 62
    aget v2, v0, v2

    .line 63
    .line 64
    xor-int/2addr p1, v2

    .line 65
    if-nez p2, :cond_2

    .line 66
    .line 67
    invoke-static {p4}, Lcom/guardsquare/dexguard/unregisterForContextMenu;->onOptionsItemSelected([I)V

    .line 68
    .line 69
    .line 70
    :cond_2
    aput p1, p6, v1

    .line 71
    .line 72
    aput p0, p6, v4

    .line 73
    .line 74
    return-void
.end method
