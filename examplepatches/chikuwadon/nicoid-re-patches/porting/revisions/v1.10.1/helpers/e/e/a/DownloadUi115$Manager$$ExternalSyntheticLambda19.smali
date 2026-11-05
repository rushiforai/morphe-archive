.class public final synthetic Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda19;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/DownloadUi115$Manager;

.field public final synthetic f$1:Le/e/a/DownloadJobs115$Job;


# direct methods
.method public synthetic constructor <init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadJobs115$Job;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda19;->f$0:Le/e/a/DownloadUi115$Manager;

    iput-object p2, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda19;->f$1:Le/e/a/DownloadJobs115$Job;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda19;->f$0:Le/e/a/DownloadUi115$Manager;

    iget-object v1, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda19;->f$1:Le/e/a/DownloadJobs115$Job;

    invoke-virtual {v0, v1}, Le/e/a/DownloadUi115$Manager;->lambda$9$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadJobs115$Job;)V

    return-void
.end method
