.class public final Lr4m;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final a:Ll8l;

.field public final b:Ly4m;

.field public final c:Lb0c;

.field public final d:Lh5m;

.field public final e:Ltjm;

.field public final f:Lk6l;

.field public final g:Lv3m;

.field public final h:Lcbl;

.field public final i:Lode;

.field public final j:Lkze;

.field public k:B

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Lk6l;Lcom/opera/android/settings/SettingsManager;Lv3m;Lcbl;Lcbl;Lghf;I)V
    .registers 19

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lode;

    invoke-direct {v0}, Lekc;-><init>()V

    iput-object v0, p0, Lr4m;->i:Lode;

    new-instance v0, Lkze;

    const-string v1, ""

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lr4m;->j:Lkze;

    const/4 v6, 0x0

    iput-byte v6, p0, Lr4m;->k:B

    iput-object p3, p0, Lr4m;->f:Lk6l;

    iput-object p5, p0, Lr4m;->g:Lv3m;

    iput-object p6, p0, Lr4m;->h:Lcbl;

    new-instance v0, Ll8l;

    new-instance v1, Lo4m;

    const/4 v7, 0x6

    invoke-direct {v1, p0, v7}, Lo4m;-><init>(Lr4m;B)V

    const/16 v2, 0x18

    invoke-direct {v0, v1, v2}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lr4m;->a:Ll8l;

    new-instance v0, Ly4m;

    new-instance v1, Lo4m;

    invoke-direct {v1, p0, v7}, Lo4m;-><init>(Lr4m;B)V

    move-object v5, p0

    move-object v2, p1

    move-object v3, p5

    move-object/from16 v4, p8

    invoke-direct/range {v0 .. v5}, Ly4m;-><init>(Lo4m;Lcom/opera/android/BrowserActivity;Lv3m;Lghf;Lr4m;)V

    iput-object v0, p0, Lr4m;->b:Ly4m;

    new-instance p1, Lb0c;

    new-instance v1, Lo4m;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v2}, Lo4m;-><init>(Lr4m;B)V

    invoke-direct {p1, v1, p5}, Lb0c;-><init>(Lo4m;Lv3m;)V

    iput-object p1, p0, Lr4m;->c:Lb0c;

    new-instance p1, Lh5m;

    new-instance v1, Lo4m;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v2}, Lo4m;-><init>(Lr4m;B)V

    move-object/from16 v4, p7

    move-object/from16 v8, p8

    invoke-direct {p1, p5, v8, v4, v1}, Lh5m;-><init>(Lv3m;Lghf;Lcbl;Lo4m;)V

    iput-object p1, p0, Lr4m;->d:Lh5m;

    new-instance v1, Ltjm;

    new-instance v4, Lo4m;

    invoke-direct {v4, p0, v7}, Lo4m;-><init>(Lr4m;B)V

    move/from16 v7, p9

    invoke-direct {v1, v4, p5, p3, v7}, Ltjm;-><init>(Lo4m;Lv3m;Lk6l;I)V

    iput-object v1, p0, Lr4m;->e:Ltjm;

    iget-object p3, p3, Lk6l;->w:Lxg;

    new-instance v1, Lp7l;

    const/16 v4, 0x16

    invoke-direct {v1, p0, v4}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p2}, Lndc;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-static {p3, v4, p0, v1}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance p3, Lezg;

    const/16 v1, 0x9

    invoke-direct {p3, p0, v1}, Lezg;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lvme;

    const/16 v4, 0x13

    invoke-direct {v1, v4}, Lvme;-><init>(B)V

    invoke-static {p4, p2, p3, v1}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object p3, p5, Lv3m;->d:Lplk;

    iget-object p4, p3, Lplk;->c:Ljava/lang/Object;

    check-cast p4, Lode;

    iget-object p3, p3, Lplk;->d:Ljava/lang/Object;

    check-cast p3, Lode;

    new-instance v1, Lw4m;

    invoke-direct {v1, v0, v6}, Lw4m;-><init>(Ly4m;B)V

    invoke-virtual {p4, p2, v1}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p4, Lw4m;

    const/4 v1, 0x1

    invoke-direct {p4, v0, v1}, Lw4m;-><init>(Ly4m;B)V

    invoke-virtual {p3, p2, p4}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p2, Lg9l;

    invoke-direct {p2, p0, v2}, Lg9l;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lh5m;->h:Lkze;

    invoke-virtual {p0, p2}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final W()Lszb;
    .registers 2

    iget-object p0, p0, Lr4m;->c:Lb0c;

    iget-object v0, p0, Lb0c;->f:Lszb;

    if-eqz v0, :cond_7

    return-object v0

    :cond_7
    iget-object p0, p0, Lb0c;->e:Lszb;

    return-object p0
.end method

