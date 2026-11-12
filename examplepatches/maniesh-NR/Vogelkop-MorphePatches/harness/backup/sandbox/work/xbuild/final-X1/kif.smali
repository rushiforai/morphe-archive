.class public final synthetic Lkif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;
.implements Lkr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/OperaApplication;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/OperaApplication;B)V
    .registers 3

    iput-byte p2, p0, Lkif;->a:B

    iput-object p1, p0, Lkif;->b:Lcom/opera/android/OperaApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 13

    iget-byte v0, p0, Lkif;->a:B

    packed-switch v0, :pswitch_data_56

    new-instance v1, Lnr9;

    const-string v6, "onOspPingBack(Lcom/opera/android/osp/Subject;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Lkif;->b:Lcom/opera/android/OperaApplication;

    const-class v4, Lcom/opera/android/OperaApplication;

    const-string v5, "onOspPingBack"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_15
    new-instance v2, Lnr9;

    const-string v7, "onOspPingBack(Lcom/opera/android/osp/Subject;)V"

    const/4 v8, 0x0

    const/4 v3, 0x1

    iget-object v4, p0, Lkif;->b:Lcom/opera/android/OperaApplication;

    const-class v5, Lcom/opera/android/OperaApplication;

    const-string v6, "onOspPingBack"

    invoke-direct/range {v2 .. v8}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2

    :pswitch_25
    new-instance v3, Lnr9;

    const-string v8, "onOspPingBack(Lcom/opera/android/osp/Subject;)V"

    const/4 v9, 0x0

    const/4 v4, 0x1

    iget-object v5, p0, Lkif;->b:Lcom/opera/android/OperaApplication;

    const-class v6, Lcom/opera/android/OperaApplication;

    const-string v7, "onOspPingBack"

    invoke-direct/range {v3 .. v9}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v3

    :pswitch_35
    new-instance v4, Lnr9;

    const-string v9, "onOspPingBack(Lcom/opera/android/osp/Subject;)V"

    const/4 v10, 0x0

    const/4 v5, 0x1

    iget-object v6, p0, Lkif;->b:Lcom/opera/android/OperaApplication;

    const-class v7, Lcom/opera/android/OperaApplication;

    const-string v8, "onOspPingBack"

    invoke-direct/range {v4 .. v10}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v4

    :pswitch_45
    new-instance v5, Lnr9;

    const-string v10, "onOspPingBack(Lcom/opera/android/osp/Subject;)V"

    const/4 v11, 0x0

    const/4 v6, 0x1

    iget-object v7, p0, Lkif;->b:Lcom/opera/android/OperaApplication;

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "onOspPingBack"

    invoke-direct/range {v5 .. v11}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v5

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_45
        :pswitch_35
        :pswitch_25
        :pswitch_15
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Lkif;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_7a

    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_1c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1c
    return v1

    :pswitch_1d
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_33

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_33

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_33
    return v1

    :pswitch_34
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_4a

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_4a

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_4a
    return v1

    :pswitch_4b
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_61

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_61

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_61
    return v1

    :pswitch_62
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_78

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_78

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_78
    return v1

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_62
        :pswitch_4b
        :pswitch_34
        :pswitch_1d
    .end packed-switch
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Lkif;->a:B

    packed-switch v0, :pswitch_data_32

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_17
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_20
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_29
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_29
        :pswitch_20
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method

.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lkif;->a:B

    const/16 v1, 0x1b

    iget-object p0, p0, Lkif;->b:Lcom/opera/android/OperaApplication;

    packed-switch v0, :pswitch_data_4a

    check-cast p1, Llkk;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    new-instance v0, Lhpd;

    invoke-direct {v0, p0, p1, v1}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_16
    check-cast p1, Llkk;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    new-instance v0, Lhpd;

    invoke-direct {v0, p0, p1, v1}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_23
    check-cast p1, Llkk;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    new-instance v0, Lhpd;

    invoke-direct {v0, p0, p1, v1}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_30
    check-cast p1, Llkk;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    new-instance v0, Lhpd;

    invoke-direct {v0, p0, p1, v1}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_3d
    check-cast p1, Llkk;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    new-instance v0, Lhpd;

    invoke-direct {v0, p0, p1, v1}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_3d
        :pswitch_30
        :pswitch_23
        :pswitch_16
    .end packed-switch
.end method
