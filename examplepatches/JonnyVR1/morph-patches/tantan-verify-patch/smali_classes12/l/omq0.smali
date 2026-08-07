.class public Ll/omq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/omq0$a;
    }
.end annotation


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

.method public static a(IIII)Ll/omq0$a;
    .locals 5

    .line 1
    if-gt p2, p0, :cond_0

    .line 2
    .line 3
    if-le p3, p1, :cond_2

    .line 4
    .line 5
    :cond_0
    int-to-float p2, p2

    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    mul-float v1, p2, v0

    .line 9
    .line 10
    int-to-float p3, p3

    .line 11
    div-float/2addr v1, p3

    .line 12
    int-to-float v2, p0

    .line 13
    mul-float/2addr v2, v0

    .line 14
    int-to-float v3, p1

    .line 15
    div-float v4, v2, v3

    .line 16
    .line 17
    cmpl-float v1, v1, v4

    .line 18
    .line 19
    if-lez v1, :cond_1

    .line 20
    .line 21
    div-float/2addr v2, p2

    .line 22
    mul-float/2addr v2, p3

    .line 23
    float-to-int p3, v2

    .line 24
    move p2, p0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    mul-float/2addr v3, v0

    .line 27
    div-float/2addr v3, p3

    .line 28
    mul-float/2addr v3, p2

    .line 29
    float-to-int p2, v3

    .line 30
    move p3, p1

    .line 31
    :cond_2
    :goto_0
    rem-int/lit8 v0, p3, 0x2

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_3
    add-int/lit8 p3, p3, -0x1

    .line 38
    .line 39
    invoke-static {v1, p3}, Ljava/lang/Math;->max(II)I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    :goto_1
    rem-int/lit8 v0, p2, 0x2

    .line 44
    .line 45
    if-nez v0, :cond_4

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_4
    add-int/lit8 p2, p2, -0x1

    .line 49
    .line 50
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    :goto_2
    sub-int/2addr p1, p3

    .line 55
    div-int/lit8 p1, p1, 0x2

    .line 56
    .line 57
    rem-int/lit8 v0, p1, 0x2

    .line 58
    .line 59
    if-nez v0, :cond_5

    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_5
    add-int/lit8 p1, p1, -0x1

    .line 63
    .line 64
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    :goto_3
    sub-int/2addr p0, p2

    .line 69
    div-int/lit8 p0, p0, 0x2

    .line 70
    .line 71
    rem-int/lit8 v0, p0, 0x2

    .line 72
    .line 73
    if-nez v0, :cond_6

    .line 74
    .line 75
    goto :goto_4

    .line 76
    :cond_6
    add-int/lit8 p0, p0, -0x1

    .line 77
    .line 78
    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    :goto_4
    new-instance v0, Ll/omq0$a;

    .line 83
    .line 84
    invoke-direct {v0}, Ll/omq0$a;-><init>()V

    .line 85
    .line 86
    .line 87
    iput p0, v0, Ll/omq0$a;->a:I

    .line 88
    .line 89
    iput p1, v0, Ll/omq0$a;->b:I

    .line 90
    .line 91
    iput p2, v0, Ll/omq0$a;->c:I

    .line 92
    .line 93
    iput p3, v0, Ll/omq0$a;->d:I

    .line 94
    .line 95
    return-object v0
.end method
