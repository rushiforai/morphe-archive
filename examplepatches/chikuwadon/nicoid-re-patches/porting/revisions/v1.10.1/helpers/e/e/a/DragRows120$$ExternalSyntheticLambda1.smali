.class public final synthetic Le/e/a/DragRows120$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnDragListener;


# instance fields
.field public final synthetic f$0:Le/e/a/DragRows120;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Le/e/a/DragRows120;I)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DragRows120$$ExternalSyntheticLambda1;->f$0:Le/e/a/DragRows120;

    iput p2, p0, Le/e/a/DragRows120$$ExternalSyntheticLambda1;->f$1:I

    return-void
.end method


# virtual methods
.method public final onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/DragRows120$$ExternalSyntheticLambda1;->f$0:Le/e/a/DragRows120;

    iget v1, p0, Le/e/a/DragRows120$$ExternalSyntheticLambda1;->f$1:I

    invoke-virtual {v0, v1, p1, p2}, Le/e/a/DragRows120;->lambda$1$e-e-a-DragRows120(ILandroid/view/View;Landroid/view/DragEvent;)Z

    move-result p1

    return p1
.end method
