.class public final synthetic Lzbe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lzbe;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 6
    iput-byte p2, p0, Lzbe;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte p0, p0, Lzbe;->a:B

    const-string v0, ", "

    const/4 v1, -0x1

    const/16 v2, 0x98b

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    const-wide/16 v6, 0x1

    const/4 v8, 0x1

    packed-switch p0, :pswitch_data_27a

    check-cast p1, Lcv0;

    iget-object p0, p1, Lcv0;->a:Lbv0;

    invoke-virtual {p0, v5, v8, v6, v7}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a
    check-cast p1, Lck0;

    invoke-virtual {p1}, Lck0;->e()Lhi0;

    move-result-object p0

    iget-object p0, p0, Lhi0;->b:Lfi0;

    const/16 p1, 0xe

    invoke-virtual {p0, p1, v8, v6, v7}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2a
    check-cast p1, Lck0;

    invoke-virtual {p1}, Lck0;->e()Lhi0;

    move-result-object p0

    iget-object p0, p0, Lhi0;->b:Lfi0;

    const/16 p1, 0xf

    invoke-virtual {p0, p1, v8, v6, v7}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3a
    check-cast p1, Lye0;

    iget-object p0, p1, Lye0;->a:Lxe0;

    invoke-virtual {p0, v8, v8, v6, v7}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_44
    check-cast p1, Landroid/util/Pair;

    new-instance p0, Lv90;

    invoke-direct {p0, v2, v1, v4}, Ljf0;-><init>(III)V

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lw90;

    if-nez v0, :cond_53

    move v1, v5

    goto :goto_54

    :cond_53
    move v1, v8

    :goto_54
    invoke-virtual {p0, v5, v1, v0}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6b

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_68

    move v5, v8

    :cond_68
    invoke-virtual {p0, v8, v5, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6b
    return-object p0

    :pswitch_6c
    check-cast p1, Lzg0;

    iget-object p0, p1, Lzg0;->a:Lyg0;

    invoke-virtual {p0, v5, v8, v6, v7}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_76
    check-cast p1, Landroid/util/Pair;

    new-instance p0, Lym0;

    invoke-direct {p0, v2, v1, v4}, Ljf0;-><init>(III)V

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lan0;

    if-nez v0, :cond_85

    move v1, v5

    goto :goto_86

    :cond_85
    move v1, v8

    :goto_86
    invoke-virtual {p0, v5, v1, v0}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Lan0;

    if-eqz p1, :cond_90

    move v5, v8

    :cond_90
    invoke-virtual {p0, v8, v5, p1}, Ljf0;->q(IILjava/lang/Object;)V

    return-object p0

    :pswitch_94
    check-cast p1, Lel0;

    iget-object p0, p1, Lel0;->a:Ldl0;

    invoke-virtual {p0, v5, v8, v6, v7}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_9e
    check-cast p1, Lnk0;

    iget-object p0, p1, Lnk0;->a:Lmk0;

    invoke-virtual {p0, v5, v8, v6, v7}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a8
    check-cast p1, Lnk0;

    iget-object p0, p1, Lnk0;->a:Lmk0;

    invoke-virtual {p0, v4, v8, v6, v7}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b2
    check-cast p1, Lnk0;

    iget-object p0, p1, Lnk0;->a:Lmk0;

    invoke-virtual {p0, v8, v8, v6, v7}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_bc
    check-cast p1, Lzg0;

    iget-object p0, p1, Lzg0;->a:Lyg0;

    invoke-virtual {p0, v8, v8, v6, v7}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c6
    check-cast p1, Lrt0;

    iget-object p0, p1, Lrt0;->a:Lqt0;

    invoke-virtual {p0, v5, v8, v6, v7}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d0
    check-cast p1, Ln6j;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d5
    check-cast p1, Lw0f;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_da
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_e2
    check-cast p1, Li8e;

    new-instance v3, Lnf8;

    const/16 p0, 0x15

    invoke-direct {v3, p0}, Lnf8;-><init>(B)V

    sget-object p0, Lc37;->d:Lrhk;

    sget-object v4, Lxwb;->a:Lxwb;

    sget-object v5, Ll08;->a:Ll08;

    new-instance v0, Lqc3;

    const-class v1, Lece;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    invoke-static {v0, p1}, Lj7c;->m(Lqc3;Li8e;)Ltlj;

    move-result-object v1

    const-class v2, Lzth;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v2

    invoke-virtual {v0, v2}, Lqc3;->a(Litb;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljtb;->a(Litb;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x3a

    const-string v3, ""

    invoke-static {v0, v2, v3, v2, p0}, Lj7c;->p(Ljava/lang/StringBuilder;CLjava/lang/String;CLrhk;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0, v1}, Li8e;->b(Ljava/lang/String;Lvab;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_121
    check-cast p1, Lwye;

    iget-object p0, p1, Lwye;->T:Levf;

    if-eqz p0, :cond_12c

    check-cast p0, Ls3a;

    invoke-virtual {p0}, Ls3a;->c()V

    :cond_12c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12f
    check-cast p1, Lwye;

    iget-object p0, p1, Lwye;->u:Lm3c;

    :try_start_133
    invoke-virtual {p1}, Lwye;->Z()Z

    move-result v0

    if-eqz v0, :cond_13c

    invoke-virtual {p1, v8}, Lwye;->A1(Z)V
    :try_end_13c
    .catchall {:try_start_133 .. :try_end_13c} :catchall_13f

    :cond_13c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_13f
    move-exception v0

    move-object p1, v0

    invoke-virtual {p0, p1}, Lm3c;->Y(Ljava/lang/Throwable;)V

    throw v3

    :pswitch_145
    move-object v4, p1

    check-cast v4, Ln6j;

    sget-object p0, Lnxe;->a:[Lnxe;

    const p0, 0x7f0a0b61

    const p1, 0x7f0a0b60

    filled-new-array {p0, p1}, [I

    move-result-object v7

    const/4 v8, 0x0

    const/16 v9, 0x38

    const/4 v5, 0x1

    const v6, 0x7f141039

    invoke-static/range {v4 .. v9}, Ln6j;->d(Ln6j;II[ILjava/util/List;I)V

    const p0, 0x7f0a02e3

    const p1, 0x7f0a02e2

    filled-new-array {p0, p1}, [I

    move-result-object v7

    const/4 v5, 0x2

    const v6, 0x7f14101d

    invoke-static/range {v4 .. v9}, Ln6j;->d(Ln6j;II[ILjava/util/List;I)V

    const/4 v9, 0x0

    const/16 v10, 0x38

    const/4 v5, 0x3

    const v6, 0x7f141038

    const v7, 0x7f0a0b11

    const/4 v8, 0x0

    invoke-static/range {v4 .. v10}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v5, 0x4

    const v6, 0x7f140fb4

    const v7, 0x7f0a02b9

    invoke-static/range {v4 .. v10}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const p0, 0x7f0a07d8

    const p1, 0x7f0a05dd

    filled-new-array {p0, p1}, [I

    move-result-object v7

    const/4 v8, 0x0

    const/16 v9, 0x38

    const/4 v5, 0x5

    const v6, 0x7f14101b

    invoke-static/range {v4 .. v9}, Ln6j;->d(Ln6j;II[ILjava/util/List;I)V

    const p0, 0x7f0a0920

    const p1, 0x7f0a0b99

    filled-new-array {p0, p1}, [I

    move-result-object v7

    const/4 v5, 0x6

    const v6, 0x7f141036

    invoke-static/range {v4 .. v9}, Ln6j;->d(Ln6j;II[ILjava/util/List;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1af
    check-cast p1, Love;

    iget-object p0, p1, Love;->a:Lq4b;

    if-eqz p0, :cond_1b8

    invoke-virtual {p0}, Lq4b;->invoke()Ljava/lang/Object;

    :cond_1b8
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1bb
    move-object v0, p1

    check-cast v0, Ln6j;

    const/4 v5, 0x0

    const/16 v6, 0x38

    const/4 v1, 0x1

    const v2, 0x7f140fcd

    const v3, 0x7f0a08a2

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x2

    const v2, 0x7f140592

    const v3, 0x7f0a02ec

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x3

    const v2, 0x7f140965

    const v3, 0x7f0a061c

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x4

    const v2, 0x7f141019

    const v3, 0x7f0a082b

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const p0, 0x7f0a08c0

    const p1, 0x7f0a0aaf

    filled-new-array {p0, p1}, [I

    move-result-object v3

    const/4 v4, 0x0

    const/16 v5, 0x38

    const/4 v1, 0x5

    const v2, 0x7f140591

    invoke-static/range {v0 .. v5}, Ln6j;->d(Ln6j;II[ILjava/util/List;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_201
    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    const-string p0, "enable_newsfeed"

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_20e
    check-cast p1, Lbef;

    invoke-static {}, Lbef;->e()Lbef;

    move-result-object p0

    if-ne p1, p0, :cond_229

    goto :goto_228

    :pswitch_217
    check-cast p1, Lf8f;

    invoke-static {}, Lf8f;->d()Lf8f;

    move-result-object p0

    if-ne p1, p0, :cond_229

    goto :goto_228

    :pswitch_220
    check-cast p1, Lnok;

    invoke-static {}, Lnok;->c()Lnok;

    move-result-object p0

    if-ne p1, p0, :cond_229

    :goto_228
    move v5, v8

    :cond_229
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_22e
    check-cast p1, Laqb;

    iput-boolean v8, p1, Laqb;->c:Z

    iput-boolean v5, p1, Laqb;->n:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_237
    check-cast p1, Lyke;

    throw v3

    :pswitch_23a
    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    instance-of v1, p0, [B

    if-eqz v1, :cond_24d

    check-cast p0, [B

    const/16 v1, 0x38

    invoke-static {p0, v0, v3, v1}, Le82;->w([BLjava/lang/String;Lkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object p0

    goto :goto_255

    :cond_24d
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :goto_255
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "  "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lhsg;

    iget-object p1, p1, Lhsg;->a:Ljava/lang/String;

    const-string v1, " = "

    invoke-static {v0, p1, v1, p0}, Lp3p;->n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_26b
    check-cast p1, Ltzf;

    iget p0, p1, Ltzf;->b:I

    iget p1, p1, Ltzf;->c:I

    const-string v1, "["

    const-string v2, ")"

    invoke-static {p0, p1, v1, v0, v2}, Lfki;->o(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_27a
    .packed-switch 0x0
        :pswitch_26b
        :pswitch_23a
        :pswitch_237
        :pswitch_22e
        :pswitch_220
        :pswitch_217
        :pswitch_20e
        :pswitch_201
        :pswitch_1bb
        :pswitch_1af
        :pswitch_145
        :pswitch_12f
        :pswitch_121
        :pswitch_e2
        :pswitch_da
        :pswitch_d5
        :pswitch_d0
        :pswitch_c6
        :pswitch_bc
        :pswitch_b2
        :pswitch_a8
        :pswitch_9e
        :pswitch_94
        :pswitch_76
        :pswitch_6c
        :pswitch_44
        :pswitch_3a
        :pswitch_2a
        :pswitch_1a
    .end packed-switch
.end method
