.class Le/e/a/Ranking190$CategoryRows$1;
.super Landroid/database/DataSetObserver;
.source "Ranking190.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Ranking190$CategoryRows;-><init>(Landroid/widget/ListAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/Ranking190$CategoryRows;


# direct methods
.method constructor <init>(Le/e/a/Ranking190$CategoryRows;)V
    .registers 2

    .line 62
    iput-object p1, p0, Le/e/a/Ranking190$CategoryRows$1;->this$1:Le/e/a/Ranking190$CategoryRows;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 2

    .line 62
    iget-object v0, p0, Le/e/a/Ranking190$CategoryRows$1;->this$1:Le/e/a/Ranking190$CategoryRows;

    invoke-virtual {v0}, Le/e/a/Ranking190$CategoryRows;->notifyDataSetChanged()V

    return-void
.end method

.method public onInvalidated()V
    .registers 2

    .line 62
    iget-object v0, p0, Le/e/a/Ranking190$CategoryRows$1;->this$1:Le/e/a/Ranking190$CategoryRows;

    invoke-virtual {v0}, Le/e/a/Ranking190$CategoryRows;->notifyDataSetInvalidated()V

    return-void
.end method
