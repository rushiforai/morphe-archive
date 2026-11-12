.class public final synthetic Liu2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Liu2;->a:B

    iput-object p1, p0, Liu2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 13

    iget-byte v0, p0, Liu2;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object p0, p0, Liu2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4a0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    check-cast p1, Landroid/net/Uri;

    const-string v0, "downloads_location"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_19
    check-cast p0, La21;

    move-object v4, p1

    check-cast v4, Lre7;

    iget-object p1, p0, La21;->d:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Lcom/opera/android/BrowserActivity;

    if-eqz v1, :cond_3c

    iget-object p1, p0, La21;->a:Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, Landroid/content/Context;

    iget-object p1, p0, La21;->e:Ljava/lang/Object;

    move-object v2, p1

    check-cast v2, Luk6;

    iget-object p1, p0, La21;->c:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Lrf7;

    iget-object p0, p0, La21;->l:Ljava/lang/Object;

    move-object v5, p0

    check-cast v5, Lx5f;

    invoke-static/range {v0 .. v5}, Ligi;->u0(Landroid/content/Context;Lcom/opera/android/BrowserActivity;Lvwh;Lrf7;Lre7;Lorm;)V

    :cond_3c
    return-void

    :pswitch_3d
    check-cast p0, Lgg7;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lgg7;->run()V

    return-void

    :pswitch_45
    check-cast p0, Lr2;

    check-cast p1, Landroid/graphics/Bitmap;

    if-eqz p1, :cond_54

    new-instance v0, Lsw7;

    invoke-direct {v0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lr2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_61

    :cond_54
    new-instance p1, Lop6;

    invoke-direct {p1, v4}, Lop6;-><init>(Z)V

    new-instance v0, Lrw7;

    invoke-direct {v0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lr2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_61
    return-void

    :pswitch_62
    check-cast p0, Lc5o;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object p1, p0, Lc5o;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    iput-object v2, p0, Lc5o;->b:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_70
    if-ge v3, v0, :cond_82

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v3, v3, 0x1

    check-cast v1, Lcom/opera/api/Callback;

    invoke-virtual {p0}, Lc5o;->s()Llu5;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_70

    :cond_82
    return-void

    :pswitch_83
    check-cast p0, Lyk6;

    iget-object v0, p0, Lyk6;->g:Lx5f;

    check-cast p1, Lipf;

    sget-object v1, Lepf;->a:Lepf;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c5

    instance-of v1, p1, Lcpf;

    if-eqz v1, :cond_9b

    sget-object p0, Lb70;->g:Lb70;

    invoke-virtual {v0, p0}, Lx5f;->x(Lb70;)V

    goto :goto_c5

    :cond_9b
    sget-object v1, Lgpf;->a:Lgpf;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a9

    sget-object p0, Lb70;->c:Lb70;

    invoke-virtual {v0, p0}, Lx5f;->x(Lb70;)V

    goto :goto_c5

    :cond_a9
    instance-of p1, p1, Lfpf;

    if-eqz p1, :cond_c2

    iget-object p0, p0, Lyk6;->f:Lru9;

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p1, "ai.used_chat"

    invoke-interface {p0, p1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_bc

    sget-object p0, Lb70;->f:Lb70;

    goto :goto_be

    :cond_bc
    sget-object p0, Lb70;->e:Lb70;

    :goto_be
    invoke-virtual {v0, p0}, Lx5f;->x(Lb70;)V

    goto :goto_c5

    :cond_c2
    invoke-static {}, Lh9o;->p()V

    :cond_c5
    :goto_c5
    return-void

    :pswitch_c6
    check-cast p0, Li9c;

    check-cast p1, Lisl;

    invoke-virtual {p0, p1}, Li9c;->f(Lisl;)V

    return-void

    :pswitch_ce
    check-cast p0, Lyqa;

    check-cast p1, Ldl5;

    invoke-virtual {p0, p1}, Lyqa;->j(Ldl5;)V

    return-void

    :pswitch_d6
    check-cast p0, Luk5;

    check-cast p1, Ldnn;

    new-instance v0, Ltw2;

    const/16 v1, 0x17

    invoke-direct {v0, p0, v1}, Ltw2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Ldnn;->a(Lann;)V

    return-void

    :pswitch_e5
    check-cast p0, Luk5;

    check-cast p1, Ltw7;

    invoke-virtual {p0, p1}, Luk5;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_ed
    check-cast p0, Ll45;

    iget-object v0, p0, Ll45;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lr9i;

    check-cast p1, Ltw7;

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_119

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Lp58;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    new-instance v0, Lrw7;

    invoke-direct {v0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    iget-object p1, v2, Lr9i;->e:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashSet;

    invoke-interface {p1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto/16 :goto_286

    :cond_119
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_283

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    new-instance p1, Llb4;

    const/16 v0, 0x18

    invoke-direct {p1, p0, v0}, Llb4;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast p0, Lwj5;

    iget-object v0, p0, Lwj5;->q:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/2addr v0, v1

    new-instance v1, Lvr9;

    invoke-direct {v1, p1, v0}, Lvr9;-><init>(Ljava/lang/Runnable;I)V

    iget-object p1, p0, Lwj5;->s:Lffb;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_15a

    iget-object v0, v2, Lr9i;->c:Ljava/lang/Object;

    check-cast v0, Lu59;

    iget-object v0, v0, Lu59;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqln;

    invoke-static {p1}, Lvq8;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v5, 0x7

    invoke-virtual {v0, v5, p1}, Lqln;->p(ILjava/lang/String;)V

    :cond_15a
    invoke-virtual {v1}, Lvr9;->run()V

    iget-object p1, p0, Lwj5;->q:Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_165
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_274

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly5j;

    iget-object v5, v2, Lr9i;->b:Ljava/lang/Object;

    check-cast v5, Li16;

    iget-object v6, p0, Lwj5;->p:Ljava/lang/String;

    iget-object v7, v5, Li16;->b:Ljava/lang/Object;

    check-cast v7, Lcom/opera/android/settings/SettingsManager;

    if-eqz v0, :cond_270

    instance-of v8, v0, Lx5j;

    if-eqz v8, :cond_192

    check-cast v0, Lx5j;

    iget-object v0, v0, Lx5j;->b:Ljava/lang/String;

    invoke-static {v0}, Lg7j;->d(Ljava/lang/String;)Lg7j;

    move-result-object v0

    if-eqz v0, :cond_18e

    invoke-virtual {v7, v0, v4}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    :cond_18e
    invoke-virtual {v1}, Lvr9;->run()V

    goto :goto_165

    :cond_192
    instance-of v8, v0, Lw5j;

    if-eqz v8, :cond_1e5

    :try_start_196
    sget-object v5, Lt0i;->b:Lp0i;

    check-cast v0, Lw5j;

    iget-object v0, v0, Lw5j;->b:Ljava/lang/String;

    invoke-static {}, Lf7j;->values()[Lf7j;

    move-result-object v5

    array-length v6, v5

    move v8, v3

    :goto_1a2
    if-ge v8, v6, :cond_1b1

    aget-object v9, v5, v8

    iget-object v10, v9, Lf7j;->b:Ljava/lang/String;

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_1cd

    add-int/lit8 v8, v8, 0x1

    goto :goto_1a2

    :cond_1b1
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v8, "Unknown App theme: "

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_1c5
    .catchall {:try_start_196 .. :try_end_1c5} :catchall_1c5

    :catchall_1c5
    move-exception v0

    sget-object v5, Lt0i;->b:Lp0i;

    new-instance v9, Lq0i;

    invoke-direct {v9, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :cond_1cd
    invoke-static {v9}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_1e1

    check-cast v9, Lf7j;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "app_theme"

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    invoke-virtual {v7, v5, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_1e1
    invoke-virtual {v1}, Lvr9;->run()V

    goto :goto_165

    :cond_1e5
    instance-of v8, v0, Lr5j;

    if-eqz v8, :cond_1f7

    check-cast v0, Lr5j;

    iget-boolean v0, v0, Lr5j;->b:Z

    const-string v5, "live_scores_enabled"

    invoke-virtual {v7, v0, v5}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {v1}, Lvr9;->run()V

    goto/16 :goto_165

    :cond_1f7
    instance-of v8, v0, Lu5j;

    if-eqz v8, :cond_21c

    move-object v7, v0

    check-cast v7, Lu5j;

    instance-of v8, v7, Ls5j;

    if-eqz v8, :cond_207

    invoke-virtual {v1}, Lvr9;->run()V

    goto/16 :goto_165

    :cond_207
    instance-of v7, v7, Lt5j;

    if-eqz v7, :cond_218

    iget-object v5, v5, Li16;->c:Ljava/lang/Object;

    check-cast v5, Li3j;

    check-cast v0, Lt5j;

    new-instance v7, Lgte;

    invoke-direct {v7, v5, v6, v0, v1}, Lgte;-><init>(Li3j;Ljava/lang/String;Lt5j;Lvr9;)V

    goto/16 :goto_165

    :cond_218
    invoke-static {}, Lh9o;->p()V

    goto :goto_286

    :cond_21c
    instance-of v5, v0, Lv5j;

    if-eqz v5, :cond_270

    :try_start_220
    sget-object v5, Lt0i;->b:Lp0i;

    check-cast v0, Lv5j;

    iget-object v0, v0, Lv5j;->b:Ljava/lang/String;

    invoke-static {}, Lo7j;->values()[Lo7j;

    move-result-object v5

    array-length v6, v5

    move v8, v3

    :goto_22c
    if-ge v8, v6, :cond_23b

    aget-object v9, v5, v8

    iget-object v10, v9, Lo7j;->b:Ljava/lang/String;

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_257

    add-int/lit8 v8, v8, 0x1

    goto :goto_22c

    :cond_23b
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v8, "Unknown reading mode disposition: "

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_24f
    .catchall {:try_start_220 .. :try_end_24f} :catchall_24f

    :catchall_24f
    move-exception v0

    sget-object v5, Lt0i;->b:Lp0i;

    new-instance v9, Lq0i;

    invoke-direct {v9, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :cond_257
    invoke-static {v9}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_26b

    check-cast v9, Lo7j;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "enable_reading_mode_as_default"

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    invoke-virtual {v7, v5, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_26b
    invoke-virtual {v1}, Lvr9;->run()V

    goto/16 :goto_165

    :cond_270
    invoke-static {}, Lh9o;->p()V

    goto :goto_286

    :cond_274
    iget-boolean p0, p0, Lwj5;->t:Z

    if-eqz p0, :cond_27f

    iget-object p0, v2, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Ls99;

    invoke-virtual {p0}, Ls99;->invoke()Ljava/lang/Object;

    :cond_27f
    invoke-virtual {v1}, Lvr9;->run()V

    goto :goto_286

    :cond_283
    invoke-static {}, Lh9o;->p()V

    :goto_286
    return-void

    :pswitch_287
    check-cast p0, Lo85;

    check-cast p1, Landroid/graphics/Bitmap;

    iget-object v0, p0, Lo85;->a:Lp85;

    iget-object v0, v0, Lp85;->j:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lo85;->c:Landroid/content/Context;

    iget p0, p0, Lo85;->f:I

    invoke-static {v1, p1, p0}, Leti;->b(Landroid/content/Context;Landroid/graphics/Bitmap;I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_29d
    check-cast p0, Lwa;

    check-cast p1, Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lwa;->onResult(Ljava/lang/Object;)V

    return-void

    :pswitch_2a5
    check-cast p0, La55;

    check-cast p1, Lz45;

    if-eqz p1, :cond_2b1

    invoke-virtual {p0, v4, p1}, La55;->a(ILz45;)V

    invoke-virtual {p0, v1, p1}, La55;->a(ILz45;)V

    :cond_2b1
    iget-object p0, p0, La55;->c:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    return-void

    :pswitch_2b7
    check-cast p0, Lc35;

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {v0, p1}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iput-boolean v4, p0, Lc35;->c:Z

    iget-object p0, p0, Lc35;->f:Le35;

    iget-object p0, p0, Le35;->z:Lse3;

    invoke-virtual {p0}, Ld17;->d()V

    return-void

    :pswitch_2ca
    check-cast p0, Le35;

    check-cast p1, Ls25;

    iput-object p1, p0, Le35;->x:Ls25;

    iget-object p0, p0, Le35;->r:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_2d6
    if-ge v3, v0, :cond_309

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v3, v3, 0x1

    check-cast v1, Lc35;

    iget-object v2, v1, Lc35;->a:Lr25;

    invoke-virtual {v2, p1}, Lr25;->d(Ls25;)Z

    move-result v5

    iput-boolean v5, v1, Lc35;->e:Z

    if-nez v5, :cond_2fe

    iget-object v2, v1, Lc35;->f:Le35;

    iget-object v2, v2, Le35;->v:Lac1;

    iget v5, v2, Lac1;->a:I

    sub-int/2addr v5, v4

    iput v5, v2, Lac1;->a:I

    invoke-virtual {v2}, Lac1;->k()V

    iget-object v1, v1, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2d6

    :cond_2fe
    new-instance v5, Liu2;

    const/16 v6, 0xf

    invoke-direct {v5, v1, v6}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, p1, v5}, Lr25;->c(Ls25;Lcom/opera/api/Callback;)V

    goto :goto_2d6

    :cond_309
    return-void

    :pswitch_30a
    check-cast p0, Lk25;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lk25;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_312
    check-cast p0, Lo8f;

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x64

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-interface {p1, v3, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_328
    check-cast p0, Lfz4;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_341

    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    sget-object p1, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    if-eqz p0, :cond_341

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->b()V

    :cond_341
    return-void

    :pswitch_342
    check-cast p0, Lqb7;

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Lvk6;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_35b

    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Lkze;

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    goto/16 :goto_3dd

    :cond_35b
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    new-instance v4, Lfh4;

    const/4 v5, 0x4

    invoke-direct {v4, p0, v1, v5}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    new-instance v5, Lvr9;

    invoke-direct {v5, v4, p0}, Lvr9;-><init>(Ljava/lang/Runnable;I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_373
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3dd

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lhu4;

    iget-wide v6, p1, Lhu4;->a:J

    const-wide/16 v8, 0x0

    cmp-long v4, v6, v8

    if-eqz v4, :cond_38b

    iget-boolean v6, p1, Lhu4;->b:Z

    if-eqz v6, :cond_38f

    :cond_38b
    invoke-virtual {v5}, Lvr9;->run()V

    goto :goto_373

    :cond_38f
    iget-boolean v7, p1, Lhu4;->f:Z

    if-eqz v7, :cond_397

    invoke-virtual {v5}, Lvr9;->run()V

    goto :goto_373

    :cond_397
    new-instance v7, Lf9;

    const/16 v8, 0x12

    invoke-direct {v7, v1, p1, v5, v8}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v8, v0, Lvk6;->b:Lumi;

    if-nez v6, :cond_3d8

    if-eqz v4, :cond_3d2

    iget-object v4, v0, Lvk6;->c:Lqie;

    new-instance v6, Lge5;

    const/16 v9, 0x9

    invoke-direct {v6, v0, p1, v9}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v8, v6}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p1

    new-instance v6, Luk6;

    invoke-direct {v6, v7, v3}, Luk6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v8, v6}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v6

    new-instance v7, Loml;

    invoke-direct {v7, v6}, Loml;-><init>(Lnml;)V

    iget-object v6, p1, Lnml;->d:Loml;

    if-nez v6, :cond_3ce

    iput-object v7, p1, Lnml;->d:Loml;

    new-instance v6, Loml;

    invoke-direct {v6, p1}, Loml;-><init>(Lnml;)V

    invoke-virtual {v4, v6, v2}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    goto :goto_373

    :cond_3ce
    invoke-static {}, Lh9o;->e()V

    goto :goto_3dd

    :cond_3d2
    const-string p0, "Chat must be inserted first"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_3dd

    :cond_3d8
    const-string p0, "Loading messages for incognito chat"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :cond_3dd
    :goto_3dd
    return-void

    :pswitch_3de
    check-cast p0, Lb84;

    check-cast p1, Lc84;

    invoke-virtual {p0, p1}, Lb84;->a(Lc84;)V

    return-void

    :pswitch_3e6
    check-cast p0, Ld84;

    check-cast p1, Lc84;

    if-eqz p1, :cond_3ee

    iput-object p1, p0, Ld84;->a:Lc84;

    :cond_3ee
    return-void

    :pswitch_3ef
    check-cast p0, Lhv3;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_406

    new-instance p1, Lp99;

    invoke-direct {p1}, Lp99;-><init>()V

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Ls63;->w0(Landroid/content/Context;)V

    :cond_406
    return-void

    :pswitch_407
    check-cast p0, Lbv3;

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_413

    iget-object p0, p0, Lbv3;->e:Lfv2;

    invoke-virtual {p0}, Lfv2;->run()V

    goto :goto_424

    :cond_413
    sget-object p0, Llqm;->m:Llqm;

    invoke-static {p1, p0, v4}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    invoke-virtual {p0, v4}, Lvx3;->a(Z)V

    iput v1, p0, Lvx3;->b:I

    const/4 p1, 0x3

    iput p1, p0, Lvx3;->c:I

    invoke-static {p0}, Lam2;->v(Lvx3;)V

    :goto_424
    return-void

    :pswitch_425
    check-cast p0, Lgyf;

    check-cast p1, Lqjn;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lgyf;->a()V

    return-void

    :pswitch_42f
    check-cast p0, Lim3;

    check-cast p1, Lml3;

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    if-eqz p1, :cond_446

    invoke-interface {p1}, Lml3;->h()Z

    move-result v1

    if-nez v1, :cond_446

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {p1, v1}, Lalo;->J(Lml3;Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    goto :goto_44d

    :cond_446
    const v1, 0x7f140d5a

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_44d
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->D(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lim3;->G:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v0

    if-eqz v0, :cond_45d

    iget-object v0, p0, Lim3;->G:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->collapseActionView()Z

    :cond_45d
    invoke-virtual {p0, p1}, Lim3;->P0(Lml3;)V

    return-void

    :pswitch_461
    check-cast p0, Landroid/widget/ImageView;

    check-cast p1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_469
    check-cast p0, Lgv2;

    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Lgv2;->b:Ljava/util/List;

    invoke-virtual {p0}, Lgv2;->e()V

    return-void

    :pswitch_473
    check-cast p0, Lmu2;

    check-cast p1, La4g;

    iput-object p1, p0, Lmu2;->f:La4g;

    iget-object p0, p0, Lmu2;->e:Lode;

    if-eqz p1, :cond_47e

    move-object v2, p1

    :cond_47e
    invoke-virtual {p0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_482
    check-cast p0, Lju2;

    check-cast p1, Ljava/lang/Boolean;

    iput-object v2, p0, Lju2;->d:Ljava/lang/Object;

    iget-object v0, p0, Lju2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    const-string v1, "password_manager_autosave"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    iget-object p0, p0, Lju2;->c:Ljava/lang/Object;

    check-cast p0, Lx5f;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    xor-int/2addr p1, v4

    invoke-virtual {p0, p1, v4, v0}, Lx5f;->C(ZZZ)V

    return-void

    nop

    :pswitch_data_4a0
    .packed-switch 0x0
        :pswitch_482
        :pswitch_473
        :pswitch_469
        :pswitch_461
        :pswitch_42f
        :pswitch_425
        :pswitch_407
        :pswitch_3ef
        :pswitch_3e6
        :pswitch_3de
        :pswitch_342
        :pswitch_328
        :pswitch_312
        :pswitch_30a
        :pswitch_2ca
        :pswitch_2b7
        :pswitch_2a5
        :pswitch_29d
        :pswitch_287
        :pswitch_ed
        :pswitch_e5
        :pswitch_d6
        :pswitch_ce
        :pswitch_c6
        :pswitch_83
        :pswitch_62
        :pswitch_45
        :pswitch_3d
        :pswitch_19
    .end packed-switch
.end method
