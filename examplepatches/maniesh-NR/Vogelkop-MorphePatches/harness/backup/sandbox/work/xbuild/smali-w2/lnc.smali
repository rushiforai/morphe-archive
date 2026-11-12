.class public final synthetic Llnc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lnx5;

.field public final synthetic c:Lsnc;


# direct methods
.method public synthetic constructor <init>(BLnx5;Lsnc;)V
    .registers 4

    .line 11
    iput-byte p1, p0, Llnc;->a:B

    iput-object p2, p0, Llnc;->b:Lnx5;

    iput-object p3, p0, Llnc;->c:Lsnc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lsnc;Lnx5;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Llnc;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llnc;->c:Lsnc;

    iput-object p2, p0, Llnc;->b:Lnx5;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Llnc;->a:B

    iget-object v1, p0, Llnc;->b:Lnx5;

    iget-object p0, p0, Llnc;->c:Lsnc;

    packed-switch v0, :pswitch_data_48

    new-instance v0, Lgmc;

    iget-object v2, p0, Lsnc;->q:Lj4c;

    iget-object p0, p0, Lsnc;->b:Lwjh;

    iget-object p0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast p0, Ljg8;

    invoke-direct {v0, v2, p0, v1}, Lgmc;-><init>(Lj4c;Ljg8;Lnx5;)V

    return-object v0

    :pswitch_17
    new-instance v0, Lo0i;

    iget-object v2, p0, Lsnc;->y:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqs6;

    iget-object p0, p0, Lsnc;->b:Lwjh;

    iget-object p0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p0, Ld7a;

    invoke-direct {v0, v1, v2, p0}, Lo0i;-><init>(Lnx5;Lqs6;Ldx5;)V

    return-object v0

    :pswitch_2b
    new-instance v0, Le2f;

    iget-object v2, p0, Lsnc;->b:Lwjh;

    iget-object v2, v2, Lwjh;->b:Ljava/lang/Object;

    check-cast v2, Ld7a;

    iget-object v3, p0, Lsnc;->r:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgmc;

    iget-object p0, p0, Lsnc;->y:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqs6;

    invoke-direct {v0, v1, v2, v3, p0}, Le2f;-><init>(Lnx5;Ldx5;Lgmc;Lqs6;)V

    return-object v0

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_2b
        :pswitch_17
    .end packed-switch
.end method
