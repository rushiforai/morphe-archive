.class Le/e/a/VideoDetails$2;
.super Ljava/lang/Object;
.source "VideoDetails.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/VideoDetails;->scope(Landroid/view/View;Le/e/a/NetworkTask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$task:Le/e/a/NetworkTask;


# direct methods
.method constructor <init>(Le/e/a/NetworkTask;)V
    .registers 2

    .line 34
    iput-object p1, p0, Le/e/a/VideoDetails$2;->val$task:Le/e/a/NetworkTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 6

    .line 34
    iget-object v0, p0, Le/e/a/VideoDetails$2;->val$task:Le/e/a/NetworkTask;

    invoke-virtual {v0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-eqz v0, :cond_23

    instance-of v0, p1, Landroid/widget/Button;

    if-eqz v0, :cond_23

    move-object v0, p1

    check-cast v0, Landroid/widget/Button;

    const-string v1, "Retry"

    const-string v2, "\u91cd\u8a66"

    const-string v3, "\u518d\u8a66\u884c"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v1, v2}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_23
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 34
    iget-object p1, p0, Le/e/a/VideoDetails$2;->val$task:Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancel()V

    return-void
.end method
