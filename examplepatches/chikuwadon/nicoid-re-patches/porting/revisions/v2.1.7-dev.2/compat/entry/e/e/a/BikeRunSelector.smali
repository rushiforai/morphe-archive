.class public final Le/e/a/BikeRunSelector;
.super Ljava/lang/Object;
.source "BikeRunSelector.java"

.method private constructor <init>()V
    .registers 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

# The hidden entry point always starts the newest version, without any dialog.
.method public static open(Landroid/app/Activity;)V
    .registers 2
    if-eqz p0, :done
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z
    move-result v0
    if-nez v0, :done
    invoke-static {p0}, Le/e/a/internal/standard150/BikeRun;->open(Landroid/app/Activity;)V
    :done
    return-void
.end method

# The title is drawn at x=24,y=44 in logical coordinates scaled to 720px wide.
.method public static isTitleHit(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I
    move-result v0
    if-lez v0, :miss
    int-to-float v0, v0
    const/high16 v1, 0x44340000    # 720.0f
    div-float/2addr v1, v0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F
    move-result v0
    mul-float/2addr v0, v1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F
    move-result v2
    mul-float/2addr v2, v1
    const/4 v3, 0x0
    cmpg-float v4, v0, v3
    if-ltz v4, :miss
    cmpg-float v4, v2, v3
    if-ltz v4, :miss
    const/high16 v3, 0x43960000    # 300.0f
    cmpl-float v4, v0, v3
    if-gtz v4, :miss
    const/high16 v3, 0x428c0000    # 70.0f
    cmpl-float v4, v2, v3
    if-gtz v4, :miss
    const/4 v0, 0x1
    return v0
    :miss
    const/4 v0, 0x0
    return v0
.end method

# The game stores its own Dialog as the Track's View tag.
.method public static showFor(Landroid/view/View;)V
    .registers 8
    if-eqz p0, :done
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v6
    instance-of v0, v6, Landroid/app/Dialog;
    if-eqz v0, :done
    check-cast v6, Landroid/app/Dialog;
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v5
    instance-of v0, v5, Landroid/app/Activity;
    if-eqz v0, :done
    check-cast v5, Landroid/app/Activity;

    new-instance v0, Landroid/app/AlertDialog$Builder;
    invoke-direct {v0, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    const-string v1, "\u81ea\u8ee2\u8eca\u30e9\u30f3"
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x3
    new-array v1, v1, [Ljava/lang/CharSequence;
    const/4 v2, 0x0
    const-string v3, "\u6700\u65b0\u7248 v1.5.0"
    aput-object v3, v1, v2
    const/4 v2, 0x1
    const-string v3, "\u30af\u30e9\u30b7\u30c3\u30af v1.4.3"
    aput-object v3, v1, v2
    const/4 v2, 0x2
    const-string v3, "\u30af\u30e9\u30b7\u30c3\u30af v1.3.1"
    aput-object v3, v1, v2

    new-instance v4, Le/e/a/BikeRunSelector$Choice;
    invoke-direct {v4, v5, v6}, Le/e/a/BikeRunSelector$Choice;-><init>(Landroid/app/Activity;Landroid/app/Dialog;)V
    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :done
    return-void
.end method
