.class public Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static final r:F

.field public static final s:F


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Landroid/graphics/RectF;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:Z

.field public o:I

.field public p:I

.field public q:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/high16 v0, 0x41a80000    # 21.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    mul-float/2addr v0, v1

    .line 11
    sput v0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->r:F

    .line 12
    .line 13
    const/high16 v0, 0x41700000    # 15.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    mul-float/2addr v0, v1

    .line 21
    sput v0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->s:F

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    const/16 p1, 0x2bc

    .line 12
    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->c:I

    .line 14
    .line 15
    const-string p1, "#ff852a"

    .line 16
    .line 17
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->o:I

    .line 22
    .line 23
    const-string p1, "#ff3a00"

    .line 24
    .line 25
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->p:I

    .line 30
    .line 31
    const/high16 p1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a()V

    .line 36
    .line 37
    .line 38
    new-instance p1, Landroid/graphics/RectF;

    .line 39
    .line 40
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->b:Landroid/graphics/RectF;

    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    const/high16 v1, -0x10000

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a:Landroid/graphics/Paint;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a:Landroid/graphics/Paint;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a:Landroid/graphics/Paint;

    .line 20
    .line 21
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    int-to-float v6, v0

    .line 33
    iget v7, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->o:I

    .line 34
    .line 35
    iget v8, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->p:I

    .line 36
    .line 37
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    const/4 v4, 0x0

    .line 41
    const/4 v5, 0x0

    .line 42
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->n:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a()V

    .line 5
    .line 6
    .line 7
    const/high16 v0, 0x40800000    # 4.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 15
    .line 16
    mul-float/2addr v1, v2

    .line 17
    float-to-int v1, v1

    .line 18
    iput v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->d:I

    .line 19
    .line 20
    const/high16 v1, 0x40e00000    # 7.0f

    .line 21
    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    int-to-float v1, v1

    .line 27
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 28
    .line 29
    mul-float/2addr v1, v2

    .line 30
    float-to-int v1, v1

    .line 31
    iput v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->e:I

    .line 32
    .line 33
    const/high16 v1, 0x41100000    # 9.0f

    .line 34
    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    int-to-float v1, v1

    .line 40
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 41
    .line 42
    mul-float/2addr v1, v2

    .line 43
    float-to-int v1, v1

    .line 44
    iput v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->f:I

    .line 45
    .line 46
    const/high16 v1, 0x41400000    # 12.0f

    .line 47
    .line 48
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    int-to-float v1, v1

    .line 53
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 54
    .line 55
    mul-float/2addr v1, v2

    .line 56
    float-to-int v1, v1

    .line 57
    iput v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->g:I

    .line 58
    .line 59
    const/high16 v1, 0x41600000    # 14.0f

    .line 60
    .line 61
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    int-to-float v1, v1

    .line 66
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 67
    .line 68
    mul-float/2addr v1, v2

    .line 69
    float-to-int v1, v1

    .line 70
    iput v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->h:I

    .line 71
    .line 72
    const/high16 v1, 0x41880000    # 17.0f

    .line 73
    .line 74
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    int-to-float v1, v1

    .line 79
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 80
    .line 81
    mul-float/2addr v1, v2

    .line 82
    float-to-int v1, v1

    .line 83
    iput v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->i:I

    .line 84
    .line 85
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    int-to-float v0, v0

    .line 90
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 91
    .line 92
    mul-float/2addr v0, v1

    .line 93
    float-to-int v0, v0

    .line 94
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->j:I

    .line 95
    .line 96
    const/high16 v0, 0x41000000    # 8.0f

    .line 97
    .line 98
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    int-to-float v0, v0

    .line 103
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 104
    .line 105
    mul-float/2addr v0, v1

    .line 106
    float-to-int v0, v0

    .line 107
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->k:I

    .line 108
    .line 109
    const/high16 v0, 0x41300000    # 11.0f

    .line 110
    .line 111
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    int-to-float v0, v0

    .line 116
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 117
    .line 118
    mul-float/2addr v0, v1

    .line 119
    float-to-int v0, v0

    .line 120
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->l:I

    .line 121
    .line 122
    const/high16 v0, 0x3f800000    # 1.0f

    .line 123
    .line 124
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    int-to-float v0, v0

    .line 129
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 130
    .line 131
    mul-float/2addr v0, v1

    .line 132
    float-to-int v0, v0

    .line 133
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->m:I

    .line 134
    .line 135
    return-void
