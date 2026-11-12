.class public final synthetic Lue3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbg1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Laf3;

.field public final synthetic c:Llh4;

.field public final synthetic d:Lnsh;

.field public final synthetic e:Ltn;


# direct methods
.method public synthetic constructor <init>(Laf3;Llh4;Lnsh;Ltn;B)V
    .registers 6

    iput-byte p5, p0, Lue3;->a:B

    iput-object p1, p0, Lue3;->b:Laf3;

    iput-object p2, p0, Lue3;->c:Llh4;

    iput-object p3, p0, Lue3;->d:Lnsh;

    iput-object p4, p0, Lue3;->e:Ltn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 11

    iget-byte v0, p0, Lue3;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lue3;->e:Ltn;

    packed-switch v0, :pswitch_data_42

    move-object v6, p1

    check-cast v6, Lcf3;

    iget-object v4, p0, Lue3;->b:Laf3;

    iget-object p1, v4, Laf3;->b:Lumi;

    new-instance v3, Lwe3;

    invoke-virtual {v2}, Ltn;->i()Llf3;

    move-result-object v8

    iget-object v5, p0, Lue3;->c:Llh4;

    iget-object v7, p0, Lue3;->d:Lnsh;

    invoke-direct/range {v3 .. v8}, Lwe3;-><init>(Laf3;Llh4;Lcf3;Lnsh;Llf3;)V

    invoke-interface {p1, v3}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :pswitch_24
    move-object v5, p1

    check-cast v5, Lcf3;

    iget-object v3, p0, Lue3;->b:Laf3;

    iget-object p1, v3, Laf3;->b:Lumi;

    move-object v0, v2

    new-instance v2, Lwe3;

    invoke-virtual {v0}, Ltn;->i()Llf3;

    move-result-object v7

    iget-object v4, p0, Lue3;->c:Llh4;

    iget-object v6, p0, Lue3;->d:Lnsh;

    invoke-direct/range {v2 .. v7}, Lwe3;-><init>(Laf3;Llh4;Lcf3;Lnsh;Llf3;)V

    invoke-interface {p1, v2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_24
    .end packed-switch
.end method
