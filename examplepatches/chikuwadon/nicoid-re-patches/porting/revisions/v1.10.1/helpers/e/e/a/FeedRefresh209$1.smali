.class Le/e/a/FeedRefresh209$1;
.super Landroid/widget/FrameLayout;
.source "FeedRefresh209.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/FeedRefresh209;-><init>(Landroid/content/Context;Landroid/view/View;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/FeedRefresh209;


# direct methods
.method constructor <init>(Le/e/a/FeedRefresh209;Landroid/content/Context;)V
    .registers 3

    .line 29
    iput-object p1, p0, Le/e/a/FeedRefresh209$1;->this$0:Le/e/a/FeedRefresh209;

    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public canScrollVertically(I)Z
    .registers 3

    .line 29
    iget-object v0, p0, Le/e/a/FeedRefresh209$1;->this$0:Le/e/a/FeedRefresh209;

    # getter for: Le/e/a/FeedRefresh209;->horizontal:Z
    invoke-static {v0}, Le/e/a/FeedRefresh209;->access$0(Le/e/a/FeedRefresh209;)Z

    move-result v0

    if-nez v0, :cond_2e

    iget-object v0, p0, Le/e/a/FeedRefresh209$1;->this$0:Le/e/a/FeedRefresh209;

    # getter for: Le/e/a/FeedRefresh209;->content:Landroid/view/View;
    invoke-static {v0}, Le/e/a/FeedRefresh209;->access$1(Le/e/a/FeedRefresh209;)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Le/e/a/TabViewport110;

    if-eqz v0, :cond_20

    iget-object v0, p0, Le/e/a/FeedRefresh209$1;->this$0:Le/e/a/FeedRefresh209;

    # getter for: Le/e/a/FeedRefresh209;->content:Landroid/view/View;
    invoke-static {v0}, Le/e/a/FeedRefresh209;->access$1(Le/e/a/FeedRefresh209;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Le/e/a/TabViewport110;

    invoke-virtual {v0}, Le/e/a/TabViewport110;->switching()Z

    move-result v0

    if-nez v0, :cond_2e

    :cond_20
    iget-object v0, p0, Le/e/a/FeedRefresh209$1;->this$0:Le/e/a/FeedRefresh209;

    # getter for: Le/e/a/FeedRefresh209;->content:Landroid/view/View;
    invoke-static {v0}, Le/e/a/FeedRefresh209;->access$1(Le/e/a/FeedRefresh209;)Landroid/view/View;

    move-result-object v0

    # invokes: Le/e/a/FeedRefresh209;->scrolls(Landroid/view/View;I)Z
    invoke-static {v0, p1}, Le/e/a/FeedRefresh209;->access$2(Landroid/view/View;I)Z

    move-result p1

    if-nez p1, :cond_2e

    const/4 p1, 0x0

    return p1

    :cond_2e
    const/4 p1, 0x1

    return p1
.end method
