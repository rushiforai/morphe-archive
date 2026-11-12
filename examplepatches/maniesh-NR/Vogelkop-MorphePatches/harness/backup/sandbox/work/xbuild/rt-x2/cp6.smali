.class public final synthetic Lcp6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldp6;


# direct methods
.method public synthetic constructor <init>(Ldp6;B)V
    .registers 3

    iput-byte p2, p0, Lcp6;->a:B

    iput-object p1, p0, Lcp6;->b:Ldp6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lcp6;->a:B

    iget-object p0, p0, Lcp6;->b:Ldp6;

    packed-switch v0, :pswitch_data_3c

    new-instance v0, Lgq6;

    iget-object p0, p0, Ldp6;->c:Lg77;

    invoke-direct {v0, p0}, Lgq6;-><init>(Lg77;)V

    return-object v0

    :pswitch_f
    new-instance v0, Lap6;

    iget-object p0, p0, Ldp6;->e:Lii;

    invoke-direct {v0, p0}, Lap6;-><init>(Lii;)V

    return-object v0

    :pswitch_17
    new-instance v0, Lnl6;

    iget-object p0, p0, Ldp6;->q:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lql6;

    invoke-direct {v0, p0}, Lnl6;-><init>(Lql6;)V

    return-object v0

    :pswitch_25
    new-instance v0, Lql6;

    iget-object p0, p0, Ldp6;->d:Leq6;

    invoke-direct {v0, p0}, Lql6;-><init>(Leq6;)V

    return-object v0

    :pswitch_2d
    new-instance v0, Lip6;

    iget-object p0, p0, Ldp6;->o:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyo6;

    invoke-direct {v0, p0}, Lip6;-><init>(Lyo6;)V

    return-object v0

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_2d
        :pswitch_25
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method
