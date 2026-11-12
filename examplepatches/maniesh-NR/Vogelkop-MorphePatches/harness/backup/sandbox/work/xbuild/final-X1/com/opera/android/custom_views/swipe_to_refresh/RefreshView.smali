.class public Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static final synthetic e:I


# instance fields
.field public final a:[I

.field public final b:Lwth;

.field public c:I

.field public d:Llaj;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x4

    new-array p2, p2, [I

    iput-object p2, p0, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->a:[I

    new-instance p2, Landroid/graphics/Rect;

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput v0, p0, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->c:I

    sget-object v0, Llaj;->e:Llaj;

    iput-object v0, p0, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->d:Llaj;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f07088b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070886

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    new-instance v0, Lwth;

    invoke-direct {v0, p1}, Lwth;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->b:Lwth;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f07088e

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->a()V

    new-instance p1, Lkkf;

    const/16 p2, 0xb

    invoke-direct {p1, p0, p2}, Lkkf;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-nez p2, :cond_5f

    return-void

    :cond_5f
    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f040808

    const v2, 0x7f0600b6

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    const v1, 0x7f040805

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0xff

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    const v1, 0x7f0600a7

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v4

    iget-object v5, p0, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->b:Lwth;

    iget-object v5, v5, Lwth;->b:Ljava/lang/Object;

    check-cast v5, Lz9h;

    iput v4, v5, Lz9h;->c:I

    const v4, 0x7f040807

    filled-new-array {v4}, [I

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    const v2, 0x7f040806

    invoke-static {v2, v0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 2

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f070883

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    const/4 p3, 0x0

    rsub-int/lit8 p2, p2, 0x0

    iget-object p4, p0, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->a:[I

    aput p2, p4, p3

    const/4 p2, 0x1

    aput p3, p4, p2

    const p2, 0x7f070887

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    rsub-int/lit8 p2, p2, 0x0

    const/4 p5, 0x2

    aput p2, p4, p5

    const p2, 0x7f070891

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    sub-int/2addr p3, p1

    const/4 p1, 0x3

    aput p3, p4, p1

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final setBackgroundColor(I)V
    .registers 2

    return-void
.end method
