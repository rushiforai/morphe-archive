.class public final La87;
.super Lk8;
.source "SourceFile"


# instance fields
.field public final synthetic o:B


# direct methods
.method public synthetic constructor <init>(Ls9i;Lxbf;B)V
    .registers 4

    iput-byte p3, p0, La87;->o:B

    invoke-direct {p0, p1, p2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final i0(Lqim;Lyo7;)V
    .registers 6

    iget-byte v0, p0, La87;->o:B

    sget-object v1, Lijm;->b:Lijm;

    packed-switch v0, :pswitch_data_3e

    iget-object p1, p1, Lqim;->d:Lnej;

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lxbf;

    new-instance v0, Lojh;

    invoke-direct {v0, p2}, Lojh;-><init>(Lyo7;)V

    new-instance p2, Lxq3;

    const/4 v2, 0x7

    invoke-direct {p2, p0, v0, v2}, Lxq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p2, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_1f
    iget-object p1, p1, Lqim;->c:Lz77;

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lxbf;

    new-instance v0, Lojh;

    invoke-direct {v0, p2}, Lojh;-><init>(Lyo7;)V

    new-instance p2, Lljh;

    const/4 v2, 0x1

    invoke-direct {p2, p0, v0, v2}, Lljh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lnt2;

    const/4 v2, 0x2

    invoke-direct {p0, p2, v0, v2}, Lnt2;-><init>(Luim;Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p0, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method

.method public final s0(Lqim;Lai;)V
    .registers 6

    iget-byte v0, p0, La87;->o:B

    sget-object v1, Lijm;->b:Lijm;

    packed-switch v0, :pswitch_data_3e

    iget-object p1, p1, Lqim;->d:Lnej;

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Ls9i;

    new-instance v0, Lwjh;

    invoke-direct {v0, p2}, Lwjh;-><init>(Lai;)V

    new-instance p2, Lxq3;

    const/16 v2, 0x8

    invoke-direct {p2, p0, v0, v2}, Lxq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p2, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_20
    iget-object p1, p1, Lqim;->c:Lz77;

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Ls9i;

    new-instance v0, Lwjh;

    invoke-direct {v0, p2}, Lwjh;-><init>(Lai;)V

    new-instance p2, Lljh;

    const/4 v2, 0x0

    invoke-direct {p2, p0, v0, v2}, Lljh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lnt2;

    const/4 v2, 0x1

    invoke-direct {p0, p2, v0, v2}, Lnt2;-><init>(Luim;Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p0, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch
.end method
