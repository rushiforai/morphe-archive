.class public Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaOvalShape;
.super Ll/fwb;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaOvalShape$OvalShapeMask;
    }
.end annotation


# instance fields
.field public f:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Ll/bwb;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fwb;-><init>(Ll/bwb;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Path;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaOvalShape;->f:Landroid/graphics/Path;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public b(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/fwb;->e:Ll/bwb;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/bwb;->q()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public f(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaOvalShape;->f:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaOvalShape;->f:Landroid/graphics/Path;

    .line 7
    .line 8
    sget-object v1, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 9
    .line 10
    invoke-virtual {v0, p2, v1}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaOvalShape;->f:Landroid/graphics/Path;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 19
    .line 20
    .line 21
    invoke-super {p0, p1, p2, p3}, Ll/fwb;->f(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public g()Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaShapeMask;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaOvalShape$OvalShapeMask;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaOvalShape$OvalShapeMask;-><init>(Ll/awb;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method
