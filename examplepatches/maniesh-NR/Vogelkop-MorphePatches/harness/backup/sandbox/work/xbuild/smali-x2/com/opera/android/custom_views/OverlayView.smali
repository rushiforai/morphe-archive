.class public Lcom/opera/android/custom_views/OverlayView;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static final synthetic e:I


# instance fields
.field public final a:[I

.field public final b:[F

.field public final c:Ljava/util/ArrayList;

.field public d:Lfr8;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x2

    new-array p2, p1, [I

    iput-object p2, p0, Lcom/opera/android/custom_views/OverlayView;->a:[I

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/opera/android/custom_views/OverlayView;->b:[F

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/opera/android/custom_views/OverlayView;->c:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 10

    iget-object v0, p0, Lcom/opera/android/custom_views/OverlayView;->d:Lfr8;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {v0}, Lfr8;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    iget-object v2, p0, Lcom/opera/android/custom_views/OverlayView;->a:[I

    invoke-virtual {v0, v2}, Landroid/view/View;->getLocationInWindow([I)V

    const/4 v3, 0x0

    aget v4, v2, v3

    iget-object v5, p0, Lcom/opera/android/custom_views/OverlayView;->d:Lfr8;

    iget v5, v5, Lfr8;->j:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v5

    sub-float/2addr v4, v5

    const/4 v5, 0x1

    aget v6, v2, v5

    iget-object v7, p0, Lcom/opera/android/custom_views/OverlayView;->d:Lfr8;

    iget v7, v7, Lfr8;->k:I

    add-int/2addr v6, v7

    int-to-float v6, v6

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    sub-float/2addr v6, v0

    invoke-virtual {p0, v2}, Landroid/view/View;->getLocationInWindow([I)V

    aget v0, v2, v3

    int-to-float v0, v0

    sub-float/2addr v4, v0

    aget v0, v2, v5

    int-to-float v0, v0

    sub-float/2addr v6, v0

    iget-object v0, p0, Lcom/opera/android/custom_views/OverlayView;->b:[F

    const/4 v2, 0x0

    aput v2, v0, v3

    aput v2, v0, v5

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    aget v2, v0, v3

    sub-float/2addr v4, v2

    aget v0, v0, v5

    sub-float/2addr v6, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    invoke-virtual {p1, v4, v6}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object p0, p0, Lcom/opera/android/custom_views/OverlayView;->d:Lfr8;

    invoke-virtual {p0, p1}, Lfr8;->g(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method
