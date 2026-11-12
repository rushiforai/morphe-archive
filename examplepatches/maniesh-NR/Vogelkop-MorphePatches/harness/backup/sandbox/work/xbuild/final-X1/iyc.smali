.class public final Liyc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field public final a:Lumi;

.field public final b:Lox3;

.field public final c:Lox3;

.field public final d:Lcom/opera/android/settings/SettingsManager;

.field public final e:Lb59;

.field public f:Loml;

.field public final g:Ls9;

.field public h:I


# direct methods
.method public constructor <init>(Lcom/opera/android/OperaApplication;Lumi;Lox3;Lox3;Lcom/opera/android/settings/SettingsManager;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ls9;

    const/16 v1, 0x15

    invoke-direct {v0, p0, v1}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Liyc;->g:Ls9;

    iput-object p2, p0, Liyc;->a:Lumi;

    iput-object p3, p0, Liyc;->b:Lox3;

    iput-object p4, p0, Liyc;->c:Lox3;

    iput-object p5, p0, Liyc;->d:Lcom/opera/android/settings/SettingsManager;

    const/4 p3, 0x0

    new-array p3, p3, [Lbg1;

    const-string p4, "location_tracker"

    invoke-static {p1, p2, p4, p3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Liyc;->e:Lb59;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 12

    iget v0, p0, Liyc;->h:I

    if-nez v0, :cond_5

    return-void

    :cond_5
    const-string v0, "process_location"

    iget-object v1, p0, Liyc;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5f

    const-string v0, "eula_accepted.gdpr"

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5f

    iget-object v0, p0, Liyc;->e:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "behavior_last_report"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    cmp-long v2, v0, v2

    if-nez v2, :cond_2f

    invoke-virtual {p0}, Liyc;->b()V

    return-void

    :cond_2f
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const-wide/32 v2, 0x5265c00

    cmp-long v4, v0, v2

    if-ltz v4, :cond_43

    invoke-virtual {p0}, Liyc;->b()V

    return-void

    :cond_43
    sub-long v7, v2, v0

    new-instance v0, Lhyc;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lhyc;-><init>(Liyc;B)V

    iget-object v1, p0, Liyc;->a:Lumi;

    invoke-interface {v1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v5, Loml;

    invoke-direct {v5, v0}, Loml;-><init>(Lnml;)V

    iput-object v5, p0, Liyc;->f:Loml;

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v10, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v5 .. v10}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_5f
    return-void
.end method

.method public final b()V
    .registers 12

    const/4 v0, 0x0

    iput-object v0, p0, Liyc;->f:Loml;

    const-string v0, "process_location"

    iget-object v1, p0, Liyc;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_85

    const-string v0, "eula_accepted.gdpr"

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_85

    iget-object v0, p0, Liyc;->c:Lox3;

    invoke-virtual {v0}, Lox3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzv9;

    invoke-virtual {v0}, Lzv9;->a()Lyv9;

    move-result-object v0

    iget-wide v1, v0, Lyv9;->c:J

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    iget-object v4, p0, Liyc;->b:Lox3;

    const-wide/32 v7, 0x5265c00

    if-lez v3, :cond_4a

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v1

    cmp-long v1, v5, v7

    if-gez v1, :cond_4a

    invoke-virtual {v4}, Lox3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Losf;

    iget-wide v2, v0, Lyv9;->a:D

    iget-wide v4, v0, Lyv9;->b:D

    new-instance v0, Lnsf;

    invoke-direct {v0, v2, v3, v4, v5}, Lnsf;-><init>(DD)V

    invoke-virtual {v1, v0}, Losf;->a(Lkotlin/jvm/functions/Function1;)V

    goto :goto_5a

    :cond_4a
    invoke-virtual {v4}, Lox3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Losf;

    new-instance v1, Lw5f;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Lw5f;-><init>(B)V

    invoke-virtual {v0, v1}, Losf;->a(Lkotlin/jvm/functions/Function1;)V

    :goto_5a
    iget-object v0, p0, Liyc;->e:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "behavior_last_report"

    invoke-static {v0, v1}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    new-instance v0, Lhyc;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lhyc;-><init>(Liyc;B)V

    iget-object v1, p0, Liyc;->a:Lumi;

    invoke-interface {v1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v5, Loml;

    invoke-direct {v5, v0}, Loml;-><init>(Lnml;)V

    iput-object v5, p0, Liyc;->f:Loml;

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v10, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v5 .. v10}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_85
    return-void
.end method

.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .registers 3

    iget p1, p0, Liyc;->h:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Liyc;->h:I

    if-nez p1, :cond_1a

    iget-object p1, p0, Liyc;->f:Loml;

    if-eqz p1, :cond_13

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Loml;->cancel(Z)Z

    const/4 p1, 0x0

    iput-object p1, p0, Liyc;->f:Loml;

    :cond_13
    iget-object p1, p0, Liyc;->d:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Liyc;->g:Ls9;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    :cond_1a
    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .registers 3

    iget p1, p0, Liyc;->h:I

    const/4 v0, 0x1

    add-int/2addr p1, v0

    iput p1, p0, Liyc;->h:I

    if-ne p1, v0, :cond_1a

    iget-object p1, p0, Liyc;->d:Lcom/opera/android/settings/SettingsManager;

    iget-object v0, p0, Liyc;->g:Ls9;

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    new-instance p1, La00;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, La00;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Liyc;->e:Lb59;

    invoke-virtual {p0, p1}, Lcom/opera/android/Lazy;->a(Lbg1;)V

    :cond_1a
    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method
