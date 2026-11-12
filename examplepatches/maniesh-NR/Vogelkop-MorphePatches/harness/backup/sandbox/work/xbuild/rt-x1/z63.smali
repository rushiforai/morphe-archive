.class public final Lz63;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly63;


# instance fields
.field public a:F

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lz63;->a:F

    iput-object p1, p0, Lz63;->b:Ljava/lang/Object;

    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    iput-object v0, p0, Lz63;->c:Ljava/lang/Object;

    new-instance v1, Lqfb;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/16 v2, 0xb

    invoke-direct {v1, p1, v2}, Lqfb;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lz63;->d:Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result p1

    if-eqz p1, :cond_2d

    const/4 p1, 0x0

    iput p1, p0, Lz63;->a:F

    :cond_2d
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 3

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lz63;->d:Ljava/lang/Object;

    const/high16 v0, -0x40800000    # -1.0f

    .line 48
    iput v0, p0, Lz63;->a:F

    .line 49
    iput-object p1, p0, Lz63;->b:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 50
    invoke-virtual {p0, p1}, Lz63;->a(F)Lzvb;

    move-result-object p1

    iput-object p1, p0, Lz63;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lpt1;)V
    .registers 4

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz63;->b:Ljava/lang/Object;

    .line 52
    iget-object v0, p1, Lpt1;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    .line 53
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lz63;->a:F

    .line 54
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lz63;->c:Ljava/lang/Object;

    .line 55
    iget-object p1, p1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Landroid/widget/FrameLayout;

    .line 56
    new-instance v0, Lr2n;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lr2n;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lr5n;->a:Ljava/util/WeakHashMap;

    .line 57
    invoke-static {p1, v0}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    return-void
.end method


# virtual methods
.method public final a(F)Lzvb;
    .registers 7

    iget-object v0, p0, Lz63;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    const/4 v1, 0x1

    invoke-static {v1, v0}, Lam2;->l(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzvb;

    invoke-virtual {v2}, Lzvb;->b()F

    move-result v3

    cmpl-float v3, p1, v3

    if-ltz v3, :cond_14

    return-object v2

    :cond_14
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    :goto_1a
    if-lt v2, v1, :cond_3c

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzvb;

    iget-object v4, p0, Lz63;->c:Ljava/lang/Object;

    check-cast v4, Lzvb;

    if-eq v4, v3, :cond_39

    invoke-virtual {v3}, Lzvb;->b()F

    move-result v4

    cmpl-float v4, p1, v4

    if-ltz v4, :cond_39

    invoke-virtual {v3}, Lzvb;->a()F

    move-result v4

    cmpg-float v4, p1, v4

    if-gez v4, :cond_39

    return-object v3

    :cond_39
    add-int/lit8 v2, v2, -0x1

    goto :goto_1a

    :cond_3c
    const/4 p0, 0x0

    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzvb;

    return-object p0
.end method

.method public final b(Landroid/graphics/Rect;)V
    .registers 10

    iget-object v0, p0, Lz63;->b:Ljava/lang/Object;

    check-cast v0, Lpt1;

    iget-object v1, p0, Lz63;->c:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Rect;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    return-void

    :cond_f
    iput-object p1, p0, Lz63;->c:Ljava/lang/Object;

    iget-object v1, p0, Lz63;->d:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/content_public/browser/WebContents;

    if-eqz v1, :cond_4d

    new-instance v2, Landroid/graphics/Rect;

    iget v3, p1, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    iget p0, p0, Lz63;->a:F

    div-float/2addr v3, p0

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-float v3, v3

    float-to-int v3, v3

    iget v4, p1, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    div-float/2addr v4, p0

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-float v4, v4

    float-to-int v4, v4

    iget v5, p1, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    div-float/2addr v5, p0

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-float v5, v5

    float-to-int v5, v5

    iget v6, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, v6

    div-float/2addr v6, p0

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-float p0, v6

    float-to-int p0, p0

    invoke-direct {v2, v3, v4, v5, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-interface {v1, v2}, Lorg/chromium/content_public/browser/WebContents;->Q(Landroid/graphics/Rect;)V

    :cond_4d
    iget-object p0, v0, Lpt1;->d:Ljava/lang/Object;

    check-cast p0, Lv88;

    iget-object p0, p0, Lv88;->b:Landroid/widget/LinearLayout;

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget v3, p1, Landroid/graphics/Rect;->right:I

    iget v4, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    iget-object p0, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Lb98;

    iget-object p0, p0, Lb98;->b:Landroid/widget/FrameLayout;

    iget v0, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->top:I

    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public final f(F)Z
    .registers 4

    iget-object v0, p0, Lz63;->d:Ljava/lang/Object;

    check-cast v0, Lzvb;

    iget-object v1, p0, Lz63;->c:Ljava/lang/Object;

    check-cast v1, Lzvb;

    if-ne v0, v1, :cond_12

    iget v0, p0, Lz63;->a:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    iput-object v1, p0, Lz63;->d:Ljava/lang/Object;

    iput p1, p0, Lz63;->a:F

    const/4 p0, 0x0

    return p0
.end method

.method public final h()Lzvb;
    .registers 1

    iget-object p0, p0, Lz63;->c:Ljava/lang/Object;

    check-cast p0, Lzvb;

    return-object p0
.end method

.method public final i(F)Z
    .registers 5

    iget-object v0, p0, Lz63;->c:Ljava/lang/Object;

    check-cast v0, Lzvb;

    invoke-virtual {v0}, Lzvb;->b()F

    move-result v1

    cmpl-float v1, p1, v1

    const/4 v2, 0x1

    if-ltz v1, :cond_1f

    invoke-virtual {v0}, Lzvb;->a()F

    move-result v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1f

    iget-object p0, p0, Lz63;->c:Ljava/lang/Object;

    check-cast p0, Lzvb;

    invoke-virtual {p0}, Lzvb;->c()Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    :cond_1f
    invoke-virtual {p0, p1}, Lz63;->a(F)Lzvb;

    move-result-object p1

    iput-object p1, p0, Lz63;->c:Ljava/lang/Object;

    return v2
.end method

.method public final isEmpty()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final k()F
    .registers 2

    iget-object p0, p0, Lz63;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzvb;

    invoke-virtual {p0}, Lzvb;->b()F

    move-result p0

    return p0
.end method

.method public final u()F
    .registers 2

    iget-object p0, p0, Lz63;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    const/4 v0, 0x1

    invoke-static {v0, p0}, Lam2;->l(ILjava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzvb;

    invoke-virtual {p0}, Lzvb;->a()F

    move-result p0

    return p0
.end method
