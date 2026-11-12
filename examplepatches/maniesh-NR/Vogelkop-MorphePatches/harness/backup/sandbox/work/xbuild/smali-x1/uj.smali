.class public final Luj;
.super Ldx4;
.source "SourceFile"


# instance fields
.field public final synthetic g:B


# direct methods
.method public synthetic constructor <init>(BI)V
    .registers 3

    iput-byte p1, p0, Luj;->g:B

    invoke-direct {p0, p2}, Ldx4;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final h(Lr6j;I)Lr6j;
    .registers 19

    move-object/from16 v0, p0

    iget-byte v0, v0, Luj;->g:B

    const-class v1, Lrj;

    const/4 v2, 0x6

    const-class v3, Ljt2;

    const/16 v4, 0x1a

    const-class v5, Ld8j;

    const/16 v6, 0xb

    const/16 v7, 0x9

    const-class v8, Lg0c;

    packed-switch v0, :pswitch_data_13c

    new-instance v11, Lx6j;

    new-instance v0, Lsul;

    invoke-direct {v0, v7}, Lsul;-><init>(B)V

    invoke-direct {v11, v8, v0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    const/4 v14, 0x0

    const/16 v15, 0x38

    const v12, 0x7f1410e6

    const/4 v13, 0x0

    move-object/from16 v9, p1

    move/from16 v10, p2

    invoke-static/range {v9 .. v15}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object v0

    return-object v0

    :pswitch_30
    new-instance v3, Lx6j;

    new-instance v0, Lsul;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lsul;-><init>(B)V

    const-class v1, Lsyl;

    invoke-direct {v3, v1, v0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    const/4 v6, 0x0

    const/16 v7, 0x38

    const v4, 0x7f1406dc

    const/4 v5, 0x0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-static/range {v1 .. v7}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object v0

    return-object v0

    :pswitch_4d
    new-instance v3, Lx6j;

    new-instance v0, Lnf8;

    invoke-direct {v0, v6}, Lnf8;-><init>(B)V

    invoke-direct {v3, v8, v0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    const/4 v6, 0x0

    const/16 v7, 0x38

    const v4, 0x7f1406dc

    const/4 v5, 0x0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-static/range {v1 .. v7}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object v0

    return-object v0

    :pswitch_67
    new-instance v3, Lx6j;

    new-instance v0, Lnf8;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lnf8;-><init>(B)V

    invoke-direct {v3, v5, v0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v7, Ld58;

    invoke-direct {v7, v4}, Ld58;-><init>(B)V

    const v4, 0x7f140fe5

    const v5, 0x7f080565

    const/4 v6, 0x1

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual/range {v1 .. v7}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object v0

    return-object v0

    :pswitch_87
    new-instance v3, Lx6j;

    new-instance v0, Lq92;

    invoke-direct {v0, v6}, Lq92;-><init>(B)V

    invoke-direct {v3, v5, v0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    const/4 v6, 0x0

    const/16 v7, 0x38

    const v4, 0x7f140fa3

    const/4 v5, 0x0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-static/range {v1 .. v7}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object v0

    return-object v0

    :pswitch_a1
    new-instance v0, Lx6j;

    new-instance v1, Lq92;

    invoke-direct {v1, v2}, Lq92;-><init>(B)V

    invoke-direct {v0, v3, v1}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v7, Lmr3;

    const/16 v1, 0xa

    invoke-direct {v7, v1}, Lmr3;-><init>(B)V

    const v4, 0x7f140273

    const v5, 0x7f0805b1

    const/4 v6, 0x1

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object v3, v0

    invoke-virtual/range {v1 .. v7}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object v0

    return-object v0

    :pswitch_c3
    new-instance v3, Lx6j;

    new-instance v0, Lve5;

    invoke-direct {v0, v4}, Lve5;-><init>(B)V

    invoke-direct {v3, v8, v0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    const/4 v6, 0x0

    const/16 v7, 0x38

    const v4, 0x7f140ff6

    const/4 v5, 0x0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-static/range {v1 .. v7}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object v0

    return-object v0

    :pswitch_dd
    new-instance v0, Lx6j;

    new-instance v1, Lve5;

    const/16 v2, 0xc

    invoke-direct {v1, v2}, Lve5;-><init>(B)V

    invoke-direct {v0, v3, v1}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v7, Ly2;

    const/16 v1, 0xf

    invoke-direct {v7, v1}, Ly2;-><init>(B)V

    const v4, 0x7f14020a

    const v5, 0x7f08057f

    const/4 v6, 0x1

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object v3, v0

    invoke-virtual/range {v1 .. v7}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object v0

    return-object v0

    :pswitch_101
    new-instance v3, Lx6j;

    new-instance v0, Lve5;

    invoke-direct {v0, v7}, Lve5;-><init>(B)V

    invoke-direct {v3, v1, v0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v6, Ly2;

    invoke-direct {v6, v2}, Ly2;-><init>(B)V

    const/16 v7, 0x18

    const v4, 0x7f140098

    const/4 v5, 0x0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-static/range {v1 .. v7}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object v0

    return-object v0

    :pswitch_11f
    new-instance v3, Lx6j;

    new-instance v0, Lve5;

    const/16 v2, 0x8

    invoke-direct {v0, v2}, Lve5;-><init>(B)V

    invoke-direct {v3, v1, v0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    const/4 v6, 0x0

    const/16 v7, 0x38

    const v4, 0x7f1406dc

    const/4 v5, 0x0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-static/range {v1 .. v7}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_13c
    .packed-switch 0x0
        :pswitch_11f
        :pswitch_101
        :pswitch_dd
        :pswitch_c3
        :pswitch_a1
        :pswitch_87
        :pswitch_67
        :pswitch_4d
        :pswitch_30
    .end packed-switch
.end method
