.class Le/e/a/UiDialogs$1;
.super Ljava/lang/Object;
.source "UiDialogs.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/UiDialogs;->inputs(Landroid/view/View;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$accent:I

.field final synthetic val$dark:Z


# direct methods
.method constructor <init>(IZ)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 72
    iput p1, p0, Le/e/a/UiDialogs$1;->val$accent:I

    iput-boolean p2, p0, Le/e/a/UiDialogs$1;->val$dark:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 9
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "first"    # I
    .param p3, "count"    # I
    .param p4, "total"    # I

    .line 72
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_1
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_15

    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iget v2, p0, Le/e/a/UiDialogs$1;->val$accent:I

    iget-boolean v3, p0, Le/e/a/UiDialogs$1;->val$dark:Z

    # invokes: Le/e/a/UiDialogs;->inputs(Landroid/view/View;IZ)V
    invoke-static {v1, v2, v3}, Le/e/a/UiDialogs;->access$000(Landroid/view/View;IZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0    # "n":I
    :cond_15
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 3
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "state"    # I

    .line 72
    return-void
.end method
