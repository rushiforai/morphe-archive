.class public Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;
.super Landroid/view/animation/Animation;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public final c:Z

.field public final d:Z

.field public e:Landroid/graphics/Camera;

.field public final synthetic f:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;ZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->f:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->c:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->d:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 6

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->a:F

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->b:F

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->e:Landroid/graphics/Camera;

    .line 6
    .line 7
    iget-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->d:Z

    .line 8
    .line 9
    if-eqz v3, :cond_0

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v3, -0x1

    .line 14
    :goto_0
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {v2}, Landroid/graphics/Camera;->save()V

    .line 19
    .line 20
    .line 21
    iget-boolean v4, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->c:Z

    .line 22
    .line 23
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->b:F

    .line 24
    .line 25
    const/4 v5, 0x0

    .line 26
    if-eqz v4, :cond_1

    .line 27
    .line 28
    int-to-float v3, v3

    .line 29
    mul-float/2addr v3, p0

    .line 30
    const/high16 p0, 0x3f800000    # 1.0f

    .line 31
    .line 32
    sub-float/2addr p1, p0

    .line 33
    mul-float/2addr v3, p1

    .line 34
    invoke-virtual {v2, v5, v3, v5}, Landroid/graphics/Camera;->translate(FFF)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    int-to-float v3, v3

    .line 39
    mul-float/2addr v3, p0

    .line 40
    mul-float/2addr v3, p1

    .line 41
    invoke-virtual {v2, v5, v3, v5}, Landroid/graphics/Camera;->translate(FFF)V

    .line 42
    .line 43
    .line 44
    :goto_1
    invoke-virtual {v2, p2}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Landroid/graphics/Camera;->restore()V

    .line 48
    .line 49
    .line 50
    neg-float p0, v0

    .line 51
    neg-float p1, v1

    .line 52
    invoke-virtual {p2, p0, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public initialize(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/animation/Animation;->initialize(IIII)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Camera;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Camera;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->e:Landroid/graphics/Camera;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->f:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    int-to-float p1, p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->b:F

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->f:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    int-to-float p1, p1

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;->a:F

    .line 28
    .line 29
    return-void
.end method
