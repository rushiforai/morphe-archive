.class public final synthetic Lgv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lgv8;->a:B

    iput-object p1, p0, Lgv8;->b:Ljava/lang/Object;

    iput-object p2, p0, Lgv8;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Lgv8;->a:B

    const/16 v1, 0xf

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v5, p0, Lgv8;->c:Ljava/lang/Object;

    iget-object p0, p0, Lgv8;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3c2

    check-cast p0, Lg77;

    check-cast v5, Lboh;

    iget-object p0, p0, Lg77;->a:Ljava/lang/Object;

    check-cast p0, Lcf2;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p0

    if-nez p0, :cond_1f

    invoke-virtual {v5}, Lboh;->invoke()Ljava/lang/Object;

    :cond_1f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_22
    check-cast p0, Lpej;

    check-cast v5, Lnx5;

    iget-object v0, p0, Lpej;->d:La21;

    iget-object v0, v0, La21;->d:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    sget-object v1, Lqej;->c:Lqej;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_44

    new-instance v0, Lc7e;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v4, v1}, Lc7e;-><init>(Lpej;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v5, v4, v4, v0, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_44
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_47
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast v5, Lf2e;

    invoke-interface {p0, v5}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_51
    check-cast p0, Lncd;

    check-cast v5, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lncd;->e:Lhx;

    iget p0, p0, Lncd;->g:I

    invoke-virtual {v0, v5, p0}, Lhx;->k(Landroid/view/ViewGroup;I)Lab2;

    move-result-object p0

    if-nez p0, :cond_6e

    new-instance p0, Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v0, Lmcd;

    invoke-direct {v0, p0}, Lab2;-><init>(Landroid/view/View;)V

    move-object p0, v0

    :cond_6e
    return-object p0

    :pswitch_6f
    check-cast p0, Luac;

    check-cast v5, Lacd;

    invoke-static {v5}, Lui6;->e0(Lf17;)Lm3c;

    move-result-object v0

    iget-object v0, v0, Lm3c;->y:Ln27;

    iget-object v0, v5, Lacd;->s:Lq0g;

    invoke-virtual {v0}, Lq0g;->h()I

    iget-object v0, v5, Lacd;->t:Lq0g;

    invoke-virtual {v0}, Lq0g;->h()I

    move-result v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const p0, 0x3eaaaaab

    int-to-float v0, v0

    mul-float/2addr p0, v0

    invoke-static {p0}, Lzed;->b(F)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_95
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast v5, Ljava/lang/String;

    invoke-interface {p0, v5}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_9f
    check-cast p0, Ljmc;

    check-cast v5, Ligi;

    iget-object v0, v5, Ligi;->g:Ljava/lang/Object;

    check-cast v0, Ljmc;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_b0
    check-cast p0, Lj4c;

    check-cast v5, Lsnc;

    new-instance v6, Lfs6;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v7, p0

    check-cast v7, Lcom/opera/android/settings/SettingsManager;

    iget-object p0, v5, Lsnc;->g:Lxnc;

    iget-object v8, p0, Lxnc;->a:Lkze;

    iget-object v9, p0, Lxnc;->c:Lkze;

    iget-object v10, p0, Lxnc;->e:Lode;

    iget-object p0, p0, Lxnc;->f:Lz78;

    invoke-static {p0}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v11

    invoke-direct/range {v6 .. v11}, Lfs6;-><init>(Lcom/opera/android/settings/SettingsManager;Lkze;Lkze;Lode;Lhx5;)V

    return-object v6

    :pswitch_cf
    check-cast p0, Ltkc;

    move-object v10, v5

    check-cast v10, Ltsd;

    new-instance v6, Lcu5;

    iget-object v7, p0, Ltkc;->h:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v8, p0, Ltkc;->j:Ltsd;

    iget-object v9, p0, Ltkc;->k:Lkze;

    iget-object v11, p0, Ltkc;->p:Lqkc;

    iget-object v12, p0, Ltkc;->o:Lnoc;

    new-instance v13, Lq4b;

    invoke-direct {v13, p0, v1}, Lq4b;-><init>(Ljava/lang/Object;B)V

    new-instance v14, Lqe6;

    const/16 v0, 0x19

    invoke-direct {v14, p0, v0}, Lqe6;-><init>(Ljava/lang/Object;B)V

    invoke-direct/range {v6 .. v14}, Lcu5;-><init>(Landroidx/recyclerview/widget/RecyclerView;Ltsd;Lkze;Ltsd;Lqkc;Lnoc;Lq4b;Lqe6;)V

    return-object v6

    :pswitch_f0
    check-cast p0, Lqkc;

    check-cast v5, Lzmc;

    iget-object v0, p0, Lqkc;->f:Lwub;

    iget-object v0, v0, Lwub;->a:Ljava/lang/Object;

    check-cast v0, Ltkc;

    iget-object v0, v0, Ltkc;->i:Ldqc;

    iget-object v0, v0, Ldqc;->a:Lfs6;

    iget-object v0, v0, Lfs6;->e:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v2

    new-instance v6, Lgtd;

    new-instance v7, Lrxh;

    const v8, 0x7f14072d

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    new-instance v8, Ljf7;

    invoke-direct {v8, p0, v5, v1}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v6, v7, v4, v8}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, v6}, Lehc;->add(Ljava/lang/Object;)Z

    if-eqz v0, :cond_144

    iget-boolean v0, p0, Lqkc;->m:Z

    xor-int/lit8 v1, v0, 0x1

    new-instance v5, Lgtd;

    if-nez v0, :cond_131

    const v0, 0x7f140941

    goto :goto_134

    :cond_131
    const v0, 0x7f14093c

    :goto_134
    new-instance v6, Lrxh;

    invoke-direct {v6, v0}, Lrxh;-><init>(I)V

    new-instance v0, Lhz3;

    invoke-direct {v0, v3, p0, v1}, Lhz3;-><init>(BLjava/lang/Object;Z)V

    invoke-direct {v5, v6, v4, v0}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, v5}, Lehc;->add(Ljava/lang/Object;)Z

    :cond_144
    new-instance v0, Lgtd;

    new-instance v1, Lrxh;

    const v3, 0x7f140822

    invoke-direct {v1, v3}, Lrxh;-><init>(I)V

    new-instance v3, Lsma;

    const/16 v5, 0xa

    invoke-direct {v3, p0, v5}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v4, v3}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, v0}, Lehc;->add(Ljava/lang/Object;)Z

    invoke-static {v2}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    return-object p0

    :pswitch_160
    check-cast p0, Lekc;

    check-cast v5, Lekc;

    invoke-virtual {p0}, Lekc;->i()Z

    move-result p0

    if-eqz p0, :cond_171

    invoke-virtual {v5}, Lekc;->i()Z

    move-result p0

    if-eqz p0, :cond_171

    move v2, v3

    :cond_171
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_176
    check-cast p0, Ltjc;

    check-cast v5, Ls3g;

    invoke-virtual {p0, v5}, Ltjc;->g(Ls3g;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_180
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast v5, Ll7c;

    invoke-interface {p0, v5}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18a
    check-cast p0, Lvji;

    check-cast v5, Luji;

    new-instance v0, Lz6c;

    sget-object v1, Ln08;->a:Ln08;

    invoke-direct {v0, p0, v1, v5}, Lz6c;-><init>(Lvji;Ljava/util/Map;Luji;)V

    return-object v0

    :pswitch_196
    check-cast p0, Li37;

    check-cast v5, Lgu6;

    invoke-virtual {p0}, Li37;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgxf;

    new-instance v0, Lro9;

    iget-object v1, v5, Lsxf;->d:Lhd;

    iget-object v1, v1, Lhd;->g:Ljava/lang/Object;

    check-cast v1, Lo5c;

    invoke-virtual {v1}, Lo5c;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/ranges/IntRange;

    invoke-direct {v0, v1, p0}, Lro9;-><init>(Lkotlin/ranges/IntRange;Lw7d;)V

    new-instance v1, Lhxf;

    invoke-direct {v1, v5, p0, v0}, Lhxf;-><init>(Lgu6;Lgxf;Lro9;)V

    return-object v1

    :pswitch_1b7
    check-cast p0, Lm3c;

    check-cast v5, Lpqh;

    iget-object p0, p0, Lm3c;->F:Ltah;

    iget-object v0, p0, Ltah;->g:Ljava/lang/Object;

    check-cast v0, Lb8e;

    iget v0, v0, Lb8e;->d:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_23f

    iget-object p0, p0, Ltah;->f:Ljava/lang/Object;

    check-cast p0, Llbl;

    :goto_1cb
    if-eqz p0, :cond_23f

    iget v0, p0, Lb8e;->c:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_23c

    move-object v0, p0

    move-object v1, v4

    :cond_1d5
    :goto_1d5
    if-eqz v0, :cond_23c

    instance-of v6, v0, Li0j;

    if-eqz v6, :cond_200

    check-cast v0, Li0j;

    invoke-interface {v0}, Li0j;->t()Z

    move-result v6

    if-eqz v6, :cond_1ec

    new-instance v6, Lf0j;

    invoke-direct {v6}, Lf0j;-><init>()V

    iput-object v6, v5, Lpqh;->a:Ljava/lang/Object;

    iput-boolean v3, v6, Lf0j;->d:Z

    :cond_1ec
    invoke-interface {v0}, Li0j;->D0()Z

    move-result v6

    if-eqz v6, :cond_1f8

    iget-object v6, v5, Lpqh;->a:Ljava/lang/Object;

    check-cast v6, Lf0j;

    iput-boolean v3, v6, Lf0j;->c:Z

    :cond_1f8
    iget-object v6, v5, Lpqh;->a:Ljava/lang/Object;

    check-cast v6, Lq0j;

    invoke-interface {v0, v6}, Li0j;->R(Lq0j;)V

    goto :goto_237

    :cond_200
    iget v6, v0, Lb8e;->c:I

    and-int/lit8 v6, v6, 0x8

    if-eqz v6, :cond_237

    instance-of v6, v0, Li17;

    if-eqz v6, :cond_237

    move-object v6, v0

    check-cast v6, Li17;

    iget-object v6, v6, Li17;->p:Lb8e;

    move v7, v2

    :goto_210
    if-eqz v6, :cond_235

    iget v8, v6, Lb8e;->c:I

    and-int/lit8 v8, v8, 0x8

    if-eqz v8, :cond_232

    add-int/lit8 v7, v7, 0x1

    if-ne v7, v3, :cond_21e

    move-object v0, v6

    goto :goto_232

    :cond_21e
    if-nez v1, :cond_229

    new-instance v1, Ldfe;

    const/16 v8, 0x10

    new-array v8, v8, [Lb8e;

    invoke-direct {v1, v8}, Ldfe;-><init>([Ljava/lang/Object;)V

    :cond_229
    if-eqz v0, :cond_22f

    invoke-virtual {v1, v0}, Ldfe;->c(Ljava/lang/Object;)V

    move-object v0, v4

    :cond_22f
    invoke-virtual {v1, v6}, Ldfe;->c(Ljava/lang/Object;)V

    :cond_232
    :goto_232
    iget-object v6, v6, Lb8e;->f:Lb8e;

    goto :goto_210

    :cond_235
    if-eq v7, v3, :cond_1d5

    :cond_237
    :goto_237
    invoke-static {v1}, Lui6;->U(Ldfe;)Lb8e;

    move-result-object v0

    goto :goto_1d5

    :cond_23c
    iget-object p0, p0, Lb8e;->e:Lb8e;

    goto :goto_1cb

    :cond_23f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_242
    check-cast p0, Ljvj;

    check-cast v5, Ltv3;

    iget-object p0, p0, Ljvj;->a:Lh7f;

    invoke-virtual {p0, v5}, Lh7f;->c(Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_24e
    check-cast p0, Lkotlinx/serialization/descriptors/SerialDescriptor;

    check-cast v5, Lrpb;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v1, v5, Lrpb;->a:Lgqb;

    invoke-static {v5, p0}, Llrb;->d(Lrpb;Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {p0}, Lkotlinx/serialization/descriptors/SerialDescriptor;->e()I

    move-result v1

    move v5, v2

    :goto_261
    if-ge v5, v1, :cond_316

    invoke-interface {p0, v5}, Lkotlinx/serialization/descriptors/SerialDescriptor;->g(I)Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_272
    :goto_272
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_284

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    instance-of v9, v8, Lkrb;

    if-eqz v9, :cond_272

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_272

    :cond_284
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v6

    if-ne v6, v3, :cond_28f

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    goto :goto_290

    :cond_28f
    move-object v6, v4

    :goto_290
    check-cast v6, Lkrb;

    if-eqz v6, :cond_312

    invoke-interface {v6}, Lkrb;->names()[Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_312

    array-length v7, v6

    move v8, v2

    :goto_29c
    if-ge v8, v7, :cond_312

    aget-object v9, v6, v8

    invoke-interface {p0}, Lkotlinx/serialization/descriptors/SerialDescriptor;->d()Lxvg;

    move-result-object v10

    sget-object v11, Lg2j;->b:Lg2j;

    invoke-static {v10, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2af

    const-string v10, "enum value"

    goto :goto_2b1

    :cond_2af
    const-string v10, "property"

    :goto_2b1
    invoke-interface {v0, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_2c1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v0, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v8, v8, 0x1

    goto :goto_29c

    :cond_2c1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "The suggested name \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\' for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-interface {p0, v5}, Lkotlinx/serialization/descriptors/SerialDescriptor;->f(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " is already one of the names for "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {v0, v9}, Lrbd;->b(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-interface {p0, v0}, Lkotlinx/serialization/descriptors/SerialDescriptor;->f(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " in "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Loqb;

    const/4 v1, -0x1

    invoke-static {v1, p0, v4, v4, v4}, Lwyh;->v(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, v4}, Lyqb;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :cond_312
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_261

    :cond_316
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_31e

    sget-object v0, Ln08;->a:Ln08;

    :cond_31e
    return-object v0

    :pswitch_31f
    check-cast p0, Lk6l;

    check-cast v5, Lwjb;

    iget-object p0, p0, Lk6l;->s:Lg6l;

    invoke-virtual {p0, v5}, Lg6l;->H(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_32b
    check-cast p0, Lokhttp3/internal/http2/Http2Connection;

    check-cast v5, Lpqh;

    invoke-static {p0, v5}, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->a(Lokhttp3/internal/http2/Http2Connection;Lpqh;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_334
    check-cast p0, Lokhttp3/internal/http2/Http2Connection;

    check-cast v5, Lokhttp3/internal/http2/Http2Stream;

    invoke-static {p0, v5}, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->c(Lokhttp3/internal/http2/Http2Connection;Lokhttp3/internal/http2/Http2Stream;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_33d
    check-cast p0, Llea;

    check-cast v5, Lb8e;

    invoke-virtual {p0, v5}, Llea;->d(Lb8e;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_347
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast v5, Lzca;

    invoke-interface {p0, v5}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_351
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast v5, Lcof;

    invoke-interface {p0, v5}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_35b
    check-cast p0, Leq9;

    check-cast v5, Lfq9;

    iget-object p0, p0, Leq9;->c:Lh7f;

    invoke-virtual {p0, v5}, Lh7f;->c(Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_367
    check-cast p0, Lpqh;

    check-cast v5, Lah9;

    sget-object v0, Lyeg;->a:Lhp7;

    invoke-static {v5, v0}, Lz4o;->N(Lhi5;Lg7h;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lpqh;->a:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_376
    check-cast p0, Lpqh;

    check-cast v5, Lvg9;

    invoke-virtual {v5}, Lvg9;->V0()Lig9;

    move-result-object v0

    iput-object v0, p0, Lpqh;->a:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_383
    check-cast p0, Lpqh;

    check-cast v5, Ltg9;

    sget-object v0, Lyeg;->a:Lhp7;

    invoke-static {v5, v0}, Lz4o;->N(Lhi5;Lg7h;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lpqh;->a:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_392
    check-cast p0, Lk99;

    check-cast v5, Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lk99;->a:Let3;

    iget-object v0, v0, Let3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v0

    new-instance v1, Lj99;

    invoke-direct {v1, p0, v2}, Lj99;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lvme;

    const/16 v2, 0x13

    invoke-direct {p0, v2}, Lvme;-><init>(B)V

    invoke-static {v0, v5, v1, p0}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-object v0

    :pswitch_3ae
    check-cast p0, Lhv8;

    check-cast v5, Landroid/content/Context;

    invoke-virtual {p0}, Lhv8;->b()Lkv8;

    move-result-object p0

    iget-object p0, p0, Lkv8;->a:Ly7h;

    invoke-virtual {p0, v5}, Ly7h;->k(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_3c2
    .packed-switch 0x0
        :pswitch_3ae
        :pswitch_392
        :pswitch_383
        :pswitch_376
        :pswitch_367
        :pswitch_35b
        :pswitch_351
        :pswitch_347
        :pswitch_33d
        :pswitch_334
        :pswitch_32b
        :pswitch_31f
        :pswitch_24e
        :pswitch_242
        :pswitch_1b7
        :pswitch_196
        :pswitch_18a
        :pswitch_180
        :pswitch_176
        :pswitch_160
        :pswitch_f0
        :pswitch_cf
        :pswitch_b0
        :pswitch_9f
        :pswitch_95
        :pswitch_6f
        :pswitch_51
        :pswitch_47
        :pswitch_22
    .end packed-switch
.end method
