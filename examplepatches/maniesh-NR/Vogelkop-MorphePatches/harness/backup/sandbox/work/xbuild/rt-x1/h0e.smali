.class public final synthetic Lh0e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbp3;


# direct methods
.method public synthetic constructor <init>(Lbp3;B)V
    .registers 3

    iput-byte p2, p0, Lh0e;->a:B

    iput-object p1, p0, Lh0e;->b:Lbp3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lh0e;->a:B

    iget-object p0, p0, Lh0e;->b:Lbp3;

    packed-switch v0, :pswitch_data_3e

    check-cast p1, Leyj;

    invoke-virtual {p0}, Lbp3;->j()V

    iget-object p1, p0, Lbp3;->f:Ljava/lang/Object;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lbp3;->d:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget-object v0, v0, Leyj;->l:Ltxj;

    if-eqz v0, :cond_29

    iget-object v0, v0, Ltxj;->f:Lixh;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v0

    goto :goto_2a

    :cond_29
    const/4 v0, 0x0

    :goto_2a
    iget-object p0, p0, Lbp3;->j:Ljava/lang/Object;

    check-cast p0, Lou1;

    iget v1, p0, Lou1;->b:I

    if-eq v0, v1, :cond_37

    iput v0, p0, Lou1;->b:I

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    :cond_37
    return-void

    :pswitch_38
    check-cast p1, Lb3c;

    invoke-virtual {p0}, Lbp3;->j()V

    return-void

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_38
    .end packed-switch
.end method
