.class Le/e/a/CommentListExtras$2;
.super Ljava/lang/Object;
.source "CommentListExtras.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


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

    .line 24
    iput-object p1, p0, Le/e/a/CommentListExtras$2;->val$follow:Le/e/a/CommentListExtras$Follow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 24
    iget-object p1, p0, Le/e/a/CommentListExtras$2;->val$follow:Le/e/a/CommentListExtras$Follow;

    const/4 p2, 0x0

    const/4 p4, 0x1

    if-ne p3, p4, :cond_7

    goto :goto_8

    :cond_7
    const/4 p4, 0x0

    :goto_8
    iput-boolean p4, p1, Le/e/a/CommentListExtras$Follow;->byNicoru:Z

    iget-object p1, p0, Le/e/a/CommentListExtras$2;->val$follow:Le/e/a/CommentListExtras$Follow;

    invoke-virtual {p1}, Le/e/a/CommentListExtras$Follow;->sort()V

    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 24
    return-void
.end method
