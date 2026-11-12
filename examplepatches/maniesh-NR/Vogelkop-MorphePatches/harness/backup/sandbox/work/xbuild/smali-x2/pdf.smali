.class public final Lpdf;
.super Ly9k;
.source "SourceFile"


# instance fields
.field public final h:Lmcj;

.field public final i:Lorm;

.field public final j:Lmdf;

.field public final k:Lr65;

.field public final l:Lyl6;

.field public final m:Ll5b;

.field public n:Lw9k;

.field public o:Ljava/util/List;


# direct methods
.method public constructor <init>(Lmcj;Lorm;Lmdf;Lr65;Lyl6;)V
    .registers 6

    invoke-direct {p0}, Ly9k;-><init>()V

    iput-object p1, p0, Lpdf;->h:Lmcj;

    iput-object p2, p0, Lpdf;->i:Lorm;

    iput-object p3, p0, Lpdf;->j:Lmdf;

    iput-object p4, p0, Lpdf;->k:Lr65;

    iput-object p5, p0, Lpdf;->l:Lyl6;

    new-instance p1, Ll5b;

    const/4 p2, 0x4

    invoke-direct {p1, p2}, Ll5b;-><init>(B)V

    const/4 p2, 0x1

    iput-boolean p2, p1, Ll5b;->b:Z

    iput-object p1, p0, Lpdf;->m:Ll5b;

    return-void
.end method


# virtual methods
.method public final f0()V
    .registers 6

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    invoke-virtual {v1}, Lru9;->b()Lnv6;

    move-result-object v1

    iget-object v2, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    const-string v3, "oem.onboarding.completed"

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    const-string v3, "oem.onboarding.cmp_intro_reached"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1}, Lnv6;->w()V

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->m0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lldf;

    iget-object v0, v0, Lldf;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "need"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->N()Lq0o;

    move-result-object v0

    iput-boolean v4, v0, Lq0o;->h:Z

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->W()V

    return-void
.end method

