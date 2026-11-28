.class final Le/e/a/FixedCommentCollision;
.super Ljava/lang/Object;
.source "FixedCommentCollision.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FixedCommentCollision$Line;
    }
.end annotation


# static fields
.field private static final FRAMES:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Le/e/a/FixedCommentCollision;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final bounds:Landroid/graphics/Rect;

.field private canvas:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Canvas;",
            ">;"
        }
    .end annotation
.end field

.field private final group:Landroid/graphics/RectF;

.field private final lines:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/FixedCommentCollision$Line;",
            ">;"
        }
    .end annotation
.end field

.field private final occupied:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field

.field private padding:F

.field private final text:Landroid/graphics/RectF;

.field private time:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 13
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/FixedCommentCollision;->FRAMES:Ljava/lang/ThreadLocal;

    return-void
.end method

.method constructor <init>()V
    .registers 3

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/FixedCommentCollision;->occupied:Ljava/util/ArrayList;

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/FixedCommentCollision;->lines:Ljava/util/ArrayList;

    .line 16
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Le/e/a/FixedCommentCollision;->bounds:Landroid/graphics/Rect;

    .line 17
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Le/e/a/FixedCommentCollision;->text:Landroid/graphics/RectF;

    .line 18
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Le/e/a/FixedCommentCollision;->group:Landroid/graphics/RectF;

    .line 19
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/FixedCommentCollision;->canvas:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static abort()V
    .registers 1

    .line 95
    sget-object v0, Le/e/a/FixedCommentCollision;->FRAMES:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    return-void
.end method

.method static begin(Landroid/graphics/Canvas;ZZFF)V
    .registers 6

    .line 42
    sget-object v0, Le/e/a/FixedCommentCollision;->FRAMES:Ljava/lang/ThreadLocal;

    if-nez p1, :cond_0

    .line 39
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    return-void

    .line 42
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/FixedCommentCollision;

    if-nez p1, :cond_1

    .line 44
    new-instance p1, Le/e/a/FixedCommentCollision;

    invoke-direct {p1}, Le/e/a/FixedCommentCollision;-><init>()V

    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_1
    if-eqz p2, :cond_2

    .line 47
    iget-object p2, p1, Le/e/a/FixedCommentCollision;->canvas:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    if-ne p2, p0, :cond_2

    iget p2, p1, Le/e/a/FixedCommentCollision;->time:F

    cmpl-float p2, p2, p3

    if-eqz p2, :cond_3

    :cond_2
    iget-object p2, p1, Le/e/a/FixedCommentCollision;->occupied:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    .line 48
    :cond_3
    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p1, Le/e/a/FixedCommentCollision;->canvas:Ljava/lang/ref/WeakReference;

    .line 49
    iput p3, p1, Le/e/a/FixedCommentCollision;->time:F

    .line 50
    iput p4, p1, Le/e/a/FixedCommentCollision;->padding:F

    .line 51
    iget-object p0, p1, Le/e/a/FixedCommentCollision;->lines:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 52
    iget-object p0, p1, Le/e/a/FixedCommentCollision;->group:Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/graphics/RectF;->setEmpty()V

    return-void
.end method

