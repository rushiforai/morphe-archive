.class public final synthetic Ls6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lt6g;


# direct methods
.method public synthetic constructor <init>(Lt6g;B)V
    .registers 3

    iput-byte p2, p0, Ls6g;->a:B

    iput-object p1, p0, Ls6g;->b:Lt6g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ls6g;->a:B

    sget-object v1, Lgm0;->o:Lgm0;

    sget-object v2, Lgm0;->n:Lgm0;

    iget-object p0, p0, Ls6g;->b:Lt6g;

    packed-switch v0, :pswitch_data_58

    iget-object v0, p0, Lt6g;->k:Lorm;

    check-cast v0, Lx5f;

    invoke-virtual {v0, v2}, Lx5f;->l0(Lgm0;)V

    iget-object p0, p0, Lt6g;->r:Lkze;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c
    iget-object p0, p0, Lt6g;->k:Lorm;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v1}, Lx5f;->l0(Lgm0;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_26
    iget-object v0, p0, Lt6g;->k:Lorm;

    check-cast v0, Lx5f;

    invoke-virtual {v0, v2}, Lx5f;->l0(Lgm0;)V

    iget-object p0, p0, Lt6g;->r:Lkze;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_37
    iget-object p0, p0, Lt6g;->k:Lorm;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v1}, Lx5f;->l0(Lgm0;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_41
    iget-object v0, p0, Lt6g;->k:Lorm;

    check-cast v0, Lx5f;

    invoke-virtual {v0, v2}, Lx5f;->l0(Lgm0;)V

    iget-object v0, p0, Lt6g;->h:Ldb;

    iget-object v1, p0, Lt6g;->i:Lzwk;

    invoke-static {v0, v1}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result v0

    if-nez v0, :cond_55

    invoke-virtual {p0}, Lt6g;->h()V

    :cond_55
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_41
        :pswitch_37
        :pswitch_26
        :pswitch_1c
    .end packed-switch
.end method
