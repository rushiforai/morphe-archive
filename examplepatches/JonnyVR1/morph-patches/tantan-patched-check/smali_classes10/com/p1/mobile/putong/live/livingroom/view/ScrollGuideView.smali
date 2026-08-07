.class public Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:F

.field public c:F

.field public d:I

.field public e:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Paint;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->a:Landroid/graphics/Paint;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->b:F

    .line 14
    .line 15
    const/high16 p1, 0x42dc0000    # 110.0f

    .line 16
    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    int-to-float p1, p1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->c:F

    .line 23
    .line 24
    const/high16 p1, 0x42280000    # 42.0f

    .line 25
    .line 26
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->d:I

    .line 31
    .line 32
    const/high16 p1, 0x42680000    # 58.0f

    .line 33
    .line 34
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->e:I

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->a:Landroid/graphics/Paint;

    .line 41
    .line 42
    const-string v0, "#D0D0D0"

    .line 43
    .line 44
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->a:Landroid/graphics/Paint;

    .line 52
    .line 53
    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 59
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->a:Landroid/graphics/Paint;

    const/4 p1, 0x0

    .line 61
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->b:F

    const/high16 p1, 0x42dc0000    # 110.0f

    .line 62
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->c:F

    const/high16 p1, 0x42280000    # 42.0f

    .line 63
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->d:I

    const/high16 p1, 0x42680000    # 58.0f

    .line 64
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->e:I

    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->a:Landroid/graphics/Paint;

    const-string p2, "#D0D0D0"

    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->a:Landroid/graphics/Paint;

    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 67
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 68
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->a:Landroid/graphics/Paint;

    const/4 p1, 0x0

    .line 69
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->b:F

    const/high16 p1, 0x42dc0000    # 110.0f

    .line 70
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->c:F

    const/high16 p1, 0x42280000    # 42.0f

    .line 71
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->d:I

    const/high16 p1, 0x42680000    # 58.0f

    .line 72
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->e:I

    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->a:Landroid/graphics/Paint;

    const-string p2, "#D0D0D0"

    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->a:Landroid/graphics/Paint;

    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method


# virtual methods
.method public a(FF)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    int-to-float p1, p1

    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->b:F

    .line 7
    .line 8
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    int-to-float p1, p1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->c:F

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->d:I

    .line 5
    .line 6
    int-to-float v2, v0

    .line 7
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->b:F

    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->e:I

    .line 10
    .line 11
    int-to-float v4, v0

    .line 12
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->c:F

    .line 13
    .line 14
    const/high16 v7, 0x42200000    # 40.0f

    .line 15
    .line 16
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->a:Landroid/graphics/Paint;

    .line 17
    .line 18
    const/high16 v6, 0x42200000    # 40.0f

    .line 19
    .line 20
    move-object v1, p1

    .line 21
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
