.class public final Lzz7;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final a:Landroid/view/GestureDetector;

.field public final b:Landroidx/recyclerview/widget/RecyclerView;

.field public final c:Lark;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lark;)V
    .registers 5

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lzz7;->a:Landroid/view/GestureDetector;

    iput-object p1, p0, Lzz7;->b:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lzz7;->c:Lark;

    return-void
.end method


# virtual methods
.method public final onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 13

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget-object v1, p0, Lzz7;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    const/4 v3, 0x0

    if-nez v2, :cond_11

    move p1, v3

    goto :goto_3d

    :cond_11
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v2}, Landroidx/recyclerview/widget/f;->getChildCount()I

    move-result v5

    move v6, v3

    :goto_1b
    if-ge v6, v5, :cond_37

    invoke-virtual {v2, v6}, Landroidx/recyclerview/widget/f;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v8

    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v9

    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    move-result v10

    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v7

    invoke-virtual {v4, v8, v9, v10, v7}, Landroid/graphics/Rect;->union(IIII)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_1b

    :cond_37
    float-to-int v0, v0

    float-to-int p1, p1

    invoke-virtual {v4, v0, p1}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    :goto_3d
    if-eqz p1, :cond_40

    return v3

    :cond_40
    iget-object p0, p0, Lzz7;->c:Lark;

    invoke-virtual {p0, v1}, Lark;->onClick(Landroid/view/View;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 3

    iget-object p0, p0, Lzz7;->a:Landroid/view/GestureDetector;

    invoke-virtual {p0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
