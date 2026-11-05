.class public final synthetic Le/e/a/QueueUi120$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/QueueUi120;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Le/e/a/QueueUi120;I)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/QueueUi120$$ExternalSyntheticLambda0;->f$0:Le/e/a/QueueUi120;

    iput p2, p0, Le/e/a/QueueUi120$$ExternalSyntheticLambda0;->f$1:I

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/QueueUi120$$ExternalSyntheticLambda0;->f$0:Le/e/a/QueueUi120;

    iget v1, p0, Le/e/a/QueueUi120$$ExternalSyntheticLambda0;->f$1:I

    invoke-virtual {v0, v1, p1}, Le/e/a/QueueUi120;->lambda$2$e-e-a-QueueUi120(ILandroid/view/View;)Z

    move-result p1

    return p1
.end method
