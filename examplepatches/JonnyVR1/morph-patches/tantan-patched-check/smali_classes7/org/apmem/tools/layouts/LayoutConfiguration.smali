.class Lorg/apmem/tools/layouts/LayoutConfiguration;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private debugDraw:Z

.field private gravity:I

.field private layoutDirection:I

.field private orientation:I

.field private weightDefault:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->orientation:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->debugDraw:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->weightDefault:F

    .line 11
    .line 12
    const/16 v2, 0x33

    .line 13
    .line 14
    iput v2, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->gravity:I

    .line 15
    .line 16
    iput v0, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->layoutDirection:I

    .line 17
    .line 18
    sget-object v2, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout:[I

    .line 19
    .line 20
    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :try_start_0
    sget p2, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout_android_orientation:I

    .line 25
    .line 26
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    invoke-virtual {p0, p2}, Lorg/apmem/tools/layouts/LayoutConfiguration;->setOrientation(I)V

    .line 31
    .line 32
    .line 33
    sget p2, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout_debugDraw:I

    .line 34
    .line 35
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    invoke-virtual {p0, p2}, Lorg/apmem/tools/layouts/LayoutConfiguration;->setDebugDraw(Z)V

    .line 40
    .line 41
    .line 42
    sget p2, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout_weightDefault:I

    .line 43
    .line 44
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    invoke-virtual {p0, p2}, Lorg/apmem/tools/layouts/LayoutConfiguration;->setWeightDefault(F)V

    .line 49
    .line 50
    .line 51
    sget p2, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout_android_gravity:I

    .line 52
    .line 53
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    invoke-virtual {p0, p2}, Lorg/apmem/tools/layouts/LayoutConfiguration;->setGravity(I)V

    .line 58
    .line 59
    .line 60
    sget p2, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout_layoutDirection:I

    .line 61
    .line 62
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    invoke-virtual {p0, p2}, Lorg/apmem/tools/layouts/LayoutConfiguration;->setLayoutDirection(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :catchall_0
    move-exception p0

    .line 74
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 75
    .line 76
    .line 77
    throw p0
.end method


# virtual methods
.method public getGravity()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->gravity:I

    .line 2
    .line 3
    return p0
.end method

.method public getLayoutDirection()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->layoutDirection:I

    .line 2
    .line 3
    return p0
.end method

.method public getOrientation()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->orientation:I

    .line 2
    .line 3
    return p0
.end method

.method public getWeightDefault()F
    .locals 0

    .line 1
    iget p0, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->weightDefault:F

    .line 2
    .line 3
    return p0
.end method

.method public isDebugDraw()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->debugDraw:Z

    .line 2
    .line 3
    return p0
.end method

.method public setDebugDraw(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->debugDraw:Z

    .line 2
    .line 3
    return-void
.end method

.method public setGravity(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->gravity:I

    .line 2
    .line 3
    return-void
.end method

.method public setLayoutDirection(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iput p1, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->layoutDirection:I

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->layoutDirection:I

    .line 9
    .line 10
    return-void
.end method

.method public setOrientation(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iput p1, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->orientation:I

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->orientation:I

    .line 9
    .line 10
    return-void
.end method

.method public setWeightDefault(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iput p1, p0, Lorg/apmem/tools/layouts/LayoutConfiguration;->weightDefault:F

    .line 7
    .line 8
    return-void
.end method
