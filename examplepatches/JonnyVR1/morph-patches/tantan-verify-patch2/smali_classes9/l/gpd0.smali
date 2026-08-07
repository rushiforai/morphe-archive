.class public Ll/gpd0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/gpd0$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:[Ll/gpd0$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/gpd0;->a:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ll/gpd0;->b(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(I)Landroid/widget/FrameLayout$LayoutParams;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lt p1, v0, :cond_1

    .line 3
    .line 4
    iget v1, p0, Ll/gpd0;->a:I

    .line 5
    .line 6
    if-le p1, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/gpd0;->b:[Ll/gpd0$a;

    .line 10
    .line 11
    sub-int/2addr p1, v0

    .line 12
    aget-object p0, p0, p1

    .line 13
    .line 14
    iget p1, p0, Ll/gpd0$a;->a:F

    .line 15
    .line 16
    float-to-int p1, p1

    .line 17
    iget v0, p0, Ll/gpd0$a;->b:F

    .line 18
    .line 19
    float-to-int v0, v0

    .line 20
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 21
    .line 22
    invoke-direct {v1, p1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 23
    .line 24
    .line 25
    iget p1, p0, Ll/gpd0$a;->d:F

    .line 26
    .line 27
    float-to-int p1, p1

    .line 28
    iput p1, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 29
    .line 30
    iget p0, p0, Ll/gpd0$a;->c:F

    .line 31
    .line 32
    float-to-int p0, p0

    .line 33
    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 34
    .line 35
    return-object v1

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public b(I)V
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    if-eq p1, v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p1, 0x2

    .line 9
    iput p1, p0, Ll/gpd0;->a:I

    .line 10
    .line 11
    new-instance v0, Ll/gpd0$a;

    .line 12
    .line 13
    sget v2, Ll/fct;->a:I

    .line 14
    .line 15
    int-to-float v3, v2

    .line 16
    invoke-static {}, Ll/ynp0;->p()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    int-to-float v4, v4

    .line 21
    const/high16 v5, 0x3f000000    # 0.5f

    .line 22
    .line 23
    mul-float/2addr v4, v5

    .line 24
    invoke-static {}, Ll/ynp0;->p()I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    int-to-float v6, v6

    .line 29
    mul-float/2addr v6, v5

    .line 30
    const v7, 0x3fbe76c9    # 1.488f

    .line 31
    .line 32
    .line 33
    mul-float/2addr v6, v7

    .line 34
    invoke-direct {v0, v1, v3, v4, v6}, Ll/gpd0$a;-><init>(FFFF)V

    .line 35
    .line 36
    .line 37
    new-instance v1, Ll/gpd0$a;

    .line 38
    .line 39
    invoke-static {}, Ll/ynp0;->p()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    div-int/2addr v3, p1

    .line 44
    int-to-float p1, v3

    .line 45
    int-to-float v2, v2

    .line 46
    invoke-static {}, Ll/ynp0;->p()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    int-to-float v3, v3

    .line 51
    mul-float/2addr v3, v5

    .line 52
    invoke-static {}, Ll/ynp0;->p()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    int-to-float v4, v4

    .line 57
    mul-float/2addr v4, v5

    .line 58
    mul-float/2addr v4, v7

    .line 59
    invoke-direct {v1, p1, v2, v3, v4}, Ll/gpd0$a;-><init>(FFFF)V

    .line 60
    .line 61
    .line 62
    filled-new-array {v0, v1}, [Ll/gpd0$a;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Ll/gpd0;->b:[Ll/gpd0$a;

    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    iput v0, p0, Ll/gpd0;->a:I

    .line 70
    .line 71
    new-instance p1, Ll/gpd0$a;

    .line 72
    .line 73
    const/high16 v0, -0x40800000    # -1.0f

    .line 74
    .line 75
    invoke-direct {p1, v1, v1, v0, v0}, Ll/gpd0$a;-><init>(FFFF)V

    .line 76
    .line 77
    .line 78
    filled-new-array {p1}, [Ll/gpd0$a;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Ll/gpd0;->b:[Ll/gpd0$a;

    .line 83
    .line 84
    return-void
.end method
