.class public Lcom/opera/android/bar/TopToolbarContainer;
.super Lcom/opera/android/InputFilterOptimizedFrameLayout;
.source "SourceFile"


# static fields
.field public static final synthetic j:I


# instance fields
.field public final c:Landroid/graphics/Rect;

.field public d:Z

.field public e:I

.field public f:I

.field public g:Lvvl;

.field public h:Lxy4;

.field public final i:Lcbl;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/opera/android/InputFilterOptimizedFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/opera/android/bar/TopToolbarContainer;->c:Landroid/graphics/Rect;

    new-instance p1, Lcbl;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Lcbl;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/bar/TopToolbarContainer;->i:Lcbl;

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Rect;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/bar/TopToolbarContainer;->g:Lvvl;

    if-eqz v0, :cond_26

    iget v1, v0, Lvvl;->d:I

    iget-object v2, v0, Lvvl;->a:Landroid/view/View;

    iget-object v0, v0, Lvvl;->b:Landroid/graphics/Rect;

    const/4 v3, 0x0

    if-nez p1, :cond_15

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result p1

    invoke-virtual {v0, v3, v3, p1, v1}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_22

    :cond_15
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {p1, v3, v3, v2, v1}, Landroid/graphics/Rect;->intersect(IIII)Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    :cond_22
    :goto_22
    iget-boolean p1, p0, Lcom/opera/android/bar/TopToolbarContainer;->d:Z

    if-eqz p1, :cond_27

    :cond_26
    return-void

    :cond_27
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/bar/TopToolbarContainer;->d:Z

    iget-object p1, p0, Lcom/opera/android/bar/TopToolbarContainer;->i:Lcbl;

    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final b()V
    .registers 12

    iget-object v0, p0, Lcom/opera/android/bar/TopToolbarContainer;->h:Lxy4;

    if-eqz v0, :cond_55

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v3

    iget-object v1, p0, Lcom/opera/android/bar/TopToolbarContainer;->g:Lvvl;

    iget v5, v1, Lvvl;->d:I

    iget v7, p0, Lcom/opera/android/bar/TopToolbarContainer;->e:I

    iget p0, p0, Lcom/opera/android/bar/TopToolbarContainer;->f:I

    iget-object v1, v0, Lxy4;->d:Landroid/widget/FrameLayout;

    move-object v8, v1

    check-cast v8, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;

    iget-boolean v1, v0, Lxy4;->b:Z

    const/4 v2, 0x1

    if-nez v1, :cond_24

    iput-boolean v2, v0, Lxy4;->b:Z

    const v1, 0x7f0a0bcb

    iget-wide v9, v8, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v9, v10, v1}, LJ/N;->M_RC1fyW(JI)V

    :cond_24
    iget-boolean v1, v0, Lxy4;->c:Z

    if-eqz v7, :cond_32

    if-nez v1, :cond_3c

    iput-boolean v2, v0, Lxy4;->c:Z

    iget-wide v9, v8, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v9, v10, v2}, LJ/N;->M3d_tX46(JZ)V

    goto :goto_3c

    :cond_32
    if-eqz v1, :cond_3c

    const/4 v1, 0x0

    iput-boolean v1, v0, Lxy4;->c:Z

    iget-wide v9, v8, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v9, v10, v1}, LJ/N;->M3d_tX46(JZ)V

    :cond_3c
    :goto_3c
    iget-object v1, v0, Lxy4;->e:Landroid/view/View;

    check-cast v1, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object v1, v1, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    iget v2, v1, Lzy4;->g:I

    iget-object v1, v1, Lzy4;->c:Lr9b;

    iget v1, v1, Lr9b;->b:I

    add-int/2addr v2, v1

    iget v6, v0, Lxy4;->a:I

    add-int v4, v2, v6

    iget-wide v1, v8, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static/range {v1 .. v6}, LJ/N;->MrBIoQwn(JIIII)V

    invoke-virtual {v8, v7, p0}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->e(II)V

    :cond_55
    return-void
.end method

.method public final invalidateChildInParent([ILandroid/graphics/Rect;)Landroid/view/ViewParent;
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->invalidateChildInParent([ILandroid/graphics/Rect;)Landroid/view/ViewParent;

    move-result-object p1

    invoke-virtual {p0, p2}, Lcom/opera/android/bar/TopToolbarContainer;->a(Landroid/graphics/Rect;)V

    return-object p1
.end method

.method public final onDescendantInvalidated(Landroid/view/View;Landroid/view/View;)V
    .registers 6

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onDescendantInvalidated(Landroid/view/View;Landroid/view/View;)V

    iget-object p2, p0, Lcom/opera/android/bar/TopToolbarContainer;->g:Lvvl;

    if-eqz p2, :cond_2d

    invoke-virtual {p1}, Landroid/view/View;->getX()F

    move-result p2

    float-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int p2, v0

    invoke-virtual {p1}, Landroid/view/View;->getY()F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    add-int/2addr v1, p2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    add-int/2addr p1, v0

    iget-object v2, p0, Lcom/opera/android/bar/TopToolbarContainer;->c:Landroid/graphics/Rect;

    invoke-virtual {v2, p2, v0, v1, p1}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {p0, v2}, Lcom/opera/android/bar/TopToolbarContainer;->a(Landroid/graphics/Rect;)V

    :cond_2d
    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    invoke-virtual {p0}, Lcom/opera/android/bar/TopToolbarContainer;->b()V

    return-void
.end method
