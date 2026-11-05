.class public Lcom/sauzask/nicoid/NicoidCommentListFragment$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidCommentListFragment;->b(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidCommentListFragment;


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
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

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment$a;->a:Lcom/sauzask/nicoid/NicoidCommentListFragment;

    invoke-static {p1, p3}, Le/e/a/CommentJump;->tap(Ljava/lang/Object;I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment$a;->a:Lcom/sauzask/nicoid/NicoidCommentListFragment;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidCommentListFragment;->Y:Landroid/view/View;

    if-ne p2, p1, :cond_c

    return-void

    :cond_c
    const p1, 0x7f0801b4

    .line 2
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setSingleLine(Z)V

    return-void
.end method
