.class public final Ldaj;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lben;

.field public final e:Lwc6;

.field public final f:Lrj;

.field public final g:Lsyl;

.field public final h:Lzwe;

.field public final i:Lru9;

.field public final j:Lydn;

.field public final k:Lxi5;

.field public final l:Lkw3;

.field public final m:Lkw3;

.field public final n:Ldxe;

.field public final o:Lyk6;

.field public final p:Lmm6;

.field public final q:Lyl6;

.field public final r:Llw3;

.field public final s:Lode;


# direct methods
.method public constructor <init>(Ld8j;Lben;Lwc6;Lrj;Lsyl;Lzwe;Lcom/opera/android/settings/SettingsManager;Lru9;Lydn;Lxi5;Lkw3;Lkw3;Ldxe;Lyk6;Lmm6;Lyl6;Llw3;)V
    .registers 30

    move-object/from16 v0, p7

    move-object/from16 v1, p9

    move-object/from16 v2, p10

    move-object/from16 v3, p13

    move-object/from16 v4, p14

    move-object/from16 v5, p15

    invoke-direct {p0, v0, p1}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p2, p0, Ldaj;->d:Lben;

    iput-object p3, p0, Ldaj;->e:Lwc6;

    move-object/from16 p1, p4

    iput-object p1, p0, Ldaj;->f:Lrj;

    move-object/from16 p1, p5

    iput-object p1, p0, Ldaj;->g:Lsyl;

    move-object/from16 p1, p6

    iput-object p1, p0, Ldaj;->h:Lzwe;

    move-object/from16 p1, p8

    iput-object p1, p0, Ldaj;->i:Lru9;

    iput-object v1, p0, Ldaj;->j:Lydn;

    iput-object v2, p0, Ldaj;->k:Lxi5;

    move-object/from16 p1, p11

    iput-object p1, p0, Ldaj;->l:Lkw3;

    move-object/from16 p1, p12

    iput-object p1, p0, Ldaj;->m:Lkw3;

    iput-object v3, p0, Ldaj;->n:Ldxe;

    iput-object v4, p0, Ldaj;->o:Lyk6;

    iput-object v5, p0, Ldaj;->p:Lmm6;

    move-object/from16 p1, p16

    iput-object p1, p0, Ldaj;->q:Lyl6;

    move-object/from16 p1, p17

    iput-object p1, p0, Ldaj;->r:Llw3;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Ldaj;->s:Lode;

    new-instance p1, Ltvk;

    invoke-direct {p1, p0}, Ltvk;-><init>(Ll7n;)V

    iget-object p1, p1, Ltvk;->a:Ljava/lang/Object;

    check-cast p1, Lkze;

    new-instance v6, Lgzg;

    const/4 v7, 0x1

    invoke-direct {v6, p0, v7}, Lgzg;-><init>(Ljava/lang/Object;B)V

    new-instance v8, Lxu1;

    const/4 v9, 0x2

    invoke-direct {v8, p0, v9}, Lxu1;-><init>(Ljava/lang/Object;B)V

    new-instance v10, Lezg;

    invoke-direct {v10, p0, v9}, Lezg;-><init>(Ljava/lang/Object;B)V

    new-instance v9, Lly3;

    invoke-direct {v9, p0, v7}, Lly3;-><init>(Ljava/lang/Object;B)V

    new-instance v7, Lqzg;

    const/16 v11, 0x9

    invoke-direct {v7, p0, v11}, Lqzg;-><init>(Ljava/lang/Object;B)V

    new-instance v11, Lcaj;

    invoke-direct {v11, p0}, Lcaj;-><init>(Ldaj;)V

    invoke-virtual {p0}, Ldaj;->g()V

    invoke-static {v0, p1, v10}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    invoke-static {v1, p1, v6}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    if-eqz v3, :cond_7d

    invoke-static {v3, p1, v8}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    :cond_7d
    invoke-static {v5, p1, v9}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iget-object p0, v4, Lyk6;->i:Lkze;

    invoke-static {p0, p1, v7}, La26;->T(Lekc;Likc;Lf7f;)V

    invoke-static {v2, p1, v11}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    sget-object p0, Lowe;->c:Lowe;

    invoke-static {p0, p1, v8}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 21

    move-object/from16 v0, p0

    new-instance v1, Lt9j;

    iget-object v2, v0, Ldaj;->p:Lmm6;

    invoke-virtual {v2}, Lmm6;->a()Lyl6;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ltl6;->a()Z

    move-result v3

    if-nez v3, :cond_15

    const/4 v2, 0x0

    goto :goto_19

    :cond_15
    invoke-virtual {v2}, Lyl6;->k()Z

    move-result v2

    :goto_19
    if-eqz v2, :cond_1f

    const v2, 0x7f140f95

    goto :goto_22

    :cond_1f
    const v2, 0x7f140f96

    :goto_22
    iget-object v3, v0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v5, "ai_assistant_menu_shortcut"

    invoke-virtual {v3, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_30

    const v6, 0x7f1401d0

    goto :goto_33

    :cond_30
    const v6, 0x7f1401cf

    :goto_33
    new-instance v7, Lg52;

    iget-object v8, v0, Ldaj;->o:Lyk6;

    iget-object v8, v8, Lyk6;->i:Lkze;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    invoke-virtual {v3, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v5

    invoke-direct {v7, v8, v5, v6}, Lg52;-><init>(ZZI)V

    iget-object v5, v0, Ldaj;->j:Lydn;

    iget-object v6, v5, Lydn;->d:Lvdn;

    iget-object v8, v5, Lydn;->c:Lgfn;

    invoke-virtual {v6}, Lvdn;->a()Z

    move-result v6

    const v9, 0x7f040316

    const-string v10, "compression"

    const v11, 0x1010038

    if-eqz v6, :cond_66

    const v6, 0x7f1410eb

    :goto_61
    move/from16 v16, v6

    move/from16 v17, v11

    goto :goto_88

    :cond_66
    iget-object v6, v5, Lydn;->d:Lvdn;

    iget-boolean v6, v6, Lvdn;->a:Z

    if-eqz v6, :cond_70

    const v6, 0x7f1410ec

    goto :goto_61

    :cond_70
    invoke-virtual {v3, v10}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_84

    invoke-interface {v8}, Lgfn;->isEnabled()Z

    move-result v6

    if-nez v6, :cond_84

    const v6, 0x7f141375

    move/from16 v16, v6

    move/from16 v17, v9

    goto :goto_88

    :cond_84
    const v6, 0x7f1410ea

    goto :goto_61

    :goto_88
    new-instance v12, Ljgn;

    invoke-virtual {v5}, Lydn;->p()Lwdn;

    move-result-object v6

    iget-boolean v14, v6, Lwdn;->a:Z

    iget-object v6, v5, Lydn;->d:Lvdn;

    iget-boolean v15, v6, Lvdn;->a:Z

    invoke-interface {v8}, Lgfn;->isEnabled()Z

    move-result v6

    if-eqz v6, :cond_9f

    const v6, 0x7f1413ee

    :goto_9d
    move v13, v6

    goto :goto_a3

    :cond_9f
    const v6, 0x7f141408

    goto :goto_9d

    :goto_a3
    invoke-direct/range {v12 .. v17}, Ljgn;-><init>(IZZII)V

    iget-object v6, v0, Ldaj;->k:Lxi5;

    invoke-virtual {v6}, Lxi5;->c()Lui5;

    move-result-object v13

    invoke-virtual {v13}, Lui5;->g()J

    move-result-wide v17

    invoke-virtual {v3, v10}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_c7

    const-wide/16 v8, 0x0

    cmp-long v8, v17, v8

    if-lez v8, :cond_c0

    const v8, 0x7f140535

    goto :goto_c3

    :cond_c0
    const v8, 0x7f140fbd

    :goto_c3
    move v15, v8

    move/from16 v16, v11

    goto :goto_de

    :cond_c7
    iget-object v13, v5, Lydn;->d:Lvdn;

    iget-boolean v13, v13, Lvdn;->a:Z

    if-eqz v13, :cond_da

    invoke-interface {v8}, Lgfn;->isEnabled()Z

    move-result v8

    if-nez v8, :cond_da

    const v8, 0x7f14053b

    move v15, v8

    move/from16 v16, v9

    goto :goto_de

    :cond_da
    const v8, 0x7f140fbb

    goto :goto_c3

    :goto_de
    new-instance v14, Lyc6;

    invoke-virtual {v3, v10}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v19

    invoke-direct/range {v14 .. v19}, Lyc6;-><init>(IIJZ)V

    const-string v8, "ad_blocking"

    invoke-virtual {v3, v8}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v8

    const/4 v9, 0x1

    if-eqz v8, :cond_ff

    iget-object v8, v0, Ldaj;->l:Lkw3;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_ff

    move v8, v9

    goto :goto_100

    :cond_ff
    const/4 v8, 0x0

    :goto_100
    invoke-virtual {v6}, Lxi5;->b()J

    move-result-wide v10

    long-to-int v10, v10

    if-eqz v8, :cond_10c

    const v11, 0x7f140f51

    :goto_10a
    move-object v13, v6

    goto :goto_110

    :cond_10c
    const v11, 0x7f140f4f

    goto :goto_10a

    :goto_110
    new-instance v6, Ltj;

    if-eqz v8, :cond_118

    if-lez v10, :cond_118

    move v15, v9

    goto :goto_119

    :cond_118
    const/4 v15, 0x0

    :goto_119
    invoke-direct {v6, v10, v11, v8, v15}, Ltj;-><init>(IIZZ)V

    const-string v8, "tracker_blocker"

    invoke-virtual {v3, v8}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_133

    iget-object v3, v0, Ldaj;->m:Lkw3;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_133

    move v3, v9

    goto :goto_134

    :cond_133
    const/4 v3, 0x0

    :goto_134
    invoke-virtual {v13}, Lxi5;->e()J

    move-result-wide v10

    long-to-int v8, v10

    if-eqz v3, :cond_140

    const v10, 0x7f1410d2

    :goto_13e
    move-object v11, v7

    goto :goto_144

    :cond_140
    const v10, 0x7f1410d0

    goto :goto_13e

    :goto_144
    new-instance v7, Luyl;

    if-eqz v3, :cond_14c

    if-lez v8, :cond_14c

    move v13, v9

    goto :goto_14d

    :cond_14c
    const/4 v13, 0x0

    :goto_14d
    invoke-direct {v7, v8, v10, v3, v13}, Luyl;-><init>(IIZZ)V

    new-instance v8, Lrxe;

    iget-object v3, v0, Ldaj;->n:Ldxe;

    if-eqz v3, :cond_15c

    iget-boolean v10, v3, Ldxe;->i:Z

    if-ne v10, v9, :cond_15c

    move v10, v9

    goto :goto_15d

    :cond_15c
    const/4 v10, 0x0

    :goto_15d
    if-eqz v3, :cond_170

    const v13, 0x7f141022

    const v15, 0x7f14101f

    const v9, 0x7f141021

    const v4, 0x7f14101e

    invoke-virtual {v3, v9, v4, v13, v15}, Ldxe;->R(IIII)Ljava/lang/String;

    move-result-object v3

    goto :goto_171

    :cond_170
    const/4 v3, 0x0

    :goto_171
    if-nez v3, :cond_175

    const-string v3, ""

    :cond_175
    invoke-direct {v8, v10, v3}, Lrxe;-><init>(ZLjava/lang/String;)V

    iget-object v3, v0, Ldaj;->q:Lyl6;

    invoke-virtual {v3}, Lyl6;->f()Z

    move-result v3

    iget-object v4, v0, Ldaj;->i:Lru9;

    iget-object v9, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v10, "make_default_banner.dismissed"

    const/4 v13, 0x0

    invoke-interface {v9, v10, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    iget-object v4, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v10, "make_default_banner.show_count"

    invoke-interface {v4, v10, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    iget-object v10, v0, Ldaj;->r:Llw3;

    invoke-virtual {v10}, Llw3;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lf8f;

    if-eqz v10, :cond_1a0

    invoke-virtual {v10}, Lf8f;->l()Z

    move-result v10

    goto :goto_1a1

    :cond_1a0
    move v10, v13

    :goto_1a1
    invoke-virtual {v5}, Lydn;->p()Lwdn;

    move-result-object v5

    iget-boolean v5, v5, Lwdn;->a:Z

    move v15, v9

    new-instance v9, La8d;

    if-eqz v10, :cond_1b7

    if-eqz v5, :cond_1b7

    if-nez v3, :cond_1b7

    if-nez v15, :cond_1b7

    const/4 v3, 0x3

    if-ge v4, v3, :cond_1b7

    const/4 v4, 0x1

    goto :goto_1b8

    :cond_1b7
    move v4, v13

    :goto_1b8
    invoke-direct {v9, v4}, La8d;-><init>(Z)V

    move-object v3, v11

    move-object v4, v12

    move-object v5, v14

    invoke-direct/range {v1 .. v9}, Lt9j;-><init>(ILg52;Ljgn;Lyc6;Ltj;Luyl;Lrxe;La8d;)V

    iget-object v0, v0, Ldaj;->s:Lode;

    invoke-virtual {v0, v1}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public final s()V
    .registers 1

    iget-object p0, p0, Lj93;->c:Ld8j;

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Lg8j;->h()V

    return-void
.end method
