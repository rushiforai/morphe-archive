.class Le/e/a/VideoDetails$SeriesPage$1;
.super Ljava/lang/Object;
.source "VideoDetails.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/VideoDetails$SeriesPage;-><init>(Landroid/widget/LinearLayout;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/VideoDetails$SeriesPage;


# direct methods
.method constructor <init>(Le/e/a/VideoDetails$SeriesPage;)V
    .registers 2

    .line 25
    iput-object p1, p0, Le/e/a/VideoDetails$SeriesPage$1;->this$1:Le/e/a/VideoDetails$SeriesPage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 25
    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage$1;->this$1:Le/e/a/VideoDetails$SeriesPage;

    iget-object p1, p1, Le/e/a/VideoDetails$SeriesPage;->active:Le/e/a/NetworkTask;

    if-eqz p1, :cond_20

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage$1;->this$1:Le/e/a/VideoDetails$SeriesPage;

    iget-object p1, p1, Le/e/a/VideoDetails$SeriesPage;->active:Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_20

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage$1;->this$1:Le/e/a/VideoDetails$SeriesPage;

    iget-boolean p1, p1, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    if-eqz p1, :cond_20

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage$1;->this$1:Le/e/a/VideoDetails$SeriesPage;

    const/4 v0, 0x0

    iput-boolean v0, p1, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage$1;->this$1:Le/e/a/VideoDetails$SeriesPage;

    invoke-virtual {p1}, Le/e/a/VideoDetails$SeriesPage;->load()V

    :cond_20
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 25
    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage$1;->this$1:Le/e/a/VideoDetails$SeriesPage;

    iget-object p1, p1, Le/e/a/VideoDetails$SeriesPage;->active:Le/e/a/NetworkTask;

    if-eqz p1, :cond_d

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage$1;->this$1:Le/e/a/VideoDetails$SeriesPage;

    iget-object p1, p1, Le/e/a/VideoDetails$SeriesPage;->active:Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancel()V

    :cond_d
    return-void
.end method
