.class final Le/e/a/BulkSelection$SelectionMark;
.super Landroid/graphics/drawable/Drawable;
.source "BulkSelection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/BulkSelection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SelectionMark"
.end annotation


# instance fields
.field final label:Ljava/lang/String;

.field final paint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;Z)V
    .registers 5

    .line 118
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 117
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/BulkSelection$SelectionMark;->paint:Landroid/graphics/Paint;

    .line 118
    if-eqz p2, :cond_10

    const-string p2, "\u2713"

    goto :goto_12

    :cond_10
    const-string p2, "\u25a1"

    :goto_12
    iput-object p2, p0, Le/e/a/BulkSelection$SelectionMark;->label:Ljava/lang/String;

    iget-object p2, p0, Le/e/a/BulkSelection$SelectionMark;->paint:Landroid/graphics/Paint;

    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p2, p0, Le/e/a/BulkSelection$SelectionMark;->paint:Landroid/graphics/Paint;

    const/16 v0, 0x16

    invoke-static {p1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object p1, p0, Le/e/a/BulkSelection$SelectionMark;->paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 6

    .line 119
    invoke-virtual {p0}, Le/e/a/BulkSelection$SelectionMark;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget-object v1, p0, Le/e/a/BulkSelection$SelectionMark;->label:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    int-to-float v2, v2

    iget v0, v0, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    iget-object v3, p0, Le/e/a/BulkSelection$SelectionMark;->paint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextSize()F

    move-result v3

    add-float/2addr v0, v3

    iget-object v3, p0, Le/e/a/BulkSelection$SelectionMark;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 120
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 120
    iget-object v0, p0, Le/e/a/BulkSelection$SelectionMark;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 120
    iget-object v0, p0, Le/e/a/BulkSelection$SelectionMark;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
