.class public final synthetic Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda28;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/DownloadUi115$Manager;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Le/e/a/DownloadJobs115$Job;


# direct methods
.method public synthetic constructor <init>(Le/e/a/DownloadUi115$Manager;Landroid/content/Context;Ljava/lang/String;Le/e/a/DownloadJobs115$Job;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda28;->f$0:Le/e/a/DownloadUi115$Manager;

    iput-object p2, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda28;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda28;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda28;->f$3:Le/e/a/DownloadJobs115$Job;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda28;->f$0:Le/e/a/DownloadUi115$Manager;

    iget-object v1, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda28;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda28;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda28;->f$3:Le/e/a/DownloadJobs115$Job;

    invoke-virtual {v0, v1, v2, v3}, Le/e/a/DownloadUi115$Manager;->lambda$4$e-e-a-DownloadUi115$Manager(Landroid/content/Context;Ljava/lang/String;Le/e/a/DownloadJobs115$Job;)V

    return-void
.end method
