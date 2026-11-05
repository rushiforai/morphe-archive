.class Le/e/a/CommentListExtras$4;
.super Ljava/lang/Object;
.source "CommentListExtras.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CommentListExtras;->install(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$follow:Le/e/a/CommentListExtras$Follow;

.field final synthetic val$list:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Le/e/a/CommentListExtras$Follow;Landroid/widget/ListView;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 28
    iput-object p1, p0, Le/e/a/CommentListExtras$4;->val$follow:Le/e/a/CommentListExtras$Follow;

    iput-object p2, p0, Le/e/a/CommentListExtras$4;->val$list:Landroid/widget/ListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 28
    iget-object p1, p0, Le/e/a/CommentListExtras$4;->val$follow:Le/e/a/CommentListExtras$Follow;

    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/CommentListExtras$Follow;->active:Z

    iget-object p1, p0, Le/e/a/CommentListExtras$4;->val$list:Landroid/widget/ListView;

    iget-object v0, p0, Le/e/a/CommentListExtras$4;->val$follow:Le/e/a/CommentListExtras$Follow;

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Le/e/a/CommentListExtras$4;->val$list:Landroid/widget/ListView;

    iget-object v0, p0, Le/e/a/CommentListExtras$4;->val$follow:Le/e/a/CommentListExtras$Follow;

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 28
    iget-object p1, p0, Le/e/a/CommentListExtras$4;->val$follow:Le/e/a/CommentListExtras$Follow;

    invoke-virtual {p1}, Le/e/a/CommentListExtras$Follow;->stop()V

    return-void
.end method
