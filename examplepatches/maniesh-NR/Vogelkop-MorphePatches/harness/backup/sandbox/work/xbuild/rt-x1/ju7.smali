.class public final Lju7;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lov0;

.field public final c:Lx77;


# direct methods
.method public constructor <init>(Lov0;Lx77;)V
    .registers 4

    iget-object v0, p1, Lov0;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lju7;->b:Lov0;

    iput-object p2, p0, Lju7;->c:Lx77;

    iget-object p0, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getMaxLines()I

    move-result p1

    new-instance p2, Lvkl;

    invoke-direct {p2, p0, p1}, Lvkl;-><init>(Landroid/widget/TextView;I)V

    invoke-static {p0, p0, p2}, Lp37;->B(Landroid/view/View;Ljava/lang/Object;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method
