.class public final synthetic Le/e/a/DownloadWorker115$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/DownloadJobs115$Job;

.field public final synthetic f$1:Landroid/app/Service;


# direct methods
.method public synthetic constructor <init>(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda1;->f$0:Le/e/a/DownloadJobs115$Job;

    iput-object p2, p0, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda1;->f$1:Landroid/app/Service;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda1;->f$0:Le/e/a/DownloadJobs115$Job;

    iget-object v1, p0, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda1;->f$1:Landroid/app/Service;

    invoke-static {v0, v1}, Le/e/a/DownloadWorker115;->lambda$1(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V

    return-void
.end method
