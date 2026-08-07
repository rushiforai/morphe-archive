.class public Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Landroid/graphics/Point;

.field public c:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->a()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->b:Landroid/graphics/Point;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->c:Landroid/graphics/Paint;

    .line 14
    .line 15
    new-instance v0, Landroid/graphics/DashPathEffect;

    .line 16
    .line 17
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 18
    .line 19
    invoke-static {p0, v1}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->dpToPx(Landroid/view/View;F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v1, v1

    .line 24
    const/high16 v2, 0x41c80000    # 25.0f

    .line 25
    .line 26
    invoke-static {p0, v2}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->dpToPx(Landroid/view/View;F)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    int-to-float v2, v2

    .line 31
    const/4 v3, 0x2

    .line 32
    new-array v3, v3, [F

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    aput v1, v3, v4

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    aput v2, v3, v1

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-static {p0, v1}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->dpToPx(Landroid/view/View;F)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    int-to-float v1, v1

    .line 46
    invoke-direct {v0, v3, v1}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->c:Landroid/graphics/Paint;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->c:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    sget v2, Lcom/tencent/could/huiyansdk/R$color;->txy_auth_bg_circle:I

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->c:Landroid/graphics/Paint;

    .line 70
    .line 71
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->c:Landroid/graphics/Paint;

    .line 77
    .line 78
    const/high16 v1, 0x40c00000    # 6.0f

    .line 79
    .line 80
    invoke-static {p0, v1}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->dpToPx(Landroid/view/View;F)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    int-to-float p0, p0

    .line 85
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->b:Landroid/graphics/Point;

    .line 5
    .line 6
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    iget v2, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->a:I

    .line 13
    .line 14
    int-to-float v2, v2

    .line 15
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->c:Landroid/graphics/Paint;

    .line 16
    .line 17
    invoke-virtual {p1, v1, v0, v2, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->b:Landroid/graphics/Point;

    .line 13
    .line 14
    shr-int/lit8 v1, p1, 0x1

    .line 15
    .line 16
    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 17
    .line 18
    shr-int/lit8 v2, p2, 0x1

    .line 19
    .line 20
    iput v2, v0, Landroid/graphics/Point;->y:I

    .line 21
    .line 22
    if-le v1, v2, :cond_0

    .line 23
    .line 24
    move v1, v2

    .line 25
    :cond_0
    iput v1, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->a:I

    .line 26
    .line 27
    const/high16 v0, 0x40a00000    # 5.0f

    .line 28
    .line 29
    invoke-static {p0, v0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->dpToPx(Landroid/view/View;F)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    sub-int/2addr v1, v0

    .line 34
    iput v1, p0, Lcom/tencent/could/huiyansdk/view/CommonAuthBackView;->a:I

    .line 35
    .line 36
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
