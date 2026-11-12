.class public final Lb8p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lb8p;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lb8p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lb8p;->a:Lb8p;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.SdkConfig"

    const/16 v3, 0x1c

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "update_interval"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "bg_cancel_delay"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "max_blocked_ads"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "blocked_ad_expires"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "browser_prioritized_list"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "browser_whitelist"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "browser_blacklist"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "banner_auto_refresh_interval"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "banner_transition_content_ready_timeout"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "accepts_coea"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "oac_enabled"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "oac_whitelist"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "oac_blacklist"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "oac_error_enabled"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "oac_error_whitelist"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "oac_error_blacklist"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "oac_bpis_throttle_interval"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "oac_report_click_coords"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "interstitial_enable_back_button_interval"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "appopen_enable_back_button_interval"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "indexurl_domains"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "authorized_domains"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "aqurl"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ab_group"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ab_tpl_indexurl"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ab_tpl_settings"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "geofetch_enabled"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "sf_clint_enabled"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lb8p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 26

    sget-object v0, Lz8p;->L:[Lkotlinx/serialization/KSerializer;

    const/4 v1, 0x4

    aget-object v2, v0, v1

    invoke-static {v2}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/4 v3, 0x5

    aget-object v4, v0, v3

    invoke-static {v4}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    const/4 v5, 0x6

    aget-object v6, v0, v5

    invoke-static {v6}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v6

    const/16 v7, 0xb

    aget-object v8, v0, v7

    invoke-static {v8}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v8

    const/16 v9, 0xc

    aget-object v10, v0, v9

    invoke-static {v10}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v10

    const/16 v11, 0xe

    aget-object v12, v0, v11

    invoke-static {v12}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v12

    const/16 v13, 0xf

    aget-object v14, v0, v13

    invoke-static {v14}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v14

    const/16 v15, 0x14

    aget-object v16, v0, v15

    invoke-static/range {v16 .. v16}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v16

    const/16 v17, 0x15

    aget-object v0, v0, v17

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    sget-object v18, Lxhk;->a:Lxhk;

    invoke-static/range {v18 .. v18}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v19

    invoke-static/range {v18 .. v18}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v20

    invoke-static/range {v18 .. v18}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v18

    sget-object v21, Lkno;->a:Lkno;

    invoke-static/range {v21 .. v21}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v21

    move/from16 p0, v1

    const/16 v1, 0x1c

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    sget-object v22, Lecb;->a:Lecb;

    const/16 v23, 0x0

    aput-object v22, v1, v23

    const/16 v23, 0x1

    aput-object v22, v1, v23

    const/16 v23, 0x2

    aput-object v22, v1, v23

    sget-object v23, Loe7;->a:Loe7;

    const/16 v24, 0x3

    aput-object v23, v1, v24

    aput-object v2, v1, p0

    aput-object v4, v1, v3

    aput-object v6, v1, v5

    const/4 v2, 0x7

    aput-object v22, v1, v2

    const/16 v2, 0x8

    aput-object v22, v1, v2

    sget-object v2, Lrn3;->a:Lrn3;

    const/16 v3, 0x9

    aput-object v2, v1, v3

    const/16 v3, 0xa

    aput-object v2, v1, v3

    aput-object v8, v1, v7

    aput-object v10, v1, v9

    const/16 v3, 0xd

    aput-object v2, v1, v3

    aput-object v12, v1, v11

    aput-object v14, v1, v13

    const/16 v3, 0x10

    aput-object v23, v1, v3

    const/16 v3, 0x11

    aput-object v2, v1, v3

    const/16 v3, 0x12

    aput-object v22, v1, v3

    const/16 v3, 0x13

    aput-object v22, v1, v3

    aput-object v16, v1, v15

    aput-object v0, v1, v17

    const/16 v0, 0x16

    aput-object v19, v1, v0

    const/16 v0, 0x17

    aput-object v20, v1, v0

    const/16 v0, 0x18

    aput-object v18, v1, v0

    const/16 v0, 0x19

    aput-object v21, v1, v0

    const/16 v0, 0x1a

    aput-object v2, v1, v0

    const/16 v0, 0x1b

    aput-object v2, v1, v0

    return-object v1
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 42

    sget-object v0, Lb8p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Lz8p;->L:[Lkotlinx/serialization/KSerializer;

    const-wide/16 v5, 0x0

    move-wide v13, v5

    move-wide/from16 v27, v13

    const/4 v5, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    :goto_41
    if-eqz v5, :cond_1a4

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v6

    const/4 v8, 0x2

    const/16 p0, 0x0

    const/16 v7, 0x8

    const/16 v4, 0x10

    const/4 v3, 0x4

    packed-switch v6, :pswitch_data_1ae

    invoke-static {v6}, Lt3p;->d(I)V

    return-object p0

    :pswitch_56
    const/16 v3, 0x1b

    invoke-interface {v1, v0, v3}, Loh5;->C(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v39

    const/high16 v8, 0x8000000

    goto/16 :goto_19d

    :pswitch_60
    const/16 v3, 0x1a

    invoke-interface {v1, v0, v3}, Loh5;->C(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v38

    const/high16 v8, 0x4000000

    goto/16 :goto_19d

    :pswitch_6a
    sget-object v3, Lkno;->a:Lkno;

    const/16 v4, 0x19

    invoke-interface {v1, v0, v4, v3}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v37, v3

    check-cast v37, Lkotlinx/serialization/json/c;

    const/high16 v8, 0x2000000

    goto/16 :goto_19d

    :pswitch_7a
    sget-object v3, Lxhk;->a:Lxhk;

    const/16 v4, 0x18

    invoke-interface {v1, v0, v4, v3}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v36, v3

    check-cast v36, Ljava/lang/String;

    const/high16 v8, 0x1000000

    goto/16 :goto_19d

    :pswitch_8a
    sget-object v3, Lxhk;->a:Lxhk;

    const/16 v4, 0x17

    invoke-interface {v1, v0, v4, v3}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v35, v3

    check-cast v35, Ljava/lang/String;

    const/high16 v8, 0x800000

    goto/16 :goto_19d

    :pswitch_9a
    sget-object v3, Lxhk;->a:Lxhk;

    const/16 v4, 0x16

    invoke-interface {v1, v0, v4, v3}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v34, v3

    check-cast v34, Ljava/lang/String;

    const/high16 v8, 0x400000

    goto/16 :goto_19d

    :pswitch_aa
    const/16 v3, 0x15

    aget-object v4, v2, v3

    invoke-interface {v1, v0, v3, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v33, v3

    check-cast v33, Ljava/util/Set;

    const/high16 v8, 0x200000

    goto/16 :goto_19d

    :pswitch_ba
    const/16 v3, 0x14

    aget-object v4, v2, v3

    invoke-interface {v1, v0, v3, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v32, v3

    check-cast v32, Ljava/util/Set;

    const/high16 v8, 0x100000

    goto/16 :goto_19d

    :pswitch_ca
    const/16 v3, 0x13

    invoke-interface {v1, v0, v3}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v31

    const/high16 v8, 0x80000

    goto/16 :goto_19d

    :pswitch_d4
    const/16 v3, 0x12

    invoke-interface {v1, v0, v3}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v30

    const/high16 v8, 0x40000

    goto/16 :goto_19d

    :pswitch_de
    const/16 v3, 0x11

    invoke-interface {v1, v0, v3}, Loh5;->C(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v29

    const/high16 v8, 0x20000

    goto/16 :goto_19d

    :pswitch_e8
    invoke-interface {v1, v0, v4}, Loh5;->E(Lkotlinx/serialization/descriptors/SerialDescriptor;I)D

    move-result-wide v27

    const/high16 v8, 0x10000

    goto/16 :goto_19d

    :pswitch_f0
    const/16 v3, 0xf

    aget-object v4, v2, v3

    invoke-interface {v1, v0, v3, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v26, v3

    check-cast v26, Ljava/util/Set;

    const v8, 0x8000

    goto/16 :goto_19d

    :pswitch_101
    const/16 v3, 0xe

    aget-object v4, v2, v3

    invoke-interface {v1, v0, v3, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v25, v3

    check-cast v25, Ljava/util/Set;

    const/16 v8, 0x4000

    goto/16 :goto_19d

    :pswitch_111
    const/16 v3, 0xd

    invoke-interface {v1, v0, v3}, Loh5;->C(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v24

    const/16 v8, 0x2000

    goto/16 :goto_19d

    :pswitch_11b
    const/16 v3, 0xc

    aget-object v4, v2, v3

    invoke-interface {v1, v0, v3, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v23, v3

    check-cast v23, Ljava/util/Set;

    const/16 v8, 0x1000

    goto/16 :goto_19d

    :pswitch_12b
    const/16 v3, 0xb

    aget-object v4, v2, v3

    invoke-interface {v1, v0, v3, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v22, v3

    check-cast v22, Ljava/util/Set;

    const/16 v8, 0x800

    goto/16 :goto_19d

    :pswitch_13b
    const/16 v3, 0xa

    invoke-interface {v1, v0, v3}, Loh5;->C(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v21

    const/16 v8, 0x400

    goto :goto_19d

    :pswitch_144
    const/16 v3, 0x9

    invoke-interface {v1, v0, v3}, Loh5;->C(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v20

    const/16 v8, 0x200

    goto :goto_19d

    :pswitch_14d
    invoke-interface {v1, v0, v7}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v19

    const/16 v8, 0x100

    goto :goto_19d

    :pswitch_154
    const/4 v3, 0x7

    invoke-interface {v1, v0, v3}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v18

    const/16 v8, 0x80

    goto :goto_19d

    :pswitch_15c
    const/4 v3, 0x6

    aget-object v4, v2, v3

    invoke-interface {v1, v0, v3, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v17, v3

    check-cast v17, Ljava/util/Set;

    const/16 v8, 0x40

    goto :goto_19d

    :pswitch_16a
    const/4 v3, 0x5

    aget-object v4, v2, v3

    invoke-interface {v1, v0, v3, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v16, v3

    check-cast v16, Ljava/util/Set;

    const/16 v8, 0x20

    goto :goto_19d

    :pswitch_178
    aget-object v6, v2, v3

    invoke-interface {v1, v0, v3, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object v15, v3

    check-cast v15, Ljava/util/List;

    move v8, v4

    goto :goto_19d

    :pswitch_183
    const/4 v3, 0x3

    invoke-interface {v1, v0, v3}, Loh5;->E(Lkotlinx/serialization/descriptors/SerialDescriptor;I)D

    move-result-wide v13

    move v8, v7

    goto :goto_19d

    :pswitch_18a
    invoke-interface {v1, v0, v8}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v12

    :goto_18e
    move v8, v3

    goto :goto_19d

    :pswitch_190
    const/4 v3, 0x1

    invoke-interface {v1, v0, v3}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v11

    goto :goto_19d

    :pswitch_196
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-interface {v1, v0, v4}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v10

    goto :goto_18e

    :goto_19d
    or-int/2addr v9, v8

    goto/16 :goto_41

    :pswitch_1a0
    const/4 v4, 0x0

    move v5, v4

    goto/16 :goto_41

    :cond_1a4
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v8, Lz8p;

    invoke-direct/range {v8 .. v39}, Lz8p;-><init>(IIIIDLjava/util/List;Ljava/util/Set;Ljava/util/Set;IIZZLjava/util/Set;Ljava/util/Set;ZLjava/util/Set;Ljava/util/Set;DZIILjava/util/Set;Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/json/c;ZZ)V

    return-object v8

    nop

    :pswitch_data_1ae
    .packed-switch -0x1
        :pswitch_1a0
        :pswitch_196
        :pswitch_190
        :pswitch_18a
        :pswitch_183
        :pswitch_178
        :pswitch_16a
        :pswitch_15c
        :pswitch_154
        :pswitch_14d
        :pswitch_144
        :pswitch_13b
        :pswitch_12b
        :pswitch_11b
        :pswitch_111
        :pswitch_101
        :pswitch_f0
        :pswitch_e8
        :pswitch_de
        :pswitch_d4
        :pswitch_ca
        :pswitch_ba
        :pswitch_aa
        :pswitch_9a
        :pswitch_8a
        :pswitch_7a
        :pswitch_6a
        :pswitch_60
        :pswitch_56
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lb8p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 12

    check-cast p2, Lz8p;

    sget-object p0, Lb8p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lz8p;->L:[Lkotlinx/serialization/KSerializer;

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_24

    iget v1, p2, Lz8p;->a:I

    sget-object v3, Lpn7;->b:Lon7;

    sget-object v3, Lun7;->h:Lun7;

    invoke-static {v2, v3}, Lcs5;->x0(ILun7;)J

    move-result-wide v3

    sget-object v5, Lun7;->g:Lun7;

    invoke-static {v3, v4, v5}, Lpn7;->p(JLun7;)J

    move-result-wide v3

    long-to-int v3, v3

    if-eq v1, v3, :cond_2a

    :cond_24
    iget v1, p2, Lz8p;->a:I

    const/4 v3, 0x0

    invoke-interface {p1, v3, v1, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_2a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    const/16 v3, 0x1e

    if-nez v1, :cond_36

    iget v1, p2, Lz8p;->b:I

    if-eq v1, v3, :cond_3b

    :cond_36
    iget v1, p2, Lz8p;->b:I

    invoke-interface {p1, v2, v1, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_3b
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_47

    iget v1, p2, Lz8p;->c:I

    const/16 v4, 0x32

    if-eq v1, v4, :cond_4d

    :cond_47
    iget v1, p2, Lz8p;->c:I

    const/4 v4, 0x2

    invoke-interface {p1, v4, v1, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_4d
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    const/16 v4, 0xf

    if-nez v1, :cond_6c

    iget-wide v5, p2, Lz8p;->d:D

    sget-object v1, Lpn7;->b:Lon7;

    sget-object v1, Lun7;->h:Lun7;

    invoke-static {v4, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v7

    sget-object v1, Lun7;->g:Lun7;

    invoke-static {v7, v8, v1}, Lpn7;->p(JLun7;)J

    move-result-wide v7

    long-to-double v7, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_72

    :cond_6c
    iget-wide v5, p2, Lz8p;->d:D

    const/4 v1, 0x3

    invoke-interface {p1, p0, v1, v5, v6}, Lph5;->D(Lkotlinx/serialization/descriptors/SerialDescriptor;ID)V

    :cond_72
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_7c

    iget-object v1, p2, Lz8p;->e:Ljava/util/List;

    if-eqz v1, :cond_84

    :cond_7c
    const/4 v1, 0x4

    aget-object v5, v0, v1

    iget-object v6, p2, Lz8p;->e:Ljava/util/List;

    invoke-interface {p1, p0, v1, v5, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_84
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_8e

    iget-object v1, p2, Lz8p;->f:Ljava/util/Set;

    if-eqz v1, :cond_96

    :cond_8e
    const/4 v1, 0x5

    aget-object v5, v0, v1

    iget-object v6, p2, Lz8p;->f:Ljava/util/Set;

    invoke-interface {p1, p0, v1, v5, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_96
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_a0

    iget-object v1, p2, Lz8p;->g:Ljava/util/Set;

    if-eqz v1, :cond_a8

    :cond_a0
    const/4 v1, 0x6

    aget-object v5, v0, v1

    iget-object v6, p2, Lz8p;->g:Ljava/util/Set;

    invoke-interface {p1, p0, v1, v5, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_a8
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_b4

    iget v1, p2, Lz8p;->h:I

    const/16 v5, 0x3c

    if-eq v1, v5, :cond_ba

    :cond_b4
    iget v1, p2, Lz8p;->h:I

    const/4 v5, 0x7

    invoke-interface {p1, v5, v1, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_ba
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_c6

    iget v1, p2, Lz8p;->i:I

    const/16 v5, 0x3e8

    if-eq v1, v5, :cond_cd

    :cond_c6
    iget v1, p2, Lz8p;->i:I

    const/16 v5, 0x8

    invoke-interface {p1, v5, v1, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_cd
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_d7

    iget-boolean v1, p2, Lz8p;->j:Z

    if-eqz v1, :cond_de

    :cond_d7
    iget-boolean v1, p2, Lz8p;->j:Z

    const/16 v5, 0x9

    invoke-interface {p1, p0, v5, v1}, Lph5;->y(Lkotlinx/serialization/descriptors/SerialDescriptor;IZ)V

    :cond_de
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_e8

    iget-boolean v1, p2, Lz8p;->k:Z

    if-eq v1, v2, :cond_ef

    :cond_e8
    iget-boolean v1, p2, Lz8p;->k:Z

    const/16 v5, 0xa

    invoke-interface {p1, p0, v5, v1}, Lph5;->y(Lkotlinx/serialization/descriptors/SerialDescriptor;IZ)V

    :cond_ef
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_f9

    iget-object v1, p2, Lz8p;->l:Ljava/util/Set;

    if-eqz v1, :cond_102

    :cond_f9
    const/16 v1, 0xb

    aget-object v5, v0, v1

    iget-object v6, p2, Lz8p;->l:Ljava/util/Set;

    invoke-interface {p1, p0, v1, v5, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_102
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_10c

    iget-object v1, p2, Lz8p;->m:Ljava/util/Set;

    if-eqz v1, :cond_115

    :cond_10c
    const/16 v1, 0xc

    aget-object v5, v0, v1

    iget-object v6, p2, Lz8p;->m:Ljava/util/Set;

    invoke-interface {p1, p0, v1, v5, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_115
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_11f

    iget-boolean v1, p2, Lz8p;->n:Z

    if-eq v1, v2, :cond_126

    :cond_11f
    iget-boolean v1, p2, Lz8p;->n:Z

    const/16 v2, 0xd

    invoke-interface {p1, p0, v2, v1}, Lph5;->y(Lkotlinx/serialization/descriptors/SerialDescriptor;IZ)V

    :cond_126
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_130

    iget-object v1, p2, Lz8p;->o:Ljava/util/Set;

    if-eqz v1, :cond_139

    :cond_130
    const/16 v1, 0xe

    aget-object v2, v0, v1

    iget-object v5, p2, Lz8p;->o:Ljava/util/Set;

    invoke-interface {p1, p0, v1, v2, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_139
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_143

    iget-object v1, p2, Lz8p;->p:Ljava/util/Set;

    if-eqz v1, :cond_14a

    :cond_143
    aget-object v1, v0, v4

    iget-object v2, p2, Lz8p;->p:Ljava/util/Set;

    invoke-interface {p1, p0, v4, v1, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_14a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_15a

    iget-wide v1, p2, Lz8p;->q:D

    const-wide/high16 v4, 0x4028000000000000L    # 12.0

    invoke-static {v1, v2, v4, v5}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_161

    :cond_15a
    iget-wide v1, p2, Lz8p;->q:D

    const/16 v4, 0x10

    invoke-interface {p1, p0, v4, v1, v2}, Lph5;->D(Lkotlinx/serialization/descriptors/SerialDescriptor;ID)V

    :cond_161
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_16b

    iget-boolean v1, p2, Lz8p;->r:Z

    if-eqz v1, :cond_172

    :cond_16b
    iget-boolean v1, p2, Lz8p;->r:Z

    const/16 v2, 0x11

    invoke-interface {p1, p0, v2, v1}, Lph5;->y(Lkotlinx/serialization/descriptors/SerialDescriptor;IZ)V

    :cond_172
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_17c

    iget v1, p2, Lz8p;->s:I

    if-eq v1, v3, :cond_183

    :cond_17c
    iget v1, p2, Lz8p;->s:I

    const/16 v2, 0x12

    invoke-interface {p1, v2, v1, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_183
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_18d

    iget v1, p2, Lz8p;->t:I

    if-eq v1, v3, :cond_194

    :cond_18d
    iget v1, p2, Lz8p;->t:I

    const/16 v2, 0x13

    invoke-interface {p1, v2, v1, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_194
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_1a8

    iget-object v1, p2, Lz8p;->u:Ljava/util/Set;

    const-string v2, "cdn.rtbai.com"

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b1

    :cond_1a8
    const/16 v1, 0x14

    aget-object v2, v0, v1

    iget-object v3, p2, Lz8p;->u:Ljava/util/Set;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_1b1
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_1c5

    iget-object v1, p2, Lz8p;->v:Ljava/util/Set;

    const-string v2, "adx.opera.com"

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1ce

    :cond_1c5
    const/16 v1, 0x15

    aget-object v0, v0, v1

    iget-object v2, p2, Lz8p;->v:Ljava/util/Set;

    invoke-interface {p1, p0, v1, v0, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_1ce
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_1d8

    iget-object v0, p2, Lz8p;->w:Ljava/lang/String;

    if-eqz v0, :cond_1e1

    :cond_1d8
    sget-object v0, Lxhk;->a:Lxhk;

    iget-object v1, p2, Lz8p;->w:Ljava/lang/String;

    const/16 v2, 0x16

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_1e1
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_1eb

    iget-object v0, p2, Lz8p;->x:Ljava/lang/String;

    if-eqz v0, :cond_1f4

    :cond_1eb
    sget-object v0, Lxhk;->a:Lxhk;

    iget-object v1, p2, Lz8p;->x:Ljava/lang/String;

    const/16 v2, 0x17

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_1f4
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_1fe

    iget-object v0, p2, Lz8p;->y:Ljava/lang/String;

    if-eqz v0, :cond_207

    :cond_1fe
    sget-object v0, Lxhk;->a:Lxhk;

    iget-object v1, p2, Lz8p;->y:Ljava/lang/String;

    const/16 v2, 0x18

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_207
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_211

    iget-object v0, p2, Lz8p;->z:Lkotlinx/serialization/json/c;

    if-eqz v0, :cond_21a

    :cond_211
    sget-object v0, Lkno;->a:Lkno;

    iget-object v1, p2, Lz8p;->z:Lkotlinx/serialization/json/c;

    const/16 v2, 0x19

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_21a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_224

    iget-boolean v0, p2, Lz8p;->A:Z

    if-eqz v0, :cond_22b

    :cond_224
    iget-boolean v0, p2, Lz8p;->A:Z

    const/16 v1, 0x1a

    invoke-interface {p1, p0, v1, v0}, Lph5;->y(Lkotlinx/serialization/descriptors/SerialDescriptor;IZ)V

    :cond_22b
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_235

    iget-boolean v0, p2, Lz8p;->B:Z

    if-eqz v0, :cond_23c

    :cond_235
    iget-boolean p2, p2, Lz8p;->B:Z

    const/16 v0, 0x1b

    invoke-interface {p1, p0, v0, p2}, Lph5;->y(Lkotlinx/serialization/descriptors/SerialDescriptor;IZ)V

    :cond_23c
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
