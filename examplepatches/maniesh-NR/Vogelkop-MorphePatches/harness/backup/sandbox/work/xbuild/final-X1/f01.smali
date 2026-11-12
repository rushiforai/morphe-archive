.class public final Lf01;
.super Lyph;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Llj;


# direct methods
.method public constructor <init>(Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;Ljdo;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lf01;->b:B

    iput-object p2, p0, Lf01;->c:Llj;

    .line 9
    invoke-direct {p0, p1}, Lyph;-><init>(Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;)V

    return-void
.end method

.method public constructor <init>(Lg01;Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lf01;->b:B

    iput-object p1, p0, Lf01;->c:Llj;

    invoke-direct {p0, p2}, Lyph;-><init>(Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;)V

    return-void
.end method


# virtual methods
.method public final j()V
    .registers 4

    iget-byte v0, p0, Lf01;->b:B

    iget-object v1, p0, Lf01;->c:Llj;

    packed-switch v0, :pswitch_data_3a

    check-cast v1, Ljdo;

    invoke-virtual {v1}, Ljdo;->H0()V

    invoke-super {p0}, Lyph;->j()V

    return-void

    :pswitch_10
    check-cast v1, Lg01;

    const v0, 0x7f0a0932

    invoke-virtual {v1, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v2, v1, Lg01;->w:Lqmj;

    invoke-virtual {v2}, Lqmj;->I()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v0, 0x7f0a02cb

    invoke-virtual {v1, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v1, v1, Lg01;->w:Lqmj;

    invoke-virtual {v1}, Lqmj;->I()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-super {p0}, Lyph;->j()V

    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
