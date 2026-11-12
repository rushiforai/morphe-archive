.class public final synthetic Lknc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsnc;


# direct methods
.method public synthetic constructor <init>(Lsnc;B)V
    .registers 3

    iput-byte p2, p0, Lknc;->a:B

    iput-object p1, p0, Lknc;->b:Lsnc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lknc;->a:B

    iget-object p0, p0, Lknc;->b:Lsnc;

    packed-switch v0, :pswitch_data_ca

    new-instance v0, Ldoc;

    iget-object v1, p0, Lsnc;->C:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llsf;

    invoke-virtual {p0}, Lsnc;->b()Lvpc;

    move-result-object p0

    iget-object p0, p0, Lvpc;->d:Lode;

    invoke-direct {v0, v1, p0}, Ldoc;-><init>(Llsf;Lode;)V

    return-object v0

    :pswitch_1b
    new-instance v0, Lup9;

    iget-object v1, p0, Lsnc;->n:Lt1;

    new-instance v2, Lpnc;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lpnc;-><init>(Lsnc;B)V

    invoke-direct {v0, v1, v2}, Lup9;-><init>(Lt1;Lpnc;)V

    return-object v0

    :pswitch_29
    new-instance v0, Lzi9;

    iget-object v1, p0, Lsnc;->C:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llsf;

    iget-object v2, p0, Lsnc;->z:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrs6;

    invoke-virtual {p0}, Lsnc;->b()Lvpc;

    move-result-object p0

    iget-object p0, p0, Lvpc;->d:Lode;

    invoke-direct {v0, v1, v2, p0}, Lzi9;-><init>(Llsf;Lrs6;Lode;)V

    return-object v0

    :pswitch_45
    new-instance v0, Lwi9;

    iget-object v1, p0, Lsnc;->C:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llsf;

    invoke-virtual {p0}, Lsnc;->b()Lvpc;

    move-result-object v2

    iget-object v2, v2, Lvpc;->d:Lode;

    iget-object v3, p0, Lsnc;->k:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lxoc;

    iget-object p0, p0, Lsnc;->b:Lwjh;

    iget-object p0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p0, Ld7a;

    invoke-direct {v0, v1, v2, v3, p0}, Lwi9;-><init>(Llsf;Lode;Lxoc;Ldx5;)V

    return-object v0

    :pswitch_67
    invoke-virtual {p0}, Lsnc;->a()Lfs6;

    move-result-object v0

    iget-object v0, v0, Lfs6;->d:Ljze;

    iget-object v1, p0, Lsnc;->g:Lxnc;

    iget-object v2, p0, Lsnc;->r:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lgmc;

    iget-object v2, v2, Lgmc;->t:Lrlh;

    iget-object p0, p0, Lsnc;->k:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxoc;

    new-instance v3, Ljpc;

    invoke-direct {v3, v1, v0, v2, p0}, Ljpc;-><init>(Lxnc;Ljze;Lrlh;Lxoc;)V

    return-object v3

    :pswitch_87
    new-instance v0, Lxoc;

    iget-object p0, p0, Lsnc;->d:Lx5f;

    invoke-direct {v0, p0}, Lxoc;-><init>(Lx5f;)V

    return-object v0

    :pswitch_8f
    new-instance v0, Lcg1;

    iget-object v1, p0, Lsnc;->n:Lt1;

    new-instance v2, Lpnc;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lpnc;-><init>(Lsnc;B)V

    invoke-direct {v0, v1, v2}, Lcg1;-><init>(Lt1;Lpnc;)V

    return-object v0

    :pswitch_9d
    new-instance v0, Llsf;

    iget-object v1, p0, Lsnc;->n:Lt1;

    new-instance v2, Lpnc;

    const/4 v3, 0x2

    invoke-direct {v2, p0, v3}, Lpnc;-><init>(Lsnc;B)V

    invoke-direct {v0, v1, v2}, Llsf;-><init>(Lt1;Lpnc;)V

    return-object v0

    :pswitch_ab
    new-instance v0, Lrs6;

    iget-object p0, p0, Lsnc;->E:Lb59;

    invoke-direct {v0, p0}, Lrs6;-><init>(Lb59;)V

    return-object v0

    :pswitch_b3
    new-instance v0, Lgs6;

    iget-object v1, p0, Lsnc;->k:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxoc;

    iget-object p0, p0, Lsnc;->l:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrnc;

    invoke-direct {v0, v1, p0}, Lgs6;-><init>(Lxoc;Lrnc;)V

    return-object v0

    nop

    :pswitch_data_ca
    .packed-switch 0x0
        :pswitch_b3
        :pswitch_ab
        :pswitch_9d
        :pswitch_8f
        :pswitch_87
        :pswitch_67
        :pswitch_45
        :pswitch_29
        :pswitch_1b
    .end packed-switch
.end method
