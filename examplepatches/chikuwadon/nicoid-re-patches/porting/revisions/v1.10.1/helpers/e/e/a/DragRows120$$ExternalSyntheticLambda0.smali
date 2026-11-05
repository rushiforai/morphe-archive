.class public final synthetic Le/e/a/DragRows120$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/DragRows120;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Le/e/a/DragRows120;ILandroid/view/View;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DragRows120$$ExternalSyntheticLambda0;->f$0:Le/e/a/DragRows120;

    iput p2, p0, Le/e/a/DragRows120$$ExternalSyntheticLambda0;->f$1:I

    iput-object p3, p0, Le/e/a/DragRows120$$ExternalSyntheticLambda0;->f$2:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/DragRows120$$ExternalSyntheticLambda0;->f$0:Le/e/a/DragRows120;

    iget v1, p0, Le/e/a/DragRows120$$ExternalSyntheticLambda0;->f$1:I

    iget-object v2, p0, Le/e/a/DragRows120$$ExternalSyntheticLambda0;->f$2:Landroid/view/View;

    invoke-virtual {v0, v1, v2, p1}, Le/e/a/DragRows120;->lambda$0$e-e-a-DragRows120(ILandroid/view/View;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
