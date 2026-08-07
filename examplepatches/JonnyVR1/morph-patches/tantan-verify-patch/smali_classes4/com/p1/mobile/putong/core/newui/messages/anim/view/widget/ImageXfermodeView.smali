.class public Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;
.super Lv/VDraweeView;
.source "SourceFile"


# instance fields
.field public o:F

.field public p:Landroid/graphics/Paint;

.field public q:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->o:F

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->q:Z

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->u()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->o:F

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->q:Z

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->u()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->o:F

    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->q:Z

    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->u()V

    return-void
.end method

.method private u()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->p:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->p:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->p:Landroid/graphics/Paint;

    .line 20
    .line 21
    const/4 v1, -0x1

    .line 22
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->p:Landroid/graphics/Paint;

    .line 26
    .line 27
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    .line 28
    .line 29
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 30
    .line 31
    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v4, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v5, v0

    .line 11
    const/4 v6, 0x0

    .line 12
    const/16 v7, 0x1f

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    move-object v1, p1

    .line 17
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-super {p0, v1}, Lv/VDraweeView;->onDraw(Landroid/graphics/Canvas;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-float v0, v0

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    int-to-float v2, v2

    .line 34
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->q:Z

    .line 35
    .line 36
    if-eqz v3, :cond_0

    .line 37
    .line 38
    sget v0, Ll/qa00;->i:I

    .line 39
    .line 40
    int-to-float v3, v0

    .line 41
    sub-float/2addr v2, v3

    .line 42
    int-to-float v0, v0

    .line 43
    const/high16 v3, 0x41000000    # 8.0f

    .line 44
    .line 45
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    int-to-float v3, v3

    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->p:Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-virtual {v1, v2, v0, v3, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/high16 v3, 0x40000000    # 2.0f

    .line 57
    .line 58
    div-float/2addr v2, v3

    .line 59
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->o:F

    .line 60
    .line 61
    add-float/2addr v2, v4

    .line 62
    div-float/2addr v0, v3

    .line 63
    sget v3, Ll/qa00;->c:I

    .line 64
    .line 65
    int-to-float v3, v3

    .line 66
    add-float/2addr v3, v0

    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->p:Landroid/graphics/Paint;

    .line 68
    .line 69
    invoke-virtual {v1, v2, v0, v3, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 70
    .line 71
    .line 72
    :goto_0
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public setCustomXYAndRadius(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->q:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->o:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
