.class public final Le/e/a/DialogColors;
.super Ljava/lang/Object;
.source "DialogColors.java"


# static fields
.field public static final ACCENT_DARK:I = -0xad335d

.field public static final INK_DARK:I = -0x111112

.field public static final INK_LIGHT:I = -0xdfdedc

.field public static final LIST_CORNER:I = -0x66666667

.field public static final MUTED_DARK:I = -0x48453d

.field public static final MUTED_LIGHT:I = -0x99958d

.field public static final SURFACE_DARK:I = -0xe6e4e0


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static accent(IZ)I
    .registers 11
    .param p0, "value"    # I
    .param p1, "dark"    # Z

    .line 3
    shr-int/lit8 v0, p0, 0x10

    and-int/lit16 v0, v0, 0xff

    .local v0, "r":I
    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    .local v1, "g":I
    and-int/lit16 v2, p0, 0xff

    .local v2, "b":I
    if-eqz p1, :cond_1f

    if-le v1, v0, :cond_1b

    int-to-double v3, v2

    int-to-double v5, v1

    const-wide v7, 0x3ff0cccccccccccdL    # 1.05

    mul-double v5, v5, v7

    cmpl-double v7, v3, v5

    if-lez v7, :cond_1f

    :cond_1b
    const v3, -0xad335d

    goto :goto_20

    :cond_1f
    move v3, p0

    :goto_20
    return v3
.end method

.method public static ink(Z)I
    .registers 2
    .param p0, "dark"    # Z

    .line 3
    if-eqz p0, :cond_6

    const v0, -0x111112

    goto :goto_9

    :cond_6
    const v0, -0xdfdedc

    :goto_9
    return v0
.end method

.method public static muted(Z)I
    .registers 2
    .param p0, "dark"    # Z

    .line 3
    if-eqz p0, :cond_6

    const v0, -0x48453d

    goto :goto_9

    :cond_6
    const v0, -0x99958d

    :goto_9
    return v0
.end method

