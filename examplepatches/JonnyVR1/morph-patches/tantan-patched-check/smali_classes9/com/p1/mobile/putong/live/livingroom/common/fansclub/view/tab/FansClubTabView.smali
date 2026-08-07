.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView$b;
    }
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/qig;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView$b;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/z0m;

.field public d:Ll/r5m;

.field public e:I

.field public f:I

.field public g:I

.field public h:Landroid/graphics/Paint;

.field public i:Landroid/graphics/RectF;

.field public j:Z

.field public k:J

.field public l:F

.field public m:F

.field public n:F

.field public o:Landroid/view/ViewConfiguration;

.field public p:F

.field public q:Ll/acg;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 63
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance p3, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->b:Ljava/util/List;

    .line 17
    .line 18
    new-instance p3, Ll/sl5;

    .line 19
    .line 20
    invoke-direct {p3}, Ll/sl5;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->c:Ll/z0m;

    .line 24
    .line 25
    new-instance p3, Ll/lm5;

    .line 26
    .line 27
    invoke-direct {p3}, Ll/lm5;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->d:Ll/r5m;

    .line 31
    .line 32
    const/4 p3, 0x0

    .line 33
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->e:I

    .line 34
    .line 35
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->f:I

    .line 36
    .line 37
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->g:I

    .line 38
    .line 39
    new-instance p3, Landroid/graphics/Paint;

    .line 40
    .line 41
    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->h:Landroid/graphics/Paint;

    .line 45
    .line 46
    new-instance p3, Landroid/graphics/RectF;

    .line 47
    .line 48
    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->i:Landroid/graphics/RectF;

    .line 52
    .line 53
    const/4 p3, 0x1

    .line 54
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->j:Z

    .line 55
    .line 56
    const/4 p3, 0x0

    .line 57
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->n:F

    .line 58
    .line 59
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->l(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;Landroid/graphics/Canvas;Ll/qig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->o(Landroid/graphics/Canvas;Ll/qig;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;Landroidx/viewpager/widget/ViewPager;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->m(Landroidx/viewpager/widget/ViewPager;I)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->p(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->n(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView$b;)V

    return-void
.end method


# virtual methods
.method public e(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f(Landroidx/viewpager/widget/ViewPager;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/sdg;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Ll/sdg;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;Landroidx/viewpager/widget/ViewPager;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->e(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView$b;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->i()V

    .line 15
    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView$a;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->f:I

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Ll/qig;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->d:Ll/r5m;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Ll/qig;->b(Ll/r5m;)Ll/qig;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final g(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->f:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->f:I

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-ge p1, v0, :cond_2

    .line 24
    .line 25
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->f:I

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 28
    .line 29
    if-ne p1, v0, :cond_1

    .line 30
    .line 31
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ll/qig;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->d:Ll/r5m;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/qig;->b(Ll/r5m;)Ll/qig;

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/qig;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->c:Ll/z0m;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/qig;->a(Ll/z0m;)Ll/qig;

    .line 52
    .line 53
    .line 54
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->b:Ljava/util/List;

    .line 58
    .line 59
    new-instance v0, Ll/qdg;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/qdg;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 68
    .line 69
    .line 70
    :cond_3
    :goto_2
    return-void
.end method

.method public final h(F)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/qig;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/qig;->d()F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    sub-float v1, p1, v1

    .line 23
    .line 24
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->e:I

    .line 25
    .line 26
    int-to-float v2, v2

    .line 27
    sub-float/2addr v1, v2

    .line 28
    const/4 v2, 0x0

    .line 29
    cmpl-float v1, v1, v2

    .line 30
    .line 31
    if-lez v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ll/qig;

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/qig;->d()F

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->e:I

    .line 46
    .line 47
    int-to-float v2, v2

    .line 48
    add-float/2addr v1, v2

    .line 49
    sub-float/2addr p1, v1

    .line 50
    add-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-lt v0, p1, :cond_1

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    add-int/lit8 v0, p1, -0x1

    .line 68
    .line 69
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->g(I)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final i(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->n:F

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->i:Landroid/graphics/RectF;

    .line 12
    .line 13
    iget v1, v1, Landroid/graphics/RectF;->right:F

    .line 14
    .line 15
    const/high16 v2, 0x40000000    # 2.0f

    .line 16
    .line 17
    div-float/2addr v1, v2

    .line 18
    sub-float/2addr v0, v1

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v1, v1

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->i:Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    sub-float/2addr v1, v2

    .line 31
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->i:Landroid/graphics/RectF;

    .line 35
    .line 36
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->p:F

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->h:Landroid/graphics/Paint;

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final j(Ll/qig;Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/qig;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/qig;->d()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    invoke-virtual {p1}, Ll/qig;->c()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p1}, Ll/qig;->f()Landroid/text/TextPaint;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p2, p0, v0, v1, p1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->j:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final l(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->o:Landroid/view/ViewConfiguration;

    .line 11
    .line 12
    sget-object v0, Ll/vhc0;->e0:[I

    .line 13
    .line 14
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget p2, Ll/vhc0;->f0:I

    .line 19
    .line 20
    const v0, 0xffffff

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    sget v0, Ll/vhc0;->i0:I

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sget v2, Ll/vhc0;->g0:I

    .line 35
    .line 36
    invoke-virtual {p1, v2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    sget v3, Ll/vhc0;->h0:I

    .line 41
    .line 42
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    iput v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->p:F

    .line 47
    .line 48
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->h:Landroid/graphics/Paint;

    .line 49
    .line 50
    const/4 v4, 0x1

    .line 51
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->h:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {v3, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 57
    .line 58
    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->h:Landroid/graphics/Paint;

    .line 60
    .line 61
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 62
    .line 63
    invoke-virtual {p2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->i:Landroid/graphics/RectF;

    .line 67
    .line 68
    invoke-virtual {p0, v1, v1, v0, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 72
    .line 73
    .line 74
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic m(Landroidx/viewpager/widget/ViewPager;I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->q:Ll/acg;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansRecallEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;->hideFansRecallSelectPanel()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 p0, 0x1

    .line 23
    invoke-virtual {p1, p2, p0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView$b;)V
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->f:I

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView$b;->a(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic o(Landroid/graphics/Canvas;Ll/qig;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->g:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->j(Ll/qig;Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->g:I

    .line 12
    .line 13
    int-to-float p1, p1

    .line 14
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->e:I

    .line 15
    .line 16
    int-to-float v0, v0

    .line 17
    invoke-virtual {p2}, Ll/qig;->d()F

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    add-float/2addr v0, p2

    .line 22
    add-float/2addr p1, v0

    .line 23
    float-to-int p1, p1

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->g:I

    .line 25
    .line 26
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->g:I

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    div-int/lit8 v0, v0, 0x2

    .line 24
    .line 25
    int-to-float v0, v0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 31
    .line 32
    new-instance v1, Ll/rdg;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Ll/rdg;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;Landroid/graphics/Canvas;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->i(Landroid/graphics/Canvas;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x0

    .line 16
    move v1, v0

    .line 17
    :goto_0
    if-ge v0, p1, :cond_1

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ll/qig;

    .line 26
    .line 27
    int-to-float v1, v1

    .line 28
    invoke-virtual {v2}, Ll/qig;->d()F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    add-float/2addr v1, v2

    .line 33
    float-to-int v1, v1

    .line 34
    add-int/lit8 v2, p1, -0x1

    .line 35
    .line 36
    if-ge v0, v2, :cond_0

    .line 37
    .line 38
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->e:I

    .line 39
    .line 40
    add-int/2addr v1, v2

    .line 41
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0, v1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->l:F

    .line 16
    .line 17
    sub-float/2addr v0, v2

    .line 18
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->o:Landroid/view/ViewConfiguration;

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    int-to-float v2, v2

    .line 29
    cmpg-float v0, v0, v2

    .line 30
    .line 31
    if-gez v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->m:F

    .line 38
    .line 39
    sub-float/2addr v0, v2

    .line 40
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->o:Landroid/view/ViewConfiguration;

    .line 45
    .line 46
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    int-to-float v2, v2

    .line 51
    cmpg-float v0, v0, v2

    .line 52
    .line 53
    if-gez v0, :cond_2

    .line 54
    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->k:J

    .line 60
    .line 61
    sub-long/2addr v2, v4

    .line 62
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    int-to-long v4, v0

    .line 67
    cmp-long v0, v2, v4

    .line 68
    .line 69
    if-gez v0, :cond_2

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->h(F)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 84
    .line 85
    .line 86
    move-result-wide v2

    .line 87
    iput-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->k:J

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->l:F

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->m:F

    .line 100
    .line 101
    :cond_2
    :goto_0
    return v1
.end method

.method public final synthetic p(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/qig;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/qig;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->c:Ll/z0m;

    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ll/qig;->a(Ll/z0m;)Ll/qig;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public q(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/tdg;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/tdg;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public r(I)Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Ll/z0m;)Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->c:Ll/z0m;

    .line 4
    .line 5
    :cond_0
    return-object p0
.end method

.method public setPresenter(Ll/acg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->q:Ll/acg;

    .line 2
    .line 3
    return-void
.end method

.method public t(IF)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-gt v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    move v1, v0

    .line 21
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 22
    .line 23
    if-ge v0, p1, :cond_1

    .line 24
    .line 25
    int-to-float v1, v1

    .line 26
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ll/qig;

    .line 31
    .line 32
    invoke-virtual {v2}, Ll/qig;->d()F

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->e:I

    .line 37
    .line 38
    int-to-float v3, v3

    .line 39
    add-float/2addr v2, v3

    .line 40
    add-float/2addr v1, v2

    .line 41
    float-to-int v1, v1

    .line 42
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    int-to-float v0, v1

    .line 46
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Ll/qig;

    .line 51
    .line 52
    invoke-virtual {v1}, Ll/qig;->d()F

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/high16 v2, 0x40000000    # 2.0f

    .line 57
    .line 58
    div-float/2addr v1, v2

    .line 59
    add-float/2addr v0, v1

    .line 60
    float-to-int v0, v0

    .line 61
    const/4 v1, 0x0

    .line 62
    cmpl-float v1, p2, v1

    .line 63
    .line 64
    if-lez v1, :cond_2

    .line 65
    .line 66
    int-to-float v0, v0

    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 68
    .line 69
    add-int/lit8 v3, p1, 0x1

    .line 70
    .line 71
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Ll/qig;

    .line 76
    .line 77
    invoke-virtual {v1}, Ll/qig;->d()F

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    div-float/2addr v1, v2

    .line 82
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->a:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Ll/qig;

    .line 89
    .line 90
    invoke-virtual {p1}, Ll/qig;->d()F

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    div-float/2addr p1, v2

    .line 95
    add-float/2addr v1, p1

    .line 96
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->e:I

    .line 97
    .line 98
    int-to-float p1, p1

    .line 99
    add-float/2addr v1, p1

    .line 100
    mul-float/2addr v1, p2

    .line 101
    add-float/2addr v0, v1

    .line 102
    float-to-int v0, v0

    .line 103
    :cond_2
    int-to-float p1, v0

    .line 104
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->n:F

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 107
    .line 108
    .line 109
    :cond_3
    :goto_1
    return-void
.end method

.method public u(Ll/r5m;)Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->d:Ll/r5m;

    .line 4
    .line 5
    :cond_0
    return-object p0
.end method
