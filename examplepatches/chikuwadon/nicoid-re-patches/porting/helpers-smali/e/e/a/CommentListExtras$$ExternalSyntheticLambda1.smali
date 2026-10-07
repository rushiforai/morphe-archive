.class public final synthetic Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/CommentListExtras$Meta;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:I

.field public final synthetic f$3:Landroid/widget/Button;

.field public final synthetic f$4:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CommentListExtras$Meta;Ljava/lang/String;ILandroid/widget/Button;Ljava/lang/Object;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;->f$0:Le/e/a/CommentListExtras$Meta;

    iput-object p2, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iput p3, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;->f$2:I

    iput-object p4, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;->f$3:Landroid/widget/Button;

    iput-object p5, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;->f$4:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;->f$0:Le/e/a/CommentListExtras$Meta;

    iget-object v1, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iget v2, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;->f$2:I

    iget-object v3, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;->f$3:Landroid/widget/Button;

    iget-object v4, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;->f$4:Ljava/lang/Object;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/CommentListExtras;->lambda$nicoru$1(Le/e/a/CommentListExtras$Meta;Ljava/lang/String;ILandroid/widget/Button;Ljava/lang/Object;)V

    return-void
.end method
