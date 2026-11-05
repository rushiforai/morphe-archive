.class Le/e/a/PlayerCollapse227$1;
.super Ljava/lang/Object;
.source "PlayerCollapse227.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/PlayerCollapse227;->attach(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field drag:Z

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$owner:Ljava/lang/Object;

.field private final synthetic val$video:Landroid/view/View;

.field x:F

.field y:F


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/view/View;Ljava/lang/Object;)V
    .registers 4

    .line 13
    iput-object p1, p0, Le/e/a/PlayerCollapse227$1;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/PlayerCollapse227$1;->val$video:Landroid/view/View;

    iput-object p3, p0, Le/e/a/PlayerCollapse227$1;->val$owner:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 7

    .line 14
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_30

    iget-object p1, p0, Le/e/a/PlayerCollapse227$1;->val$a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    invoke-static {p1, v1, v2}, Le/e/a/PlayerGestures219;->interactive(Landroid/view/View;FF)Z

    move-result p1

    const/4 v1, 0x0

    if-eqz p1, :cond_21

    return v1

    :cond_21
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    iput p1, p0, Le/e/a/PlayerCollapse227$1;->x:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iput p1, p0, Le/e/a/PlayerCollapse227$1;->y:F

    iput-boolean v1, p0, Le/e/a/PlayerCollapse227$1;->drag:Z

    return v0

    .line 15
    :cond_30
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    const/4 v2, 0x0

    if-gt v1, v0, :cond_9f

    const/4 v1, 0x3

    if-ne p1, v1, :cond_3b

    goto :goto_9f

    .line 16
    :cond_3b
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    iget v3, p0, Le/e/a/PlayerCollapse227$1;->y:F

    sub-float/2addr v1, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p2

    iget v3, p0, Le/e/a/PlayerCollapse227$1;->x:F

    sub-float/2addr p2, v3

    const/4 v3, 0x2

    if-ne p1, v3, :cond_81

    iget-object p1, p0, Le/e/a/PlayerCollapse227$1;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    int-to-float p1, p1

    cmpl-float p1, v1, p1

    if-lez p1, :cond_68

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 p2, 0x3fc00000    # 1.5f

    mul-float/2addr p1, p2

    cmpl-float p1, v1, p1

    if-lez p1, :cond_68

    iput-boolean v0, p0, Le/e/a/PlayerCollapse227$1;->drag:Z

    :cond_68
    iget-boolean p1, p0, Le/e/a/PlayerCollapse227$1;->drag:Z

    if-eqz p1, :cond_80

    iget-object p1, p0, Le/e/a/PlayerCollapse227$1;->val$video:Landroid/view/View;

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result p2

    iget-object v1, p0, Le/e/a/PlayerCollapse227$1;->val$video:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-static {p2, v1}, Ljava/lang/Math;->min(FF)F

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    :cond_80
    return v0

    .line 17
    :cond_81
    if-ne p1, v0, :cond_9e

    iget-object p1, p0, Le/e/a/PlayerCollapse227$1;->val$video:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationY(F)V

    iget-boolean p1, p0, Le/e/a/PlayerCollapse227$1;->drag:Z

    if-eqz p1, :cond_9e

    iget-object p1, p0, Le/e/a/PlayerCollapse227$1;->val$a:Landroid/app/Activity;

    const/16 p2, 0x40

    invoke-static {p1, p2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    int-to-float p1, p1

    cmpl-float p1, v1, p1

    if-lez p1, :cond_9e

    iget-object p1, p0, Le/e/a/PlayerCollapse227$1;->val$owner:Ljava/lang/Object;

    invoke-static {p1, v1}, Le/e/a/MiniSession225;->minimizeDragged(Ljava/lang/Object;F)Z

    :cond_9e
    return v0

    .line 15
    :cond_9f
    :goto_9f
    iget-object p1, p0, Le/e/a/PlayerCollapse227$1;->val$video:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationY(F)V

    return v0
.end method
