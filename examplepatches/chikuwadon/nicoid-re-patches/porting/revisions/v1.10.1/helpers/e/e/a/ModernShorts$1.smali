.class Le/e/a/ModernShorts$1;
.super Landroid/graphics/drawable/Drawable;
.source "ModernShorts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final paint:Landroid/graphics/Paint;

.field private final synthetic val$c:Landroid/content/Context;

.field private final synthetic val$ink:I

.field private final synthetic val$kind:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;Landroid/content/Context;)V
    .registers 4

    .line 137
    iput p1, p0, Le/e/a/ModernShorts$1;->val$ink:I

    iput-object p2, p0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/ModernShorts$1;->val$c:Landroid/content/Context;

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 138
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    .line 137
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 25

    .line 140
    move-object/from16 v0, p0

    move-object/from16 v10, p1

    invoke-virtual/range {p0 .. p0}, Le/e/a/ModernShorts$1;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    iget v2, v1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget v3, v1, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {v10, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 141
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x41c00000    # 24.0f

    div-float/2addr v2, v3

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v3

    invoke-virtual {v10, v2, v1}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v1, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    iget v2, v0, Le/e/a/ModernShorts$1;->val$ink:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 142
    iget-object v1, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 143
    new-instance v11, Landroid/graphics/Path;

    invoke-direct {v11}, Landroid/graphics/Path;-><init>()V

    .line 144
    const-string v1, "prev"

    iget-object v2, v0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v2, 0x41980000    # 19.0f

    const/high16 v9, 0x41000000    # 8.0f

    const/high16 v3, 0x40a00000    # 5.0f

    const/high16 v12, 0x41700000    # 15.0f

    const/high16 v13, 0x41400000    # 12.0f

    if-eqz v1, :cond_65

    invoke-virtual {v11, v12, v3}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v9, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v12, v2}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_175

    .line 145
    :cond_65
    const-string v1, "next"

    iget-object v4, v0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v14, 0x41800000    # 16.0f

    const/high16 v15, 0x41100000    # 9.0f

    if-eqz v1, :cond_7e

    invoke-virtual {v11, v15, v3}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v14, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v15, v2}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_175

    .line 146
    :cond_7e
    const-string v1, "home"

    iget-object v2, v0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v2, 0x41300000    # 11.0f

    const/high16 v8, 0x40c00000    # 6.0f

    const/high16 v7, 0x41900000    # 18.0f

    const/high16 v6, 0x41600000    # 14.0f

    const/high16 v5, 0x40400000    # 3.0f

    if-eqz v1, :cond_b9

    invoke-virtual {v11, v5, v2}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v13, v5}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x41a80000    # 21.0f

    invoke-virtual {v11, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v8, v15}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v8, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {v11, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v2, v12}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v6, v12}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v6, v1}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v7, v1}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v7, v15}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_175

    .line 147
    :cond_b9
    const-string v1, "niconico"

    iget-object v3, v0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v4, 0x41880000    # 17.0f

    const/high16 v3, 0x41a00000    # 20.0f

    const/high16 v12, 0x40e00000    # 7.0f

    if-eqz v1, :cond_12b

    .line 148
    const/high16 v16, 0x40000000    # 2.0f

    iget-object v2, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    const/high16 v17, 0x40400000    # 3.0f

    const/high16 v18, 0x40e00000    # 7.0f

    const/high16 v19, 0x41a80000    # 21.0f

    const/high16 v20, 0x41a00000    # 20.0f

    const/high16 v21, 0x40000000    # 2.0f

    move-object/from16 v1, p1

    move-object/from16 v22, v2

    move/from16 v2, v17

    move/from16 v3, v18

    const/high16 v15, 0x41880000    # 17.0f

    move/from16 v4, v19

    const/high16 v15, 0x40400000    # 3.0f

    move/from16 v5, v20

    move/from16 v6, v21

    move/from16 v7, v16

    move-object/from16 v8, v22

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 149
    invoke-virtual {v11, v9, v15}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v13, v12}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v14, v15}, Landroid/graphics/Path;->lineTo(FF)V

    .line 150
    invoke-virtual {v11, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v9, 0x41600000    # 14.0f

    invoke-virtual {v11, v12, v9}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x41880000    # 17.0f

    invoke-virtual {v11, v1, v13}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v1, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 151
    const/high16 v1, 0x41100000    # 9.0f

    invoke-virtual {v11, v1, v14}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {v11, v13, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41700000    # 15.0f

    invoke-virtual {v11, v2, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 152
    const/high16 v2, 0x40c00000    # 6.0f

    const/high16 v14, 0x41a00000    # 20.0f

    invoke-virtual {v11, v2, v14}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v3, 0x41b00000    # 22.0f

    invoke-virtual {v11, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v1, v14}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 153
    goto :goto_175

    .line 154
    :cond_12b
    const/high16 v9, 0x41600000    # 14.0f

    const/high16 v14, 0x41a00000    # 20.0f

    const/high16 v15, 0x40400000    # 3.0f

    const-string v1, "info"

    iget-object v3, v0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_153

    iget-object v1, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41100000    # 9.0f

    invoke-virtual {v10, v13, v13, v3, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    invoke-virtual {v11, v13, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41880000    # 17.0f

    invoke-virtual {v11, v13, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const v1, 0x3f19999a    # 0.6f

    iget-object v2, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    invoke-virtual {v10, v13, v12, v1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_175

    .line 155
    :cond_153
    const/4 v8, 0x0

    iget-object v12, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x40800000    # 4.0f

    const/high16 v4, 0x41a00000    # 20.0f

    const/high16 v5, 0x41a00000    # 20.0f

    const/high16 v6, 0x42340000    # 45.0f

    const/high16 v7, 0x43910000    # 290.0f

    move-object/from16 v1, p1

    const/high16 v13, 0x41600000    # 14.0f

    move-object v9, v12

    invoke-virtual/range {v1 .. v9}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    invoke-virtual {v11, v14, v15}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41100000    # 9.0f

    invoke-virtual {v11, v14, v1}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v13, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 156
    :goto_175
    iget-object v1, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    invoke-virtual {v10, v11, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 157
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 3

    .line 162
    iget-object v0, p0, Le/e/a/ModernShorts$1;->val$c:Landroid/content/Context;

    const/16 v1, 0x18

    # invokes: Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I
    invoke-static {v0, v1}, Le/e/a/ModernShorts;->access$0(Landroid/content/Context;I)I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 3

    .line 161
    iget-object v0, p0, Le/e/a/ModernShorts$1;->val$c:Landroid/content/Context;

    const/16 v1, 0x18

    # invokes: Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I
    invoke-static {v0, v1}, Le/e/a/ModernShorts;->access$0(Landroid/content/Context;I)I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 160
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 158
    iget-object v0, p0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 159
    iget-object v0, p0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
