.class Le/e/a/TabPager233$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TabPager233.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/TabPager233;->finish(Landroid/app/Activity;Le/e/a/TabPager233$Drag;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$accept:Z

.field private final synthetic val$d:Le/e/a/TabPager233$Drag;

.field private final synthetic val$target:Le/e/a/SavedTabs227$Tab;


# direct methods
.method constructor <init>(ZLandroid/app/Activity;Le/e/a/TabPager233$Drag;Le/e/a/SavedTabs227$Tab;)V
    .registers 5

    .line 16
    iput-boolean p1, p0, Le/e/a/TabPager233$1;->val$accept:Z

    iput-object p2, p0, Le/e/a/TabPager233$1;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/TabPager233$1;->val$d:Le/e/a/TabPager233$Drag;

    iput-object p4, p0, Le/e/a/TabPager233$1;->val$target:Le/e/a/SavedTabs227$Tab;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 9

    .line 16
    iget-boolean p1, p0, Le/e/a/TabPager233$1;->val$accept:Z

    if-eqz p1, :cond_41

    iget-object p1, p0, Le/e/a/TabPager233$1;->val$a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result p1

    if-nez p1, :cond_41

    iget-object p1, p0, Le/e/a/TabPager233$1;->val$a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_15

    goto :goto_41

    :cond_15
    iget-object p1, p0, Le/e/a/TabPager233$1;->val$d:Le/e/a/TabPager233$Drag;

    iget-object p1, p1, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object v0, p0, Le/e/a/TabPager233$1;->val$target:Le/e/a/SavedTabs227$Tab;

    iget-object v0, v0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p1, v0}, Le/e/a/MultiTabs227$Host;->select(Ljava/lang/String;)V

    iget-object p1, p0, Le/e/a/TabPager233$1;->val$d:Le/e/a/TabPager233$Drag;

    iget-object p1, p1, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    if-nez p1, :cond_2b

    iget-object p1, p0, Le/e/a/TabPager233$1;->val$d:Le/e/a/TabPager233$Drag;

    iget-object p1, p1, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    goto :goto_2f

    :cond_2b
    iget-object p1, p0, Le/e/a/TabPager233$1;->val$d:Le/e/a/TabPager233$Drag;

    iget-object p1, p1, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    :goto_2f
    new-instance v6, Le/e/a/TabPager233$1$1;

    iget-object v2, p0, Le/e/a/TabPager233$1;->val$d:Le/e/a/TabPager233$Drag;

    iget-object v3, p0, Le/e/a/TabPager233$1;->val$a:Landroid/app/Activity;

    iget-object v4, p0, Le/e/a/TabPager233$1;->val$target:Le/e/a/SavedTabs227$Tab;

    move-object v0, v6

    move-object v1, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Le/e/a/TabPager233$1$1;-><init>(Le/e/a/TabPager233$1;Le/e/a/TabPager233$Drag;Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;Landroid/view/View;)V

    invoke-virtual {p1, v6}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    :cond_41
    :goto_41
    iget-object p1, p0, Le/e/a/TabPager233$1;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Le/e/a/TabPager233$1;->val$d:Le/e/a/TabPager233$Drag;

    invoke-static {p1, v0}, Le/e/a/TabPager233;->release(Landroid/app/Activity;Le/e/a/TabPager233$Drag;)V

    return-void
.end method
