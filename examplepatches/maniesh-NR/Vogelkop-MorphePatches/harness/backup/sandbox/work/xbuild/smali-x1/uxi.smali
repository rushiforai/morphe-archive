.class public final Luxi;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lvs;

.field public final synthetic c:Lvxi;


# direct methods
.method public constructor <init>(Lvxi;Lvs;)V
    .registers 5

    iput-object p1, p0, Luxi;->c:Lvxi;

    iget-object p1, p2, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Luxi;->b:Lvs;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget-object p1, p2, Lvs;->e:Ljava/lang/Object;

    check-cast p1, Landroid/widget/TextView;

    const v0, 0x7f04096f

    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Lf03;->E(ILandroid/content/Context;I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextAppearance(I)V

    iget-object p1, p2, Lvs;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/TextView;

    const p2, 0x7f040975

    invoke-static {p2, p0, v1}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextAppearance(I)V

    return-void
.end method
