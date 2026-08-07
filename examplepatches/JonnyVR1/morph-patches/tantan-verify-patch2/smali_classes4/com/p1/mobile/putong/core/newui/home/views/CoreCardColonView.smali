.class public Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->a()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    const/high16 v0, 0x41800000    # 16.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->a:I

    .line 8
    .line 9
    const/high16 v0, 0x42000000    # 32.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->b:I

    .line 16
    .line 17
    const/high16 v0, 0x40200000    # 2.5f

    .line 18
    .line 19
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->d:I

    .line 24
    .line 25
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->b:I

    .line 26
    .line 27
    div-int/lit8 v0, v0, 0x5

    .line 28
    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->c:I

    .line 30
    .line 31
    new-instance v0, Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->e:Landroid/graphics/Paint;

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->e:Landroid/graphics/Paint;

    .line 43
    .line 44
    const/4 v0, -0x1

    .line 45
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->a:I

    .line 5
    .line 6
    div-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    int-to-float v0, v0

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->b:I

    .line 10
    .line 11
    div-int/lit8 v1, v1, 0x2

    .line 12
    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->c:I

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    int-to-float v1, v1

    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->d:I

    .line 18
    .line 19
    int-to-float v2, v2

    .line 20
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->e:Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 23
    .line 24
    .line 25
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->a:I

    .line 26
    .line 27
    div-int/lit8 v0, v0, 0x2

    .line 28
    .line 29
    int-to-float v0, v0

    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->b:I

    .line 31
    .line 32
    div-int/lit8 v1, v1, 0x2

    .line 33
    .line 34
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->c:I

    .line 35
    .line 36
    add-int/2addr v1, v2

    .line 37
    int-to-float v1, v1

    .line 38
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->d:I

    .line 39
    .line 40
    int-to-float v2, v2

    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->e:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->a:I

    .line 2
    .line 3
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardColonView;->b:I

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
