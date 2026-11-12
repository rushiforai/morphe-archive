.class public final Llv2;
.super Lk56;
.source "SourceFile"


# instance fields
.field public final synthetic t:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Llv2;->t:B

    invoke-direct {p0}, Lk56;-><init>()V

    return-void
.end method


# virtual methods
.method public final k(Landroidx/recyclerview/widget/i;)Z
    .registers 3

    iget-byte v0, p0, Llv2;->t:B

    packed-switch v0, :pswitch_data_1c

    invoke-super {p0, p1}, Lk56;->k(Landroidx/recyclerview/widget/i;)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_17

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    const/4 p0, 0x0

    goto :goto_1b

    :cond_17
    invoke-super {p0, p1}, Lk56;->k(Landroidx/recyclerview/widget/i;)Z

    const/4 p0, 0x1

    :goto_1b
    return p0

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final l(Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;IIII)Z
    .registers 9

    iget-byte v0, p0, Llv2;->t:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_26

    invoke-super/range {p0 .. p6}, Lk56;->l(Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;IIII)Z

    move-result p0

    return p0

    :pswitch_b
    if-ne p2, p1, :cond_11

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    goto :goto_17

    :cond_11
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    :goto_17
    return v1

    :pswitch_18
    if-ne p2, p1, :cond_1e

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    goto :goto_24

    :cond_1e
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    :goto_24
    return v1

    nop

    :pswitch_data_26
    .packed-switch 0x1
        :pswitch_18
        :pswitch_b
    .end packed-switch
.end method

.method public final m(Landroidx/recyclerview/widget/i;IIII)Z
    .registers 8

    iget-byte v0, p0, Llv2;->t:B

    packed-switch v0, :pswitch_data_24

    invoke-super/range {p0 .. p5}, Lk56;->m(Landroidx/recyclerview/widget/i;IIII)Z

    move-result p0

    return p0

    :pswitch_a
    const/4 v0, 0x0

    if-ne p2, p4, :cond_11

    invoke-virtual {p0, p1}, Lxkj;->o(Landroidx/recyclerview/widget/i;)V

    goto :goto_22

    :cond_11
    iget-object v1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_1d

    invoke-virtual {p0, p1}, Lxkj;->o(Landroidx/recyclerview/widget/i;)V

    goto :goto_22

    :cond_1d
    invoke-super/range {p0 .. p5}, Lk56;->m(Landroidx/recyclerview/widget/i;IIII)Z

    move-result p0

    move v0, p0

    :goto_22
    return v0

    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 4

    iget-byte v0, p0, Llv2;->t:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_20

    invoke-super {p0, p1}, Lk56;->n(Landroidx/recyclerview/widget/i;)Z

    move-result p0

    return p0

    :pswitch_b
    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_17

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    goto :goto_1b

    :cond_17
    invoke-super {p0, p1}, Lk56;->n(Landroidx/recyclerview/widget/i;)Z

    const/4 v1, 0x1

    :goto_1b
    return v1

    :pswitch_1c
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    return v1

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_b
    .end packed-switch
.end method
