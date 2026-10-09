.class Le/e/a/VideoDetails$TreePage$1;
.super Ljava/lang/Object;
.source "VideoDetails.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/VideoDetails$TreePage;-><init>(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/VideoDetails$TreePage;


# direct methods
.method constructor <init>(Le/e/a/VideoDetails$TreePage;)V
    .registers 2

    .line 20
    iput-object p1, p0, Le/e/a/VideoDetails$TreePage$1;->this$1:Le/e/a/VideoDetails$TreePage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 20
    iget-object p1, p0, Le/e/a/VideoDetails$TreePage$1;->this$1:Le/e/a/VideoDetails$TreePage;

    iget-object p1, p1, Le/e/a/VideoDetails$TreePage;->active:Le/e/a/NetworkTask;

    if-eqz p1, :cond_20

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage$1;->this$1:Le/e/a/VideoDetails$TreePage;

    iget-object p1, p1, Le/e/a/VideoDetails$TreePage;->active:Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_20

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage$1;->this$1:Le/e/a/VideoDetails$TreePage;

    iget-boolean p1, p1, Le/e/a/VideoDetails$TreePage;->busy:Z

    if-eqz p1, :cond_20

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage$1;->this$1:Le/e/a/VideoDetails$TreePage;

    const/4 v0, 0x0

    iput-boolean v0, p1, Le/e/a/VideoDetails$TreePage;->busy:Z

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage$1;->this$1:Le/e/a/VideoDetails$TreePage;

    invoke-virtual {p1}, Le/e/a/VideoDetails$TreePage;->load()V

    :cond_20
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 20
    iget-object p1, p0, Le/e/a/VideoDetails$TreePage$1;->this$1:Le/e/a/VideoDetails$TreePage;

    iget-object p1, p1, Le/e/a/VideoDetails$TreePage;->active:Le/e/a/NetworkTask;

    if-eqz p1, :cond_d

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage$1;->this$1:Le/e/a/VideoDetails$TreePage;

    iget-object p1, p1, Le/e/a/VideoDetails$TreePage;->active:Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancel()V

    :cond_d
    return-void
.end method