.method public static onAccent(I)I
    .registers 14
    .param p0, "color"    # I

    .line 3
    const-wide/16 v0, 0x0

    .local v0, "l":D
    const/4 v2, 0x3

    new-array v3, v2, [D

    fill-array-data v3, :array_6e

    .local v3, "w":[D
    const/4 v4, 0x0

    .local v4, "n":I
    :goto_9
    if-ge v4, v2, :cond_46

    mul-int/lit8 v5, v4, 0x8

    shr-int v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    int-to-double v5, v5

    const-wide v7, 0x406fe00000000000L    # 255.0

    div-double/2addr v5, v7

    .local v5, "v":D
    aget-wide v7, v3, v4

    const-wide v9, 0x3fa4b5dcc63f1412L    # 0.04045

    cmpg-double v11, v5, v9

    if-gtz v11, :cond_2b

    const-wide v9, 0x4029d70a3d70a3d7L    # 12.92

    div-double v9, v5, v9

    goto :goto_40

    :cond_2b
    const-wide v9, 0x3fac28f5c28f5c29L    # 0.055

    add-double/2addr v9, v5

    const-wide v11, 0x3ff0e147ae147ae1L    # 1.055

    div-double/2addr v9, v11

    const-wide v11, 0x4003333333333333L    # 2.4

    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v9

    :goto_40
    mul-double v7, v7, v9

    add-double/2addr v0, v7

    .end local v5    # "v":D
    add-int/lit8 v4, v4, 0x1

    goto :goto_9

    .end local v4    # "n":I
    :cond_46
    const-wide v4, 0x3ff0cccccccccccdL    # 1.05

    const-wide v6, 0x3fa999999999999aL    # 0.05

    add-double v8, v0, v6

    div-double/2addr v4, v8

    const-wide/high16 v8, 0x4012000000000000L    # 4.5

    cmpl-double v2, v4, v8

    if-ltz v2, :cond_5b

    const/4 v2, -0x1

    goto :goto_6c

    :cond_5b
    add-double/2addr v6, v0

    const-wide v4, 0x3fac779a6b50b0f3L    # 0.055600000000000004

    div-double/2addr v6, v4

    cmpl-double v2, v6, v8

    if-ltz v2, :cond_6a

    const v2, -0xefeeec

    goto :goto_6c

    :cond_6a
    const/high16 v2, -0x1000000

    :goto_6c
    return v2

    nop

    :array_6e
    .array-data 8
        0x3fb27bb2fec56d5dL    # 0.0722
        0x3fe6e2eb1c432ca5L    # 0.7152
        0x3fcb367a0f9096bcL    # 0.2126
    .end array-data
.end method

.method public static purple(I)Z
    .registers 11
    .param p0, "color"    # I

    .line 3
    shr-int/lit8 v0, p0, 0x10

    and-int/lit16 v0, v0, 0xff

    .local v0, "r":I
    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    .local v1, "g":I
    and-int/lit16 v2, p0, 0xff

    .local v2, "b":I
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .local v3, "max":I
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    .local v4, "min":I
    sub-int v5, v3, v4

    int-to-float v5, v5

    .local v5, "delta":F
    const/high16 v6, 0x41400000    # 12.0f

    const/4 v7, 0x0

    cmpg-float v6, v5, v6

    if-gez v6, :cond_25

    return v7

    :cond_25
    const/high16 v6, 0x42700000    # 60.0f

    if-ne v3, v0, :cond_30

    sub-int v8, v1, v2

    int-to-float v8, v8

    div-float/2addr v8, v5

    :goto_2d
    mul-float v8, v8, v6

    goto :goto_41

    :cond_30
    if-ne v3, v1, :cond_39

    sub-int v8, v2, v0

    int-to-float v8, v8

    div-float/2addr v8, v5

    const/high16 v9, 0x40000000    # 2.0f

    goto :goto_3f

    :cond_39
    sub-int v8, v0, v1

    int-to-float v8, v8

    div-float/2addr v8, v5

    const/high16 v9, 0x40800000    # 4.0f

    :goto_3f
    add-float/2addr v8, v9

    goto :goto_2d

    .local v8, "hue":F
    :goto_41
    const/4 v6, 0x0

    cmpg-float v6, v8, v6

    if-gez v6, :cond_49

    const/high16 v6, 0x43b40000    # 360.0f

    add-float/2addr v8, v6

    :cond_49
    const/high16 v6, 0x43750000    # 245.0f

    cmpl-float v6, v8, v6

    if-ltz v6, :cond_57

    const v6, 0x43b18000    # 355.0f

    cmpg-float v6, v8, v6

    if-gtz v6, :cond_57

    const/4 v7, 0x1

    :cond_57
    return v7
.end method

.method public static secondary(IZ)I
    .registers 9
    .param p0, "surface"    # I
    .param p1, "dark"    # Z

    .line 3
    if-eqz p1, :cond_6

    const v0, 0x3c449ba6    # 0.012f

    goto :goto_9

    :cond_6
    const v0, 0x3d23d70a    # 0.04f

    .local v0, "amount":F
    :goto_9
    const/16 v1, 0xff

    if-eqz p1, :cond_10

    const/16 v2, 0xff

    goto :goto_11

    :cond_10
    const/4 v2, 0x0

    .local v2, "target":I
    :goto_11
    shr-int/lit8 v3, p0, 0x10

    and-int/2addr v3, v1

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float v5, v4, v0

    mul-float v3, v3, v5

    int-to-float v5, v2

    mul-float v5, v5, v0

    add-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    .local v3, "r":I
    shr-int/lit8 v5, p0, 0x8

    and-int/2addr v1, v5

    int-to-float v1, v1

    sub-float v5, v4, v0

    mul-float v1, v1, v5

    int-to-float v5, v2

    mul-float v5, v5, v0

    add-float/2addr v1, v5

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .local v1, "g":I
    and-int/lit16 v5, p0, 0xff

    int-to-float v5, v5

    sub-float/2addr v4, v0

    mul-float v5, v5, v4

    int-to-float v4, v2

    mul-float v4, v4, v0

    add-float/2addr v5, v4

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v4

    .local v4, "b":I
    const/high16 v5, -0x1000000

    shl-int/lit8 v6, v3, 0x10

    or-int/2addr v5, v6

    shl-int/lit8 v6, v1, 0x8

    or-int/2addr v5, v6

    or-int/2addr v5, v4

    return v5
.end method
