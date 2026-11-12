.class public final Lsyd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:Llhe;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lb59;

.field public final d:Ljava/util/concurrent/ExecutorService;

.field public final e:Lbpd;

.field public f:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Llhe;

    const-string v1, "Opera Migration"

    invoke-direct {v0, v1}, Llhe;-><init>(Ljava/lang/String;)V

    sput-object v0, Lsyd;->g:Llhe;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lcom/opera/android/settings/SettingsManager;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lsyd;->g:Llhe;

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lsyd;->d:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lbpd;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lbpd;-><init>(B)V

    iput-object v0, p0, Lsyd;->e:Lbpd;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lsyd;->a:Landroid/content/Context;

    iput-object p3, p0, Lsyd;->b:Lcom/opera/android/settings/SettingsManager;

    new-instance p3, Ly0a;

    const/16 v0, 0x17

    invoke-direct {p3, p0, v0}, Ly0a;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lb94;

    const/4 v1, 0x0

    invoke-direct {v0, p2, p3, v1}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p3, 0x1

    new-array p3, p3, [Lbg1;

    aput-object v0, p3, v1

    const-string v0, "offline-pages-migration-service"

    invoke-static {p1, p2, v0, p3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lsyd;->c:Lb59;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/SharedPreferences;Z)V
    .registers 11

    const-string v0, "active"

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    const-string v3, "target-location"

    const/4 v4, 0x0

    invoke-interface {p1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lsyd;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v6}, Lcom/opera/android/settings/SettingsManager;->O()Z

    move-result v7

    if-nez v7, :cond_23

    const-string v7, "offline_pages_location"

    invoke-virtual {v6, v7}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_23

    move-object v4, v6

    :cond_23
    const/4 v6, 0x1

    if-eqz v4, :cond_32

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2e

    if-eqz p2, :cond_32

    :cond_2e
    invoke-static {p1, v3, v4}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    move v2, v6

    :cond_32
    iget-object p1, p0, Lsyd;->c:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-static {p1, v0, v2}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    iget-object p0, p0, Lsyd;->a:Landroid/content/Context;

    invoke-static {p0}, Lx4o;->c(Landroid/content/Context;)Lx4o;

    move-result-object p0

    if-eqz v2, :cond_5e

    new-instance p1, Ltn;

    const-class p2, Lcom/opera/android/readlater/MigrationWorker;

    invoke-direct {p1, p2}, Ltn;-><init>(Ljava/lang/Class;)V

    iget-object p2, p1, Ltn;->c:Ljava/lang/Object;

    check-cast p2, Lh5o;

    iput-boolean v6, p2, Lh5o;->q:Z

    iput v6, p2, Lh5o;->r:I

    invoke-virtual {p1}, Ltn;->j()Loff;

    move-result-object p1

    const-string p2, "com.opera.android.MigrationWorker"

    invoke-virtual {p0, p2, p1}, Lx4o;->b(Ljava/lang/String;Loff;)V

    return-void

    :cond_5e
    iget-object p1, p0, Lx4o;->b:Ljl5;

    iget-object p1, p1, Ljl5;->j:Lydp;

    iget-object p2, p0, Lx4o;->d:La5o;

    iget-object p2, p2, La5o;->a:Lop1;

    new-instance v0, Lgh4;

    invoke-direct {v0, p0, v1}, Lgh4;-><init>(Lx4o;B)V

    const-string p0, "CancelWorkByName_com.opera.android.MigrationWorker"

    invoke-static {p1, p0, p2, v0}, La26;->O(Lydp;Ljava/lang/String;Ljava/util/concurrent/Executor;Lkotlin/jvm/functions/Function0;)Lzpa;

    return-void
.end method