.method public final X(Lb2l;I)Z
    .registers 7

    iget-object v0, p0, Lr4m;->e:Ltjm;

    iget-object v0, v0, Ltjm;->c:Lv3m;

    invoke-static {v0, p1}, Ltjm;->I0(Lv3m;Lb2l;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_4b

    invoke-virtual {p0}, Lr4m;->W()Lszb;

    move-result-object p1

    if-eqz p1, :cond_4b

    iget-object v1, p0, Lr4m;->d:Lh5m;

    iget-object v1, v1, Lh5m;->h:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld5m;

    invoke-virtual {v1}, Ld5m;->b()Z

    move-result v1

    if-nez v1, :cond_4b

    iget-object v1, p0, Lr4m;->a:Ll8l;

    iget-object v1, v1, Ll8l;->d:Ljava/lang/String;

    const/4 v2, 0x1

    if-eq p2, v2, :cond_52

    const/4 v3, 0x2

    iget-object p0, p0, Lr4m;->b:Ly4m;

    if-eq p2, v3, :cond_4c

    iget-object p2, p0, Ly4m;->d:Lv3m;

    iget-object p2, p2, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p2}, Lcom/opera/android/settings/SettingsManager;->E()Lz4m;

    move-result-object p2

    iget-boolean p2, p2, Lz4m;->a:Z

    if-eqz p2, :cond_4b

    iget-boolean p2, p0, Ly4m;->j:Z

    if-eqz p2, :cond_4b

    invoke-virtual {p0, v1}, Ly4m;->H0(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_4b

    iget-object p0, p0, Ly4m;->d:Lv3m;

    invoke-virtual {p0, p1, v0}, Lv3m;->e(Lszb;I)Z

    move-result p0

    if-nez p0, :cond_52

    :cond_4b
    return v0

    :cond_4c
    invoke-virtual {p0, p1, v1}, Ly4m;->I0(Lszb;Ljava/lang/String;)Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    :cond_52
    return v2
.end method

.method public final Y(Lb2l;I)V
    .registers 8

    iget-object v0, p0, Lr4m;->e:Ltjm;

    iget-object v1, v0, Ltjm;->c:Lv3m;

    invoke-static {v1, p1}, Ltjm;->I0(Lv3m;Lb2l;)Z

    move-result p1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_66

    invoke-virtual {v0}, Ltjm;->H0()Z

    move-result p1

    if-nez p1, :cond_65

    invoke-virtual {p0}, Lr4m;->W()Lszb;

    move-result-object p1

    iget-object v3, p0, Lr4m;->a:Ll8l;

    iget-object v3, v3, Ll8l;->d:Ljava/lang/String;

    if-eq p2, v2, :cond_65

    const/4 v4, 0x2

    iget-object p0, p0, Lr4m;->b:Ly4m;

    if-eq p2, v4, :cond_5e

    iget-object p2, p0, Ly4m;->d:Lv3m;

    iget-object v4, p2, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4}, Lcom/opera/android/settings/SettingsManager;->E()Lz4m;

    move-result-object v4

    iget-boolean v4, v4, Lz4m;->a:Z

    if-eqz v4, :cond_66

    iget-boolean v4, p0, Ly4m;->j:Z

    if-eqz v4, :cond_66

    if-eqz p1, :cond_66

    iget-object v4, p0, Ly4m;->i:Lszb;

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_66

    invoke-virtual {p0, p1, v3}, Ly4m;->I0(Lszb;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_66

    iget-object p2, p2, Lv3m;->a:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lybh;->h(Landroid/content/Context;)Lszb;

    move-result-object p2

    if-nez p2, :cond_4f

    move p0, v1

    goto :goto_55

    :cond_4f
    iget-object p0, p0, Ly4m;->d:Lv3m;

    invoke-virtual {p0, p2, v1}, Lv3m;->e(Lszb;I)Z

    move-result p0

    :goto_55
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_65

    if-nez p0, :cond_65

    goto :goto_66

    :cond_5e
    invoke-virtual {p0, p1, v3}, Ly4m;->I0(Lszb;Ljava/lang/String;)Z

    move-result p0

    xor-int/lit8 v1, p0, 0x1

    goto :goto_66

    :cond_65
    move v1, v2

    :cond_66
    :goto_66
    if-eqz v1, :cond_6b

    invoke-virtual {v0, v2}, Ltjm;->J0(Z)V

    :cond_6b
    return-void
.end method

.method public final Z(Lb2l;I)V
    .registers 5

    iget-object v0, p0, Lr4m;->f:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v0, p2}, Lr4m;->Y(Lb2l;I)V

    iget-object v0, p0, Lr4m;->e:Ltjm;

    invoke-virtual {v0}, Ltjm;->H0()Z

    move-result v0

    if-eqz v0, :cond_49

    invoke-virtual {p0, p1, p2}, Lr4m;->X(Lb2l;I)Z

    move-result p1

    if-nez p1, :cond_4a

    const/4 p1, 0x1

    if-ne p2, p1, :cond_49

    iget-object p1, p0, Lr4m;->c:Lb0c;

    iget-byte p1, p1, Lb0c;->d:B

    const/4 p2, 0x2

    if-ne p1, p2, :cond_49

    iget-object p1, p0, Lr4m;->d:Lh5m;

    iget-object p1, p1, Lh5m;->f:Lvz5;

    const/4 p2, 0x0

    if-eqz p1, :cond_2b

    iget-object p1, p1, Lvz5;->i:Ljava/lang/Object;

    check-cast p1, Ld7h;

    goto :goto_2c

    :cond_2b
    move-object p1, p2

    :goto_2c
    if-eqz p1, :cond_49

    iget-object p0, p0, Lr4m;->b:Ly4m;

    iget-object v0, p0, Ly4m;->d:Lv3m;

    iget-object v1, p0, Ly4m;->i:Lszb;

    if-nez v1, :cond_41

    invoke-virtual {v0}, Lv3m;->d()Lszb;

    move-result-object v1

    iput-object v1, p0, Ly4m;->i:Lszb;

    invoke-virtual {v0, v1}, Lv3m;->i(Lszb;)V

    iget-object v1, p0, Ly4m;->i:Lszb;

    :cond_41
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lps0;->c:Lps0;

    invoke-virtual {p1, p2, v1, p0}, Ld7h;->d(Lszb;Lszb;Lps0;)V

    :cond_49
    return-void

    :cond_4a
    new-instance p1, Lo4m;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lo4m;-><init>(Lr4m;B)V

    invoke-virtual {p0, p1}, Lr4m;->c0(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final a0()V
    .registers 2

    iget-object v0, p0, Lr4m;->g:Lv3m;

    iget-object v0, v0, Lv3m;->a:Landroid/content/Context;

    invoke-static {v0}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object p0, p0, Lr4m;->h:Lcbl;

    invoke-virtual {p0}, Lcbl;->run()V

    return-void
.end method

.method public final b(Lb2l;Lyqa;)V
    .registers 5

    new-instance v0, Lh4m;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, p1, v1}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lr4m;->c0(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final b0()V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lr4m;->k:B

    iput-boolean v0, p0, Lr4m;->o:Z

    new-instance v0, Lo4m;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lo4m;-><init>(Lr4m;B)V

    invoke-virtual {p0, v0}, Lr4m;->c0(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c0(Ljava/lang/Runnable;)V
    .registers 3

    iget-boolean v0, p0, Lr4m;->m:Z

    if-eqz v0, :cond_8

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_8
    const/4 v0, 0x1

    iput-boolean v0, p0, Lr4m;->m:Z

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lr4m;->m:Z

    iget-boolean v0, p0, Lr4m;->n:Z

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Lr4m;->f0()V

    iput-boolean p1, p0, Lr4m;->n:Z

    :cond_1a
    return-void
.end method

.method public final d0(Lb2l;)V
    .registers 6

    iget-object v0, p0, Lr4m;->c:Lb0c;

    iget-object v0, v0, Lb0c;->e:Lszb;

    if-nez v0, :cond_18

    iget-object v0, p0, Lr4m;->g:Lv3m;

    iget-object v1, v0, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->shouldDetectLanguageAutomatically()Z

    move-result v1

    if-nez v1, :cond_1c

    iget-object v1, p0, Lr4m;->e:Ltjm;

    invoke-virtual {v1}, Ltjm;->H0()Z

    move-result v1

    if-nez v1, :cond_1c

    :cond_18
    invoke-virtual {p0}, Lr4m;->a0()V

    return-void

    :cond_1c
    move-object v1, p1

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->isLoading()Z

    move-result v1

    if-eqz v1, :cond_30

    iget-object v0, v0, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->shouldDetectLanguageAutomatically()Z

    move-result v0

    if-eqz v0, :cond_30

    return-void

    :cond_30
    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_3f

    const/4 p1, 0x1

    iput-boolean p1, p0, Lr4m;->o:Z

    return-void

    :cond_3f
    invoke-static {p1}, Luy3;->H(Lb2l;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object v0

    if-nez v0, :cond_4a

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lr4m;->b(Lb2l;Lyqa;)V

    return-void

    :cond_4a
    iget-object v1, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->Q:Lyqa;

    if-eqz v1, :cond_64

    iget-object v2, v1, Lyqa;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_64

    const-string v3, "und"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_64

    invoke-virtual {p0, p1, v1}, Lr4m;->b(Lb2l;Lyqa;)V

    return-void

    :cond_64
    iget-wide p0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {p0, p1}, LJ/N;->MokdJxHC(J)V

    return-void
.end method

.method public final e0(Ld5m;)V
    .registers 18

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lr4m;->m:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_a

    iput-boolean v2, v0, Lr4m;->n:Z

    return-void

    :cond_a
    iget-object v1, v0, Lr4m;->e:Ltjm;

    invoke-virtual {v1}, Ltjm;->H0()Z

    move-result v12

    new-instance v3, Ln4m;

    iget-object v4, v0, Lr4m;->a:Ll8l;

    iget-object v4, v4, Ll8l;->d:Ljava/lang/String;

    iget-object v5, v0, Lr4m;->b:Ly4m;

    iget-object v6, v5, Ly4m;->g:Ljava/util/Set;

    invoke-static {v6}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v6

    iget-object v7, v5, Ly4m;->h:Ljava/util/Set;

    invoke-static {v7}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v7

    move-object v8, v6

    move-object v6, v7

    iget-boolean v7, v5, Ly4m;->j:Z

    iget-object v9, v5, Ly4m;->d:Lv3m;

    iget-object v10, v5, Ly4m;->i:Lszb;

    if-eqz v12, :cond_3b

    if-nez v10, :cond_3b

    invoke-virtual {v9}, Lv3m;->d()Lszb;

    move-result-object v10

    iput-object v10, v5, Ly4m;->i:Lszb;

    invoke-virtual {v9, v10}, Lv3m;->i(Lszb;)V

    iget-object v10, v5, Ly4m;->i:Lszb;

    :cond_3b
    iget-object v9, v0, Lr4m;->c:Lb0c;

    iget-byte v11, v9, Lb0c;->d:B

    move-object v13, v8

    move-object v8, v10

    invoke-virtual {v0}, Lr4m;->W()Lszb;

    move-result-object v10

    iget-object v14, v0, Lr4m;->g:Lv3m;

    iget-object v15, v14, Lv3m;->a:Landroid/content/Context;

    invoke-static {v15}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v15

    const/4 v2, 0x0

    if-eqz v15, :cond_6e

    iget-byte v9, v9, Lb0c;->d:B

    const/4 v15, 0x2

    if-ne v9, v15, :cond_6e

    iget-object v5, v5, Ly4m;->c:Lcom/opera/android/BrowserActivity;

    invoke-static {v5}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v5

    iget-object v5, v5, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v9, "translate_web_pages.tap_to_select_language_hint.shown"

    invoke-interface {v5, v9, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_6e

    invoke-virtual {v1}, Ltjm;->H0()Z

    move-result v1

    if-eqz v1, :cond_6e

    move-object v5, v13

    const/4 v13, 0x1

    goto :goto_70

    :cond_6e
    move-object v5, v13

    move v13, v2

    :goto_70
    iget-object v1, v14, Lv3m;->a:Landroid/content/Context;

    invoke-static {v1}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_81

    iget-boolean v1, v0, Lr4m;->l:Z

    if-eqz v1, :cond_81

    const/4 v14, 0x1

    :goto_7d
    move v9, v11

    move-object/from16 v11, p1

    goto :goto_83

    :cond_81
    move v14, v2

    goto :goto_7d

    :goto_83
    invoke-direct/range {v3 .. v14}, Ln4m;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;ZLszb;ILszb;Ld5m;ZZZ)V

    iget-object v1, v0, Lr4m;->i:Lode;

    invoke-virtual {v1, v3}, Lekc;->r(Ljava/lang/Object;)V

    iput-boolean v2, v0, Lr4m;->l:Z

    return-void
.end method

.method public final f0()V
    .registers 2

    iget-object v0, p0, Lr4m;->d:Lh5m;

    iget-object v0, v0, Lh5m;->h:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld5m;

    invoke-virtual {p0, v0}, Lr4m;->e0(Ld5m;)V

    return-void
.end method

.method public final j(Lb2l;)V
    .registers 6

    iget-boolean v0, p0, Lr4m;->o:Z

    if-eqz v0, :cond_31

    invoke-static {p1}, Luy3;->H(Lb2l;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object v0

    if-nez v0, :cond_f

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lr4m;->b(Lb2l;Lyqa;)V

    goto :goto_2e

    :cond_f
    iget-object v1, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->Q:Lyqa;

    if-eqz v1, :cond_29

    iget-object v2, v1, Lyqa;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_29

    const-string v3, "und"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_29

    invoke-virtual {p0, p1, v1}, Lr4m;->b(Lb2l;Lyqa;)V

    goto :goto_2e

    :cond_29
    iget-wide v0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {v0, v1}, LJ/N;->MokdJxHC(J)V

    :goto_2e
    const/4 p1, 0x0

    iput-boolean p1, p0, Lr4m;->o:Z

    :cond_31
    return-void
.end method
