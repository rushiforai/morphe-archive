.class public final synthetic Ls2;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Ls2;->a:B

    invoke-direct/range {p0 .. p6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    iget-byte v1, v0, Ls2;->a:B

    const/4 v2, -0x1

    const/4 v3, 0x6

    const/4 v4, 0x5

    const/4 v5, 0x3

    const/16 v6, 0xb

    const/4 v7, 0x2

    const/4 v8, 0x4

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    packed-switch v1, :pswitch_data_b50

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lcom/usercentrics/sdk/UsercentricsDialog;

    invoke-virtual {v0, v1, v2}, Lcom/usercentrics/sdk/UsercentricsDialog;->b(II)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2c
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ludm;

    filled-new-array {v9, v9}, [I

    move-result-object v3

    invoke-virtual {v0}, Ludm;->h()Landroidx/core/widget/NestedScrollView;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    aget v3, v3, v11

    add-int/2addr v1, v2

    invoke-virtual {v0}, Ludm;->h()Landroidx/core/widget/NestedScrollView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    add-int/2addr v2, v3

    if-le v1, v2, :cond_70

    sub-int/2addr v1, v2

    iget-object v2, v0, Ludm;->p:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {v0}, Ludm;->h()Landroidx/core/widget/NestedScrollView;

    move-result-object v0

    const/16 v1, 0xfa

    invoke-virtual {v0, v9, v2, v1, v9}, Landroidx/core/widget/NestedScrollView;->B(IIIZ)V

    :cond_70
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_73
    move-object/from16 v6, p1

    check-cast v6, Lq1l;

    move-object/from16 v2, p2

    check-cast v2, Ldt9;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lc0j;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move v1, v5

    iget-object v5, v6, Lq1l;->C:Lkbh;

    iget-object v0, v5, Lkbh;->d:Ldt9;

    if-nez v0, :cond_8b

    iput-object v2, v5, Lkbh;->d:Ldt9;

    :cond_8b
    iget-object v0, v6, Lq1l;->s:Ln0n;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v7, v1, v8, v4, v3}, [Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ln0n;->f(Ljava/util/List;)V

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v1, "legIntPurposes"

    iget-object v3, v6, Lq1l;->z:Ln0n;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "purposes"

    iget-object v3, v6, Lq1l;->y:Ln0n;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_c7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_fd

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Ln0n;

    new-instance v1, Lp26;

    invoke-direct/range {v1 .. v6}, Lp26;-><init>(Ldt9;Ln0n;Ljava/lang/String;Lkbh;Lq1l;)V

    move v4, v11

    :goto_e7
    iget v7, v3, Ln0n;->b:I

    if-gt v4, v7, :cond_c7

    invoke-virtual {v3, v4}, Ln0n;->b(I)Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Lp26;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_e7

    :cond_fd
    iget-object v0, v6, Lq1l;->A:Ln0n;

    iget-object v1, v2, Ldt9;->b:Ljava/util/Map;

    if-eqz v1, :cond_134

    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_114
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_130

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/usercentrics/tcf/core/model/gvl/Vendor;

    iget v3, v3, Lcom/usercentrics/tcf/core/model/gvl/Vendor;->o:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_114

    :cond_130
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v10

    :cond_134
    invoke-virtual {v0, v10}, Ln0n;->d(Ljava/util/List;)V

    return-object v6

    :pswitch_138
    move-object/from16 v1, p1

    check-cast v1, Lq1l;

    move-object/from16 v2, p2

    check-cast v2, Ldt9;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lc0j;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v1

    :pswitch_148
    move v1, v5

    move-object/from16 v2, p1

    check-cast v2, Li7i;

    move-object/from16 v5, p2

    check-cast v5, Lae5;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lt7i;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v6, v2, Lz6i;

    if-eqz v6, :cond_17f

    new-instance v1, Ln6i;

    new-instance v2, Lm7i;

    invoke-direct {v2, v5, v0, v11}, Lm7i;-><init>(Lae5;Lt7i;B)V

    invoke-static {}, Lu5e;->a()Lmxb;

    move-result-object v0

    iget-object v0, v0, Lmxb;->c:Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lini;

    const-class v3, Lu5d;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    invoke-virtual {v0, v3, v10, v2}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lu5d;

    invoke-direct {v1, v0}, Ln6i;-><init>(Lu5d;)V

    :goto_17c
    move-object v10, v1

    goto/16 :goto_2f4

    :cond_17f
    sget-object v6, Lv6i;->INSTANCE:Lv6i;

    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1a8

    new-instance v1, Lj6i;

    new-instance v2, Lm7i;

    invoke-direct {v2, v5, v0, v7}, Lm7i;-><init>(Lae5;Lt7i;B)V

    invoke-static {}, Lu5e;->a()Lmxb;

    move-result-object v0

    iget-object v0, v0, Lmxb;->c:Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lini;

    const-class v3, Li47;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    invoke-virtual {v0, v3, v10, v2}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li47;

    invoke-direct {v1, v0}, Lj6i;-><init>(Li47;)V

    goto :goto_17c

    :cond_1a8
    sget-object v6, Lw6i;->INSTANCE:Lw6i;

    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1d3

    new-instance v2, Lk6i;

    new-instance v3, Lm7i;

    invoke-direct {v3, v5, v0, v1}, Lm7i;-><init>(Lae5;Lt7i;B)V

    invoke-static {}, Lu5e;->a()Lmxb;

    move-result-object v0

    iget-object v0, v0, Lmxb;->c:Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lini;

    const-class v1, Lhca;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    invoke-virtual {v0, v1, v10, v3}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhca;

    invoke-direct {v2, v0}, Lk6i;-><init>(Lhca;)V

    move-object v10, v2

    goto/16 :goto_2f4

    :cond_1d3
    sget-object v1, Lx6i;->INSTANCE:Lx6i;

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1fc

    new-instance v1, Ll6i;

    new-instance v2, Lm7i;

    invoke-direct {v2, v5, v0, v8}, Lm7i;-><init>(Lae5;Lt7i;B)V

    invoke-static {}, Lu5e;->a()Lmxb;

    move-result-object v0

    iget-object v0, v0, Lmxb;->c:Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lini;

    const-class v3, Lp7c;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    invoke-virtual {v0, v3, v10, v2}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lp7c;

    invoke-direct {v1, v0}, Ll6i;-><init>(Lp7c;)V

    goto :goto_17c

    :cond_1fc
    instance-of v1, v2, Lc7i;

    if-eqz v1, :cond_222

    new-instance v1, Lo6i;

    new-instance v3, Lp7i;

    invoke-direct {v3, v5, v2, v0, v9}, Lp7i;-><init>(Lae5;Li7i;Lt7i;B)V

    invoke-static {}, Lu5e;->a()Lmxb;

    move-result-object v0

    iget-object v0, v0, Lmxb;->c:Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lini;

    const-class v2, Lbng;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v2

    invoke-virtual {v0, v2, v10, v3}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbng;

    invoke-direct {v1, v0}, Lo6i;-><init>(Lbng;)V

    goto/16 :goto_17c

    :cond_222
    sget-object v1, Le7i;->INSTANCE:Le7i;

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24c

    new-instance v1, Lq6i;

    new-instance v2, Lm7i;

    invoke-direct {v2, v5, v0, v4}, Lm7i;-><init>(Lae5;Lt7i;B)V

    invoke-static {}, Lu5e;->a()Lmxb;

    move-result-object v0

    iget-object v0, v0, Lmxb;->c:Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lini;

    const-class v3, Lb1k;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    invoke-virtual {v0, v3, v10, v2}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb1k;

    invoke-direct {v1, v0}, Lq6i;-><init>(Lb1k;)V

    goto/16 :goto_17c

    :cond_24c
    instance-of v1, v2, Lh7i;

    if-eqz v1, :cond_272

    new-instance v1, Lr6i;

    new-instance v3, Lp7i;

    invoke-direct {v3, v5, v2, v0, v11}, Lp7i;-><init>(Lae5;Li7i;Lt7i;B)V

    invoke-static {}, Lu5e;->a()Lmxb;

    move-result-object v0

    iget-object v0, v0, Lmxb;->c:Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lini;

    const-class v2, Lctn;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v2

    invoke-virtual {v0, v2, v10, v3}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lctn;

    invoke-direct {v1, v0}, Lr6i;-><init>(Lctn;)V

    goto/16 :goto_17c

    :cond_272
    sget-object v1, Lt6i;->INSTANCE:Lt6i;

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29c

    new-instance v1, Li6i;

    new-instance v2, Lm7i;

    invoke-direct {v2, v5, v0, v3}, Lm7i;-><init>(Lae5;Lt7i;B)V

    invoke-static {}, Lu5e;->a()Lmxb;

    move-result-object v0

    iget-object v0, v0, Lmxb;->c:Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lini;

    const-class v3, Lfm4;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    invoke-virtual {v0, v3, v10, v2}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfm4;

    invoke-direct {v1, v0}, Li6i;-><init>(Lfm4;)V

    goto/16 :goto_17c

    :cond_29c
    sget-object v1, Ly6i;->INSTANCE:Ly6i;

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2c7

    new-instance v1, Lm6i;

    new-instance v2, Lm7i;

    const/4 v3, 0x7

    invoke-direct {v2, v5, v0, v3}, Lm7i;-><init>(Lae5;Lt7i;B)V

    invoke-static {}, Lu5e;->a()Lmxb;

    move-result-object v0

    iget-object v0, v0, Lmxb;->c:Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lini;

    const-class v3, Lgcc;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    invoke-virtual {v0, v3, v10, v2}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgcc;

    invoke-direct {v1, v0}, Lm6i;-><init>(Lgcc;)V

    goto/16 :goto_17c

    :cond_2c7
    sget-object v1, Ld7i;->INSTANCE:Ld7i;

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2f1

    new-instance v1, Lp6i;

    new-instance v2, Lm7i;

    invoke-direct {v2, v5, v0, v9}, Lm7i;-><init>(Lae5;Lt7i;B)V

    invoke-static {}, Lu5e;->a()Lmxb;

    move-result-object v0

    iget-object v0, v0, Lmxb;->c:Lc37;

    iget-object v0, v0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Lini;

    const-class v3, Lt2i;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    invoke-virtual {v0, v3, v10, v2}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt2i;

    invoke-direct {v1, v0}, Lp6i;-><init>(Lt2i;)V

    goto/16 :goto_17c

    :cond_2f1
    invoke-static {}, Lh9o;->p()V

    :goto_2f4
    return-object v10

    :pswitch_2f5
    move-object/from16 v1, p1

    check-cast v1, Lkotlin/jvm/functions/Function1;

    move-object/from16 v2, p2

    check-cast v2, Lmt5;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ly5i;

    invoke-static {v0, v1, v2}, Lz5i;->t(Ly5i;Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_306
    move-object/from16 v1, p1

    check-cast v1, Lkotlin/jvm/functions/Function1;

    move-object/from16 v2, p2

    check-cast v2, Lmt5;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ly5i;

    invoke-static {v0, v1, v2}, Lz5i;->t(Ly5i;Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_317
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v2, p2

    check-cast v2, Lkotlin/jvm/functions/Function1;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lyj0;

    iget-object v3, v0, Lyj0;->a:Lpsp;

    invoke-static {}, Lpsp;->h()Ldr0;

    move-result-object v3

    iget-object v0, v0, Lyj0;->b:Lt56;

    const/16 v4, 0xe

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    if-eqz v5, :cond_341

    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_341

    new-instance v6, Lif0;

    invoke-direct {v6, v0, v4, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_34e

    :cond_341
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v4, v11, v5}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v6, Lif0;

    invoke-direct {v6, v0, v4, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_34e
    invoke-virtual {v6, v1, v3}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ler0;

    invoke-direct {v0, v3}, Ler0;-><init>(Ldr0;)V

    invoke-interface {v2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_35c
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v2, p2

    check-cast v2, Lkotlin/jvm/functions/Function1;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lyj0;

    iget-object v3, v0, Lyj0;->a:Lpsp;

    invoke-static {}, Lpsp;->h()Ldr0;

    move-result-object v3

    iget-object v0, v0, Lyj0;->b:Lt56;

    const/16 v4, 0xd

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    if-eqz v5, :cond_386

    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_386

    new-instance v6, Lif0;

    invoke-direct {v6, v0, v4, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_393

    :cond_386
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v4, v11, v5}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v6, Lif0;

    invoke-direct {v6, v0, v4, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_393
    invoke-virtual {v6, v1, v3}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ler0;

    invoke-direct {v0, v3}, Ler0;-><init>(Ldr0;)V

    invoke-interface {v2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3a1
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v2, p2

    check-cast v2, Lkotlin/jvm/functions/Function1;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lyj0;

    iget-object v3, v0, Lyj0;->a:Lpsp;

    invoke-static {}, Lpsp;->h()Ldr0;

    move-result-object v3

    iget-object v0, v0, Lyj0;->b:Lt56;

    const/16 v4, 0xc

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    if-eqz v5, :cond_3cb

    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_3cb

    new-instance v6, Lif0;

    invoke-direct {v6, v0, v4, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_3d8

    :cond_3cb
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v4, v11, v5}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v6, Lif0;

    invoke-direct {v6, v0, v4, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_3d8
    invoke-virtual {v6, v1, v3}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ler0;

    invoke-direct {v0, v3}, Ler0;-><init>(Ldr0;)V

    invoke-interface {v2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3e6
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v2, p2

    check-cast v2, Lkotlin/jvm/functions/Function1;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lyj0;

    iget-object v3, v0, Lyj0;->a:Lpsp;

    invoke-static {}, Lpsp;->h()Ldr0;

    move-result-object v3

    iget-object v0, v0, Lyj0;->b:Lt56;

    invoke-virtual {v0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    if-eqz v4, :cond_40e

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_40e

    new-instance v5, Lif0;

    invoke-direct {v5, v0, v6, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_41b

    :cond_40e
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v6, v11, v4}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v5, Lif0;

    invoke-direct {v5, v0, v6, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_41b
    invoke-virtual {v5, v1, v3}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ler0;

    invoke-direct {v0, v3}, Ler0;-><init>(Ldr0;)V

    invoke-interface {v2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_429
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    move-object/from16 v2, p2

    check-cast v2, Lite;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lbse;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v2, :cond_441

    sget-object v0, Lcse;->c:Lcse;

    goto :goto_456

    :cond_441
    iget-boolean v0, v2, Lite;->c:Z

    if-eqz v0, :cond_448

    sget-object v0, Lcse;->b:Lcse;

    goto :goto_456

    :cond_448
    iget-boolean v0, v2, Lite;->d:Z

    if-eqz v0, :cond_44f

    sget-object v0, Lcse;->a:Lcse;

    goto :goto_456

    :cond_44f
    if-eqz v1, :cond_454

    sget-object v0, Lcse;->a:Lcse;

    goto :goto_456

    :cond_454
    sget-object v0, Lcse;->b:Lcse;

    :goto_456
    return-object v0

    :pswitch_457
    move-object/from16 v1, p1

    check-cast v1, Lj23;

    move-object/from16 v2, p2

    check-cast v2, Lp23;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Li2e;

    check-cast v0, Lq2e;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_477

    if-ne v2, v11, :cond_473

    iget-object v2, v1, Lj23;->g:Lec;

    goto :goto_479

    :cond_473
    invoke-static {}, Lh9o;->p()V

    goto :goto_4a1

    :cond_477
    iget-object v2, v1, Lj23;->f:Lec;

    :goto_479
    if-eqz v2, :cond_485

    iget-object v10, v2, Lec;->b:Lgpm;

    iget-object v2, v2, Lec;->c:Lcc;

    move-object/from16 v23, v10

    move-object v10, v2

    move-object/from16 v2, v23

    goto :goto_486

    :cond_485
    move-object v2, v10

    :goto_486
    if-eqz v2, :cond_49f

    if-eqz v10, :cond_49f

    iget-object v3, v0, Lq2e;->c:Lt3e;

    new-instance v4, Lsa8;

    iget-object v1, v1, Lj23;->a:Ljava/lang/String;

    invoke-direct {v4, v1}, Lsa8;-><init>(Ljava/lang/String;)V

    check-cast v3, Lh5e;

    invoke-virtual {v3, v4}, Lh5e;->t(Lfb8;)V

    iget-object v0, v0, Lq2e;->d:Lj2e;

    iget-object v0, v0, Lj2e;->a:Lo7i;

    invoke-virtual {v0, v2, v10}, Lo7i;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_49f
    sget-object v10, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_4a1
    return-object v10

    :pswitch_4a2
    move-object/from16 v1, p1

    check-cast v1, Lyzd;

    move-object/from16 v2, p2

    check-cast v2, Lf0e;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Li0e;

    iget-object v0, v0, Li0e;->b:Lbp3;

    iget-object v3, v0, Lbp3;->i:Ljava/lang/Object;

    check-cast v3, Lm0e;

    iget-object v3, v3, Lm0e;->e:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v4, Lu4h;

    invoke-direct {v4, v6}, Lu4h;-><init>(B)V

    invoke-static {v3, v4}, Lnxg;->n(Landroidx/recyclerview/widget/RecyclerView;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/recyclerview/widget/i;

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    iget-object v0, v0, Lbp3;->h:Ljava/lang/Object;

    check-cast v0, Li0e;

    if-eqz v2, :cond_4d7

    iget v1, v1, Lyzd;->a:I

    iget-object v0, v0, Li0e;->a:Lrgh;

    iget-object v0, v0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Lp9l;

    invoke-virtual {v0, v1}, La21;->e(I)V

    goto :goto_4e8

    :cond_4d7
    iget-object v1, v1, Lyzd;->b:Ljava/util/ArrayList;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb2l;

    iget-object v0, v0, Li0e;->a:Lrgh;

    iget-object v0, v0, Lrgh;->b:Ljava/lang/Object;

    check-cast v0, Lr9l;

    invoke-virtual {v0, v1}, Lr9l;->p(Lb2l;)V

    :goto_4e8
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4eb
    move-object/from16 v1, p1

    check-cast v1, Lzzd;

    move-object/from16 v2, p2

    check-cast v2, Lf0e;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Li0e;

    iget-object v0, v0, Li0e;->b:Lbp3;

    iget-object v3, v0, Lbp3;->i:Ljava/lang/Object;

    check-cast v3, Lm0e;

    iget-object v3, v3, Lm0e;->e:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v4, Lu4h;

    invoke-direct {v4, v6}, Lu4h;-><init>(B)V

    invoke-static {v3, v4}, Lnxg;->n(Landroidx/recyclerview/widget/RecyclerView;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/recyclerview/widget/i;

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    iget-object v0, v0, Lbp3;->h:Ljava/lang/Object;

    check-cast v0, Li0e;

    if-eqz v2, :cond_51a

    iget-object v1, v1, Lzzd;->a:Lb2l;

    invoke-virtual {v0, v1}, Li0e;->m(Lb2l;)V

    goto :goto_525

    :cond_51a
    iget-object v1, v1, Lzzd;->a:Lb2l;

    iget-object v0, v0, Li0e;->a:Lrgh;

    iget-object v0, v0, Lrgh;->b:Ljava/lang/Object;

    check-cast v0, Lr9l;

    invoke-virtual {v0, v1}, Lr9l;->p(Lb2l;)V

    :goto_525
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_528
    move-object/from16 v1, p1

    check-cast v1, Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lrqb;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1, v2}, Lkotlinx/serialization/descriptors/SerialDescriptor;->j(I)Z

    move-result v3

    if-nez v3, :cond_54c

    invoke-interface {v1, v2}, Lkotlinx/serialization/descriptors/SerialDescriptor;->h(I)Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v1

    invoke-interface {v1}, Lkotlinx/serialization/descriptors/SerialDescriptor;->b()Z

    move-result v1

    if-eqz v1, :cond_54c

    move v9, v11

    :cond_54c
    iput-boolean v9, v0, Lrqb;->b:Z

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_553
    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/history/f;

    iget-object v3, v0, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    iget-object v3, v3, Lcom/opera/android/history/d;->l:Lcom/opera/android/history/e;

    iget-boolean v4, v3, Lcom/opera/android/history/e;->d:Z

    if-nez v4, :cond_570

    invoke-virtual {v0}, Lcom/opera/android/history/f;->f()Lkea;

    move-result-object v0

    goto :goto_58c

    :cond_570
    new-instance v0, Lkea;

    iget-object v3, v3, Lcom/opera/android/history/e;->e:Laea;

    if-eqz v2, :cond_583

    sget-object v2, Laea;->a:Laea;

    sget-object v4, Laea;->b:Laea;

    filled-new-array {v2, v4}, [Laea;

    move-result-object v2

    invoke-static {v2}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    goto :goto_589

    :cond_583
    sget-object v2, Laea;->a:Laea;

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    :goto_589
    invoke-direct {v0, v11, v3, v2, v1}, Lkea;-><init>(ZLaea;Ljava/util/Set;Ljava/util/List;)V

    :goto_58c
    return-object v0

    :pswitch_58d
    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    move-object/from16 v3, p2

    check-cast v3, Lmt5;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ld3a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lr2a;->c:Lr2a;

    sget-object v5, Lr2a;->b:Lr2a;

    sget-object v6, Lr2a;->a:Lr2a;

    sget-object v7, Lr2a;->d:Lr2a;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-ne v8, v11, :cond_5ad

    move v12, v9

    goto/16 :goto_657

    :cond_5ad
    move-object v8, v1

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v12

    add-int/2addr v12, v2

    if-ltz v12, :cond_5e5

    move v13, v2

    :goto_5b8
    add-int/lit8 v14, v12, -0x1

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ly2a;

    invoke-static {v15, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_657

    invoke-static {v15, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_657

    invoke-static {v15, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_657

    invoke-static {v15, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_657

    instance-of v15, v15, Lw2a;

    if-eqz v15, :cond_5df

    if-gez v13, :cond_5df

    move v13, v12

    :cond_5df
    if-gez v14, :cond_5e3

    move v12, v13

    goto :goto_5e6

    :cond_5e3
    move v12, v14

    goto :goto_5b8

    :cond_5e5
    move v12, v2

    :goto_5e6
    if-gez v12, :cond_657

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v12

    move v13, v2

    move v14, v13

    move v15, v9

    :goto_5ef
    if-ge v15, v12, :cond_60c

    invoke-interface {v1, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v9, v16

    check-cast v9, Ly2a;

    instance-of v2, v9, Lu2a;

    if-eqz v2, :cond_5ff

    move v13, v15

    goto :goto_609

    :cond_5ff
    instance-of v2, v9, Lt2a;

    if-eqz v2, :cond_605

    move v14, v15

    goto :goto_609

    :cond_605
    instance-of v2, v9, Lv2a;

    if-eqz v2, :cond_60c

    :goto_609
    add-int/lit8 v15, v15, 0x1

    goto :goto_5ef

    :cond_60c
    if-ltz v13, :cond_610

    move v12, v13

    goto :goto_657

    :cond_610
    if-ltz v14, :cond_614

    move v12, v14

    goto :goto_657

    :cond_614
    iget-object v2, v0, Ld3a;->o:Llvh;

    if-eqz v2, :cond_638

    iget-object v2, v0, Ld3a;->n:Laf2;

    invoke-virtual {v2}, Laf2;->b()Z

    move-result v2

    if-eqz v2, :cond_638

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v2

    const/4 v12, 0x0

    :goto_625
    if-ge v12, v2, :cond_638

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ly2a;

    instance-of v13, v9, Ls2a;

    if-nez v13, :cond_657

    instance-of v9, v9, Lx2a;

    if-nez v9, :cond_657

    add-int/lit8 v12, v12, 0x1

    goto :goto_625

    :cond_638
    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v2

    const/4 v8, 0x0

    const/16 v16, -0x1

    :goto_63f
    if-ge v8, v2, :cond_651

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ly2a;

    instance-of v9, v9, Lv2a;

    if-eqz v9, :cond_651

    add-int/lit8 v9, v8, 0x1

    move/from16 v16, v8

    move v8, v9

    goto :goto_63f

    :cond_651
    if-ltz v16, :cond_656

    move/from16 v12, v16

    goto :goto_657

    :cond_656
    const/4 v12, 0x0

    :cond_657
    :goto_657
    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ly2a;

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_668

    invoke-interface {v1, v12}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto/16 :goto_774

    :cond_668
    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_67a

    invoke-virtual {v0, v1, v3}, Ld3a;->p(Ljava/util/List;Lmt5;)Ljava/lang/Object;

    move-result-object v10

    sget-object v0, Lpx5;->a:Lpx5;

    if-eq v10, v0, :cond_77a

    sget-object v10, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto/16 :goto_77a

    :cond_67a
    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6be

    iget-object v2, v0, Ld3a;->t:Lpyl;

    if-eqz v2, :cond_687

    invoke-virtual {v2}, Lpyl;->b()V

    :cond_687
    iput-object v10, v0, Ld3a;->o:Llvh;

    invoke-interface {v1, v12}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    const/4 v9, 0x0

    :goto_68d
    if-ge v9, v12, :cond_774

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ly2a;

    invoke-static {v2, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6b8

    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6b8

    instance-of v3, v2, Lv2a;

    if-nez v3, :cond_6b8

    instance-of v3, v2, Lx2a;

    if-nez v3, :cond_6b8

    instance-of v3, v2, Ls2a;

    if-eqz v3, :cond_6b5

    check-cast v2, Ls2a;

    iget-object v2, v2, Ls2a;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ld3a;->h(Ljava/util/ArrayList;)V

    goto :goto_6b8

    :cond_6b5
    add-int/lit8 v9, v9, 0x1

    goto :goto_68d

    :cond_6b8
    :goto_6b8
    invoke-interface {v1, v9}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v12, v12, -0x1

    goto :goto_68d

    :cond_6be
    invoke-static {v2, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6ff

    iget-object v2, v0, Ld3a;->t:Lpyl;

    if-eqz v2, :cond_6de

    iget-object v2, v2, Lpyl;->c:Ljava/lang/Object;

    check-cast v2, Lsa4;

    iget-object v3, v2, Lsa4;->k:Ljava/lang/Object;

    monitor-enter v3

    :try_start_6cf
    invoke-virtual {v2}, Lsa4;->toString()Ljava/lang/String;

    iget-object v2, v2, Lsa4;->e:Ljava/lang/Object;

    check-cast v2, Lac4;

    invoke-interface {v2}, Lac4;->l1()Z
    :try_end_6d9
    .catchall {:try_start_6cf .. :try_end_6d9} :catchall_6db

    monitor-exit v3

    goto :goto_6de

    :catchall_6db
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_6de
    :goto_6de
    iput-object v10, v0, Ld3a;->o:Llvh;

    invoke-interface {v1, v12}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    const/4 v9, 0x0

    :goto_6e4
    if-ge v9, v12, :cond_774

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly2a;

    invoke-static {v0, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6f9

    instance-of v0, v0, Lv2a;

    if-nez v0, :cond_6f9

    add-int/lit8 v9, v9, 0x1

    goto :goto_6e4

    :cond_6f9
    invoke-interface {v1, v9}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v12, v12, -0x1

    goto :goto_6e4

    :cond_6ff
    instance-of v4, v2, Lw2a;

    if-eqz v4, :cond_711

    check-cast v2, Lw2a;

    invoke-virtual {v0, v1, v12, v2, v3}, Ld3a;->o(Ljava/util/List;ILw2a;Lmt5;)Ljava/lang/Object;

    move-result-object v10

    sget-object v0, Lpx5;->a:Lpx5;

    if-eq v10, v0, :cond_77a

    sget-object v10, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto/16 :goto_77a

    :cond_711
    instance-of v3, v2, Ls2a;

    if-eqz v3, :cond_71b

    check-cast v2, Ls2a;

    invoke-virtual {v0, v1, v12, v2, v11}, Ld3a;->m(Ljava/util/List;ILs2a;Z)V

    goto :goto_774

    :cond_71b
    instance-of v3, v2, Lx2a;

    if-eqz v3, :cond_725

    check-cast v2, Lx2a;

    invoke-virtual {v0, v1, v12, v2}, Ld3a;->q(Ljava/util/List;ILx2a;)V

    goto :goto_774

    :cond_725
    instance-of v3, v2, Lu2a;

    if-eqz v3, :cond_769

    check-cast v2, Lu2a;

    iget-object v3, v0, Ld3a;->c:Ljava/util/Map;

    iget-object v4, v2, Lu2a;->a:Ljava/util/Map;

    iput-object v4, v0, Ld3a;->p:Ljava/util/Map;

    iget-object v2, v2, Lu2a;->b:Ljava/util/Map;

    iput-object v2, v0, Ld3a;->q:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_74a

    new-instance v4, Lu9d;

    invoke-direct {v4}, Lu9d;-><init>()V

    invoke-virtual {v4, v2}, Lu9d;->putAll(Ljava/util/Map;)V

    invoke-virtual {v4, v3}, Lu9d;->putAll(Ljava/util/Map;)V

    invoke-virtual {v4}, Lu9d;->g()Lu9d;

    move-result-object v3

    :cond_74a
    iput-object v3, v0, Ld3a;->r:Ljava/util/Map;

    invoke-interface {v1, v12}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    const/4 v9, 0x0

    :goto_750
    if-ge v9, v12, :cond_765

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ly2a;

    instance-of v2, v2, Lu2a;

    if-eqz v2, :cond_762

    invoke-interface {v1, v9}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v12, v12, -0x1

    goto :goto_750

    :cond_762
    add-int/lit8 v9, v9, 0x1

    goto :goto_750

    :cond_765
    invoke-virtual {v0}, Ld3a;->r()Z

    goto :goto_774

    :cond_769
    instance-of v3, v2, Lt2a;

    if-nez v3, :cond_77b

    instance-of v2, v2, Lv2a;

    if-eqz v2, :cond_777

    invoke-virtual {v0, v12, v1, v11}, Ld3a;->n(ILjava/util/List;Z)V

    :cond_774
    :goto_774
    sget-object v10, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_77a

    :cond_777
    invoke-static {}, Lh9o;->p()V

    :cond_77a
    :goto_77a
    return-object v10

    :cond_77b
    throw v10

    :pswitch_77c
    move-object/from16 v1, p1

    check-cast v1, Lqg9;

    move-object/from16 v2, p2

    check-cast v2, Lqg9;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lah9;

    iget-boolean v3, v0, Lb8e;->n:Z

    if-eqz v3, :cond_817

    invoke-virtual {v2}, Lqg9;->g()Z

    move-result v2

    invoke-virtual {v1}, Lqg9;->g()Z

    move-result v1

    if-eq v2, v1, :cond_817

    iget-object v1, v0, Lah9;->r:Lr2;

    if-eqz v1, :cond_7a1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v3}, Lr2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7a1
    if-eqz v2, :cond_7dd

    invoke-virtual {v0}, Lb8e;->H0()Lnx5;

    move-result-object v1

    sget-object v3, Lrx5;->d:Lrx5;

    new-instance v4, Lyf;

    const/16 v5, 0x17

    invoke-direct {v4, v5, v10, v0}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, v10, v3, v4, v11}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    new-instance v1, Lpqh;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v3, Lgv8;

    invoke-direct {v3, v1, v0, v8}, Lgv8;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v3}, Lx7d;->y(Lb8e;Lkotlin/jvm/functions/Function0;)V

    iget-object v1, v1, Lpqh;->a:Ljava/lang/Object;

    check-cast v1, Lq5c;

    if-eqz v1, :cond_7ca

    invoke-virtual {v1}, Lq5c;->a()Lq5c;

    goto :goto_7cb

    :cond_7ca
    move-object v1, v10

    :goto_7cb
    iput-object v1, v0, Lah9;->t:Lq5c;

    iget-object v1, v0, Lah9;->u:Lwye;

    if-eqz v1, :cond_7e9

    invoke-virtual {v1}, Lwye;->Z0()Lb8e;

    move-result-object v1

    iget-boolean v1, v1, Lb8e;->n:Z

    if-eqz v1, :cond_7e9

    invoke-virtual {v0}, Lah9;->X0()V

    goto :goto_7e9

    :cond_7dd
    iget-object v1, v0, Lah9;->t:Lq5c;

    if-eqz v1, :cond_7e4

    invoke-virtual {v1}, Lq5c;->b()V

    :cond_7e4
    iput-object v10, v0, Lah9;->t:Lq5c;

    invoke-virtual {v0}, Lah9;->X0()V

    :cond_7e9
    :goto_7e9
    invoke-static {v0}, Laoh;->j(Li0j;)V

    iget-object v1, v0, Lah9;->q:Llde;

    if-eqz v1, :cond_817

    iget-object v3, v0, Lah9;->s:Lwf9;

    if-eqz v2, :cond_80b

    if-eqz v3, :cond_800

    new-instance v2, Lxf9;

    invoke-direct {v2, v3}, Lxf9;-><init>(Lwf9;)V

    invoke-virtual {v0, v1, v2}, Lah9;->W0(Llde;Lndb;)V

    iput-object v10, v0, Lah9;->s:Lwf9;

    :cond_800
    new-instance v2, Lwf9;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, v1, v2}, Lah9;->W0(Llde;Lndb;)V

    iput-object v2, v0, Lah9;->s:Lwf9;

    goto :goto_817

    :cond_80b
    if-eqz v3, :cond_817

    new-instance v2, Lxf9;

    invoke-direct {v2, v3}, Lxf9;-><init>(Lwf9;)V

    invoke-virtual {v0, v1, v2}, Lah9;->W0(Llde;Lndb;)V

    iput-object v10, v0, Lah9;->s:Lwf9;

    :cond_817
    :goto_817
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_81a
    move-object/from16 v1, p1

    check-cast v1, Lqg9;

    move-object/from16 v2, p2

    check-cast v2, Lqg9;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ltg9;

    iget-boolean v3, v0, Lb8e;->n:Z

    if-eqz v3, :cond_859

    invoke-virtual {v2}, Lqg9;->g()Z

    move-result v2

    invoke-virtual {v1}, Lqg9;->g()Z

    move-result v1

    if-eq v2, v1, :cond_859

    if-eqz v2, :cond_850

    new-instance v1, Lpqh;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lgv8;

    invoke-direct {v2, v1, v0, v7}, Lgv8;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v2}, Lx7d;->y(Lb8e;Lkotlin/jvm/functions/Function0;)V

    iget-object v1, v1, Lpqh;->a:Ljava/lang/Object;

    check-cast v1, Lq5c;

    if-eqz v1, :cond_84d

    invoke-virtual {v1}, Lq5c;->a()Lq5c;

    move-object v10, v1

    :cond_84d
    iput-object v10, v0, Ltg9;->r:Lq5c;

    goto :goto_859

    :cond_850
    iget-object v1, v0, Ltg9;->r:Lq5c;

    if-eqz v1, :cond_857

    invoke-virtual {v1}, Lq5c;->b()V

    :cond_857
    iput-object v10, v0, Ltg9;->r:Lq5c;

    :cond_859
    :goto_859
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_85c
    move-object/from16 v1, p1

    check-cast v1, Lbh0;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lorm;

    check-cast v0, Lx5f;

    iget-boolean v4, v0, Lx5f;->h:Z

    if-eqz v4, :cond_8b9

    iget-object v4, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    new-instance v6, Lnb0;

    const/16 v8, 0x98b

    const/4 v9, -0x1

    invoke-direct {v6, v8, v9, v7}, Ljf0;-><init>(III)V

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v11, v2, v3}, Ljf0;->p(IIJ)V

    if-nez v1, :cond_888

    move v9, v7

    goto :goto_889

    :cond_888
    move v9, v11

    :goto_889
    invoke-virtual {v6, v11, v9, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, v4}, Lx56;->A(Lzpa;)Luc0;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_8a6

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_8a6

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_8b3

    :cond_8a6
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v2, v11, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_8b3
    invoke-virtual {v4, v6}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v5}, Lx5f;->U0(Lx56;)V

    :cond_8b9
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8bc
    move-object/from16 v1, p1

    check-cast v1, Landroid/view/View;

    move-object/from16 v2, p2

    check-cast v2, Lj8f;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ltt5;

    iget-object v3, v0, Ltt5;->g:Lft3;

    iget-object v3, v3, Lft3;->b:Lqim;

    iget-object v3, v3, Lqim;->g:Loz3;

    new-instance v4, Lwt5;

    new-instance v5, Lpjn;

    const/16 v6, 0x1d

    invoke-direct {v5, v0, v6}, Lpjn;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v4, v1, v2, v5}, Lwt5;-><init>(Landroid/view/View;Lj8f;Lpjn;)V

    sget-object v0, Lijm;->a:Lijm;

    invoke-virtual {v3, v4, v0}, Lr22;->b(Ljjm;Lijm;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8e2
    move-object/from16 v1, p1

    check-cast v1, Lguo;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lz13;

    invoke-virtual {v0, v1, v2}, Lz13;->a(Lguo;Z)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8f8
    move-object/from16 v1, p1

    check-cast v1, Lguo;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lz13;

    invoke-virtual {v0, v1, v2}, Lz13;->a(Lguo;Z)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_90e
    move v7, v9

    sget-object v1, Lsy1;->e:Lsy1;

    move-object/from16 v13, p1

    check-cast v13, Ljava/lang/String;

    move-object/from16 v2, p2

    check-cast v2, Lvy1;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Liy1;

    iget-object v3, v0, Liy1;->i:Li52;

    iget-object v4, v0, Liy1;->n:Ljava/util/ArrayList;

    iget-object v0, v0, Liy1;->m:Lqde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_92d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_945

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, Ljx1;

    invoke-interface {v8}, Ljx1;->getId()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_92d

    goto :goto_946

    :cond_945
    move-object v6, v10

    :goto_946
    check-cast v6, Ljx1;

    if-eqz v6, :cond_ace

    instance-of v5, v6, Lvx1;

    if-eqz v5, :cond_ace

    instance-of v5, v2, Lty1;

    if-eqz v5, :cond_9bc

    check-cast v6, Lvx1;

    iget-object v5, v6, Lvx1;->b:Lwxe;

    if-eqz v5, :cond_9b7

    instance-of v8, v5, Lqx1;

    if-eqz v8, :cond_989

    new-instance v12, Lh52;

    check-cast v5, Lqx1;

    iget-object v14, v5, Lqx1;->o:Lo29;

    iget-object v15, v6, Lvx1;->c:Lux1;

    iget-object v5, v5, Lqx1;->m:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v18

    move-object v5, v2

    check-cast v5, Lty1;

    iget-object v6, v5, Lty1;->a:Ljava/lang/String;

    iget-object v8, v5, Lty1;->c:Ljava/lang/String;

    iget-object v5, v5, Lty1;->d:Ljava/lang/String;

    const/16 v22, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x0

    move-object/from16 v21, v5

    move-object/from16 v19, v6

    move-object/from16 v20, v8

    invoke-direct/range {v12 .. v22}, Lh52;-><init>(Ljava/lang/String;Lo29;Lux1;ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lz92;)V

    iget-object v3, v3, Li52;->a:Ljava/util/LinkedHashMap;

    invoke-interface {v3, v13, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_a59

    :cond_989
    instance-of v8, v5, Ltx1;

    if-eqz v8, :cond_9b7

    new-instance v12, Lh52;

    iget-object v15, v6, Lvx1;->c:Lux1;

    check-cast v5, Ltx1;

    iget-object v6, v5, Ltx1;->m:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v18

    move-object v6, v2

    check-cast v6, Lty1;

    iget-object v6, v6, Lty1;->a:Ljava/lang/String;

    const-string v20, "application/vnd.opera.x-page-context"

    const/16 v21, 0x0

    iget-object v5, v5, Ltx1;->n:Lz92;

    const/4 v14, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x0

    move-object/from16 v22, v5

    move-object/from16 v19, v6

    invoke-direct/range {v12 .. v22}, Lh52;-><init>(Ljava/lang/String;Lo29;Lux1;ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lz92;)V

    iget-object v3, v3, Li52;->a:Ljava/util/LinkedHashMap;

    invoke-interface {v3, v13, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_a59

    :cond_9b7
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_af6

    :cond_9bc
    instance-of v5, v2, Luy1;

    if-eqz v5, :cond_a26

    check-cast v6, Lvx1;

    iget-object v5, v6, Lvx1;->b:Lwxe;

    if-eqz v5, :cond_a21

    instance-of v8, v5, Lqx1;

    if-eqz v8, :cond_9f4

    new-instance v12, Lh52;

    check-cast v5, Lqx1;

    iget-object v14, v5, Lqx1;->o:Lo29;

    iget-object v15, v6, Lvx1;->c:Lux1;

    iget-object v5, v5, Lqx1;->m:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v18

    move-object v5, v2

    check-cast v5, Luy1;

    iget-object v6, v5, Luy1;->a:Ljava/lang/String;

    iget-object v5, v5, Luy1;->c:Ljava/lang/String;

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v20, v5

    move-object/from16 v19, v6

    invoke-direct/range {v12 .. v22}, Lh52;-><init>(Ljava/lang/String;Lo29;Lux1;ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lz92;)V

    iget-object v3, v3, Li52;->a:Ljava/util/LinkedHashMap;

    invoke-interface {v3, v13, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a59

    :cond_9f4
    instance-of v8, v5, Ltx1;

    if-eqz v8, :cond_a21

    new-instance v12, Lh52;

    iget-object v15, v6, Lvx1;->c:Lux1;

    check-cast v5, Ltx1;

    iget-object v6, v5, Ltx1;->m:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v18

    move-object v6, v2

    check-cast v6, Luy1;

    iget-object v6, v6, Luy1;->a:Ljava/lang/String;

    const-string v20, "application/vnd.opera.x-page-context"

    const/16 v21, 0x0

    iget-object v5, v5, Ltx1;->n:Lz92;

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v22, v5

    move-object/from16 v19, v6

    invoke-direct/range {v12 .. v22}, Lh52;-><init>(Ljava/lang/String;Lo29;Lux1;ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lz92;)V

    iget-object v3, v3, Li52;->a:Ljava/util/LinkedHashMap;

    invoke-interface {v3, v13, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a59

    :cond_a21
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_af6

    :cond_a26
    sget-object v5, Lsy1;->a:Lsy1;

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a51

    sget-object v5, Lsy1;->b:Lsy1;

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a51

    sget-object v5, Lsy1;->c:Lsy1;

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a51

    sget-object v5, Lsy1;->d:Lsy1;

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a51

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a51

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_af6

    :cond_a51
    iget-object v3, v3, Li52;->a:Ljava/util/LinkedHashMap;

    invoke-interface {v3, v13}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lh52;

    :goto_a59
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v5, v7

    :cond_a5e
    if-ge v5, v3, :cond_a81

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    move-object v8, v6

    check-cast v8, Lfy1;

    iget-object v8, v8, Lfy1;->a:Ljava/lang/String;

    invoke-static {v8, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a7d

    instance-of v8, v2, Luy1;

    if-nez v8, :cond_a7d

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_a7d

    move v8, v11

    goto :goto_a7e

    :cond_a7d
    move v8, v7

    :goto_a7e
    if-eqz v8, :cond_a5e

    goto :goto_a82

    :cond_a81
    move-object v6, v10

    :goto_a82
    check-cast v6, Lfy1;

    if-eqz v6, :cond_a8e

    iget-object v1, v6, Lfy1;->b:Ld3k;

    invoke-virtual {v1, v10}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_a8e
    new-instance v1, Lz3;

    const/16 v3, 0x19

    invoke-direct {v1, v2, v3}, Lz3;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v0, Lqde;->l:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v9, v7

    :goto_a9c
    if-ge v7, v3, :cond_ac6

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v5, v9, 0x1

    if-ltz v9, :cond_ac2

    check-cast v4, Ljx1;

    instance-of v6, v4, Lvx1;

    if-eqz v6, :cond_ac0

    move-object v6, v4

    check-cast v6, Lvx1;

    iget-object v6, v6, Lvx1;->a:Ljava/lang/String;

    invoke-static {v6, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_ac0

    invoke-virtual {v1, v4}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v9, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_ac0
    move v9, v5

    goto :goto_a9c

    :cond_ac2
    invoke-static {}, Lj95;->n()V

    throw v10

    :cond_ac6
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_af4

    :cond_ace
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v9, v7

    :cond_ad3
    if-ge v9, v0, :cond_ae7

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v9, v9, 0x1

    move-object v2, v1

    check-cast v2, Lfy1;

    iget-object v2, v2, Lfy1;->a:Ljava/lang/String;

    invoke-static {v2, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ad3

    goto :goto_ae8

    :cond_ae7
    move-object v1, v10

    :goto_ae8
    check-cast v1, Lfy1;

    if-eqz v1, :cond_af4

    iget-object v0, v1, Lfy1;->b:Ld3k;

    invoke-virtual {v0, v10}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_af4
    :goto_af4
    sget-object v10, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_af6
    return-object v10

    :pswitch_af7
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu2;

    invoke-virtual {v0, v2, v1}, Lu2;->p0(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b0d
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu2;

    invoke-virtual {v0, v2, v1}, Lu2;->p0(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b23
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu2;

    invoke-virtual {v0, v2, v1}, Lu2;->p0(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b39
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu2;

    invoke-virtual {v0, v2, v1}, Lu2;->p0(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_b50
    .packed-switch 0x0
        :pswitch_b39
        :pswitch_b23
        :pswitch_b0d
        :pswitch_af7
        :pswitch_90e
        :pswitch_8f8
        :pswitch_8e2
        :pswitch_8bc
        :pswitch_85c
        :pswitch_81a
        :pswitch_77c
        :pswitch_58d
        :pswitch_553
        :pswitch_528
        :pswitch_4eb
        :pswitch_4a2
        :pswitch_457
        :pswitch_429
        :pswitch_3e6
        :pswitch_3a1
        :pswitch_35c
        :pswitch_317
        :pswitch_306
        :pswitch_2f5
        :pswitch_148
        :pswitch_138
        :pswitch_73
        :pswitch_2c
    .end packed-switch
.end method
