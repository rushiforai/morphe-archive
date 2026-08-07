.class public Lcom/wdullaer/materialdatetimepicker/time/CircleView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field private final a:Landroid/graphics/Paint;

.field private b:Z

.field private c:I

.field private d:I

.field private e:F

.field private f:F

.field private g:Z

.field private h:Z

.field private i:I

.field private j:I

.field private k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

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
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->g:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/a;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p0, "CircleView"

    .line 6
    .line 7
    const-string p1, "CircleView may only be initialized once."

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->z()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    sget v1, Ll/q9c0;->f:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    sget v1, Ll/q9c0;->g:I

    .line 27
    .line 28
    :goto_0
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->c:I

    .line 33
    .line 34
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->u()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->d:I

    .line 39
    .line 40
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->a:Landroid/graphics/Paint;

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 44
    .line 45
    .line 46
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->f()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->b:Z

    .line 51
    .line 52
    if-nez p1, :cond_3

    .line 53
    .line 54
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->getVersion()Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    sget-object p2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;->VERSION_1:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 59
    .line 60
    if-eq p1, p2, :cond_2

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->c:I

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->e:F

    .line 74
    .line 75
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->a:I

    .line 76
    .line 77
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->f:F

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_3
    :goto_1
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->d:I

    .line 89
    .line 90
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->e:F

    .line 99
    .line 100
    :goto_2
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->g:Z

    .line 101
    .line 102
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
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->g:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->h:Z

    .line 13
    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    div-int/lit8 v0, v0, 0x2

    .line 21
    .line 22
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->i:I

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    div-int/lit8 v0, v0, 0x2

    .line 29
    .line 30
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->j:I

    .line 31
    .line 32
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->i:I

    .line 33
    .line 34
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    int-to-float v0, v0

    .line 39
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->e:F

    .line 40
    .line 41
    mul-float/2addr v0, v1

    .line 42
    float-to-int v0, v0

    .line 43
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->k:I

    .line 44
    .line 45
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->b:Z

    .line 46
    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    int-to-float v0, v0

    .line 50
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->f:F

    .line 51
    .line 52
    mul-float/2addr v0, v1

    .line 53
    float-to-int v0, v0

    .line 54
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->j:I

    .line 55
    .line 56
    int-to-double v1, v1

    .line 57
    int-to-double v3, v0

    .line 58
    const-wide/high16 v5, 0x3fe8000000000000L    # 0.75

    .line 59
    .line 60
    mul-double/2addr v3, v5

    .line 61
    sub-double/2addr v1, v3

    .line 62
    double-to-int v0, v1

    .line 63
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->j:I

    .line 64
    .line 65
    :cond_1
    const/4 v0, 0x1

    .line 66
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->h:Z

    .line 67
    .line 68
    :cond_2
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->a:Landroid/graphics/Paint;

    .line 69
    .line 70
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->c:I

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 73
    .line 74
    .line 75
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->i:I

    .line 76
    .line 77
    int-to-float v0, v0

    .line 78
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->j:I

    .line 79
    .line 80
    int-to-float v1, v1

    .line 81
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->k:I

    .line 82
    .line 83
    int-to-float v2, v2

    .line 84
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->a:Landroid/graphics/Paint;

    .line 85
    .line 86
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->a:Landroid/graphics/Paint;

    .line 90
    .line 91
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->d:I

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 94
    .line 95
    .line 96
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->i:I

    .line 97
    .line 98
    int-to-float v0, v0

    .line 99
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->j:I

    .line 100
    .line 101
    int-to-float v1, v1

    .line 102
    const/high16 v2, 0x41000000    # 8.0f

    .line 103
    .line 104
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->a:Landroid/graphics/Paint;

    .line 105
    .line 106
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 107
    .line 108
    .line 109
    :cond_3
    :goto_0
    return-void
.end method
