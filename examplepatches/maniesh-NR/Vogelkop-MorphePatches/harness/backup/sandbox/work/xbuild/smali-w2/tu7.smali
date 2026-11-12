.class public final synthetic Ltu7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Ltu7;->a:B

    iput-object p1, p0, Ltu7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lus7;Lc37;)V
    .registers 3

    const/4 p2, 0x4

    iput-byte p2, p0, Ltu7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltu7;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-byte v1, v0, Ltu7;->a:B

    const/16 v2, 0x8

    const/4 v3, 0x1

    const/4 v5, 0x0

    iget-object v0, v0, Ltu7;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_5da

    check-cast v0, Ll35;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-object v0, v0, Ll35;->b:Lfd;

    invoke-virtual {v0}, Lfd;->c()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1b
    check-cast v0, Ldda;

    move-object/from16 v1, p1

    check-cast v1, Lkea;

    iget-object v6, v0, Ldda;->y:Lei;

    if-nez v6, :cond_26

    const/4 v6, 0x0

    :cond_26
    iget-object v6, v6, Lei;->f:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/custom_views/SideMarginContainer;

    iget-object v7, v1, Lkea;->c:Ljava/util/Set;

    iget-object v8, v1, Lkea;->d:Ljava/util/List;

    iget-boolean v9, v1, Lkea;->a:Z

    invoke-interface {v7}, Ljava/util/Set;->size()I

    move-result v7

    if-le v7, v3, :cond_37

    move v2, v5

    :cond_37
    invoke-virtual {v6, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v1, Lkea;->b:Laea;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    if-eqz v1, :cond_b5

    if-ne v1, v3, :cond_af

    iget-object v1, v0, Ldda;->y:Lei;

    if-nez v1, :cond_4b

    const/4 v1, 0x0

    :cond_4b
    iget-object v1, v1, Lei;->d:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-virtual {v1, v3}, Lcom/google/android/material/chip/Chip;->setChecked(Z)V

    iget-object v1, v0, Ldda;->C:Ljy0;

    if-nez v1, :cond_57

    const/4 v1, 0x0

    :cond_57
    invoke-virtual {v0, v1}, Ldda;->M0(Lbca;)V

    if-eqz v9, :cond_1f1

    iget-object v0, v0, Ldda;->C:Ljy0;

    if-nez v0, :cond_62

    const/4 v4, 0x0

    goto :goto_63

    :cond_62
    move-object v4, v0

    :goto_63
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v8, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_71
    :goto_71
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_83

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    instance-of v6, v3, Lyda;

    if-eqz v6, :cond_71

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_71

    :cond_83
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_90
    if-ge v5, v2, :cond_a3

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v5, v5, 0x1

    check-cast v3, Lyda;

    new-instance v6, Lgy0;

    invoke-direct {v6, v3}, Lgy0;-><init>(Lyda;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_90

    :cond_a3
    new-instance v0, Lwjh;

    invoke-direct {v0, v1}, Lwjh;-><init>(Ljava/util/List;)V

    iput-object v0, v4, Ljy0;->f:Lwjh;

    invoke-virtual {v4}, Ljy0;->M()V

    goto/16 :goto_1f1

    :cond_af
    invoke-static {}, Lh9o;->p()V

    const/4 v4, 0x0

    goto/16 :goto_1f3

    :cond_b5
    iget-object v1, v0, Ldda;->y:Lei;

    if-nez v1, :cond_ba

    const/4 v1, 0x0

    :cond_ba
    iget-object v1, v1, Lei;->g:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-virtual {v1, v3}, Lcom/google/android/material/chip/Chip;->setChecked(Z)V

    iget-object v1, v0, Ldda;->A:Lztn;

    if-nez v1, :cond_c6

    const/4 v1, 0x0

    :cond_c6
    invoke-virtual {v0, v1}, Ldda;->M0(Lbca;)V

    if-eqz v9, :cond_1f1

    iget-object v0, v0, Ldda;->A:Lztn;

    if-nez v0, :cond_d0

    const/4 v0, 0x0

    :cond_d0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v8, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_de
    :goto_de
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_f0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    instance-of v8, v7, Lcom/opera/android/history/c;

    if-eqz v8, :cond_de

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_de

    :cond_f0
    new-instance v6, Lwjj;

    new-instance v7, Ljava/util/ArrayList;

    invoke-static {v1, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v7, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v8, v5

    :goto_100
    if-ge v8, v2, :cond_113

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Lcom/opera/android/history/c;

    new-instance v10, Lcom/opera/android/history/g;

    invoke-direct {v10, v9}, Lcom/opera/android/history/g;-><init>(Lcom/opera/android/history/c;)V

    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_100

    :cond_113
    invoke-direct {v6, v7}, Lwjj;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v5

    :goto_11b
    if-ge v2, v1, :cond_137

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v2, v2, 0x1

    check-cast v8, Lcom/opera/android/history/g;

    iget-object v9, v6, Lwjj;->b:Ljava/lang/Object;

    check-cast v9, Ljava/util/LinkedHashMap;

    iget-object v10, v8, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {v10}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getId()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v9, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11b

    :cond_137
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    const/16 v2, 0xb

    invoke-virtual {v1, v2, v5}, Ljava/util/Calendar;->set(II)V

    const/16 v2, 0xc

    invoke-virtual {v1, v2, v5}, Ljava/util/Calendar;->set(II)V

    const/16 v2, 0xd

    invoke-virtual {v1, v2, v5}, Ljava/util/Calendar;->set(II)V

    const/16 v2, 0xe

    invoke-virtual {v1, v2, v5}, Ljava/util/Calendar;->set(II)V

    const/4 v2, 0x6

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v7

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iget-object v10, v6, Lwjj;->a:Ljava/lang/Object;

    check-cast v10, Ljava/util/ArrayList;

    iget-object v11, v6, Lwjj;->c:Ljava/lang/Object;

    check-cast v11, Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v12

    const/4 v13, -0x1

    move-object v14, v9

    move v15, v13

    move-wide v8, v7

    move v7, v5

    :goto_16d
    if-ge v7, v12, :cond_1db

    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    add-int/lit8 v7, v7, 0x1

    move-object/from16 v4, v16

    check-cast v4, Lcom/opera/android/history/g;

    move/from16 v16, v3

    iget-object v3, v4, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {v3}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->b()J

    move-result-wide v18

    cmp-long v3, v18, v8

    if-gez v3, :cond_199

    :cond_185
    invoke-virtual {v1, v2, v13}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v8

    add-int/lit8 v15, v15, 0x1

    iget-object v3, v4, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {v3}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->b()J

    move-result-wide v18

    cmp-long v3, v18, v8

    if-ltz v3, :cond_185

    const/4 v14, 0x0

    :cond_199
    if-nez v14, :cond_1d4

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v5, v3, :cond_1aa

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1b3

    :cond_1aa
    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    :goto_1b3
    add-int/lit8 v5, v5, 0x1

    new-instance v14, Lytn;

    if-eqz v15, :cond_1cb

    move/from16 v2, v16

    if-eq v15, v2, :cond_1c8

    sget-object v2, Lztn;->m:Ljava/text/DateFormat;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v13

    invoke-virtual {v2, v13}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1cd

    :cond_1c8
    iget-object v2, v0, Lztn;->k:Ljava/lang/String;

    goto :goto_1cd

    :cond_1cb
    iget-object v2, v0, Lztn;->j:Ljava/lang/String;

    :goto_1cd
    invoke-direct {v14, v2}, Lytn;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v14, v3

    :cond_1d4
    invoke-interface {v14, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x6

    const/4 v3, 0x1

    const/4 v13, -0x1

    goto :goto_16d

    :cond_1db
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v5, v1, :cond_1ec

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v11, v5, v1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->clear()V

    :cond_1ec
    iput-object v6, v0, Lztn;->g:Lwjj;

    invoke-virtual {v0}, Lztn;->M()V

    :cond_1f1
    :goto_1f1
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1f3
    return-object v4

    :pswitch_1f4
    check-cast v0, Lpca;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Throwable;

    iget-object v1, v0, Lpca;->j:Lnak;

    :cond_1fc
    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0, v2}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1fc

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_211
    check-cast v0, Lhba;

    move-object/from16 v1, p1

    check-cast v1, Lb2c;

    iget-object v0, v0, Lhba;->b:Lt0g;

    invoke-virtual {v0, v1}, Lt0g;->setValue(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_21f
    check-cast v0, Ls6h;

    move-object/from16 v1, p1

    check-cast v1, Lgfh;

    instance-of v2, v1, Lffh;

    if-eqz v2, :cond_22c

    check-cast v1, Lffh;

    goto :goto_22d

    :cond_22c
    const/4 v1, 0x0

    :goto_22d
    if-eqz v1, :cond_236

    iget-object v1, v1, Lffh;->a:Lhmi;

    if-eqz v1, :cond_236

    iget-object v4, v1, Lhmi;->d:Lfmi;

    goto :goto_237

    :cond_236
    const/4 v4, 0x0

    :goto_237
    iget-object v1, v0, Ls6h;->b:Ljava/lang/Object;

    check-cast v1, Lfmi;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_24e

    iput-object v4, v0, Ls6h;->b:Ljava/lang/Object;

    if-eqz v4, :cond_24e

    iget-object v0, v0, Ls6h;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    :cond_24e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_251
    check-cast v0, Lne5;

    move-object/from16 v1, p1

    check-cast v1, Lpg;

    iget-object v0, v0, Lne5;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_25f
    if-ge v5, v2, :cond_26f

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v5, v5, 0x1

    check-cast v3, Lg5a;

    iget-object v3, v3, Lg5a;->b:Lpde;

    invoke-virtual {v3, v1}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_25f

    :cond_26f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_272
    check-cast v0, Ly4a;

    move-object/from16 v1, p1

    check-cast v1, Luzm;

    invoke-virtual {v0, v1}, Ly4a;->g(Luzm;)V

    iget-object v0, v0, Ly4a;->i:Lkotlin/jvm/functions/Function1;

    if-eqz v0, :cond_282

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_282
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_285
    check-cast v0, Ls3a;

    move-object/from16 v1, p1

    check-cast v1, Lmk7;

    invoke-interface {v1}, Lmk7;->s0()Ld5o;

    move-result-object v2

    invoke-virtual {v2}, Ld5o;->A()Lsh4;

    move-result-object v2

    iget-object v0, v0, Ls3a;->d:Lkotlin/jvm/functions/Function2;

    if-eqz v0, :cond_2a2

    invoke-interface {v1}, Lmk7;->s0()Ld5o;

    move-result-object v1

    iget-object v1, v1, Ld5o;->b:Ljava/lang/Object;

    check-cast v1, Lq3a;

    invoke-interface {v0, v2, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2a2
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2a5
    check-cast v0, Lks3;

    move-object/from16 v1, p1

    check-cast v1, Lei7;

    iget-object v2, v0, Lks3;->f:Ljava/lang/Object;

    check-cast v2, Lx0a;

    iget-object v2, v2, Lhi7;->e:Ligi;

    iget-object v2, v2, Ligi;->e:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    check-cast v2, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    iget-object v3, v0, Lks3;->g:Ljava/lang/Object;

    check-cast v3, Lld9;

    invoke-virtual {v2, v3}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v2, 0x0

    iput-object v2, v0, Lks3;->f:Ljava/lang/Object;

    iget-object v0, v0, Lks3;->i:Ljava/lang/Object;

    check-cast v0, Ly0a;

    invoke-virtual {v0, v1}, Ly0a;->run(Ljava/lang/Object;)V

    return-object v2

    :pswitch_2c9
    check-cast v0, Lu0a;

    move-object/from16 v1, p1

    check-cast v1, Li1a;

    iget-object v0, v0, Lu0a;->a:Lpde;

    sget-object v1, Ls0a;->a:Ls0a;

    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2d9
    check-cast v0, Lyo7;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {v1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    if-nez v2, :cond_2f0

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2f5

    :cond_2f0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2f5
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2f8
    check-cast v0, Lpr3;

    move-object/from16 v1, p1

    check-cast v1, Loy1;

    invoke-virtual {v0, v1}, Lpr3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_304
    check-cast v0, Lp04;

    sget-object v1, Lnz9;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v5, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-eqz v1, :cond_314

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-interface {v0, v1}, Lc1j;->b(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_314
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_317
    check-cast v0, Lzj9;

    move-object/from16 v1, p1

    check-cast v1, Lw6g;

    const-string v2, "listRecursively"

    invoke-virtual {v0, v1, v2}, Lzj9;->onPathResult(Lw6g;Ljava/lang/String;)Lw6g;

    move-result-object v0

    return-object v0

    :pswitch_324
    check-cast v0, Lwj9;

    move-object/from16 v1, p1

    check-cast v1, Llue;

    iget-object v0, v0, Lwj9;->b:Lfd;

    invoke-virtual {v0}, Lfd;->c()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_332
    check-cast v0, Lti9;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-object v0, v0, Lti9;->b:Lkng;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_347

    sget-wide v1, Lti9;->r:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    goto :goto_34d

    :cond_347
    sget-wide v1, Lti9;->s:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    :goto_34d
    iget-wide v3, v0, Lkng;->b:J

    cmp-long v3, v3, v1

    if-eqz v3, :cond_38b

    iput-wide v1, v0, Lkng;->b:J

    iget-object v1, v0, Lkng;->f:Loml;

    if-eqz v1, :cond_38b

    invoke-virtual {v1, v5}, Loml;->cancel(Z)Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, v0, Lkng;->d:J

    sub-long/2addr v1, v3

    iget-wide v3, v0, Lkng;->b:J

    cmp-long v3, v1, v3

    if-ltz v3, :cond_36d

    invoke-virtual {v0}, Lkng;->a()V

    goto :goto_38b

    :cond_36d
    iget-object v3, v0, Lkng;->a:Lumi;

    new-instance v4, Lpjg;

    const/4 v5, 0x4

    invoke-direct {v4, v0, v5}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v3, v4}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v3

    new-instance v4, Loml;

    invoke-direct {v4, v3}, Loml;-><init>(Lnml;)V

    iput-object v4, v0, Lkng;->f:Loml;

    iget-wide v5, v0, Lkng;->b:J

    sub-long v6, v5, v1

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v9, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v4 .. v9}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_38b
    :goto_38b
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_38e
    check-cast v0, Lmh9;

    move-object/from16 v1, p1

    check-cast v1, Lpam;

    iget-object v2, v1, Lpam;->b:Lki9;

    iget v3, v1, Lpam;->c:I

    iget v1, v1, Lpam;->d:I

    new-instance v4, Lpam;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v2, v3, v1}, Lpam;-><init>(Llh9;Lki9;II)V

    invoke-virtual {v0, v4}, Lmh9;->a(Lpam;)Lsam;

    move-result-object v0

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_3a9
    check-cast v0, Ldfe;

    move-object/from16 v1, p1

    check-cast v1, Lp1d;

    iget-object v1, v0, Ldfe;->a:[Ljava/lang/Object;

    iget v0, v0, Ldfe;->c:I

    :goto_3b3
    if-ge v5, v0, :cond_3bf

    aget-object v2, v1, v5

    check-cast v2, Lufd;

    invoke-interface {v2}, Lufd;->b()V

    add-int/lit8 v5, v5, 0x1

    goto :goto_3b3

    :cond_3bf
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3c2
    check-cast v0, Lg89;

    move-object/from16 v1, p1

    check-cast v1, Lfu1;

    const/4 v2, 0x0

    iput-object v2, v0, Lg89;->e:Lcom/google/android/gms/tasks/Task;

    iget-boolean v2, v0, Lg89;->i:Z

    if-eqz v2, :cond_3d4

    iput-object v1, v0, Lg89;->g:Lfu1;

    invoke-virtual {v0}, Lg89;->c()V

    :cond_3d4
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3d7
    check-cast v0, Lgx8;

    move-object/from16 v1, p1

    check-cast v1, Landroid/content/res/Configuration;

    iget-object v1, v0, Lgx8;->c:Lpde;

    invoke-virtual {v0}, Lgx8;->a()I

    move-result v2

    iget-object v3, v0, Lgx8;->b:Ldkf;

    const v4, 0x7f0408e3

    invoke-static {v4, v3, v5}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v3

    if-ge v2, v3, :cond_3ef

    move v2, v3

    :cond_3ef
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object v1, v0, Lgx8;->d:Lpde;

    invoke-virtual {v0}, Lgx8;->a()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_406
    check-cast v0, Lyr8;

    move-object/from16 v1, p1

    check-cast v1, Lifd;

    invoke-virtual {v0, v1}, Lyr8;->c(Lifd;)V

    const/16 v17, 0x0

    return-object v17

    :pswitch_412
    check-cast v0, Lkj8;

    move-object/from16 v1, p1

    check-cast v1, Landroid/view/View;

    iget-object v2, v0, Lkj8;->b:Lypd;

    iget-object v0, v0, Lkj8;->c:Ll2l;

    iget v0, v0, Ll2l;->b:I

    iget-object v3, v2, Lypd;->b:Ljava/lang/Object;

    check-cast v3, La21;

    iget-object v2, v2, Lypd;->c:Ljava/lang/Object;

    check-cast v2, Lz5l;

    iget-object v2, v2, Lz5l;->s:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lu3l;

    invoke-virtual {v3, v2, v0, v1}, La21;->r(Lu3l;ILandroid/view/View;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_434
    check-cast v0, Lp12;

    iget-object v1, v0, Lp12;->a:Ljava/lang/Object;

    check-cast v1, Ltjg;

    iget-object v2, v0, Lp12;->h:Ljava/lang/Object;

    check-cast v2, Lmig;

    move-object/from16 v3, p1

    check-cast v3, Lpg;

    sget-object v4, Lng;->a:Lng;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_450

    iget-object v0, v1, Ltjg;->o:Lxbf;

    invoke-virtual {v2, v0}, Lmig;->a(Lxbf;)V

    goto :goto_47e

    :cond_450
    sget-object v4, Log;->a:Log;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_481

    iget-object v0, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvjd;

    iget-object v0, v0, Lvjd;->I:Landroid/os/Bundle;

    if-eqz v0, :cond_46e

    const-string v3, "com.opera.android.media.AI_POD_ID"

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_470

    :cond_46e
    const/4 v5, 0x0

    move-object v4, v5

    :goto_470
    if-eqz v4, :cond_479

    invoke-virtual {v2}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->stop()V

    :cond_479
    iget-object v0, v1, Ltjg;->o:Lxbf;

    invoke-virtual {v2, v0}, Lmig;->b(Lxbf;)V

    :goto_47e
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_486

    :cond_481
    const/4 v5, 0x0

    invoke-static {}, Lh9o;->p()V

    move-object v4, v5

    :goto_486
    return-object v4

    :pswitch_487
    check-cast v0, Lmf8;

    move-object/from16 v1, p1

    check-cast v1, Lwa1;

    iget-wide v2, v0, Lmf8;->a:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v5, v2}, Lwa1;->x(ILjava/lang/Long;)V

    iget-object v2, v0, Lmf8;->b:[B

    const/4 v3, 0x1

    invoke-interface {v1, v3, v2}, Lwa1;->z(I[B)V

    iget-wide v2, v0, Lmf8;->c:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v2, 0x2

    invoke-interface {v1, v2, v0}, Lwa1;->x(ILjava/lang/Long;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4a9
    check-cast v0, Luk6;

    move-object/from16 v1, p1

    check-cast v1, Lorb;

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    const-string v3, "error"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4d9

    invoke-virtual {v1, v3}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    const-string v2, "code"

    iget-object v3, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "message"

    invoke-virtual {v1, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcqb;

    invoke-direct {v3, v2, v1}, Lcqb;-><init>(ILjava/lang/String;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v3}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Luk6;->n(Ltw7;)V

    goto :goto_4e3

    :cond_4d9
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v2, Lsw7;

    invoke-direct {v2, v1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Luk6;->n(Ltw7;)V

    :goto_4e3
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4e6
    check-cast v0, Lus7;

    move-object/from16 v1, p1

    check-cast v1, Lus7;

    if-ne v0, v1, :cond_4f1

    const-string v0, " > "

    goto :goto_4f3

    :cond_4f1
    const-string v0, "   "

    :goto_4f3
    instance-of v2, v1, Lyb5;

    const-string v3, ")"

    const-string v4, ", newCursorPosition="

    if-eqz v2, :cond_50e

    check-cast v1, Lyb5;

    iget-object v2, v1, Lyb5;->a:Lsf1;

    iget-object v2, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget v1, v1, Lyb5;->b:I

    const-string v5, "CommitTextCommand(text.length="

    :goto_509
    invoke-static {v2, v1, v5, v4, v3}, Lfki;->o(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_571

    :cond_50e
    instance-of v2, v1, Lr4j;

    if-eqz v2, :cond_521

    check-cast v1, Lr4j;

    iget-object v2, v1, Lr4j;->a:Lsf1;

    iget-object v2, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget v1, v1, Lr4j;->b:I

    const-string v5, "SetComposingTextCommand(text.length="

    goto :goto_509

    :cond_521
    instance-of v2, v1, Lq4j;

    if-eqz v2, :cond_52c

    check-cast v1, Lq4j;

    invoke-virtual {v1}, Lq4j;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_571

    :cond_52c
    instance-of v2, v1, Ld27;

    if-eqz v2, :cond_537

    check-cast v1, Ld27;

    invoke-virtual {v1}, Ld27;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_571

    :cond_537
    instance-of v2, v1, Le27;

    if-eqz v2, :cond_542

    check-cast v1, Le27;

    invoke-virtual {v1}, Le27;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_571

    :cond_542
    instance-of v2, v1, Ls4j;

    if-eqz v2, :cond_54d

    check-cast v1, Ls4j;

    invoke-virtual {v1}, Ls4j;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_571

    :cond_54d
    instance-of v2, v1, Le49;

    if-eqz v2, :cond_554

    const-string v1, "FinishComposingTextCommand()"

    goto :goto_571

    :cond_554
    instance-of v2, v1, Ly17;

    if-eqz v2, :cond_55b

    const-string v1, "DeleteAllCommand()"

    goto :goto_571

    :cond_55b
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    invoke-virtual {v1}, Ls15;->c()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_56b

    const-string v1, "{anonymous EditCommand}"

    :cond_56b
    const-string v2, "Unknown EditCommand: "

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_571
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_576
    check-cast v0, Lxv7;

    move-object/from16 v1, p1

    check-cast v1, Lndc;

    iget-object v0, v0, Lxv7;->b:Llgf;

    iget-object v0, v0, Llgf;->b:Ljava/lang/Object;

    check-cast v0, Lhp2;

    iget-wide v0, v0, Lhp2;->b:J

    invoke-static {v0, v1}, LJ/N;->MyxmjvsL(J)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_58a
    move-object v1, v0

    check-cast v1, Landroid/widget/FrameLayout;

    move-object/from16 v0, p1

    check-cast v0, Landroid/content/res/Configuration;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lm9f;->d(Landroid/content/Context;)I

    move-result v2

    const/4 v5, 0x0

    const/16 v6, 0xa

    const/4 v3, 0x0

    move v4, v2

    invoke-static/range {v1 .. v6}, Lp37;->o0(Landroid/view/View;IIIII)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5a4
    check-cast v0, Lx83;

    move-object/from16 v1, p1

    check-cast v1, Lkotlin/Pair;

    iget-object v1, v1, Lkotlin/Pair;->a:Ljava/lang/Object;

    iget-object v0, v0, Lx83;->A:Lhri;

    if-eq v1, v0, :cond_5b1

    move v3, v5

    :cond_5b1
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_5b6
    check-cast v0, Ligi;

    move-object/from16 v1, p1

    check-cast v1, Lxu7;

    iget-object v0, v0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    instance-of v3, v1, Luu7;

    if-nez v3, :cond_5c5

    move v2, v5

    :cond_5c5
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    instance-of v2, v1, Lvu7;

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    iget-object v2, v1, Lxu7;->b:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v1, v1, Lxu7;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_5da
    .packed-switch 0x0
        :pswitch_5b6
        :pswitch_5a4
        :pswitch_58a
        :pswitch_576
        :pswitch_4e6
        :pswitch_4a9
        :pswitch_487
        :pswitch_434
        :pswitch_412
        :pswitch_406
        :pswitch_3d7
        :pswitch_3c2
        :pswitch_3a9
        :pswitch_38e
        :pswitch_332
        :pswitch_324
        :pswitch_317
        :pswitch_304
        :pswitch_2f8
        :pswitch_2d9
        :pswitch_2c9
        :pswitch_2a5
        :pswitch_285
        :pswitch_272
        :pswitch_251
        :pswitch_21f
        :pswitch_211
        :pswitch_1f4
        :pswitch_1b
    .end packed-switch
.end method
