.class public final synthetic Lwa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpad;


# direct methods
.method public synthetic constructor <init>(Lpad;B)V
    .registers 3

    iput-byte p2, p0, Lwa0;->a:B

    iput-object p1, p0, Lwa0;->b:Lpad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lwa0;->a:B

    const/4 v1, 0x2

    const/16 v2, 0x98b

    iget-object p0, p0, Lwa0;->b:Lpad;

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_5e

    new-instance v0, Lydp;

    iget-object v4, p0, Lpad;->b:Ljava/lang/Object;

    check-cast v4, Lzpa;

    iget-object p0, p0, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Lva0;

    const/4 v5, 0x3

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Llg0;

    if-nez v6, :cond_2f

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Llg0;

    invoke-direct {v4, v2, v3, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llg0;

    :cond_2f
    const/16 p0, 0x11

    invoke-direct {v0, p0}, Lydp;-><init>(B)V

    return-object v0

    :pswitch_35
    new-instance v0, Lujp;

    iget-object v4, p0, Lpad;->b:Ljava/lang/Object;

    check-cast v4, Lzpa;

    iget-object p0, p0, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Lva0;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lk90;

    if-nez v5, :cond_58

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lk90;

    invoke-direct {v4, v2, v3, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v1, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk90;

    :cond_58
    const/16 p0, 0x10

    invoke-direct {v0, p0}, Lujp;-><init>(B)V

    return-object v0

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_35
    .end packed-switch
.end method
