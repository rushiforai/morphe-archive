.class public Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/RectF;

.field public c:Landroid/graphics/RectF;

.field public d:Landroid/graphics/RectF;

.field public e:I

.field public f:F

.field public g:F

.field public h:F

.field public i:I

.field public j:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;

.field public k:Landroid/graphics/Bitmap;

.field public l:F

.field public m:I

.field public n:I

.field public o:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->e:I

    .line 6
    .line 7
    const/high16 p1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    int-to-float p1, p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->f:F

    .line 15
    .line 16
    const/high16 p1, 0x40200000    # 2.5f

    .line 17
    .line 18
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    int-to-float p1, p1

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->g:F

    .line 24
    .line 25
    const/high16 p1, 0x40400000    # 3.0f

    .line 26
    .line 27
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    int-to-float p1, p1

    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->h:F

    .line 33
    .line 34
    sget p1, Ll/ibc0;->w:I

    .line 35
    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->i:I

    .line 37
    .line 38
    sget-object p1, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;->DEFAULT:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;

    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->j:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->k:Landroid/graphics/Bitmap;

    .line 44
    .line 45
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->f:F

    .line 46
    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->l:F

    .line 48
    .line 49
    const/4 p1, 0x1

    .line 50
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->o:Z

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 56
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 57
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->e:I

    const/high16 p1, 0x3f800000    # 1.0f

    .line 58
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->f:F

    const/high16 p1, 0x40200000    # 2.5f

    .line 59
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->g:F

    const/high16 p1, 0x40400000    # 3.0f

    .line 60
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->h:F

    .line 61
    sget p1, Ll/ibc0;->w:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->i:I

    .line 62
    sget-object p1, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;->DEFAULT:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->j:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;

    const/4 p1, 0x0

    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->k:Landroid/graphics/Bitmap;

    .line 64
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->f:F

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->l:F

    const/4 p1, 0x1

    .line 65
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->o:Z

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 67
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 68
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->e:I

    const/high16 p1, 0x3f800000    # 1.0f

    .line 69
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->f:F

    const/high16 p1, 0x40200000    # 2.5f

    .line 70
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->g:F

    const/high16 p1, 0x40400000    # 3.0f

    .line 71
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->h:F

    .line 72
    sget p1, Ll/ibc0;->w:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->i:I

    .line 73
    sget-object p1, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;->DEFAULT:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->j:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;

    const/4 p1, 0x0

    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->k:Landroid/graphics/Bitmap;

    .line 75
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->f:F

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->l:F

    const/4 p1, 0x1

    .line 76
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->o:Z

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->c:Landroid/graphics/RectF;

    .line 25
    .line 26
    new-instance v0, Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->b:Landroid/graphics/RectF;

    .line 32
    .line 33
    new-instance v0, Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->d:Landroid/graphics/RectF;

    .line 39
    .line 40
    return-void
.end method

