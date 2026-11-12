.class public final Lo71;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll99;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lo71;->a:B

    iput-object p1, p0, Lo71;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-byte v3, v0, Lo71;->a:B

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    packed-switch v3, :pswitch_data_410

    check-cast v1, Lkotlin/Unit;

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lw6o;

    invoke-virtual {v0}, Lw6o;->f()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1c
    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lh6o;

    iput-object v1, v0, Lh6o;->g:Ljava/lang/Object;

    invoke-virtual {v0}, Lu5k;->A()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_28
    check-cast v1, Lkf4;

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lman;

    iget-object v2, v0, Lman;->e:Ljava/lang/Object;

    monitor-enter v2

    :try_start_31
    instance-of v3, v1, Lpf4;

    if-eqz v3, :cond_4b

    new-instance v3, Lhan;

    check-cast v1, Lpf4;

    iget-object v1, v1, Lpf4;->a:Lwc4;

    check-cast v1, Lv21;

    invoke-direct {v3, v1}, Lhan;-><init>(Lv21;)V

    iput-object v3, v0, Lman;->g:Lhan;

    new-instance v1, Lpf4;

    invoke-direct {v1, v3}, Lpf4;-><init>(Lwc4;)V

    invoke-virtual {v0, v1}, Lman;->b(Lkf4;)V

    goto :goto_4e

    :cond_4b
    invoke-virtual {v0, v1}, Lman;->b(Lkf4;)V
    :try_end_4e
    .catchall {:try_start_31 .. :try_end_4e} :catchall_52

    :goto_4e
    monitor-exit v2

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_52
    move-exception v0

    monitor-exit v2

    throw v0

    :pswitch_55
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const-string v2, "dns_over_https_mode"

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    const-string v3, "dns_over_https_enabled"

    iget-object v4, v0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    iget-object v5, v0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    iget-object v8, v0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {v4, v3}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_8f

    invoke-interface {v8, v2}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_8f

    if-eqz v1, :cond_7e

    invoke-virtual {v0, v7, v3}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    invoke-virtual {v0, v7, v2}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    goto :goto_8c

    :cond_7e
    invoke-virtual {v5, v3, v6}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-interface {v8, v0, v3}, Ly9j;->n(ILjava/lang/String;)V

    invoke-virtual {v5, v2, v6}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-interface {v8, v0, v2}, Ly9j;->n(ILjava/lang/String;)V

    :goto_8c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_91

    :cond_8f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_91
    return-object v0

    :pswitch_92
    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Ls4f;

    invoke-virtual {v0}, Ls4f;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_9c
    check-cast v1, Ljava/util/List;

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lx4i;

    iget-object v2, v0, Lx4i;->h:Lode;

    iget-object v3, v0, Lx4i;->b:Likc;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    sget-object v6, Lm18;->b:Lm18;

    if-ne v3, v6, :cond_f5

    check-cast v1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_b9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_f7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb2h;

    new-instance v9, Lk15;

    iget-object v10, v6, Lb2h;->a:Ljava/lang/String;

    iget-object v11, v6, Lb2h;->c:Ln01;

    invoke-virtual {v11}, Ln01;->a()Ljava/lang/Long;

    move-result-object v11

    if-eqz v11, :cond_d6

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    goto :goto_d7

    :cond_d6
    move-wide v11, v4

    :goto_d7
    iget-object v6, v6, Lb2h;->d:La2h;

    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eqz v6, :cond_e8

    if-ne v6, v7, :cond_e4

    sget-object v6, Ll15;->b:Ll15;

    goto :goto_ea

    :cond_e4
    invoke-static {}, Lh9o;->p()V

    goto :goto_140

    :cond_e8
    sget-object v6, Ll15;->a:Ll15;

    :goto_ea
    invoke-direct {v9, v10, v11, v12, v6}, Lk15;-><init>(Ljava/lang/String;JLl15;)V

    invoke-static {v10}, Lvq8;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b9

    :cond_f5
    sget-object v3, Ln08;->a:Ln08;

    :cond_f7
    invoke-static {v2, v3}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    iget-object v0, v0, Lx4i;->c:Lru9;

    iget-object v1, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "rewards.claimed_wallpapers"

    invoke-static {v1, v3}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_130

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    if-eqz v2, :cond_130

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_118
    :goto_118
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_130

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lk15;

    iget-object v5, v4, Lk15;->c:Ll15;

    sget-object v6, Ll15;->a:Ll15;

    if-ne v5, v6, :cond_118

    iget-object v4, v4, Lk15;->a:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_118

    :cond_130
    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v2, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    sget-object v8, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_140
    return-object v8

    :pswitch_141
    const-string v2, "rewards.claimed_app_icons"

    check-cast v1, Ljava/util/List;

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lr2i;

    iget-object v3, v0, Lr2i;->c:Lru9;

    iget-object v9, v0, Lr2i;->h:Lkze;

    invoke-virtual {v0, v1}, Lr2i;->a(Ljava/util/List;)V

    iget-object v10, v0, Lr2i;->b:Likc;

    invoke-virtual {v10}, Lekc;->g()Ljava/lang/Object;

    move-result-object v10

    sget-object v11, Lm18;->b:Lm18;

    if-ne v10, v11, :cond_20a

    move-object v10, v1

    check-cast v10, Ljava/lang/Iterable;

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_166
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1ba

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lb2h;

    iget-object v13, v3, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-static {v13, v2}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v13

    iget-object v14, v12, Lb2h;->a:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_183

    sget-object v13, Ll15;->a:Ll15;

    goto :goto_197

    :cond_183
    iget-object v13, v12, Lb2h;->d:La2h;

    invoke-virtual {v13}, Ljava/lang/Enum;->ordinal()I

    move-result v13

    if-eqz v13, :cond_195

    if-ne v13, v7, :cond_190

    sget-object v13, Ll15;->b:Ll15;

    goto :goto_197

    :cond_190
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_214

    :cond_195
    sget-object v13, Ll15;->a:Ll15;

    :goto_197
    new-instance v14, Lk15;

    iget-object v15, v12, Lb2h;->a:Ljava/lang/String;

    iget-object v12, v12, Lb2h;->c:Ln01;

    invoke-virtual {v12}, Ln01;->a()Ljava/lang/Long;

    move-result-object v12

    if-eqz v12, :cond_1ae

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    move-wide/from16 v18, v16

    move/from16 v16, v7

    move-wide/from16 v6, v18

    goto :goto_1b1

    :cond_1ae
    move/from16 v16, v7

    move-wide v6, v4

    :goto_1b1
    invoke-direct {v14, v15, v6, v7, v13}, Lk15;-><init>(Ljava/lang/String;JLl15;)V

    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v7, v16

    goto :goto_166

    :cond_1ba
    iget-object v3, v3, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-static {v3, v2}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1c9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1e0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    new-instance v7, Lk15;

    sget-object v8, Ll15;->a:Ll15;

    invoke-direct {v7, v6, v4, v5, v8}, Lk15;-><init>(Ljava/lang/String;JLl15;)V

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c9

    :cond_1e0
    invoke-static {v3, v11}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x0

    :cond_1f3
    :goto_1f3
    if-ge v6, v5, :cond_20c

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    move-object v8, v7

    check-cast v8, Lk15;

    iget-object v8, v8, Lk15;->a:Ljava/lang/String;

    invoke-virtual {v3, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1f3

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1f3

    :cond_20a
    sget-object v4, Ll08;->a:Ll08;

    :cond_20c
    invoke-virtual {v9, v4}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lr2i;->a(Ljava/util/List;)V

    sget-object v8, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_214
    return-object v8

    :pswitch_215
    check-cast v1, Lxri;

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lych;

    sget-object v3, Lych;->i:Li06;

    invoke-virtual {v0, v1, v2}, Lych;->a(Lxri;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lpx5;->a:Lpx5;

    if-eq v0, v1, :cond_227

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_227
    return-object v0

    :pswitch_228
    check-cast v1, Lndb;

    instance-of v1, v1, Lqj7;

    if-eqz v1, :cond_235

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lafe;

    invoke-interface {v0, v8}, Lafe;->setValue(Ljava/lang/Object;)V

    :cond_235
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_238
    check-cast v1, Lysf;

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lx5f;

    iget-object v2, v1, Lysf;->b:Ljava/util/Set;

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    iget-object v1, v1, Lysf;->a:Ljava/util/LinkedHashMap;

    iget-object v3, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    new-instance v5, Lck0;

    invoke-direct {v5, v3, v4}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v3, Ljkc;

    const/16 v6, 0x13

    invoke-direct {v3, v2, v1, v6}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v5, Lck0;->w:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwc0;

    invoke-virtual {v3, v1}, Ljkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v4}, Lx5f;->U0(Lx56;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_26b
    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Laae;

    iget-object v0, v0, Laae;->c:Lp0g;

    invoke-virtual {v0, v1}, Lp0g;->i(F)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_27d
    check-cast v1, Lbom;

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lq53;

    invoke-virtual {v0}, Lq53;->run()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_289
    move/from16 v16, v7

    check-cast v1, Ljava/lang/Integer;

    if-eqz v1, :cond_2a1

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2a1
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2a4
    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lv1a;

    if-lez v1, :cond_2c1

    iget-object v2, v0, Lv1a;->g:Lq1a;

    if-nez v2, :cond_2c1

    new-instance v1, Ls1a;

    const/4 v12, 0x0

    invoke-direct {v1, v0, v12}, Ls1a;-><init>(Lv1a;B)V

    invoke-virtual {v0, v1}, Lv1a;->a(Lcom/opera/api/Callback;)V

    invoke-virtual {v0}, Lv1a;->b()V

    goto :goto_2ff

    :cond_2c1
    if-nez v1, :cond_2ff

    iget-object v1, v0, Lv1a;->g:Lq1a;

    if-eqz v1, :cond_2ff

    iget-object v2, v0, Lv1a;->d:Lcom/opera/android/browser/chromium/CookieManager;

    if-eqz v2, :cond_2f4

    new-instance v3, Lorg/chromium/url/GURL;

    const-string v4, "https://www.google.com/"

    invoke-direct {v3, v4}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    new-instance v4, Lkv5;

    invoke-direct {v4, v3}, Lkv5;-><init>(Lorg/chromium/url/GURL;)V

    iget-object v2, v2, Lcom/opera/android/browser/chromium/CookieManager;->a:Ljava/util/HashMap;

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;

    if-eqz v3, :cond_2f4

    iget-object v5, v3, Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;->a:Lh7f;

    invoke-virtual {v5, v1}, Lh7f;->c(Ljava/lang/Object;)Z

    invoke-virtual {v5}, Lh7f;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2f4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v1, v3, Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;->b:J

    invoke-static {v1, v2}, LJ/N;->MbxnEonO(J)V

    :cond_2f4
    iput-object v8, v0, Lv1a;->g:Lq1a;

    iget-object v1, v0, Lv1a;->h:Ld3k;

    if-eqz v1, :cond_2fd

    invoke-virtual {v1, v8}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_2fd
    iput-object v8, v0, Lv1a;->h:Ld3k;

    :cond_2ff
    :goto_2ff
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_302
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_31d

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lz8b;

    iget-object v0, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast v0, Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly3i;

    sget-object v1, Lj1a;->a:Lj1a;

    invoke-interface {v0, v1}, Ly3i;->n(Lz1e;)V

    :cond_31d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_320
    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lhkc;

    iget-object v3, v0, Lhkc;->b:Lkotlin/coroutines/CoroutineContext;

    new-instance v4, Lqmb;

    const/4 v5, 0x5

    invoke-direct {v4, v0, v1, v8, v5}, Lqmb;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v3, v4, v2}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lpx5;->a:Lpx5;

    if-eq v0, v1, :cond_336

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_336
    if-eq v0, v1, :cond_33a

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_33a
    return-object v0

    :pswitch_33b
    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lz1h;

    iget-object v0, v0, Lz1h;->e:Lp04;

    invoke-interface {v0, v2, v1}, Lc1j;->c(Lmt5;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lpx5;->a:Lpx5;

    if-eq v0, v1, :cond_34b

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_34b
    return-object v0

    :pswitch_34c
    move/from16 v16, v7

    check-cast v1, Lkotlin/Unit;

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lie6;

    iget-object v1, v0, Lie6;->h:Lje6;

    invoke-virtual {v1}, Lje6;->b()Lfak;

    move-result-object v1

    instance-of v1, v1, Lw39;

    if-nez v1, :cond_36b

    move/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Lie6;->g(ZLmt5;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lpx5;->a:Lpx5;

    if-eq v0, v1, :cond_36d

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_36d

    :cond_36b
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_36d
    :goto_36d
    return-object v0

    :pswitch_36e
    check-cast v1, Lhn4;

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lmm4;

    iget-object v2, v0, Lmm4;->v:Lnak;

    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lom4;

    if-eqz v2, :cond_381

    iget-object v2, v2, Lom4;->a:Ll01;

    goto :goto_382

    :cond_381
    move-object v2, v8

    :goto_382
    instance-of v3, v1, Lcn4;

    if-eqz v3, :cond_389

    sget-object v8, Lde8;->h:Lde8;

    goto :goto_3ae

    :cond_389
    sget-object v3, Ldn4;->a:Ldn4;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3ae

    sget-object v3, Len4;->a:Len4;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_39c

    sget-object v8, Lde8;->c:Lde8;

    goto :goto_3ae

    :cond_39c
    sget-object v3, Lfn4;->a:Lfn4;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3ae

    sget-object v3, Lgn4;->a:Lgn4;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3b6

    sget-object v8, Lde8;->b:Lde8;

    :cond_3ae
    :goto_3ae
    if-eqz v8, :cond_3b3

    invoke-virtual {v0, v8, v2}, Lmm4;->e(Lde8;Ll01;)V

    :cond_3b3
    sget-object v8, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_3b9

    :cond_3b6
    invoke-static {}, Lh9o;->p()V

    :goto_3b9
    return-object v8

    :pswitch_3ba
    check-cast v1, Lag4;

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Loa4;

    iget-object v3, v0, Loa4;->f:Lnak;

    instance-of v4, v1, Lwf4;

    if-eqz v4, :cond_3d1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v8, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    sget-object v1, Lpx5;->a:Lpx5;

    goto :goto_3f4

    :cond_3d1
    instance-of v4, v1, Lyf4;

    if-eqz v4, :cond_3e0

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v8, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    sget-object v1, Lpx5;->a:Lpx5;

    goto :goto_3f4

    :cond_3e0
    instance-of v1, v1, Lxf4;

    if-eqz v1, :cond_3f2

    iget-object v0, v0, Loa4;->h:Ljdj;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, v1, v2}, Ljdj;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    sget-object v2, Lpx5;->a:Lpx5;

    if-eq v0, v2, :cond_3f4

    move-object v0, v1

    goto :goto_3f4

    :cond_3f2
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_3f4
    :goto_3f4
    return-object v0

    :pswitch_3f5
    check-cast v1, Lkotlin/Unit;

    iget-object v0, v0, Lo71;->b:Ljava/lang/Object;

    check-cast v0, Lz8b;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x22

    if-lt v1, v2, :cond_40c

    invoke-virtual {v0}, Lz8b;->D()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v1

    iget-object v0, v0, Lz8b;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-static {v1, v0}, Lt8;->d0(Landroid/view/inputmethod/InputMethodManager;Landroid/view/View;)V

    :cond_40c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_410
    .packed-switch 0x0
        :pswitch_3f5
        :pswitch_3ba
        :pswitch_36e
        :pswitch_34c
        :pswitch_33b
        :pswitch_320
        :pswitch_302
        :pswitch_2a4
        :pswitch_289
        :pswitch_27d
        :pswitch_26b
        :pswitch_238
        :pswitch_228
        :pswitch_215
        :pswitch_141
        :pswitch_9c
        :pswitch_92
        :pswitch_55
        :pswitch_28
        :pswitch_1c
    .end packed-switch
.end method
