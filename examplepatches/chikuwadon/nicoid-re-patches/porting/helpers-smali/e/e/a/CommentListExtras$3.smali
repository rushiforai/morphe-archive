.class Le/e/a/CommentListExtras$3;
.super Ljava/lang/Object;
.source "CommentListExtras.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CommentListExtras;->install(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$follow:Le/e/a/CommentListExtras$Follow;


# direct methods
.method constructor <init>(Le/e/a/CommentListExtras$Follow;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 27
    iput-object p1, p0, Le/e/a/CommentListExtras$3;->val$follow:Le/e/a/CommentListExtras$Follow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 5

    .line 27
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 3

    .line 27
    const/4 p1, 0x1

    if-ne p2, p1, :cond_10

    iget-object p1, p0, Le/e/a/CommentListExtras$3;->val$follow:Le/e/a/CommentListExtras$Follow;

    invoke-virtual {p1}, Le/e/a/CommentListExtras$Follow;->cancelTap()V

    :cond_10
    return-void
.end method