.method public b()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->j:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;->NEW_UI:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->l:F

    .line 10
    .line 11
    const/high16 v1, 0x40400000    # 3.0f

    .line 12
    .line 13
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->h:F

    .line 19
    .line 20
    const/high16 v1, 0x3fc00000    # 1.5f

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
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->g:F

    .line 28
    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->f:F

    .line 30
    .line 31
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->n:I

    .line 32
    .line 33
    if-gez v2, :cond_1

    .line 34
    .line 35
    :goto_0
    return-void

    .line 36
    :cond_1
    sget-object v3, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;->DEFAULT:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;

    .line 37
    .line 38
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->j:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView$ProgressStyle;

    .line 39
    .line 40
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->h:F

    .line 41
    .line 42
    add-float/2addr v3, v1

    .line 43
    add-float/2addr v3, v0

    .line 44
    const/high16 v0, 0x40000000    # 2.0f

    .line 45
    .line 46
    div-float/2addr v3, v0

    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->c:Landroid/graphics/RectF;

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->m:I

    .line 50
    .line 51
    int-to-float v1, v1

    .line 52
    sub-float/2addr v1, v3

    .line 53
    int-to-float v2, v2

    .line 54
    sub-float/2addr v2, v3

    .line 55
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->b:Landroid/graphics/RectF;

    .line 59
    .line 60
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->l:F

    .line 61
    .line 62
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->m:I

    .line 63
    .line 64
    int-to-float v2, v2

    .line 65
    sub-float/2addr v2, v1

    .line 66
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->n:I

    .line 67
    .line 68
    int-to-float v3, v3

    .line 69
    sub-float/2addr v3, v1

    .line 70
    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 71
    .line 72
    .line 73
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->g:F

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->d:Landroid/graphics/RectF;

    .line 76
    .line 77
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->m:I

    .line 78
    .line 79
    int-to-float v2, v2

    .line 80
    sub-float/2addr v2, v0

    .line 81
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->n:I

    .line 82
    .line 83
    int-to-float v3, v3

    .line 84
    sub-float/2addr v3, v0

    .line 85
    invoke-virtual {v1, v0, v0, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public c(IZ)V
    .locals 1

    .line 1
    const/16 v0, 0x168

    .line 2
    .line 3
    mul-int/2addr p1, v0

    .line 4
    div-int/lit8 p1, p1, 0x64

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->e:I

    .line 7
    .line 8
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->e:I

    .line 13
    .line 14
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->o:Z

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->k:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->i:I

    .line 17
    .line 18
    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->k:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 25
    .line 26
    const/4 v7, -0x1

    .line 27
    invoke-virtual {v1, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 31
    .line 32
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->h:F

    .line 33
    .line 34
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->g:F

    .line 35
    .line 36
    add-float/2addr v2, v3

    .line 37
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->f:F

    .line 38
    .line 39
    add-float/2addr v2, v3

    .line 40
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->c:Landroid/graphics/RectF;

    .line 44
    .line 45
    const/4 v5, 0x0

    .line 46
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    const/high16 v4, 0x43b40000    # 360.0f

    .line 50
    .line 51
    move-object v1, p1

    .line 52
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 53
    .line 54
    .line 55
    new-instance v2, Landroid/graphics/PaintFlagsDrawFilter;

    .line 56
    .line 57
    const/4 v3, 0x0

    .line 58
    const/4 v4, 0x3

    .line 59
    invoke-direct {v2, v3, v4}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 63
    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->k:Landroid/graphics/Bitmap;

    .line 71
    .line 72
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->k:Landroid/graphics/Bitmap;

    .line 79
    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->b:Landroid/graphics/RectF;

    .line 81
    .line 82
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 83
    .line 84
    const/4 v5, 0x0

    .line 85
    invoke-virtual {p1, v2, v5, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 86
    .line 87
    .line 88
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 89
    .line 90
    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 91
    .line 92
    .line 93
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 94
    .line 95
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->h:F

    .line 96
    .line 97
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->g:F

    .line 98
    .line 99
    add-float/2addr v3, v4

    .line 100
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->f:F

    .line 101
    .line 102
    add-float/2addr v3, v4

    .line 103
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 104
    .line 105
    .line 106
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->o:Z

    .line 107
    .line 108
    move v3, v2

    .line 109
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->c:Landroid/graphics/RectF;

    .line 110
    .line 111
    const/high16 v7, 0x42b40000    # 90.0f

    .line 112
    .line 113
    if-eqz v3, :cond_2

    .line 114
    .line 115
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->e:I

    .line 116
    .line 117
    int-to-float v4, v3

    .line 118
    sub-float/2addr v4, v7

    .line 119
    rsub-int v3, v3, 0x168

    .line 120
    .line 121
    int-to-float v3, v3

    .line 122
    const/4 v5, 0x0

    .line 123
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 124
    .line 125
    move v1, v4

    .line 126
    move v4, v3

    .line 127
    move v3, v1

    .line 128
    move-object v1, p1

    .line 129
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->e:I

    .line 134
    .line 135
    int-to-float v4, v1

    .line 136
    const/4 v5, 0x0

    .line 137
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 138
    .line 139
    const/high16 v3, -0x3d4c0000    # -90.0f

    .line 140
    .line 141
    move-object v1, p1

    .line 142
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 143
    .line 144
    .line 145
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 146
    .line 147
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->h:F

    .line 148
    .line 149
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 150
    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    sget v3, Ll/g9c0;->n:I

    .line 159
    .line 160
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 165
    .line 166
    .line 167
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->o:Z

    .line 168
    .line 169
    move v2, v1

    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->d:Landroid/graphics/RectF;

    .line 171
    .line 172
    if-eqz v2, :cond_3

    .line 173
    .line 174
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->e:I

    .line 175
    .line 176
    int-to-float v3, v2

    .line 177
    sub-float/2addr v3, v7

    .line 178
    rsub-int v2, v2, 0x168

    .line 179
    .line 180
    int-to-float v2, v2

    .line 181
    const/4 v4, 0x0

    .line 182
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 183
    .line 184
    move v0, v3

    .line 185
    move v3, v2

    .line 186
    move v2, v0

    .line 187
    move-object v0, p1

    .line 188
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :cond_3
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->e:I

    .line 193
    .line 194
    int-to-float v3, v2

    .line 195
    const/4 v4, 0x0

    .line 196
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->a:Landroid/graphics/Paint;

    .line 197
    .line 198
    const/high16 v2, -0x3d4c0000    # -90.0f

    .line 199
    .line 200
    move-object v0, p1

    .line 201
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 202
    .line 203
    .line 204
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

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
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->m:I

    .line 9
    .line 10
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->n:I

    .line 15
    .line 16
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->h:F

    .line 17
    .line 18
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->g:F

    .line 19
    .line 20
    add-float/2addr p2, v0

    .line 21
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->f:F

    .line 22
    .line 23
    add-float/2addr p2, v0

    .line 24
    const/high16 v0, 0x40000000    # 2.0f

    .line 25
    .line 26
    div-float/2addr p2, v0

    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->c:Landroid/graphics/RectF;

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->m:I

    .line 30
    .line 31
    int-to-float v1, v1

    .line 32
    sub-float/2addr v1, p2

    .line 33
    int-to-float p1, p1

    .line 34
    sub-float/2addr p1, p2

    .line 35
    invoke-virtual {v0, p2, p2, v1, p1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->b:Landroid/graphics/RectF;

    .line 39
    .line 40
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->l:F

    .line 41
    .line 42
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->m:I

    .line 43
    .line 44
    int-to-float v0, v0

    .line 45
    sub-float/2addr v0, p2

    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->n:I

    .line 47
    .line 48
    int-to-float v1, v1

    .line 49
    sub-float/2addr v1, p2

    .line 50
    invoke-virtual {p1, p2, p2, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 51
    .line 52
    .line 53
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->g:F

    .line 54
    .line 55
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->d:Landroid/graphics/RectF;

    .line 56
    .line 57
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->m:I

    .line 58
    .line 59
    int-to-float v0, v0

    .line 60
    sub-float/2addr v0, p1

    .line 61
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->n:I

    .line 62
    .line 63
    int-to-float p0, p0

    .line 64
    sub-float/2addr p0, p1

    .line 65
    invoke-virtual {p2, p1, p1, v0, p0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public setBitmapRes(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->i:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->k:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setProgress(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->c(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setThreeDp(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->h:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
