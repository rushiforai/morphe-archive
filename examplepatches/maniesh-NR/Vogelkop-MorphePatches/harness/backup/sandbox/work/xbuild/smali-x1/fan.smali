.class public abstract Lfan;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Landroid/graphics/Rect;

.field public static final b:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lfan;->a:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    sput-object v0, Lfan;->b:Landroid/graphics/RectF;

    return-void
.end method

.method public static a(FLandroid/content/res/Resources;)I
    .registers 3

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {v0, p0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    return p0
.end method

.method public static b(Landroid/view/ViewGroup;Landroid/view/ViewGroup;II)Landroid/view/View;
    .registers 8

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-ltz v0, :cond_3e

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_3b

    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_26

    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup;

    invoke-static {p0, v2, p2, p3}, Lfan;->b(Landroid/view/ViewGroup;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_25

    invoke-virtual {v1}, Landroid/view/View;->isClickable()Z

    move-result v3

    if-nez v3, :cond_26

    :cond_25
    move-object v1, v2

    :cond_26
    if-eqz v1, :cond_3b

    invoke-virtual {v1}, Landroid/view/View;->isClickable()Z

    move-result v2

    if-eqz v2, :cond_3b

    invoke-virtual {v1}, Landroid/view/View;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_3b

    invoke-static {p0, v1, p2, p3}, Lfan;->c(Landroid/view/ViewGroup;Landroid/view/View;II)Z

    move-result v2

    if-eqz v2, :cond_3b

    return-object v1

    :cond_3b
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_3e
    const/4 p0, 0x0

    return-object p0
.end method

.method public static c(Landroid/view/ViewGroup;Landroid/view/View;II)Z
    .registers 7

    sget-object v0, Lfan;->a:Landroid/graphics/Rect;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v1

    if-nez v1, :cond_c

    const/4 p0, 0x0

    monitor-exit v0

    return p0

    :cond_c
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v1

    if-nez v1, :cond_25

    sget-object v1, Lfan;->b:Landroid/graphics/RectF;

    invoke-virtual {v1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {v1, v0}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    :cond_25
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->offset(II)V

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-virtual {v0, p2, p3}, Landroid/graphics/Rect;->contains(II)Z

    move-result p0

    monitor-exit v0

    return p0

    :goto_3f
    monitor-exit v0
    :try_end_40
    .catchall {:try_start_3 .. :try_end_40} :catchall_41

    throw p0

    :catchall_41
    move-exception p0

    goto :goto_3f
.end method
