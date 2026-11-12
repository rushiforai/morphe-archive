.class public final Lyen;
.super Lyi2;
.source "SourceFile"


# instance fields
.field public final g:Landroid/content/Context;

.field public final h:Lx5f;

.field public final i:Lode;

.field public final j:Lkze;

.field public final k:Lx53;

.field public l:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lx5f;Lslk;Lydn;)V
    .registers 5

    invoke-direct {p0, p1, p3, p4}, Lyi2;-><init>(Landroid/content/Context;Lslk;Lydn;)V

    iput-object p1, p0, Lyen;->g:Landroid/content/Context;

    iput-object p2, p0, Lyen;->h:Lx5f;

    new-instance p2, Lode;

    invoke-direct {p2}, Lekc;-><init>()V

    iput-object p2, p0, Lyen;->i:Lode;

    new-instance p2, Lkze;

    invoke-virtual {p0, p1}, Lyen;->e(Landroid/content/Context;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-direct {p2, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lyen;->j:Lkze;

    new-instance p1, Lx53;

    invoke-direct {p1, p0}, Lx53;-><init>(Lyen;)V

    iput-object p1, p0, Lyen;->k:Lx53;

    return-void
.end method


# virtual methods
.method public final e(Landroid/content/Context;)Z
    .registers 3

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p1, "vpn.vpnpro.quick_settings_tile_added"

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public final l(Landroid/content/Context;Z)V
    .registers 8

    const/4 v0, 0x1

    if-eqz p2, :cond_5

    move v1, v0

    goto :goto_6

    :cond_5
    const/4 v1, 0x2

    :goto_6
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    new-instance v3, Landroid/content/ComponentName;

    const-class v4, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;

    invoke-direct {v3, p1, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v2, v3, v1, v0}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    if-nez p2, :cond_1a

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lyen;->q(Z)V

    :cond_1a
    return-void
.end method

.method public final o()V
    .registers 3

    iget-object v0, p0, Lyi2;->c:Ljava/lang/Object;

    check-cast v0, Lydn;

    iget-object v1, p0, Lyi2;->d:Ljava/lang/Object;

    check-cast v1, Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_16

    sget-object v1, Lxen;->d:Lxen;

    :cond_16
    iget-object v1, v0, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_21

    sget-object v0, Lxen;->f:Lxen;

    goto :goto_39

    :cond_21
    invoke-virtual {v0}, Lydn;->q()I

    move-result v0

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eqz v0, :cond_37

    const/4 v1, 0x1

    if-eq v0, v1, :cond_34

    const/4 v1, 0x2

    if-eq v0, v1, :cond_34

    sget-object v0, Lxen;->f:Lxen;

    goto :goto_39

    :cond_34
    sget-object v0, Lxen;->e:Lxen;

    goto :goto_39

    :cond_37
    sget-object v0, Lxen;->f:Lxen;

    :goto_39
    iget-object v1, p0, Lyen;->i:Lode;

    invoke-static {v1, v0}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    iget-object p0, p0, Lyen;->g:Landroid/content/Context;

    :try_start_43
    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {p0, v0}, Landroid/service/quicksettings/TileService;->requestListeningState(Landroid/content/Context;Landroid/content/ComponentName;)V
    :try_end_4d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_43 .. :try_end_4d} :catch_4d

    :catch_4d
    :cond_4d
    return-void
.end method

.method public final q(Z)V
    .registers 6

    iget-object v0, p0, Lyen;->g:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "vpn.vpnpro.quick_settings_tile_added"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    iget-object p0, p0, Lyen;->h:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_1d

    return-void

    :cond_1d
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->J(Lzpa;)Lsn0;

    move-result-object v0

    const/16 v2, 0xa

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3, p1}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method
