.class final Le/e/a/NgDeleteConfirmation;
.super Ljava/lang/Object;
.implements Landroid/content/DialogInterface$OnClickListener;
.field final adapter:Le/e/a/FeedbackDev10$NgAdapter;
.field final button:Landroid/widget/Button;
.field final item:Ljava/lang/Object;
.method constructor <init>(Le/e/a/FeedbackDev10$NgAdapter;Landroid/widget/Button;Ljava/lang/Object;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Le/e/a/NgDeleteConfirmation;->adapter:Le/e/a/FeedbackDev10$NgAdapter;
    iput-object p2, p0, Le/e/a/NgDeleteConfirmation;->button:Landroid/widget/Button;
    iput-object p3, p0, Le/e/a/NgDeleteConfirmation;->item:Ljava/lang/Object;
    return-void
.end method
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    iget-object v0, p0, Le/e/a/NgDeleteConfirmation;->adapter:Le/e/a/FeedbackDev10$NgAdapter;
    iget-object v1, p0, Le/e/a/NgDeleteConfirmation;->button:Landroid/widget/Button;
    iget-object v2, p0, Le/e/a/NgDeleteConfirmation;->item:Ljava/lang/Object;
    invoke-virtual {v0, v1, v2}, Le/e/a/FeedbackDev10$NgAdapter;->confirmedDelete(Landroid/widget/Button;Ljava/lang/Object;)V
    return-void
.end method
