.class public final Lty7;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lty7;->t:B

    iput-object p1, p0, Lty7;->v:Landroid/content/Context;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lty7;->t:B

    iget-object p0, p0, Lty7;->v:Landroid/content/Context;

    packed-switch v0, :pswitch_data_2c

    new-instance p1, Lty7;

    const/4 v0, 0x3

    invoke-direct {p1, p0, p2, v0}, Lty7;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance v0, Lty7;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p2, v1}, Lty7;-><init>(Landroid/content/Context;Lmt5;B)V

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    iput-boolean p0, v0, Lty7;->u:Z

    return-object v0

    :pswitch_1d
    new-instance p1, Lty7;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lty7;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_24
    new-instance p1, Lty7;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lty7;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_24
        :pswitch_1d
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lty7;->t:B

    packed-switch v0, :pswitch_data_52

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lty7;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lty7;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lty7;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p2, Lmt5;

    new-instance v0, Lty7;

    iget-object p0, p0, Lty7;->v:Landroid/content/Context;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p2, v1}, Lty7;-><init>(Landroid/content/Context;Lmt5;B)V

    iput-boolean p1, v0, Lty7;->u:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lty7;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_2f
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lty7;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lty7;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lty7;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_40
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lty7;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lty7;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lty7;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_40
        :pswitch_2f
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    iget-byte v1, v0, Lty7;->t:B

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v1, :pswitch_data_176

    sget-object v1, Lpx5;->a:Lpx5;

    iget-boolean v5, v0, Lty7;->u:Z

    if-eqz v5, :cond_1e

    if-ne v5, v3, :cond_19

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v2, p1

    goto :goto_37

    :cond_19
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_fa

    :cond_1e
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lbb7;->a:Lcv6;

    sget-object v2, Lmr6;->b:Lmr6;

    new-instance v5, Luwo;

    iget-object v6, v0, Lty7;->v:Landroid/content/Context;

    invoke-direct {v5, v6, v4}, Luwo;-><init>(Landroid/content/Context;Lmt5;)V

    iput-boolean v3, v0, Lty7;->u:Z

    invoke-static {v2, v5, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_37

    move-object v4, v1

    goto/16 :goto_fa

    :cond_37
    :goto_37
    check-cast v2, Lswo;

    sget-object v1, Lfap;->a:Lzyk;

    iget-object v1, v0, Lty7;->v:Landroid/content/Context;

    invoke-static {v1}, Lfap;->c(Landroid/content/Context;)Landroid/util/Size;

    move-result-object v1

    new-instance v5, Ljzo;

    iget-object v3, v0, Lty7;->v:Landroid/content/Context;

    invoke-static {v3}, Llah;->k(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v2, Lswo;->a:Lazo;

    sget-object v3, Lepo;->a:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    if-eqz v3, :cond_55

    invoke-virtual {v3}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result v3

    :goto_53
    move v8, v3

    goto :goto_57

    :cond_55
    const/4 v3, 0x0

    goto :goto_53

    :goto_57
    iget-object v3, v0, Lty7;->v:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v9

    iget v9, v9, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    if-nez v9, :cond_6e

    move-object v10, v4

    :cond_6e
    if-eqz v10, :cond_75

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_86

    :cond_75
    invoke-static {v3}, Lr8p;->a(Landroid/content/Context;)Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v9, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v10, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    int-to-float v9, v9

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v9, v3

    float-to-int v3, v9

    :goto_86
    const/16 v9, 0x258

    if-lt v3, v9, :cond_8d

    const/4 v3, 0x5

    :goto_8b
    move v9, v3

    goto :goto_8f

    :cond_8d
    const/4 v3, 0x4

    goto :goto_8b

    :goto_8f
    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    sget-object v3, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v10

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v11

    iget-object v1, v0, Lty7;->v:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v3, v1, Landroid/util/DisplayMetrics;->xdpi:F

    iget v1, v1, Landroid/util/DisplayMetrics;->ydpi:F

    mul-float/2addr v3, v1

    float-to-double v12, v3

    invoke-static {v12, v13}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v12

    double-to-float v1, v12

    float-to-int v12, v1

    iget-object v0, v0, Lty7;->v:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v13, v0, Landroid/util/DisplayMetrics;->density:F

    iget-boolean v14, v2, Lswo;->f:Z

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v15

    iget-object v0, v2, Lswo;->c:Ljava/lang/String;

    iget-object v1, v2, Lswo;->d:Ljava/lang/String;

    iget-object v3, v2, Lswo;->e:Lt5p;

    iget v3, v3, Lt5p;->a:I

    sget-object v16, Lepo;->a:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    if-eqz v16, :cond_ea

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_ea

    move-object/from16 v16, v0

    const-string v0, "00000000-0000-0000-0000-000000000000"

    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ec

    move-object/from16 v19, v4

    goto :goto_ee

    :cond_ea
    move-object/from16 v16, v0

    :cond_ec
    const/16 v19, 0x0

    :goto_ee
    iget-object v0, v2, Lswo;->b:Lwyo;

    move-object/from16 v20, v0

    move-object/from16 v17, v1

    move/from16 v18, v3

    invoke-direct/range {v5 .. v20}, Ljzo;-><init>(Ljava/lang/String;Lazo;IIIIIFILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lwyo;)V

    move-object v4, v5

    :goto_fa
    return-object v4

    :pswitch_fb
    sget-object v1, Lpx5;->a:Lpx5;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-boolean v1, v0, Lty7;->u:Z

    iget-object v0, v0, Lty7;->v:Landroid/content/Context;

    const-class v2, Landroidx/work/impl/background/systemalarm/RescheduleReceiver;

    invoke-static {v0, v2, v1}, Lpvf;->a(Landroid/content/Context;Ljava/lang/Class;Z)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_10c
    sget-object v1, Lpx5;->a:Lpx5;

    iget-boolean v4, v0, Lty7;->u:Z

    if-eqz v4, :cond_11f

    if-ne v4, v3, :cond_11a

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v0, p1

    goto :goto_145

    :cond_11a
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v4, 0x0

    goto :goto_14f

    :cond_11f
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v2, v0, Lty7;->v:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v2

    iget-object v2, v2, Lslk;->i:Lkze;

    new-instance v4, Lxf;

    const/4 v5, 0x2

    const/16 v6, 0x11

    const/4 v7, 0x0

    invoke-direct {v4, v5, v7, v6}, Lxf;-><init>(ILmt5;B)V

    iput-boolean v3, v0, Lty7;->u:Z

    invoke-static {v2, v4, v0}, Lxf8;->w(Lekc;Lkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_145

    move-object v4, v1

    goto :goto_14f

    :cond_145
    :goto_145
    check-cast v0, Lwvg;

    invoke-virtual {v0}, Lwvg;->b()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_14f
    return-object v4

    :pswitch_150
    move-object v7, v4

    sget-object v1, Lpx5;->a:Lpx5;

    iget-boolean v4, v0, Lty7;->u:Z

    if-eqz v4, :cond_162

    if-ne v4, v3, :cond_15d

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_173

    :cond_15d
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    move-object v4, v7

    goto :goto_175

    :cond_162
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Ln9a;->c:Ln9a;

    iget-object v4, v0, Lty7;->v:Landroid/content/Context;

    iput-boolean v3, v0, Lty7;->u:Z

    invoke-virtual {v2, v4, v0}, Ln9a;->v(Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_173

    move-object v4, v1

    goto :goto_175

    :cond_173
    :goto_173
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_175
    return-object v4

    :pswitch_data_176
    .packed-switch 0x0
        :pswitch_150
        :pswitch_10c
        :pswitch_fb
    .end packed-switch
.end method
