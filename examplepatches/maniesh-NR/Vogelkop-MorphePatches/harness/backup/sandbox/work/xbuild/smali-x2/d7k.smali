.class public final synthetic Ld7k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcrk;Lne5;I)V
    .registers 4

    .line 12
    const/16 p3, 0x18

    iput-byte p3, p0, Ld7k;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld7k;->b:Ljava/lang/Object;

    iput-object p2, p0, Ld7k;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 14
    iput-byte p3, p0, Ld7k;->a:B

    iput-object p1, p0, Ld7k;->b:Ljava/lang/Object;

    iput-object p2, p0, Ld7k;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lmcj;Ljava/util/LinkedHashSet;Lp6l;)V
    .registers 4

    const/16 p3, 0x17

    iput-byte p3, p0, Ld7k;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld7k;->b:Ljava/lang/Object;

    iput-object p2, p0, Ld7k;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lmhl;Lw2m;Lafe;)V
    .registers 4

    .line 13
    const/16 p1, 0x1b

    iput-byte p1, p0, Ld7k;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ld7k;->b:Ljava/lang/Object;

    iput-object p3, p0, Ld7k;->c:Ljava/lang/Object;

    return-void
.end method

.method private final a(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Ld7k;->b:Ljava/lang/Object;

    check-cast v0, Ln7l;

    iget-object p0, p0, Ld7k;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    check-cast p1, Lkotlin/Unit;

    invoke-virtual {v0}, Ln7l;->a()Lf58;

    move-result-object p1

    monitor-enter p1

    :try_start_f
    invoke-virtual {v0}, Ln7l;->a()Lf58;

    move-result-object v1

    iget-object v2, v1, Lf58;->a:Ly5i;

    new-instance v3, Ld58;

    invoke-direct {v3, v1}, Ld58;-><init>(Lf58;)V

    const/4 v1, 0x0

    const/4 v4, 0x1

    invoke-static {v2, v4, v1, v3}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    check-cast v2, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2d
    :goto_2d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lm7l;

    iget v6, v6, Lm7l;->a:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {p0, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2d

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2d

    :cond_4a
    invoke-virtual {v0}, Ln7l;->a()Lf58;

    move-result-object p0

    iget-object v2, p0, Lf58;->a:Ly5i;

    new-instance v5, Lry7;

    const/4 v6, 0x3

    invoke-direct {v5, p0, v3, v6}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v1, v4, v5}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    invoke-virtual {v0}, Ln7l;->a()Lf58;

    move-result-object p0

    iget-object v0, p0, Lf58;->a:Ly5i;

    new-instance v2, Ld58;

    invoke-direct {v2, p0}, Ld58;-><init>(Lf58;)V

    invoke-static {v0, v4, v1, v2}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;
    :try_end_6a
    .catchall {:try_start_f .. :try_end_6a} :catchall_6c

    monitor-exit p1

    return-object p0

    :catchall_6c
    move-exception p0

    monitor-exit p1

    throw p0
.end method

.method private final b(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-object v0, p0, Ld7k;->b:Ljava/lang/Object;

    check-cast v0, Ln7l;

    iget-object p0, p0, Ld7k;->c:Ljava/lang/Object;

    check-cast p0, Lm7l;

    check-cast p1, Lkotlin/Unit;

    invoke-virtual {v0}, Ln7l;->a()Lf58;

    move-result-object p1

    monitor-enter p1

    :try_start_f
    invoke-virtual {v0}, Ln7l;->a()Lf58;

    move-result-object v0

    iget-object v1, v0, Lf58;->a:Ly5i;

    new-instance v2, Lc58;

    const/4 v3, 0x1

    invoke-direct {v2, v0, p0, v3}, Lc58;-><init>(Lf58;Lm7l;B)V

    const/4 p0, 0x0

    invoke-static {v1, p0, v3, v2}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;
    :try_end_1f
    .catchall {:try_start_f .. :try_end_1f} :catchall_23

    monitor-exit p1

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_23
    move-exception p0

    monitor-exit p1

    throw p0
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Ld7k;->a:B

    const/16 v2, 0xd

    const-wide v3, 0xffffffffL

    const/16 v5, 0xf

    const/16 v6, 0x1a

    const/4 v7, 0x4

    const/16 v8, 0xe

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    packed-switch v1, :pswitch_data_646

    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lafe;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Llde;

    move-object/from16 v2, p1

    check-cast v2, Lvb7;

    new-instance v2, Lrz2;

    invoke-direct {v2, v1, v0, v7}, Lrz2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v2

    :pswitch_2a
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lpaj;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lvgl;

    move-object/from16 v2, p1

    check-cast v2, Lg74;

    iget-object v3, v2, Lg74;->a:Le14;

    invoke-interface {v3}, Le14;->e()J

    move-result-wide v3

    iget-object v7, v2, Lg74;->a:Le14;

    invoke-interface {v7}, Le14;->getLayoutDirection()Ld2c;

    move-result-object v7

    invoke-interface {v1, v3, v4, v7, v2}, Lpaj;->a(JLd2c;Ln27;)Lw7d;

    move-result-object v1

    new-instance v3, Ld7k;

    invoke-direct {v3, v1, v0, v6}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lbo3;

    invoke-direct {v0, v3, v5}, Lbo3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v0}, Lg74;->a(Lkotlin/jvm/functions/Function1;)Lqe6;

    move-result-object v0

    return-object v0

    :pswitch_55
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lw2m;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lafe;

    move-object/from16 v2, p1

    check-cast v2, Lbpj;

    iget-object v1, v1, Lw2m;->h:Lt0g;

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    iget-wide v5, v2, Lbpj;->a:J

    const/16 v7, 0x20

    shr-long/2addr v5, v7

    long-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v5

    mul-float/2addr v5, v1

    iget-wide v8, v2, Lbpj;->a:J

    and-long/2addr v8, v3

    long-to-int v2, v8

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    mul-float/2addr v2, v1

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbpj;

    iget-wide v8, v1, Lbpj;->a:J

    shr-long/2addr v8, v7

    long-to-int v1, v8

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    cmpg-float v1, v1, v5

    if-nez v1, :cond_a5

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbpj;

    iget-wide v8, v1, Lbpj;->a:J

    and-long/2addr v8, v3

    long-to-int v1, v8

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    cmpg-float v1, v1, v2

    if-eqz v1, :cond_ba

    :cond_a5
    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v5, v1

    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v1, v1

    shl-long/2addr v5, v7

    and-long/2addr v1, v3

    or-long/2addr v5, v1

    new-instance v1, Lbpj;

    invoke-direct {v1, v5, v6}, Lbpj;-><init>(J)V

    invoke-interface {v0, v1}, Lafe;->setValue(Ljava/lang/Object;)V

    :cond_ba
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_bd
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lw7d;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lvgl;

    move-object/from16 v2, p1

    check-cast v2, Lmk7;

    iget-object v0, v0, Lvgl;->a:Lb6h;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lu95;

    iget-wide v3, v0, Lu95;->a:J

    invoke-static {v2, v1, v3, v4}, Lx7d;->f(Lmk7;Lw7d;J)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_d9
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lyv4;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lx8l;

    move-object/from16 v2, p1

    check-cast v2, Ljava/util/List;

    invoke-virtual {v1, v2}, Lyv4;->d(Ljava/util/List;)V

    iput-object v11, v0, Lx8l;->o:Loml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ed
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lcrk;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lne5;

    move-object/from16 v2, p1

    check-cast v2, Lm7l;

    if-eqz v2, :cond_103

    iget-object v1, v1, Lcrk;->b:Ljava/lang/Object;

    check-cast v1, Lzwg;

    invoke-virtual {v1, v2}, Lzwg;->o(Lm7l;)Ll7l;

    move-result-object v11

    :cond_103
    if-eqz v11, :cond_12e

    iput-object v11, v0, Lne5;->e:Ljava/lang/Object;

    iget-object v1, v0, Lne5;->g:Ljava/lang/Object;

    check-cast v1, Lc8l;

    iget-object v1, v1, Lc8l;->c:Ldeg;

    iget-object v2, v0, Lne5;->a:Ljava/lang/Object;

    check-cast v2, Lmcj;

    iget-object v2, v2, Lmcj;->a:Ljava/lang/Object;

    check-cast v2, Lf7l;

    iget-object v3, v11, Ll7l;->a:Ljava/lang/String;

    invoke-interface {v2, v3}, Lf7l;->d(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object v1

    iget-object v2, v0, Lne5;->b:Ljava/lang/Object;

    check-cast v2, Lqfl;

    invoke-virtual {v2, v1}, Lqfl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lne5;->f:Ljava/lang/Object;

    check-cast v0, Lnwa;

    invoke-virtual {v1, v0}, Ldwh;->f(Lacl;)V

    goto :goto_133

    :cond_12e
    sget-object v1, Lt7l;->a:Lt7l;

    invoke-virtual {v0, v1}, Lne5;->P(Lv7l;)V

    :goto_133
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_136
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lmcj;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    move-object/from16 v2, p1

    check-cast v2, Lkotlin/Unit;

    iget-object v1, v1, Lmcj;->a:Ljava/lang/Object;

    check-cast v1, Lf7l;

    invoke-interface {v1, v0}, Lf7l;->g(Ljava/util/LinkedHashSet;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_14c
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lmcj;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lm7l;

    move-object/from16 v2, p1

    check-cast v2, Lkotlin/Unit;

    iget-object v1, v1, Lmcj;->a:Ljava/lang/Object;

    check-cast v1, Lf7l;

    iget-object v2, v0, Lm7l;->b:Ll7l;

    iget-object v2, v2, Ll7l;->a:Ljava/lang/String;

    invoke-interface {v1, v2}, Lf7l;->remove(Ljava/lang/String;)V

    iget-object v0, v0, Lm7l;->c:Ll7l;

    iget-object v0, v0, Ll7l;->a:Ljava/lang/String;

    invoke-interface {v1, v0}, Lf7l;->remove(Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_16d
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lc8l;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lmcj;

    move-object/from16 v2, p1

    check-cast v2, Lm7l;

    if-eqz v2, :cond_192

    iget-object v1, v1, Lc8l;->b:Lumi;

    new-instance v3, Lrml;

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v3, v4, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Ld7k;

    const/16 v4, 0x16

    invoke-direct {v1, v0, v2, v4}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    :cond_192
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_195
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Ltmi;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    move-object/from16 v2, p1

    check-cast v2, Lkotlin/Unit;

    new-instance v2, Lt0i;

    invoke-direct {v2, v0}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ltmi;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1ac
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Ld7k;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lm7l;

    move-object/from16 v2, p1

    check-cast v2, Lkotlin/Unit;

    invoke-virtual {v1, v0}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1be
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Ld7k;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lm7l;

    move-object/from16 v2, p1

    check-cast v2, Lkotlin/Unit;

    invoke-virtual {v1, v0}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1d0
    invoke-direct/range {p0 .. p1}, Ld7k;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_1d5
    invoke-direct/range {p0 .. p1}, Ld7k;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_1da
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Li9c;

    iget-object v2, v1, Li9c;->e:Ljava/lang/Object;

    check-cast v2, Lkotlin/jvm/functions/Function1;

    iget-object v3, v1, Li9c;->d:Ljava/lang/Object;

    check-cast v3, Lp6l;

    iget-object v4, v1, Li9c;->c:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lx4l;

    move-object/from16 v5, p1

    check-cast v5, Lkotlin/Unit;

    iget-object v5, v1, Li9c;->g:Ljava/lang/Object;

    check-cast v5, La5l;

    if-eqz v0, :cond_212

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eqz v6, :cond_20d

    if-ne v6, v9, :cond_209

    iget-object v6, v5, La5l;->d:Ln9h;

    invoke-virtual {v6, v4, v0, v10}, Ln9h;->o(Ljava/lang/String;Lx4l;Z)V

    goto :goto_212

    :cond_209
    invoke-static {}, Lh9o;->p()V

    goto :goto_247

    :cond_20d
    iget-object v6, v5, La5l;->c:Ln9h;

    invoke-virtual {v6, v4, v0, v10}, Ln9h;->o(Ljava/lang/String;Lx4l;Z)V

    :cond_212
    :goto_212
    iget-boolean v6, v1, Li9c;->b:Z

    if-nez v6, :cond_245

    if-eqz v0, :cond_222

    invoke-virtual {v0}, Lx4l;->b()Z

    move-result v6

    if-nez v6, :cond_222

    invoke-interface {v2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_245

    :cond_222
    iget-object v0, v5, La5l;->b:Lwun;

    invoke-virtual {v0, v4, v3}, Lwun;->b(Ljava/lang/String;Lp6l;)Ltun;

    move-result-object v6

    if-eqz v6, :cond_23a

    invoke-virtual {v6}, Ltun;->c()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_23a

    invoke-virtual {v5, v4, v3, v6, v10}, La5l;->b(Ljava/lang/String;Lp6l;Ljava/lang/String;I)Lx4l;

    move-result-object v0

    invoke-interface {v2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, La5l;->l:Lgpk;

    goto :goto_243

    :cond_23a
    new-instance v6, Lw7j;

    invoke-direct {v6, v2, v5, v4, v3}, Lw7j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v4, v3, v6}, Lwun;->a(Ljava/lang/String;Lp6l;Lzun;)Luun;

    move-result-object v0

    :goto_243
    iput-object v0, v1, Li9c;->a:Ljava/lang/Object;

    :cond_245
    :goto_245
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_247
    return-object v11

    :pswitch_248
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, La5l;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Li9c;

    move-object/from16 v2, p1

    check-cast v2, Lkotlin/Unit;

    sget-object v2, La5l;->l:Lgpk;

    invoke-virtual {v1}, La5l;->a()Le58;

    move-result-object v2

    iget-object v3, v0, Li9c;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v2, v2, Le58;->a:Ly5i;

    new-instance v4, Ltx0;

    invoke-direct {v4, v3, v8}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-static {v2, v9, v10, v4}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lx4l;

    iget-object v1, v1, La5l;->a:Lumi;

    new-instance v3, Lrml;

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v3, v4, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Ld7k;

    invoke-direct {v1, v0, v2, v5}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v1}, Lrml;->c(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    move-result-object v0

    return-object v0

    :pswitch_282
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, La5l;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lhd;

    move-object/from16 v3, p1

    check-cast v3, Lkotlin/Unit;

    sget-object v3, La5l;->l:Lgpk;

    invoke-virtual {v1}, La5l;->a()Le58;

    move-result-object v3

    iget-object v4, v0, Lhd;->c:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v3, v3, Le58;->a:Ly5i;

    new-instance v5, Ltx0;

    invoke-direct {v5, v4, v2}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-static {v3, v9, v10, v5}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    new-instance v3, Lp4j;

    invoke-direct {v3}, Lp4j;-><init>()V

    move-object v4, v2

    check-cast v4, Ljava/lang/Iterable;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2b1
    :goto_2b1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2c5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lx4l;

    iget-object v5, v5, Lx4l;->b:Ljava/lang/String;

    if-eqz v5, :cond_2b1

    invoke-virtual {v3, v5}, Lp4j;->add(Ljava/lang/Object;)Z

    goto :goto_2b1

    :cond_2c5
    invoke-static {v3}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object v3

    iget-object v1, v1, La5l;->a:Lumi;

    new-instance v4, Lrml;

    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v4, v5, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Ltmi;

    const/16 v5, 0x9

    invoke-direct {v1, v0, v2, v3, v5}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v1}, Lrml;->c(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    move-result-object v0

    return-object v0

    :pswitch_2e2
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, La5l;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    move-object/from16 v2, p1

    check-cast v2, Lkotlin/Unit;

    invoke-virtual {v1}, La5l;->a()Le58;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "SELECT * FROM entry"

    sget-object v3, Le6i;->i:Ljava/util/TreeMap;

    invoke-static {v10, v2}, Laoh;->e(ILjava/lang/String;)Le6i;

    move-result-object v2

    iget-object v1, v1, Le58;->a:Ly5i;

    invoke-virtual {v1, v2}, Ly5i;->s(Lssk;)Landroid/database/Cursor;

    move-result-object v1

    check-cast v1, Ljava/io/Closeable;

    :try_start_305
    move-object v2, v1

    check-cast v2, Landroid/database/Cursor;

    const-string v3, "pageUrl"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    const-string v4, "imageUrl"

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    const-string v5, "timeStamp"

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    const-string v6, "flags"

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v7

    :cond_324
    :goto_324
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v8

    if-eqz v8, :cond_352

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v0, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_324

    new-instance v12, Lx4l;

    invoke-interface {v2, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v8

    if-eqz v8, :cond_33e

    move-object v15, v11

    goto :goto_343

    :cond_33e
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object v15, v8

    :goto_343
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    invoke-direct/range {v12 .. v17}, Lx4l;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    invoke-virtual {v7, v12}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_324

    :cond_352
    invoke-static {v7}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v0
    :try_end_356
    .catchall {:try_start_305 .. :try_end_356} :catchall_35a

    invoke-static {v1, v11}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object v0

    :catchall_35a
    move-exception v0

    move-object v2, v0

    :try_start_35c
    throw v2
    :try_end_35d
    .catchall {:try_start_35c .. :try_end_35d} :catchall_35d

    :catchall_35d
    move-exception v0

    invoke-static {v1, v2}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :pswitch_362
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, La5l;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lx4l;

    move-object/from16 v2, p1

    check-cast v2, Lkotlin/Unit;

    invoke-virtual {v1}, La5l;->a()Le58;

    move-result-object v1

    iget-object v2, v1, Le58;->a:Ly5i;

    new-instance v3, Lry7;

    invoke-direct {v3, v1, v0, v9}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v10, v9, v3}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_37f
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lyrk;

    iget-object v2, v1, Lyrk;->b:Lgjm;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lndc;

    move-object/from16 v3, p1

    check-cast v3, Lnjn;

    sget-object v4, Lljn;->c:Lljn;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3ba

    sget-object v4, Lljn;->b:Lljn;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3ba

    sget-object v0, Lljn;->a:Lljn;

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3ce

    instance-of v0, v3, Lmjn;

    if-eqz v0, :cond_3b6

    new-instance v0, Lork;

    check-cast v3, Lmjn;

    iget-object v1, v3, Lmjn;->a:Ljava/lang/String;

    invoke-direct {v0, v1}, Lork;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v10}, Lgjm;->e(Ln37;Z)V

    goto :goto_3ce

    :cond_3b6
    invoke-static {}, Lh9o;->p()V

    goto :goto_3d0

    :cond_3ba
    new-instance v3, Lzrk;

    invoke-direct {v3}, Lzrk;-><init>()V

    new-instance v4, Ln6k;

    invoke-direct {v4, v1, v8}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lw4i;

    const/16 v5, 0x12

    invoke-direct {v1, v4, v5}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3, v0, v1}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    :cond_3ce
    :goto_3ce
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_3d0
    return-object v11

    :pswitch_3d1
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lapk;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lnxd;

    move-object/from16 v2, p1

    check-cast v2, Losk;

    iget-object v1, v1, Lapk;->b:Lnb2;

    invoke-virtual {v1, v2, v0}, Lkfo;->Q(Losk;Ljava/lang/Object;)V

    return-object v11

    :pswitch_3e3
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lapk;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lr7h;

    move-object/from16 v2, p1

    check-cast v2, Losk;

    iget-object v1, v1, Lapk;->c:Lnb2;

    invoke-virtual {v1, v2, v0}, Lkfo;->Q(Losk;Ljava/lang/Object;)V

    return-object v11

    :pswitch_3f5
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Ltn;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lafe;

    move-object/from16 v2, p1

    check-cast v2, Lvb7;

    new-instance v2, Lgb1;

    const/16 v3, 0x11

    invoke-direct {v2, v0, v3}, Lgb1;-><init>(Lafe;B)V

    iget-object v0, v1, Ltn;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lj06;

    monitor-enter v3

    :try_start_40e
    iget-object v0, v1, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0
    :try_end_416
    .catchall {:try_start_40e .. :try_end_416} :catchall_474

    if-eqz v0, :cond_41a

    monitor-exit v3

    goto :goto_45f

    :cond_41a
    :try_start_41a
    iget-object v0, v1, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    new-instance v5, Lkotlin/Pair;

    invoke-direct {v5, v2, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v0, v5}, Lrbd;->f(Ljava/util/Map;Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, v1, Ltn;->d:Ljava/lang/Object;
    :try_end_42b
    .catchall {:try_start_41a .. :try_end_42b} :catchall_474

    monitor-exit v3

    :goto_42c
    iget-object v0, v1, Ltn;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lj06;

    monitor-enter v3

    :try_start_432
    iget-object v0, v1, Ltn;->c:Ljava/lang/Object;
    :try_end_434
    .catchall {:try_start_432 .. :try_end_434} :catchall_471

    monitor-exit v3

    invoke-virtual {v2, v0}, Lgb1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, v1, Ltn;->b:Ljava/lang/Object;

    check-cast v3, Lj06;

    monitor-enter v3

    :try_start_43d
    iget-object v4, v1, Ltn;->d:Ljava/lang/Object;

    check-cast v4, Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4
    :try_end_445
    .catchall {:try_start_43d .. :try_end_445} :catchall_46e

    if-nez v4, :cond_449

    monitor-exit v3

    goto :goto_45f

    :cond_449
    :try_start_449
    iget-object v4, v1, Ltn;->c:Ljava/lang/Object;

    if-ne v0, v4, :cond_46c

    iget-object v0, v1, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    new-instance v5, Lkotlin/Pair;

    invoke-direct {v5, v2, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v0, v5}, Lrbd;->f(Ljava/util/Map;Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, v1, Ltn;->d:Ljava/lang/Object;
    :try_end_45e
    .catchall {:try_start_449 .. :try_end_45e} :catchall_46e

    monitor-exit v3

    :goto_45f
    new-instance v0, Lz0c;

    const/16 v3, 0x17

    invoke-direct {v0, v1, v2, v3}, Lz0c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lci;

    invoke-direct {v1, v0, v8}, Lci;-><init>(Ljava/lang/Object;B)V

    return-object v1

    :cond_46c
    monitor-exit v3

    goto :goto_42c

    :catchall_46e
    move-exception v0

    monitor-exit v3

    throw v0

    :catchall_471
    move-exception v0

    monitor-exit v3

    throw v0

    :catchall_474
    move-exception v0

    monitor-exit v3

    throw v0

    :pswitch_477
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lxd4;

    move-object/from16 v2, p1

    check-cast v2, Lqrm;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_494

    check-cast v1, Lmg4;

    iget-object v3, v1, Lmg4;->a:Lqsm;

    iget-object v1, v1, Lmg4;->b:Lqsm;

    invoke-virtual {v2, v0, v3, v1}, Lqrm;->q(Lxd4;Lqsm;Lqsm;)Lqsm;

    move-result-object v11

    goto :goto_499

    :cond_494
    const-string v0, "Required value was null."

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_499
    return-object v11

    :pswitch_49a
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lev7;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Luck;

    move-object/from16 v2, p1

    check-cast v2, Landroid/view/View;

    iget-object v1, v1, Lev7;->e:Ljava/lang/Object;

    check-cast v1, Lypd;

    iget-object v0, v0, Luck;->b:Lsck;

    iget v0, v0, Lsck;->a:I

    iget-object v3, v1, Lypd;->b:Ljava/lang/Object;

    check-cast v3, La21;

    iget-object v1, v1, Lypd;->c:Ljava/lang/Object;

    check-cast v1, Lz5l;

    iget-object v1, v1, Lz5l;->s:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu3l;

    invoke-virtual {v3, v1, v0, v2}, La21;->r(Lu3l;ILandroid/view/View;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4c4
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lhak;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Throwable;

    if-eqz v2, :cond_4eb

    move-object v3, v1

    check-cast v3, Ljava/lang/Iterable;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_4d9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_506

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lbd5;

    check-cast v4, Lcd5;

    invoke-virtual {v4, v2}, Lcd5;->B0(Ljava/lang/Throwable;)Z

    goto :goto_4d9

    :cond_4eb
    move-object v2, v1

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4f2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_506

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbd5;

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    check-cast v3, Lcd5;

    invoke-virtual {v3, v4}, Lxob;->j0(Ljava/lang/Object;)Z

    goto :goto_4f2

    :cond_506
    iget-object v2, v0, Lhak;->d:Ljava/lang/Object;

    monitor-enter v2

    :try_start_509
    iget-object v0, v0, Lhak;->f:Ljava/util/ArrayList;

    check-cast v1, Ljava/util/Collection;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z
    :try_end_510
    .catchall {:try_start_509 .. :try_end_510} :catchall_514

    monitor-exit v2

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_514
    move-exception v0

    monitor-exit v2

    throw v0

    :pswitch_517
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lo9k;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v3, v0, Lor2;->c:Landroid/view/View;

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    move-object/from16 v4, p1

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_550

    new-instance v4, Lkkf;

    invoke-direct {v4, v1, v6}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v4}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget-object v4, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v0, v10}, Landroid/view/View;->setVisibility(I)V

    new-instance v0, Lh4i;

    invoke-direct {v0, v1, v2}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1}, Lo9k;->j0()V

    :cond_550
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_553
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lifg;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Lcd1;

    move-object/from16 v2, p1

    check-cast v2, Lp1d;

    iget v3, v1, Lifg;->b:I

    int-to-float v3, v3

    invoke-virtual {v0}, Lcd1;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    mul-float/2addr v0, v3

    float-to-int v0, v0

    invoke-static {v2, v1, v10, v0}, Lp1d;->f(Lp1d;Lifg;II)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_574
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Lcd1;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Ljava/util/List;

    move-object/from16 v0, p1

    check-cast v0, Lmk7;

    invoke-virtual {v1}, Lcd1;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    invoke-interface {v0}, Lmk7;->e()J

    move-result-wide v7

    and-long/2addr v7, v3

    long-to-int v2, v7

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float v7, v5, v1

    mul-float/2addr v7, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v7, v2

    invoke-interface {v0}, Lmk7;->e()J

    move-result-wide v8

    and-long/2addr v8, v3

    long-to-int v8, v8

    invoke-static {v8}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v8

    add-float/2addr v5, v1

    mul-float/2addr v5, v8

    div-float/2addr v5, v2

    invoke-static {v7}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v1, v1

    and-long v8, v1, v3

    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v1, v1

    and-long v10, v1, v3

    new-instance v5, Lvec;

    const/4 v7, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v5 .. v12}, Lvec;-><init>(Ljava/util/List;Ljava/util/ArrayList;JJI)V

    const/4 v14, 0x0

    const/16 v15, 0x7e

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    move-object v7, v0

    move-object v8, v5

    invoke-static/range {v7 .. v15}, Lmk7;->E0(Lmk7;Ldz3;JJFLnk7;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5cf
    iget-object v1, v0, Ld7k;->b:Ljava/lang/Object;

    check-cast v1, Le7k;

    iget-object v0, v0, Ld7k;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    move-object/from16 v2, p1

    check-cast v2, Lrjf;

    iput-object v11, v1, Le7k;->g:Lmu5;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v4, 0x5

    const/4 v5, 0x3

    const/4 v6, 0x2

    if-eqz v3, :cond_5f4

    if-eq v3, v9, :cond_5f4

    if-eq v3, v6, :cond_5f4

    if-eq v3, v5, :cond_5f4

    if-eq v3, v7, :cond_5f4

    if-eq v3, v4, :cond_60c

    invoke-static {}, Lh9o;->p()V

    goto :goto_645

    :cond_5f4
    iget-object v3, v1, Le7k;->a:Lcw3;

    invoke-virtual {v3}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lru9;

    invoke-virtual {v3}, Lru9;->b()Lnv6;

    move-result-object v3

    iget-object v8, v3, Lnv6;->a:Ljava/lang/Object;

    check-cast v8, Landroid/content/SharedPreferences$Editor;

    const-string v10, "startpage.minigame_button_hint_shown"

    invoke-interface {v8, v10, v9}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v3}, Lnv6;->w()V

    :cond_60c
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_629

    if-eq v3, v9, :cond_626

    if-eq v3, v6, :cond_623

    if-eq v3, v5, :cond_626

    if-eq v3, v7, :cond_620

    if-eq v3, v4, :cond_62b

    invoke-static {}, Lh9o;->p()V

    goto :goto_645

    :cond_620
    sget-object v11, Lkf0;->d:Lkf0;

    goto :goto_62b

    :cond_623
    sget-object v11, Lkf0;->e:Lkf0;

    goto :goto_62b

    :cond_626
    sget-object v11, Lkf0;->b:Lkf0;

    goto :goto_62b

    :cond_629
    sget-object v11, Lkf0;->c:Lkf0;

    :cond_62b
    :goto_62b
    if-eqz v11, :cond_63c

    iget-object v1, v1, Le7k;->b:Lcw3;

    invoke-virtual {v1}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    sget-object v3, Lmf0;->n:Lmf0;

    check-cast v1, Lx5f;

    invoke-virtual {v1, v11, v3}, Lx5f;->W(Lkf0;Lmf0;)V

    :cond_63c
    sget-object v1, Lrjf;->d:Lrjf;

    if-ne v2, v1, :cond_643

    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    :cond_643
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_645
    return-object v11

    :pswitch_data_646
    .packed-switch 0x0
        :pswitch_5cf
        :pswitch_574
        :pswitch_553
        :pswitch_517
        :pswitch_4c4
        :pswitch_49a
        :pswitch_477
        :pswitch_3f5
        :pswitch_3e3
        :pswitch_3d1
        :pswitch_37f
        :pswitch_362
        :pswitch_2e2
        :pswitch_282
        :pswitch_248
        :pswitch_1da
        :pswitch_1d5
        :pswitch_1d0
        :pswitch_1be
        :pswitch_1ac
        :pswitch_195
        :pswitch_16d
        :pswitch_14c
        :pswitch_136
        :pswitch_ed
        :pswitch_d9
        :pswitch_bd
        :pswitch_55
        :pswitch_2a
    .end packed-switch
.end method
