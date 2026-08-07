.class public Lcom/tencent/liteav/beauty/b/c;
.super Lcom/tencent/liteav/beauty/b/b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/beauty/b/c$a;
    }
.end annotation


# static fields
.field private static final r:Ljava/lang/String; = "c"


# instance fields
.field private A:F

.field private s:Lcom/tencent/liteav/beauty/b/f;

.field private t:Lcom/tencent/liteav/beauty/b/c$a;

.field private u:Lcom/tencent/liteav/beauty/b/s;

.field private v:I

.field private w:I

.field private x:F

.field private y:F

.field private z:F


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/b;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c;->u:Lcom/tencent/liteav/beauty/b/s;

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c;->v:I

    .line 9
    .line 10
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c;->w:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c;->x:F

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c;->y:F

    .line 16
    .line 17
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c;->z:F

    .line 18
    .line 19
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c;->A:F

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(F)F
    .locals 0

    .line 18
    invoke-static {p0}, Lcom/tencent/liteav/beauty/b/c;->b(F)F

    move-result p0

    return p0
.end method

.method private static a(FFF)F
    .locals 0

    .line 19
    sub-float/2addr p2, p1

    mul-float/2addr p2, p0

    add-float/2addr p1, p2

    return p1
.end method

.method private static b(F)F
    .locals 8

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    cmpl-float v1, p0, v0

    .line 4
    .line 5
    if-lez v1, :cond_4

    .line 6
    .line 7
    float-to-double v1, p0

    .line 8
    const-wide/high16 v3, 0x4004000000000000L    # 2.5

    .line 9
    .line 10
    cmpg-double v3, v1, v3

    .line 11
    .line 12
    const v4, 0x40833333    # 4.1f

    .line 13
    .line 14
    .line 15
    const/high16 v5, 0x3fc00000    # 1.5f

    .line 16
    .line 17
    if-gez v3, :cond_0

    .line 18
    .line 19
    sub-float/2addr p0, v0

    .line 20
    div-float/2addr p0, v5

    .line 21
    invoke-static {p0, v0, v4}, Lcom/tencent/liteav/beauty/b/c;->a(FFF)F

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/high16 v0, 0x40800000    # 4.0f

    .line 27
    .line 28
    cmpg-float v3, p0, v0

    .line 29
    .line 30
    const v6, 0x40b33333    # 5.6f

    .line 31
    .line 32
    .line 33
    if-gez v3, :cond_1

    .line 34
    .line 35
    const/high16 v0, 0x40200000    # 2.5f

    .line 36
    .line 37
    sub-float/2addr p0, v0

    .line 38
    div-float/2addr p0, v5

    .line 39
    invoke-static {p0, v4, v6}, Lcom/tencent/liteav/beauty/b/c;->a(FFF)F

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-wide/high16 v3, 0x4016000000000000L    # 5.5

    .line 45
    .line 46
    cmpg-double v3, v1, v3

    .line 47
    .line 48
    const v4, 0x40d9999a    # 6.8f

    .line 49
    .line 50
    .line 51
    if-gez v3, :cond_2

    .line 52
    .line 53
    sub-float/2addr p0, v0

    .line 54
    div-float/2addr p0, v5

    .line 55
    invoke-static {p0, v6, v4}, Lcom/tencent/liteav/beauty/b/c;->a(FFF)F

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    goto :goto_0

    .line 60
    :cond_2
    const-wide/high16 v6, 0x401c000000000000L    # 7.0

    .line 61
    .line 62
    cmpg-double v0, v1, v6

    .line 63
    .line 64
    if-gtz v0, :cond_3

    .line 65
    .line 66
    const/high16 v0, 0x40b00000    # 5.5f

    .line 67
    .line 68
    sub-float/2addr p0, v0

    .line 69
    div-float/2addr p0, v5

    .line 70
    const/high16 v0, 0x40e00000    # 7.0f

    .line 71
    .line 72
    invoke-static {p0, v4, v0}, Lcom/tencent/liteav/beauty/b/c;->a(FFF)F

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    :cond_3
    :goto_0
    const/high16 v0, 0x41200000    # 10.0f

    .line 77
    .line 78
    div-float/2addr p0, v0

    .line 79
    return p0

    .line 80
    :cond_4
    const p0, 0x3dcccccd    # 0.1f

    .line 81
    .line 82
    .line 83
    return p0
.end method


# virtual methods
.method public a(II)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c;->v:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c;->w:I

    .line 6
    .line 7
    if-ne v0, p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c;->v:I

    .line 11
    .line 12
    iput p2, p0, Lcom/tencent/liteav/beauty/b/c;->w:I

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/c;->c(II)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b(I)I
    .locals 3

    .line 84
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c;->x:F

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-gtz v2, :cond_0

    iget v2, p0, Lcom/tencent/liteav/beauty/b/c;->y:F

    cmpl-float v2, v2, v1

    if-gtz v2, :cond_0

    iget v2, p0, Lcom/tencent/liteav/beauty/b/c;->z:F

    cmpl-float v2, v2, v1

    if-lez v2, :cond_2

    :cond_0
    cmpl-float v0, v0, v1

    if-eqz v0, :cond_1

    .line 85
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c;->s:Lcom/tencent/liteav/beauty/b/f;

    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/b/f;->b(I)I

    move-result v0

    goto :goto_0

    :cond_1
    move v0, p1

    .line 86
    :goto_0
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/c;->t:Lcom/tencent/liteav/beauty/b/c$a;

    invoke-virtual {v2, v0, p1, p1}, Lcom/tencent/liteav/beauty/b/t;->a(III)I

    move-result p1

    .line 87
    :cond_2
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c;->A:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    .line 88
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/c;->u:Lcom/tencent/liteav/beauty/b/s;

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    move-result p0

    return p0

    :cond_3
    return p1
