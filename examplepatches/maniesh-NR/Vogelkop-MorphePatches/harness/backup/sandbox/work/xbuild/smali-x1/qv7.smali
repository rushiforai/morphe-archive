.class public final synthetic Lqv7;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Lqv7;->a:B

    invoke-direct/range {p0 .. p6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 24

    move-object/from16 v0, p0

    iget-byte v1, v0, Lqv7;->a:B

    const/16 v2, 0x8

    const-wide/16 v3, 0x1

    sget-object v5, Llqm;->u:Llqm;

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x3

    const/4 v9, 0x0

    packed-switch v1, :pswitch_data_566

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ljbc;

    check-cast v0, Lnbc;

    iget-object v1, v0, Lnbc;->e:Lrlh;

    iget-object v1, v1, Lrlh;->a:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lvtm;

    if-eqz v1, :cond_32

    iget-object v1, v1, Lvtm;->a:Lec;

    if-eqz v1, :cond_32

    iget-object v0, v0, Lnbc;->c:Lkbc;

    iget-object v0, v0, Lkbc;->a:Lkotlin/jvm/functions/Function2;

    iget-object v2, v1, Lec;->b:Lgpm;

    iget-object v1, v1, Lec;->c:Lcc;

    invoke-interface {v0, v2, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_32
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_35
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ljbc;

    check-cast v0, Lnbc;

    iget-object v1, v0, Lnbc;->c:Lkbc;

    iget-object v1, v1, Lkbc;->a:Lkotlin/jvm/functions/Function2;

    iget-object v0, v0, Lnbc;->d:Lil5;

    iget-object v0, v0, Lil5;->c:Lgpm;

    sget-object v2, Lcc;->b:Lcc;

    invoke-interface {v1, v0, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4b
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ljbc;

    check-cast v0, Lnbc;

    iget-object v1, v0, Lnbc;->e:Lrlh;

    iget-object v1, v1, Lrlh;->a:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lvtm;

    if-eqz v1, :cond_6a

    iget-object v0, v0, Lnbc;->c:Lkbc;

    iget-object v0, v0, Lkbc;->a:Lkotlin/jvm/functions/Function2;

    iget-object v1, v1, Lvtm;->b:Lec;

    iget-object v2, v1, Lec;->b:Lgpm;

    iget-object v1, v1, Lec;->c:Lcc;

    invoke-interface {v0, v2, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6d
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lp7c;

    check-cast v0, Lu7c;

    iget-object v0, v0, Lu7c;->c:Lq7c;

    iget-object v0, v0, Lq7c;->a:Ln7i;

    invoke-virtual {v0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7d
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lp7c;

    check-cast v0, Lu7c;

    iget-object v1, v0, Lu7c;->j:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_a6

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v9, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lu7c;->e()Lunb;

    move-result-object v1

    new-instance v2, Lnna;

    const/16 v3, 0x13

    invoke-direct {v2, v0, v3}, Lnna;-><init>(Ljava/lang/Object;B)V

    check-cast v1, Lxob;

    invoke-virtual {v1, v2}, Lxob;->s(Lkotlin/jvm/functions/Function1;)Lxb7;

    :cond_a6
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a9
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lp7c;

    check-cast v0, Lu7c;

    invoke-virtual {v0}, Lu7c;->e()Lunb;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b5
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lp7c;

    check-cast v0, Lu7c;

    iget-object v1, v0, Lu7c;->i:Lnak;

    :cond_bd
    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lfum;

    invoke-virtual {v1, v0, v9}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_bd

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_cd
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    move-object v1, v0

    check-cast v1, Lpca;

    iget-object v2, v1, Lpca;->r:Lnak;

    :cond_d6
    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lsek;

    invoke-virtual {v2, v0, v9}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d6

    iget-object v0, v1, Lpca;->u:Ld3k;

    if-eqz v0, :cond_103

    invoke-virtual {v0}, Lxob;->isActive()Z

    move-result v2

    if-nez v2, :cond_ee

    move-object v0, v9

    :cond_ee
    if-eqz v0, :cond_103

    iput-object v9, v1, Lpca;->u:Ld3k;

    invoke-virtual {v0, v9}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    invoke-static {v1}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object v2

    new-instance v3, Lp71;

    const/16 v4, 0xd

    invoke-direct {v3, v0, v1, v9, v4}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v2, v9, v9, v3, v8}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_103
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_106
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    check-cast v0, Lpca;

    iget-object v0, v0, Lpca;->p:Lnak;

    invoke-virtual {v0, v9}, Lnak;->j(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_114
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    check-cast v0, Lpca;

    iget-object v0, v0, Lpca;->p:Lnak;

    invoke-virtual {v0, v9}, Lnak;->j(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_122
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    check-cast v0, Lpca;

    iget-object v1, v0, Lpca;->n:Lnak;

    :cond_12a
    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lfum;

    invoke-virtual {v1, v0, v9}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12a

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_13a
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    check-cast v0, Lpca;

    iget-object v0, v0, Lpca;->c:Lica;

    iget-object v0, v0, Lica;->a:Ln7i;

    invoke-virtual {v0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_14a
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    move-object v1, v0

    check-cast v1, Lpca;

    iget-object v0, v1, Lpca;->k:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_18c

    iget-object v2, v1, Lpca;->j:Lnak;

    :cond_163
    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v0, v3}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_163

    invoke-static {v1}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object v0

    new-instance v2, Ljca;

    invoke-direct {v2, v1, v9, v7}, Ljca;-><init>(Lpca;Lmt5;B)V

    invoke-static {v0, v9, v9, v2, v8}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v0

    new-instance v2, Ltu7;

    const/16 v3, 0x1b

    invoke-direct {v2, v1, v3}, Ltu7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lxob;->s(Lkotlin/jvm/functions/Function1;)Lxb7;

    :cond_18c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_18f
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    check-cast v0, Lpca;

    iget-object v1, v0, Lpca;->t:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lhz5;

    if-eqz v2, :cond_1f2

    iget-object v3, v2, Lhz5;->b:Lnz5;

    iget-object v3, v3, Lnz5;->f:Lec;

    if-eqz v3, :cond_1f2

    iget-object v4, v3, Lec;->b:Lgpm;

    sget-object v5, Lje8;->g:Lje8;

    iget-object v2, v2, Lhz5;->a:Ljava/lang/String;

    iget-object v6, v0, Lpca;->d:Lt3e;

    new-instance v7, Lwa8;

    invoke-direct {v7, v5, v2}, Lwa8;-><init>(Lje8;Ljava/lang/String;)V

    check-cast v6, Lh5e;

    invoke-virtual {v6, v7}, Lh5e;->t(Lfb8;)V

    invoke-virtual {v1, v9}, Lnak;->j(Ljava/lang/Object;)V

    iget-object v1, v0, Lpca;->c:Lica;

    iget-object v1, v1, Lica;->b:Lo7i;

    iget-object v2, v3, Lec;->c:Lcc;

    invoke-virtual {v1, v4, v2}, Lo7i;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {v1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1f2

    iget-object v0, v0, Lpca;->n:Lnak;

    :cond_1d0
    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lfum;

    sget-object v3, Lahk;->d0:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lshk;

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    new-instance v6, Ludk;

    invoke-direct {v6, v3, v5}, Ludk;-><init>(Lshk;Ljava/util/List;)V

    invoke-static {v6, v1}, Lhn9;->v(Lsdk;Ljava/lang/Throwable;)Ldum;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d0

    :cond_1f2
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1f5
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    check-cast v0, Lpca;

    iget-object v1, v0, Lpca;->t:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhz5;

    if-eqz v1, :cond_215

    sget-object v2, Lje8;->f:Lje8;

    iget-object v1, v1, Lhz5;->a:Ljava/lang/String;

    iget-object v0, v0, Lpca;->d:Lt3e;

    new-instance v3, Lwa8;

    invoke-direct {v3, v2, v1}, Lwa8;-><init>(Lje8;Ljava/lang/String;)V

    check-cast v0, Lh5e;

    invoke-virtual {v0, v3}, Lh5e;->t(Lfb8;)V

    :cond_215
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_218
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    check-cast v0, Lpca;

    iget-object v0, v0, Lpca;->t:Lnak;

    invoke-virtual {v0, v9}, Lnak;->j(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_226
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Leaa;

    iget-object v0, v0, Leaa;->c:Lg8j;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "https://forums.opera.com/category/20/opera-for-android"

    invoke-static {v0, v5, v6}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput v8, v0, Lvx3;->b:I

    invoke-static {v0, v7, v0}, Lo18;->t(Lvx3;ZLvx3;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_23d
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Leaa;

    iget-object v1, v0, Leaa;->b:Lorm;

    check-cast v1, Lx5f;

    iget-boolean v2, v1, Lx5f;->h:Z

    if-eqz v2, :cond_25d

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v9

    invoke-static {v2, v9}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v2

    iget-object v2, v2, Lhi0;->b:Lfi0;

    const/16 v10, 0xa

    invoke-virtual {v2, v10, v7, v3, v4}, Ljf0;->p(IIJ)V

    invoke-virtual {v1, v9}, Lx5f;->U0(Lx56;)V

    :cond_25d
    iget-object v0, v0, Leaa;->c:Lg8j;

    iget-object v0, v0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    const-string v2, "."

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x6

    invoke-static {v1, v3, v6, v4}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-static {v0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld3j;

    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Ld3j;->c(I)Lc3j;

    move-result-object v0

    if-eqz v0, :cond_296

    iget-object v0, v0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    goto :goto_2ad

    :cond_296
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v3, "https"

    invoke-virtual {v0, v3}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v3, "bugs.opera.com"

    invoke-virtual {v0, v3}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v3, "/wizard/mobile"

    invoke-virtual {v0, v3}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    :goto_2ad
    const-string v3, "pl"

    const-string v4, "Android"

    invoke-virtual {v0, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "v"

    invoke-virtual {v0, v4, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "build"

    invoke-virtual {v0, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "mo"

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "rel"

    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "install_id"

    invoke-static {}, Ltz5;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v5, v6}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput v8, v0, Lvx3;->b:I

    invoke-static {v0, v7, v0}, Lo18;->t(Lvx3;ZLvx3;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_323
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Leaa;

    iget-object v1, v0, Leaa;->b:Lorm;

    check-cast v1, Lx5f;

    iget-boolean v5, v1, Lx5f;->h:Z

    if-eqz v5, :cond_341

    iget-object v5, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-static {v5, v6}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v5

    iget-object v5, v5, Lhi0;->b:Lfi0;

    invoke-virtual {v5, v2, v7, v3, v4}, Ljf0;->p(IIJ)V

    invoke-virtual {v1, v6}, Lx5f;->U0(Lx56;)V

    :cond_341
    iget-object v0, v0, Leaa;->c:Lg8j;

    iget-object v0, v0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    new-instance v1, Lrxh;

    const v2, 0x7f140fdc

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    const-string v2, "https://www.opera.com/help/mobile/android"

    invoke-static {v0, v2, v1}, Lcom/opera/android/FullscreenWebActivity;->A0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_355
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Leaa;

    iget-object v0, v0, Leaa;->c:Lg8j;

    invoke-virtual {v0}, Lg8j;->h()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_361
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lcaa;

    invoke-virtual {v0}, Lryl;->g0()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_36b
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lah9;

    iget-object v0, v0, Lah9;->v:Lvg9;

    invoke-static {v0}, Lvg9;->b1(Lvg9;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_37a
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lbg9;

    iget-object v1, v0, Lbg9;->c:Ltee;

    iget-object v3, v0, Lbg9;->d:Ltee;

    iget-object v4, v0, Lbg9;->a:Lgg9;

    invoke-virtual {v4}, Lgg9;->f()Lvg9;

    move-result-object v5

    const-wide v14, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    if-nez v5, :cond_3e2

    iget-object v5, v3, Ltee;->b:[Ljava/lang/Object;

    iget-object v7, v3, Ltee;->a:[J

    array-length v9, v7

    add-int/lit8 v9, v9, -0x2

    if-ltz v9, :cond_498

    move v8, v6

    const/16 p0, 0x7

    const-wide/16 v16, 0x80

    :goto_39d
    aget-wide v10, v7, v8

    const-wide/16 v18, 0xff

    not-long v12, v10

    shl-long v12, v12, p0

    and-long/2addr v12, v10

    and-long/2addr v12, v14

    cmp-long v12, v12, v14

    if-eqz v12, :cond_3d9

    sub-int v12, v8, v9

    not-int v12, v12

    ushr-int/lit8 v12, v12, 0x1f

    rsub-int/lit8 v12, v12, 0x8

    move v13, v6

    :goto_3b2
    if-ge v13, v12, :cond_3d4

    and-long v20, v10, v18

    cmp-long v20, v20, v16

    if-gez v20, :cond_3cc

    shl-int/lit8 v20, v8, 0x3

    add-int v20, v20, v13

    aget-object v20, v5, v20

    move-wide/from16 v21, v14

    move-object/from16 v14, v20

    check-cast v14, Lnf9;

    sget-object v15, Lqg9;->c:Lqg9;

    invoke-interface {v14, v15}, Lnf9;->r(Lqg9;)V

    goto :goto_3ce

    :cond_3cc
    move-wide/from16 v21, v14

    :goto_3ce
    shr-long/2addr v10, v2

    add-int/lit8 v13, v13, 0x1

    move-wide/from16 v14, v21

    goto :goto_3b2

    :cond_3d4
    move-wide/from16 v21, v14

    if-ne v12, v2, :cond_498

    goto :goto_3db

    :cond_3d9
    move-wide/from16 v21, v14

    :goto_3db
    if-eq v8, v9, :cond_498

    add-int/lit8 v8, v8, 0x1

    move-wide/from16 v14, v21

    goto :goto_39d

    :cond_3e2
    move-wide/from16 v21, v14

    const/16 p0, 0x7

    const-wide/16 v16, 0x80

    const-wide/16 v18, 0xff

    iget-boolean v8, v5, Lb8e;->n:Z

    if-eqz v8, :cond_498

    invoke-virtual {v1, v5}, Ltee;->c(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3f7

    invoke-virtual {v5}, Lvg9;->Z0()V

    :cond_3f7
    invoke-virtual {v5}, Lvg9;->Y0()Lqg9;

    move-result-object v8

    iget-object v10, v5, Lb8e;->a:Lb8e;

    iget-boolean v10, v10, Lb8e;->n:Z

    if-nez v10, :cond_406

    const-string v10, "visitAncestors called on an unattached node"

    invoke-static {v10}, La8b;->b(Ljava/lang/String;)V

    :cond_406
    iget-object v10, v5, Lb8e;->a:Lb8e;

    invoke-static {v5}, Lui6;->e0(Lf17;)Lm3c;

    move-result-object v5

    move v11, v6

    :goto_40d
    if-eqz v5, :cond_45b

    iget-object v12, v5, Lm3c;->F:Ltah;

    iget-object v12, v12, Ltah;->g:Ljava/lang/Object;

    check-cast v12, Lb8e;

    iget v12, v12, Lb8e;->d:I

    and-int/lit16 v12, v12, 0x1400

    if-eqz v12, :cond_44a

    :goto_41b
    if-eqz v10, :cond_44a

    iget v12, v10, Lb8e;->c:I

    and-int/lit16 v13, v12, 0x1400

    if-eqz v13, :cond_447

    and-int/lit16 v12, v12, 0x400

    if-eqz v12, :cond_429

    add-int/lit8 v11, v11, 0x1

    :cond_429
    instance-of v12, v10, Lnf9;

    if-eqz v12, :cond_447

    invoke-virtual {v3, v10}, Ltee;->c(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_447

    if-gt v11, v7, :cond_43c

    move-object v12, v10

    check-cast v12, Lnf9;

    invoke-interface {v12, v8}, Lnf9;->r(Lqg9;)V

    goto :goto_444

    :cond_43c
    move-object v12, v10

    check-cast v12, Lnf9;

    sget-object v13, Lqg9;->b:Lqg9;

    invoke-interface {v12, v13}, Lnf9;->r(Lqg9;)V

    :goto_444
    invoke-virtual {v3, v10}, Ltee;->l(Ljava/lang/Object;)Z

    :cond_447
    iget-object v10, v10, Lb8e;->e:Lb8e;

    goto :goto_41b

    :cond_44a
    invoke-virtual {v5}, Lm3c;->u()Lm3c;

    move-result-object v5

    if-eqz v5, :cond_459

    iget-object v10, v5, Lm3c;->F:Ltah;

    if-eqz v10, :cond_459

    iget-object v10, v10, Ltah;->f:Ljava/lang/Object;

    check-cast v10, Llbl;

    goto :goto_40d

    :cond_459
    move-object v10, v9

    goto :goto_40d

    :cond_45b
    iget-object v5, v3, Ltee;->b:[Ljava/lang/Object;

    iget-object v7, v3, Ltee;->a:[J

    array-length v8, v7

    add-int/lit8 v8, v8, -0x2

    if-ltz v8, :cond_498

    move v9, v6

    :goto_465
    aget-wide v10, v7, v9

    not-long v12, v10

    shl-long v12, v12, p0

    and-long/2addr v12, v10

    and-long v12, v12, v21

    cmp-long v12, v12, v21

    if-eqz v12, :cond_493

    sub-int v12, v9, v8

    not-int v12, v12

    ushr-int/lit8 v12, v12, 0x1f

    rsub-int/lit8 v12, v12, 0x8

    move v13, v6

    :goto_479
    if-ge v13, v12, :cond_491

    and-long v14, v10, v18

    cmp-long v14, v14, v16

    if-gez v14, :cond_48d

    shl-int/lit8 v14, v9, 0x3

    add-int/2addr v14, v13

    aget-object v14, v5, v14

    check-cast v14, Lnf9;

    sget-object v15, Lqg9;->c:Lqg9;

    invoke-interface {v14, v15}, Lnf9;->r(Lqg9;)V

    :cond_48d
    shr-long/2addr v10, v2

    add-int/lit8 v13, v13, 0x1

    goto :goto_479

    :cond_491
    if-ne v12, v2, :cond_498

    :cond_493
    if-eq v9, v8, :cond_498

    add-int/lit8 v9, v9, 0x1

    goto :goto_465

    :cond_498
    invoke-virtual {v4}, Lgg9;->f()Lvg9;

    move-result-object v2

    if-eqz v2, :cond_4a8

    iget-object v2, v4, Lgg9;->c:Lvg9;

    invoke-virtual {v2}, Lvg9;->Y0()Lqg9;

    move-result-object v2

    sget-object v5, Lqg9;->c:Lqg9;

    if-ne v2, v5, :cond_4ab

    :cond_4a8
    invoke-virtual {v4}, Lgg9;->c()V

    :cond_4ab
    invoke-virtual {v1}, Ltee;->b()V

    invoke-virtual {v3}, Ltee;->b()V

    iput-boolean v6, v0, Lbg9;->e:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4b6
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Le29;

    iget-object v0, v0, Le29;->d:Ld8j;

    check-cast v0, Lg8j;

    invoke-virtual {v0}, Lg8j;->h()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4c4
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Le29;

    iget-object v0, v0, Le29;->d:Ld8j;

    check-cast v0, Lg8j;

    iget-object v0, v0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {v0, v6}, Lolh;->d(Ldx3;Z)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4d4
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Le29;

    iget-object v0, v0, Le29;->d:Ld8j;

    check-cast v0, Lg8j;

    iget-object v0, v0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->m()Landroid/net/Uri;

    move-result-object v2

    new-instance v3, Liu2;

    const/16 v4, 0x1d

    invoke-direct {v3, v1, v4}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v2, v6, v3}, Llcp;->G(Ldx3;Landroid/net/Uri;ZLcom/opera/api/Callback;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4fb
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Le29;

    iget-object v0, v0, Le29;->d:Ld8j;

    check-cast v0, Lg8j;

    iget-object v1, v0, Lg8j;->c:Ldu3;

    invoke-virtual {v1}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqim;

    iget-object v1, v1, Lqim;->c:Lz77;

    iget-object v0, v0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    const v2, 0x7f140610

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "concurrent_downloads"

    invoke-static {v2, v0}, Lnrf;->l0(Ljava/lang/String;Ljava/lang/String;)Ltim;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lijm;->b:Lijm;

    invoke-virtual {v1, v0, v2}, Lr22;->b(Ljjm;Lijm;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_527
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lc29;

    invoke-virtual {v0}, Lryl;->g0()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_531
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->k0()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_53e
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lrv7;

    iget-object v1, v0, Lrv7;->m:Lhd;

    iget-object v1, v1, Lhd;->f:Ljava/lang/Object;

    check-cast v1, Liy1;

    invoke-virtual {v1}, Liy1;->b()V

    iget-object v0, v0, Lrv7;->d:Lhz4;

    iget-object v0, v0, Lhz4;->c:Ljava/lang/Object;

    check-cast v0, Ld8e;

    invoke-virtual {v0}, Ld8e;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm0a;

    sget-object v1, Lv08;->a:Lv08;

    iput-object v1, v0, Lm0a;->d:Ljava/util/Set;

    iget-object v1, v0, Lm0a;->a:Ltah;

    invoke-virtual {v1}, Ltah;->k()V

    invoke-virtual {v0}, Lm0a;->b()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_566
    .packed-switch 0x0
        :pswitch_53e
        :pswitch_531
        :pswitch_527
        :pswitch_4fb
        :pswitch_4d4
        :pswitch_4c4
        :pswitch_4b6
        :pswitch_37a
        :pswitch_36b
        :pswitch_361
        :pswitch_355
        :pswitch_323
        :pswitch_23d
        :pswitch_226
        :pswitch_218
        :pswitch_1f5
        :pswitch_18f
        :pswitch_14a
        :pswitch_13a
        :pswitch_122
        :pswitch_114
        :pswitch_106
        :pswitch_cd
        :pswitch_b5
        :pswitch_a9
        :pswitch_7d
        :pswitch_6d
        :pswitch_4b
        :pswitch_35
    .end packed-switch
.end method
