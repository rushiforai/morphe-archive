.class public final Lxoj;
.super Lcx4;
.source "SourceFile"


# instance fields
.field public final synthetic h:B

.field public final i:Ljava/util/List;


# direct methods
.method public constructor <init>(Lggn;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lxoj;->h:B

    .line 303
    iget-object p1, p1, Lggn;->k:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lekc;

    .line 304
    sget-object v0, Ld9j;->a:[Ld9j;

    const v0, 0xafc8

    .line 305
    invoke-direct {p0, p1, v0}, Lcx4;-><init>(Lekc;I)V

    .line 306
    sget-object p1, Ll08;->a:Ll08;

    .line 307
    iput-object p1, p0, Lxoj;->i:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljvg;)V
    .registers 19

    move-object/from16 v0, p0

    const/4 v1, 0x0

    iput-byte v1, v0, Lxoj;->h:B

    move-object/from16 v2, p1

    iget-object v2, v2, Ljvg;->c:Ljava/lang/Object;

    check-cast v2, Lv9j;

    sget-object v3, Ld9j;->a:[Ld9j;

    const/16 v3, 0x2ee0

    invoke-direct {v0, v2, v3}, Lcx4;-><init>(Lekc;I)V

    new-instance v4, Lwoj;

    new-instance v2, Lvoj;

    invoke-direct {v2, v1}, Lvoj;-><init>(B)V

    const/16 v1, 0x7d00

    const v3, 0x7f14017d

    const v5, 0x7f0805c5

    invoke-direct {v4, v1, v3, v5, v2}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v5, Lwoj;

    new-instance v1, Lvoj;

    const/16 v2, 0x8

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    const v2, 0x80e8

    const v3, 0x7f14112d

    const v6, 0x7f08057f

    invoke-direct {v5, v2, v3, v6, v1}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v6, Lwoj;

    new-instance v1, Lvoj;

    const/16 v2, 0x9

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    const v2, 0xcf08

    const v3, 0x7f14095d

    const v7, 0x7f08057e

    invoke-direct {v6, v2, v3, v7, v1}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v7, Lwoj;

    new-instance v1, Lvoj;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    const v2, 0x84d0

    const v3, 0x7f141131

    const v8, 0x7f08059e

    invoke-direct {v7, v2, v3, v8, v1}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v8, Lwoj;

    new-instance v1, Lvoj;

    const/16 v2, 0xb

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    const v2, 0x88b8

    const v3, 0x7f141123

    const v9, 0x7f08050d

    invoke-direct {v8, v2, v3, v9, v1}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v9, Lwoj;

    new-instance v1, Lvoj;

    const/16 v2, 0xc

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    const v2, 0x8ca0

    const v3, 0x7f141130

    const v10, 0x7f080589

    invoke-direct {v9, v2, v3, v10, v1}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v10, Lwoj;

    new-instance v1, Lvoj;

    const/16 v2, 0xd

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    const v2, 0x8e94

    const v3, 0x7f1415b8

    const v11, 0x7f08063e

    invoke-direct {v10, v2, v3, v11, v1}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v11, Lwoj;

    new-instance v1, Lvoj;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    const v2, 0x9088

    const v3, 0x7f140731

    const v12, 0x7f08054e

    invoke-direct {v11, v2, v3, v12, v1}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v12, Lwoj;

    new-instance v1, Lvoj;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    const v2, 0x9470

    const v3, 0x7f140d67

    const v13, 0x7f080585

    invoke-direct {v12, v2, v3, v13, v1}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v13, Lwoj;

    new-instance v1, Lvoj;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    const v2, 0x9858

    const v3, 0x7f140cdf

    const v14, 0x7f080543

    invoke-direct {v13, v2, v3, v14, v1}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v14, Lwoj;

    new-instance v1, Lvoj;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    const v2, 0xa028

    const v3, 0x7f140f50

    const v15, 0x7f0804dd

    invoke-direct {v14, v2, v3, v15, v1}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v15, Lwoj;

    new-instance v1, Lvoj;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    const v2, 0xa410

    const v3, 0x7f1410d1

    move-object/from16 p1, v4

    const v4, 0x7f080619

    invoke-direct {v15, v2, v3, v4, v1}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    new-instance v1, Lwoj;

    new-instance v2, Lvoj;

    const/4 v3, 0x7

    invoke-direct {v2, v3}, Lvoj;-><init>(B)V

    const v3, 0xa7f8

    const v4, 0x7f140a3c

    move-object/from16 v16, v5

    const v5, 0x7f08061b

    invoke-direct {v1, v3, v4, v5, v2}, Lwoj;-><init>(IIILkotlin/jvm/functions/Function2;)V

    move-object/from16 v4, p1

    move-object/from16 v5, v16

    move-object/from16 v16, v1

    filled-new-array/range {v4 .. v16}, [Lwoj;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lxoj;->i:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Lhx4;Ljava/lang/Object;)Lix4;
    .registers 5

    iget-byte p0, p0, Lxoj;->h:B

    packed-switch p0, :pswitch_data_62

    check-cast p2, Legn;

    iget-byte p0, p2, Legn;->b:B

    const/4 v0, 0x2

    if-ne p0, v0, :cond_16

    sget-object v1, Ldgn;->a:[Ldgn;

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Lhx4;->b(I)V

    goto :goto_1d

    :cond_16
    sget-object v1, Ldgn;->a:[Ldgn;

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Lhx4;->b(I)V

    :goto_1d
    const/4 v1, 0x1

    if-eq p0, v1, :cond_24

    const/4 v1, 0x6

    invoke-virtual {p1, v1}, Lhx4;->b(I)V

    :cond_24
    if-ne p0, v0, :cond_2a

    iget-boolean v1, p2, Legn;->d:Z

    if-nez v1, :cond_2e

    :cond_2a
    const/4 v1, 0x7

    invoke-virtual {p1, v1}, Lhx4;->b(I)V

    :cond_2e
    if-ne p0, v0, :cond_34

    iget-boolean v1, p2, Legn;->e:Z

    if-nez v1, :cond_39

    :cond_34
    const/16 v1, 0x9

    invoke-virtual {p1, v1}, Lhx4;->b(I)V

    :cond_39
    if-ne p0, v0, :cond_3f

    iget-boolean p0, p2, Legn;->f:Z

    if-nez p0, :cond_44

    :cond_3f
    const/16 p0, 0xa

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    :cond_44
    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0

    :pswitch_49
    check-cast p2, Lyoj;

    iget-boolean p0, p2, Lyoj;->a:Z

    if-nez p0, :cond_5d

    sget-object p0, Ld9j;->a:[Ld9j;

    iget-object p0, p1, Lhx4;->c:Ljava/util/LinkedHashSet;

    const p2, 0xa7f8

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p0, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_5d
    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_49
    .end packed-switch
.end method

.method public final d()Ljava/util/List;
    .registers 2

    iget-byte v0, p0, Lxoj;->h:B

    packed-switch v0, :pswitch_data_e

    iget-object p0, p0, Lxoj;->i:Ljava/util/List;

    check-cast p0, Ll08;

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lxoj;->i:Ljava/util/List;

    return-object p0

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final h(Lr6j;Ljava/lang/Object;I)Lr6j;
    .registers 11

    iget-byte v0, p0, Lxoj;->h:B

    packed-switch v0, :pswitch_data_58

    check-cast p2, Legn;

    new-instance v2, Lx6j;

    new-instance p0, Lsul;

    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lsul;-><init>(B)V

    const-class v0, Lben;

    invoke-direct {v2, v0, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    iget-byte p0, p2, Legn;->b:B

    const/4 p2, 0x2

    if-ne p0, p2, :cond_1f

    const p0, 0x7f1413ee

    :goto_1d
    move v3, p0

    goto :goto_23

    :cond_1f
    const p0, 0x7f141408

    goto :goto_1d

    :goto_23
    new-instance v5, Lq0n;

    const/4 p0, 0x1

    invoke-direct {v5, p0}, Lq0n;-><init>(B)V

    const/16 v6, 0x10

    const v4, 0x7f0804c3

    move-object v0, p1

    move v1, p3

    invoke-static/range {v0 .. v6}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object p0

    return-object p0

    :pswitch_35
    move-object v0, p1

    move v1, p3

    check-cast p2, Lyoj;

    new-instance v2, Lx6j;

    new-instance p1, Lvoj;

    const/4 p2, 0x4

    invoke-direct {p1, p2}, Lvoj;-><init>(B)V

    const-class p2, Lqoj;

    invoke-direct {v2, p2, p1}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v5, Ltji;

    const/16 p1, 0x17

    invoke-direct {v5, p0, p1}, Ltji;-><init>(Ljava/lang/Object;B)V

    const/16 v6, 0x18

    const v3, 0x7f14113a

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object p0

    return-object p0

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_35
    .end packed-switch
.end method
