.class public final synthetic Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda26;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/DownloadUi115$Manager;

.field public final synthetic f$1:Le/e/a/DownloadUi115$Row;

.field public final synthetic f$2:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadUi115$Row;Landroid/app/Activity;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda26;->f$0:Le/e/a/DownloadUi115$Manager;

    iput-object p2, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda26;->f$1:Le/e/a/DownloadUi115$Row;

    iput-object p3, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda26;->f$2:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda26;->f$0:Le/e/a/DownloadUi115$Manager;

    iget-object v1, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda26;->f$1:Le/e/a/DownloadUi115$Row;

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda26;->f$2:Landroid/app/Activity;

    invoke-virtual {v0, v1, v2, p1, p2}, Le/e/a/DownloadUi115$Manager;->lambda$2$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadUi115$Row;Landroid/app/Activity;Landroid/content/DialogInterface;I)V

    return-void
.end method