.end method

.method public c(I)V
    .locals 0

    int-to-float p1, p1

    .line 125
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c;->x:F

    .line 126
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/c;->t:Lcom/tencent/liteav/beauty/b/c$a;

    if-eqz p0, :cond_0

    .line 127
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/c$a;->a(F)V

    :cond_0
    return-void
.end method

.method public c(II)Z
    .locals 3

    .line 1
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c;->v:I

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/beauty/b/c;->w:I

    .line 4
    .line 5
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->s:Lcom/tencent/liteav/beauty/b/f;

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    const/4 v0, 0x1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    new-instance p1, Lcom/tencent/liteav/beauty/b/f;

    .line 12
    .line 13
    invoke-direct {p1}, Lcom/tencent/liteav/beauty/b/f;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->s:Lcom/tencent/liteav/beauty/b/f;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->s:Lcom/tencent/liteav/beauty/b/f;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    sget-object p0, Lcom/tencent/liteav/beauty/b/c;->r:Ljava/lang/String;

    .line 30
    .line 31
    const-string p1, "mNewFaceFilter init Failed"

    .line 32
    .line 33
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return p2

    .line 37
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->s:Lcom/tencent/liteav/beauty/b/f;

    .line 38
    .line 39
    iget v1, p0, Lcom/tencent/liteav/beauty/b/c;->v:I

    .line 40
    .line 41
    iget v2, p0, Lcom/tencent/liteav/beauty/b/c;->w:I

    .line 42
    .line 43
    invoke-virtual {p1, v1, v2}, Lcom/tencent/liteav/beauty/b/f;->a(II)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->t:Lcom/tencent/liteav/beauty/b/c$a;

    .line 47
    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    new-instance p1, Lcom/tencent/liteav/beauty/b/c$a;

    .line 51
    .line 52
    invoke-direct {p1}, Lcom/tencent/liteav/beauty/b/c$a;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->t:Lcom/tencent/liteav/beauty/b/c$a;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->t:Lcom/tencent/liteav/beauty/b/c$a;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/tencent/liteav/beauty/b/c$a;->a()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    sget-object p0, Lcom/tencent/liteav/beauty/b/c;->r:Ljava/lang/String;

    .line 69
    .line 70
    const-string p1, "mBeautyCoreFilter init Failed"

    .line 71
    .line 72
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    return p2

    .line 76
    :cond_1
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->t:Lcom/tencent/liteav/beauty/b/c$a;

    .line 77
    .line 78
    iget v1, p0, Lcom/tencent/liteav/beauty/b/c;->v:I

    .line 79
    .line 80
    iget v2, p0, Lcom/tencent/liteav/beauty/b/c;->w:I

    .line 81
    .line 82
    invoke-virtual {p1, v1, v2}, Lcom/tencent/liteav/beauty/b/c$a;->a(II)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->u:Lcom/tencent/liteav/beauty/b/s;

    .line 86
    .line 87
    if-nez p1, :cond_2

    .line 88
    .line 89
    new-instance p1, Lcom/tencent/liteav/beauty/b/s;

    .line 90
    .line 91
    invoke-direct {p1}, Lcom/tencent/liteav/beauty/b/s;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->u:Lcom/tencent/liteav/beauty/b/s;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->u:Lcom/tencent/liteav/beauty/b/s;

    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_2

    .line 106
    .line 107
    sget-object p0, Lcom/tencent/liteav/beauty/b/c;->r:Ljava/lang/String;

    .line 108
    .line 109
    const-string p1, "mSharpenessFilter init Failed"

    .line 110
    .line 111
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    return p2

    .line 115
    :cond_2
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/c;->u:Lcom/tencent/liteav/beauty/b/s;

    .line 116
    .line 117
    iget p2, p0, Lcom/tencent/liteav/beauty/b/c;->v:I

    .line 118
    .line 119
    iget p0, p0, Lcom/tencent/liteav/beauty/b/c;->w:I

    .line 120
    .line 121
    invoke-virtual {p1, p2, p0}, Lcom/tencent/liteav/beauty/b/s;->a(II)V

    .line 122
    .line 123
    .line 124
    return v0
.end method

.method public d(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c;->y:F

    .line 3
    .line 4
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/c;->t:Lcom/tencent/liteav/beauty/b/c$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/c$a;->b(F)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c;->t:Lcom/tencent/liteav/beauty/b/c$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/c;->t:Lcom/tencent/liteav/beauty/b/c$a;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c;->s:Lcom/tencent/liteav/beauty/b/f;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/c;->s:Lcom/tencent/liteav/beauty/b/f;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/c;->u:Lcom/tencent/liteav/beauty/b/s;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/c;->u:Lcom/tencent/liteav/beauty/b/s;

    .line 28
    .line 29
    :cond_2
    return-void
.end method

.method public e(I)V
    .locals 0

    int-to-float p1, p1

    .line 30
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c;->z:F

    .line 31
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/c;->t:Lcom/tencent/liteav/beauty/b/c$a;

    if-eqz p0, :cond_0

    .line 32
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/c$a;->c(F)V

    :cond_0
    return-void
.end method

.method public f(I)V
    .locals 4

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x41700000    # 15.0f

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c;->A:F

    .line 6
    .line 7
    sub-float/2addr v0, p1

    .line 8
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    float-to-double v0, v0

    .line 13
    const-wide v2, 0x3f50624dd2f1a9fcL    # 0.001

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    cmpg-double v0, v0, v2

    .line 19
    .line 20
    if-gez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c;->A:F

    .line 24
    .line 25
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/c;->u:Lcom/tencent/liteav/beauty/b/s;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/s;->a(F)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method
