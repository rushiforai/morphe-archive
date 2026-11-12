.class public final Luf9;
.super Ltf9;
.source "SourceFile"


# instance fields
.field public final g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lsll;II)V
    .registers 6

    sget-object v0, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-direct {p0, p1, p2, v0, p4}, Ltf9;-><init>(Landroid/content/Context;Lsll;Landroid/graphics/Paint$Style;I)V

    iput p3, p0, Luf9;->g:I

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 13

    iget v0, p0, Ltf9;->d:I

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget v1, p2, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    add-float v3, v1, v0

    iget v1, p2, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    add-float v4, v1, v0

    iget v1, p2, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    sub-float v5, v1, v0

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    int-to-float p2, p2

    sub-float v6, p2, v0

    iget p2, p0, Luf9;->g:I

    int-to-float v7, p2

    int-to-float v8, p2

    iget-object v9, p0, Ltf9;->e:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    return-void
.end method
