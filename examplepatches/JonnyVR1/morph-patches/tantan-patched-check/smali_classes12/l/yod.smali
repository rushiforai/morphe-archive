.class public final Ll/yod;
.super Ll/rdk;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rdk;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Ll/d13;IIFFFFFFFFFFFFFFFF)Ll/d13;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    invoke-static/range {p4 .. p19}, Ll/xw60;->b(FFFFFFFFFFFFFFFF)Ll/xw60;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/yod;->d(Ll/d13;IILl/xw60;)Ll/d13;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Ll/d13;IILl/xw60;)Ll/d13;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    if-lez p2, :cond_4

    .line 2
    .line 3
    if-lez p3, :cond_4

    .line 4
    .line 5
    new-instance p0, Ll/d13;

    .line 6
    .line 7
    invoke-direct {p0, p2, p3}, Ll/d13;-><init>(II)V

    .line 8
    .line 9
    .line 10
    mul-int/lit8 p2, p2, 0x2

    .line 11
    .line 12
    new-array v0, p2, [F

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    :goto_0
    if-ge v2, p3, :cond_3

    .line 17
    .line 18
    int-to-float v3, v2

    .line 19
    const/high16 v4, 0x3f000000    # 0.5f

    .line 20
    .line 21
    add-float/2addr v3, v4

    .line 22
    move v5, v1

    .line 23
    :goto_1
    if-ge v5, p2, :cond_0

    .line 24
    .line 25
    div-int/lit8 v6, v5, 0x2

    .line 26
    .line 27
    int-to-float v6, v6

    .line 28
    add-float/2addr v6, v4

    .line 29
    aput v6, v0, v5

    .line 30
    .line 31
    add-int/lit8 v6, v5, 0x1

    .line 32
    .line 33
    aput v3, v0, v6

    .line 34
    .line 35
    add-int/lit8 v5, v5, 0x2

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-virtual {p4, v0}, Ll/xw60;->f([F)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1, v0}, Ll/rdk;->a(Ll/d13;[F)V

    .line 42
    .line 43
    .line 44
    move v3, v1

    .line 45
    :goto_2
    if-ge v3, p2, :cond_2

    .line 46
    .line 47
    :try_start_0
    aget v4, v0, v3

    .line 48
    .line 49
    float-to-int v4, v4

    .line 50
    add-int/lit8 v5, v3, 0x1

    .line 51
    .line 52
    aget v5, v0, v5

    .line 53
    .line 54
    float-to-int v5, v5

    .line 55
    invoke-virtual {p1, v4, v5}, Ll/d13;->d(II)Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_1

    .line 60
    .line 61
    div-int/lit8 v4, v3, 0x2

    .line 62
    .line 63
    invoke-virtual {p0, v4, v2}, Ll/d13;->o(II)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    .line 66
    :cond_1
    add-int/lit8 v3, v3, 0x2

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :catch_0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    throw p0

    .line 74
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    return-object p0

    .line 78
    :cond_4
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    throw p0
.end method
