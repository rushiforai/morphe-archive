.class public final synthetic Lfgn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lggn;


# direct methods
.method public synthetic constructor <init>(Lggn;B)V
    .registers 3

    iput-byte p2, p0, Lfgn;->a:B

    iput-object p1, p0, Lfgn;->b:Lggn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lfgn;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lfgn;->b:Lggn;

    packed-switch v0, :pswitch_data_c2

    check-cast p1, Lnfn;

    iput-object p1, p0, Lggn;->r:Lnfn;

    invoke-virtual {p0}, Lggn;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_2b

    iget-object p1, p0, Lggn;->h:Lkw3;

    invoke-virtual {p1}, Lkw3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2b

    move p1, v1

    goto :goto_2c

    :cond_2b
    move p1, v2

    :goto_2c
    iget-object v0, p0, Lggn;->g:Lyen;

    iget-object v0, v0, Lyi2;->d:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz p1, :cond_40

    if-nez v0, :cond_41

    :cond_40
    move v1, v2

    :cond_41
    iput-boolean v1, p0, Lggn;->q:Z

    invoke-virtual {p0}, Lggn;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_49
    check-cast p1, Ljava/lang/Boolean;

    iget-object v0, p0, Lggn;->g:Lyen;

    iget-object v0, v0, Lyen;->j:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_6b

    iget-object v0, p0, Lggn;->h:Lkw3;

    invoke-virtual {v0}, Lkw3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_6b

    move v0, v1

    goto :goto_6c

    :cond_6b
    move v0, v2

    :goto_6c
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz v0, :cond_74

    if-nez p1, :cond_75

    :cond_74
    move v1, v2

    :cond_75
    iput-boolean v1, p0, Lggn;->q:Z

    invoke-virtual {p0}, Lggn;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_7d
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Lggn;->f:Lmw3;

    invoke-virtual {v0}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_93

    if-nez p1, :cond_94

    :cond_93
    move v1, v2

    :cond_94
    iput-boolean v1, p0, Lggn;->p:Z

    invoke-virtual {p0}, Lggn;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_9c
    check-cast p1, Ldpf;

    new-instance v0, Ldcl;

    invoke-direct {v0, p0}, Ldcl;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Ldpf;->a(Lhpf;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a9
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lggn;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b1
    check-cast p1, Lqtg;

    invoke-virtual {p0}, Lggn;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b9
    check-cast p1, Lwvg;

    invoke-virtual {p0}, Lggn;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_c2
    .packed-switch 0x0
        :pswitch_b9
        :pswitch_b1
        :pswitch_a9
        :pswitch_9c
        :pswitch_7d
        :pswitch_49
        :pswitch_13
    .end packed-switch
.end method
