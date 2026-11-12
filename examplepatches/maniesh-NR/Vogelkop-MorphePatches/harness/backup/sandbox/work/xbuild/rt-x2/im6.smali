.class public final Lim6;
.super Lcej;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 15
    iput-byte p4, p0, Lim6;->a:B

    iput-object p1, p0, Lim6;->b:Ljava/lang/Object;

    iput-object p2, p0, Lim6;->c:Ljava/lang/Object;

    iput-object p3, p0, Lim6;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ln98;Lx5f;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lim6;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lim6;->b:Ljava/lang/Object;

    iput-object p2, p0, Lim6;->c:Ljava/lang/Object;

    sget-object p1, Lwb0;->d:Lwb0;

    iput-object p1, p0, Lim6;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lim6;->a:B

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    iget-object v7, v0, Lim6;->c:Ljava/lang/Object;

    iget-object v8, v0, Lim6;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_1de

    new-instance v0, Lvxi;

    check-cast v8, Lswf;

    check-cast v7, Lqp2;

    invoke-direct {v0, v1, v8, v7}, Lvxi;-><init>(Lmej;Lswf;Lqp2;)V

    return-object v0

    :pswitch_1b
    new-instance v2, Lqf;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    check-cast v8, Landroidx/fragment/app/w;

    check-cast v7, Ldb;

    iget-object v0, v0, Lim6;->d:Ljava/lang/Object;

    check-cast v0, Ltmi;

    new-instance v11, Llxh;

    const v9, 0x7f0803bc

    invoke-direct {v11, v9}, Llxh;-><init>(I)V

    new-instance v14, Lrxh;

    const v9, 0x7f1401f0

    invoke-direct {v14, v9}, Lrxh;-><init>(I)V

    new-instance v15, Lrxh;

    const v9, 0x7f1401ef

    invoke-direct {v15, v9}, Lrxh;-><init>(I)V

    new-instance v9, Lrxh;

    const v10, 0x7f1403bf

    invoke-direct {v9, v10}, Lrxh;-><init>(I)V

    new-instance v10, Lm98;

    const/4 v12, 0x5

    invoke-direct {v10, v0, v12}, Lm98;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v9}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v12

    if-nez v12, :cond_5a

    move-object/from16 v17, v6

    move-object/from16 v18, v17

    goto :goto_5e

    :cond_5a
    move-object/from16 v17, v9

    move-object/from16 v18, v10

    :goto_5e
    new-instance v9, Lrxh;

    const v10, 0x7f140b36

    invoke-direct {v9, v10}, Lrxh;-><init>(I)V

    new-instance v10, Lkp9;

    invoke-direct {v10, v8, v7, v0, v5}, Lkp9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, v9}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v0

    if-nez v0, :cond_76

    move-object/from16 v19, v6

    move-object/from16 v20, v19

    goto :goto_7a

    :cond_76
    move-object/from16 v19, v9

    move-object/from16 v20, v10

    :goto_7a
    new-instance v9, Lgua;

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v21, 0x1

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-direct/range {v9 .. v24}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v2, v1, v9, v4}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v2

    :pswitch_90
    new-instance v2, Lywf;

    check-cast v8, Lk6l;

    check-cast v7, Lcom/opera/android/settings/SettingsManager;

    iget-object v0, v0, Lim6;->d:Ljava/lang/Object;

    check-cast v0, Ld8j;

    invoke-direct {v2, v1, v8, v7, v0}, Lywf;-><init>(Lmej;Lk6l;Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    return-object v2

    :pswitch_9e
    new-instance v2, Lqf;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v0, v0, Lim6;->d:Ljava/lang/Object;

    check-cast v0, Lgjm;

    check-cast v7, Lorm;

    check-cast v8, Lyqd;

    new-instance v11, Llxh;

    const v5, 0x7f08059b

    invoke-direct {v11, v5}, Llxh;-><init>(I)V

    new-instance v5, Ldxh;

    const v9, 0x7f0400f5

    invoke-direct {v5, v9}, Ldxh;-><init>(I)V

    new-instance v14, Lrxh;

    const v9, 0x7f1412e5

    invoke-direct {v14, v9}, Lrxh;-><init>(I)V

    new-instance v15, Lrxh;

    const v9, 0x7f1412e4

    invoke-direct {v15, v9}, Lrxh;-><init>(I)V

    new-instance v9, Lrxh;

    const v10, 0x7f1412e3

    invoke-direct {v9, v10}, Lrxh;-><init>(I)V

    new-instance v10, Lzu5;

    const/4 v12, 0x3

    invoke-direct {v10, v7, v8, v12}, Lzu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, v9}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v8

    if-nez v8, :cond_e5

    move-object/from16 v19, v6

    move-object/from16 v20, v19

    goto :goto_e9

    :cond_e5
    move-object/from16 v19, v9

    move-object/from16 v20, v10

    :goto_e9
    new-instance v8, Lrxh;

    const v9, 0x7f140932

    invoke-direct {v8, v9}, Lrxh;-><init>(I)V

    new-instance v9, Lzu5;

    const/4 v10, 0x4

    invoke-direct {v9, v7, v0, v10}, Lzu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, v8}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v0

    if-nez v0, :cond_102

    move-object/from16 v17, v6

    move-object/from16 v18, v17

    goto :goto_106

    :cond_102
    move-object/from16 v17, v8

    move-object/from16 v18, v9

    :goto_106
    new-instance v9, Lgua;

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v21, 0x1

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object/from16 v22, v5

    invoke-direct/range {v9 .. v24}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v2, v1, v9, v4}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v2

    :pswitch_11c
    new-instance v0, Luc9;

    check-cast v8, Lk24;

    check-cast v7, [Ltc9;

    invoke-direct {v0, v1, v8, v7}, Luc9;-><init>(Lmej;Lk24;[Ltc9;)V

    return-object v0

    :pswitch_126
    new-instance v2, Lqf;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v7

    check-cast v8, Ln98;

    invoke-static {v8}, Lcqp;->Y(Ln98;)Lpxh;

    move-result-object v14

    invoke-static {v8}, Lcqp;->X(Ln98;)Lrxh;

    move-result-object v15

    new-instance v13, Llxh;

    const v9, 0x7f08077d

    invoke-direct {v13, v9}, Llxh;-><init>(I)V

    new-instance v9, Lrxh;

    const v10, 0x7f14092a

    invoke-direct {v9, v10}, Lrxh;-><init>(I)V

    new-instance v10, Lm98;

    invoke-direct {v10, v0, v3}, Lm98;-><init>(Ljava/lang/Object;B)V

    invoke-static {v7, v9}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v3

    if-nez v3, :cond_156

    move-object/from16 v17, v6

    move-object/from16 v18, v17

    goto :goto_15a

    :cond_156
    move-object/from16 v17, v9

    move-object/from16 v18, v10

    :goto_15a
    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_16f

    if-ne v3, v5, :cond_16b

    new-instance v3, Lrxh;

    const v8, 0x7f1406c4

    invoke-direct {v3, v8}, Lrxh;-><init>(I)V

    goto :goto_177

    :cond_16b
    invoke-static {}, Lh9o;->p()V

    goto :goto_1a1

    :cond_16f
    new-instance v3, Lrxh;

    const v8, 0x7f140809

    invoke-direct {v3, v8}, Lrxh;-><init>(I)V

    :goto_177
    new-instance v8, Lzu5;

    invoke-direct {v8, v0, v7, v5}, Lzu5;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    invoke-static {v7, v3}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v0

    if-nez v0, :cond_187

    move-object/from16 v19, v6

    move-object/from16 v20, v19

    goto :goto_18b

    :cond_187
    move-object/from16 v19, v3

    move-object/from16 v20, v8

    :goto_18b
    new-instance v9, Lgua;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v16, 0x0

    const/16 v21, 0x1

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-direct/range {v9 .. v24}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v2, v1, v9, v4}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    move-object v6, v2

    :goto_1a1
    return-object v6

    :pswitch_1a2
    new-instance v2, Liv6;

    check-cast v8, Ljava/lang/String;

    check-cast v7, Lq6e;

    iget-object v0, v0, Lim6;->d:Ljava/lang/Object;

    check-cast v0, Lr9g;

    invoke-direct {v2, v1, v8, v7, v0}, Liv6;-><init>(Lmej;Ljava/lang/String;Lq6e;Lr9g;)V

    return-object v2

    :pswitch_1b0
    iget-object v2, v0, Lim6;->d:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v6, "show_counter_auto"

    invoke-interface {v2, v6, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    add-int/2addr v2, v5

    invoke-interface {v4, v6, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v4, "last_show_auto"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-interface {v2, v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v2, Llm6;

    check-cast v7, Lyl6;

    new-instance v4, Ld06;

    invoke-direct {v4, v0}, Ld06;-><init>(Ljava/lang/Object;)V

    invoke-direct {v2, v1, v7, v3, v4}, Llm6;-><init>(Lmej;Lyl6;ZLgm6;)V

    return-object v2

    nop

    :pswitch_data_1de
    .packed-switch 0x0
        :pswitch_1b0
        :pswitch_1a2
        :pswitch_126
        :pswitch_11c
        :pswitch_9e
        :pswitch_90
        :pswitch_1b
    .end packed-switch
.end method

.method public final createSheetHost(Landroid/content/Context;)Lmej;
    .registers 5

    iget-byte v0, p0, Lim6;->a:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Lcej;->createSheetHost(Landroid/content/Context;)Lmej;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance p0, Lwq3;

    const v0, 0x7f0400f2

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lf03;->E(ILandroid/content/Context;I)I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-direct {p0, p1, v0, v1, v2}, Lwq3;-><init>(Landroid/content/Context;IZB)V

    return-object p0

    :pswitch_data_1a
    .packed-switch 0x7
        :pswitch_a
    .end packed-switch
.end method

.method public final onFinished(Lhjm;)V
    .registers 6

    iget-byte v0, p0, Lim6;->a:B

    iget-object v1, p0, Lim6;->b:Ljava/lang/Object;

    iget-object v2, p0, Lim6;->c:Ljava/lang/Object;

    sget-object v3, Lhjm;->b:Lhjm;

    packed-switch v0, :pswitch_data_54

    :pswitch_b
    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    return-void

    :pswitch_f
    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    sget-object v0, Lhjm;->a:Lhjm;

    if-eq p1, v0, :cond_1f

    iget-object p0, p0, Lim6;->d:Ljava/lang/Object;

    check-cast p0, Ltmi;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Ltmi;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1f
    return-void

    :pswitch_20
    if-ne p1, v3, :cond_2b

    check-cast v2, Lorm;

    sget-object p0, Lhl0;->d:Lhl0;

    check-cast v2, Lx5f;

    invoke-virtual {v2, p0}, Lx5f;->i0(Lhl0;)V

    :cond_2b
    return-void

    :pswitch_2c
    check-cast v2, Lx5f;

    check-cast v1, Ln98;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_40

    const/4 v0, 0x1

    if-ne p1, v0, :cond_3c

    const/16 p1, 0xa

    goto :goto_42

    :cond_3c
    invoke-static {}, Lh9o;->p()V

    goto :goto_4a

    :cond_40
    const/16 p1, 0x9

    :goto_42
    iget-object p0, p0, Lim6;->d:Ljava/lang/Object;

    check-cast p0, Lwb0;

    const/4 v0, 0x0

    invoke-virtual {v2, p1, p0, v0}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    :goto_4a
    return-void

    :pswitch_4b
    if-ne p1, v3, :cond_52

    check-cast v1, Lhm6;

    invoke-interface {v1, v3}, Lhm6;->n(Lhjm;)V

    :cond_52
    return-void

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_4b
        :pswitch_b
        :pswitch_2c
        :pswitch_b
        :pswitch_20
        :pswitch_b
        :pswitch_f
    .end packed-switch
.end method
