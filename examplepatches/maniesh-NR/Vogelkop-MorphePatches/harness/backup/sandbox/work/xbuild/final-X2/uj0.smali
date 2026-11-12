.class public final synthetic Luj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lzj0;


# direct methods
.method public synthetic constructor <init>(Lzj0;B)V
    .registers 3

    iput-byte p2, p0, Luj0;->a:B

    iput-object p1, p0, Luj0;->b:Lzj0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Luj0;->a:B

    const/16 v1, 0x88c

    iget-object p0, p0, Luj0;->b:Lzj0;

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_4e

    new-instance v0, Lvf0;

    iget-object p0, p0, Lzj0;->b:Lu56;

    const/16 v3, 0x9

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lqf0;

    if-nez v4, :cond_27

    new-instance v4, Lqf0;

    invoke-direct {v4, v1, v2, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v3, v2, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Lqf0;

    :cond_27
    invoke-direct {v0, v4}, Lvf0;-><init>(Lqf0;)V

    return-object v0

    :pswitch_2b
    new-instance v0, Ln9a;

    iget-object p0, p0, Lzj0;->b:Lu56;

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lek0;

    if-nez v3, :cond_47

    new-instance v3, Lek0;

    const/16 v4, 0x8

    invoke-direct {v3, v1, v2, v4}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v2, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lek0;

    :cond_47
    const/16 p0, 0x12

    invoke-direct {v0, p0}, Ln9a;-><init>(B)V

    return-object v0

    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method
