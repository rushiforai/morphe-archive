.class public final synthetic Lxs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lys0;


# direct methods
.method public synthetic constructor <init>(Lys0;B)V
    .registers 3

    iput-byte p2, p0, Lxs0;->a:B

    iput-object p1, p0, Lxs0;->b:Lys0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lxs0;->a:B

    const/4 v1, 0x2

    const/16 v2, 0x98b

    const/4 v3, 0x3

    iget-object p0, p0, Lxs0;->b:Lys0;

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_56

    new-instance v0, Lujp;

    iget-object v5, p0, Lys0;->a:Lzpa;

    iget-object p0, p0, Lys0;->b:Lws0;

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Log0;

    if-nez v6, :cond_2b

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Log0;

    invoke-direct {v5, v2, v4, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v3, v4, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Log0;

    :cond_2b
    const/16 p0, 0x11

    invoke-direct {v0, p0}, Lujp;-><init>(B)V

    return-object v0

    :pswitch_31
    new-instance v0, Lulp;

    iget-object v5, p0, Lys0;->a:Lzpa;

    iget-object p0, p0, Lys0;->b:Lws0;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lm60;

    if-nez v6, :cond_50

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lm60;

    invoke-direct {v5, v2, v4, v3}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v1, v4, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm60;

    :cond_50
    const/16 p0, 0xf

    invoke-direct {v0, p0}, Lulp;-><init>(B)V

    return-object v0

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_31
    .end packed-switch
.end method
