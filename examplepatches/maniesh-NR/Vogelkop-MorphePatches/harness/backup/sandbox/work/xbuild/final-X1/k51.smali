.class public final synthetic Lk51;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lk51;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 18

    move-object/from16 v0, p0

    iget-byte v0, v0, Lk51;->a:B

    const/4 v1, 0x6

    const/4 v2, 0x4

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x5

    const-string v6, "app_data"

    packed-switch v0, :pswitch_data_19c

    move-object/from16 v0, p1

    check-cast v0, Ljava/io/IOException;

    sget-object v0, Lt12;->c:Lt12;

    return-object v0

    :pswitch_15
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/Unit;

    const/4 v0, 0x0

    return-object v0

    :pswitch_1b
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_2c
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    const-string v1, "chat/"

    invoke-static {v0, v1, v3}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_42

    const/16 v1, 0x2f

    invoke-static {v0, v1, v5, v2}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_42

    move v3, v4

    :cond_42
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_47
    move-object/from16 v0, p1

    check-cast v0, Landroid/net/Uri;

    const-string v1, "s"

    invoke-static {v0, v1}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_52
    move-object/from16 v0, p1

    check-cast v0, Ljx1;

    instance-of v0, v0, Lfz1;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_5d
    move-object/from16 v0, p1

    check-cast v0, Le00;

    new-instance v2, Lvx;

    invoke-direct {v2, v0, v1}, Lvx;-><init>(Ljava/lang/Object;B)V

    return-object v2

    :pswitch_67
    move-object/from16 v0, p1

    check-cast v0, Landroid/content/Context;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v1, v2, :cond_7c

    :try_start_71
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.MANAGE_ALL_SIM_PROFILES_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_7b
    .catch Landroid/content/ActivityNotFoundException; {:try_start_71 .. :try_end_7b} :catch_7c

    goto :goto_86

    :catch_7c
    :cond_7c
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.WIRELESS_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :goto_86
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_89
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_93
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_9d
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a7
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b1
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_bb
    sget v0, Lpr1;->a:I

    move-object/from16 v0, p1

    check-cast v0, Lt41;

    invoke-virtual {v0, v3}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v4}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v8

    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v9

    const/4 v3, 0x3

    invoke-virtual {v0, v3}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v2}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v0, v5}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v13

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v14

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v15

    new-instance v6, Lhu1;

    invoke-direct/range {v6 .. v15}, Lhu1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V

    return-object v6

    :pswitch_f0
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_fa
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_104
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_10e
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_118
    move-object/from16 v0, p1

    check-cast v0, Lq0j;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_11f
    move-object/from16 v0, p1

    check-cast v0, Lof1;

    instance-of v0, v0, Lyzf;

    xor-int/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_12b
    move-object/from16 v0, p1

    check-cast v0, Landroid/view/View;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_132
    move-object/from16 v0, p1

    check-cast v0, Lp1d;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_139
    move-object/from16 v0, p1

    check-cast v0, Lq0j;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_140
    move-object/from16 v0, p1

    check-cast v0, Lc6n;

    invoke-virtual {v0}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    move-result-object v1

    iget-object v0, v0, Lc6n;->r:Lec1;

    new-instance v2, Lc4;

    const/16 v3, 0x18

    invoke-direct {v2, v0, v3}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_157
    move-object/from16 v0, p1

    check-cast v0, Lwa1;

    invoke-interface {v0}, Lwa1;->execute()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_164
    move-object/from16 v0, p1

    check-cast v0, Lp1d;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_16b
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_175
    move-object/from16 v0, p1

    check-cast v0, Lq0j;

    sget-object v1, Lo0j;->a:[Lxtb;

    sget-object v1, Ln0j;->x:Lp0j;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-interface {v0, v1, v2}, Lq0j;->b(Lp0j;Ljava/lang/Object;)V

    return-object v2

    :pswitch_183
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_18d
    move-object/from16 v0, p1

    check-cast v0, Lq0j;

    sget-object v1, Lo0j;->a:[Lxtb;

    sget-object v1, Ln0j;->y:Lp0j;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-interface {v0, v1, v2}, Lq0j;->b(Lp0j;Ljava/lang/Object;)V

    return-object v2

    nop

    :pswitch_data_19c
    .packed-switch 0x0
        :pswitch_18d
        :pswitch_183
        :pswitch_175
        :pswitch_16b
        :pswitch_164
        :pswitch_157
        :pswitch_140
        :pswitch_139
        :pswitch_132
        :pswitch_12b
        :pswitch_11f
        :pswitch_118
        :pswitch_10e
        :pswitch_104
        :pswitch_fa
        :pswitch_f0
        :pswitch_bb
        :pswitch_b1
        :pswitch_a7
        :pswitch_9d
        :pswitch_93
        :pswitch_89
        :pswitch_67
        :pswitch_5d
        :pswitch_52
        :pswitch_47
        :pswitch_2c
        :pswitch_1b
        :pswitch_15
    .end packed-switch
.end method
