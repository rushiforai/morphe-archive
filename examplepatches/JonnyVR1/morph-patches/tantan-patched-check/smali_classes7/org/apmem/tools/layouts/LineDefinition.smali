.class Lorg/apmem/tools/layouts/LineDefinition;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private lineLength:I

.field private lineStartLength:I

.field private lineStartThickness:I

.field private lineThickness:I

.field private final maxLength:I

.field private final views:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/apmem/tools/layouts/LineDefinition;->views:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineStartThickness:I

    .line 13
    .line 14
    iput v0, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineStartLength:I

    .line 15
    .line 16
    iput p1, p0, Lorg/apmem/tools/layouts/LineDefinition;->maxLength:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public addView(ILandroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 6
    .line 7
    iget-object v1, p0, Lorg/apmem/tools/layouts/LineDefinition;->views:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget p1, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineLength:I

    .line 13
    .line 14
    invoke-virtual {v0}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getLength()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    add-int/2addr p1, p2

    .line 19
    invoke-virtual {v0}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getSpacingLength()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    add-int/2addr p1, p2

    .line 24
    iput p1, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineLength:I

    .line 25
    .line 26
    iget p1, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineThickness:I

    .line 27
    .line 28
    invoke-virtual {v0}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getThickness()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    invoke-virtual {v0}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getSpacingThickness()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    add-int/2addr p2, v0

    .line 37
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineThickness:I

    .line 42
    .line 43
    return-void
.end method

.method public addView(Landroid/view/View;)V
    .locals 1

    .line 44
    iget-object v0, p0, Lorg/apmem/tools/layouts/LineDefinition;->views:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lorg/apmem/tools/layouts/LineDefinition;->addView(ILandroid/view/View;)V

    return-void
.end method

.method public canFit(Landroid/view/View;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 6
    .line 7
    iget v0, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineLength:I

    .line 8
    .line 9
    invoke-virtual {p1}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getLength()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/2addr v0, v1

    .line 14
    invoke-virtual {p1}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getSpacingLength()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    add-int/2addr v0, p1

    .line 19
    iget p0, p0, Lorg/apmem/tools/layouts/LineDefinition;->maxLength:I

    .line 20
    .line 21
    if-gt v0, p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public getLineLength()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineLength:I

    .line 2
    .line 3
    return p0
.end method

.method public getLineStartLength()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineStartLength:I

    .line 2
    .line 3
    return p0
.end method

.method public getLineStartThickness()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineStartThickness:I

    .line 2
    .line 3
    return p0
.end method

.method public getLineThickness()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineThickness:I

    .line 2
    .line 3
    return p0
.end method

.method public getViews()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/apmem/tools/layouts/LineDefinition;->views:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setLength(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineLength:I

    .line 2
    .line 3
    return-void
.end method

.method public setLineStartLength(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineStartLength:I

    .line 2
    .line 3
    return-void
.end method

.method public setLineStartThickness(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineStartThickness:I

    .line 2
    .line 3
    return-void
.end method

.method public setThickness(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/LineDefinition;->lineThickness:I

    .line 2
    .line 3
    return-void
.end method
