.class public Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apmem/tools/layouts/FlowLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field private gravity:I

.field private inlineStartLength:I

.field private inlineStartThickness:I

.field private length:I

.field private newLine:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        mapping = {
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x0
                to = "NONE"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x30
                to = "TOP"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x50
                to = "BOTTOM"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x3
                to = "LEFT"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x5
                to = "RIGHT"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x10
                to = "CENTER_VERTICAL"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x70
                to = "FILL_VERTICAL"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x1
                to = "CENTER_HORIZONTAL"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x7
                to = "FILL_HORIZONTAL"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x11
                to = "CENTER"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x77
                to = "FILL"
            .end subannotation
        }
    .end annotation
.end field

.field private orientation:I

.field private thickness:I

.field private weight:F

.field private x:I

.field private y:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->newLine:Z

    .line 19
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->gravity:I

    const/high16 p1, -0x40800000    # -1.0f

    .line 20
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->weight:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->newLine:Z

    .line 6
    .line 7
    iput v0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->gravity:I

    .line 8
    .line 9
    const/high16 v0, -0x40800000    # -1.0f

    .line 10
    .line 11
    iput v0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->weight:F

    .line 12
    .line 13
    invoke-direct {p0, p1, p2}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->readStyleParameters(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->newLine:Z

    .line 23
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->gravity:I

    const/high16 p1, -0x40800000    # -1.0f

    .line 24
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->weight:F

    return-void
.end method

.method public static synthetic access$002(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;I)I
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->orientation:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->y:I

    .line 2
    .line 3
    return p0
.end method

.method private readStyleParameters(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget-object v0, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout_LayoutParams:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    :try_start_0
    sget p2, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout_LayoutParams_layout_newLine:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    iput-boolean p2, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->newLine:Z

    .line 15
    .line 16
    sget p2, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout_LayoutParams_android_layout_gravity:I

    .line 17
    .line 18
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iput p2, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->gravity:I

    .line 23
    .line 24
    sget p2, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout_LayoutParams_layout_weight:I

    .line 25
    .line 26
    const/high16 v0, -0x40800000    # -1.0f

    .line 27
    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput p2, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->weight:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 40
    .line 41
    .line 42
    throw p0
.end method


# virtual methods
.method public getGravity()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->gravity:I

    .line 2
    .line 3
    return p0
.end method

.method public getInlineStartLength()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->inlineStartLength:I

    .line 2
    .line 3
    return p0
.end method

.method public getInlineStartThickness()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->inlineStartThickness:I

    .line 2
    .line 3
    return p0
.end method

.method public getLength()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->length:I

    .line 2
    .line 3
    return p0
.end method

.method public getSpacingLength()I
    .locals 1

    .line 1
    iget v0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->orientation:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 6
    .line 7
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 8
    .line 9
    :goto_0
    add-int/2addr v0, p0

    .line 10
    return v0

    .line 11
    :cond_0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 12
    .line 13
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 14
    .line 15
    goto :goto_0
.end method

.method public getSpacingThickness()I
    .locals 1

    .line 1
    iget v0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->orientation:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 6
    .line 7
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 8
    .line 9
    :goto_0
    add-int/2addr v0, p0

    .line 10
    return v0

    .line 11
    :cond_0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 12
    .line 13
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 14
    .line 15
    goto :goto_0
.end method

.method public getThickness()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->thickness:I

    .line 2
    .line 3
    return p0
.end method

.method public getWeight()F
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->weight:F

    .line 2
    .line 3
    return p0
.end method

.method public getX()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public getY()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public gravitySpecified()Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->gravity:I

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isNewLine()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->newLine:Z

    .line 2
    .line 3
    return p0
.end method

.method public setGravity(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->gravity:I

    .line 2
    .line 3
    return-void
.end method

.method public setInlineStartLength(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->inlineStartLength:I

    .line 2
    .line 3
    return-void
.end method

.method public setInlineStartThickness(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->inlineStartThickness:I

    .line 2
    .line 3
    return-void
.end method

.method public setLength(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->length:I

    .line 2
    .line 3
    return-void
.end method

.method public setNewLine(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->newLine:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPosition(II)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->x:I

    .line 2
    .line 3
    iput p2, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->y:I

    .line 4
    .line 5
    return-void
.end method

.method public setThickness(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->thickness:I

    .line 2
    .line 3
    return-void
.end method

.method public setWeight(F)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->weight:F

    .line 2
    .line 3
    return-void
.end method

.method public weightSpecified()Z
    .locals 1

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->weight:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    cmpl-float p0, p0, v0

    .line 5
    .line 6
    if-ltz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method
