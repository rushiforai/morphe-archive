.class public final synthetic Lz3;
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

    .line 10
    iput-byte p2, p0, Lz3;->a:B

    iput-object p1, p0, Lz3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lu02;Lfka;)V
    .registers 3

    const/16 p1, 0x1b

    iput-byte p1, p0, Lz3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lz3;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lz3;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object p0, p0, Lz3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_56c

    check-cast p0, Lgka;

    check-cast p1, Lyz1;

    sget-object v0, Lwz1;->b:Lwz1;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    new-instance p1, Luja;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    goto :goto_41

    :cond_1c
    sget-object v0, Lwz1;->a:Lwz1;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    new-instance p1, Lqja;

    new-instance v0, Lsja;

    sget-object v1, Lrja;->d:Lrja;

    invoke-direct {v0, v1}, Lsja;-><init>(Lrja;)V

    invoke-direct {p1, v0}, Lqja;-><init>(Lsja;)V

    goto :goto_41

    :cond_31
    instance-of p1, p1, Lxz1;

    if-eqz p1, :cond_4c

    new-instance p1, Lqja;

    new-instance v0, Lsja;

    sget-object v1, Lrja;->c:Lrja;

    invoke-direct {v0, v1}, Lsja;-><init>(Lrja;)V

    invoke-direct {p1, v0}, Lqja;-><init>(Lsja;)V

    :goto_41
    new-instance v0, Lsw7;

    invoke-direct {v0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lgka;->n(Ltw7;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_4f

    :cond_4c
    invoke-static {}, Lh9o;->p()V

    :goto_4f
    return-object v3

    :pswitch_50
    check-cast p0, Lfka;

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_5b

    new-instance v3, Ltka;

    invoke-direct {v3, p1}, Ltka;-><init>(Ljava/lang/String;)V

    :cond_5b
    new-instance p1, Lsw7;

    invoke-direct {p1, v3}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lfka;->n(Ltw7;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_66
    check-cast p0, Lfka;

    check-cast p1, Ltw7;

    invoke-static {p1, p0}, Lu02;->I(Ltw7;Lbqb;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_70
    check-cast p0, Lcom/opera/api/Callback;

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_82

    check-cast p1, Lly1;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_85

    :cond_82
    invoke-interface {p0, v3}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_85
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_88
    check-cast p0, Lvy1;

    check-cast p1, Lvx1;

    sget-object v0, Lsy1;->e:Lsy1;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ec

    instance-of v0, p0, Luy1;

    if-nez v0, :cond_ec

    instance-of v0, p0, Lty1;

    if-eqz v0, :cond_a8

    new-instance v3, Lrx1;

    iget-object p0, p1, Lvx1;->a:Ljava/lang/String;

    iget-object v0, p1, Lvx1;->b:Lwxe;

    iget-object p1, p1, Lvx1;->c:Lux1;

    invoke-direct {v3, p0, v0, p1}, Lvx1;-><init>(Ljava/lang/String;Lwxe;Lux1;)V

    goto :goto_f1

    :cond_a8
    sget-object v0, Lsy1;->a:Lsy1;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b8

    new-instance v3, Lpx1;

    sget-object p0, Ley1;->b:Ley1;

    invoke-direct {v3, p1, p0}, Lpx1;-><init>(Lvx1;Ley1;)V

    goto :goto_f1

    :cond_b8
    sget-object v0, Lsy1;->c:Lsy1;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c8

    new-instance v3, Lpx1;

    sget-object p0, Ley1;->c:Ley1;

    invoke-direct {v3, p1, p0}, Lpx1;-><init>(Lvx1;Ley1;)V

    goto :goto_f1

    :cond_c8
    sget-object v0, Lsy1;->d:Lsy1;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d8

    new-instance v3, Lpx1;

    sget-object p0, Ley1;->d:Ley1;

    invoke-direct {v3, p1, p0}, Lpx1;-><init>(Lvx1;Ley1;)V

    goto :goto_f1

    :cond_d8
    sget-object v0, Lsy1;->b:Lsy1;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_e8

    new-instance v3, Lpx1;

    sget-object p0, Ley1;->e:Ley1;

    invoke-direct {v3, p1, p0}, Lpx1;-><init>(Lvx1;Ley1;)V

    goto :goto_f1

    :cond_e8
    invoke-static {}, Lh9o;->p()V

    goto :goto_f1

    :cond_ec
    new-instance v3, Lsx1;

    invoke-direct {v3, p1}, Lsx1;-><init>(Lvx1;)V

    :goto_f1
    return-object v3

    :pswitch_f2
    check-cast p0, Lqn;

    check-cast p1, Lt0i;

    iget-object v0, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v1, v0, Lq0i;

    if-nez v1, :cond_107

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_107

    invoke-virtual {p0}, Lqn;->run()V

    :cond_107
    return-object p1

    :pswitch_108
    check-cast p0, Lru1;

    move-object v0, p1

    check-cast v0, Ln6j;

    sget-object p1, Lqu1;->a:[Lqu1;

    const p1, 0x7f0a09e0

    const v1, 0x7f0a0a12

    const v2, 0x7f0a0a14

    const v3, 0x7f0a0a13

    filled-new-array {v2, v3, p1, v1}, [I

    move-result-object v3

    const/4 v4, 0x0

    const/16 v5, 0x38

    const/4 v1, 0x7

    const v2, 0x7f1410c7

    invoke-static/range {v0 .. v5}, Ln6j;->d(Ln6j;II[ILjava/util/List;I)V

    const/4 v5, 0x0

    const/16 v6, 0x30

    const/4 v1, 0x1

    const v2, 0x7f14145c

    const v3, 0x7f0a0a1b

    const v4, 0x7f080631

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    iget-object p1, p0, Lru1;->f:Loxe;

    iget-char p1, p1, Lv6j;->a:C

    invoke-virtual {v0, p1}, Ln6j;->a(I)V

    const/4 v1, 0x3

    const v2, 0x7f140fdf

    const v3, 0x7f0a09c6

    const v4, 0x7f080539

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x4

    const v2, 0x7f14109e

    const v3, 0x7f0a09f7

    const v4, 0x7f080610

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x5

    const v2, 0x7f140f53

    const v3, 0x7f0a099f

    const v4, 0x7f0804ea

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x6

    const v2, 0x7f140feb

    const v3, 0x7f0a0a15

    const v4, 0x7f0805e4

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    iget-object p1, p0, Lru1;->g:Lq9;

    iget-char p1, p1, Lv6j;->a:C

    invoke-virtual {v0, p1}, Ln6j;->a(I)V

    iget-object p0, p0, Lru1;->h:Luj;

    iget-char p0, p0, Lv6j;->a:C

    invoke-virtual {v0, p0}, Ln6j;->a(I)V

    const/16 v1, 0x8

    const v2, 0x7f1401ae

    const v3, 0x7f0a09a5

    const v4, 0x7f0804ee

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v1, 0x9

    const v2, 0x7f140510

    const v3, 0x7f0a09a4

    const v4, 0x7f08055c

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a1
    check-cast p0, Lm3c;

    check-cast p1, Ln27;

    invoke-virtual {p0, p1}, Lm3c;->a0(Ln27;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1ab
    check-cast p0, Lve5;

    check-cast p1, Ljava/lang/String;

    sget-object v0, Lf51;->f:Lkotlin/text/Regex;

    invoke-virtual {v0, p1}, Lkotlin/text/Regex;->i(Ljava/lang/String;)Lucd;

    move-result-object p1

    if-eqz p1, :cond_1d0

    iget-object p1, p1, Lucd;->c:Le5;

    invoke-virtual {p1, v1}, Le5;->g(I)Lkotlin/text/MatchGroup;

    move-result-object v0

    iget-object v0, v0, Lkotlin/text/MatchGroup;->a:Ljava/lang/String;

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Le5;->g(I)Lkotlin/text/MatchGroup;

    move-result-object p1

    iget-object p1, p1, Lkotlin/text/MatchGroup;->a:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lve5;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    :cond_1d0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1d5
    check-cast p0, Lk9f;

    check-cast p1, Lq0j;

    sget-object v0, Lhzi;->a:Lp0j;

    new-instance v1, Lgzi;

    sget-object v2, Lx6a;->a:Lx6a;

    invoke-interface {p0}, Lk9f;->a()J

    move-result-wide v3

    sget-object v5, Lfzi;->b:Lfzi;

    const/4 v6, 0x1

    invoke-direct/range {v1 .. v6}, Lgzi;-><init>(Lx6a;JLfzi;Z)V

    invoke-interface {p1, v0, v1}, Lq0j;->b(Lp0j;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1ef
    check-cast p0, Landroid/content/res/Resources;

    check-cast p1, Lk0j;

    invoke-static {p1, p0}, Lcqp;->k0(Lk0j;Landroid/content/res/Resources;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1fc
    check-cast p0, Ljde;

    check-cast p1, Lk0j;

    iget p1, p1, Lk0j;->f:I

    invoke-virtual {p0, p1}, Ljde;->b(I)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_20b
    check-cast p0, Lp31;

    move-object v3, p1

    check-cast v3, Lm1d;

    iget-object p0, p0, Lp31;->p:Lv31;

    iget-object p1, p0, Lv31;->q:Lv9b;

    iget-object p1, p1, Lv9b;->h:Lq0g;

    invoke-virtual {p1}, Lq0g;->h()I

    move-result p1

    if-lez p1, :cond_2ee

    sget-object p1, Lo3o;->a:Ljde;

    iput-boolean v1, v3, Lm1d;->a:Z

    iget-object p1, v3, Lm1d;->d:Lo1d;

    invoke-virtual {p1}, Lo1d;->A0()Lb2c;

    move-result-object v0

    iget-wide v4, v3, Lm1d;->b:J

    const-wide v6, 0x7fffffff7fffffffL

    invoke-static {v4, v5, v6, v7}, Lybb;->a(JJ)Z

    move-result v1

    if-eqz v1, :cond_245

    const-wide/16 v4, 0x0

    invoke-interface {v0, v4, v5}, Lb2c;->K(J)J

    move-result-wide v4

    invoke-static {v4, v5}, Lscd;->f0(J)J

    move-result-wide v4

    iput-wide v4, v3, Lm1d;->b:J

    invoke-interface {v0}, Lb2c;->h()J

    move-result-wide v4

    iput-wide v4, v3, Lm1d;->c:J

    :cond_245
    invoke-virtual {p1}, Lo1d;->D0()Lm3c;

    move-result-object p1

    iget-object p1, p1, Lm3c;->G:Lq3c;

    invoke-virtual {p1}, Lq3c;->b()V

    invoke-interface {v0}, Lb2c;->h()J

    move-result-wide v0

    iget-object p0, p0, Lv31;->q:Lv9b;

    iget-object p1, p0, Lv9b;->g:Lsee;

    const/16 v4, 0x20

    shr-long v4, v0, v4

    long-to-int v7, v4

    const-wide v4, 0xffffffffL

    and-long/2addr v0, v4

    long-to-int v8, v0

    sget-object v0, Lo3o;->b:[Lm3o;

    array-length v1, v0

    move v9, v2

    :goto_266
    if-ge v9, v1, :cond_2a3

    aget-object v10, v0, v9

    invoke-virtual {p1, v10}, Lsee;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Ld4o;

    move-object v4, v10

    check-cast v4, Ln3o;

    iget-object v4, v4, Ln3o;->c:Lk8b;

    iget-wide v5, v11, Ld4o;->h:J

    invoke-static/range {v3 .. v8}, Lo3o;->a(Lm1d;Lk8b;JII)V

    iget-object v4, v11, Ld4o;->b:Lt0g;

    invoke-virtual {v4}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_297

    iget-object v4, v11, Ld4o;->f:Lk8b;

    iget-wide v5, v11, Ld4o;->j:J

    invoke-static/range {v3 .. v8}, Lo3o;->a(Lm1d;Lk8b;JII)V

    iget-object v4, v11, Ld4o;->g:Lk8b;

    iget-wide v5, v11, Ld4o;->k:J

    invoke-static/range {v3 .. v8}, Lo3o;->a(Lm1d;Lk8b;JII)V

    :cond_297
    check-cast v10, Ln3o;

    iget-object v4, v10, Ln3o;->d:Lk8b;

    iget-wide v5, v11, Ld4o;->i:J

    invoke-static/range {v3 .. v8}, Lo3o;->a(Lm1d;Lk8b;JII)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_266

    :cond_2a3
    iget-object p1, p0, Lv9b;->i:Ldee;

    invoke-virtual {p1}, Ldee;->j()Z

    move-result v0

    if-eqz v0, :cond_2ee

    iget-object p0, p0, Lv9b;->j:Lpuj;

    iget-object v0, p1, Ldee;->a:[Ljava/lang/Object;

    iget p1, p1, Ldee;->b:I

    :goto_2b1
    if-ge v2, p1, :cond_2ee

    aget-object v1, v0, v2

    check-cast v1, Lafe;

    invoke-virtual {p0, v2}, Lpuj;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lk8b;

    invoke-interface {v1}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Rect;

    invoke-virtual {v4}, Lk8b;->b()Lpga;

    move-result-object v5

    iget v6, v1, Landroid/graphics/Rect;->left:I

    int-to-float v6, v6

    invoke-virtual {v3, v5, v6}, Lm1d;->a(Lpga;F)V

    invoke-virtual {v4}, Lk8b;->d()Lpga;

    move-result-object v5

    iget v6, v1, Landroid/graphics/Rect;->top:I

    int-to-float v6, v6

    invoke-virtual {v3, v5, v6}, Lm1d;->a(Lpga;F)V

    invoke-virtual {v4}, Lk8b;->c()Lpga;

    move-result-object v5

    iget v6, v1, Landroid/graphics/Rect;->right:I

    int-to-float v6, v6

    invoke-virtual {v3, v5, v6}, Lm1d;->a(Lpga;F)V

    invoke-virtual {v4}, Lk8b;->a()Lpga;

    move-result-object v4

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v1

    invoke-virtual {v3, v4, v1}, Lm1d;->a(Lpga;F)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2b1

    :cond_2ee
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2f1
    check-cast p0, Llf9;

    check-cast p1, Lvg9;

    iget-byte p0, p0, Llf9;->a:B

    invoke-virtual {p1, p0}, Lvg9;->a1(I)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_300
    check-cast p0, Ln3c;

    check-cast p1, Lxz0;

    invoke-interface {p1}, Lxz0;->G()I

    move-result v0

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_311

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto/16 :goto_387

    :cond_311
    invoke-interface {p1}, Lxz0;->a()Ln3c;

    move-result-object v0

    iget-boolean v0, v0, Ln3c;->b:Z

    if-eqz v0, :cond_31c

    invoke-interface {p1}, Lxz0;->t()V

    :cond_31c
    invoke-interface {p1}, Lxz0;->a()Ln3c;

    move-result-object v0

    iget-object v0, v0, Ln3c;->i:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_32a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_34e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsz0;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-interface {p1}, Lxz0;->C()Lj8b;

    move-result-object v3

    invoke-virtual {p0, v2, v1, v3}, Ln3c;->a(Lsz0;ILwye;)V

    goto :goto_32a

    :cond_34e
    invoke-interface {p1}, Lxz0;->C()Lj8b;

    move-result-object p1

    iget-object p1, p1, Lwye;->w:Lwye;

    :goto_354
    iget-object v0, p0, Ln3c;->a:Lxz0;

    invoke-interface {v0}, Lxz0;->C()Lj8b;

    move-result-object v0

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_385

    invoke-virtual {p0, p1}, Ln3c;->b(Lwye;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_36e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_382

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsz0;

    invoke-virtual {p0, p1, v1}, Ln3c;->c(Lwye;Lsz0;)I

    move-result v2

    invoke-virtual {p0, v1, v2, p1}, Ln3c;->a(Lsz0;ILwye;)V

    goto :goto_36e

    :cond_382
    iget-object p1, p1, Lwye;->w:Lwye;

    goto :goto_354

    :cond_385
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_387
    return-object p0

    :pswitch_388
    check-cast p0, Lhv0;

    check-cast p1, Ljava/lang/Boolean;

    iput-object p1, p0, Lhv0;->i:Ljava/lang/Boolean;

    iget-object p0, p0, Lhv0;->c:Lfd;

    invoke-virtual {p0}, Lfd;->c()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_396
    check-cast p0, Lv00;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object v1, p0, Lv00;->c:Ljava/lang/Boolean;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_424

    iput-object p1, p0, Lv00;->c:Ljava/lang/Boolean;

    if-eqz v0, :cond_3c0

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object p1

    :try_start_3ae
    new-instance v0, Lorb;

    sget-object v1, Lphf;->a:Lx79;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lsjo;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lv00;->a(Lorb;)V
    :try_end_3bf
    .catch Lorg/json/JSONException; {:try_start_3ae .. :try_end_3bf} :catch_424
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3ae .. :try_end_3bf} :catch_424

    goto :goto_424

    :cond_3c0
    iget-object p1, p0, Lv00;->b:Lru9;

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "ad.adx.last_cookie"

    invoke-interface {p1, v0, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_424

    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    const-string p1, "Domain"

    invoke-virtual {v0, p1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "Name"

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lrm5;->c0(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_431

    const-string v1, "=; Max-Age=0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lrm5;->b0(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_427

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "; Domain="

    invoke-static {v0, v3, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    const-string v3, "https"

    invoke-virtual {v1, v3}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v1, "/"

    invoke-virtual {p1, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    new-instance v1, Lcom/opera/android/browser/chromium/OperaBrowserContext;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lc4;

    const/16 v3, 0xf

    invoke-direct {v1, p0, v3}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, p1, v0, v1}, LJ/N;->MtwtLBqE(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :catch_424
    :cond_424
    :goto_424
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_43a

    :cond_427
    const-string p0, "Invalid domain: "

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    goto :goto_43a

    :cond_431
    const-string p0, "Invalid name: "

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    :goto_43a
    return-object v3

    :pswitch_43b
    check-cast p0, Lhd;

    check-cast p1, Landroid/graphics/Bitmap;

    iput-object p1, p0, Lhd;->f:Ljava/lang/Object;

    iget-object p1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p1, Lhv;

    iput-object v3, p0, Lhd;->g:Ljava/lang/Object;

    iget-boolean p0, p0, Lhd;->b:Z

    if-eqz p0, :cond_450

    if-eqz p1, :cond_450

    invoke-virtual {p1}, Lhv;->invoke()Ljava/lang/Object;

    :cond_450
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_453
    check-cast p0, Lev;

    check-cast p1, Lifl;

    iget-object v0, p0, Lev;->q:Loyj;

    sget-object v1, Lj41;->b:Lhp7;

    invoke-static {p0, v1}, Lz4o;->N(Lhi5;Lg7h;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Loyj;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_465
    check-cast p0, Lq3;

    check-cast p1, Lw3g;

    new-instance v0, Lsw7;

    invoke-direct {v0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lq3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_474
    check-cast p0, Lnt;

    check-cast p1, Ljava/util/Set;

    invoke-virtual {p0}, Lnt;->l()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_47e
    check-cast p0, Lxs;

    check-cast p1, Ljava/util/Set;

    invoke-virtual {p0}, Lxs;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_488
    check-cast p0, Las;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Las;->E:Ljava/lang/String;

    invoke-virtual {p0, p1}, Las;->R0(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_494
    check-cast p0, Lxk;

    move-object v0, p1

    check-cast v0, Ln6j;

    const/4 v5, 0x0

    const/16 v6, 0x38

    const/4 v1, 0x1

    const v2, 0x7f14035c

    const v3, 0x7f0a015b

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    iget-object p1, p0, Lxk;->h:Luj;

    iget-char p1, p1, Lv6j;->a:C

    invoke-virtual {v0, p1}, Ln6j;->a(I)V

    iget-object p0, p0, Lxk;->g:Luj;

    iget-char p0, p0, Lv6j;->a:C

    invoke-virtual {v0, p0}, Ln6j;->a(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4b8
    check-cast p0, Lie;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lie;->e:Lx9l;

    iget-object p0, p0, Lie;->f:Ljava/util/LinkedHashSet;

    sget-object v1, Lvr0;->g:Lvr0;

    invoke-interface {v0, p1, p0, v1}, Lx9l;->P(Ljava/lang/Integer;Ljava/util/Set;Lvr0;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4cb
    check-cast p0, Lhd;

    check-cast p1, Lndc;

    sget-object p1, Ll08;->a:Ll08;

    invoke-virtual {p0, p1}, Lhd;->x(Ljava/util/List;)V

    iget-object p0, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p0, Lc4;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4de
    check-cast p0, Lqb;

    check-cast p1, Lipf;

    iget-object v0, p0, Lqb;->e:Lipf;

    sget-object v1, Lgpf;->a:Lgpf;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_518

    instance-of v0, p1, Lfpf;

    if-eqz v0, :cond_4f9

    move-object v0, p1

    check-cast v0, Lfpf;

    iget-object v0, v0, Lfpf;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lqb;->b(Ljava/lang/String;)V

    goto :goto_518

    :cond_4f9
    instance-of v0, p1, Lcpf;

    if-eqz v0, :cond_506

    move-object v0, p1

    check-cast v0, Lcpf;

    iget-object v0, v0, Lcpf;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lqb;->b(Ljava/lang/String;)V

    goto :goto_518

    :cond_506
    sget-object v0, Lepf;->a:Lepf;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_518

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_518

    invoke-static {}, Lh9o;->p()V

    goto :goto_51c

    :cond_518
    :goto_518
    iput-object p1, p0, Lqb;->e:Lipf;

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_51c
    return-object v3

    :pswitch_51d
    check-cast p0, Lf5;

    check-cast p1, Ljava/util/Map$Entry;

    sget-object v0, Lf5;->c:Lb5;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "(this Map)"

    if-ne v1, p0, :cond_52f

    move-object v1, v2

    goto :goto_533

    :cond_52f
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_533
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    if-eq p1, p0, :cond_545

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :cond_545
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_54d
    check-cast p0, Lbsb;

    check-cast p1, Lkotlinx/serialization/json/b;

    iget-object v0, p0, Lbsb;->a:Ljava/util/ArrayList;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lbsb;->N(Ljava/lang/String;Lkotlinx/serialization/json/b;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_55f
    check-cast p0, La4;

    if-ne p1, p0, :cond_566

    const-string p0, "(this Collection)"

    goto :goto_56a

    :cond_566
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :goto_56a
    return-object p0

    nop

    :pswitch_data_56c
    .packed-switch 0x0
        :pswitch_55f
        :pswitch_54d
        :pswitch_51d
        :pswitch_4de
        :pswitch_4cb
        :pswitch_4b8
        :pswitch_494
        :pswitch_488
        :pswitch_47e
        :pswitch_474
        :pswitch_465
        :pswitch_453
        :pswitch_43b
        :pswitch_396
        :pswitch_388
        :pswitch_300
        :pswitch_2f1
        :pswitch_20b
        :pswitch_1fc
        :pswitch_1ef
        :pswitch_1d5
        :pswitch_1ab
        :pswitch_1a1
        :pswitch_108
        :pswitch_f2
        :pswitch_88
        :pswitch_70
        :pswitch_66
        :pswitch_50
    .end packed-switch
.end method
