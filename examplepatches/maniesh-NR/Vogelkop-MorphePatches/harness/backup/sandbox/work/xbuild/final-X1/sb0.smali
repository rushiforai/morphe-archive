.class public final synthetic Lsb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltb0;


# direct methods
.method public synthetic constructor <init>(Ltb0;B)V
    .registers 3

    iput-byte p2, p0, Lsb0;->a:B

    iput-object p1, p0, Lsb0;->b:Ltb0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lsb0;->a:B

    iget-object p0, p0, Lsb0;->b:Ltb0;

    packed-switch v0, :pswitch_data_3e

    new-instance v0, Lpsp;

    iget-object v1, p0, Ltb0;->a:Lzpa;

    iget-object p0, p0, Ltb0;->b:Lq56;

    const/16 v2, 0x15

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le70;

    if-nez v3, :cond_2b

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Le70;

    const/16 v3, 0x98b

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le70;

    :cond_2b
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_2f
    new-instance v0, Lzpa;

    iget-object v1, p0, Ltb0;->a:Lzpa;

    iget-object p0, p0, Ltb0;->b:Lq56;

    invoke-virtual {p0, v1}, Lq56;->y(Lzpa;)Ln56;

    const/16 p0, 0x10

    invoke-direct {v0, p0}, Lzpa;-><init>(B)V

    return-object v0

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_2f
    .end packed-switch
.end method
