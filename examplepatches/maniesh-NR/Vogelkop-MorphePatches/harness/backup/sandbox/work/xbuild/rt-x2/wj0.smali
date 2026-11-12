.class public final synthetic Lwj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbk0;


# direct methods
.method public synthetic constructor <init>(Lbk0;B)V
    .registers 3

    iput-byte p2, p0, Lwj0;->a:B

    iput-object p1, p0, Lwj0;->b:Lbk0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lwj0;->a:B

    const/16 v1, 0x97f

    const/4 v2, 0x1

    iget-object p0, p0, Lwj0;->b:Lbk0;

    packed-switch v0, :pswitch_data_a4

    new-instance v0, Ltn0;

    iget-object v3, p0, Lbk0;->a:Ln9a;

    iget-object p0, p0, Lbk0;->b:Lw56;

    const/16 v4, 0xc

    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrn0;

    if-nez v5, :cond_2e

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lrn0;

    const/16 v5, 0xa

    invoke-direct {v3, v1, v2, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v4, v2, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Lrn0;

    :cond_2e
    invoke-direct {v0, v5}, Ltn0;-><init>(Lrn0;)V

    return-object v0

    :pswitch_32
    new-instance v0, Lqii;

    iget-object v3, p0, Lbk0;->a:Ln9a;

    iget-object p0, p0, Lbk0;->b:Lw56;

    const/4 v4, 0x6

    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lsf0;

    if-nez v5, :cond_52

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lsf0;

    invoke-direct {v3, v1, v2, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v4, v2, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsf0;

    :cond_52
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_56
    new-instance v0, Lyqa;

    iget-object v3, p0, Lbk0;->a:Ln9a;

    iget-object p0, p0, Lbk0;->b:Lw56;

    const/4 v4, 0x5

    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqa0;

    if-nez v5, :cond_79

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lqa0;

    const/16 v6, 0xf

    invoke-direct {v5, v1, v2, v6}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v4, v2, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Lqa0;

    :cond_79
    invoke-direct {v0, v3, v5}, Lyqa;-><init>(Ln9a;Lqa0;)V

    return-object v0

    :pswitch_7d
    new-instance v0, Lrbe;

    iget-object v3, p0, Lbk0;->a:Ln9a;

    iget-object p0, p0, Lbk0;->b:Lw56;

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lgk0;

    if-nez v4, :cond_9e

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lgk0;

    const/16 v4, 0x8

    invoke-direct {v3, v1, v2, v4}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v2, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgk0;

    :cond_9e
    const/16 p0, 0x12

    invoke-direct {v0, p0}, Lrbe;-><init>(B)V

    return-object v0

    :pswitch_data_a4
    .packed-switch 0x0
        :pswitch_7d
        :pswitch_56
        :pswitch_32
    .end packed-switch
.end method
