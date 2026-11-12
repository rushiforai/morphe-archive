.class public final Lagb;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLmt5;Ljava/lang/Object;)V
    .registers 4

    .line 11
    iput-byte p1, p0, Lagb;->t:B

    iput-object p3, p0, Lagb;->v:Ljava/lang/Object;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public synthetic constructor <init>(Lcom/opera/api/Callback;ZLmt5;B)V
    .registers 5

    iput-byte p4, p0, Lagb;->t:B

    iput-object p1, p0, Lagb;->v:Ljava/lang/Object;

    iput-boolean p2, p0, Lagb;->u:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte p1, p0, Lagb;->t:B

    iget-object v0, p0, Lagb;->v:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_130

    new-instance p0, Lagb;

    check-cast v0, Lp46;

    const/16 p1, 0x1d

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_11
    new-instance p0, Lagb;

    check-cast v0, Lva1;

    const/16 p1, 0x1c

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_1b
    new-instance p0, Lagb;

    check-cast v0, Ljek;

    const/16 p1, 0x1b

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_25
    new-instance p0, Lagb;

    check-cast v0, Lg1k;

    const/16 p1, 0x1a

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_2f
    new-instance p0, Lagb;

    check-cast v0, Lfij;

    const/16 p1, 0x19

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_39
    new-instance p0, Lagb;

    check-cast v0, Lbij;

    const/16 p1, 0x18

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_43
    new-instance p0, Lagb;

    check-cast v0, Lx4i;

    const/16 p1, 0x17

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_4d
    new-instance p0, Lagb;

    check-cast v0, Lshf;

    const/16 p1, 0x16

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_57
    new-instance p0, Lagb;

    check-cast v0, Lt2i;

    const/16 p1, 0x15

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_61
    new-instance p0, Lagb;

    check-cast v0, Ljava/lang/String;

    const/16 p1, 0x14

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_6b
    new-instance p0, Lagb;

    check-cast v0, Ls2i;

    const/16 p1, 0x13

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_75
    new-instance p0, Lagb;

    check-cast v0, Lr2i;

    const/16 p1, 0x12

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_7f
    new-instance p0, Lagb;

    check-cast v0, Lkt5;

    const/16 p1, 0x11

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_89
    new-instance p0, Lagb;

    check-cast v0, Lx79;

    const/16 p1, 0x10

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_93
    new-instance p0, Lagb;

    check-cast v0, Lx79;

    const/16 p1, 0xf

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_9d
    new-instance p0, Lagb;

    check-cast v0, Lcom/opera/android/OperaApplication;

    const/16 p1, 0xe

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_a7
    new-instance p0, Lagb;

    check-cast v0, Lz9f;

    const/16 p1, 0xd

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_b1
    new-instance p1, Lagb;

    check-cast v0, Lcom/opera/api/Callback;

    iget-boolean p0, p0, Lagb;->u:Z

    const/16 v1, 0xc

    invoke-direct {p1, v0, p0, p2, v1}, Lagb;-><init>(Lcom/opera/api/Callback;ZLmt5;B)V

    return-object p1

    :pswitch_bd
    new-instance p1, Lagb;

    check-cast v0, Ly0a;

    iget-boolean p0, p0, Lagb;->u:Z

    const/16 v1, 0xb

    invoke-direct {p1, v0, p0, p2, v1}, Lagb;-><init>(Lcom/opera/api/Callback;ZLmt5;B)V

    return-object p1

    :pswitch_c9
    new-instance p0, Lagb;

    check-cast v0, Lcq5;

    const/16 p1, 0xa

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_d3
    new-instance p0, Lagb;

    check-cast v0, Lsae;

    const/16 p1, 0x9

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_dd
    new-instance p0, Lagb;

    check-cast v0, Lcd1;

    const/16 p1, 0x8

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_e7
    new-instance p0, Lagb;

    check-cast v0, Lv6e;

    const/4 p1, 0x7

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_f0
    new-instance p0, Lagb;

    check-cast v0, Lb6e;

    const/4 p1, 0x6

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_f9
    new-instance p0, Lagb;

    check-cast v0, Llrh;

    const/4 p1, 0x5

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_102
    new-instance p0, Lagb;

    check-cast v0, Lacd;

    const/4 p1, 0x4

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_10b
    new-instance p0, Lagb;

    check-cast v0, Lgmc;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_114
    new-instance p0, Lagb;

    check-cast v0, Lc5o;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_11d
    new-instance p0, Lagb;

    check-cast v0, Lrmb;

    const/4 p1, 0x1

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_126
    new-instance p0, Lagb;

    check-cast v0, Ldgb;

    const/4 p1, 0x0

    invoke-direct {p0, p1, p2, v0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    nop

    :pswitch_data_130
    .packed-switch 0x0
        :pswitch_126
        :pswitch_11d
        :pswitch_114
        :pswitch_10b
        :pswitch_102
        :pswitch_f9
        :pswitch_f0
        :pswitch_e7
        :pswitch_dd
        :pswitch_d3
        :pswitch_c9
        :pswitch_bd
        :pswitch_b1
        :pswitch_a7
        :pswitch_9d
        :pswitch_93
        :pswitch_89
        :pswitch_7f
        :pswitch_75
        :pswitch_6b
        :pswitch_61
        :pswitch_57
        :pswitch_4d
        :pswitch_43
        :pswitch_39
        :pswitch_2f
        :pswitch_25
        :pswitch_1b
        :pswitch_11
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lagb;->t:B

    packed-switch v0, :pswitch_data_204

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_27
    check-cast p1, Lna6;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_38
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_49
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_5a
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_6b
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_7c
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_8d
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_9e
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_af
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_c0
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_d1
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_e2
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_f3
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_104
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_115
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_126
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_137
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_148
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_159
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16a
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_17b
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_18c
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_19d
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1ae
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1bf
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1d0
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1e1
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1f2
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lagb;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lagb;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lagb;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_204
    .packed-switch 0x0
        :pswitch_1f2
        :pswitch_1e1
        :pswitch_1d0
        :pswitch_1bf
        :pswitch_1ae
        :pswitch_19d
        :pswitch_18c
        :pswitch_17b
        :pswitch_16a
        :pswitch_159
        :pswitch_148
        :pswitch_137
        :pswitch_126
        :pswitch_115
        :pswitch_104
        :pswitch_f3
        :pswitch_e2
        :pswitch_d1
        :pswitch_c0
        :pswitch_af
        :pswitch_9e
        :pswitch_8d
        :pswitch_7c
        :pswitch_6b
        :pswitch_5a
        :pswitch_49
        :pswitch_38
        :pswitch_27
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-byte v0, p0, Lagb;->t:B

    const/16 v1, 0x12

    const/4 v2, 0x0

    const/16 v3, 0x17

    const/16 v4, 0xf

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/16 v8, 0xe

    const-string v9, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v10, 0x1

    iget-object v11, p0, Lagb;->v:Ljava/lang/Object;

    const/4 v12, 0x0

    packed-switch v0, :pswitch_data_5aa

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_26

    if-ne v1, v10, :cond_22

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_41

    :cond_22
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_43

    :cond_26
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lp46;

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lvr;

    invoke-direct {v1, v4, v12, v11}, Lvr;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, p0}, Lsgb;->q(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_3d

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_3d
    if-ne v1, v0, :cond_41

    move-object v12, v0

    goto :goto_43

    :cond_41
    :goto_41
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_43
    return-object v12

    :pswitch_44
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_54

    if-ne v1, v10, :cond_50

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6f

    :cond_50
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_71

    :cond_54
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lva1;

    new-instance v1, Lt78;

    invoke-direct {v1, v10, v12, v11}, Lt78;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance v2, Lfgh;

    invoke-direct {v2, v1}, Lfgh;-><init>(Lkotlin/jvm/functions/Function1;)V

    iput-boolean v10, p0, Lagb;->u:Z

    iget-object v1, v2, Lfgh;->b:Lkotlin/jvm/functions/Function1;

    invoke-interface {v1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_6f

    move-object v12, v0

    goto :goto_71

    :cond_6f
    :goto_6f
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_71
    return-object v12

    :pswitch_72
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_82

    if-ne v1, v10, :cond_7e

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_91

    :cond_7e
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_93

    :cond_82
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Ljek;

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-virtual {v11, p0}, Ljek;->c(Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_91

    move-object v12, v0

    goto :goto_93

    :cond_91
    :goto_91
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_93
    return-object v12

    :pswitch_94
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_a4

    if-ne v1, v10, :cond_a0

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_b3

    :cond_a0
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_b5

    :cond_a4
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lg1k;

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-virtual {v11, p0}, Lg1k;->g(Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_b3

    move-object v12, v0

    goto :goto_b5

    :cond_b3
    :goto_b3
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_b5
    return-object v12

    :pswitch_b6
    check-cast v11, Lfij;

    iget-object v0, v11, Lfij;->a:Lcom/opera/android/BrowserActivity;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-boolean v4, p0, Lagb;->u:Z

    if-eqz v4, :cond_cb

    if-ne v4, v10, :cond_c7

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v3, p1

    goto :goto_ed

    :cond_c7
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_122

    :cond_cb
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v4

    iget-object v4, v4, Lslk;->c:Lpy9;

    iget-object v4, v4, Lpy9;->g:Lkze;

    new-instance v6, Lxf;

    invoke-direct {v6, v7, v12, v3}, Lxf;-><init>(ILmt5;B)V

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-static {v4, v6, p0}, Lxf8;->w(Lekc;Lkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v1, :cond_ed

    move-object v12, v1

    goto :goto_122

    :cond_ed
    :goto_ed
    check-cast v3, Lqtg;

    iget v1, v11, Lfij;->c:I

    iget v4, v3, Lqtg;->a:I

    const/4 v5, -0x1

    if-eq v4, v5, :cond_120

    if-eq v4, v10, :cond_fd

    if-ne v4, v7, :cond_ff

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_122

    :cond_fd
    iget v1, v3, Lqtg;->b:I

    :cond_ff
    if-gtz v1, :cond_104

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_122

    :cond_104
    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->F0()Lyug;

    move-result-object v0

    iget-object v3, v11, Lfij;->b:Ljava/lang/String;

    iget-object v4, v11, Lfij;->d:Lltg;

    iget-object v0, v0, Lyug;->b:Lq2;

    invoke-virtual {v0}, Lq2;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgjm;

    new-instance v5, Lptg;

    const/4 v6, 0x5

    invoke-direct {v5, v6, v4, v3, v1}, Lptg;-><init>(ILltg;Ljava/lang/String;I)V

    invoke-virtual {v0, v5, v2}, Lgjm;->e(Ln37;Z)V

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_122

    :cond_120
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_122
    return-object v12

    :pswitch_123
    check-cast v11, Lbij;

    iget-object v0, v11, Lbij;->a:Lcom/opera/android/BrowserActivity;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-boolean v3, p0, Lagb;->u:Z

    if-eqz v3, :cond_138

    if-ne v3, v10, :cond_134

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v3, p1

    goto :goto_151

    :cond_134
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_179

    :cond_138
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v3

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-static {v3, p0}, Lbwg;->q(Lslk;Lnt5;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v1, :cond_151

    move-object v12, v1

    goto :goto_179

    :cond_151
    :goto_151
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_177

    sget v1, Lbij;->b:I

    new-array v1, v2, [Ln6h;

    new-instance v3, Lwzg;

    const/4 v2, 0x4

    const-class v4, Li8d;

    invoke-direct {v3, v12, v4, v2}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lzhj;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/16 v6, 0x1003

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v2 .. v9}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v2, v0}, Lzhj;->c(Landroid/content/Context;)V

    :cond_177
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_179
    return-object v12

    :pswitch_17a
    check-cast v11, Lx4i;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_18c

    if-ne v1, v10, :cond_188

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_1a4

    :cond_188
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1a6

    :cond_18c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v1, v11, Lx4i;->a:Ly3i;

    invoke-interface {v1}, Ly3i;->d()Lf99;

    move-result-object v1

    new-instance v2, Lo71;

    invoke-direct {v2, v11, v4}, Lo71;-><init>(Ljava/lang/Object;B)V

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-interface {v1, v2, p0}, Lf99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_1a4

    move-object v12, v0

    goto :goto_1a6

    :cond_1a4
    :goto_1a4
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1a6
    return-object v12

    :pswitch_1a7
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_1bc

    if-ne v1, v10, :cond_1b8

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v0, p1

    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    goto :goto_1d5

    :cond_1b8
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1d9

    :cond_1bc
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lshf;

    iget-object v1, v11, Lshf;->a:Ljava/lang/Object;

    check-cast v1, Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ly3i;

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-interface {v1, p0}, Ly3i;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_1d5

    move-object v12, v0

    goto :goto_1d9

    :cond_1d5
    :goto_1d5
    sget-object v0, Lt0i;->b:Lp0i;

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1d9
    return-object v12

    :pswitch_1da
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_1ea

    if-ne v1, v10, :cond_1e6

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_1fb

    :cond_1e6
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1fd

    :cond_1ea
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lt2i;

    iput-boolean v10, p0, Lagb;->u:Z

    check-cast v11, Lh3i;

    invoke-virtual {v11, p0}, Lh3i;->h(Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_1fb

    move-object v12, v0

    goto :goto_1fd

    :cond_1fb
    :goto_1fb
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1fd
    return-object v12

    :pswitch_1fe
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_210

    if-ne v1, v10, :cond_20b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v0, p1

    goto :goto_228

    :cond_20b
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    move-object v0, v12

    goto :goto_228

    :cond_210
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v1, Lyne;->b:Ldeg;

    sget-wide v2, Lx3i;->g:J

    new-instance v4, Lr8h;

    check-cast v11, Ljava/lang/String;

    const/4 v6, 0x7

    invoke-direct {v4, v1, v11, v12, v6}, Lr8h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-static {v2, v3, v4, p0}, Luyg;->x(JLkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_228

    move-object v0, v1

    :cond_228
    :goto_228
    return-object v0

    :pswitch_229
    check-cast v11, Ls2i;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_23b

    if-ne v1, v10, :cond_237

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_24a

    :cond_237
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_255

    :cond_23b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-wide v1, v11, Ls2i;->d:J

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-static {v1, v2, p0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_24a

    move-object v12, v0

    goto :goto_255

    :cond_24a
    :goto_24a
    iget-object v0, v11, Ls2i;->a:Ly3i;

    sget-object v1, Lnkh;->a:Lnkh;

    invoke-interface {v0, v1}, Ly3i;->n(Lz1e;)V

    iput-object v12, v11, Ls2i;->c:Ld3k;

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_255
    return-object v12

    :pswitch_256
    check-cast v11, Lr2i;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_268

    if-ne v1, v10, :cond_264

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_280

    :cond_264
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_282

    :cond_268
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v1, v11, Lr2i;->a:Ly3i;

    invoke-interface {v1}, Ly3i;->g()Lf99;

    move-result-object v1

    new-instance v2, Lo71;

    invoke-direct {v2, v11, v8}, Lo71;-><init>(Ljava/lang/Object;B)V

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-interface {v1, v2, p0}, Lf99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_280

    move-object v12, v0

    goto :goto_282

    :cond_280
    :goto_280
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_282
    return-object v12

    :pswitch_283
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_293

    if-ne v1, v10, :cond_28f

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2a2

    :cond_28f
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_2a4

    :cond_293
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lkt5;

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-virtual {v11, p0}, Lkt5;->a(Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_2a2

    move-object v12, v0

    goto :goto_2a4

    :cond_2a2
    :goto_2a2
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_2a4
    return-object v12

    :pswitch_2a5
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_2b5

    if-ne v1, v10, :cond_2b1

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2cb

    :cond_2b1
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_2cd

    :cond_2b5
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lx79;

    iput-boolean v10, p0, Lagb;->u:Z

    new-instance v1, Lmz9;

    const/16 v2, 0x10

    invoke-direct {v1, v2, v12, v11}, Lmz9;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, p0}, Lzch;->z(Lkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_2cb

    move-object v12, v0

    goto :goto_2cd

    :cond_2cb
    :goto_2cb
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_2cd
    return-object v12

    :pswitch_2ce
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_2e0

    if-ne v1, v10, :cond_2dc

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_2eb

    :cond_2dc
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_2eb

    :cond_2e0
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lx79;

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-virtual {v11, p0}, Lx79;->Q(Lnt5;)V

    move-object v12, v0

    :goto_2eb
    return-object v12

    :pswitch_2ec
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v2, p0, Lagb;->u:Z

    if-eqz v2, :cond_2fe

    if-ne v2, v10, :cond_2f9

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v0, p1

    goto :goto_319

    :cond_2f9
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    move-object v0, v12

    goto :goto_319

    :cond_2fe
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lcom/opera/android/OperaApplication;

    invoke-virtual {v11}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v2

    iget-object v2, v2, Lslk;->c:Lpy9;

    iget-object v2, v2, Lpy9;->g:Lkze;

    new-instance v3, Lxf;

    invoke-direct {v3, v7, v12, v1}, Lxf;-><init>(ILmt5;B)V

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-static {v2, v3, p0}, Lxf8;->w(Lekc;Lkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_319

    move-object v0, v1

    :cond_319
    :goto_319
    return-object v0

    :pswitch_31a
    check-cast v11, Lz9f;

    iget-object v1, v11, Lz9f;->i:Ljava/util/Map;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v2, p0, Lagb;->u:Z

    if-eqz v2, :cond_32e

    if-ne v2, v10, :cond_32a

    :try_start_326
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_329
    .catchall {:try_start_326 .. :try_end_329} :catchall_36f

    goto :goto_341

    :cond_32a
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_36e

    :cond_32e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_331
    iget-object v2, v11, Lz9f;->g:Lkotlin/coroutines/CoroutineContext;

    invoke-static {v2}, Lo0g;->U(Lkotlin/coroutines/CoroutineContext;)Lunb;

    move-result-object v2

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-interface {v2, p0}, Lunb;->Z(Lmt5;)Ljava/lang/Object;

    move-result-object v2
    :try_end_33d
    .catchall {:try_start_331 .. :try_end_33d} :catchall_36f

    if-ne v2, v0, :cond_341

    move-object v12, v0

    goto :goto_36e

    :cond_341
    :goto_341
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_349
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_36c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt9f;

    iget-object v2, v1, Lt9f;->E:Lfm5;

    iget-object v2, v2, Lfm5;->a:Lokhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v2}, Lokhttp3/internal/connection/RealConnectionPool;->evictAll()V

    iget-object v1, v1, Lt9f;->a:Lsa7;

    invoke-virtual {v1}, Lsa7;->a()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    goto :goto_349

    :cond_36c
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_36e
    return-object v12

    :catchall_36f
    move-exception v0

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_378
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_39b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt9f;

    iget-object v3, v2, Lt9f;->E:Lfm5;

    iget-object v3, v3, Lfm5;->a:Lokhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v3}, Lokhttp3/internal/connection/RealConnectionPool;->evictAll()V

    iget-object v2, v2, Lt9f;->a:Lsa7;

    invoke-virtual {v2}, Lsa7;->a()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    goto :goto_378

    :cond_39b
    throw v0

    :pswitch_39c
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lcom/opera/api/Callback;

    iget-boolean v0, p0, Lagb;->u:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v11, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3af
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Ly0a;

    iget-boolean v0, p0, Lagb;->u:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v11, v0}, Ly0a;->run(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3c2
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_3d4

    if-ne v1, v10, :cond_3cf

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v0, p1

    goto :goto_3e6

    :cond_3cf
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    move-object v0, v12

    goto :goto_3e6

    :cond_3d4
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lcq5;

    iget-object v1, v11, Lcq5;->d:Ljava/lang/Object;

    check-cast v1, Ljdj;

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-static {v1, p0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_3e6

    move-object v0, v1

    :cond_3e6
    :goto_3e6
    return-object v0

    :pswitch_3e7
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_3f9

    if-ne v1, v10, :cond_3f4

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v0, p1

    goto :goto_40e

    :cond_3f4
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    move-object v0, v12

    goto :goto_40e

    :cond_3f9
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lsae;

    iget-object v1, v11, Lsae;->g:Lp04;

    iput-boolean v10, p0, Lagb;->u:Z

    new-instance v2, Lqmb;

    invoke-direct {v2, v8, v12, v1}, Lqmb;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v2, p0}, Lsgb;->q(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_40e

    move-object v0, v1

    :cond_40e
    :goto_40e
    return-object v0

    :pswitch_40f
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_41f

    if-ne v1, v10, :cond_41b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_433

    :cond_41b
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_435

    :cond_41f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lcd1;

    new-instance v1, Ljava/lang/Float;

    invoke-direct {v1, v6}, Ljava/lang/Float;-><init>(F)V

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-static {v11, v1, v12, p0, v8}, Lcd1;->a(Lcd1;Ljava/lang/Object;Lwe1;Lmt5;I)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_433

    move-object v12, v0

    goto :goto_435

    :cond_433
    :goto_433
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_435
    return-object v12

    :pswitch_436
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_446

    if-ne v1, v10, :cond_442

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_45c

    :cond_442
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_45e

    :cond_446
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lv6e;

    iget-object v1, v11, Lv6e;->Z:Lcd1;

    new-instance v2, Ljava/lang/Float;

    invoke-direct {v2, v6}, Ljava/lang/Float;-><init>(F)V

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-static {v1, v2, v12, p0, v8}, Lcd1;->a(Lcd1;Ljava/lang/Object;Lwe1;Lmt5;I)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_45c

    move-object v12, v0

    goto :goto_45e

    :cond_45c
    :goto_45c
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_45e
    return-object v12

    :pswitch_45f
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_471

    if-ne v1, v10, :cond_46c

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v0, p1

    goto :goto_495

    :cond_46c
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    move-object v0, v12

    goto :goto_495

    :cond_471
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lb6e;

    iput-boolean v10, p0, Lagb;->u:Z

    new-instance v1, Lnh4;

    invoke-static {p0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object v2

    invoke-direct {v1, v10, v2}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {v1}, Lnh4;->s()V

    iget-object v2, v11, Lb6e;->a:Lv1a;

    new-instance v3, Lbha;

    invoke-direct {v3, v1, v7}, Lbha;-><init>(Lnh4;B)V

    invoke-virtual {v2, v3}, Lv1a;->a(Lcom/opera/api/Callback;)V

    invoke-virtual {v1}, Lnh4;->q()Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_495

    move-object v0, v1

    :cond_495
    :goto_495
    return-object v0

    :pswitch_496
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_4a7

    if-ne v1, v10, :cond_4a3

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v1, p1

    goto :goto_4b6

    :cond_4a3
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_4ba

    :cond_4a7
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Llrh;

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-interface {v11, p0}, Llrh;->a(Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_4b6

    move-object v12, v0

    goto :goto_4ba

    :cond_4b6
    :goto_4b6
    check-cast v1, Lkrh;

    iget-object v12, v1, Lkrh;->b:Ljava/lang/String;

    :goto_4ba
    return-object v12

    :pswitch_4bb
    check-cast v11, Lacd;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v2, p0, Lagb;->u:Z

    if-eqz v2, :cond_4cd

    if-ne v2, v10, :cond_4c9

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4e8

    :cond_4c9
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_4ea

    :cond_4cd
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v2, Lq4b;

    invoke-direct {v2, v11, v3}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2}, Ldyg;->o(Lkotlin/jvm/functions/Function0;)Lxd6;

    move-result-object v2

    new-instance v3, Lhz1;

    invoke-direct {v3, v1, v12, v11}, Lhz1;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-static {v2, v3, p0}, Lj14;->v(Lf99;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_4e8

    move-object v12, v0

    goto :goto_4ea

    :cond_4e8
    :goto_4e8
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_4ea
    return-object v12

    :pswitch_4eb
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_4fb

    if-ne v1, v10, :cond_4f7

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_511

    :cond_4f7
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_513

    :cond_4fb
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lgmc;

    new-instance v1, Lpv;

    const/16 v2, 0x11

    invoke-direct {v1, v2, v12, v11}, Lpv;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-virtual {v11, v1, p0}, Lgmc;->a(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_511

    move-object v12, v0

    goto :goto_513

    :cond_511
    :goto_511
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_513
    return-object v12

    :pswitch_514
    sget-object v7, Lpx5;->a:Lpx5;

    iget-boolean v0, p0, Lagb;->u:Z

    if-eqz v0, :cond_524

    if-ne v0, v10, :cond_520

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_54e

    :cond_520
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_550

    :cond_524
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lc5o;

    iget-object v0, v11, Lc5o;->b:Ljava/lang/Object;

    check-cast v0, Lxe1;

    new-instance v1, Ljava/lang/Float;

    invoke-direct {v1, v6}, Ljava/lang/Float;-><init>(F)V

    new-instance v2, Ljava/lang/Float;

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-direct {v2, v3}, Ljava/lang/Float;-><init>(F)V

    const/high16 v3, 0x43c80000    # 400.0f

    invoke-static {v6, v3, v2, v10}, Lrm5;->R(FFLjava/lang/Object;I)La2k;

    move-result-object v2

    iput-boolean v10, p0, Lagb;->u:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/16 v6, 0x8

    move-object v5, p0

    invoke-static/range {v0 .. v6}, Lmfh;->j(Lxe1;Ljava/lang/Float;Lwe1;ZLkotlin/jvm/functions/Function1;Lnt5;I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v7, :cond_54e

    move-object v12, v7

    goto :goto_550

    :cond_54e
    :goto_54e
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_550
    return-object v12

    :pswitch_551
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_562

    if-ne v1, v10, :cond_55e

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v1, p1

    goto :goto_577

    :cond_55e
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_583

    :cond_562
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Lrmb;

    iget-object v1, v11, Lrmb;->d:Lqd6;

    invoke-interface {v1}, Lqd6;->getData()Lf99;

    move-result-object v1

    iput-boolean v10, p0, Lagb;->u:Z

    invoke-static {v1, p0}, Lcs5;->H(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_577

    move-object v12, v0

    goto :goto_583

    :cond_577
    :goto_577
    check-cast v1, Llee;

    if-eqz v1, :cond_581

    invoke-virtual {v1}, Llee;->a()Ljava/util/Map;

    move-result-object v12

    if-nez v12, :cond_583

    :cond_581
    sget-object v12, Ln08;->a:Ln08;

    :cond_583
    :goto_583
    return-object v12

    :pswitch_584
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lagb;->u:Z

    if-eqz v1, :cond_594

    if-ne v1, v10, :cond_590

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5a7

    :cond_590
    invoke-static {v9}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_5a9

    :cond_594
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v11, Ldgb;

    iget-object v1, v11, Ldgb;->b:Lur1;

    iput-boolean v10, p0, Lagb;->u:Z

    check-cast v1, Les1;

    invoke-virtual {v1, p0}, Les1;->j(Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_5a7

    move-object v12, v0

    goto :goto_5a9

    :cond_5a7
    :goto_5a7
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_5a9
    return-object v12

    :pswitch_data_5aa
    .packed-switch 0x0
        :pswitch_584
        :pswitch_551
        :pswitch_514
        :pswitch_4eb
        :pswitch_4bb
        :pswitch_496
        :pswitch_45f
        :pswitch_436
        :pswitch_40f
        :pswitch_3e7
        :pswitch_3c2
        :pswitch_3af
        :pswitch_39c
        :pswitch_31a
        :pswitch_2ec
        :pswitch_2ce
        :pswitch_2a5
        :pswitch_283
        :pswitch_256
        :pswitch_229
        :pswitch_1fe
        :pswitch_1da
        :pswitch_1a7
        :pswitch_17a
        :pswitch_123
        :pswitch_b6
        :pswitch_94
        :pswitch_72
        :pswitch_44
    .end packed-switch
.end method
