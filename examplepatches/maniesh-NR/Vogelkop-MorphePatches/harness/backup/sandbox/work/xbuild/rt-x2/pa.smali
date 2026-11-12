.class public final synthetic Lpa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lge4;Landroidx/camera/camera2/compat/quirk/AeFpsRangeLegacyQuirk;)V
    .registers 3

    const/4 p2, 0x4

    iput-byte p2, p0, Lpa;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpa;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lpa;->a:B

    iput-object p1, p0, Lpa;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Lpa;->a:B

    const/4 v1, 0x4

    const/16 v2, 0x12

    const/16 v3, 0x17

    const/16 v4, 0x14

    const/16 v5, 0x13

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v9, 0x98b

    const/4 v10, 0x1

    iget-object p0, p0, Lpa;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_366

    check-cast p0, Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase_Impl;

    new-instance v0, Lob2;

    invoke-direct {v0, p0}, Lob2;-><init>(Ly5i;)V

    return-object v0

    :pswitch_1e
    check-cast p0, [Ljava/lang/Object;

    new-instance v0, Lw4;

    invoke-direct {v0, p0, v10}, Lw4;-><init>(Ljava/lang/Object;B)V

    return-object v0

    :pswitch_26
    check-cast p0, Lk42;

    iget-object p0, p0, Lk42;->b:Lji;

    invoke-virtual {p0}, Lji;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzgf;

    new-instance v9, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    invoke-static {v6}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->a(I)[Ljava/lang/String;

    move-result-object v11

    iget-object v0, p0, Lzgf;->a:Landroid/util/SparseArray;

    invoke-virtual {v0, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/oauth2/OperaAccessSandbox;

    if-nez v1, :cond_62

    iget-object v1, p0, Lzgf;->b:Lumi;

    iget-object p0, p0, Lzgf;->c:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La55;

    new-instance v2, Lyf1;

    new-instance v3, Lkw3;

    invoke-direct {v3, v5}, Lkw3;-><init>(B)V

    invoke-direct {v2, v1, v3}, Lyf1;-><init>(Lumi;Lkw3;)V

    new-instance v1, Lcom/opera/android/oauth2/OperaAccessSandbox;

    invoke-direct {v1, p0, v2}, Lcom/opera/android/oauth2/OperaAccessSandbox;-><init>(La55;Lyf1;)V

    invoke-static {v1}, LJ/N;->Mvg__Uqh(Ljava/lang/Object;)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/opera/android/oauth2/OperaAccessSandbox;->d:J

    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_62
    move-object v14, v1

    const-string v10, "sandboxed_aria"

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v9 .. v14}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;-><init>(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/oauth2/OperaAccessSandbox;)V

    return-object v9

    :pswitch_6b
    check-cast p0, Lvsn;

    invoke-virtual {p0}, Lvsn;->g()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_73
    check-cast p0, Ls12;

    sget-object v0, Lhjm;->a:Lhjm;

    invoke-virtual {p0, v0}, Ld63;->finish(Lhjm;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_7d
    check-cast p0, Li12;

    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Li12;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0

    :pswitch_8d
    check-cast p0, Lm02;

    iput-object v7, p0, Lf12;->a:Ld12;

    iput-object v7, p0, Lf12;->b:Ljava/util/ArrayList;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_96
    check-cast p0, Lt02;

    invoke-virtual {p0, v7}, Lt02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_9e
    check-cast p0, Lcg1;

    new-instance v0, Lg77;

    invoke-direct {v0, v4}, Lg77;-><init>(B)V

    iget-object v1, p0, Lcg1;->b:Lpnc;

    invoke-virtual {v1}, Lpnc;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpna;

    iput-object v1, v0, Lg77;->b:Ljava/lang/Object;

    iget-object p0, p0, Lcg1;->a:Lt1;

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf3j;

    iget-object p0, p0, Lf3j;->e:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "/"

    invoke-static {p0, v1, v8}, Lkotlin/text/c;->l(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_c9

    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_c9
    invoke-static {v0, p0}, Lg77;->d(Lg77;Ljava/lang/String;)V

    new-instance p0, Lpw6;

    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lpw6;-><init>(B)V

    filled-new-array {p0}, [Lpw6;

    move-result-object p0

    iget-object v1, v0, Lg77;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-static {v1, p0}, Lo95;->s(Ljava/util/Collection;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Lg77;->f()Ljyb;

    move-result-object p0

    new-instance v0, Lwdo;

    iget-object v1, p0, Ljyb;->a:Ljava/lang/String;

    iget-object v2, p0, Ljyb;->b:Lpna;

    new-instance v4, Lqe6;

    invoke-direct {v4, p0, v3}, Lqe6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v2, v4}, Lwdo;-><init>(Ljava/lang/String;Lpna;Lqe6;)V

    return-object v0

    :pswitch_f0
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f3
    check-cast p0, Llfl;

    invoke-interface {p0}, Llfl;->y()Lkfl;

    move-result-object p0

    return-object p0

    :pswitch_fa
    check-cast p0, Lfa1;

    invoke-static {p0}, Lc26;->y(Llk7;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_102
    check-cast p0, Ln91;

    iget-object p0, p0, Ln91;->c:Lnx5;

    invoke-static {p0, v7}, Lsgb;->k(Lnx5;Ljava/util/concurrent/CancellationException;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_10c
    check-cast p0, Lmy0;

    iget-object v0, p0, Lmy0;->c:Ldw3;

    invoke-virtual {v0}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lekc;

    iget-object v1, p0, Lmy0;->a:Lcom/opera/android/BrowserActivity;

    new-instance v2, Lky0;

    invoke-direct {v2, p0, v10}, Lky0;-><init>(Lmy0;B)V

    new-instance p0, Lug;

    invoke-direct {p0, v2, v10}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-object v0

    :pswitch_126
    check-cast p0, Lcom/opera/android/aiassistant/db/AiAssistantDatabase_Impl;

    new-instance v0, Lrv0;

    invoke-direct {v0, p0}, Lrv0;-><init>(Ly5i;)V

    return-object v0

    :pswitch_12e
    check-cast p0, Lau0;

    new-instance v0, Lfu0;

    iget-object v1, p0, Lau0;->a:Lzpa;

    iget-object p0, p0, Lau0;->b:Lxt0;

    invoke-virtual {p0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lh66;

    if-nez v2, :cond_152

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lh66;

    const/16 v2, 0xe

    invoke-direct {v1, v9, v10, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v6, v10, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lh66;

    :cond_152
    invoke-direct {v0, v2}, Lfu0;-><init>(Lh66;)V

    return-object v0

    :pswitch_156
    check-cast p0, Ls6h;

    new-instance v0, Lujp;

    iget-object v1, p0, Ls6h;->a:Ljava/lang/Object;

    check-cast v1, Lzpa;

    iget-object p0, p0, Ls6h;->b:Ljava/lang/Object;

    check-cast p0, Lls0;

    const/4 v3, 0x6

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lao0;

    if-nez v4, :cond_17c

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lao0;

    invoke-direct {v1, v9, v10, v6}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v3, v10, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lao0;

    :cond_17c
    invoke-direct {v0, v2}, Lujp;-><init>(B)V

    return-object v0

    :pswitch_180
    check-cast p0, Lesg;

    new-instance v0, Lulp;

    iget-object v1, p0, Lesg;->b:Ljava/lang/Object;

    check-cast v1, Lzpa;

    iget-object p0, p0, Lesg;->c:Ljava/lang/Object;

    check-cast p0, Lkq0;

    invoke-virtual {p0, v1}, Lkq0;->x(Lzpa;)Ly56;

    invoke-direct {v0, v2}, Lulp;-><init>(B)V

    return-object v0

    :pswitch_193
    check-cast p0, Lhp0;

    new-instance v0, Lve0;

    iget-object v2, p0, Lhp0;->a:Lzpa;

    iget-object p0, p0, Lhp0;->b:Lz56;

    invoke-virtual {p0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lue0;

    if-nez v3, :cond_1b5

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lue0;

    invoke-direct {v3, v9, v10, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v8, v10, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v3, p0

    check-cast v3, Lue0;

    :cond_1b5
    invoke-direct {v0, v2, v3}, Lve0;-><init>(Lzpa;Lue0;)V

    return-object v0

    :pswitch_1b9
    check-cast p0, Lvo0;

    new-instance v0, Lnn0;

    iget-object v1, p0, Lvo0;->a:Lzpa;

    iget-object p0, p0, Lvo0;->b:Luo0;

    const/4 v2, 0x5

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmn0;

    if-nez v3, :cond_1dc

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lmn0;

    invoke-direct {v1, v9, v10, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v10, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v3, p0

    check-cast v3, Lmn0;

    :cond_1dc
    invoke-direct {v0, v3}, Lnn0;-><init>(Lmn0;)V

    return-object v0

    :pswitch_1e0
    check-cast p0, Lkn0;

    new-instance v0, Ly55;

    iget-object v2, p0, Lkn0;->a:Lzpa;

    iget-object p0, p0, Lkn0;->b:Lin0;

    const/16 v3, 0x1f

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lri0;

    if-nez v4, :cond_203

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lri0;

    invoke-direct {v2, v9, v10, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v3, v10, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lri0;

    :cond_203
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_207
    check-cast p0, Lbpd;

    new-instance v0, Lqs7;

    iget-object v1, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast v1, Lzpa;

    iget-object p0, p0, Lbpd;->c:Ljava/lang/Object;

    check-cast p0, Lhm0;

    invoke-virtual {p0, v1}, Lhm0;->x(Lzpa;)Lbp0;

    invoke-direct {v0, v5}, Lqs7;-><init>(B)V

    return-object v0

    :pswitch_21a
    check-cast p0, Lnd0;

    new-instance v0, Lld0;

    iget-object v1, p0, Lnd0;->a:Lzpa;

    iget-object p0, p0, Lnd0;->b:Lmd0;

    invoke-virtual {p0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkd0;

    if-nez v2, :cond_23e

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lkd0;

    const/16 v3, 0xb

    invoke-direct {v2, v9, v10, v3}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v8, v10, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lkd0;

    :cond_23e
    invoke-direct {v0, v1, v2}, Lld0;-><init>(Lzpa;Lkd0;)V

    return-object v0

    :pswitch_242
    check-cast p0, Lld0;

    new-instance v0, Lid0;

    iget-object v1, p0, Lld0;->a:Lzpa;

    iget-object p0, p0, Lld0;->b:Lkd0;

    const/16 v2, 0x9

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lhd0;

    if-nez v3, :cond_265

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzpa;->y()Lhd0;

    move-result-object v1

    invoke-virtual {p0, v2, v10, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v3, p0

    check-cast v3, Lhd0;

    :cond_265
    invoke-direct {v0, v3}, Lid0;-><init>(Lhd0;)V

    return-object v0

    :pswitch_269
    check-cast p0, Lvc0;

    new-instance v0, Lulp;

    iget-object v1, p0, Lvc0;->a:Lzpa;

    iget-object p0, p0, Lvc0;->b:Luc0;

    invoke-virtual {p0, v1}, Luc0;->x(Lzpa;)Lvq0;

    invoke-direct {v0, v5}, Lulp;-><init>(B)V

    return-object v0

    :pswitch_278
    check-cast p0, Lge4;

    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    check-cast p0, Lma4;

    invoke-virtual {p0, v0}, Lma4;->c(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/util/Range;

    if-eqz p0, :cond_303

    array-length v0, p0

    if-eqz v0, :cond_303

    array-length v0, p0

    :goto_28a
    if-ge v8, v0, :cond_303

    aget-object v1, p0, v8

    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    const/16 v5, 0x3e8

    if-lt v4, v5, :cond_2b7

    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    div-int/2addr v2, v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :cond_2b7
    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    if-lt v4, v5, :cond_2d2

    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    div-int/2addr v1, v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    :cond_2d2
    new-instance v1, Landroid/util/Range;

    invoke-direct {v1, v3, v2}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_300

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x1e

    if-ne v2, v3, :cond_300

    if-eqz v7, :cond_2ff

    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    invoke-virtual {v7}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    if-ge v2, v3, :cond_300

    :cond_2ff
    move-object v7, v1

    :cond_300
    add-int/lit8 v8, v8, 0x1

    goto :goto_28a

    :cond_303
    return-object v7

    :pswitch_304
    check-cast p0, Lqw;

    new-instance v0, Lg77;

    invoke-direct {v0, v4}, Lg77;-><init>(B)V

    iget-object v1, p0, Lqw;->b:Lpna;

    iput-object v1, v0, Lg77;->b:Ljava/lang/Object;

    iget-object p0, p0, Lqw;->a:Lnle;

    iget-object p0, p0, Lnle;->c:Ljava/lang/String;

    invoke-static {v0, p0}, Lg77;->d(Lg77;Ljava/lang/String;)V

    new-instance p0, Lpw6;

    invoke-direct {p0, v10}, Lpw6;-><init>(B)V

    filled-new-array {p0}, [Lpw6;

    move-result-object p0

    iget-object v1, v0, Lg77;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-static {v1, p0}, Lo95;->s(Ljava/util/Collection;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Lg77;->f()Ljyb;

    move-result-object p0

    new-instance v0, Lbgo;

    iget-object v1, p0, Ljyb;->a:Ljava/lang/String;

    iget-object v2, p0, Ljyb;->b:Lpna;

    new-instance v4, Lqe6;

    invoke-direct {v4, p0, v3}, Lqe6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v2, v4}, Lbgo;-><init>(Ljava/lang/String;Lpna;Lqe6;)V

    return-object v0

    :pswitch_339
    check-cast p0, Lru;

    new-instance v0, Ltab;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    iget p0, p0, Lru;->A:I

    invoke-direct {v0, v1, p0}, Ltab;-><init>(Landroid/content/Context;I)V

    return-object v0

    :pswitch_347
    check-cast p0, Lxl;

    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Lxl;->k:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "ad_debug_imps"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0

    :pswitch_359
    check-cast p0, Lwc1;

    if-eqz p0, :cond_362

    iget-object p0, p0, Lwc1;->a:Landroid/webkit/WebView;

    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    :cond_362
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_366
    .packed-switch 0x0
        :pswitch_359
        :pswitch_347
        :pswitch_339
        :pswitch_304
        :pswitch_278
        :pswitch_269
        :pswitch_242
        :pswitch_21a
        :pswitch_207
        :pswitch_1e0
        :pswitch_1b9
        :pswitch_193
        :pswitch_180
        :pswitch_156
        :pswitch_12e
        :pswitch_126
        :pswitch_10c
        :pswitch_102
        :pswitch_fa
        :pswitch_f3
        :pswitch_f0
        :pswitch_9e
        :pswitch_96
        :pswitch_8d
        :pswitch_7d
        :pswitch_73
        :pswitch_6b
        :pswitch_26
        :pswitch_1e
    .end packed-switch
.end method
