.class public final synthetic Lpw3;
.super Lb6h;
.source "SourceFile"


# instance fields
.field public final synthetic b:B


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 7

    iput-byte p6, p0, Lpw3;->b:B

    invoke-direct/range {p0 .. p5}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lpw3;->b:B

    packed-switch v0, :pswitch_data_ca

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, La5p;

    iget-object p0, p0, La5p;->a:Ljava/lang/String;

    return-object p0

    :pswitch_c
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->x0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpch;

    return-object p0

    :pswitch_1b
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->h()Lr65;

    move-result-object p0

    return-object p0

    :pswitch_24
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->g:Lwsf;

    return-object p0

    :pswitch_2f
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_3a
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Liak;

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_43
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Liak;

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_4c
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Liak;

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_55
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Liak;

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_5e
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_69
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Liak;

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_72
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Liak;

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_7b
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    return-object p0

    :pswitch_84
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    return-object p0

    :pswitch_8d
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    return-object p0

    :pswitch_96
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    return-object p0

    :pswitch_9f
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->I0()Lnej;

    move-result-object p0

    return-object p0

    :pswitch_a8
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    return-object p0

    :pswitch_b1
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_be
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->a()Lxb;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_ca
    .packed-switch 0x0
        :pswitch_be
        :pswitch_b1
        :pswitch_a8
        :pswitch_9f
        :pswitch_96
        :pswitch_8d
        :pswitch_84
        :pswitch_7b
        :pswitch_72
        :pswitch_69
        :pswitch_5e
        :pswitch_55
        :pswitch_4c
        :pswitch_43
        :pswitch_3a
        :pswitch_2f
        :pswitch_24
        :pswitch_1b
        :pswitch_c
    .end packed-switch
.end method
