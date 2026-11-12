.class public final Lsjh;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static q:Z


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lk6l;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Lorm;

.field public final e:Lskm;

.field public final f:Lqjh;

.field public final g:Lcq5;

.field public final h:Lxi5;

.field public final i:Loji;

.field public final j:Lrjh;

.field public final k:J

.field public l:I

.field public m:Lmcj;

.field public n:Lcom/google/android/gms/tasks/Task;

.field public o:J

.field public p:J


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lk6l;Lcom/opera/android/settings/SettingsManager;Lorm;Lskm;Lqjh;Lcq5;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsjh;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lsjh;->b:Lk6l;

    iput-object p3, p0, Lsjh;->c:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lsjh;->d:Lorm;

    iput-object p5, p0, Lsjh;->e:Lskm;

    iput-object p6, p0, Lsjh;->f:Lqjh;

    iput-object p7, p0, Lsjh;->g:Lcq5;

    invoke-static {p1}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object p3

    iput-object p3, p0, Lsjh;->h:Lxi5;

    invoke-static {p1}, Loji;->y(Landroid/content/Context;)Loji;

    move-result-object p4

    iput-object p4, p0, Lsjh;->i:Loji;

    new-instance p4, Lrjh;

    invoke-direct {p4, p0}, Lrjh;-><init>(Lsjh;)V

    iput-object p4, p0, Lsjh;->j:Lrjh;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p5

    const-wide/16 p6, 0x0

    invoke-static {p1, p5, p6, p7}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object p1

    iget-wide p5, p1, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    iput-wide p5, p0, Lsjh;->k:J

    iget-object p0, p3, Lxi5;->i:Lh7f;

    invoke-virtual {p0, p4}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p2, p4}, Lk6l;->b(La2l;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 10

    iget-object v0, p0, Lsjh;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->e:Lqcc;

    invoke-virtual {v1, v2}, Lqcc;->d(Lqcc;)Z

    move-result v1

    if-eqz v1, :cond_ed

    iget v1, p0, Lsjh;->l:I

    const/4 v2, 0x3

    if-lt v1, v2, :cond_81

    invoke-static {v0}, Ltjh;->a(Landroid/content/Context;)Ltjh;

    move-result-object v1

    iget-object v1, v1, Ltjh;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "rated"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_81

    iget-object v1, p0, Lsjh;->i:Loji;

    iget-object v1, v1, Loji;->a:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "TOTAL_PAGE_LOADS"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    int-to-long v1, v1

    const-wide/16 v3, 0x4b

    cmp-long v1, v1, v3

    if-ltz v1, :cond_81

    iget-object v1, p0, Lsjh;->h:Lxi5;

    invoke-virtual {v1}, Lxi5;->b()J

    move-result-wide v1

    const-wide/16 v3, 0xa

    cmp-long v1, v1, v3

    if-ltz v1, :cond_81

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lsjh;->k:J

    sub-long/2addr v1, v3

    invoke-static {v0}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v3

    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcj9;

    iget-object v3, v3, Lcj9;->b:Ljava/lang/String;

    const-string v4, "us"

    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_70

    const-wide/32 v3, 0x14997000

    goto :goto_73

    :cond_70
    const-wide/32 v3, 0x44aa200

    :goto_73
    cmp-long v1, v1, v3

    if-ltz v1, :cond_81

    iget-object v1, p0, Lsjh;->c:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "feedback_in_app_notification"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_85

    :cond_81
    sget-boolean v1, Lsjh;->q:Z

    if-eqz v1, :cond_ed

    :cond_85
    iget-object v1, p0, Lsjh;->n:Lcom/google/android/gms/tasks/Task;

    const/4 v2, 0x0

    if-nez v1, :cond_b7

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lsjh;->o:J

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_97

    move-object v0, v1

    :cond_97
    new-instance v1, Lmcj;

    new-instance v3, Lctp;

    invoke-direct {v3, v0}, Lctp;-><init>(Landroid/content/Context;)V

    invoke-direct {v1, v3}, Lmcj;-><init>(Lctp;)V

    iput-object v1, p0, Lsjh;->m:Lmcj;

    invoke-virtual {v1}, Lmcj;->k()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    if-eqz v0, :cond_b4

    new-instance v1, Lr9g;

    const/16 v2, 0xe

    invoke-direct {v1, p0, v2}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    :cond_b4
    iput-object v2, p0, Lsjh;->n:Lcom/google/android/gms/tasks/Task;

    return-void

    :cond_b7
    invoke-virtual {v1}, Lcom/google/android/gms/tasks/Task;->isComplete()Z

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_cb

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lsjh;->o:J

    const-wide/16 v7, 0x2710

    add-long/2addr v5, v7

    cmp-long v0, v3, v5

    if-ltz v0, :cond_ed

    :cond_cb
    iget-object v0, p0, Lsjh;->n:Lcom/google/android/gms/tasks/Task;

    if-eqz v0, :cond_ea

    invoke-virtual {v0}, Lcom/google/android/gms/tasks/Task;->isComplete()Z

    move-result v0

    if-ne v0, v1, :cond_ea

    iget-object v0, p0, Lsjh;->n:Lcom/google/android/gms/tasks/Task;

    if-eqz v0, :cond_ea

    invoke-virtual {v0}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-ne v0, v1, :cond_ea

    iget-object v0, p0, Lsjh;->n:Lcom/google/android/gms/tasks/Task;

    if-eqz v0, :cond_ea

    invoke-virtual {v0}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lz1i;

    :cond_ea
    invoke-virtual {p0, v2}, Lsjh;->b(Lz1i;)V

    :cond_ed
    return-void
.end method

.method public final b(Lz1i;)V
    .registers 14

    iget-wide v0, p0, Lsjh;->o:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_a

    const/4 v0, 0x0

    goto :goto_1c

    :cond_a
    iget-wide v4, p0, Lsjh;->p:J

    cmp-long v2, v4, v2

    if-nez v2, :cond_17

    const-wide/16 v0, -0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_1c

    :cond_17
    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :goto_1c
    const/4 v1, 0x0

    sput-boolean v1, Lsjh;->q:Z

    iget-object v2, p0, Lsjh;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {v2}, Ltjh;->a(Landroid/content/Context;)Ltjh;

    move-result-object v3

    iget-object v3, v3, Ltjh;->a:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "rated"

    const/4 v5, 0x1

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {v2}, Ltjh;->a(Landroid/content/Context;)Ltjh;

    move-result-object v2

    iget-object v2, v2, Ltjh;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "lastShown"

    invoke-static {v2, v3}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    iget-object v7, p0, Lsjh;->m:Lmcj;

    iget-object v2, p0, Lsjh;->g:Lcq5;

    invoke-virtual {v2}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lf8f;

    invoke-virtual {v2}, Lf8f;->o()Z

    move-result v2

    iget-object v3, p0, Lsjh;->h:Lxi5;

    const v4, 0x7f1401b7

    const v5, 0x7f140d86

    if-eqz v2, :cond_83

    new-instance v2, Ls9i;

    new-instance v6, Lrxh;

    invoke-direct {v6, v4}, Lrxh;-><init>(I)V

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v4

    new-instance v6, Lsxh;

    invoke-direct {v6, v5, v4}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    new-instance v4, Lqxh;

    const-string v5, ""

    invoke-direct {v4, v5}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-direct {v2, v6, v4}, Ls9i;-><init>(Lpxh;Lpxh;)V

    goto :goto_b7

    :cond_83
    invoke-virtual {v3}, Lxi5;->b()J

    move-result-wide v8

    const-wide/32 v10, 0x7fffffff

    cmp-long v2, v8, v10

    if-lez v2, :cond_92

    const v2, 0x7fffffff

    goto :goto_93

    :cond_92
    long-to-int v2, v8

    :goto_93
    new-instance v6, Ls9i;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    new-instance v9, Ltxh;

    const v10, 0x7f12005a

    invoke-direct {v9, v8, v10, v2}, Ltxh;-><init>([Ljava/lang/Object;II)V

    new-instance v2, Lrxh;

    invoke-direct {v2, v4}, Lrxh;-><init>(I)V

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    new-instance v4, Lsxh;

    invoke-direct {v4, v5, v2}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    invoke-direct {v6, v9, v4}, Ls9i;-><init>(Lpxh;Lpxh;)V

    move-object v2, v6

    :goto_b7
    new-instance v4, Lxbf;

    const/4 v5, 0x7

    invoke-direct {v4, v5}, Lxbf;-><init>(B)V

    new-instance v6, La87;

    invoke-direct {v6, v2, v4, v1}, La87;-><init>(Ls9i;Lxbf;B)V

    new-instance v9, Ls2g;

    const/4 v1, 0x4

    invoke-direct {v9, p0, p1, v0, v1}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v5, p0, Lsjh;->f:Lqjh;

    iget-object v0, v5, Lqjh;->b:Lew3;

    invoke-virtual {v0}, Lew3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqim;

    new-instance v4, Lai;

    const/4 v10, 0x6

    move-object v8, p1

    invoke-direct/range {v4 .. v10}, Lai;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v6, v0, v4}, La87;->s0(Lqim;Lai;)V

    iget-object p1, v3, Lxi5;->i:Lh7f;

    iget-object v0, p0, Lsjh;->j:Lrjh;

    invoke-virtual {p1, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object p0, p0, Lsjh;->b:Lk6l;

    invoke-virtual {p0, v0}, Lk6l;->v(La2l;)V

    return-void
.end method
