.class public final synthetic Le/e/a/CommentDisplay$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/view/View;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;I)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentDisplay$$ExternalSyntheticLambda0;->f$0:Landroid/view/View;

    iput p2, p0, Le/e/a/CommentDisplay$$ExternalSyntheticLambda0;->f$1:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/CommentDisplay$$ExternalSyntheticLambda0;->f$0:Landroid/view/View;

    iget v1, p0, Le/e/a/CommentDisplay$$ExternalSyntheticLambda0;->f$1:I

    invoke-static {v0, v1}, Le/e/a/CommentDisplay;->lambda$0(Landroid/view/View;I)V

    return-void
.end method