.method public final g0(Landroid/content/Context;)Ljava/util/List;
    .registers 2

    invoke-virtual {p0, p1}, Lpdf;->o0(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final h0()I
    .registers 4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lpdf;->o0(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p0

    const/4 v1, 0x0

    if-eqz p0, :cond_19

    const-string v2, "key.steps_after_feature_onboarding"

    invoke-virtual {p0, v2, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    :cond_19
    add-int/2addr v0, v1

    return v0
.end method

.method public final j0()Z
    .registers 2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget v0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge v0, p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final m0()Z
    .registers 2

    invoke-virtual {p0}, Lpdf;->h0()I

    move-result p0

    const/4 v0, 0x1

    if-le p0, v0, :cond_8

    return v0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final o0(Landroid/content/Context;)Ljava/util/List;
    .registers 16

    iget-object v0, p0, Lpdf;->o:Ljava/util/List;

    if-nez v0, :cond_11b

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const/4 v11, 0x0

    if-eqz v0, :cond_47

    const-string v2, "key.onboarding_page_ids"

    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_47

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    array-length v4, v0

    const/4 v5, 0x0

    :goto_1a
    if-ge v5, v4, :cond_48

    aget-object v6, v0, v5

    sget-object v7, Lm0o;->h:Lh58;

    invoke-virtual {v7}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_24
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3c

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v9, v8

    check-cast v9, Lm0o;

    invoke-virtual {v9}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_24

    goto :goto_3d

    :cond_3c
    move-object v8, v11

    :goto_3d
    check-cast v8, Lm0o;

    if-eqz v8, :cond_44

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_44
    add-int/lit8 v5, v5, 0x1

    goto :goto_1a

    :cond_47
    move-object v2, v11

    :cond_48
    if-nez v2, :cond_4c

    sget-object v2, Ll08;->a:Ll08;

    :cond_4c
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_56

    sget-object v0, Ll08;->a:Ll08;

    goto/16 :goto_119

    :cond_56
    check-cast v2, Ljava/lang/Iterable;

    new-instance v12, Ljava/util/ArrayList;

    const/16 v0, 0xa

    invoke-static {v2, v0}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {v12, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_67
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_118

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm0o;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/16 v6, 0x1b

    const/4 v4, 0x1

    iget-object v5, p0, Lpdf;->j:Lmdf;

    if-eq v2, v4, :cond_ff

    const/4 v4, 0x2

    if-eq v2, v4, :cond_de

    const/4 v4, 0x3

    if-ne v2, v4, :cond_d8

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v0

    iget-object v2, p0, Lpdf;->k:Lr65;

    if-eqz v0, :cond_a8

    new-instance v6, Ls59;

    iget-object v7, v2, Lr65;->b:Lvx;

    invoke-virtual {v7}, Lvx;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ld75;

    iget-boolean v7, v7, Ld75;->f:Z

    invoke-direct {v6, v7}, Ls59;-><init>(Z)V

    goto :goto_ad

    :cond_a8
    new-instance v6, Lb1i;

    invoke-direct {v6}, Lb1i;-><init>()V

    :goto_ad
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lp65;

    invoke-direct {v7, v0, v2}, Lp65;-><init>(ZLr65;)V

    new-instance v0, Lz65;

    new-instance v2, Lhu5;

    const/16 v8, 0x1c

    invoke-direct {v2, v5, v7, v8}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v8, Ljbd;

    const/16 v9, 0x8

    invoke-direct {v8, v5, v7, p0, v9}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v9, Lyqd;

    const/16 v5, 0x1d

    invoke-direct {v9, v7, v5}, Lyqd;-><init>(Ljava/lang/Object;B)V

    new-instance v10, Lpn;

    invoke-direct {v10, p1, v4}, Lpn;-><init>(Landroid/content/Context;B)V

    move-object v5, p1

    move-object v4, v0

    move-object v7, v2

    invoke-direct/range {v4 .. v10}, Lz65;-><init>(Landroid/content/Context;Lp10;Lhu5;Ljbd;Lyqd;Lpn;)V

    goto :goto_113

    :cond_d8
    const-string v1, " is not an onboarding page"

    invoke-static {v0, v1}, Luac;->h(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v11

    :cond_de
    const-string v0, "com.opera.android.permissions.PermissionHandlerService"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lsz4;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Lz65;

    new-instance v0, Lxx1;

    move-object v4, v5

    const/4 v5, 0x5

    move-object v3, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lxx1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lyqd;

    invoke-direct {v2, v4, v6}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v7, p1, v0, v2}, Lz65;-><init>(Landroid/content/Context;Lxx1;Lyqd;)V

    move-object v0, v7

    goto :goto_113

    :cond_ff
    move-object v4, v5

    new-instance v0, Lz65;

    new-instance v2, Lhu5;

    iget-object v5, p0, Lpdf;->l:Lyl6;

    invoke-direct {v2, p0, v5, v6}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v5, Lhpd;

    const/16 v6, 0x18

    invoke-direct {v5, v4, p0, v6}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, p1, v2, v5}, Lz65;-><init>(Landroid/content/Context;Lhu5;Lhpd;)V

    :goto_113
    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_67

    :cond_118
    move-object v0, v12

    :goto_119
    iput-object v0, p0, Lpdf;->o:Ljava/util/List;

    :cond_11b
    return-object v0
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    check-cast p1, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {p1}, Lcom/opera/android/startup/WelcomeActivity;->T()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/startup/WelcomeActivity;->V(Z)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Ly9k;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_e

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    :cond_e
    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 5

    invoke-super {p0, p1, p2, p3}, Ly9k;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p2

    new-instance p3, Llzb;

    const/16 v0, 0x1a

    invoke-direct {p3, p0, v0}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p3}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    new-instance p2, Lodf;

    const/4 p3, 0x0

    invoke-direct {p2, p3}, Lodf;-><init>(B)V

    sget-object p3, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p0, p2}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public final onResume()V
    .registers 13

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    iget-object v0, p0, Lpdf;->n:Lw9k;

    if-eqz v0, :cond_67

    const/4 v1, 0x0

    iput-object v1, p0, Lpdf;->n:Lw9k;

    sget-object v2, Lkl0;->d:Lkl0;

    iget-object v3, p0, Lpdf;->j:Lmdf;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    iget-object v5, v4, Lcom/opera/android/OperaApplication;->c:Ljava/lang/Object;

    monitor-enter v5

    :try_start_1d
    iput-object v1, v4, Lcom/opera/android/OperaApplication;->b:Lsl6;
    :try_end_1f
    .catchall {:try_start_1d .. :try_end_1f} :catchall_63

    monitor-exit v5

    iget-object v6, p0, Lpdf;->l:Lyl6;

    invoke-virtual {v6}, Lyl6;->d()Lsl6;

    move-result-object v1

    invoke-virtual {v1}, Lsl6;->b()Z

    move-result v1

    const/16 v4, 0x1c

    if-eqz v1, :cond_3c

    new-instance v1, Lyqd;

    invoke-direct {v1, v0, v4}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    sget-object v0, Lgl0;->b:Lgl0;

    invoke-virtual {v3, v2, v0}, Lmdf;->a(Lkl0;Lgl0;)V

    goto :goto_4f

    :cond_3c
    invoke-static {}, Ltl6;->a()Z

    move-result v1

    if-nez v1, :cond_4a

    new-instance v1, Lyqd;

    invoke-direct {v1, v0, v4}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_4a
    sget-object v0, Lgl0;->g:Lgl0;

    invoke-virtual {v3, v2, v0}, Lmdf;->a(Lkl0;Lgl0;)V

    :goto_4f
    iget-object v0, p0, Lpdf;->m:Ll5b;

    iget-object v7, p0, Lpdf;->i:Lorm;

    sget-object v8, Lvb0;->b:Lvb0;

    sget-object v9, Lac0;->e:Lac0;

    iget-boolean p0, v0, Ll5b;->b:Z

    xor-int/lit8 v10, p0, 0x1

    const/4 v11, 0x0

    invoke-virtual/range {v6 .. v11}, Lyl6;->i(Lorm;Lvb0;Lac0;ZLjava/lang/String;)V

    const/4 p0, 0x0

    iput-boolean p0, v0, Ll5b;->b:Z

    return-void

    :catchall_63
    move-exception v0

    move-object p0, v0

    monitor-exit v5

    throw p0

    :cond_67
    return-void
.end method
