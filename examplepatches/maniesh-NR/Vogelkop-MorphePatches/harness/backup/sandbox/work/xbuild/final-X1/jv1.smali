.class public final synthetic Ljv1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxv1;


# direct methods
.method public synthetic constructor <init>(Lxv1;B)V
    .registers 3

    iput-byte p2, p0, Ljv1;->a:B

    iput-object p1, p0, Ljv1;->b:Lxv1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Ljv1;->a:B

    const/16 v1, 0x2d

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x1

    iget-object p0, p0, Ljv1;->b:Lxv1;

    packed-switch v0, :pswitch_data_256

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object p0

    invoke-virtual {p0}, Lv1;->x()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_19
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v4, v5}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    return-object p0

    :pswitch_26
    sget-object v0, Lhs3;->a:Ln9a;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Ln9a;->s(Landroid/content/Context;)Lhs3;

    move-result-object p0

    return-object p0

    :pswitch_32
    new-instance v0, Lwyn;

    iget-object v1, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v1}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v1

    new-instance v2, Lhv1;

    const/16 v3, 0x1a

    invoke-direct {v2, p0, v3}, Lhv1;-><init>(Lxv1;B)V

    new-instance v3, Lhv1;

    const/16 v4, 0x1b

    invoke-direct {v3, p0, v4}, Lhv1;-><init>(Lxv1;B)V

    invoke-direct {v0, v1, v2, v3}, Lwyn;-><init>(Ldj9;Lhv1;Lhv1;)V

    return-object v0

    :pswitch_4c
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    const-string v0, ""

    const-string v1, "redirect.opera.com"

    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    const/16 v2, 0x22

    invoke-virtual {p0, v2, v6}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    if-eqz p0, :cond_79

    iget-object v2, p0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v2, Ljava/lang/String;

    invoke-static {v2, v1}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-static {v2, v0}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast p0, Lh1b;

    goto :goto_7b

    :cond_79
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_7b
    new-instance v2, Lpne;

    invoke-direct {v2, v1, v0, p0}, Lpne;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v2

    :pswitch_81
    iget-object p0, p0, Lxv1;->v:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljk5;

    iget-object v1, p0, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_8c
    iget-object p0, p0, Ljk5;->e:Ljava/lang/String;
    :try_end_8e
    .catchall {:try_start_8c .. :try_end_8e} :catchall_97

    if-eqz p0, :cond_91

    move v3, v6

    :cond_91
    monitor-exit v1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :catchall_97
    move-exception v0

    move-object p0, v0

    monitor-exit v1

    throw p0

    :pswitch_9b
    sget-object v0, Lebb;->c:Lebb;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lu59;->C(Landroid/content/Context;)Lu59;

    move-result-object p0

    invoke-virtual {p0}, Lu59;->H()Lt59;

    move-result-object p0

    iget-wide v0, p0, Lt59;->b:J

    invoke-static {v0, v1}, Lj06;->m(J)Lebb;

    move-result-object p0

    return-object p0

    :pswitch_ae
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v4, v5}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    return-object p0

    :pswitch_bb
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v1, "eula_accepted.gdpr"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e6

    invoke-static {p0}, Ljpo;->D(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_d5

    new-instance v2, Lqcl;

    invoke-direct {v2, v0}, Lou9;-><init>(Ljava/lang/String;)V

    goto :goto_e6

    :cond_d5
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string v0, "personalized_ads"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_e4

    sget-object v2, Lqcl;->b:Lqcl;

    goto :goto_e6

    :cond_e4
    sget-object v2, Lqcl;->c:Lqcl;

    :cond_e6
    :goto_e6
    return-object v2

    :pswitch_e7
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object p0

    iget-object v1, p0, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_f0
    iget-object v0, p0, Ljk5;->e:Ljava/lang/String;
    :try_end_f2
    .catchall {:try_start_f0 .. :try_end_f2} :catchall_fa

    monitor-exit v1

    if-nez v0, :cond_f9

    invoke-virtual {p0}, Ljk5;->a()Ljava/lang/String;

    move-result-object v0

    :cond_f9
    return-object v0

    :catchall_fa
    move-exception v0

    move-object p0, v0

    monitor-exit v1

    throw p0

    :pswitch_fe
    new-instance v0, Lfjn;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    invoke-static {p0}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v2

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->d:Lx5f;

    invoke-direct {v0, p0, v1, v2, v3}, Lfjn;-><init>(Landroid/content/Context;Lru9;Ldj9;Lx5f;)V

    return-object v0

    :pswitch_114
    sget-object v0, Lhs3;->a:Ln9a;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Ln9a;->t(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_120
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    return-object p0

    :pswitch_127
    iget-object p0, p0, Lxv1;->X0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld6j;

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_132
    new-instance v0, Ll45;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    const/16 v1, 0x18

    invoke-direct {v0, p0, v1}, Ll45;-><init>(Landroid/content/Context;B)V

    return-object v0

    :pswitch_13c
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object p0

    invoke-virtual {p0}, Lv1;->x()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_147
    new-instance v0, Lyen;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v2

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v3

    invoke-direct {v0, p0, v1, v2, v3}, Lyen;-><init>(Landroid/content/Context;Lx5f;Lslk;Lydn;)V

    return-object v0

    :pswitch_15d
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v6, p0}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v6, p0}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_168
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v4, v5}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    return-object p0

    :pswitch_175
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    const/4 v0, 0x4

    invoke-static {v6, p0}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_181
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object p0

    invoke-virtual {p0}, Ljk5;->a()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_18c
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Ljpo;->D(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1a5

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string v0, "personalized_ads"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1a3

    const-string v0, "true"

    goto :goto_1a5

    :cond_1a3
    const-string v0, "false"

    :cond_1a5
    :goto_1a5
    return-object v0

    :pswitch_1a6
    sget-object v0, Lhs3;->a:Ln9a;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Ln9a;->t(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1b2
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lnr8;->e(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_1bd
    new-instance v0, Lien;

    iget-object v1, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v3

    iget-object p0, p0, Lxv1;->c1:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Lnzk;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lien;-><init>(Landroid/content/Context;Lx5f;Lslk;Lnzk;Lydn;)V

    return-object v0

    :pswitch_1dc
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    invoke-virtual {p0, v1, v3}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    return-object p0

    :pswitch_1ed
    iget-object p0, p0, Lxv1;->E0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk3i;

    invoke-virtual {p0}, Lk3i;->c()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1fe
    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Loup;->Z(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0

    :pswitch_205
    new-instance v0, Lpjn;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lpjn;-><init>(Ljava/lang/Object;B)V

    return-object v0

    :pswitch_20d
    const-string v0, "en"

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v4, Lwwc;->a:Ljava/util/Locale;

    invoke-static {p0}, Lipe;->z(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v4, "language_code"

    invoke-interface {p0, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_229

    sget-object p0, Lwwc;->a:Ljava/util/Locale;

    invoke-static {p0}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    :cond_229
    invoke-static {p0}, Lwwc;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Lywc;->d()V

    sget-object v2, Lywc;->a:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    invoke-interface {v2, p0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_254

    const/4 v4, 0x6

    invoke-static {p0, v1, v3, v4}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_255

    invoke-static {p0, v1, v3, v4}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v1

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v2, p0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_255

    :cond_254
    move-object v0, p0

    :cond_255
    return-object v0

    :pswitch_data_256
    .packed-switch 0x0
        :pswitch_20d
        :pswitch_205
        :pswitch_1fe
        :pswitch_1ed
        :pswitch_1dc
        :pswitch_1bd
        :pswitch_1b2
        :pswitch_1a6
        :pswitch_18c
        :pswitch_181
        :pswitch_175
        :pswitch_168
        :pswitch_15d
        :pswitch_147
        :pswitch_13c
        :pswitch_132
        :pswitch_127
        :pswitch_120
        :pswitch_114
        :pswitch_fe
        :pswitch_e7
        :pswitch_bb
        :pswitch_ae
        :pswitch_9b
        :pswitch_81
        :pswitch_4c
        :pswitch_32
        :pswitch_26
        :pswitch_19
    .end packed-switch
.end method
