.class public Ll/zzb$a;
.super Ll/tzb;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zzb;-><init>(Ll/vrl;Landroid/app/PendingIntent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/zzb;


# direct methods
.method public constructor <init>(Ll/zzb;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zzb$a;->a:Ll/zzb;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tzb;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/zzb$a;->a:Ll/zzb;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zzb;->a:Ll/vrl;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/vrl;->I5(Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    const-string p0, "CustomTabsSessionToken"

    .line 10
    .line 11
    const-string p1, "RemoteException during ICustomTabsCallback transaction"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public b(Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/zzb$a;->a:Ll/zzb;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zzb;->a:Ll/vrl;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/vrl;->U0(Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    const-string p0, "CustomTabsSessionToken"

    .line 11
    .line 12
    const-string p1, "RemoteException during ICustomTabsCallback transaction"

    .line 13
    .line 14
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public c(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/zzb$a;->a:Ll/zzb;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zzb;->a:Ll/vrl;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/vrl;->e8(Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    const-string p0, "CustomTabsSessionToken"

    .line 10
    .line 11
    const-string p1, "RemoteException during ICustomTabsCallback transaction"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public d(ILandroid/os/Bundle;)V
    .locals 0
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/zzb$a;->a:Ll/zzb;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zzb;->a:Ll/vrl;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/vrl;->V3(ILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    const-string p0, "CustomTabsSessionToken"

    .line 10
    .line 11
    const-string p1, "RemoteException during ICustomTabsCallback transaction"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public e(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/zzb$a;->a:Ll/zzb;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zzb;->a:Ll/vrl;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/vrl;->X7(Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    const-string p0, "CustomTabsSessionToken"

    .line 10
    .line 11
    const-string p1, "RemoteException during ICustomTabsCallback transaction"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public f(ILandroid/net/Uri;ZLandroid/os/Bundle;)V
    .locals 0
    .param p2    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/zzb$a;->a:Ll/zzb;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zzb;->a:Ll/vrl;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Ll/vrl;->h8(ILandroid/net/Uri;ZLandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    const-string p0, "CustomTabsSessionToken"

    .line 10
    .line 11
    const-string p1, "RemoteException during ICustomTabsCallback transaction"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method
