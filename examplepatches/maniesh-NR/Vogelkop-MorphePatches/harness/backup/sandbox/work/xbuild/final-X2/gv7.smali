.class public final synthetic Lgv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Liv7;


# direct methods
.method public synthetic constructor <init>(Liv7;B)V
    .registers 3

    iput-byte p2, p0, Lgv7;->a:B

    iput-object p1, p0, Lgv7;->b:Liv7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lgv7;->a:B

    iget-object p0, p0, Lgv7;->b:Liv7;

    packed-switch v0, :pswitch_data_94

    move-object v6, p1

    check-cast v6, Leri;

    iget-object p0, p0, Liv7;->i:Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lhv7;

    const/4 v5, 0x0

    const/16 v7, 0xf

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v7}, Lhv7;->a(Lhv7;Ljava/util/List;Leri;Leri;Ll42;Leri;I)Lhv7;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_23
    move-object v4, p1

    check-cast v4, Ll42;

    iget-object p0, p0, Liv7;->i:Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lhv7;

    const/4 v5, 0x0

    const/16 v6, 0x17

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v6}, Lhv7;->a(Lhv7;Ljava/util/List;Leri;Leri;Ll42;Leri;I)Lhv7;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3f
    move-object v3, p1

    check-cast v3, Leri;

    iget-object p0, p0, Liv7;->i:Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lhv7;

    const/4 v5, 0x0

    const/16 v6, 0x1b

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lhv7;->a(Lhv7;Ljava/util/List;Leri;Leri;Ll42;Leri;I)Lhv7;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_5b
    move-object v2, p1

    check-cast v2, Leri;

    iget-object p0, p0, Liv7;->i:Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lhv7;

    const/4 v5, 0x0

    const/16 v6, 0x1d

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lhv7;->a(Lhv7;Ljava/util/List;Leri;Leri;Ll42;Leri;I)Lhv7;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_77
    move-object v1, p1

    check-cast v1, Ljava/util/List;

    iget-object p0, p0, Liv7;->i:Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lhv7;

    const/4 v5, 0x0

    const/16 v6, 0x1e

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lhv7;->a(Lhv7;Ljava/util/List;Leri;Leri;Ll42;Leri;I)Lhv7;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_94
    .packed-switch 0x0
        :pswitch_77
        :pswitch_5b
        :pswitch_3f
        :pswitch_23
    .end packed-switch
.end method
