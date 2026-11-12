.class public final synthetic Lcfn;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Lcfn;->a:B

    invoke-direct/range {p0 .. p6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 44

    move-object/from16 v0, p0

    iget-byte v1, v0, Lcfn;->a:B

    const/4 v2, 0x5

    const-string v3, "vpn_pro.reminder.show_count"

    const/4 v4, 0x0

    const/4 v5, 0x1

    packed-switch v1, :pswitch_data_678

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lads_mobile_sdk/qr0;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v2, Lads_mobile_sdk/fo;->a:Lads_mobile_sdk/fo;

    const-string v3, "gads:topics_signal:enabled"

    invoke-virtual {v0, v3, v1, v2}, Lads_mobile_sdk/ov;->a(Ljava/lang/String;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0

    :pswitch_23
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lads_mobile_sdk/qr0;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v2, Lads_mobile_sdk/fo;->a:Lads_mobile_sdk/fo;

    const-string v3, "gads:attribution_reporting:enabled"

    invoke-virtual {v0, v3, v1, v2}, Lads_mobile_sdk/ov;->a(Ljava/lang/String;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0

    :pswitch_3a
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lf8p;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    :pswitch_44
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lv84;

    invoke-interface {v0}, Lv84;->isCanceled()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_51
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lo7p;

    invoke-virtual {v0}, Lo7p;->k()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5b
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lo7p;

    invoke-virtual {v0}, Lo7p;->k()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_65
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lcko;

    iget-boolean v1, v0, Lcko;->p:Z

    if-nez v1, :cond_80

    iput-boolean v5, v0, Lcko;->p:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, v0, Lcko;->g:J

    iget-wide v3, v0, Lcko;->f:J

    const-wide/16 v6, 0x0

    cmp-long v6, v3, v6

    if-ltz v6, :cond_80

    sub-long/2addr v1, v3

    iput-wide v1, v0, Lcko;->h:J

    :cond_80
    invoke-virtual {v0, v5}, Lcko;->d(Z)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_86
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lw6o;

    iget-object v0, v0, Lw6o;->h:Lxz6;

    iput-boolean v5, v0, Lxz6;->b:Z

    iput-boolean v5, v0, Lxz6;->c:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_93
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lw6o;

    iget-object v0, v0, Lw6o;->h:Lxz6;

    iput-boolean v5, v0, Lxz6;->b:Z

    iput-boolean v5, v0, Lxz6;->c:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a0
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lw6o;

    iget-object v0, v0, Lw6o;->h:Lxz6;

    iput-boolean v5, v0, Lxz6;->b:Z

    iput-boolean v5, v0, Lxz6;->c:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ad
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lq0o;

    iget-boolean v1, v0, Lq0o;->j:Z

    if-nez v1, :cond_b8

    iput-boolean v5, v0, Lq0o;->j:Z

    move v4, v5

    :cond_b8
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_bd
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Le0o;

    iget-object v1, v0, Le0o;->b:Lsdf;

    iget-object v2, v0, Le0o;->a:Lr65;

    invoke-virtual {v2}, Lr65;->m()Z

    move-result v3

    if-eqz v3, :cond_d6

    invoke-virtual {v2}, Lr65;->e()Z

    move-result v4

    goto :goto_11f

    :cond_d6
    iget-object v2, v1, Lsdf;->d:Lr65;

    invoke-virtual {v2}, Lr65;->m()Z

    move-result v2

    if-nez v2, :cond_f6

    iget-object v2, v1, Lsdf;->b:Ludf;

    iget-object v2, v2, Ludf;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "pushed.sequence"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-lt v2, v5, :cond_11e

    invoke-virtual {v1}, Lsdf;->a()I

    move-result v2

    if-nez v2, :cond_11e

    :cond_f6
    iget-object v0, v0, Le0o;->d:Ljjg;

    invoke-virtual {v0}, Ljjg;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object v2, v1, Lsdf;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v2}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v2

    if-eqz v2, :cond_11f

    if-eqz v0, :cond_11f

    iget-object v0, v1, Lsdf;->c:Lvx;

    invoke-virtual {v0}, Lvx;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lbef;->e()Lbef;

    move-result-object v2

    if-ne v0, v2, :cond_11f

    invoke-virtual {v1}, Lsdf;->b()I

    move-result v0

    if-nez v0, :cond_11f

    :cond_11e
    move v4, v5

    :cond_11f
    :goto_11f
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_124
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lc0o;

    iget-object v0, v0, Lc0o;->b:Lr65;

    iget-object v1, v0, Lr65;->b:Lvx;

    invoke-virtual {v1}, Lvx;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld75;

    iget-boolean v1, v1, Ld75;->e:Z

    if-eqz v1, :cond_143

    invoke-virtual {v0}, Lr65;->e()Z

    move-result v0

    if-eqz v0, :cond_143

    move v4, v5

    :cond_143
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_148
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lc0o;

    iget-object v0, v0, Lc0o;->h:Lt1;

    iget-object v0, v0, Lt1;->b:Landroid/content/Context;

    invoke-static {v0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwnh;

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Lwnh;->b(I)Z

    move-result v0

    xor-int/2addr v0, v5

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_166
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lc0o;

    iget-object v0, v0, Lc0o;->g:Ljjg;

    iget-object v0, v0, Ljjg;->b:Ljava/lang/Object;

    check-cast v0, Lsz4;

    invoke-static {v0}, Lyi4;->T(Lsz4;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_179
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lc0o;

    invoke-virtual {v0}, Lc0o;->a()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_186
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lc0o;

    iget-object v1, v0, Lc0o;->d:Lyl6;

    iget-object v2, v0, Lc0o;->a:Landroid/content/Context;

    invoke-static {v2}, Lr9n;->F(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1ea

    invoke-virtual {v1}, Lyl6;->c()Z

    move-result v2

    if-nez v2, :cond_1a6

    invoke-virtual {v1}, Lyl6;->b()Z

    move-result v2

    if-eqz v2, :cond_1ea

    :cond_1a6
    invoke-virtual {v1}, Lyl6;->a()Z

    move-result v2

    if-eqz v2, :cond_1ea

    invoke-virtual {v1}, Lyl6;->d()Lsl6;

    move-result-object v1

    invoke-virtual {v1}, Lsl6;->b()Z

    move-result v1

    if-nez v1, :cond_1ea

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-ge v1, v2, :cond_1da

    iget-object v1, v0, Lc0o;->h:Lt1;

    iget-object v1, v1, Lt1;->b:Landroid/content/Context;

    invoke-static {v1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v1

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwnh;

    const/high16 v2, 0x20000

    invoke-virtual {v1, v2}, Lwnh;->a(I)Z

    move-result v2

    if-nez v2, :cond_1da

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lwnh;->b(I)Z

    move-result v1

    if-eqz v1, :cond_1dc

    :cond_1da
    move v4, v5

    goto :goto_1ea

    :cond_1dc
    iget-object v0, v0, Lc0o;->c:Lox3;

    invoke-virtual {v0}, Lox3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/CommandLine;

    const-string v1, "oem-onboarding"

    invoke-virtual {v0, v1}, Lorg/chromium/base/CommandLine;->c(Ljava/lang/String;)Z

    move-result v4

    :cond_1ea
    :goto_1ea
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_1ef
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lc0o;

    invoke-virtual {v0}, Lc0o;->a()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_1fc
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Li0o;

    iget-object v0, v0, Li0o;->b:Lt1;

    iget-object v0, v0, Lt1;->b:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "personalization.onboarding.completed"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/2addr v0, v5

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_216
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lctn;

    check-cast v0, Lftn;

    iget-object v0, v0, Lftn;->c:Letn;

    iget-object v0, v0, Letn;->a:Ln7i;

    invoke-virtual {v0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_226
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lvsn;

    iget-boolean v1, v0, Lvsn;->b:Z

    iget-object v2, v0, Lvsn;->c:Ls62;

    iget-object v3, v0, Lvsn;->q:Lwnm;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltsn;

    iget-object v3, v3, Ltsn;->c:Lnsn;

    sget-object v9, Lnsn;->d:Lnsn;

    if-eq v3, v9, :cond_5df

    iget-object v3, v0, Lvsn;->g:Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_5df

    iget-object v3, v2, Ls62;->u:Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lx52;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v7, 0x2

    if-eqz v3, :cond_294

    if-eq v3, v5, :cond_292

    if-ne v3, v7, :cond_28c

    iget-boolean v3, v0, Lvsn;->t:Z

    if-nez v3, :cond_279

    iget-boolean v3, v0, Lvsn;->s:Z

    if-nez v3, :cond_279

    invoke-virtual {v2}, Ls62;->e()Liy1;

    move-result-object v3

    iget-object v3, v3, Liy1;->m:Lqde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_279

    move v3, v5

    goto :goto_27a

    :cond_279
    move v3, v4

    :goto_27a
    sget-object v9, Lrsn;->f:Lrsn;

    sget-object v11, Lnsn;->f:Lnsn;

    new-instance v10, Lisn;

    invoke-direct {v10, v1, v3}, Lisn;-><init>(ZZ)V

    new-instance v8, Ltsn;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v8 .. v14}, Ltsn;-><init>(Lzm9;Llsn;Lnsn;ZZZ)V

    goto :goto_2a6

    :cond_28c
    invoke-static {}, Lh9o;->p()V

    :goto_28f
    const/4 v6, 0x0

    goto/16 :goto_5ef

    :cond_292
    const/4 v8, 0x0

    goto :goto_2a6

    :cond_294
    sget-object v10, Lrsn;->f:Lrsn;

    sget-object v12, Lnsn;->a:Lnsn;

    new-instance v11, Lisn;

    invoke-direct {v11, v1, v5}, Lisn;-><init>(ZZ)V

    new-instance v9, Ltsn;

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v9 .. v15}, Ltsn;-><init>(Lzm9;Llsn;Lnsn;ZZZ)V

    move-object v8, v9

    :goto_2a6
    if-eqz v8, :cond_2ab

    move-object v6, v8

    goto/16 :goto_5ef

    :cond_2ab
    iget-object v3, v2, Ls62;->s:Lode;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lu42;

    iget-object v8, v2, Ls62;->t:Lkze;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_5ca

    if-eqz v3, :cond_5ca

    iget-object v8, v3, Lu42;->c:Lpu4;

    iget-object v9, v8, Lpu4;->e:Lw42;

    sget-object v10, Lw42;->c:Lw42;

    if-eq v9, v10, :cond_5ca

    iget-object v10, v3, Lu42;->d:Ljava/util/LinkedHashMap;

    invoke-interface {v10}, Ljava/util/Map;->size()I

    move-result v10

    if-le v10, v5, :cond_2d5

    move v10, v5

    goto :goto_2d6

    :cond_2d5
    move v10, v4

    :goto_2d6
    iget-boolean v11, v8, Lpu4;->f:Z

    iget-object v12, v8, Lpu4;->h:Lqu4;

    sget-object v13, Lw42;->d:Lw42;

    if-ne v9, v13, :cond_2e0

    move v14, v5

    goto :goto_2e1

    :cond_2e0
    move v14, v4

    :goto_2e1
    iget-object v15, v2, Ls62;->p:Lq52;

    iget-object v15, v15, Lq52;->c:Lkze;

    invoke-virtual {v15}, Lekc;->g()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lo52;

    instance-of v6, v15, Ll52;

    if-nez v6, :cond_2f5

    instance-of v4, v15, Lj52;

    if-nez v4, :cond_2f5

    const/4 v4, 0x0

    goto :goto_2f6

    :cond_2f5
    move v4, v5

    :goto_2f6
    if-nez v6, :cond_2fe

    instance-of v6, v15, Ln52;

    if-nez v6, :cond_2fe

    const/4 v6, 0x0

    goto :goto_2ff

    :cond_2fe
    move v6, v5

    :goto_2ff
    iget-boolean v15, v0, Lvsn;->m:Z

    iget-object v8, v8, Lpu4;->b:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v17

    const-string v18, ""

    packed-switch v17, :pswitch_data_6ac

    invoke-static {}, Lh9o;->p()V

    goto :goto_28f

    :pswitch_310
    move/from16 v17, v5

    goto :goto_315

    :pswitch_313
    const/16 v17, 0x0

    :goto_315
    if-eqz v11, :cond_38b

    new-instance v19, Lqsn;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v20

    if-lez v20, :cond_327

    new-instance v7, Lqxh;

    invoke-direct {v7, v8}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :goto_324
    move-object/from16 v21, v7

    goto :goto_330

    :cond_327
    new-instance v7, Lrxh;

    const v8, 0x7f140102

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    goto :goto_324

    :goto_330
    new-instance v7, Ldxh;

    const v8, 0x7f0402f0

    invoke-direct {v7, v8}, Ldxh;-><init>(I)V

    new-instance v8, Lpsn;

    sget-object v5, Losn;->a:Losn;

    if-eqz v6, :cond_343

    sget-object v6, Losn;->c:Losn;

    :goto_340
    move-object/from16 v34, v2

    goto :goto_345

    :cond_343
    move-object v6, v5

    goto :goto_340

    :goto_345
    sget-object v2, Losn;->c:Losn;

    invoke-direct {v8, v5, v6, v2}, Lpsn;-><init>(Losn;Losn;Losn;)V

    new-instance v24, Lssn;

    if-nez v17, :cond_353

    move-object/from16 v27, v2

    :goto_350
    move-object/from16 v28, v27

    goto :goto_356

    :cond_353
    move-object/from16 v27, v5

    goto :goto_350

    :goto_356
    if-nez v15, :cond_364

    if-nez v17, :cond_364

    if-nez v14, :cond_35f

    move-object/from16 v29, v2

    goto :goto_366

    :cond_35f
    sget-object v6, Losn;->b:Losn;

    move-object/from16 v29, v6

    goto :goto_366

    :cond_364
    move-object/from16 v29, v5

    :goto_366
    if-nez v4, :cond_36b

    move-object/from16 v30, v2

    goto :goto_36d

    :cond_36b
    move-object/from16 v30, v5

    :goto_36d
    if-nez v17, :cond_374

    if-nez v15, :cond_374

    move-object/from16 v32, v2

    goto :goto_376

    :cond_374
    move-object/from16 v32, v5

    :goto_376
    move-object/from16 v33, v2

    move-object/from16 v31, v2

    move-object/from16 v26, v24

    invoke-direct/range {v26 .. v33}, Lssn;-><init>(Losn;Losn;Losn;Losn;Losn;Losn;Losn;)V

    const/16 v20, 0x0

    move-object/from16 v22, v7

    move-object/from16 v23, v8

    invoke-direct/range {v19 .. v24}, Lzm9;-><init>(ZLpxh;Ldxh;Lpsn;Lssn;)V

    :goto_388
    move-object/from16 v2, v19

    goto :goto_3dc

    :cond_38b
    move-object/from16 v34, v2

    new-instance v26, Lqsn;

    new-instance v2, Lrxh;

    const v5, 0x7f140110

    invoke-direct {v2, v5}, Lrxh;-><init>(I)V

    new-instance v5, Ldxh;

    const v6, 0x7f0402ed

    invoke-direct {v5, v6}, Ldxh;-><init>(I)V

    new-instance v6, Lpsn;

    if-nez v15, :cond_3a6

    sget-object v7, Losn;->c:Losn;

    goto :goto_3a8

    :cond_3a6
    sget-object v7, Losn;->a:Losn;

    :goto_3a8
    sget-object v8, Losn;->a:Losn;

    sget-object v14, Losn;->c:Losn;

    invoke-direct {v6, v7, v8, v14}, Lpsn;-><init>(Losn;Losn;Losn;)V

    new-instance v31, Lssn;

    if-nez v4, :cond_3b6

    move-object/from16 v39, v14

    goto :goto_3b8

    :cond_3b6
    move-object/from16 v39, v8

    :goto_3b8
    move-object/from16 v37, v8

    move-object/from16 v38, v8

    move-object/from16 v41, v8

    move-object/from16 v42, v14

    move-object/from16 v36, v8

    move-object/from16 v40, v14

    move-object/from16 v35, v31

    invoke-direct/range {v35 .. v42}, Lssn;-><init>(Losn;Losn;Losn;Losn;Losn;Losn;Losn;)V

    const/16 v27, 0x1

    move-object/from16 v28, v2

    move-object/from16 v29, v5

    move-object/from16 v30, v6

    invoke-direct/range {v26 .. v31}, Lzm9;-><init>(ZLpxh;Ldxh;Lpsn;Lssn;)V

    move-object/from16 v2, v26

    goto :goto_3dc

    :pswitch_3d7
    move-object/from16 v34, v2

    sget-object v19, Lrsn;->f:Lrsn;

    goto :goto_388

    :goto_3dc
    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    packed-switch v5, :pswitch_data_6be

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_28f

    :pswitch_3e8
    sget-object v5, Lnsn;->b:Lnsn;

    :goto_3ea
    move-object v14, v5

    goto :goto_3f7

    :pswitch_3ec
    if-eqz v11, :cond_3f1

    sget-object v5, Lnsn;->b:Lnsn;

    goto :goto_3ea

    :cond_3f1
    sget-object v5, Lnsn;->c:Lnsn;

    goto :goto_3ea

    :pswitch_3f4
    sget-object v5, Lnsn;->a:Lnsn;

    goto :goto_3ea

    :goto_3f7
    invoke-virtual/range {v34 .. v34}, Ls62;->f()Lqyj;

    move-result-object v5

    iget-object v5, v5, Lqyj;->i:Lode;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lhbn;

    invoke-virtual {v0}, Lvsn;->b()Ljava/util/List;

    move-result-object v34

    iget-boolean v6, v0, Lvsn;->t:Z

    if-nez v6, :cond_417

    iget-boolean v6, v0, Lvsn;->s:Z

    if-nez v6, :cond_417

    invoke-interface/range {v34 .. v34}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_417

    const/4 v6, 0x1

    goto :goto_418

    :cond_417
    const/4 v6, 0x0

    :goto_418
    iget-object v3, v3, Lu42;->b:Lx42;

    sget-object v7, Lusn;->b:[I

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    aget v3, v7, v3

    const/4 v7, 0x3

    const/4 v8, -0x1

    if-eq v3, v8, :cond_44f

    const/4 v8, 0x1

    if-eq v3, v8, :cond_449

    const/4 v8, 0x2

    if-eq v3, v8, :cond_43b

    if-eq v3, v7, :cond_44f

    const/4 v0, 0x4

    if-eq v3, v0, :cond_436

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_28f

    :cond_436
    invoke-static/range {v18 .. v18}, Lqp2;->o(Ljava/lang/String;)V

    goto/16 :goto_28f

    :cond_43b
    new-instance v0, Lksn;

    if-eqz v12, :cond_442

    iget-boolean v3, v12, Lqu4;->a:Z

    goto :goto_443

    :cond_442
    const/4 v3, 0x0

    :goto_443
    invoke-direct {v0, v1, v3}, Lksn;-><init>(ZZ)V

    :goto_446
    move-object v13, v0

    goto/16 :goto_59f

    :cond_449
    new-instance v0, Lisn;

    invoke-direct {v0, v1, v6}, Lisn;-><init>(ZZ)V

    goto :goto_446

    :cond_44f
    sget-object v3, Lusn;->c:[I

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    aget v3, v3, v8

    packed-switch v3, :pswitch_data_6d0

    :pswitch_45a
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_28f

    :pswitch_45f
    invoke-static/range {v18 .. v18}, Lqp2;->o(Ljava/lang/String;)V

    goto/16 :goto_28f

    :pswitch_464
    if-ne v9, v13, :cond_468

    const/4 v3, 0x1

    goto :goto_469

    :cond_468
    const/4 v3, 0x0

    :goto_469
    invoke-interface/range {v34 .. v34}, Ljava/util/List;->size()I

    move-result v8

    if-ge v8, v7, :cond_472

    const/16 v30, 0x1

    goto :goto_474

    :cond_472
    const/16 v30, 0x0

    :goto_474
    move-object/from16 v7, v34

    check-cast v7, Ljava/lang/Iterable;

    instance-of v8, v7, Ljava/util/Collection;

    if-eqz v8, :cond_485

    move-object v8, v7

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_49b

    :cond_485
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_489
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_49b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljx1;

    instance-of v8, v8, Lrx1;

    if-nez v8, :cond_489

    const/4 v7, 0x0

    goto :goto_49c

    :cond_49b
    const/4 v7, 0x1

    :goto_49c
    new-instance v8, Lrxh;

    const v13, 0x7f140159

    invoke-direct {v8, v13}, Lrxh;-><init>(I)V

    instance-of v13, v5, Lgbn;

    if-eqz v13, :cond_4bb

    iget-boolean v6, v0, Lvsn;->u:Z

    if-eqz v6, :cond_4b4

    new-instance v8, Lrxh;

    const v6, 0x7f140162

    invoke-direct {v8, v6}, Lrxh;-><init>(I)V

    :cond_4b4
    move-object/from16 v27, v8

    const/16 v28, 0x0

    :goto_4b8
    const/16 v36, 0x0

    goto :goto_51d

    :cond_4bb
    instance-of v13, v5, Lbbn;

    if-eqz v13, :cond_4fc

    move-object v6, v5

    check-cast v6, Lbbn;

    iget-object v6, v6, Lbbn;->c:Lode;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    if-eqz v6, :cond_4d2

    invoke-static {v6}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_4d3

    :cond_4d2
    const/4 v6, 0x0

    :cond_4d3
    if-eqz v6, :cond_4df

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_4df

    const/16 v25, 0x0

    :goto_4dd
    const/4 v8, 0x1

    goto :goto_4e2

    :cond_4df
    const/16 v25, 0x1

    goto :goto_4dd

    :goto_4e2
    xor-int/lit8 v13, v25, 0x1

    iput-boolean v13, v0, Lvsn;->s:Z

    if-eqz v6, :cond_4ee

    new-instance v8, Lqxh;

    invoke-direct {v8, v6}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_4ef

    :cond_4ee
    const/4 v8, 0x0

    :goto_4ef
    new-instance v6, Lrxh;

    const v13, 0x7f140122

    invoke-direct {v6, v13}, Lrxh;-><init>(I)V

    move-object/from16 v27, v6

    move-object/from16 v28, v8

    goto :goto_4b8

    :cond_4fc
    if-eqz v5, :cond_517

    instance-of v13, v5, Lebn;

    if-nez v13, :cond_517

    instance-of v13, v5, Lcbn;

    if-nez v13, :cond_517

    instance-of v13, v5, Lfbn;

    if-nez v13, :cond_517

    sget-object v13, Ldbn;->a:Ldbn;

    invoke-virtual {v5, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_517

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_28f

    :cond_517
    move/from16 v36, v6

    move-object/from16 v27, v8

    const/16 v28, 0x0

    :goto_51d
    if-eqz v1, :cond_528

    iget-boolean v1, v0, Lvsn;->s:Z

    if-nez v1, :cond_528

    if-nez v3, :cond_528

    const/16 v32, 0x1

    goto :goto_52a

    :cond_528
    const/16 v32, 0x0

    :goto_52a
    if-eqz v32, :cond_531

    if-eqz v30, :cond_531

    const/16 v33, 0x1

    goto :goto_533

    :cond_531
    const/16 v33, 0x0

    :goto_533
    new-instance v26, Ljsn;

    sget-object v1, Lw42;->d:Lw42;

    if-ne v9, v1, :cond_53e

    sget-object v0, Lmsn;->f:Lmsn;

    :goto_53b
    move-object/from16 v29, v0

    goto :goto_56a

    :cond_53e
    if-eqz v5, :cond_54a

    invoke-virtual {v5}, Lhbn;->a()Z

    move-result v1

    const/4 v8, 0x1

    if-ne v1, v8, :cond_54a

    sget-object v0, Lmsn;->e:Lmsn;

    goto :goto_53b

    :cond_54a
    iget-boolean v1, v0, Lvsn;->s:Z

    if-eqz v1, :cond_556

    if-eqz v7, :cond_553

    sget-object v0, Lmsn;->b:Lmsn;

    goto :goto_53b

    :cond_553
    sget-object v0, Lmsn;->a:Lmsn;

    goto :goto_53b

    :cond_556
    iget-object v0, v0, Lvsn;->f:Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_567

    sget-object v0, Lmsn;->a:Lmsn;

    goto :goto_53b

    :cond_567
    sget-object v0, Lmsn;->d:Lmsn;

    goto :goto_53b

    :goto_56a
    if-eqz v30, :cond_577

    if-eqz v5, :cond_574

    invoke-virtual {v5}, Lhbn;->a()Z

    move-result v0

    if-eqz v0, :cond_577

    :cond_574
    const/16 v31, 0x1

    goto :goto_579

    :cond_577
    const/16 v31, 0x0

    :goto_579
    move-object/from16 v0, v34

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/16 v25, 0x1

    xor-int/lit8 v35, v0, 0x1

    if-eqz v12, :cond_590

    iget-boolean v0, v12, Lqu4;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    move-object/from16 v37, v6

    goto :goto_592

    :cond_590
    const/16 v37, 0x0

    :goto_592
    invoke-direct/range {v26 .. v37}, Ljsn;-><init>(Lrxh;Lqxh;Lmsn;ZZZZLjava/util/List;ZZLjava/lang/Boolean;)V

    move-object/from16 v13, v26

    goto :goto_59f

    :pswitch_598
    new-instance v0, Lisn;

    invoke-direct {v0, v1, v6}, Lisn;-><init>(ZZ)V

    goto/16 :goto_446

    :goto_59f
    if-eqz v4, :cond_5a5

    if-eqz v10, :cond_5a5

    const/4 v15, 0x1

    goto :goto_5a6

    :cond_5a5
    const/4 v15, 0x0

    :goto_5a6
    iget-object v0, v2, Lzm9;->e:Ljava/lang/Object;

    check-cast v0, Lssn;

    iget-object v0, v0, Lssn;->d:Losn;

    sget-object v1, Losn;->c:Losn;

    if-ne v0, v1, :cond_5b5

    const/16 v16, 0x1

    :goto_5b2
    move/from16 v17, v11

    goto :goto_5b8

    :cond_5b5
    const/16 v16, 0x0

    goto :goto_5b2

    :goto_5b8
    new-instance v11, Ltsn;

    move-object v12, v2

    invoke-direct/range {v11 .. v17}, Ltsn;-><init>(Lzm9;Llsn;Lnsn;ZZZ)V

    move-object v6, v11

    goto :goto_5ef

    :pswitch_5c0
    invoke-static/range {v18 .. v18}, Lqp2;->o(Ljava/lang/String;)V

    goto/16 :goto_28f

    :pswitch_5c5
    invoke-static/range {v18 .. v18}, Lqp2;->o(Ljava/lang/String;)V

    goto/16 :goto_28f

    :cond_5ca
    sget-object v0, Lrsn;->f:Lrsn;

    sget-object v3, Lnsn;->a:Lnsn;

    new-instance v2, Lisn;

    const/4 v8, 0x1

    invoke-direct {v2, v1, v8}, Lisn;-><init>(ZZ)V

    move-object v1, v0

    new-instance v0, Ltsn;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v6}, Ltsn;-><init>(Lzm9;Llsn;Lnsn;ZZZ)V

    move-object v6, v0

    goto :goto_5ef

    :cond_5df
    sget-object v7, Lrsn;->f:Lrsn;

    new-instance v8, Lksn;

    const/4 v0, 0x0

    invoke-direct {v8, v1, v0}, Lksn;-><init>(ZZ)V

    new-instance v6, Ltsn;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v6 .. v12}, Ltsn;-><init>(Lzm9;Llsn;Lnsn;ZZZ)V

    :goto_5ef
    return-object v6

    :pswitch_5f0
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ldfn;

    iget-object v0, v0, Ldfn;->a:Lru9;

    iget-object v1, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const/4 v2, 0x0

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    const/16 v25, 0x1

    add-int/lit8 v1, v1, 0x1

    iget-object v2, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_612
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ldfn;

    iget-object v1, v0, Ldfn;->c:Lx5f;

    iget-object v4, v0, Ldfn;->a:Lru9;

    iget-object v5, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const/4 v6, 0x0

    invoke-interface {v5, v3, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v5, Lwb0;->b:Lwb0;

    invoke-virtual {v1, v2, v5, v3}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    invoke-virtual {v4}, Lru9;->b()Lnv6;

    move-result-object v1

    iget-object v2, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    const-string v3, "vpn_pro.kill_switch.on"

    invoke-interface {v2, v3, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1}, Lnv6;->w()V

    iget-object v0, v0, Ldfn;->e:Lqt3;

    invoke-virtual {v0}, Lqt3;->run()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_642
    move v6, v4

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ldfn;

    iget-object v1, v0, Ldfn;->c:Lx5f;

    iget-object v0, v0, Ldfn;->a:Lru9;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, v3, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v3, Lwb0;->d:Lwb0;

    invoke-virtual {v1, v2, v3, v0}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_65d
    move v6, v4

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ldfn;

    iget-object v1, v0, Ldfn;->c:Lx5f;

    iget-object v0, v0, Ldfn;->a:Lru9;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, v3, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v3, Lwb0;->c:Lwb0;

    invoke-virtual {v1, v2, v3, v0}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_678
    .packed-switch 0x0
        :pswitch_65d
        :pswitch_642
        :pswitch_612
        :pswitch_5f0
        :pswitch_226
        :pswitch_216
        :pswitch_1fc
        :pswitch_1ef
        :pswitch_186
        :pswitch_179
        :pswitch_166
        :pswitch_148
        :pswitch_124
        :pswitch_bd
        :pswitch_ad
        :pswitch_a0
        :pswitch_93
        :pswitch_86
        :pswitch_65
        :pswitch_5b
        :pswitch_51
        :pswitch_44
        :pswitch_3a
        :pswitch_23
    .end packed-switch

    :pswitch_data_6ac
    .packed-switch 0x0
        :pswitch_5c5
        :pswitch_3d7
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_310
        :pswitch_310
    .end packed-switch

    :pswitch_data_6be
    .packed-switch 0x0
        :pswitch_5c0
        :pswitch_3f4
        :pswitch_3ec
        :pswitch_3e8
        :pswitch_3e8
        :pswitch_3e8
        :pswitch_3e8
    .end packed-switch

    :pswitch_data_6d0
    .packed-switch -0x1
        :pswitch_598
        :pswitch_45a
        :pswitch_464
        :pswitch_464
        :pswitch_598
        :pswitch_598
        :pswitch_598
        :pswitch_598
        :pswitch_45f
    .end packed-switch
.end method