.method static draw(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;Landroid/content/Context;)V
    .registers 13

    .line 56
    sget-object v0, Le/e/a/FixedCommentCollision;->FRAMES:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FixedCommentCollision;

    if-eqz v0, :cond_3

    .line 57
    iget-object v1, v0, Le/e/a/FixedCommentCollision;->canvas:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_3

    .line 61
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_2

    invoke-virtual {p4}, Landroid/graphics/Paint;->getAlpha()I

    move-result p0

    if-eqz p0, :cond_2

    .line 62
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    iget-object v1, v0, Le/e/a/FixedCommentCollision;->bounds:Landroid/graphics/Rect;

    const/4 v2, 0x0

    invoke-virtual {p4, p1, v2, p0, v1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 63
    iget-object p0, v0, Le/e/a/FixedCommentCollision;->bounds:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_2

    .line 64
    invoke-virtual {p4}, Landroid/graphics/Paint;->getTextAlign()Landroid/graphics/Paint$Align;

    move-result-object p0

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    if-ne p0, v1, :cond_0

    const/high16 p0, 0x3f000000    # 0.5f

    goto :goto_0

    .line 65
    :cond_0
    invoke-virtual {p4}, Landroid/graphics/Paint;->getTextAlign()Landroid/graphics/Paint$Align;

    move-result-object p0

    sget-object v1, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    if-ne p0, v1, :cond_1

    const/high16 p0, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    .line 66
    :goto_0
    invoke-virtual {p4, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    mul-float/2addr p0, v1

    sub-float p0, p2, p0

    .line 67
    iget-object v1, v0, Le/e/a/FixedCommentCollision;->text:Landroid/graphics/RectF;

    iget-object v2, v0, Le/e/a/FixedCommentCollision;->bounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 68
    iget-object v1, v0, Le/e/a/FixedCommentCollision;->text:Landroid/graphics/RectF;

    invoke-virtual {v1, p0, p3}, Landroid/graphics/RectF;->offset(FF)V

    .line 69
    iget-object p0, v0, Le/e/a/FixedCommentCollision;->text:Landroid/graphics/RectF;

    iget v1, v0, Le/e/a/FixedCommentCollision;->padding:F

    neg-float v2, v1

    neg-float v1, v1

    invoke-virtual {p0, v2, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 70
    iget-object p0, v0, Le/e/a/FixedCommentCollision;->group:Landroid/graphics/RectF;

    iget-object v1, v0, Le/e/a/FixedCommentCollision;->text:Landroid/graphics/RectF;

    invoke-virtual {p0, v1}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    .line 71
    iget-object p0, v0, Le/e/a/FixedCommentCollision;->lines:Ljava/util/ArrayList;

    new-instance v0, Le/e/a/FixedCommentCollision$Line;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Le/e/a/FixedCommentCollision$Line;-><init>(Ljava/lang/String;FFLandroid/graphics/Paint;Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    return-void

    :cond_3
    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    .line 58
    invoke-static/range {v1 .. v6}, Le/e/a/CommentInk192;->nativeText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;Landroid/content/Context;)V

    return-void
.end method

.method static next()V
    .registers 10

    .line 75
    sget-object v0, Le/e/a/FixedCommentCollision;->FRAMES:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FixedCommentCollision;

    if-eqz v0, :cond_4

    .line 76
    iget-object v1, v0, Le/e/a/FixedCommentCollision;->lines:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 77
    iget-object v1, v0, Le/e/a/FixedCommentCollision;->canvas:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Landroid/graphics/Canvas;

    const/4 v1, 0x0

    if-eqz v2, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v1

    .line 79
    :goto_0
    iget-object v4, v0, Le/e/a/FixedCommentCollision;->occupied:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v8, 0x0

    :cond_1
    if-lt v8, v9, :cond_2

    move v1, v3

    goto :goto_1

    :cond_2
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v8, v8, 0x1

    check-cast v5, Landroid/graphics/RectF;

    .line 80
    iget-object v6, v0, Le/e/a/FixedCommentCollision;->group:Landroid/graphics/RectF;

    invoke-static {v5, v6}, Landroid/graphics/RectF;->intersects(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    move-result v5

    if-eqz v5, :cond_1

    :goto_1
    if-eqz v1, :cond_3

    .line 86
    iget-object v1, v0, Le/e/a/FixedCommentCollision;->occupied:Ljava/util/ArrayList;

    new-instance v3, Landroid/graphics/RectF;

    iget-object v4, v0, Le/e/a/FixedCommentCollision;->group:Landroid/graphics/RectF;

    invoke-direct {v3, v4}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    iget-object v1, v0, Le/e/a/FixedCommentCollision;->lines:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v8, 0x0

    :goto_2
    if-ge v8, v9, :cond_3

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v8, v8, 0x1

    check-cast v3, Le/e/a/FixedCommentCollision$Line;

    move-object v4, v3

    .line 88
    iget-object v3, v4, Le/e/a/FixedCommentCollision$Line;->text:Ljava/lang/String;

    move-object v5, v4

    iget v4, v5, Le/e/a/FixedCommentCollision$Line;->x:F

    move-object v6, v5

    iget v5, v6, Le/e/a/FixedCommentCollision$Line;->y:F

    move-object v7, v6

    iget-object v6, v7, Le/e/a/FixedCommentCollision$Line;->paint:Landroid/graphics/Paint;

    iget-object v7, v7, Le/e/a/FixedCommentCollision$Line;->context:Landroid/content/Context;

    invoke-static/range {v2 .. v7}, Le/e/a/CommentInk192;->nativeText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;Landroid/content/Context;)V

    goto :goto_2

    .line 91
    :cond_3
    iget-object v1, v0, Le/e/a/FixedCommentCollision;->lines:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 92
    iget-object v0, v0, Le/e/a/FixedCommentCollision;->group:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->setEmpty()V

    :cond_4
    return-void
.end method
