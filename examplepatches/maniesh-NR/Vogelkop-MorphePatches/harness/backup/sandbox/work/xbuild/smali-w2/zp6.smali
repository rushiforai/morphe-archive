.class public final Lzp6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public synthetic v:Ljava/lang/Object;

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLmt5;Ljava/lang/Object;)V
    .registers 4

    .line 11
    iput-byte p1, p0, Lzp6;->t:B

    iput-object p3, p0, Lzp6;->x:Ljava/lang/Object;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Lmt5;)V
    .registers 4

    const/16 v0, 0x8

    iput-byte v0, p0, Lzp6;->t:B

    iput-object p1, p0, Lzp6;->x:Ljava/lang/Object;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lzp6;->t:B

    iget-object p0, p0, Lzp6;->x:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_120

    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Lnzl;

    const/16 v1, 0xb

    invoke-direct {v0, v1, p3, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1f
    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Ldqc;

    const/16 v1, 0xa

    invoke-direct {v0, v1, p3, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_37
    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Lxh7;

    const/16 v1, 0x9

    invoke-direct {v0, v1, p3, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_4f
    check-cast p1, Lh1j;

    check-cast p2, Lspa;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Ljava/util/ArrayList;

    invoke-direct {v0, p0, p3}, Lzp6;-><init>(Ljava/util/ArrayList;Lmt5;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_67
    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Lu78;

    const/4 v1, 0x7

    invoke-direct {v0, v1, p3, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_7e
    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Lpz6;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p3, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_95
    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Lya9;

    const/4 v1, 0x5

    invoke-direct {v0, v1, p3, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_ac
    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Ls6h;

    const/4 v1, 0x4

    invoke-direct {v0, v1, p3, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_c3
    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Lbpd;

    const/4 v1, 0x3

    invoke-direct {v0, v1, p3, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_da
    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Lr9i;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p3, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_f1
    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Lpad;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p3, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_108
    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    new-instance v0, Lzp6;

    check-cast p0, Lcq6;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p3, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lzp6;->v:Ljava/lang/Object;

    iput-object p2, v0, Lzp6;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lzp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_120
    .packed-switch 0x0
        :pswitch_108
        :pswitch_f1
        :pswitch_da
        :pswitch_c3
        :pswitch_ac
        :pswitch_95
        :pswitch_7e
        :pswitch_67
        :pswitch_4f
        :pswitch_37
        :pswitch_1f
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Lzp6;->t:B

    const/4 v1, 0x0

    const/4 v2, 0x3

    const/4 v3, 0x7

    iget-object v4, p0, Lzp6;->x:Ljava/lang/Object;

    const-string v5, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v6, 0x1

    const/4 v7, 0x0

    packed-switch v0, :pswitch_data_3ce

    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    iget-object v1, p0, Lzp6;->w:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-boolean v8, p0, Lzp6;->u:Z

    if-eqz v8, :cond_24

    if-ne v8, v6, :cond_20

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_54

    :cond_20
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_56

    :cond_24
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_3e

    check-cast v4, Lnzl;

    iget-object p1, v4, Lnzl;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ly3i;

    invoke-interface {p1}, Ly3i;->m()Lf99;

    move-result-object p1

    goto :goto_46

    :cond_3e
    sget-object p1, Ln08;->a:Ln08;

    new-instance v1, Lxd6;

    invoke-direct {v1, p1, v3}, Lxd6;-><init>(Ljava/lang/Object;B)V

    move-object p1, v1

    :goto_46
    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-static {v0, p1, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_54

    move-object v7, v2

    goto :goto_56

    :cond_54
    :goto_54
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_56
    return-object v7

    :pswitch_57
    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    iget-object v1, p0, Lzp6;->w:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-boolean v8, p0, Lzp6;->u:Z

    if-eqz v8, :cond_6d

    if-ne v8, v6, :cond_69

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_92

    :cond_69
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_94

    :cond_6d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_7d

    check-cast v4, Ldqc;

    iget-object p1, v4, Ldqc;->h:Lcw;

    goto :goto_84

    :cond_7d
    new-instance p1, Lxd6;

    sget-object v1, Leqc;->a:Leqc;

    invoke-direct {p1, v1, v3}, Lxd6;-><init>(Ljava/lang/Object;B)V

    :goto_84
    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-static {v0, p1, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_92

    move-object v7, v2

    goto :goto_94

    :cond_92
    :goto_92
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_94
    return-object v7

    :pswitch_95
    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    iget-object v1, p0, Lzp6;->w:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-boolean v3, p0, Lzp6;->u:Z

    if-eqz v3, :cond_ab

    if-ne v3, v6, :cond_a7

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_cd

    :cond_a7
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_cf

    :cond_ab
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_bd

    check-cast v4, Lxh7;

    iget-object p1, v4, Lxh7;->e:Ljava/lang/Object;

    check-cast p1, Lur4;

    goto :goto_bf

    :cond_bd
    sget-object p1, Lg08;->a:Lg08;

    :goto_bf
    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-static {v0, p1, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_cd

    move-object v7, v2

    goto :goto_cf

    :cond_cd
    :goto_cd
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_cf
    return-object v7

    :pswitch_d0
    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Lh1j;

    iget-object v1, p0, Lzp6;->w:Ljava/lang/Object;

    check-cast v1, Lspa;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-boolean v3, p0, Lzp6;->u:Z

    if-eqz v3, :cond_e9

    if-ne v3, v6, :cond_e4

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_12c

    :cond_e4
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    :goto_e7
    move-object p1, v7

    goto :goto_12c

    :cond_e9
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v4, Ljava/util/ArrayList;

    new-instance p1, Lx84;

    invoke-direct {p1, v0}, Lx84;-><init>(Lh1j;)V

    invoke-static {p1, v4}, Lkotlin/collections/CollectionsKt;->W(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_126

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v6, v0}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v0

    new-instance v3, Lxoa;

    invoke-direct {v3, v0}, Lxoa;-><init>(Ljava/util/List;)V

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwoa;

    new-instance v0, Lspa;

    invoke-direct {v0}, Lspa;-><init>()V

    invoke-virtual {v0, v1}, Lspa;->b(Lspa;)V

    invoke-interface {p1, v0, v3, p0}, Lwoa;->a(Lspa;Lxoa;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v2, :cond_12c

    move-object p1, v2

    goto :goto_12c

    :cond_126
    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_e7

    :cond_12c
    :goto_12c
    return-object p1

    :pswitch_12d
    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    iget-object v8, p0, Lzp6;->w:Ljava/lang/Object;

    sget-object v9, Lpx5;->a:Lpx5;

    iget-boolean v10, p0, Lzp6;->u:Z

    if-eqz v10, :cond_143

    if-ne v10, v6, :cond_13f

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_17c

    :cond_13f
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_17e

    :cond_143
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_167

    check-cast v4, Lu78;

    iget-object p1, v4, Lu78;->e:Ljq6;

    iget-object p1, p1, Ljq6;->a:Lip6;

    iget-object p1, p1, Lip6;->f:Lf99;

    iget-object v3, v4, Lu78;->c:Lbpd;

    invoke-virtual {v3}, Lbpd;->G()Lbs4;

    move-result-object v3

    new-instance v4, Lsn4;

    invoke-direct {v4, v2, v7, v2}, Lsn4;-><init>(ILmt5;B)V

    new-instance v2, Lya9;

    invoke-direct {v2, p1, v3, v4, v1}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    goto :goto_16e

    :cond_167
    sget-object p1, Ldef;->a:Ldef;

    new-instance v2, Lxd6;

    invoke-direct {v2, p1, v3}, Lxd6;-><init>(Ljava/lang/Object;B)V

    :goto_16e
    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-static {v0, v2, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v9, :cond_17c

    move-object v7, v9

    goto :goto_17e

    :cond_17c
    :goto_17c
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_17e
    return-object v7

    :pswitch_17f
    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    iget-object v2, p0, Lzp6;->w:Ljava/lang/Object;

    sget-object v8, Lpx5;->a:Lpx5;

    iget-boolean v9, p0, Lzp6;->u:Z

    if-eqz v9, :cond_195

    if-ne v9, v6, :cond_191

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_1d3

    :cond_191
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1d5

    :cond_195
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_1a8

    new-instance p1, Lxd6;

    sget-object v1, Lvpn;->a:Lvpn;

    invoke-direct {p1, v1, v3}, Lxd6;-><init>(Ljava/lang/Object;B)V

    goto :goto_1c5

    :cond_1a8
    check-cast v4, Lpz6;

    iget-object p1, v4, Lpz6;->b:Lxm5;

    iget-object p1, p1, Lxm5;->a:Ljava/lang/Object;

    check-cast p1, Lau6;

    iget-object p1, p1, Lau6;->e:Lyc1;

    iget-object v2, v4, Lpz6;->d:Lga6;

    iget-object v2, v2, Lga6;->b:Ljava/lang/Object;

    check-cast v2, Loz6;

    iget-object v2, v2, Loz6;->c:Lf99;

    new-instance v3, Lim4;

    invoke-direct {v3, v6, v7, v4}, Lim4;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance v4, Lya9;

    invoke-direct {v4, p1, v2, v3, v1}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object p1, v4

    :goto_1c5
    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-static {v0, p1, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v8, :cond_1d3

    move-object v7, v8

    goto :goto_1d5

    :cond_1d3
    :goto_1d3
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1d5
    return-object v7

    :pswitch_1d6
    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    iget-object v1, p0, Lzp6;->w:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-boolean v8, p0, Lzp6;->u:Z

    if-eqz v8, :cond_1ec

    if-ne v8, v6, :cond_1e8

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_20f

    :cond_1e8
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_211

    :cond_1ec
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1fa

    check-cast v4, Lya9;

    goto :goto_201

    :cond_1fa
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    new-instance v4, Lxd6;

    invoke-direct {v4, p1, v3}, Lxd6;-><init>(Ljava/lang/Object;B)V

    :goto_201
    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-static {v0, v4, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_20f

    move-object v7, v2

    goto :goto_211

    :cond_20f
    :goto_20f
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_211
    return-object v7

    :pswitch_212
    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    iget-object v1, p0, Lzp6;->w:Ljava/lang/Object;

    sget-object v8, Lpx5;->a:Lpx5;

    iget-boolean v9, p0, Lzp6;->u:Z

    if-eqz v9, :cond_228

    if-ne v9, v6, :cond_224

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_256

    :cond_224
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_258

    :cond_228
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_241

    check-cast v4, Ls6h;

    iget-object p1, v4, Ls6h;->b:Ljava/lang/Object;

    check-cast p1, Lft6;

    iget-object p1, p1, Lft6;->d:Lyc1;

    new-instance v1, Lxd6;

    invoke-direct {v1, p1, v2}, Lxd6;-><init>(Ljava/lang/Object;B)V

    goto :goto_248

    :cond_241
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    new-instance v1, Lxd6;

    invoke-direct {v1, p1, v3}, Lxd6;-><init>(Ljava/lang/Object;B)V

    :goto_248
    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-static {v0, v1, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v8, :cond_256

    move-object v7, v8

    goto :goto_258

    :cond_256
    :goto_256
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_258
    return-object v7

    :pswitch_259
    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    iget-object v1, p0, Lzp6;->w:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-boolean v8, p0, Lzp6;->u:Z

    if-eqz v8, :cond_26f

    if-ne v8, v6, :cond_26b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_298

    :cond_26b
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_29a

    :cond_26f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_282

    sget-object p1, Lbp9;->d:Lbp9;

    new-instance v1, Lxd6;

    invoke-direct {v1, p1, v3}, Lxd6;-><init>(Ljava/lang/Object;B)V

    goto :goto_28a

    :cond_282
    check-cast v4, Lbpd;

    iget-object p1, v4, Lbpd;->b:Ljava/lang/Object;

    check-cast p1, Lip6;

    iget-object v1, p1, Lip6;->b:Lf99;

    :goto_28a
    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-static {v0, v1, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_298

    move-object v7, v2

    goto :goto_29a

    :cond_298
    :goto_298
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_29a
    return-object v7

    :pswitch_29b
    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    iget-object v1, p0, Lzp6;->w:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-boolean v8, p0, Lzp6;->u:Z

    if-eqz v8, :cond_2b1

    if-ne v8, v6, :cond_2ad

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2db

    :cond_2ad
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_2dd

    :cond_2b1
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2c5

    check-cast v4, Lr9i;

    iget-object p1, v4, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lqp6;

    iget-object p1, p1, Lqp6;->b:Lf99;

    goto :goto_2cd

    :cond_2c5
    sget-object p1, Ll08;->a:Ll08;

    new-instance v1, Lxd6;

    invoke-direct {v1, p1, v3}, Lxd6;-><init>(Ljava/lang/Object;B)V

    move-object p1, v1

    :goto_2cd
    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-static {v0, p1, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_2db

    move-object v7, v2

    goto :goto_2dd

    :cond_2db
    :goto_2db
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_2dd
    return-object v7

    :pswitch_2de
    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    iget-object v1, p0, Lzp6;->w:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-boolean v8, p0, Lzp6;->u:Z

    if-eqz v8, :cond_2f4

    if-ne v8, v6, :cond_2f0

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_324

    :cond_2f0
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_326

    :cond_2f4
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_307

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    new-instance v1, Lxd6;

    invoke-direct {v1, p1, v3}, Lxd6;-><init>(Ljava/lang/Object;B)V

    goto :goto_316

    :cond_307
    check-cast v4, Lpad;

    iget-object p1, v4, Lpad;->c:Ljava/lang/Object;

    check-cast p1, Lg7l;

    iget-object p1, p1, Lg7l;->a:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lf99;

    :goto_316
    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-static {v0, v1, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_324

    move-object v7, v2

    goto :goto_326

    :cond_324
    :goto_324
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_326
    return-object v7

    :pswitch_327
    iget-object v0, p0, Lzp6;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    iget-object v2, p0, Lzp6;->w:Ljava/lang/Object;

    sget-object v3, Lpx5;->a:Lpx5;

    iget-boolean v8, p0, Lzp6;->u:Z

    if-eqz v8, :cond_33f

    if-ne v8, v6, :cond_33a

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_3cb

    :cond_33a
    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_3cd

    :cond_33f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v2, Ljava/util/Set;

    check-cast v4, Lcq6;

    iget-object p1, v4, Lcq6;->d:Lti9;

    check-cast v2, Ljava/util/Collection;

    iget-object p1, p1, Lti9;->c:Lhnc;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Ljava/lang/Iterable;

    new-instance v4, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {v2, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_360
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3aa

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    iget-object v5, p1, Lhnc;->f:Ljava/util/HashMap;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-nez v11, :cond_3a4

    new-instance v11, Loa7;

    invoke-direct {v11, v8, v9, p1, v7}, Loa7;-><init>(JLhnc;Lmt5;)V

    invoke-static {v11}, Lf03;->g(Lkotlin/jvm/functions/Function2;)Lj94;

    move-result-object v8

    const/4 v9, -0x1

    invoke-static {v8, v9}, Lic4;->l(Lf99;I)Lf99;

    move-result-object v8

    iget-object v9, p1, Lhnc;->a:Lnx5;

    sget-object v11, Lpn7;->b:Lon7;

    sget-object v11, Lun7;->e:Lun7;

    invoke-static {v6, v11}, Lcs5;->x0(ILun7;)J

    move-result-wide v11

    invoke-static {v11, v12}, Lpn7;->f(J)J

    move-result-wide v11

    new-instance v13, Lf9k;

    invoke-direct {v13, v11, v12}, Lf9k;-><init>(J)V

    invoke-static {v8, v9, v13, v6}, La26;->l0(Lf99;Lnx5;Lbej;I)Lplh;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3a4
    check-cast v11, Lf99;

    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_360

    :cond_3aa
    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/util/Collection;

    new-array v1, v1, [Lf99;

    invoke-interface {p1, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lf99;

    new-instance v1, Lo47;

    invoke-direct {v1, p1, v6}, Lo47;-><init>([Lf99;B)V

    iput-object v7, p0, Lzp6;->v:Ljava/lang/Object;

    iput-object v7, p0, Lzp6;->w:Ljava/lang/Object;

    iput-boolean v6, p0, Lzp6;->u:Z

    invoke-static {v0, v1, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v3, :cond_3cb

    move-object v7, v3

    goto :goto_3cd

    :cond_3cb
    :goto_3cb
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_3cd
    return-object v7

    :pswitch_data_3ce
    .packed-switch 0x0
        :pswitch_327
        :pswitch_2de
        :pswitch_29b
        :pswitch_259
        :pswitch_212
        :pswitch_1d6
        :pswitch_17f
        :pswitch_12d
        :pswitch_d0
        :pswitch_95
        :pswitch_57
    .end packed-switch
.end method
