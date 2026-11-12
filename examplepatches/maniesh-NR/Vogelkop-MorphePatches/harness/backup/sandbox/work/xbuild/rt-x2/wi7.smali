.class public abstract Lwi7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[I

.field public static final b:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    sput-object v0, Lwi7;->a:[I

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lwi7;->b:Landroid/graphics/Rect;

    return-void
.end method

.method public static a(Landroid/view/View;Landroid/view/View;II)Z
    .registers 13

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5d

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_5d

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    sget-object v2, Lwi7;->a:[I

    invoke-virtual {v0, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    aget v0, v2, v1

    const/4 v3, 0x1

    aget v4, v2, v3

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    invoke-virtual {v5, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    aget v5, v2, v1

    aget v6, v2, v3

    instance-of v7, p0, Lfr8;

    sget-object v8, Lwi7;->b:Landroid/graphics/Rect;

    if-eqz v7, :cond_36

    check-cast p0, Lfr8;

    invoke-virtual {p0, v8}, Lfr8;->i(Landroid/graphics/Rect;)V

    goto :goto_41

    :cond_36
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v7

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    invoke-virtual {v8, v1, v1, v7, p0}, Landroid/graphics/Rect;->set(IIII)V

    :goto_41
    invoke-virtual {v8}, Landroid/graphics/Rect;->centerX()I

    move-result p0

    add-int/2addr p0, p2

    invoke-virtual {v8}, Landroid/graphics/Rect;->centerY()I

    move-result p2

    add-int/2addr p2, p3

    add-int/2addr p0, v5

    sub-int p3, p0, v0

    add-int/2addr p2, v6

    sub-int v0, p2, v4

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-static {v4, p1, p3, v0}, Lfan;->c(Landroid/view/ViewGroup;Landroid/view/View;II)Z

    move-result p3

    if-nez p3, :cond_5e

    :cond_5d
    return v1

    :cond_5e
    instance-of p3, p1, Lfr8;

    if-eqz p3, :cond_69

    move-object p3, p1

    check-cast p3, Lfr8;

    invoke-virtual {p3, v8}, Lfr8;->i(Landroid/graphics/Rect;)V

    goto :goto_74

    :cond_69
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {v8, v1, v1, p3, v0}, Landroid/graphics/Rect;->set(IIII)V

    :goto_74
    invoke-virtual {p1, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    aget p1, v2, v1

    aget p3, v2, v3

    invoke-virtual {v8, p1, p3}, Landroid/graphics/Rect;->offset(II)V

    invoke-virtual {v8, p0, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result p0

    return p0
.end method
