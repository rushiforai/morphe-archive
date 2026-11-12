.class public final synthetic Lmnc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsnc;

.field public final synthetic c:Lnx5;


# direct methods
.method public synthetic constructor <init>(BLnx5;Lsnc;)V
    .registers 4

    iput-byte p1, p0, Lmnc;->a:B

    iput-object p3, p0, Lmnc;->b:Lsnc;

    iput-object p2, p0, Lmnc;->c:Lnx5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lmnc;->a:B

    iget-object v1, p0, Lmnc;->b:Lsnc;

    packed-switch v0, :pswitch_data_78

    iget-object v0, v1, Lsnc;->r:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lgmc;

    iget-object v0, v1, Lsnc;->s:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lti9;

    iget-object v0, v1, Lsnc;->z:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lrs6;

    iget-object v0, v1, Lsnc;->y:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lqs6;

    iget-object v0, v1, Lsnc;->B:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Le2f;

    new-instance v2, Lvs6;

    iget-object v3, p0, Lmnc;->c:Lnx5;

    invoke-direct/range {v2 .. v8}, Lvs6;-><init>(Lnx5;Lgmc;Lti9;Lrs6;Lqs6;Le2f;)V

    return-object v2

    :pswitch_3c
    iget-object v0, v1, Lsnc;->r:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lgmc;

    iget-object v0, v1, Lsnc;->s:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lti9;

    iget-object v0, v1, Lsnc;->y:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lqs6;

    invoke-virtual {v1}, Lsnc;->b()Lvpc;

    move-result-object v8

    invoke-virtual {v1}, Lsnc;->a()Lfs6;

    move-result-object v4

    iget-object v0, v1, Lsnc;->D:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lo0i;

    iget-object v0, v1, Lsnc;->b:Lwjh;

    iget-object v0, v0, Lwjh;->c:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Lcv6;

    new-instance v2, Lcq6;

    iget-object v3, p0, Lmnc;->c:Lnx5;

    invoke-direct/range {v2 .. v10}, Lcq6;-><init>(Lnx5;Lfs6;Lgmc;Lti9;Lqs6;Lvpc;Lo0i;Ldx5;)V

    return-object v2

    nop

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_3c
    .end packed-switch
.end method
