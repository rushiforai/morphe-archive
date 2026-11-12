.class public final synthetic Lrwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lywa;


# direct methods
.method public synthetic constructor <init>(Lywa;B)V
    .registers 3

    iput-byte p2, p0, Lrwa;->a:B

    iput-object p1, p0, Lrwa;->b:Lywa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lrwa;->a:B

    iget-object p0, p0, Lrwa;->b:Lywa;

    packed-switch p1, :pswitch_data_4e

    sget-object p1, Lywa;->g:[Lxtb;

    invoke-virtual {p0}, Lywa;->g0()Llxa;

    move-result-object p0

    iget-object p1, p0, Llxa;->n:Lnak;

    iget-boolean v0, p0, Llxa;->o:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1e

    invoke-virtual {p1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1e

    invoke-virtual {p1, v1}, Lnak;->j(Ljava/lang/Object;)V

    goto :goto_42

    :cond_1e
    invoke-virtual {p1, v1}, Lnak;->j(Ljava/lang/Object;)V

    iget-object p1, p0, Llxa;->u:Ld3k;

    if-eqz p1, :cond_28

    invoke-virtual {p1, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_28
    new-instance p1, Lfxa;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1}, Lx7n;->f(Ljava/lang/Object;)V

    invoke-static {p0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object p1

    new-instance v0, Lp71;

    const/16 v2, 0xe

    invoke-direct {v0, v2, v1, p0}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v2, 0x3

    invoke-static {p1, v1, v1, v0, v2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p1

    iput-object p1, p0, Llxa;->u:Ld3k;

    :goto_42
    return-void

    :pswitch_43
    sget-object p1, Lywa;->g:[Lxtb;

    invoke-virtual {p0}, Lywa;->g0()Llxa;

    move-result-object p0

    invoke-virtual {p0}, Llxa;->g()V

    return-void

    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_43
    .end packed-switch
.end method
