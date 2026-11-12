.class public final Lucj;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lq5g;

.field public final c:Lldh;


# direct methods
.method public constructor <init>(Lq5g;Lldh;)V
    .registers 4

    iget-object v0, p1, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lucj;->b:Lq5g;

    iput-object p2, p0, Lucj;->c:Lldh;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p1, Ltk4;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Ltk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    return-void
.end method
