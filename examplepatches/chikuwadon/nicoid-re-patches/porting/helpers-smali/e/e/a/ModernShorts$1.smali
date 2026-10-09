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

.field final synthetic val$c:Landroid/content/Context;

.field final synthetic val$ink:I

.field final synthetic val$kind:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;Landroid/content/Context;)V
    .registers 4

    .line 133
    iput p1, p0, Le/e/a/ModernShorts$1;->val$ink:I

    iput-object p2, p0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/ModernShorts$1;->val$c:Landroid/content/Context;

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 134
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 23
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 136
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0}, Le/e/a/ModernShorts$1;->getBounds()Landroid/graphics/Rect;

    move-result-object v10

    .local v10, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    iget v2, v10, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget v3, v10, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 137
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x41c00000    # 24.0f

    div-float/2addr v2, v3

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v3

    invoke-virtual {v1, v2, v4}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v2, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    iget v3, v0, Le/e/a/ModernShorts$1;->val$ink:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 138
    iget-object v2, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x40000000    # 2.0f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v2, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 139
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    move-object v11, v2

    .line 140
    .local v11, "path":Landroid/graphics/Path;
    const-string v2, "prev"

    iget-object v3, v0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/high16 v3, 0x41980000    # 19.0f

    const/high16 v9, 0x41000000    # 8.0f

    const/high16 v4, 0x40a00000    # 5.0f

    const/high16 v12, 0x41700000    # 15.0f

    const/high16 v13, 0x41400000    # 12.0f

    if-eqz v2, :cond_66

    invoke-virtual {v11, v12, v4}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v9, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v12, v3}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_167

    .line 141
    :cond_66
    const-string v2, "next"

    iget-object v5, v0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/high16 v14, 0x41800000    # 16.0f

    const/high16 v15, 0x41100000    # 9.0f

    if-eqz v2, :cond_7f

    invoke-virtual {v11, v15, v4}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v14, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v15, v3}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_167

    .line 142
    :cond_7f
    const-string v2, "home"

    iget-object v3, v0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/high16 v3, 0x41300000    # 11.0f

    const/high16 v4, 0x40c00000    # 6.0f

    const/high16 v5, 0x41900000    # 18.0f

    const/high16 v6, 0x41600000    # 14.0f

    const/high16 v7, 0x40400000    # 3.0f

    if-eqz v2, :cond_ba

    invoke-virtual {v11, v7, v3}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v13, v7}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41a80000    # 21.0f

    invoke-virtual {v11, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v4, v15}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v4, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual {v11, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v3, v12}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v6, v12}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v6, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v5, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v5, v15}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_167

    .line 143
    :cond_ba
    const-string v2, "niconico"

    iget-object v8, v0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/high16 v8, 0x41880000    # 17.0f

    const/high16 v12, 0x40e00000    # 7.0f

    if-eqz v2, :cond_124

    .line 144
    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v7, 0x40000000    # 2.0f

    const/high16 v3, 0x41880000    # 17.0f

    iget-object v8, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    const/high16 v16, 0x40400000    # 3.0f

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v17, 0x41880000    # 17.0f

    const/high16 v3, 0x40e00000    # 7.0f

    const/high16 v18, 0x40c00000    # 6.0f

    const/high16 v4, 0x41a80000    # 21.0f

    const/high16 v19, 0x41900000    # 18.0f

    const/high16 v5, 0x41a00000    # 20.0f

    const/high16 v20, 0x41600000    # 14.0f

    const/high16 v6, 0x40000000    # 2.0f

    const/high16 v15, 0x40400000    # 3.0f

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 145
    invoke-virtual {v11, v9, v15}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v13, v12}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v14, v15}, Landroid/graphics/Path;->lineTo(FF)V

    .line 146
    invoke-virtual {v11, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x41600000    # 14.0f

    invoke-virtual {v11, v12, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v3, 0x41880000    # 17.0f

    invoke-virtual {v11, v3, v13}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 147
    const/high16 v2, 0x41100000    # 9.0f

    invoke-virtual {v11, v2, v14}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x41900000    # 18.0f

    invoke-virtual {v11, v13, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {v11, v3, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 148
    const/high16 v3, 0x41a00000    # 20.0f

    const/high16 v4, 0x40c00000    # 6.0f

    invoke-virtual {v11, v4, v3}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v5, 0x41b00000    # 22.0f

    invoke-virtual {v11, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v11, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v11, v2, v5}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_167

    .line 150
    :cond_124
    const/high16 v15, 0x40400000    # 3.0f

    const-string v2, "info"

    iget-object v4, v0, Le/e/a/ModernShorts$1;->val$kind:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 151
    iget-object v9, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    .line 150
    if-eqz v2, :cond_148

    const/high16 v2, 0x41100000    # 9.0f

    invoke-virtual {v1, v13, v13, v2, v9}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    invoke-virtual {v11, v13, v3}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v3, 0x41880000    # 17.0f

    invoke-virtual {v11, v13, v3}, Landroid/graphics/Path;->lineTo(FF)V

    const v2, 0x3f19999a    # 0.6f

    iget-object v3, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v13, v12, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_167

    .line 151
    :cond_148
    const/high16 v7, 0x43910000    # 290.0f

    const/4 v8, 0x0

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x40800000    # 4.0f

    const/high16 v4, 0x41a00000    # 20.0f

    const/high16 v5, 0x41a00000    # 20.0f

    const/high16 v6, 0x42340000    # 45.0f

    invoke-virtual/range {v1 .. v9}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-virtual {v11, v3, v15}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x41100000    # 9.0f

    invoke-virtual {v11, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v11, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 152
    :goto_167
    iget-object v2, v0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v11, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 153
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 3

    .line 158
    iget-object v0, p0, Le/e/a/ModernShorts$1;->val$c:Landroid/content/Context;

    const/16 v1, 0x18

    # invokes: Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I
    invoke-static {v0, v1}, Le/e/a/ModernShorts;->access$000(Landroid/content/Context;I)I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 3

    .line 157
    iget-object v0, p0, Le/e/a/ModernShorts$1;->val$c:Landroid/content/Context;

    const/16 v1, 0x18

    # invokes: Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I
    invoke-static {v0, v1}, Le/e/a/ModernShorts;->access$000(Landroid/content/Context;I)I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 156
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .line 154
    iget-object v0, p0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "filter"    # Landroid/graphics/ColorFilter;

    .line 155
    iget-object v0, p0, Le/e/a/ModernShorts$1;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
