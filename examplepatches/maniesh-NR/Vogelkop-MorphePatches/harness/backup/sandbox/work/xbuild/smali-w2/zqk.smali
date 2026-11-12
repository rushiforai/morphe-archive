.class public final synthetic Lzqk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmrk;


# direct methods
.method public synthetic constructor <init>(Lmrk;B)V
    .registers 3

    iput-byte p2, p0, Lzqk;->a:B

    iput-object p1, p0, Lzqk;->b:Lmrk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lzqk;->a:B

    iget-object p0, p0, Lzqk;->b:Lmrk;

    packed-switch v0, :pswitch_data_9e

    check-cast p1, Lhbn;

    iget-object p1, p0, Lmrk;->x:Lpde;

    invoke-virtual {p0}, Lmrk;->e()Lfyj;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_15
    check-cast p1, Landroid/content/res/Configuration;

    iget-object p1, p0, Lmrk;->x:Lpde;

    invoke-virtual {p0}, Lmrk;->e()Lfyj;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_23
    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Lmrk;->B:Lisd;

    invoke-virtual {p0}, Lisd;->G()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2d
    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    iget-object p1, p0, Lmrk;->G:Lrv7;

    invoke-virtual {p0}, Lmrk;->d()Z

    move-result v0

    if-eqz v0, :cond_7c

    iget-object v0, p0, Lmrk;->c:Lfbf;

    iget-object v0, v0, Lfbf;->a:Lgbf;

    invoke-virtual {v0, v1}, Lgbf;->k(Ljava/lang/String;)V

    iget-object v0, p0, Lmrk;->h:Liv7;

    iget-object v0, v0, Liv7;->f:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Leri;

    invoke-interface {v6}, Leri;->getId()J

    move-result-wide v2

    const-wide v4, 0x7ffffffffffffffdL

    cmp-long v0, v2, v4

    if-eqz v0, :cond_70

    invoke-interface {v6}, Leri;->getId()J

    move-result-wide v2

    const-wide v4, 0x7ffffffffffffffcL

    cmp-long v0, v2, v4

    if-eqz v0, :cond_70

    iget-object p0, p0, Lmrk;->n:Lyz9;

    iget-object v0, p0, Lyz9;->a:Lwth;

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v2, 0x6

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v6}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    goto :goto_7c

    :cond_70
    iget-object v0, p1, Lrv7;->n:Lyv7;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lyv7;->m(Z)V

    invoke-virtual {p1}, Lrv7;->a()V

    invoke-virtual {p0}, Lmrk;->g()V

    :cond_7c
    :goto_7c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_7f
    check-cast p1, Ljava/util/List;

    iget-object p1, p0, Lmrk;->h:Liv7;

    invoke-virtual {p1}, Liv7;->b()Z

    move-result p1

    if-eqz p1, :cond_8c

    invoke-virtual {p0}, Lmrk;->g()V

    :cond_8c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_8f
    check-cast p1, Ll0a;

    iget-object p1, p0, Lmrk;->x:Lpde;

    invoke-virtual {p0}, Lmrk;->e()Lfyj;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_8f
        :pswitch_7f
        :pswitch_2d
        :pswitch_23
        :pswitch_15
    .end packed-switch
.end method
