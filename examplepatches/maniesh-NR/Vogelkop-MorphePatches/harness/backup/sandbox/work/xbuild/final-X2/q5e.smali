.class public final synthetic Lq5e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llld;


# direct methods
.method public synthetic constructor <init>(Llld;B)V
    .registers 3

    iput-byte p2, p0, Lq5e;->a:B

    iput-object p1, p0, Lq5e;->b:Llld;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lq5e;->a:B

    iget-object p0, p0, Lq5e;->b:Llld;

    check-cast p1, Lini;

    check-cast p2, Lf0g;

    packed-switch v0, :pswitch_data_f4

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->getContext()Landroid/content/Context;

    move-result-object p0

    return-object p0

    :pswitch_14
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->N()Lr5e;

    move-result-object p0

    if-nez p0, :cond_26

    sget-object p0, Lu5e;->d:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lr5e;

    :cond_26
    return-object p0

    :pswitch_27
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->R()Ly5e;

    move-result-object p0

    return-object p0

    :pswitch_30
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->H()Lu4i;

    move-result-object p0

    return-object p0

    :pswitch_39
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->y()Lm3i;

    move-result-object p0

    return-object p0

    :pswitch_42
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->G()Li2h;

    move-result-object p0

    return-object p0

    :pswitch_4b
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->x()La2e;

    move-result-object p0

    return-object p0

    :pswitch_54
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->A()Lv3e;

    move-result-object p0

    return-object p0

    :pswitch_5d
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->E()Ls5e;

    move-result-object p0

    if-nez p0, :cond_6f

    sget-object p0, Lu5e;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ls5e;

    :cond_6f
    return-object p0

    :pswitch_70
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->getConfiguration()Lil5;

    move-result-object p0

    return-object p0

    :pswitch_79
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->D()Lmzd;

    move-result-object p0

    if-nez p0, :cond_8b

    sget-object p0, Lu5e;->b:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmzd;

    :cond_8b
    return-object p0

    :pswitch_8c
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->I()Li5e;

    move-result-object p0

    return-object p0

    :pswitch_95
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->o()Lb6e;

    move-result-object p0

    return-object p0

    :pswitch_9e
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->J()Lv3e;

    move-result-object p0

    return-object p0

    :pswitch_a7
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->p()Lx3e;

    move-result-object p0

    return-object p0

    :pswitch_b0
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->s()La4e;

    move-result-object p0

    return-object p0

    :pswitch_b9
    new-instance p2, Ltr1;

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->M()Llrh;

    move-result-object p0

    const-class v0, Lur1;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v1}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lur1;

    invoke-direct {p2, p0, p1}, Ltr1;-><init>(Llrh;Lur1;)V

    return-object p2

    :pswitch_d4
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->h()Lp5e;

    move-result-object p0

    return-object p0

    :pswitch_dd
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->t()Lu3e;

    move-result-object p0

    return-object p0

    :pswitch_e6
    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lr3b;

    invoke-interface {p0}, Lr3b;->L()Lab7;

    move-result-object p0

    if-nez p0, :cond_f2

    sget-object p0, Lza7;->a:Lza7;

    :cond_f2
    return-object p0

    nop

    :pswitch_data_f4
    .packed-switch 0x0
        :pswitch_e6
        :pswitch_dd
        :pswitch_d4
        :pswitch_b9
        :pswitch_b0
        :pswitch_a7
        :pswitch_9e
        :pswitch_95
        :pswitch_8c
        :pswitch_79
        :pswitch_70
        :pswitch_5d
        :pswitch_54
        :pswitch_4b
        :pswitch_42
        :pswitch_39
        :pswitch_30
        :pswitch_27
        :pswitch_14
    .end packed-switch
.end method
