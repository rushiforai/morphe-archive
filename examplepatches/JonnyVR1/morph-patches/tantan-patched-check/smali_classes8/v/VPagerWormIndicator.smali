.class public Lv/VPagerWormIndicator;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# static fields
.field public static final m:I

.field public static final n:I

.field public static final o:I

.field public static final p:I

.field public static final q:I


# instance fields
.field public a:I

.field public b:I

.field public c:F

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:Ll/j0f0;

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/j0f0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/high16 v0, 0x40800000    # 4.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lv/VPagerWormIndicator;->m:I

    .line 8
    .line 9
    const/high16 v0, 0x41000000    # 8.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sput v1, Lv/VPagerWormIndicator;->n:I

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sput v1, Lv/VPagerWormIndicator;->o:I

    .line 22
    .line 23
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    sput v0, Lv/VPagerWormIndicator;->p:I

    .line 28
    .line 29
    const/high16 v0, 0x41800000    # 16.0f

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    sput v0, Lv/VPagerWormIndicator;->q:I

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, p1, v0}, Lv/VPagerWormIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p1, p2, v0}, Lv/VPagerWormIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput p3, p0, Lv/VPagerWormIndicator;->a:I

    .line 6
    .line 7
    iput p3, p0, Lv/VPagerWormIndicator;->b:I

    .line 8
    .line 9
    new-instance p3, Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    invoke-direct {p3, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 13
    .line 14
    .line 15
    iput-object p3, p0, Lv/VPagerWormIndicator;->l:Ljava/util/List;

    .line 16
    .line 17
    invoke-direct {p0, p1, p2}, Lv/VPagerWormIndicator;->d(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private d(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget-object v0, Ll/hhc0;->h4:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/hhc0;->i4:I

    .line 8
    .line 9
    const v0, -0x7f2f2f30

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-virtual {p0, p2}, Lv/VPagerWormIndicator;->setIndicatorColor(I)V

    .line 17
    .line 18
    .line 19
    sget p2, Ll/hhc0;->n4:I

    .line 20
    .line 21
    const v0, -0x2f2f30

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    invoke-virtual {p0, p2}, Lv/VPagerWormIndicator;->setSelectedIndicatorColor(I)V

    .line 29
    .line 30
    .line 31
    sget p2, Ll/hhc0;->k4:I

    .line 32
    .line 33
    sget v0, Lv/VPagerWormIndicator;->n:I

    .line 34
    .line 35
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    invoke-virtual {p0, p2}, Lv/VPagerWormIndicator;->setIndicatorMargin(I)V

    .line 40
    .line 41
    .line 42
    sget p2, Ll/hhc0;->m4:I

    .line 43
    .line 44
    sget v0, Lv/VPagerWormIndicator;->o:I

    .line 45
    .line 46
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    invoke-virtual {p0, p2}, Lv/VPagerWormIndicator;->setIndicatorWidth(I)V

    .line 51
    .line 52
    .line 53
    sget p2, Ll/hhc0;->o4:I

    .line 54
    .line 55
    sget v0, Lv/VPagerWormIndicator;->q:I

    .line 56
    .line 57
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    invoke-virtual {p0, p2}, Lv/VPagerWormIndicator;->setSelectedIndicatorWidth(I)V

    .line 62
    .line 63
    .line 64
    sget p2, Ll/hhc0;->j4:I

    .line 65
    .line 66
    sget v0, Lv/VPagerWormIndicator;->p:I

    .line 67
    .line 68
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    invoke-virtual {p0, p2}, Lv/VPagerWormIndicator;->setIndicatorHeight(I)V

    .line 73
    .line 74
    .line 75
    sget p2, Ll/hhc0;->l4:I

    .line 76
    .line 77
    sget v0, Lv/VPagerWormIndicator;->m:I

    .line 78
    .line 79
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    invoke-virtual {p0, p2}, Lv/VPagerWormIndicator;->setIndicatorRadius(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method private getIndicatorNeedWidth()I
    .locals 3

    .line 1
    iget-object v0, p0, Lv/VPagerWormIndicator;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    iget v1, p0, Lv/VPagerWormIndicator;->f:I

    .line 10
    .line 11
    mul-int/2addr v0, v1

    .line 12
    iget-object v1, p0, Lv/VPagerWormIndicator;->l:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    add-int/lit8 v1, v1, -0x1

    .line 19
    .line 20
    iget v2, p0, Lv/VPagerWormIndicator;->g:I

    .line 21
    .line 22
    mul-int/2addr v1, v2

    .line 23
    add-int/2addr v0, v1

    .line 24
    iget p0, p0, Lv/VPagerWormIndicator;->h:I

    .line 25
    .line 26
    add-int/2addr v0, p0

    .line 27
    return v0
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lv/VPagerWormIndicator;->k:Ll/j0f0;

    .line 3
    .line 4
    iget-object v0, p0, Lv/VPagerWormIndicator;->l:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Ll/zmd0;

    .line 14
    .line 15
    iget v1, p0, Lv/VPagerWormIndicator;->j:I

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/zmd0;-><init>(I)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Landroid/graphics/drawable/ShapeDrawable;

    .line 21
    .line 22
    invoke-direct {v1, v0}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/j0f0;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ll/j0f0;-><init>(Landroid/graphics/drawable/ShapeDrawable;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lv/VPagerWormIndicator;->k:Ll/j0f0;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget v1, p0, Lv/VPagerWormIndicator;->e:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 39
    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lv/VPagerWormIndicator;->k:Ll/j0f0;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/j0f0;->e(Landroid/graphics/Paint;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final b(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lv/VPagerWormIndicator;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    if-ge v0, p1, :cond_0

    .line 8
    .line 9
    new-instance v1, Ll/zmd0;

    .line 10
    .line 11
    iget v2, p0, Lv/VPagerWormIndicator;->j:I

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ll/zmd0;-><init>(I)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Landroid/graphics/drawable/ShapeDrawable;

    .line 17
    .line 18
    invoke-direct {v2, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/j0f0;

    .line 22
    .line 23
    invoke-direct {v1, v2}, Ll/j0f0;-><init>(Landroid/graphics/drawable/ShapeDrawable;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget v3, p0, Lv/VPagerWormIndicator;->d:I

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 33
    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ll/j0f0;->e(Landroid/graphics/Paint;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lv/VPagerWormIndicator;->l:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    return-void
.end method

.method public final c(Landroid/graphics/Canvas;Ll/j0f0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/j0f0;->b()F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    invoke-virtual {p2}, Ll/j0f0;->c()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Ll/j0f0;->a()Landroid/graphics/drawable/ShapeDrawable;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/ShapeDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final e(II)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lv/VPagerWormIndicator;->getIndicatorNeedWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int/2addr p1, v0

    .line 6
    div-int/lit8 p1, p1, 0x2

    .line 7
    .line 8
    iget v0, p0, Lv/VPagerWormIndicator;->i:I

    .line 9
    .line 10
    sub-int/2addr p2, v0

    .line 11
    div-int/lit8 p2, p2, 0x2

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    iget-object v1, p0, Lv/VPagerWormIndicator;->l:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-ge v0, v1, :cond_2

    .line 21
    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    iget v1, p0, Lv/VPagerWormIndicator;->f:I

    .line 25
    .line 26
    add-int/2addr p1, v1

    .line 27
    :cond_0
    iget-object v1, p0, Lv/VPagerWormIndicator;->l:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/j0f0;

    .line 34
    .line 35
    iget v2, p0, Lv/VPagerWormIndicator;->g:I

    .line 36
    .line 37
    int-to-float v2, v2

    .line 38
    iget v3, p0, Lv/VPagerWormIndicator;->i:I

    .line 39
    .line 40
    int-to-float v3, v3

    .line 41
    invoke-virtual {v1, v2, v3}, Ll/j0f0;->d(FF)V

    .line 42
    .line 43
    .line 44
    int-to-float v2, p1

    .line 45
    invoke-virtual {v1, v2}, Ll/j0f0;->f(F)V

    .line 46
    .line 47
    .line 48
    int-to-float v2, p2

    .line 49
    invoke-virtual {v1, v2}, Ll/j0f0;->g(F)V

    .line 50
    .line 51
    .line 52
    iget v1, p0, Lv/VPagerWormIndicator;->a:I

    .line 53
    .line 54
    if-ne v1, v0, :cond_1

    .line 55
    .line 56
    iget v1, p0, Lv/VPagerWormIndicator;->h:I

    .line 57
    .line 58
    :goto_1
    add-int/2addr p1, v1

    .line 59
    goto :goto_2

    .line 60
    :cond_1
    iget v1, p0, Lv/VPagerWormIndicator;->g:I

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    return-void
.end method

.method public final f(IF)V
    .locals 3

    .line 1
    iget-object v0, p0, Lv/VPagerWormIndicator;->k:Ll/j0f0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lv/VPagerWormIndicator;->l:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lv/VPagerWormIndicator;->l:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/j0f0;

    .line 21
    .line 22
    iget-object v0, p0, Lv/VPagerWormIndicator;->k:Ll/j0f0;

    .line 23
    .line 24
    iget v1, p0, Lv/VPagerWormIndicator;->h:I

    .line 25
    .line 26
    int-to-float v1, v1

    .line 27
    iget v2, p0, Lv/VPagerWormIndicator;->i:I

    .line 28
    .line 29
    int-to-float v2, v2

    .line 30
    invoke-virtual {v0, v1, v2}, Ll/j0f0;->d(FF)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ll/j0f0;->b()F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget v1, p0, Lv/VPagerWormIndicator;->f:I

    .line 38
    .line 39
    iget v2, p0, Lv/VPagerWormIndicator;->g:I

    .line 40
    .line 41
    add-int/2addr v1, v2

    .line 42
    int-to-float v1, v1

    .line 43
    mul-float/2addr v1, p2

    .line 44
    add-float/2addr v0, v1

    .line 45
    iget-object p2, p0, Lv/VPagerWormIndicator;->k:Ll/j0f0;

    .line 46
    .line 47
    invoke-virtual {p2, v0}, Ll/j0f0;->f(F)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lv/VPagerWormIndicator;->k:Ll/j0f0;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/j0f0;->c()F

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-virtual {p0, p1}, Ll/j0f0;->g(F)V

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    return-void
.end method

.method public final g(IF)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VPagerWormIndicator;->a:I

    .line 2
    .line 3
    iput p2, p0, Lv/VPagerWormIndicator;->c:F

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    int-to-float v4, v0

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    int-to-float v5, v0

    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    move-object v1, p1

    .line 18
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget-object v0, p0, Lv/VPagerWormIndicator;->l:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ll/j0f0;

    .line 39
    .line 40
    invoke-virtual {p0, v1, v2}, Lv/VPagerWormIndicator;->c(Landroid/graphics/Canvas;Ll/j0f0;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object v0, p0, Lv/VPagerWormIndicator;->k:Ll/j0f0;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lv/VPagerWormIndicator;->k:Ll/j0f0;

    .line 53
    .line 54
    invoke-virtual {p0, v1, v0}, Lv/VPagerWormIndicator;->c(Landroid/graphics/Canvas;Ll/j0f0;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-virtual {p0, p1, p2}, Lv/VPagerWormIndicator;->e(II)V

    .line 13
    .line 14
    .line 15
    iget p1, p0, Lv/VPagerWormIndicator;->a:I

    .line 16
    .line 17
    iget p2, p0, Lv/VPagerWormIndicator;->c:F

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Lv/VPagerWormIndicator;->f(IF)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Ll/dox;->c(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {p2}, Ll/dox;->c(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/high16 v2, 0x40000000    # 2.0f

    .line 18
    .line 19
    if-eq p1, v2, :cond_0

    .line 20
    .line 21
    invoke-direct {p0}, Lv/VPagerWormIndicator;->getIndicatorNeedWidth()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    add-int/2addr p1, v3

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    add-int/2addr p1, v3

    .line 35
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    :cond_0
    if-eq p2, v2, :cond_1

    .line 40
    .line 41
    iget p1, p0, Lv/VPagerWormIndicator;->i:I

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    add-int/2addr p1, p2

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    add-int/2addr p1, p2

    .line 53
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    :cond_1
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Lv/VPagerWormIndicator;->b:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Lv/VPagerWormIndicator;->g(IF)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lv/VPagerWormIndicator;->g(IF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VPagerWormIndicator;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public setCurrentItem(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VPagerWormIndicator;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public setIndicatorColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lv/VPagerWormIndicator;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public setIndicatorHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VPagerWormIndicator;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public setIndicatorMargin(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VPagerWormIndicator;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public setIndicatorRadius(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VPagerWormIndicator;->j:I

    .line 2
    .line 3
    return-void
.end method

.method public setIndicatorWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VPagerWormIndicator;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setSelectedIndicatorColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lv/VPagerWormIndicator;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public setSelectedIndicatorWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VPagerWormIndicator;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public setViewPager(Landroidx/viewpager/widget/ViewPager;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->P(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0, v0}, Lv/VPagerWormIndicator;->b(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lv/VPagerWormIndicator;->a()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0, p1}, Lv/VPagerWormIndicator;->setCurrentItem(I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p0, "ViewPager must has set Adapter first before bind pager with indicator"

    .line 36
    .line 37
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
