.class public final synthetic Le/e/a/CommentListExtras$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/Button;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Button;Ljava/lang/Object;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda3;->f$0:Landroid/widget/Button;

    iput-object p2, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda3;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda3;->f$0:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda3;->f$1:Ljava/lang/Object;

    invoke-static {v0, v1, p1}, Le/e/a/CommentListExtras;->lambda$row$0(Landroid/widget/Button;Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method
