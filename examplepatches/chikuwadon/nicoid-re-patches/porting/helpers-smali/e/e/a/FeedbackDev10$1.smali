.class Le/e/a/FeedbackDev10$1;
.super Landroid/database/DataSetObserver;
.source "FeedbackDev10.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/FeedbackDev10;->installNg(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$adapter:Le/e/a/FeedbackDev10$NgAdapter;

.field final synthetic val$empty:Landroid/widget/TextView;

.field final synthetic val$nativeAdapter:Landroid/widget/BaseAdapter;


# direct methods
.method constructor <init>(Le/e/a/FeedbackDev10$NgAdapter;Landroid/widget/TextView;Landroid/widget/BaseAdapter;)V
    .registers 4

    .line 109
    iput-object p1, p0, Le/e/a/FeedbackDev10$1;->val$adapter:Le/e/a/FeedbackDev10$NgAdapter;

    iput-object p2, p0, Le/e/a/FeedbackDev10$1;->val$empty:Landroid/widget/TextView;

    iput-object p3, p0, Le/e/a/FeedbackDev10$1;->val$nativeAdapter:Landroid/widget/BaseAdapter;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 3

    .line 109
    iget-object v0, p0, Le/e/a/FeedbackDev10$1;->val$adapter:Le/e/a/FeedbackDev10$NgAdapter;

    invoke-virtual {v0}, Le/e/a/FeedbackDev10$NgAdapter;->notifyDataSetChanged()V

    iget-object v0, p0, Le/e/a/FeedbackDev10$1;->val$empty:Landroid/widget/TextView;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Le/e/a/FeedbackDev10$1;->val$empty:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/FeedbackDev10$1;->val$nativeAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v1}, Landroid/widget/BaseAdapter;->getCount()I

    move-result v1

    if-nez v1, :cond_15

    const/4 v1, 0x0

    goto :goto_17

    :cond_15
    const/16 v1, 0x8

    :goto_17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_1a
    return-void
.end method
