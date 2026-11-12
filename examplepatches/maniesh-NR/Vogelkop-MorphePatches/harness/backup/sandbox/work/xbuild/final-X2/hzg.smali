.class public final Lhzg;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lben;

.field public final e:Lrj;

.field public final f:Lsyl;

.field public final g:Lqoj;

.field public final h:Lydn;

.field public final i:Lxi5;

.field public final j:Lkw3;

.field public final k:Lkw3;

.field public final l:Lwc7;

.field public final m:Lmw3;

.field public final n:Lode;

.field public final o:Lgzg;

.field public final p:Ldzg;

.field public final q:Lezg;


# direct methods
.method public constructor <init>(Lben;Lrj;Lsyl;Lqoj;Lcom/opera/android/settings/SettingsManager;Ld8j;Lydn;Lxi5;Lkw3;Lkw3;Lwc7;Lmw3;)V
    .registers 13

    invoke-direct {p0, p5, p6}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p1, p0, Lhzg;->d:Lben;

    iput-object p2, p0, Lhzg;->e:Lrj;

    iput-object p3, p0, Lhzg;->f:Lsyl;

    iput-object p4, p0, Lhzg;->g:Lqoj;

    iput-object p7, p0, Lhzg;->h:Lydn;

    iput-object p8, p0, Lhzg;->i:Lxi5;

    iput-object p9, p0, Lhzg;->j:Lkw3;

    iput-object p10, p0, Lhzg;->k:Lkw3;

    iput-object p11, p0, Lhzg;->l:Lwc7;

    iput-object p12, p0, Lhzg;->m:Lmw3;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lhzg;->n:Lode;

    new-instance p1, Lgzg;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lgzg;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lhzg;->o:Lgzg;

    new-instance p3, Ldzg;

    invoke-direct {p3, p0, p2}, Ldzg;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p0, Lhzg;->p:Ldzg;

    new-instance p4, Lezg;

    invoke-direct {p4, p0, p2}, Lezg;-><init>(Ljava/lang/Object;B)V

    iput-object p4, p0, Lhzg;->q:Lezg;

    invoke-virtual {p0}, Lhzg;->g()V

    invoke-virtual {p5, p4}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p7, p1}, Lydn;->b(Ltdn;)V

    iget-object p0, p11, Lwc7;->c:Lh7f;

    invoke-virtual {p0, p3}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 3

    iget-object v0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lhzg;->q:Lezg;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, Lhzg;->h:Lydn;

    iget-object v1, p0, Lhzg;->o:Lgzg;

    invoke-virtual {v0, v1}, Lydn;->A(Ltdn;)V

    iget-object v0, p0, Lhzg;->p:Ldzg;

    iget-object p0, p0, Lhzg;->l:Lwc7;

    iget-object p0, p0, Lwc7;->c:Lh7f;

    invoke-virtual {p0, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final g()V
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lhzg;->h:Lydn;

    iget-object v2, v1, Lydn;->d:Lvdn;

    iget-object v3, v1, Lydn;->c:Lgfn;

    invoke-virtual {v2}, Lvdn;->a()Z

    move-result v2

    iget-object v4, v0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const v5, 0x1010038

    if-eqz v2, :cond_19

    const v2, 0x7f1410eb

    :goto_16
    move v10, v2

    move v11, v5

    goto :goto_3c

    :cond_19
    iget-object v2, v1, Lydn;->d:Lvdn;

    iget-boolean v2, v2, Lvdn;->a:Z

    if-eqz v2, :cond_23

    const v2, 0x7f1410ec

    goto :goto_16

    :cond_23
    const-string v2, "compression"

    invoke-virtual {v4, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_38

    invoke-interface {v3}, Lgfn;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_38

    const v2, 0x7f141375

    const v5, 0x7f040316

    goto :goto_16

    :cond_38
    const v2, 0x7f1410ea

    goto :goto_16

    :goto_3c
    new-instance v6, Lign;

    invoke-virtual {v1}, Lydn;->p()Lwdn;

    move-result-object v2

    iget-boolean v8, v2, Lwdn;->a:Z

    iget-object v1, v1, Lydn;->d:Lvdn;

    iget-boolean v9, v1, Lvdn;->a:Z

    invoke-interface {v3}, Lgfn;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_53

    const v1, 0x7f1413ee

    :goto_51
    move v7, v1

    goto :goto_57

    :cond_53
    const v1, 0x7f141408

    goto :goto_51

    :goto_57
    invoke-direct/range {v6 .. v11}, Lign;-><init>(IZZII)V

    const-string v1, "ad_blocking"

    invoke-virtual {v4, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_73

    iget-object v1, v0, Lhzg;->j:Lkw3;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_73

    move v1, v3

    goto :goto_74

    :cond_73
    move v1, v2

    :goto_74
    iget-object v5, v0, Lhzg;->i:Lxi5;

    invoke-virtual {v5}, Lxi5;->b()J

    move-result-wide v7

    long-to-int v7, v7

    if-eqz v1, :cond_81

    const v8, 0x7f140f51

    goto :goto_84

    :cond_81
    const v8, 0x7f140f4f

    :goto_84
    new-instance v14, Lsj;

    if-eqz v1, :cond_8c

    if-lez v7, :cond_8c

    move v9, v3

    goto :goto_8d

    :cond_8c
    move v9, v2

    :goto_8d
    invoke-direct {v14, v7, v8, v1, v9}, Lsj;-><init>(IIZZ)V

    const-string v1, "tracker_blocker"

    invoke-virtual {v4, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a7

    iget-object v1, v0, Lhzg;->k:Lkw3;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_a7

    move v1, v3

    goto :goto_a8

    :cond_a7
    move v1, v2

    :goto_a8
    invoke-virtual {v5}, Lxi5;->e()J

    move-result-wide v7

    long-to-int v5, v7

    if-eqz v1, :cond_b3

    const v7, 0x7f1410d2

    goto :goto_b6

    :cond_b3
    const v7, 0x7f1410d0

    :goto_b6
    new-instance v15, Ltyl;

    if-eqz v1, :cond_be

    if-lez v5, :cond_be

    move v8, v3

    goto :goto_bf

    :cond_be
    move v8, v2

    :goto_bf
    invoke-direct {v15, v5, v7, v1, v8}, Ltyl;-><init>(IIZZ)V

    invoke-static {}, Lj7j;->values()[Lj7j;

    move-result-object v1

    const-string v5, "accept_cookies"

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v5

    aget-object v16, v1, v5

    iget-object v1, v0, Lhzg;->l:Lwc7;

    iget-object v5, v1, Lwc7;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v7, "dns_over_https_enabled"

    invoke-virtual {v5, v7}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_e0

    const v1, 0x7f140f14

    :goto_dd
    move/from16 v18, v1

    goto :goto_108

    :cond_e0
    iget-object v1, v1, Lwc7;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->l()Ll7j;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_104

    if-eq v1, v3, :cond_100

    const/4 v3, 0x2

    if-eq v1, v3, :cond_fc

    const/4 v3, 0x3

    if-ne v1, v3, :cond_f8

    const v1, 0x7f14050d

    goto :goto_dd

    :cond_f8
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_fc
    const v1, 0x7f140810

    goto :goto_dd

    :cond_100
    const v1, 0x7f140451

    goto :goto_dd

    :cond_104
    const v1, 0x7f140f13

    goto :goto_dd

    :goto_108
    iget-object v1, v0, Lhzg;->m:Lmw3;

    invoke-virtual {v1}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_122

    new-instance v1, Liwk;

    invoke-virtual {v4}, Lcom/opera/android/settings/SettingsManager;->getSafeBrowsingEnabled()Z

    move-result v3

    invoke-direct {v1, v3}, Liwk;-><init>(Z)V

    :goto_11f
    move-object/from16 v17, v1

    goto :goto_125

    :cond_122
    sget-object v1, Lhwk;->a:Lhwk;

    goto :goto_11f

    :goto_125
    const-string v1, "block_popups"

    invoke-virtual {v4, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v19

    const-string v1, "exit_clear_data_categories"

    invoke-virtual {v4, v1}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lz4o;->A0(Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v1

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lz4o;->R()[Lr25;

    move-result-object v4

    array-length v5, v4

    move v7, v2

    :goto_140
    if-ge v7, v5, :cond_152

    aget-object v8, v4, v7

    iget-object v9, v8, Lr25;->a:Ljava/lang/String;

    invoke-virtual {v1, v9}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_14f

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_14f
    add-int/lit8 v7, v7, 0x1

    goto :goto_140

    :cond_152
    new-array v1, v2, [Lr25;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lr25;

    array-length v2, v1

    if-nez v2, :cond_162

    sget-object v1, Lh35;->k:Lh35;

    move-object/from16 v20, v1

    goto :goto_169

    :cond_162
    new-instance v2, Lg35;

    invoke-direct {v2, v1}, Lg35;-><init>([Lr25;)V

    move-object/from16 v20, v2

    :goto_169
    new-instance v12, Lczg;

    move-object v13, v6

    invoke-direct/range {v12 .. v20}, Lczg;-><init>(Lign;Lsj;Ltyl;Lj7j;Lcgh;IZLkfo;)V

    iget-object v0, v0, Lhzg;->n:Lode;

    invoke-virtual {v0, v12}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
