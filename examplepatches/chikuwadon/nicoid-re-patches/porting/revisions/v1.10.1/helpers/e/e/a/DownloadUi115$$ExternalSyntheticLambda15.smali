.class public final synthetic Le/e/a/DownloadUi115$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/DownloadUi115$Manager;


# direct methods
.method public synthetic constructor <init>(Le/e/a/DownloadUi115$Manager;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DownloadUi115$$ExternalSyntheticLambda15;->f$0:Le/e/a/DownloadUi115$Manager;

    return-void
.end method


# virtual methods
.method public final onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 12

    .line 0
    iget-object v0, p0, Le/e/a/DownloadUi115$$ExternalSyntheticLambda15;->f$0:Le/e/a/DownloadUi115$Manager;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Le/e/a/DownloadUi115;->lambda$7(Le/e/a/DownloadUi115$Manager;Landroid/widget/AdapterView;Landroid/view/View;IJ)Z

    move-result p1

    return p1
.end method
