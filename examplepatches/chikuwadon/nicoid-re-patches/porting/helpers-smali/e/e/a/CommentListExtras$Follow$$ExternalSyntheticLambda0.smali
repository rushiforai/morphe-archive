.class public final synthetic Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/CommentListExtras$Follow;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CommentListExtras$Follow;Ljava/lang/Object;Landroid/view/View;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda0;->f$0:Le/e/a/CommentListExtras$Follow;

    iput-object p2, p0, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda0;->f$2:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda0;->f$0:Le/e/a/CommentListExtras$Follow;

    iget-object v1, p0, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda0;->f$2:Landroid/view/View;

    invoke-virtual {v0, v1, v2}, Le/e/a/CommentListExtras$Follow;->lambda$clicks$0$e-e-a-CommentListExtras$Follow(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method
