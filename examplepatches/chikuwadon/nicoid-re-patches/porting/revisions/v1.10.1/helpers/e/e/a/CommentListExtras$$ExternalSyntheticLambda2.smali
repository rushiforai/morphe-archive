.class public final synthetic Le/e/a/CommentListExtras$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/CommentListExtras$Meta;

.field public final synthetic f$1:Landroid/widget/Button;

.field public final synthetic f$2:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CommentListExtras$Meta;Landroid/widget/Button;Ljava/lang/Object;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda2;->f$0:Le/e/a/CommentListExtras$Meta;

    iput-object p2, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda2;->f$1:Landroid/widget/Button;

    iput-object p3, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda2;->f$2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda2;->f$0:Le/e/a/CommentListExtras$Meta;

    iget-object v1, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda2;->f$1:Landroid/widget/Button;

    iget-object v2, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda2;->f$2:Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Le/e/a/CommentListExtras;->lambda$nicoru$2(Le/e/a/CommentListExtras$Meta;Landroid/widget/Button;Ljava/lang/Object;)V

    return-void
.end method