.end method

.method public c(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->o:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->p:I

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d(II)V
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    sget v0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->r:F

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    int-to-float p2, p2

    .line 6
    sget v0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->s:F

    .line 7
    .line 8
    div-float/2addr p2, v0

    .line 9
    add-float/2addr p1, p2

    .line 10
    const/high16 p2, 0x40000000    # 2.0f

    .line 11
    .line 12
    div-float/2addr p1, p2

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 14
    .line 15
    const/high16 p1, 0x40800000    # 4.0f

    .line 16
    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    int-to-float p2, p2

    .line 22
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 23
    .line 24
    mul-float/2addr p2, v0

    .line 25
    float-to-int p2, p2

    .line 26
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->d:I

    .line 27
    .line 28
    const/high16 p2, 0x40e00000    # 7.0f

    .line 29
    .line 30
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    int-to-float p2, p2

    .line 35
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 36
    .line 37
    mul-float/2addr p2, v0

    .line 38
    float-to-int p2, p2

    .line 39
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->e:I

    .line 40
    .line 41
    const/high16 p2, 0x41100000    # 9.0f

    .line 42
    .line 43
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    int-to-float p2, p2

    .line 48
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 49
    .line 50
    mul-float/2addr p2, v0

    .line 51
    float-to-int p2, p2

    .line 52
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->f:I

    .line 53
    .line 54
    const/high16 p2, 0x41400000    # 12.0f

    .line 55
    .line 56
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    int-to-float p2, p2

    .line 61
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 62
    .line 63
    mul-float/2addr p2, v0

    .line 64
    float-to-int p2, p2

    .line 65
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->g:I

    .line 66
    .line 67
    const/high16 p2, 0x41600000    # 14.0f

    .line 68
    .line 69
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    int-to-float p2, p2

    .line 74
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 75
    .line 76
    mul-float/2addr p2, v0

    .line 77
    float-to-int p2, p2

    .line 78
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->h:I

    .line 79
    .line 80
    const/high16 p2, 0x41880000    # 17.0f

    .line 81
    .line 82
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    int-to-float p2, p2

    .line 87
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 88
    .line 89
    mul-float/2addr p2, v0

    .line 90
    float-to-int p2, p2

    .line 91
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->i:I

    .line 92
    .line 93
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    int-to-float p1, p1

    .line 98
    iget p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 99
    .line 100
    mul-float/2addr p1, p2

    .line 101
    float-to-int p1, p1

    .line 102
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->j:I

    .line 103
    .line 104
    const/high16 p1, 0x41000000    # 8.0f

    .line 105
    .line 106
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    int-to-float p1, p1

    .line 111
    iget p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 112
    .line 113
    mul-float/2addr p1, p2

    .line 114
    float-to-int p1, p1

    .line 115
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->k:I

    .line 116
    .line 117
    const/high16 p1, 0x41300000    # 11.0f

    .line 118
    .line 119
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    int-to-float p1, p1

    .line 124
    iget p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 125
    .line 126
    mul-float/2addr p1, p2

    .line 127
    float-to-int p1, p1

    .line 128
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->l:I

    .line 129
    .line 130
    const/high16 p1, 0x3f800000    # 1.0f

    .line 131
    .line 132
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    int-to-float p1, p1

    .line 137
    iget p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->q:F

    .line 138
    .line 139
    mul-float/2addr p1, p2

    .line 140
    float-to-int p1, p1

    .line 141
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->m:I

    .line 142
    .line 143
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->n:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->c:I

    .line 19
    .line 20
    int-to-long v3, v2

    .line 21
    rem-long/2addr v0, v3

    .line 22
    long-to-float v0, v0

    .line 23
    int-to-float v1, v2

    .line 24
    div-float/2addr v0, v1

    .line 25
    const/high16 v1, 0x3f000000    # 0.5f

    .line 26
    .line 27
    sub-float/2addr v0, v1

    .line 28
    const/high16 v2, 0x40000000    # 2.0f

    .line 29
    .line 30
    mul-float/2addr v0, v2

    .line 31
    iget v3, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->k:I

    .line 32
    .line 33
    int-to-float v4, v3

    .line 34
    iget v5, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->j:I

    .line 35
    .line 36
    sub-int/2addr v3, v5

    .line 37
    int-to-float v3, v3

    .line 38
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    mul-float/2addr v3, v5

    .line 43
    sub-float/2addr v4, v3

    .line 44
    iget v3, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->j:I

    .line 45
    .line 46
    int-to-float v5, v3

    .line 47
    iget v6, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->k:I

    .line 48
    .line 49
    sub-int/2addr v6, v3

    .line 50
    int-to-float v3, v6

    .line 51
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    mul-float/2addr v3, v6

    .line 56
    add-float/2addr v5, v3

    .line 57
    add-float/2addr v0, v1

    .line 58
    const/high16 v1, 0x3f800000    # 1.0f

    .line 59
    .line 60
    cmpl-float v1, v0, v1

    .line 61
    .line 62
    if-lez v1, :cond_1

    .line 63
    .line 64
    sub-float/2addr v0, v2

    .line 65
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->k:I

    .line 66
    .line 67
    int-to-float v2, v1

    .line 68
    iget v3, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->j:I

    .line 69
    .line 70
    sub-int/2addr v1, v3

    .line 71
    int-to-float v1, v1

    .line 72
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    mul-float/2addr v1, v0

    .line 77
    sub-float/2addr v2, v1

    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->b:Landroid/graphics/RectF;

    .line 79
    .line 80
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->d:I

    .line 81
    .line 82
    int-to-float v1, v1

    .line 83
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 84
    .line 85
    iput v4, v0, Landroid/graphics/RectF;->top:F

    .line 86
    .line 87
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->e:I

    .line 88
    .line 89
    int-to-float v1, v1

    .line 90
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 91
    .line 92
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->l:I

    .line 93
    .line 94
    int-to-float v1, v1

    .line 95
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 96
    .line 97
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->m:I

    .line 98
    .line 99
    int-to-float v3, v1

    .line 100
    int-to-float v1, v1

    .line 101
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a:Landroid/graphics/Paint;

    .line 102
    .line 103
    invoke-virtual {p1, v0, v3, v1, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->b:Landroid/graphics/RectF;

    .line 107
    .line 108
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->f:I

    .line 109
    .line 110
    int-to-float v1, v1

    .line 111
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 112
    .line 113
    iput v5, v0, Landroid/graphics/RectF;->top:F

    .line 114
    .line 115
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->g:I

    .line 116
    .line 117
    int-to-float v1, v1

    .line 118
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 119
    .line 120
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->l:I

    .line 121
    .line 122
    int-to-float v1, v1

    .line 123
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 124
    .line 125
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->m:I

    .line 126
    .line 127
    int-to-float v3, v1

    .line 128
    int-to-float v1, v1

    .line 129
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a:Landroid/graphics/Paint;

    .line 130
    .line 131
    invoke-virtual {p1, v0, v3, v1, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->b:Landroid/graphics/RectF;

    .line 135
    .line 136
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->h:I

    .line 137
    .line 138
    int-to-float v1, v1

    .line 139
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 140
    .line 141
    iput v2, v0, Landroid/graphics/RectF;->top:F

    .line 142
    .line 143
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->i:I

    .line 144
    .line 145
    int-to-float v1, v1

    .line 146
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 147
    .line 148
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->l:I

    .line 149
    .line 150
    int-to-float v1, v1

    .line 151
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 152
    .line 153
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->m:I

    .line 154
    .line 155
    int-to-float v2, v1

    .line 156
    int-to-float v1, v1

    .line 157
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->a:Landroid/graphics/Paint;

    .line 158
    .line 159
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public setLoopTime(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->c:I

    .line 2
    .line 3
    return-void
.end method
