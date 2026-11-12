.class public final synthetic Lmo4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfjc;
.implements Lvqd;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqjd;


# direct methods
.method public synthetic constructor <init>(Lqjd;B)V
    .registers 3

    iput-byte p2, p0, Lmo4;->a:B

    iput-object p1, p0, Lmo4;->b:Lqjd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lmo4;->a:B

    iget-object p0, p0, Lmo4;->b:Lqjd;

    check-cast p1, Leig;

    packed-switch v0, :pswitch_data_1c

    if-nez p0, :cond_d

    const/4 v0, 0x3

    goto :goto_e

    :cond_d
    const/4 v0, 0x1

    :goto_e
    invoke-interface {p1, v0, p0}, Leig;->B(ILqjd;)V

    return-void

    :pswitch_12
    const/4 v0, 0x0

    invoke-interface {p1, v0, p0}, Leig;->B(ILqjd;)V

    return-void

    :pswitch_17
    const/4 v0, 0x2

    invoke-interface {p1, v0, p0}, Leig;->B(ILqjd;)V

    return-void

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_17
        :pswitch_12
    .end packed-switch
.end method

.method public final l(Lnpd;Lnod;I)Ljava/lang/Object;
    .registers 4

    iget-byte p3, p0, Lmo4;->a:B

    iget-object p0, p0, Lmo4;->b:Lqjd;

    packed-switch p3, :pswitch_data_22

    invoke-static {p0}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, Lnpd;->k(Lnod;Lcsh;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    return-object p0

    :pswitch_10
    invoke-static {p0}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, Lnpd;->k(Lnod;Lcsh;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    return-object p0

    :pswitch_19
    invoke-static {p0}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, Lnpd;->k(Lnod;Lcsh;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    return-object p0

    :pswitch_data_22
    .packed-switch 0x3
        :pswitch_19
        :pswitch_10
    .end packed-switch
.end method
