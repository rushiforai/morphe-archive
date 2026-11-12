.class public final synthetic Lgep;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln1p;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lagm;Ln1p;Lylp;Lyjo;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lgep;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgep;->b:Ljava/lang/Object;

    iput-object p2, p0, Lgep;->c:Ljava/lang/Object;

    iput-object p3, p0, Lgep;->d:Ljava/lang/Object;

    iput-object p4, p0, Lgep;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    .line 15
    iput-byte p5, p0, Lgep;->a:B

    iput-object p1, p0, Lgep;->e:Ljava/lang/Object;

    iput-object p2, p0, Lgep;->c:Ljava/lang/Object;

    iput-object p3, p0, Lgep;->b:Ljava/lang/Object;

    iput-object p4, p0, Lgep;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lgep;->a:B

    const/4 v2, 0x0

    const/4 v3, 0x3

    iget-object v4, v0, Lgep;->d:Ljava/lang/Object;

    iget-object v5, v0, Lgep;->b:Ljava/lang/Object;

    iget-object v6, v0, Lgep;->c:Ljava/lang/Object;

    iget-object v0, v0, Lgep;->e:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_1ac

    check-cast v0, Ln6p;

    check-cast v6, Ly2p;

    check-cast v5, Ldcl;

    check-cast v4, Lsro;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, v1, Lq0i;

    if-nez v2, :cond_2e

    move-object v2, v1

    check-cast v2, Lkzo;

    new-instance v2, Lt0i;

    invoke-direct {v2, v6}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Ln6p;->invoke(Ljava/lang/Object;)V

    :cond_2e
    invoke-static {v1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_55

    iget-object v1, v5, Ldcl;->a:Ljava/lang/Object;

    check-cast v1, Lp7p;

    const/16 v2, 0x2328

    if-eqz v1, :cond_41

    iget-object v3, v4, Lyjo;->b:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lp7p;->g(ILjava/lang/String;)V

    :cond_41
    new-instance v1, Lvjo;

    const-string v3, "Failed to download main image!"

    invoke-direct {v1, v2, v3}, Lvjo;-><init>(ILjava/lang/String;)V

    new-instance v2, Lq0i;

    invoke-direct {v2, v1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v1, Lt0i;

    invoke-direct {v1, v2}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ln6p;->invoke(Ljava/lang/Object;)V

    :cond_55
    return-void

    :pswitch_56
    check-cast v5, Lagm;

    iget-object v1, v5, Lagm;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    check-cast v6, Ln1p;

    check-cast v4, Lylp;

    move-object v7, v0

    check-cast v7, Lyjo;

    move-object/from16 v8, p1

    check-cast v8, Lt0i;

    iget-object v0, v8, Lt0i;->a:Ljava/lang/Object;

    instance-of v9, v0, Lq0i;

    const-string v10, "opera.ads.sdk.last_tpl_url"

    if-nez v9, :cond_8c

    move-object v9, v0

    check-cast v9, Lkzo;

    iget-object v9, v9, Lkzo;->b:Ljava/lang/String;

    sget-object v11, Lr8p;->a:Ljava/util/List;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v11

    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    invoke-interface {v11, v10, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v11}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v9, Lt0i;

    invoke-direct {v9, v4}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-interface {v6, v9}, Ln1p;->invoke(Ljava/lang/Object;)V

    :cond_8c
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_171

    sget-object v0, Lr8p;->a:Ljava/util/List;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, v10, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v9, 0x1

    if-eqz v1, :cond_153

    iget-object v0, v4, Lvoo;->b:Lpro;

    iget-object v10, v0, Lpro;->b:Lsm;

    sget-object v0, Ladp;->a:Lkotlin/text/Regex;

    invoke-static {v0, v1}, Lkotlin/text/Regex;->d(Lkotlin/text/Regex;Ljava/lang/CharSequence;)Lucd;

    move-result-object v0

    const/4 v11, 0x2

    if-eqz v0, :cond_f2

    invoke-virtual {v0}, Lucd;->a()Ljava/util/List;

    move-result-object v12

    check-cast v12, Ltcd;

    invoke-virtual {v12, v9}, Ltcd;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v0}, Lucd;->a()Ljava/util/List;

    move-result-object v13

    check-cast v13, Ltcd;

    invoke-virtual {v13, v11}, Ltcd;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v0}, Lucd;->a()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ltcd;

    invoke-virtual {v0, v3}, Ltcd;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :try_start_d0
    new-instance v14, Lvfp;

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-direct {v14, v12, v13, v0}, Lvfp;-><init>(III)V
    :try_end_e1
    .catchall {:try_start_d0 .. :try_end_e1} :catchall_e2

    goto :goto_ea

    :catchall_e2
    move-exception v0

    sget-object v12, Lt0i;->b:Lp0i;

    new-instance v14, Lq0i;

    invoke-direct {v14, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :goto_ea
    instance-of v0, v14, Lq0i;

    if-eqz v0, :cond_ef

    move-object v14, v2

    :cond_ef
    check-cast v14, Lvfp;

    goto :goto_f3

    :cond_f2
    move-object v14, v2

    :goto_f3
    if-eqz v14, :cond_146

    sget-object v0, Lscp;->a:[I

    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    move-result v10

    aget v0, v0, v10

    const/4 v10, 0x0

    packed-switch v0, :pswitch_data_1b4

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_171

    :pswitch_106
    new-instance v0, Lvfp;

    const/16 v12, 0xb

    invoke-direct {v0, v9, v12, v10}, Lvfp;-><init>(III)V

    goto :goto_11a

    :pswitch_10e
    new-instance v0, Lvfp;

    invoke-direct {v0, v9, v10, v10}, Lvfp;-><init>(III)V

    goto :goto_11a

    :pswitch_114
    new-instance v0, Lvfp;

    const/4 v12, 0x4

    invoke-direct {v0, v11, v12, v9}, Lvfp;-><init>(III)V

    :goto_11a
    new-array v12, v3, [Lkotlin/jvm/functions/Function1;

    sget-object v13, Lhfp;->b:Lhfp;

    aput-object v13, v12, v10

    sget-object v13, Llfp;->b:Llfp;

    aput-object v13, v12, v9

    sget-object v13, Lmfp;->b:Lmfp;

    aput-object v13, v12, v11

    move v11, v10

    :goto_129
    if-ge v11, v3, :cond_144

    aget-object v13, v12, v11

    invoke-interface {v13, v14}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Comparable;

    invoke-interface {v13, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Comparable;

    invoke-static {v15, v13}, Lad5;->a(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result v13

    if-eqz v13, :cond_141

    move v10, v13

    goto :goto_144

    :cond_141
    add-int/lit8 v11, v11, 0x1

    goto :goto_129

    :cond_144
    :goto_144
    if-gez v10, :cond_147

    :cond_146
    move-object v1, v2

    :cond_147
    if-eqz v1, :cond_153

    new-instance v0, Lyjo;

    iget-object v3, v7, Lyjo;->a:Ljava/lang/String;

    iget-object v10, v7, Lyjo;->c:Ljava/io/File;

    invoke-direct {v0, v10, v3, v1}, Lyjo;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_154

    :cond_153
    move-object v0, v7

    :goto_154
    new-instance v3, Ljep;

    move-object/from16 v16, v6

    move-object v6, v4

    move-object v4, v5

    move-object/from16 v5, v16

    invoke-direct/range {v3 .. v8}, Ljep;-><init>(Lagm;Ln1p;Lylp;Lyjo;Lt0i;)V

    new-instance v1, Ll5b;

    const/16 v4, 0xe

    invoke-direct {v1, v4, v9}, Ll5b;-><init>(BZ)V

    sget-object v4, Ll1p;->a:Lsa7;

    iget-object v4, v0, Lyjo;->b:Ljava/lang/String;

    invoke-virtual {v0}, Lyjo;->a()Ljava/io/File;

    move-result-object v0

    invoke-static {v4, v0, v1, v2, v3}, Ll1p;->a(Ljava/lang/String;Ljava/io/File;Ll5b;Ljava/util/Set;Ln1p;)V

    :cond_171
    :goto_171
    return-void

    :pswitch_172
    move-object v7, v0

    check-cast v7, Lyjo;

    move-object v8, v6

    check-cast v8, Ln1p;

    move-object v9, v5

    check-cast v9, Lagm;

    move-object v10, v4

    check-cast v10, Lylp;

    move-object/from16 v0, p1

    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    instance-of v1, v0, Lq0i;

    if-nez v1, :cond_198

    move-object v6, v0

    check-cast v6, Lyjo;

    sget-object v1, Lw2p;->a:La64;

    new-instance v5, Lr71;

    const/4 v11, 0x0

    const/16 v12, 0x16

    invoke-direct/range {v5 .. v12}, Lr71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v1, v2, v2, v5, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_198
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_1ab

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v0, Lt0i;

    invoke-direct {v0, v1}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-interface {v8, v0}, Ln1p;->invoke(Ljava/lang/Object;)V

    :cond_1ab
    return-void

    :pswitch_data_1ac
    .packed-switch 0x0
        :pswitch_172
        :pswitch_56
    .end packed-switch

    :pswitch_data_1b4
    .packed-switch 0x1
        :pswitch_114
        :pswitch_10e
        :pswitch_10e
        :pswitch_10e
        :pswitch_106
        :pswitch_106
    .end packed-switch
.end method
