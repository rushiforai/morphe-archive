.class public final Luk7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Landroid/graphics/Rect;

.field public static final f:Landroid/graphics/Point;


# instance fields
.field public final a:Landroid/widget/TextView;

.field public b:Lmgf;

.field public c:Landroid/graphics/drawable/Drawable;

.field public d:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Luk7;->e:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    sput-object v0, Luk7;->f:Landroid/graphics/Point;

    return-void
.end method

.method public constructor <init>(Landroid/widget/TextView;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luk7;->a:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;Landroid/graphics/drawable/Drawable;I)Z
    .registers 20

    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    iget-object v3, v0, Luk7;->a:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundDrawablePadding()I

    move-result v4

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    sget-object v6, Luk7;->e:Landroid/graphics/Rect;

    invoke-virtual {v6, v5}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    sget-object v5, Luk7;->f:Landroid/graphics/Point;

    const/4 v7, 0x0

    iput v7, v5, Landroid/graphics/Point;->x:I

    iput v7, v5, Landroid/graphics/Point;->y:I

    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    move-result v8

    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundPaddingTop()I

    move-result v9

    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    move-result v10

    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundPaddingBottom()I

    move-result v11

    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v12

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v13

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v14

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v15

    sub-int/2addr v14, v15

    sub-int v11, v14, v11

    sub-int/2addr v11, v9

    sub-int/2addr v12, v13

    sub-int v10, v12, v10

    sub-int/2addr v10, v8

    invoke-static/range {p3 .. p3}, Lvep;->A(I)I

    move-result v13

    const/4 v15, 0x1

    const/4 v7, 0x2

    if-eqz v13, :cond_95

    if-eq v13, v15, :cond_85

    if-eq v13, v7, :cond_6f

    const/4 v9, 0x3

    if-ne v13, v9, :cond_a4

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v9

    sub-int/2addr v10, v9

    div-int/2addr v10, v7

    add-int/2addr v10, v8

    iput v10, v5, Landroid/graphics/Point;->x:I

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v14, v3

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v3

    sub-int/2addr v14, v3

    iput v14, v5, Landroid/graphics/Point;->y:I

    goto :goto_a4

    :cond_6f
    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    sub-int/2addr v12, v3

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v3

    sub-int/2addr v12, v3

    iput v12, v5, Landroid/graphics/Point;->x:I

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v3

    sub-int/2addr v11, v3

    div-int/2addr v11, v7

    add-int/2addr v11, v9

    iput v11, v5, Landroid/graphics/Point;->y:I

    goto :goto_a4

    :cond_85
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v9

    sub-int/2addr v10, v9

    div-int/2addr v10, v7

    add-int/2addr v10, v8

    iput v10, v5, Landroid/graphics/Point;->x:I

    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    iput v3, v5, Landroid/graphics/Point;->y:I

    goto :goto_a4

    :cond_95
    invoke-virtual {v3}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    iput v3, v5, Landroid/graphics/Point;->x:I

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v3

    sub-int/2addr v11, v3

    div-int/2addr v11, v7

    add-int/2addr v11, v9

    iput v11, v5, Landroid/graphics/Point;->y:I

    :cond_a4
    :goto_a4
    iget v3, v5, Landroid/graphics/Point;->x:I

    iget v5, v5, Landroid/graphics/Point;->y:I

    invoke-virtual {v6, v3, v5}, Landroid/graphics/Rect;->offset(II)V

    neg-int v3, v4

    invoke-virtual {v6, v3, v3}, Landroid/graphics/Rect;->inset(II)V

    invoke-virtual {v6, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v1

    if-eqz v1, :cond_be

    move-object/from16 v1, p2

    iput-object v1, v0, Luk7;->c:Landroid/graphics/drawable/Drawable;

    move/from16 v1, p3

    iput v1, v0, Luk7;->d:I

    return v15

    :cond_be
    const/4 v1, 0x0

    iput-object v1, v0, Luk7;->c:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    iput v1, v0, Luk7;->d:I

    return v1
.end method
