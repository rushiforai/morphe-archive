.class Le/e/a/TabPager233$1$1;
.super Ljava/lang/Object;
.source "TabPager233.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/TabPager233$1;->onAnimationEnd(Landroid/animation/Animator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field frames:I

.field final synthetic this$1:Le/e/a/TabPager233$1;

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$anchor:Landroid/view/View;

.field private final synthetic val$d:Le/e/a/TabPager233$Drag;

.field private final synthetic val$target:Le/e/a/SavedTabs227$Tab;


# direct methods
.method constructor <init>(Le/e/a/TabPager233$1;Le/e/a/TabPager233$Drag;Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;Landroid/view/View;)V
    .registers 6

    .line 16
    iput-object p1, p0, Le/e/a/TabPager233$1$1;->this$1:Le/e/a/TabPager233$1;

    iput-object p2, p0, Le/e/a/TabPager233$1$1;->val$d:Le/e/a/TabPager233$Drag;

    iput-object p3, p0, Le/e/a/TabPager233$1$1;->val$a:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/TabPager233$1$1;->val$target:Le/e/a/SavedTabs227$Tab;

    iput-object p5, p0, Le/e/a/TabPager233$1$1;->val$anchor:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 16
    iget-object v0, p0, Le/e/a/TabPager233$1$1;->val$d:Le/e/a/TabPager233$Drag;

    iget-boolean v0, v0, Le/e/a/TabPager233$Drag;->released:Z

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Le/e/a/TabPager233$1$1;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_38

    iget-object v0, p0, Le/e/a/TabPager233$1$1;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_38

    iget-object v0, p0, Le/e/a/TabPager233$1$1;->val$target:Le/e/a/SavedTabs227$Tab;

    iget-object v0, v0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/TabPager233$1$1;->val$d:Le/e/a/TabPager233$Drag;

    iget-object v1, v1, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object v1, v1, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_38

    iget v0, p0, Le/e/a/TabPager233$1$1;->frames:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Le/e/a/TabPager233$1$1;->frames:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_32

    goto :goto_38

    :cond_32
    iget-object v0, p0, Le/e/a/TabPager233$1$1;->val$anchor:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    :cond_38
    :goto_38
    iget-object v0, p0, Le/e/a/TabPager233$1$1;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/TabPager233$1$1;->val$d:Le/e/a/TabPager233$Drag;

    invoke-static {v0, v1}, Le/e/a/TabPager233;->release(Landroid/app/Activity;Le/e/a/TabPager233$Drag;)V

    return-void
.end method
