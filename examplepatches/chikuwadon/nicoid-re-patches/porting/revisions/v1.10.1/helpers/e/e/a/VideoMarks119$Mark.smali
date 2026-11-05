.class final Le/e/a/VideoMarks119$Mark;
.super Landroid/graphics/drawable/Drawable;
.source "VideoMarks119.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/VideoMarks119;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Mark"
.end annotation


# instance fields
.field accent:I

.field id:Ljava/lang/String;

.field final paint:Landroid/graphics/Paint;

.field progress:F

.field final thickness:F


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 4

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Le/e/a/VideoMarks119$Mark;->id:Ljava/lang/String;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/VideoMarks119$Mark;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    const/high16 v0, 0x3fc00000    # 1.5f

    mul-float/2addr p1, v0

    iput p1, p0, Le/e/a/VideoMarks119$Mark;->thickness:F

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 11

    .line 14
    iget v0, p0, Le/e/a/VideoMarks119$Mark;->progress:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_8

    return-void

    :cond_8
    invoke-virtual {p0}, Le/e/a/VideoMarks119$Mark;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget v1, p0, Le/e/a/VideoMarks119$Mark;->thickness:F

    iget-object v2, p0, Le/e/a/VideoMarks119$Mark;->paint:Landroid/graphics/Paint;

    const v3, -0x7799999a

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v4, v2

    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    sub-float v5, v2, v1

    iget v2, v0, Landroid/graphics/Rect;->right:I

    int-to-float v6, v2

    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v2

    iget-object v8, p0, Le/e/a/VideoMarks119$Mark;->paint:Landroid/graphics/Paint;

    move-object v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v2, p0, Le/e/a/VideoMarks119$Mark;->paint:Landroid/graphics/Paint;

    iget v3, p0, Le/e/a/VideoMarks119$Mark;->accent:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v4, v2

    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    sub-float v5, v2, v1

    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Le/e/a/VideoMarks119$Mark;->progress:F

    mul-float v2, v2, v3

    add-float v6, v1, v2

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v0

    iget-object v8, p0, Le/e/a/VideoMarks119$Mark;->paint:Landroid/graphics/Paint;

    move-object v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 14
    const/4 v0, -0x3

    return v0
.end method

.method read(Landroid/content/Context;)V
    .registers 9

    invoke-static {p1}, Le/e/a/VideoMarks119;->watched(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Le/e/a/VideoMarks119$Mark;->id:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "_duration"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    iget-object v1, p0, Le/e/a/VideoMarks119$Mark;->id:Ljava/lang/String;

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "show_watch_progress"

    const/4 v6, 0x1

    invoke-interface {v2, v3, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v0, v1, v4, v5, v2}, Le/e/a/DisplayRules119;->progress(JJZ)F

    move-result v0

    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p1

    iget v1, p0, Le/e/a/VideoMarks119$Mark;->progress:F

    cmpl-float v1, v0, v1

    if-nez v1, :cond_43

    iget v1, p0, Le/e/a/VideoMarks119$Mark;->accent:I

    if-ne v1, p1, :cond_43

    return-void

    :cond_43
    iput v0, p0, Le/e/a/VideoMarks119$Mark;->progress:F

    iput p1, p0, Le/e/a/VideoMarks119$Mark;->accent:I

    invoke-virtual {p0}, Le/e/a/VideoMarks119$Mark;->invalidateSelf()V

    return-void
.end method

.method public setAlpha(I)V
    .registers 2

    .line 14
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    .line 14
    return-void
.end method
