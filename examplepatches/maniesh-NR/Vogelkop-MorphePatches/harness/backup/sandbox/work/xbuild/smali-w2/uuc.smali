.class public final synthetic Luuc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Luuc;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 9

    iget-byte p0, p0, Luuc;->a:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch p0, :pswitch_data_13c

    new-instance p0, Lm58;

    invoke-direct {p0}, Lm58;-><init>()V

    return-object p0

    :pswitch_e
    new-instance p0, Lm58;

    invoke-direct {p0}, Lm58;-><init>()V

    return-object p0

    :pswitch_14
    new-instance p0, Lm58;

    invoke-direct {p0}, Lm58;-><init>()V

    return-object p0

    :pswitch_1a
    new-instance p0, Lm58;

    invoke-direct {p0}, Lm58;-><init>()V

    return-object p0

    :pswitch_20
    new-instance p0, Lm58;

    invoke-direct {p0}, Lm58;-><init>()V

    return-object p0

    :pswitch_26
    new-instance p0, Lm58;

    invoke-direct {p0}, Lm58;-><init>()V

    return-object p0

    :pswitch_2c
    sget-object p0, Lene;->Companion:Ldne;

    invoke-virtual {p0}, Ldne;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object p0

    return-object p0

    :pswitch_33
    sget-object p0, Ljnc;->Companion:Linc;

    invoke-virtual {p0}, Linc;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object p0

    return-object p0

    :pswitch_3a
    sget-object p0, Lcpc;->Companion:Lbpc;

    invoke-virtual {p0}, Lbpc;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object p0

    return-object p0

    :pswitch_41
    sget-object p0, Lgkm;->a:Lgkm;

    return-object p0

    :pswitch_44
    sget-object p0, Lm74;->a:Lqm6;

    return-object p0

    :pswitch_47
    sget-object p0, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    invoke-static {p0}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object p0

    invoke-static {p0, v1}, Lsgb;->k(Lnx5;Ljava/util/concurrent/CancellationException;)V

    return-object p0

    :pswitch_51
    new-array p0, v2, [Lkotlinx/serialization/descriptors/SerialDescriptor;

    const-string v3, "kotlinx.datetime.MonthBased"

    invoke-static {v3}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7c

    new-instance v7, Lt15;

    invoke-direct {v7, v3}, Lt15;-><init>(Ljava/lang/String;)V

    sget-object v0, Ll08;->a:Ll08;

    sget-object v1, Lecb;->b:Lcyg;

    const-string v2, "months"

    invoke-virtual {v7, v2, v1, v0}, Lt15;->a(Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;Ljava/util/List;)V

    new-instance v2, Ld2j;

    sget-object v4, Lxik;->b:Lxik;

    iget-object v0, v7, Lt15;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-static {p0}, Le82;->B([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-direct/range {v2 .. v7}, Ld2j;-><init>(Ljava/lang/String;Lxvg;ILjava/util/List;Lt15;)V

    move-object v1, v2

    goto :goto_81

    :cond_7c
    const-string p0, "Blank serial names are prohibited"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_81
    return-object v1

    :pswitch_82
    invoke-static {}, Lh46;->values()[Lh46;

    move-result-object p0

    new-instance v0, Li58;

    const-string v1, "com.opera.celopay.model.money.Currency.Token"

    invoke-direct {v0, v1, p0}, Li58;-><init>(Ljava/lang/String;[Ljava/lang/Enum;)V

    return-object v0

    :pswitch_8e
    invoke-static {}, Lg46;->values()[Lg46;

    move-result-object p0

    new-instance v0, Li58;

    const-string v1, "com.opera.celopay.model.money.Currency.Fiat"

    invoke-direct {v0, v1, p0}, Li58;-><init>(Ljava/lang/String;[Ljava/lang/Enum;)V

    return-object v0

    :pswitch_9a
    move p0, v2

    new-instance v2, Lyqi;

    const-class v1, Lx8e;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v4

    const-class v1, Lq8e;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    const-class v3, Lt8e;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    const-class v5, Lw8e;

    invoke-static {v5}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v5

    const/4 v6, 0x3

    move-object v7, v5

    new-array v5, v6, [Litb;

    aput-object v1, v5, p0

    aput-object v3, v5, v0

    const/4 v1, 0x2

    aput-object v7, v5, v1

    new-array v6, v6, [Lkotlinx/serialization/KSerializer;

    sget-object v3, Lo8e;->a:Lo8e;

    aput-object v3, v6, p0

    sget-object v3, Lr8e;->a:Lr8e;

    aput-object v3, v6, v0

    sget-object v0, Lu8e;->a:Lu8e;

    aput-object v0, v6, v1

    new-array v7, p0, [Ljava/lang/annotation/Annotation;

    const-string v3, "com.opera.celopay.model.money.Money"

    invoke-direct/range {v2 .. v7}, Lyqi;-><init>(Ljava/lang/String;Ls15;[Litb;[Lkotlinx/serialization/KSerializer;[Ljava/lang/annotation/Annotation;)V

    return-object v2

    :pswitch_d6
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p0

    return-object p0

    :pswitch_db
    new-instance p0, Lr5e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_e1
    sget-object p0, Lu5e;->a:Lqfb;

    sget-object p0, Ls5e;->a:Ls5e;

    return-object p0

    :pswitch_e6
    sget-object p0, Lu5e;->a:Lqfb;

    sget-object p0, Lt5e;->a:Lt5e;

    return-object p0

    :pswitch_eb
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ee
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f1
    sget-object p0, Liae;->a:Liae;

    return-object p0

    :pswitch_f4
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_f7
    move p0, v2

    new-instance v1, Lsvc;

    new-instance v2, Lfv1;

    invoke-direct {v2, p0}, Lfv1;-><init>(B)V

    invoke-direct {v1, v2}, Lsvc;-><init>(Lfv1;)V

    invoke-static {v1}, Lnh6;->o(Lnh6;)V

    const/16 v2, 0x3a

    invoke-static {v1, v2}, Lf03;->i(Lqh6;C)V

    invoke-static {v1}, Lnh6;->n(Lnh6;)V

    new-instance v2, Lg8c;

    const/16 v3, 0x1c

    invoke-direct {v2, v3}, Lg8c;-><init>(B)V

    new-array v0, v0, [Lkotlin/jvm/functions/Function1;

    aput-object v2, v0, p0

    new-instance p0, Lg8c;

    const/16 v2, 0x1d

    invoke-direct {p0, v2}, Lg8c;-><init>(B)V

    invoke-static {v1, v0, p0}, Lf03;->e(Lqh6;[Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    new-instance p0, Ltvc;

    invoke-interface {v1}, Li4;->build()Ls74;

    move-result-object v0

    invoke-direct {p0, v0}, Ltvc;-><init>(Ls74;)V

    return-object p0

    :pswitch_12c
    return-object v1

    :pswitch_12d
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "CompositionLocal LocalSavedStateRegistryOwner not present"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_135
    sget-object p0, Lnvc;->a:Lhp7;

    sget-object p0, Lulp;->g:Lulp;

    return-object p0

    :pswitch_13a
    return-object v1

    nop

    :pswitch_data_13c
    .packed-switch 0x0
        :pswitch_13a
        :pswitch_13a
        :pswitch_135
        :pswitch_12d
        :pswitch_12c
        :pswitch_f7
        :pswitch_f4
        :pswitch_f1
        :pswitch_ee
        :pswitch_eb
        :pswitch_e6
        :pswitch_e1
        :pswitch_db
        :pswitch_d6
        :pswitch_9a
        :pswitch_8e
        :pswitch_82
        :pswitch_51
        :pswitch_47
        :pswitch_44
        :pswitch_41
        :pswitch_3a
        :pswitch_33
        :pswitch_2c
        :pswitch_26
        :pswitch_20
        :pswitch_1a
        :pswitch_14
        :pswitch_e
    .end packed-switch
.end method
