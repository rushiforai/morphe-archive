.class public final Le/e/a/PopupCenter243;
.super Ljava/lang/Object;
.source "PopupCenter243.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field final center:Landroid/view/View;

.field final controller:Landroid/view/View;

.field observer:Landroid/view/ViewTreeObserver;

.field previous:I

.field final root:Landroid/view/View;

.field final stage:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .registers 6

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const/4 v0, -0x1

    iput v0, p0, Le/e/a/PopupCenter243;->previous:I

    .line 6
    iput-object p1, p0, Le/e/a/PopupCenter243;->root:Landroid/view/View;

    iput-object p2, p0, Le/e/a/PopupCenter243;->stage:Landroid/view/View;

    iput-object p3, p0, Le/e/a/PopupCenter243;->controller:Landroid/view/View;

    iput-object p4, p0, Le/e/a/PopupCenter243;->center:Landroid/view/View;

    iget-object p1, p0, Le/e/a/PopupCenter243;->stage:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object p1, p0, Le/e/a/PopupCenter243;->stage:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_1e

    invoke-virtual {p0}, Le/e/a/PopupCenter243;->connect()V

    :cond_1e
    return-void
.end method

.method public static bind(Le/e/a/PopupControls193;)V
    .registers 5

    .line 7
    iget-object v0, p0, Le/e/a/PopupControls193;->center:Landroid/view/View;

    if-eqz v0, :cond_15

    iget-object v0, p0, Le/e/a/PopupControls193;->controller:Landroid/view/View;

    if-eqz v0, :cond_15

    new-instance v0, Le/e/a/PopupCenter243;

    iget-object v1, p0, Le/e/a/PopupControls193;->root:Landroid/view/View;

    iget-object v2, p0, Le/e/a/PopupControls193;->stage:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Le/e/a/PopupControls193;->controller:Landroid/view/View;

    iget-object p0, p0, Le/e/a/PopupControls193;->center:Landroid/view/View;

    invoke-direct {v0, v1, v2, v3, p0}, Le/e/a/PopupCenter243;-><init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    :cond_15
    return-void
.end method


# virtual methods
.method connect()V
    .registers 2

    .line 8
    invoke-virtual {p0}, Le/e/a/PopupCenter243;->disconnect()V

    iget-object v0, p0, Le/e/a/PopupCenter243;->stage:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, Le/e/a/PopupCenter243;->observer:Landroid/view/ViewTreeObserver;

    iget-object v0, p0, Le/e/a/PopupCenter243;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    const-string v0, "Popup center observer attached"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void
.end method

.method disconnect()V
    .registers 2

    .line 9
    iget-object v0, p0, Le/e/a/PopupCenter243;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_11

    iget-object v0, p0, Le/e/a/PopupCenter243;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Le/e/a/PopupCenter243;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_11
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/PopupCenter243;->observer:Landroid/view/ViewTreeObserver;

    return-void
.end method

.method public onPreDraw()Z
    .registers 6

    .line 11
    iget-object v0, p0, Le/e/a/PopupCenter243;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Le/e/a/PlayerVisibility192;->enabled(Landroid/content/Context;Z)Z

    move-result v0

    if-nez v0, :cond_15

    iget-object v0, p0, Le/e/a/PopupCenter243;->controller:Landroid/view/View;

    iget-object v2, p0, Le/e/a/PopupCenter243;->center:Landroid/view/View;

    invoke-static {v0, v2}, Le/e/a/PopupCenter242;->inherit(Landroid/view/View;Landroid/view/View;)V

    goto :goto_1a

    .line 12
    :cond_15
    iget-object v0, p0, Le/e/a/PopupCenter243;->root:Landroid/view/View;

    invoke-static {v0}, Le/e/a/Revision201;->center(Landroid/view/View;)V

    .line 13
    :goto_1a
    iget-object v0, p0, Le/e/a/PopupCenter243;->controller:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    iget-object v2, p0, Le/e/a/PopupCenter243;->controller:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    const/4 v4, 0x0

    if-lez v2, :cond_2e

    const/4 v2, 0x2

    goto :goto_2f

    :cond_2e
    move v2, v4

    :goto_2f
    or-int/2addr v0, v2

    iget-object v2, p0, Le/e/a/PopupCenter243;->center:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->isShown()Z

    move-result v2

    if-eqz v2, :cond_3a

    const/4 v2, 0x4

    goto :goto_3b

    :cond_3a
    move v2, v4

    :goto_3b
    or-int/2addr v0, v2

    iget-object v2, p0, Le/e/a/PopupCenter243;->center:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    move-result v2

    cmpl-float v2, v2, v3

    if-lez v2, :cond_48

    const/16 v4, 0x8

    :cond_48
    or-int/2addr v0, v4

    .line 14
    iget v2, p0, Le/e/a/PopupCenter243;->previous:I

    if-eq v0, v2, :cond_61

    iput v0, p0, Le/e/a/PopupCenter243;->previous:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Popup center visibility "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    .line 15
    :cond_61
    return v1
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 17
    invoke-virtual {p0}, Le/e/a/PopupCenter243;->connect()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 17
    invoke-virtual {p0}, Le/e/a/PopupCenter243;->disconnect()V

    return-void
.end method
