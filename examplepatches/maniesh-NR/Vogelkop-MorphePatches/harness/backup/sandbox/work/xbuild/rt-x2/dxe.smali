.class public final Ldxe;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Lw6f;


# instance fields
.field public final a:Ldx3;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lnw3;

.field public final d:Lx5f;

.field public final e:Lb59;

.field public f:Z

.field public final g:Lyqd;

.field public final h:Lh7f;

.field public i:Z

.field public j:J

.field public k:J

.field public l:Z

.field public m:J

.field public n:Z


# direct methods
.method public constructor <init>(Ldx3;Lcom/opera/android/settings/SettingsManager;Lnw3;Lx5f;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lyqd;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Lyqd;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ldxe;->g:Lyqd;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ldxe;->h:Lh7f;

    iput-object p1, p0, Ldxe;->a:Ldx3;

    iput-object p2, p0, Ldxe;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Ldxe;->c:Lnw3;

    iput-object p4, p0, Ldxe;->d:Lx5f;

    sget-object p3, Lvml;->d:Lumi;

    const/4 p4, 0x0

    new-array p4, p4, [Lbg1;

    const-string v0, "night_mode_scheduler"

    invoke-static {p1, p3, v0, p4}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Ldxe;->e:Lb59;

    invoke-virtual {p2, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p0}, Ldxe;->U()V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lcxe;

    iget-object p0, p0, Ldxe;->h:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lcxe;

    iget-object p0, p0, Ldxe;->h:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "night_mode"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    const-string v0, "night_mode_schedule"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    const-string v0, "night_mode_schedule_start"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    const-string v0, "night_mode_schedule_end"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_21

    return-void

    :cond_21
    invoke-virtual {p0}, Ldxe;->U()V

    return-void
.end method

.method public final R(IIII)Ljava/lang/String;
    .registers 10

    iget-object v0, p0, Ldxe;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->s()I

    move-result v1

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    iget-object v2, p0, Ldxe;->a:Ldx3;

    if-eqz v1, :cond_69

    const/4 p1, 0x1

    if-eq v1, p1, :cond_64

    const/4 p1, 0x2

    if-eq v1, p1, :cond_23

    const/4 p1, 0x3

    if-eq v1, p1, :cond_1b

    const-wide/16 p1, 0x0

    move-wide v0, p1

    goto :goto_2f

    :cond_1b
    invoke-virtual {p0}, Ldxe;->S()V

    iget-wide p1, p0, Ldxe;->j:J

    iget-wide v0, p0, Ldxe;->k:J

    goto :goto_2f

    :cond_23
    const-string p1, "night_mode_schedule_start"

    invoke-virtual {v0, p1}, Lcom/opera/android/settings/SettingsManager;->q(Ljava/lang/String;)J

    move-result-wide p1

    const-string v1, "night_mode_schedule_end"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->q(Ljava/lang/String;)J

    move-result-wide v0

    :goto_2f
    invoke-static {v2}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v3

    const-string v4, "GMT"

    invoke-static {v4}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    iget-boolean p0, p0, Ldxe;->i:Z

    if-eqz p0, :cond_52

    new-instance p0, Ljava/util/Date;

    invoke-direct {p0, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p3, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_52
    new-instance p0, Ljava/util/Date;

    invoke-direct {p0, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p4, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_64
    invoke-virtual {v2, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_69
    invoke-virtual {v2, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final S()V
    .registers 7

    iget-wide v0, p0, Ldxe;->j:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_3d

    iget-wide v0, p0, Ldxe;->k:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_3d

    iget-object v0, p0, Ldxe;->e:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "sunset"

    const-wide/32 v4, 0x4b87f00

    invoke-interface {v0, v1, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Ldxe;->j:J

    const-string v1, "sunrise"

    const-wide/32 v4, 0x1b77400

    invoke-interface {v0, v1, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Ldxe;->k:J

    const-string v1, "last_sun_update"

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Ldxe;->m:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_3a

    const/4 v0, 0x1

    goto :goto_3b

    :cond_3a
    const/4 v0, 0x0

    :goto_3b
    iput-boolean v0, p0, Ldxe;->n:Z

    :cond_3d
    return-void
.end method

.method public final T(ZZ)V
    .registers 7

    iget-object v0, p0, Ldxe;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->s()I

    move-result v1

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v1, :cond_3d

    if-eq v1, v3, :cond_3d

    if-eq v1, v2, :cond_15

    const/4 v0, 0x3

    if-ne v1, v0, :cond_46

    :cond_15
    iget-object v0, p0, Ldxe;->e:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    if-eqz p1, :cond_25

    move p1, v3

    goto :goto_26

    :cond_25
    const/4 p1, -0x1

    :goto_26
    const-string v1, "force_value"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "force_timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-interface {p1, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Ldxe;->U()V

    goto :goto_46

    :cond_3d
    if-eqz p1, :cond_40

    move v2, v3

    :cond_40
    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->X(I)V

    invoke-virtual {p0}, Ldxe;->U()V

    :cond_46
    :goto_46
    if-eqz p2, :cond_63

    iget-object p0, p0, Ldxe;->d:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_63

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    invoke-static {p1, p2}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object p1

    iget-object p1, p1, Lhi0;->b:Lfi0;

    const/4 v0, 0x5

    const-wide/16 v1, 0x1

    invoke-virtual {p1, v0, v3, v1, v2}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    :cond_63
    return-void
.end method

.method public final U()V
    .registers 27

    move-object/from16 v0, p0

    iget-object v1, v0, Ldxe;->g:Lyqd;

    invoke-static {v1}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object v2, v0, Ldxe;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v2}, Lcom/opera/android/settings/SettingsManager;->s()I

    move-result v3

    invoke-static {v3}, Lvep;->A(I)I

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_27a

    const/4 v5, 0x0

    if-eq v3, v4, :cond_272

    const/16 v6, 0xb

    const/16 v7, 0xc

    const/4 v10, 0x2

    iget-object v11, v0, Ldxe;->e:Lb59;

    const-wide/16 v12, 0x0

    if-eq v3, v10, :cond_150

    const/4 v2, 0x3

    if-eq v3, v2, :cond_2a

    move v9, v5

    move-wide v2, v12

    move-wide v7, v2

    goto/16 :goto_162

    :cond_2a
    invoke-virtual {v0}, Ldxe;->S()V

    iget-boolean v3, v0, Ldxe;->f:Z

    if-eqz v3, :cond_146

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    iget-wide v8, v0, Ldxe;->m:J

    cmp-long v3, v8, v12

    if-lez v3, :cond_4f

    cmp-long v3, v8, v14

    if-gez v3, :cond_4f

    sub-long v8, v14, v8

    iget-boolean v3, v0, Ldxe;->n:Z

    if-eqz v3, :cond_48

    const-wide/16 v18, 0xbb8

    goto :goto_4b

    :cond_48
    const-wide/32 v18, 0x1499700

    :goto_4b
    cmp-long v3, v8, v18

    if-ltz v3, :cond_146

    :cond_4f
    iput-wide v14, v0, Ldxe;->m:J

    iput-boolean v4, v0, Ldxe;->l:Z

    iget-object v3, v0, Ldxe;->c:Lnw3;

    invoke-virtual {v3}, Lnw3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzv9;

    invoke-virtual {v3}, Lzv9;->a()Lyv9;

    move-result-object v3

    iget-wide v8, v3, Lyv9;->a:D

    new-instance v14, Lpad;

    iget-wide v12, v3, Lyv9;->b:D

    const/16 v3, 0x15

    invoke-direct {v14, v3, v5}, Lpad;-><init>(BZ)V

    new-instance v3, Ljava/math/BigDecimal;

    invoke-direct {v3, v8, v9}, Ljava/math/BigDecimal;-><init>(D)V

    iput-object v3, v14, Lpad;->b:Ljava/lang/Object;

    new-instance v3, Ljava/math/BigDecimal;

    invoke-direct {v3, v12, v13}, Ljava/math/BigDecimal;-><init>(D)V

    iput-object v3, v14, Lpad;->c:Ljava/lang/Object;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v3

    new-instance v12, Lmcj;

    invoke-direct {v12, v14, v3}, Lmcj;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    sget-object v13, Lxco;->b:Lxco;

    invoke-virtual {v12, v13, v3, v5}, Lmcj;->e(Lxco;Ljava/util/Calendar;Z)Ljava/math/BigDecimal;

    move-result-object v14

    invoke-static {v14, v3}, Lmcj;->i(Ljava/math/BigDecimal;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v3

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v14

    invoke-virtual {v12, v13, v14, v4}, Lmcj;->e(Lxco;Ljava/util/Calendar;Z)Ljava/math/BigDecimal;

    move-result-object v12

    invoke-static {v12, v14}, Lmcj;->i(Ljava/math/BigDecimal;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v12

    if-eqz v3, :cond_cd

    if-eqz v12, :cond_cd

    invoke-virtual {v3, v6}, Ljava/util/Calendar;->get(I)I

    move-result v2

    int-to-long v8, v2

    sget-object v2, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v8, v9}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    invoke-virtual {v3, v7}, Ljava/util/Calendar;->get(I)I

    move-result v3

    int-to-long v13, v3

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v13, v14}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v13

    add-long/2addr v13, v8

    invoke-virtual {v12, v6}, Ljava/util/Calendar;->get(I)I

    move-result v8

    int-to-long v8, v8

    invoke-virtual {v2, v8, v9}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    invoke-virtual {v12, v7}, Ljava/util/Calendar;->get(I)I

    move-result v2

    move-wide/from16 v20, v8

    int-to-long v7, v2

    invoke-virtual {v3, v7, v8}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    add-long v2, v2, v20

    goto :goto_f2

    :cond_cd
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/util/Calendar;->get(I)I

    move-result v7

    const/16 v13, 0x9

    const-wide/16 v14, -0x1

    const-wide/16 v20, 0x1

    const-wide/16 v22, 0x0

    if-gt v7, v13, :cond_ea

    invoke-virtual {v3, v10}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-le v3, v2, :cond_ea

    cmpl-double v2, v8, v22

    if-ltz v2, :cond_f0

    goto :goto_ee

    :cond_ea
    cmpl-double v2, v8, v22

    if-gez v2, :cond_f0

    :goto_ee
    move-wide/from16 v14, v20

    :cond_f0
    move-wide v13, v14

    move-wide v2, v13

    :goto_f2
    iput-boolean v5, v0, Ldxe;->n:Z

    iget-wide v7, v0, Ldxe;->j:J

    cmp-long v7, v7, v13

    const-string v8, "last_sun_update"

    if-nez v7, :cond_116

    iget-wide v9, v0, Ldxe;->k:J

    cmp-long v7, v9, v2

    if-nez v7, :cond_116

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    iget-wide v9, v0, Ldxe;->m:J

    invoke-interface {v2, v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_144

    :cond_116
    iput-wide v13, v0, Ldxe;->j:J

    iput-wide v2, v0, Ldxe;->k:J

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "sunset"

    iget-wide v9, v0, Ldxe;->j:J

    invoke-interface {v2, v3, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "sunrise"

    iget-wide v9, v0, Ldxe;->k:J

    invoke-interface {v2, v3, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    iget-wide v9, v0, Ldxe;->m:J

    invoke-interface {v2, v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-boolean v2, v0, Ldxe;->l:Z

    if-nez v2, :cond_144

    invoke-virtual {v0}, Ldxe;->U()V

    :cond_144
    :goto_144
    iput-boolean v5, v0, Ldxe;->l:Z

    :cond_146
    iget-wide v2, v0, Ldxe;->j:J

    iget-wide v7, v0, Ldxe;->k:J

    cmp-long v9, v2, v7

    if-nez v9, :cond_161

    move v9, v4

    goto :goto_162

    :cond_150
    const-string v3, "night_mode_schedule_start"

    invoke-virtual {v2, v3}, Lcom/opera/android/settings/SettingsManager;->q(Ljava/lang/String;)J

    move-result-wide v7

    const-string v3, "night_mode_schedule_end"

    invoke-virtual {v2, v3}, Lcom/opera/android/settings/SettingsManager;->q(Ljava/lang/String;)J

    move-result-wide v2

    move-wide/from16 v24, v7

    move-wide v7, v2

    move-wide/from16 v2, v24

    :cond_161
    move v9, v5

    :goto_162
    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/content/SharedPreferences;

    const-string v13, "force_value"

    invoke-interface {v10, v13, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v14

    const-string v15, "force_timestamp"

    move-object/from16 v21, v13

    const-wide/16 v12, 0x0

    invoke-interface {v10, v15, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v22

    if-eqz v9, :cond_195

    iget-wide v2, v0, Ldxe;->j:J

    cmp-long v2, v2, v12

    if-lez v2, :cond_182

    move v2, v4

    goto :goto_183

    :cond_182
    move v2, v5

    :goto_183
    xor-int/lit8 v3, v2, 0x1

    if-eqz v14, :cond_18e

    if-ne v14, v4, :cond_18b

    move v6, v4

    goto :goto_18c

    :cond_18b
    move v6, v5

    :goto_18c
    if-ne v6, v3, :cond_190

    :cond_18e
    move v2, v3

    move v4, v5

    :cond_190
    const-wide/32 v8, 0x1499700

    goto/16 :goto_21c

    :cond_195
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v9

    cmp-long v10, v2, v7

    if-eqz v10, :cond_26a

    const-wide/16 v18, 0x0

    cmp-long v12, v2, v18

    if-ltz v12, :cond_26a

    cmp-long v12, v7, v18

    if-ltz v12, :cond_26a

    invoke-virtual {v9}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v12

    invoke-virtual {v9, v6, v5}, Ljava/util/Calendar;->set(II)V

    const/16 v6, 0xc

    invoke-virtual {v9, v6, v5}, Ljava/util/Calendar;->set(II)V

    const/16 v6, 0xd

    invoke-virtual {v9, v6, v5}, Ljava/util/Calendar;->set(II)V

    const/16 v6, 0xe

    invoke-virtual {v9, v6, v5}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v9}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v15

    const/4 v6, 0x6

    invoke-virtual {v9, v6, v4}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {v9}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v17

    sub-long v17, v17, v15

    sub-long v15, v12, v15

    cmp-long v6, v15, v2

    if-lez v10, :cond_1ec

    if-ltz v6, :cond_1d9

    sub-long v17, v17, v15

    add-long v17, v17, v7

    :goto_1d7
    move v6, v4

    goto :goto_1e3

    :cond_1d9
    cmp-long v6, v15, v7

    if-gez v6, :cond_1e0

    sub-long v17, v7, v15

    goto :goto_1d7

    :cond_1e0
    sub-long v17, v2, v15

    move v6, v5

    :goto_1e3
    const-wide/32 v9, 0x5265c00

    sub-long/2addr v9, v2

    add-long/2addr v9, v7

    move-wide v2, v9

    move-wide/from16 v8, v17

    goto :goto_202

    :cond_1ec
    if-ltz v6, :cond_1fc

    cmp-long v6, v15, v7

    if-gez v6, :cond_1f6

    sub-long v9, v7, v15

    move v6, v4

    goto :goto_1ff

    :cond_1f6
    sub-long v17, v17, v15

    add-long v9, v17, v2

    :goto_1fa
    move v6, v5

    goto :goto_1ff

    :cond_1fc
    sub-long v9, v2, v15

    goto :goto_1fa

    :goto_1ff
    sub-long v2, v7, v2

    move-wide v8, v9

    :goto_202
    if-eqz v14, :cond_20c

    sub-long v12, v12, v22

    cmp-long v2, v12, v2

    if-ltz v2, :cond_20c

    move v2, v5

    goto :goto_20d

    :cond_20c
    move v2, v14

    :goto_20d
    if-eqz v2, :cond_216

    if-ne v2, v4, :cond_213

    move v2, v4

    goto :goto_214

    :cond_213
    move v2, v5

    :goto_214
    if-ne v2, v6, :cond_219

    :cond_216
    move v4, v5

    :goto_217
    move v2, v6

    goto :goto_21c

    :cond_219
    xor-int/lit8 v6, v6, 0x1

    goto :goto_217

    :goto_21c
    iput-boolean v2, v0, Ldxe;->i:Z

    if-eqz v14, :cond_22d

    if-nez v4, :cond_22d

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    move-object/from16 v3, v21

    invoke-static {v2, v3}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    :cond_22d
    iget-boolean v2, v0, Ldxe;->f:Z

    iget-object v3, v0, Ldxe;->h:Lh7f;

    if-nez v2, :cond_247

    invoke-static {v3, v3}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_237
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_269

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcxe;

    invoke-interface {v1}, Lcxe;->B()V

    goto :goto_237

    :cond_247
    sget-object v2, Lowe;->c:Lowe;

    iget-boolean v0, v0, Ldxe;->i:Z

    invoke-virtual {v2, v0}, Lowe;->c(Z)V

    invoke-static {v1, v8, v9}, Lvml;->d(Ljava/lang/Runnable;J)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lg7f;

    invoke-direct {v0, v3}, Lg7f;-><init>(Lh7f;)V

    :goto_259
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_269

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcxe;

    invoke-interface {v1}, Lcxe;->B()V

    goto :goto_259

    :cond_269
    return-void

    :cond_26a
    iput-boolean v4, v0, Ldxe;->i:Z

    sget-object v0, Lowe;->c:Lowe;

    invoke-virtual {v0, v4}, Lowe;->c(Z)V

    return-void

    :cond_272
    iput-boolean v5, v0, Ldxe;->i:Z

    sget-object v0, Lowe;->c:Lowe;

    invoke-virtual {v0, v5}, Lowe;->c(Z)V

    return-void

    :cond_27a
    iput-boolean v4, v0, Ldxe;->i:Z

    sget-object v0, Lowe;->c:Lowe;

    invoke-virtual {v0, v4}, Lowe;->c(Z)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Ldxe;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 2

    const/4 p1, 0x0

    iput-boolean p1, p0, Ldxe;->f:Z

    invoke-virtual {p0}, Ldxe;->U()V

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, Ldxe;->f:Z

    invoke-virtual {p0}, Ldxe;->U()V

    return-void
.end method
