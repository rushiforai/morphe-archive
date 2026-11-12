.class public final synthetic Lokn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpkn;

.field public final synthetic c:Laln;


# direct methods
.method public synthetic constructor <init>(Lpkn;Laln;B)V
    .registers 4

    iput-byte p3, p0, Lokn;->a:B

    iput-object p1, p0, Lokn;->b:Lpkn;

    iput-object p2, p0, Lokn;->c:Laln;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-byte p1, p0, Lokn;->a:B

    sget-object v0, Lijm;->b:Lijm;

    const/16 v1, 0x9c4

    iget-object v2, p0, Lokn;->c:Laln;

    iget-object p0, p0, Lokn;->b:Lpkn;

    packed-switch p1, :pswitch_data_68

    iget-object p1, p0, Lpkn;->f:Lqkn;

    iget-object p1, p1, Lqkn;->b:Lqln;

    invoke-interface {v2}, Laln;->getId()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lqln;->f:Lami;

    new-instance v2, Lnpl;

    const/16 v3, 0x1c

    invoke-direct {v2, p1, v0, v3}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v0, v2}, Lami;->f(Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lpkn;->p()V

    return-void

    :pswitch_25
    invoke-virtual {p0, v2}, Lpkn;->n(Laln;)V

    return-void

    :pswitch_29
    iget-object p1, p0, Lpkn;->f:Lqkn;

    iget-object v3, p1, Lqkn;->b:Lqln;

    invoke-interface {v2}, Laln;->getId()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v3, Lqln;->j:Lvzk;

    iget-object v4, v3, Lvzk;->d:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Lvzk;->i0()V

    iget-object p1, p1, Lqkn;->p:Lysj;

    const v2, 0x7f141429

    invoke-static {v2, v1, p1}, Lam2;->i(IILysj;)Lglj;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Lr22;->b(Ljjm;Lijm;)V

    invoke-virtual {p0}, Lpkn;->p()V

    return-void

    :pswitch_4d
    iget-object p1, p0, Lpkn;->f:Lqkn;

    iget-object v3, p1, Lqkn;->b:Lqln;

    invoke-interface {v2}, Laln;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lqln;->m(Ljava/lang/String;)V

    iget-object p1, p1, Lqkn;->p:Lysj;

    const v2, 0x7f141454

    invoke-static {v2, v1, p1}, Lam2;->i(IILysj;)Lglj;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Lr22;->b(Ljjm;Lijm;)V

    invoke-virtual {p0}, Lpkn;->p()V

    return-void

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_4d
        :pswitch_29
        :pswitch_25
    .end packed-switch
.end method
