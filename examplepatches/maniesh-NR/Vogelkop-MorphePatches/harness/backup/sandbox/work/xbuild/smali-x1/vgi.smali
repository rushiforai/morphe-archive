.class public final Lvgi;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Lmo7;


# instance fields
.field public final a:Lfp1;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Le3j;

.field public final d:Lx5f;

.field public e:Lcom/google/android/gms/safetynet/SafetyNetClient;

.field public f:Ljava/lang/String;

.field public g:Z


# direct methods
.method public constructor <init>(Lfp1;Lcom/opera/android/settings/SettingsManager;Le3j;Lx5f;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvgi;->a:Lfp1;

    iput-object p2, p0, Lvgi;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lvgi;->c:Le3j;

    iput-object p4, p0, Lvgi;->d:Lx5f;

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    invoke-virtual {p2, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p3, p0}, Lno7;->g(Lmo7;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "safe_browsing_enabled"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Lvgi;->R()V

    :cond_b
    return-void
.end method

.method public final R()V
    .registers 5

    iget-object v0, p0, Lvgi;->e:Lcom/google/android/gms/safetynet/SafetyNetClient;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lvgi;->f:Ljava/lang/String;

    iget-object v1, p0, Lvgi;->d:Lx5f;

    if-eqz v0, :cond_44

    sget-object v0, Lcom/opera/android/browser/SafeBrowsingBridge;->a:Lvgi;

    iget-object v0, p0, Lvgi;->a:Lfp1;

    invoke-static {v0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v2

    invoke-virtual {v2}, Lno7;->i()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwnh;

    const/16 v3, 0x2000

    invoke-virtual {v2, v3}, Lwnh;->b(I)Z

    move-result v2

    if-eqz v2, :cond_44

    iget-object v2, p0, Lvgi;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v2}, Lcom/opera/android/settings/SettingsManager;->getSafeBrowsingEnabled()Z

    move-result v2

    if-nez v2, :cond_2f

    sget-object p0, Lvd0;->c:Lvd0;

    invoke-virtual {v1, p0}, Lx5f;->G0(Lvd0;)V

    return-void

    :cond_2f
    invoke-static {v0}, Lcom/google/android/gms/safetynet/SafetyNet;->getClient(Landroid/app/Activity;)Lcom/google/android/gms/safetynet/SafetyNetClient;

    move-result-object v0

    iput-object v0, p0, Lvgi;->e:Lcom/google/android/gms/safetynet/SafetyNetClient;

    invoke-virtual {v0}, Lcom/google/android/gms/safetynet/SafetyNetClient;->initSafeBrowsing()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lr9g;

    const/16 v2, 0x17

    invoke-direct {v1, p0, v2}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void

    :cond_44
    sget-object p0, Lvd0;->d:Lvd0;

    invoke-virtual {v1, p0}, Lx5f;->G0(Lvd0;)V

    return-void
.end method

.method public final S()V
    .registers 3

    iget-object v0, p0, Lvgi;->e:Lcom/google/android/gms/safetynet/SafetyNetClient;

    if-nez v0, :cond_5

    return-void

    :cond_5
    sget-object v0, Lcom/opera/android/browser/SafeBrowsingBridge;->a:Lvgi;

    if-ne v0, p0, :cond_10

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    sput-object v0, Lcom/opera/android/browser/SafeBrowsingBridge;->b:Ljava/util/ArrayDeque;

    :cond_10
    const/4 v0, 0x0

    iput-object v0, p0, Lvgi;->f:Ljava/lang/String;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lvgi;->g:Z

    iget-object v1, p0, Lvgi;->e:Lcom/google/android/gms/safetynet/SafetyNetClient;

    invoke-virtual {v1}, Lcom/google/android/gms/safetynet/SafetyNetClient;->shutdownSafeBrowsing()Lcom/google/android/gms/tasks/Task;

    iput-object v0, p0, Lvgi;->e:Lcom/google/android/gms/safetynet/SafetyNetClient;

    return-void
.end method

.method public final o(Z)V
    .registers 3

    iget-object p1, p0, Lvgi;->c:Le3j;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ld3j;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ld3j;->b(I)Lqsh;

    move-result-object p1

    if-eqz p1, :cond_1b

    iget-object p1, p1, Lqsh;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1b

    iput-object p1, p0, Lvgi;->f:Ljava/lang/String;

    :cond_1b
    invoke-virtual {p0}, Lvgi;->R()V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    invoke-virtual {p0}, Lvgi;->S()V

    iget-object p1, p0, Lvgi;->c:Le3j;

    invoke-virtual {p1, p0}, Lno7;->p(Lmo7;)V

    iget-object p1, p0, Lvgi;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    sget-object p1, Lcom/opera/android/browser/SafeBrowsingBridge;->a:Lvgi;

    if-ne p1, p0, :cond_1b

    const/4 p0, 0x0

    sput-object p0, Lcom/opera/android/browser/SafeBrowsingBridge;->a:Lvgi;

    :cond_1b
    return-void
.end method
