.class public final synthetic Lnpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lnpl;->a:B

    iput-object p1, p0, Lnpl;->b:Ljava/lang/Object;

    iput-object p2, p0, Lnpl;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 10

    iget-byte v0, p0, Lnpl;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_362

    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Ltln;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0, p0}, Ltln;->G0(Lcom/opera/android/custom_views/FadingRecyclerView;)V

    return-void

    :pswitch_15
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object v1, v0, Lqln;->f:Lami;

    iget-object v1, v1, Lami;->d:Ljava/lang/Object;

    check-cast v1, Ls14;

    iget-object v1, v1, Ls14;->f:Ljava/lang/Object;

    check-cast v1, Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_47

    invoke-virtual {v0}, Lqln;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "local_dir"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_47

    invoke-virtual {v0, v4}, Lqln;->o(Z)V

    const-string v1, "most_popular"

    invoke-virtual {v0, v1}, Lqln;->n(Ljava/lang/String;)V

    :cond_47
    invoke-virtual {v0}, Lqln;->i()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_63

    iget-object p0, v0, Lqln;->e:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "wallpaper_current"

    iget-object v1, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {v1, v0}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_63

    invoke-interface {v1, v0}, Ly9j;->remove(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->Q(Ljava/lang/String;)V

    :cond_63
    return-void

    :pswitch_64
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Ls14;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    invoke-virtual {v0, p0}, Ls14;->G(Ljava/lang/Runnable;)V

    return-void

    :pswitch_70
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Ls14;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :catch_7c
    :cond_7c
    :goto_7c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :try_start_88
    invoke-virtual {v0, v1}, Ls14;->B(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/String;

    invoke-static {v1}, Ls29;->h(Ljava/io/File;)[B

    move-result-object v3

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v2, v3, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v2}, Lkln;->h(Ljava/lang/String;)Lkln;

    move-result-object v2

    new-instance v3, Ljava/io/File;

    iget-object v4, v0, Ls14;->c:Ljava/lang/Object;

    check-cast v4, Ljava/io/File;

    iget-object v2, v2, Lkln;->b:Ljava/lang/String;

    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_7c

    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_af
    .catch Ljava/io/IOException; {:try_start_88 .. :try_end_af} :catch_7c
    .catch Lorg/json/JSONException; {:try_start_88 .. :try_end_af} :catch_7c

    goto :goto_7c

    :cond_b0
    return-void

    :pswitch_b1
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lgln;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-interface {v0, p0}, Lgln;->e(Ljava/util/ArrayList;)V

    return-void

    :pswitch_bd
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lnkn;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0, p0}, Lnkn;->G0(Lcom/opera/android/custom_views/FadingRecyclerView;)V

    return-void

    :pswitch_c9
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lc23;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ld7l;

    iput-object v2, v0, Lc23;->b:Ljava/lang/Object;

    iget-object v0, v0, Lc23;->c:Ljava/lang/Object;

    check-cast v0, Lucn;

    iget-object v1, p0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->y()Lt59;

    move-result-object v1

    if-eqz v1, :cond_e2

    iget-wide v1, v1, Lt59;->a:J

    long-to-int v4, v1

    :cond_e2
    const/4 v1, 0x5

    if-lt v4, v1, :cond_ff

    invoke-virtual {v0, p0}, Lmgn;->d(Lb2l;)Z

    move-result v1

    if-nez v1, :cond_ff

    invoke-virtual {p0}, Ld7l;->n0()Z

    move-result v1

    if-nez v1, :cond_ff

    new-instance v1, Ltcn;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    invoke-direct {v1, v0, v4, p0}, Ltcn;-><init>(Lucn;IZ)V

    invoke-virtual {v0, v1}, Lmgn;->b(Llgn;)V

    :cond_ff
    return-void

    :pswitch_100
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Liuh;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lnj6;

    monitor-enter p0

    monitor-exit p0

    iget-object v0, v0, Liuh;->c:Ljava/lang/Object;

    check-cast v0, Lmi8;

    sget-object v1, Ltym;->a:Ljava/lang/String;

    iget-object v0, v0, Lmi8;->a:Lqi8;

    iget-object v0, v0, Lqi8;->t:Lel6;

    iget-object v1, v0, Lel6;->d:Ligi;

    iget-object v1, v1, Ligi;->f:Ljava/lang/Object;

    check-cast v1, Ljrd;

    invoke-virtual {v0, v1}, Lel6;->R(Ljrd;)Ld11;

    move-result-object v1

    new-instance v2, Luk6;

    invoke-direct {v2, v1, p0}, Luk6;-><init>(Ld11;Lnj6;)V

    const/16 p0, 0x3fc

    invoke-virtual {v0, v1, p0, v2}, Lel6;->V(Ld11;ILfjc;)V

    return-void

    :pswitch_129
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Liuh;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lr4n;

    iget-object v0, v0, Liuh;->c:Ljava/lang/Object;

    check-cast v0, Lmi8;

    sget-object v1, Ltym;->a:Ljava/lang/String;

    iget-object v0, v0, Lmi8;->a:Lqi8;

    iput-object p0, v0, Lqi8;->m0:Lr4n;

    iget-object v0, v0, Lqi8;->n:Lijc;

    new-instance v1, Ldl6;

    invoke-direct {v1, p0}, Ldl6;-><init>(Lr4n;)V

    const/16 p0, 0x19

    invoke-virtual {v0, p0, v1}, Lijc;->i(ILfjc;)V

    return-void

    :pswitch_148
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Liuh;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lh75;

    iget-object v0, v0, Liuh;->c:Ljava/lang/Object;

    check-cast v0, Lmi8;

    sget-object v1, Ltym;->a:Ljava/lang/String;

    iget-object v0, v0, Lmi8;->a:Lqi8;

    iget-object v0, v0, Lqi8;->H:Lz8b;

    invoke-virtual {v0, p0}, Lz8b;->H(Lh75;)V

    return-void

    :pswitch_15e
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lt2n;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lq3j;

    iget-object v1, p0, Lp3j;->b:Lpyl;

    iget-object v1, v1, Lpyl;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Lp3j;->e:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void

    :pswitch_175
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Ly2n;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lmtk;

    iget-object v1, v0, Ly2n;->s:Lg07;

    if-ne p0, v1, :cond_184

    invoke-virtual {v0}, Ly2n;->L()V

    :cond_184
    return-void

    :pswitch_185
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Ld0n;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    iget-boolean v0, v0, Ld0n;->g:Z

    if-eqz v0, :cond_19e

    sget-object v0, Ld0n;->j:Landroid/view/animation/PathInterpolator;

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40400000    # 3.0f

    div-float/2addr v0, v1

    invoke-static {p0, v0}, Luyg;->c(Landroid/view/View;F)V

    :cond_19e
    return-void

    :pswitch_19f
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lc5j;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-virtual {v0}, Lm4;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1b0

    invoke-interface {p0, v4}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_1b0
    return-void

    :pswitch_1b1
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lctm;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    iget-object v0, v0, Lctm;->d:Ljava/lang/ThreadLocal;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :try_start_1c0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_1c3
    .catchall {:try_start_1c0 .. :try_end_1c3} :catchall_1c7

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    return-void

    :catchall_1c7
    move-exception p0

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    throw p0

    :pswitch_1cc
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lz4k;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lhq8;

    iget-object v0, v0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Lcbk;

    iget-object v0, v0, Lcbk;->e:Ljava/lang/Object;

    check-cast v0, Llgf;

    iget-object v0, v0, Llgf;->i:Ljava/lang/Object;

    check-cast v0, Lcul;

    invoke-virtual {v0, p0}, Lcul;->c(Lhq8;)V

    return-void

    :pswitch_1e4
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Ljnm;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lrf7;

    iget-object v1, v0, Ljnm;->d:Lag;

    invoke-virtual {p0, v1}, Lrf7;->b(Lqf7;)V

    iget-object v1, v0, Ljnm;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "unseen_download_ids"

    invoke-static {v1, v2}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v1

    iget-object p0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    new-instance v2, Lbql;

    const/4 v4, 0x6

    invoke-direct {v2, v4}, Lbql;-><init>(B)V

    invoke-static {v2, p0}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object p0

    invoke-interface {v1, p0}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_220

    invoke-virtual {v0, v1}, Ljnm;->b(Ljava/util/HashSet;)V

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v3

    invoke-virtual {v0, p0}, Ljnm;->c(Z)V

    :cond_220
    return-void

    :pswitch_221
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lr4m;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object v0, v0, Lr4m;->b:Ly4m;

    iget-object v2, v0, Ly4m;->d:Lv3m;

    invoke-virtual {v2}, Lv3m;->g()Z

    move-result v5

    iget-object v2, v2, Lv3m;->d:Lplk;

    iget-object v6, v0, Ly4m;->d:Lv3m;

    invoke-virtual {v6}, Lv3m;->g()Z

    move-result v7

    if-eq v7, v3, :cond_249

    iget-object v7, v6, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v8, "translate_web_pages_enabled"

    invoke-virtual {v7, v3, v8}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {v6}, Lv3m;->d()Lszb;

    move-result-object v7

    invoke-virtual {v6, v7}, Lv3m;->i(Lszb;)V

    :cond_249
    if-eqz v5, :cond_25e

    invoke-virtual {v0, p0}, Ly4m;->H0(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_25e

    iget-object v0, v2, Lplk;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    new-instance v1, Le4m;

    invoke-direct {v1, v2, p0, v3}, Le4m;-><init>(Lplk;Ljava/lang/String;B)V

    invoke-virtual {v0, v1}, Lxl;->j(Lcom/opera/api/Callback;)V

    goto :goto_29f

    :cond_25e
    iget-object v5, v2, Lplk;->b:Ljava/lang/Object;

    check-cast v5, Lxl;

    new-instance v6, Le4m;

    invoke-direct {v6, v2, p0, v4}, Le4m;-><init>(Lplk;Ljava/lang/String;B)V

    invoke-virtual {v5, v6}, Lxl;->j(Lcom/opera/api/Callback;)V

    iget-object v2, v0, Ly4m;->f:Lr4m;

    new-instance v4, Lo4m;

    invoke-direct {v4, v2, v1}, Lo4m;-><init>(Lr4m;B)V

    invoke-virtual {v2, v4}, Lr4m;->c0(Ljava/lang/Runnable;)V

    iget-object v1, v0, Ly4m;->e:Lghf;

    new-instance v2, Lj5g;

    const/16 v4, 0x18

    invoke-direct {v2, v0, p0, v4}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v1, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Landroid/content/res/Resources;

    const v0, 0x7f14113f

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    iget-object v0, v1, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_29f

    new-instance v4, Lc4m;

    const v5, 0x7f1412ee

    invoke-direct {v4, v1, p0, v5, v2}, Lc4m;-><init>(Lghf;Ljava/lang/String;ILandroid/view/View$OnClickListener;)V

    iget-object p0, v1, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Laal;

    invoke-virtual {p0, v4, v0, v3}, Laal;->S(Lo93;Lb2l;Z)V

    :cond_29f
    :goto_29f
    return-void

    :pswitch_2a0
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    iget-object v0, v0, Lxl;->k:Ljava/lang/Object;

    check-cast v0, Lg4m;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_2b0
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ld4m;

    iget-object v0, v0, Lxl;->k:Ljava/lang/Object;

    check-cast v0, Lg4m;

    invoke-virtual {p0, v0}, Ld4m;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_2c0
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lop1;

    :try_start_2c8
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_2cb
    .catchall {:try_start_2c8 .. :try_end_2cb} :catchall_2cf

    invoke-virtual {p0}, Lop1;->a()V

    return-void

    :catchall_2cf
    move-exception v0

    invoke-virtual {p0}, Lop1;->a()V

    throw v0

    :pswitch_2d4
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lc5o;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Llld;

    new-instance v1, Lfd9;

    iget-object v0, v0, Lc5o;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    const v2, 0x7f14131d

    invoke-direct {v1, v0, v4, v2, p0}, Lsj2;-><init>(Landroid/content/Context;IILrj2;)V

    invoke-virtual {v1}, Lsj2;->e()V

    return-void

    :pswitch_2ec
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lc5o;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object v0, v0, Lc5o;->a:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_2fc
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lbf9;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lzzh;

    iput-object v2, v0, Lbf9;->p:Lmgh;

    sget-object v0, Lixl;->a:Lixl;

    invoke-virtual {p0, v0}, Lzzh;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_30c
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lbf9;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lbf9;->A(Ljava/lang/String;)V

    return-void

    :pswitch_318
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/api/Callback;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lrwl;

    invoke-interface {v0, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_324
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lcxl;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Lcxl;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_335
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/api/Callback;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_346
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lxx1;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Ltwl;

    invoke-virtual {v0, p0}, Lxx1;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_352
    iget-object v0, p0, Lnpl;->b:Ljava/lang/Object;

    check-cast v0, Lw7j;

    iget-object p0, p0, Lnpl;->c:Ljava/lang/Object;

    check-cast p0, Lw8k;

    iget-object v0, v0, Lw7j;->b:Ljava/lang/Object;

    check-cast v0, Lwzg;

    invoke-virtual {v0, p0, v1}, Lwzg;->c(Lw8k;I)V

    return-void

    :pswitch_data_362
    .packed-switch 0x0
        :pswitch_352
        :pswitch_346
        :pswitch_335
        :pswitch_324
        :pswitch_318
        :pswitch_30c
        :pswitch_2fc
        :pswitch_2ec
        :pswitch_2d4
        :pswitch_2c0
        :pswitch_2b0
        :pswitch_2a0
        :pswitch_221
        :pswitch_1e4
        :pswitch_1cc
        :pswitch_1b1
        :pswitch_19f
        :pswitch_185
        :pswitch_175
        :pswitch_15e
        :pswitch_148
        :pswitch_129
        :pswitch_100
        :pswitch_c9
        :pswitch_bd
        :pswitch_b1
        :pswitch_70
        :pswitch_64
        :pswitch_15
    .end packed-switch
.end method
