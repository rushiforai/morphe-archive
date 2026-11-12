.class public final synthetic Lnln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqln;


# direct methods
.method public synthetic constructor <init>(Lqln;B)V
    .registers 3

    iput-byte p2, p0, Lnln;->a:B

    iput-object p1, p0, Lnln;->b:Lqln;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Lnln;->a:B

    iget-object p0, p0, Lnln;->b:Lqln;

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_36

    iget-object v0, p0, Lqln;->h:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqjn;

    iget-object v2, p0, Lqln;->f:Lami;

    iget-object v3, v0, Lqjn;->a:Lxkn;

    iget-object v3, v3, Lxkn;->a:Ljava/lang/String;

    new-instance v4, Liyk;

    const/16 v5, 0xd

    invoke-direct {v4, p0, v0, v5}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3, v1, v4}, Lami;->k(Ljava/lang/String;ILcom/opera/api/Callback;)V

    return-void

    :pswitch_21
    iget-object v0, p0, Lqln;->o:Lagm;

    invoke-virtual {p0}, Lqln;->i()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lagm;->n(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lqln;->f:Lami;

    new-instance v3, Loln;

    invoke-direct {v3, p0, v1}, Loln;-><init>(Lqln;B)V

    invoke-virtual {v2, v0, v1, v3}, Lami;->k(Ljava/lang/String;ILcom/opera/api/Callback;)V

    return-void

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method
