.class Le/e/a/DownloadUi115$Manager$1;
.super Ljava/lang/Object;
.source "DownloadUi115.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DownloadUi115$Manager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/DownloadUi115$Manager;


# direct methods
.method constructor <init>(Le/e/a/DownloadUi115$Manager;)V
    .registers 2

    .line 55
    iput-object p1, p0, Le/e/a/DownloadUi115$Manager$1;->this$1:Le/e/a/DownloadUi115$Manager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 55
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager$1;->this$1:Le/e/a/DownloadUi115$Manager;

    iget-boolean v0, v0, Le/e/a/DownloadUi115$Manager;->closed:Z

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager$1;->this$1:Le/e/a/DownloadUi115$Manager;

    invoke-virtual {v0}, Le/e/a/DownloadUi115$Manager;->update()V

    iget-object v0, p0, Le/e/a/DownloadUi115$Manager$1;->this$1:Le/e/a/DownloadUi115$Manager;

    iget v0, v0, Le/e/a/DownloadUi115$Manager;->mode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_27

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager$1;->this$1:Le/e/a/DownloadUi115$Manager;

    iget-wide v2, v2, Le/e/a/DownloadUi115$Manager;->lastScan:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    cmp-long v4, v0, v2

    if-ltz v4, :cond_27

    iget-object v0, p0, Le/e/a/DownloadUi115$Manager$1;->this$1:Le/e/a/DownloadUi115$Manager;

    invoke-virtual {v0}, Le/e/a/DownloadUi115$Manager;->reload()V

    :cond_27
    sget-object v0, Le/e/a/DownloadUi115;->MAIN:Landroid/os/Handler;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
