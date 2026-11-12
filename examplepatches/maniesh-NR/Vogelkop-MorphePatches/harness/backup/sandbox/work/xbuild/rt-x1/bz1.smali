.class public final Lbz1;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public final synthetic u:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLmt5;Ljava/lang/Object;)V
    .registers 4

    .line 10
    iput-byte p1, p0, Lbz1;->t:B

    iput-object p3, p0, Lbz1;->u:Ljava/lang/Object;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public constructor <init>(Lmt5;Lu07;)V
    .registers 4

    const/4 v0, 0x6

    iput-byte v0, p0, Lbz1;->t:B

    iput-object p2, p0, Lbz1;->u:Ljava/lang/Object;

    const/4 p2, 0x2

    invoke-direct {p0, p2, p1}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lbz1;->t:B

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_12a

    new-instance p1, Lbz1;

    check-cast p0, Ls6k;

    const/16 v0, 0x1d

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_11
    new-instance p1, Lbz1;

    check-cast p0, Lu3j;

    const/16 v0, 0x1c

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_1b
    new-instance p1, Lbz1;

    check-cast p0, Lcom/opera/android/firebase/OperaFirebaseMessagingService;

    const/16 v0, 0x1b

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_25
    new-instance p1, Lbz1;

    check-cast p0, Lxri;

    const/16 v0, 0x1a

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_2f
    new-instance p1, Lbz1;

    check-cast p0, Ln9h;

    const/16 v0, 0x19

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_39
    new-instance p1, Lbz1;

    check-cast p0, Lpqh;

    const/16 v0, 0x18

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_43
    new-instance p1, Lbz1;

    check-cast p0, Lwgg;

    const/16 v0, 0x17

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_4d
    new-instance p1, Lbz1;

    check-cast p0, Lkg9;

    const/16 v0, 0x16

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_57
    new-instance p1, Lbz1;

    check-cast p0, Lsdf;

    const/16 v0, 0x15

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_61
    new-instance p1, Lbz1;

    check-cast p0, Lcom/opera/android/gcm/NewPushNotificationWorker;

    const/16 v0, 0x14

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_6b
    new-instance p1, Lbz1;

    check-cast p0, La6e;

    const/16 v0, 0x13

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_75
    new-instance p1, Lbz1;

    check-cast p0, Lv5e;

    const/16 v0, 0x12

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_7f
    new-instance p1, Lbz1;

    check-cast p0, Lx3e;

    const/16 v0, 0x11

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_89
    new-instance p1, Lbz1;

    check-cast p0, Lv3e;

    const/16 v0, 0x10

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_93
    new-instance p1, Lbz1;

    check-cast p0, Lpjb;

    const/16 v0, 0xf

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_9d
    new-instance p1, Lbz1;

    check-cast p0, Landroid/graphics/Bitmap;

    const/16 v0, 0xe

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_a7
    new-instance p1, Lbz1;

    check-cast p0, Ln79;

    const/16 v0, 0xd

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_b1
    new-instance p1, Lbz1;

    check-cast p0, Lia8;

    const/16 v0, 0xc

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_bb
    new-instance p1, Lbz1;

    check-cast p0, Lk5o;

    const/16 v0, 0xb

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_c5
    new-instance p1, Lbz1;

    check-cast p0, Lx77;

    const/16 v0, 0xa

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_cf
    new-instance p1, Lbz1;

    check-cast p0, Lk73;

    const/16 v0, 0x9

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_d9
    new-instance p1, Lbz1;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    const/16 v0, 0x8

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_e3
    new-instance p1, Lbz1;

    check-cast p0, Lfa7;

    const/4 v0, 0x7

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_ec
    new-instance p1, Lbz1;

    check-cast p0, Lu07;

    invoke-direct {p1, p2, p0}, Lbz1;-><init>(Lmt5;Lu07;)V

    return-object p1

    :pswitch_f4
    new-instance p1, Lbz1;

    check-cast p0, Lqe6;

    const/4 v0, 0x5

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_fd
    new-instance p1, Lbz1;

    check-cast p0, Lvn5;

    const/4 v0, 0x4

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_106
    new-instance p1, Lbz1;

    check-cast p0, Ldk4;

    const/4 v0, 0x3

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_10f
    new-instance p1, Lbz1;

    check-cast p0, Lrf3;

    const/4 v0, 0x2

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_118
    new-instance p1, Lbz1;

    check-cast p0, Lztl;

    const/4 v0, 0x1

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_121
    new-instance p1, Lbz1;

    check-cast p0, Ldz1;

    const/4 v0, 0x0

    invoke-direct {p1, v0, p2, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p1

    :pswitch_data_12a
    .packed-switch 0x0
        :pswitch_121
        :pswitch_118
        :pswitch_10f
        :pswitch_106
        :pswitch_fd
        :pswitch_f4
        :pswitch_ec
        :pswitch_e3
        :pswitch_d9
        :pswitch_cf
        :pswitch_c5
        :pswitch_bb
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

    iget-byte v0, p0, Lbz1;->t:B

    packed-switch v0, :pswitch_data_204

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_27
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_38
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_49
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_5a
    check-cast p1, Lkotlin/Unit;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_6b
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_7c
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_8d
    check-cast p1, Lbef;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_9e
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_af
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_c0
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_d1
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_e2
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_f3
    check-cast p1, Ll99;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_104
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_115
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_126
    check-cast p1, Lxa7;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_137
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_148
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_159
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16a
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_17b
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_18c
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_19d
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1ae
    check-cast p1, Lxa7;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1bf
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1d0
    check-cast p1, Lxa7;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1e1
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1f2
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbz1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbz1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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
    .registers 13

    iget-byte v0, p0, Lbz1;->t:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_516

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Ls6k;

    iget-object p0, p0, Ls6k;->d:Lne5;

    iget-object p0, p0, Lne5;->e:Ljava/lang/Object;

    check-cast p0, Lpz6;

    iget-object p1, p0, Lpz6;->a:Lddc;

    new-instance v0, Lrf4;

    const/4 v1, 0x3

    invoke-direct {v0, v1, v3, p0}, Lrf4;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p1, v3, v3, v0, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lu3j;

    if-eqz p0, :cond_37

    iget-object p1, p0, Lu3j;->f:Ls3j;

    if-eqz p1, :cond_37

    invoke-interface {p1, p0}, Ls3j;->a(Lu3j;)V

    :cond_37
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3a
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/firebase/OperaFirebaseMessagingService;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->G:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_52
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lych;->i:Li06;

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lxri;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lf8a;->e:Lf8a;

    invoke-interface {p0}, Lrvd;->toByteArray()[B

    move-result-object p0

    invoke-virtual {p1, p0}, Lf8a;->b([B)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_6b
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Ln9h;

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lo9h;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_81
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lpqh;

    iput-object v3, p0, Lpqh;->a:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_8f
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lwgg;

    iget-object p1, p0, Lwgg;->b:Landroid/content/Context;

    iget-object v0, p0, Lwgg;->c:Lmyi;

    const-class v1, Landroid/view/textclassifier/TextClassificationManager;

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/textclassifier/TextClassificationManager;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_b3

    if-ne v0, v2, :cond_af

    const-string v0, "textview"

    goto :goto_b5

    :cond_af
    invoke-static {}, Lh9o;->p()V

    goto :goto_c8

    :cond_b3
    const-string v0, "edittext"

    :goto_b5
    new-instance v2, Landroid/view/textclassifier/TextClassificationContext$Builder;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1, v0}, Landroid/view/textclassifier/TextClassificationContext$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Landroid/view/textclassifier/TextClassificationContext$Builder;->build()Landroid/view/textclassifier/TextClassificationContext;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/view/textclassifier/TextClassificationManager;->createTextClassificationSession(Landroid/view/textclassifier/TextClassificationContext;)Landroid/view/textclassifier/TextClassifier;

    move-result-object v3

    iput-object v3, p0, Lwgg;->f:Landroid/view/textclassifier/TextClassifier;

    :goto_c8
    return-object v3

    :pswitch_c9
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lkg9;

    invoke-static {p0}, Lkg9;->a(Lkg9;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d8
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lsdf;

    iget-object p1, p0, Lsdf;->c:Lvx;

    invoke-virtual {p1}, Lvx;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbef;

    invoke-virtual {p1}, Lbef;->j()Z

    move-result v0

    const/16 v3, 0x9

    if-eqz v0, :cond_190

    iget-object v0, p0, Lsdf;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lsdf;->a()I

    move-result v4

    invoke-static {v4, v2}, Lwyh;->A(II)Z

    move-result v4

    if-nez v4, :cond_112

    invoke-virtual {p0}, Lsdf;->b()I

    move-result v4

    invoke-static {v4, v2}, Lwyh;->A(II)Z

    move-result v4

    if-nez v4, :cond_112

    const-string v4, "collect_website_categories"

    invoke-virtual {v0, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_112

    invoke-virtual {p0, v2}, Lsdf;->c(I)V

    :cond_112
    invoke-virtual {p0}, Lsdf;->a()I

    move-result v2

    const/16 v4, 0x8

    invoke-static {v2, v4}, Lwyh;->A(II)Z

    move-result v2

    if-nez v2, :cond_133

    invoke-virtual {p0}, Lsdf;->b()I

    move-result v2

    invoke-static {v2, v4}, Lwyh;->A(II)Z

    move-result v2

    if-nez v2, :cond_133

    const-string v2, "process_news_topics"

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_133

    invoke-virtual {p0, v4}, Lsdf;->c(I)V

    :cond_133
    invoke-virtual {p1}, Lbef;->c()Z

    move-result v2

    if-eqz v2, :cond_15d

    invoke-virtual {p0}, Lsdf;->a()I

    move-result v2

    const/16 v4, 0x10

    invoke-static {v2, v4}, Lwyh;->A(II)Z

    move-result v2

    if-nez v2, :cond_15a

    invoke-virtual {p0}, Lsdf;->b()I

    move-result v2

    invoke-static {v2, v4}, Lwyh;->A(II)Z

    move-result v2

    if-nez v2, :cond_15a

    const-string v2, "process_location"

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_15a

    invoke-virtual {p0, v4}, Lsdf;->c(I)V

    :cond_15a
    const/16 v2, 0x19

    goto :goto_15e

    :cond_15d
    move v2, v3

    :goto_15e
    invoke-virtual {p1}, Lbef;->i()Z

    move-result p1

    if-eqz p1, :cond_191

    invoke-virtual {p0}, Lsdf;->a()I

    move-result p1

    const/16 v4, 0x60

    invoke-static {p1, v4}, Lwyh;->A(II)Z

    move-result p1

    if-nez p1, :cond_18d

    invoke-virtual {p0}, Lsdf;->b()I

    move-result p1

    invoke-static {p1, v4}, Lwyh;->A(II)Z

    move-result p1

    if-nez p1, :cond_18d

    const-string p1, "personalized_news"

    invoke-virtual {v0, p1}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_18a

    const-string p1, "personalized_ads"

    invoke-virtual {v0, p1}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_18d

    :cond_18a
    invoke-virtual {p0, v4}, Lsdf;->c(I)V

    :cond_18d
    or-int/lit8 v2, v2, 0x60

    goto :goto_191

    :cond_190
    move v2, v1

    :cond_191
    :goto_191
    invoke-virtual {p0}, Lsdf;->b()I

    move-result p1

    not-int p1, p1

    and-int/2addr v2, p1

    invoke-static {v2, v3}, Lwyh;->A(II)Z

    move-result p1

    if-eqz p1, :cond_19e

    move v1, v2

    :cond_19e
    invoke-virtual {p0}, Lsdf;->a()I

    move-result p1

    or-int/2addr v1, p1

    if-eq v1, p1, :cond_1bf

    iget-object p0, p0, Lsdf;->b:Ludf;

    invoke-static {v1}, Lwyh;->K(I)I

    move-result p1

    iget-object p0, p0, Ludf;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "pending.consents"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1bf
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c2
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/gcm/NewPushNotificationWorker;

    iget-object p0, p0, Lajc;->a:Landroid/content/Context;

    invoke-static {p0}, Lhd;->o(Landroid/content/Context;)Lhd;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1d3
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, La6e;

    iget-object p1, p0, La6e;->d:Lzyk;

    iget-object v0, p0, La6e;->c:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1f3

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    goto :goto_214

    :cond_1f3
    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_206

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    goto :goto_214

    :cond_206
    iget-object p0, p0, La6e;->b:Ldj9;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcj9;

    iget-object p0, p0, Lcj9;->a:Ljava/lang/String;

    if-nez p0, :cond_214

    const-string p0, ""

    :cond_214
    :goto_214
    sget-object p1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_21b
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Llzd;

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lv5e;

    iget-object v0, p0, Lv5e;->b:Landroid/content/Context;

    const-string v1, "com.opera.minipay"

    invoke-static {v0, v1}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    iget-object p0, p0, Lv5e;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    invoke-direct {p1, v0, p0}, Llzd;-><init>(ZZ)V

    return-object p1

    :pswitch_23e
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lx3e;

    iget-object p0, p0, Lx3e;->a:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le59;

    sget-object p1, Ld59;->g:Ld59;

    invoke-virtual {p0, p1}, Le59;->b(Ld59;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_256
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lv3e;

    iget-object p1, p0, Lv3e;->c:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lv3e;->b:Lyl6;

    if-eqz p1, :cond_26a

    if-eqz p0, :cond_26a

    invoke-virtual {p0, p1, v3}, Lyl6;->e(Loi;Ljava/lang/Runnable;)V

    :cond_26a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_26d
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lpjb;

    iget-object p0, p0, Lpjb;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27e
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget p1, Lok3;->m:I

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Bitmap;

    const/16 p1, 0x18

    invoke-static {p0, p1}, Lrk3;->a(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    :pswitch_290
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Ln79;

    iget-object p0, p0, Ln79;->h:Lcwa;

    if-eqz p0, :cond_2a0

    invoke-interface {p0}, Lcwa;->clear()V

    :cond_2a0
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2a3
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lia8;

    iget-object p1, p0, Lia8;->a:Lcsa;

    const-string v0, ""

    move-object v2, p1

    check-cast v2, Ld61;

    invoke-virtual {v2, v0}, Ld61;->c(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2f6

    check-cast v0, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2c4
    :goto_2c4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2df

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0}, Lia8;->a()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2c4

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2c4

    :cond_2df
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_2e3
    if-ge v1, p0, :cond_2f4

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    check-cast v0, Ljava/lang/String;

    move-object v3, p1

    check-cast v3, Ld61;

    invoke-virtual {v3, v0}, Ld61;->d(Ljava/lang/String;)V

    goto :goto_2e3

    :cond_2f4
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_2f6
    return-object v3

    :pswitch_2f7
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lk5o;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const-string p1, "com.android.vending"

    invoke-static {p0}, Lr9n;->l(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_313
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lx77;

    iget-object p0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_32f

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    if-eqz p1, :cond_32f

    move-object v3, p0

    :cond_32f
    return-object v3

    :pswitch_330
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lk73;

    :try_start_339
    new-instance p1, Lizd;

    iget-object v0, p0, Lk73;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    sget-object v1, Lpd6;->a:Ljava/util/concurrent/FutureTask;

    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v3, Ljava/io/FileInputStream;

    const/16 v4, 0x11

    invoke-static {v4, v0}, Lpd6;->a(ILjava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p1, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_354
    .catch Ljava/io/FileNotFoundException; {:try_start_339 .. :try_end_354} :catch_391
    .catchall {:try_start_339 .. :try_end_354} :catchall_38b

    :try_start_354
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    if-gtz v0, :cond_37c

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Ljava/io/DataInputStream;->skipBytes(I)I

    move-result v1

    if-ne v1, v0, :cond_374

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    if-gtz v0, :cond_36c

    invoke-virtual {p0}, Lk73;->d()Ljava/lang/Object;

    move-result-object v0

    goto :goto_370

    :cond_36c
    invoke-virtual {p0, p1}, Lk73;->r(Lizd;)Ljava/lang/Object;

    move-result-object v0
    :try_end_370
    .catchall {:try_start_354 .. :try_end_370} :catchall_384

    :goto_370
    :try_start_370
    invoke-virtual {p1}, Ljava/io/FilterInputStream;->close()V
    :try_end_373
    .catch Ljava/io/FileNotFoundException; {:try_start_370 .. :try_end_373} :catch_391
    .catchall {:try_start_370 .. :try_end_373} :catchall_38b

    goto :goto_39d

    :cond_374
    :try_start_374
    new-instance v0, Ljava/io/EOFException;

    const-string v1, "Unexpected end of file while skipping bytes."

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_37c
    new-instance v0, Ljava/io/IOException;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_384
    .catchall {:try_start_374 .. :try_end_384} :catchall_384

    :catchall_384
    move-exception v0

    :try_start_385
    throw v0
    :try_end_386
    .catchall {:try_start_385 .. :try_end_386} :catchall_386

    :catchall_386
    move-exception v1

    :try_start_387
    invoke-static {p1, v0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1
    :try_end_38b
    .catch Ljava/io/FileNotFoundException; {:try_start_387 .. :try_end_38b} :catch_391
    .catchall {:try_start_387 .. :try_end_38b} :catchall_38b

    :catchall_38b
    invoke-virtual {p0}, Lk73;->d()Ljava/lang/Object;

    move-result-object p0

    :goto_38f
    move-object v0, p0

    goto :goto_39d

    :catch_391
    iget-object p1, p0, Lk73;->f:Ljava/lang/Object;

    check-cast p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-virtual {p0}, Lk73;->d()Ljava/lang/Object;

    move-result-object p0

    goto :goto_38f

    :goto_39d
    return-object v0

    :pswitch_39e
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3ad
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lfa7;

    iget-object p1, p0, Lfa7;->h:Ljava/lang/Object;

    monitor-enter p1

    :try_start_3b9
    iget-boolean v0, p0, Lfa7;->m:Z

    if-eqz v0, :cond_3e6

    iget-boolean v0, p0, Lfa7;->n:Z
    :try_end_3bf
    .catchall {:try_start_3b9 .. :try_end_3bf} :catchall_3ea

    if-nez v0, :cond_3e6

    :try_start_3c1
    invoke-virtual {p0}, Lfa7;->s()V
    :try_end_3c4
    .catch Ljava/io/IOException; {:try_start_3c1 .. :try_end_3c4} :catch_3c5
    .catchall {:try_start_3c1 .. :try_end_3c4} :catchall_3ea

    goto :goto_3c7

    :catch_3c5
    :try_start_3c5
    iput-boolean v2, p0, Lfa7;->o:Z
    :try_end_3c7
    .catchall {:try_start_3c5 .. :try_end_3c7} :catchall_3ea

    :goto_3c7
    :try_start_3c7
    iget v0, p0, Lfa7;->j:I

    const/16 v3, 0x7d0

    if-lt v0, v3, :cond_3ce

    move v1, v2

    :cond_3ce
    if-eqz v1, :cond_3e2

    invoke-virtual {p0}, Lfa7;->D()V
    :try_end_3d3
    .catch Ljava/io/IOException; {:try_start_3c7 .. :try_end_3d3} :catch_3d4
    .catchall {:try_start_3c7 .. :try_end_3d3} :catchall_3ea

    goto :goto_3e2

    :catch_3d4
    :try_start_3d4
    iput-boolean v2, p0, Lfa7;->p:Z

    new-instance v0, Lgh3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lslh;

    invoke-direct {v1, v0}, Lslh;-><init>(Lnmj;)V

    iput-object v1, p0, Lfa7;->k:Lslh;
    :try_end_3e2
    .catchall {:try_start_3d4 .. :try_end_3e2} :catchall_3ea

    :cond_3e2
    :goto_3e2
    monitor-exit p1

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_3e9

    :cond_3e6
    :try_start_3e6
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_3e8
    .catchall {:try_start_3e6 .. :try_end_3e8} :catchall_3ea

    monitor-exit p1

    :goto_3e9
    return-object p0

    :catchall_3ea
    move-exception p0

    monitor-exit p1

    throw p0

    :pswitch_3ed
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lu07;

    iget-object p0, p0, Lu07;->c:Lism;

    if-eqz p0, :cond_3fd

    invoke-virtual {p0}, Lism;->close()V

    :cond_3fd
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_400
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lqe6;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Landroid/telephony/euicc/EuiccManager;

    if-eqz p0, :cond_418

    invoke-virtual {p0}, Landroid/telephony/euicc/EuiccManager;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_418

    sget-object p0, Lea8;->b:Lea8;

    goto :goto_41a

    :cond_418
    sget-object p0, Lea8;->c:Lea8;

    :goto_41a
    return-object p0

    :pswitch_41b
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lvn5;

    iget-object p1, p0, Lvn5;->d:Lf77;

    check-cast p1, Lcwm;

    invoke-virtual {p1}, Lcwm;->d()Lcom/usercentrics/sdk/services/deviceStorage/models/ConsentsBuffer;

    move-result-object p1

    iget-object p1, p1, Lcom/usercentrics/sdk/services/deviceStorage/models/ConsentsBuffer;->a:Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Lyg9;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lyg9;-><init>(B)V

    invoke-static {v0, p1}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_441
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_453

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/usercentrics/sdk/services/deviceStorage/models/ConsentsBufferEntry;

    iget-object v0, v0, Lcom/usercentrics/sdk/services/deviceStorage/models/ConsentsBufferEntry;->b:Lcom/usercentrics/sdk/v2/consent/data/SaveConsentsData;

    invoke-virtual {p0, v0}, Lvn5;->a(Lcom/usercentrics/sdk/v2/consent/data/SaveConsentsData;)V

    goto :goto_441

    :cond_453
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_456
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Ldk4;

    invoke-virtual {p0, v2}, Ldk4;->f(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_465
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lch6;

    invoke-direct {p1}, Lch6;-><init>()V

    invoke-virtual {p1}, Lch6;->c()J

    move-result-wide v4

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lrf3;

    iget-object p1, p0, Lrf3;->b:Lf77;

    check-cast p1, Lcwm;

    invoke-virtual {p1}, Lcwm;->h()Ljava/util/List;

    move-result-object v0

    sget-object v2, Lv08;->a:Lv08;

    invoke-virtual {p1, v2}, Lcwm;->m(Ljava/util/Set;)V

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_48a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4f1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/usercentrics/sdk/services/deviceStorage/models/StorageSessionEntry;

    iget-object v2, p0, Lrf3;->d:Lowm;

    iget-wide v6, v0, Lcom/usercentrics/sdk/services/deviceStorage/models/StorageSessionEntry;->c:J

    iget-object v8, v0, Lcom/usercentrics/sdk/services/deviceStorage/models/StorageSessionEntry;->a:Ljava/lang/String;

    const-wide/16 v9, 0x0

    cmp-long v9, v6, v9

    if-eqz v9, :cond_4c2

    sub-long v6, v4, v6

    const-wide/32 v9, 0x240c8400

    cmp-long v6, v6, v9

    if-lez v6, :cond_4c2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v6, "Dropping expired buffered session for settingsId: "

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "."

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0, v3}, Lowm;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_48a

    :cond_4c2
    iget v6, v0, Lcom/usercentrics/sdk/services/deviceStorage/models/StorageSessionEntry;->d:I

    const/4 v7, 0x5

    if-lt v6, v7, :cond_4e6

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v7, "Dropping buffered session for settingsId: "

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " after "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " retries."

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0, v3}, Lowm;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_48a

    :cond_4e6
    iget-object v2, p0, Lrf3;->c:Lze3;

    new-instance v6, Lof3;

    invoke-direct {v6, p0, v0, v1}, Lof3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v8, v6}, Lze3;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    goto :goto_48a

    :cond_4f1
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4f4
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Lztl;

    invoke-virtual {p0}, Lztl;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_503
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbz1;->u:Ljava/lang/Object;

    check-cast p0, Ldz1;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Law3;->a:Law3;

    invoke-virtual {p0}, Law3;->invoke()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_516
    .packed-switch 0x0
        :pswitch_503
        :pswitch_4f4
        :pswitch_465
        :pswitch_456
        :pswitch_41b
        :pswitch_400
        :pswitch_3ed
        :pswitch_3ad
        :pswitch_39e
        :pswitch_330
        :pswitch_313
        :pswitch_2f7
        :pswitch_2a3
        :pswitch_290
        :pswitch_27e
        :pswitch_26d
        :pswitch_256
        :pswitch_23e
        :pswitch_21b
        :pswitch_1d3
        :pswitch_1c2
        :pswitch_d8
        :pswitch_c9
        :pswitch_8f
        :pswitch_81
        :pswitch_6b
        :pswitch_52
        :pswitch_3a
        :pswitch_25
    .end packed-switch
.end method
