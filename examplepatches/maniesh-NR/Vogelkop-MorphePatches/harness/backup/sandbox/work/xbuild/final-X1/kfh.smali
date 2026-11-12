.class public final Lkfh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/moduleinstall/InstallStatusListener;


# instance fields
.field public final synthetic a:Llfh;

.field public final synthetic b:Lcom/google/android/gms/common/moduleinstall/ModuleInstallClient;


# direct methods
.method public constructor <init>(Llfh;Lcom/google/android/gms/common/moduleinstall/ModuleInstallClient;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkfh;->a:Llfh;

    iput-object p2, p0, Lkfh;->b:Lcom/google/android/gms/common/moduleinstall/ModuleInstallClient;

    return-void
.end method


# virtual methods
.method public final onInstallStatusUpdated(Lcom/google/android/gms/common/moduleinstall/ModuleInstallStatusUpdate;)V
    .registers 5

    invoke-virtual {p1}, Lcom/google/android/gms/common/moduleinstall/ModuleInstallStatusUpdate;->getInstallState()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x4

    if-eq v0, v1, :cond_e

    if-eq v0, v2, :cond_e

    const/4 v1, 0x5

    if-eq v0, v1, :cond_e

    return-void

    :cond_e
    iget-object v0, p0, Lkfh;->b:Lcom/google/android/gms/common/moduleinstall/ModuleInstallClient;

    invoke-interface {v0, p0}, Lcom/google/android/gms/common/moduleinstall/ModuleInstallClient;->unregisterListener(Lcom/google/android/gms/common/moduleinstall/InstallStatusListener;)Lcom/google/android/gms/tasks/Task;

    invoke-virtual {p1}, Lcom/google/android/gms/common/moduleinstall/ModuleInstallStatusUpdate;->getInstallState()I

    move-result p1

    iget-object p0, p0, Lkfh;->a:Llfh;

    if-ne p1, v2, :cond_1f

    invoke-virtual {p0}, Llfh;->b()V

    return-void

    :cond_1f
    iget-object p0, p0, Llfh;->j:Lpde;

    new-instance p1, Lcfh;

    sget-object v0, Lyeh;->a:Lyeh;

    invoke-direct {p1, v0}, Lcfh;-><init>(Lbfh;)V

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
