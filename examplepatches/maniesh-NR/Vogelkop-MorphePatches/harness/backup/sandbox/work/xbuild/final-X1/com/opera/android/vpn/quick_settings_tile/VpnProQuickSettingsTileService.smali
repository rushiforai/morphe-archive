.class public final Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;
.super Landroid/service/quicksettings/TileService;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;",
        "Landroid/service/quicksettings/TileService;",
        "<init>",
        "()V",
        "yen",
        "t8",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic b:I


# instance fields
.field public final a:Lg9l;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroid/service/quicksettings/TileService;-><init>()V

    new-instance v0, Lg9l;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lg9l;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;->a:Lg9l;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 3

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->T()Lyen;

    move-result-object p0

    invoke-virtual {p0, p1}, Lyi2;->m(Z)V

    invoke-virtual {p0, p1}, Lyen;->q(Z)V

    return-void
.end method

.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    :try_start_0
    invoke-super {p0, p1}, Landroid/service/quicksettings/TileService;->onBind(Landroid/content/Intent;)Landroid/os/IBinder;

    move-result-object p0
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_4} :catch_5

    return-object p0

    :catch_5
    const/4 p0, 0x0

    return-object p0
.end method

.method public final onClick()V
    .registers 7

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onClick()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->S()Lien;

    move-result-object v0

    invoke-virtual {v0}, Lien;->q()Lg1o;

    move-result-object v1

    invoke-virtual {v1}, Lg1o;->b()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_4a

    if-eq v1, v3, :cond_1e

    return-void

    :cond_1e
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    const-string v3, ""

    const-string v4, "com.opera.android.action.EXTRA_FORCE_SHOW_FRAGMENT_IMMEDIATELY"

    const-string v5, "com.opera.android.action.VPN_PRO_WIDGET_OPEN_OFA"

    if-lt v0, v1, :cond_3d

    sget v0, Leif;->a:I

    invoke-static {p0, v5}, Lkfo;->R(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0xc000000

    invoke-static {p0, v2, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/service/quicksettings/TileService;->startActivityAndCollapse(Landroid/app/PendingIntent;)V

    return-void

    :cond_3d
    sget v0, Leif;->a:I

    invoke-static {p0, v5}, Lkfo;->R(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/service/quicksettings/TileService;->startActivityAndCollapse(Landroid/content/Intent;)V

    return-void

    :cond_4a
    invoke-virtual {v0}, Lien;->q()Lg1o;

    move-result-object v0

    iget-byte v0, v0, Lg1o;->e:B

    if-eq v0, v3, :cond_55

    const/4 v1, 0x2

    if-ne v0, v1, :cond_56

    :cond_55
    move v2, v3

    :cond_56
    xor-int/2addr v2, v3

    invoke-static {p0, v2}, Lcom/opera/android/vpn/VpnReceiver;->b(Landroid/content/Context;Z)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public final onStartListening()V
    .registers 2

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onStartListening()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->T()Lyen;

    move-result-object v0

    iget-object v0, v0, Lyen;->i:Lode;

    iget-object p0, p0, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;->a:Lg9l;

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final onStopListening()V
    .registers 2

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onStopListening()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->T()Lyen;

    move-result-object v0

    iget-object v0, v0, Lyen;->i:Lode;

    iget-object p0, p0, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;->a:Lg9l;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method

.method public final onTileAdded()V
    .registers 2

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onTileAdded()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;->a(Z)V

    return-void
.end method

.method public final onTileRemoved()V
    .registers 2

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onTileRemoved()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;->a(Z)V

    return-void
.end method
