.class public final Lru9;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Llu9;

.field public static final d:Lmu9;

.field public static final e:Llu9;

.field public static final f:Llu9;

.field public static final g:Lqu9;

.field public static final h:Lpu9;

.field public static final i:Llu9;

.field public static final j:Lpu9;

.field public static final k:Llu9;

.field public static final l:Llu9;

.field public static final m:Ljava/lang/Object;

.field public static n:Lru9;


# instance fields
.field public final a:Landroid/content/SharedPreferences;

.field public final b:Li7f;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Llu9;

    const-string v1, "vpn.vpnpro.quick_settings_tile_added"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru9;->c:Llu9;

    new-instance v0, Lmu9;

    const-string v1, "vpn.vpnpro.upsell_banner_version"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru9;->d:Lmu9;

    new-instance v0, Llu9;

    const-string v1, "vpn.vpnpro.upsell_banner_closed"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru9;->e:Llu9;

    new-instance v0, Llu9;

    const-string v1, "crypto.wallet.wallet_removed"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru9;->f:Llu9;

    new-instance v0, Llu9;

    const-string v1, "premium.opera_account_promotion.dialog_shown"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Lqu9;

    const-string v1, "startpage.feed_category_id"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru9;->g:Lqu9;

    new-instance v0, Lpu9;

    const-string v1, "rewards.claimed_wallpapers"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru9;->h:Lpu9;

    new-instance v0, Llu9;

    const-string v1, "startpage.allow_extended_behavior"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru9;->i:Llu9;

    new-instance v0, Lpu9;

    const-string v1, "wallpaper.unlocked_ids"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru9;->j:Lpu9;

    new-instance v0, Lqu9;

    const-string v1, "osp.analytics_host"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Lqu9;

    const-string v1, "osp.analytics_key"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Lqu9;

    const-string v1, "osp.behavior_host"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Lqu9;

    const-string v1, "osp.behavior_key"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Lqu9;

    const-string v1, "osp.requests_host"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Lqu9;

    const-string v1, "osp.requests_key"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Lqu9;

    const-string v1, "osp.onboarding_host"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Lqu9;

    const-string v1, "osp.onboarding_key"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Lqu9;

    const-string v1, "osp.domains_host"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Lqu9;

    const-string v1, "osp.domains_key"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Llu9;

    const-string v1, "tab_gallery.tabui2_selection_menu_hint_bubble_shown"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    new-instance v0, Llu9;

    const-string v1, "rewards.has_opened_ui"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru9;->k:Llu9;

    new-instance v0, Llu9;

    const-string v1, "vpn_pro.kill_switch.on"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lru9;->l:Llu9;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lru9;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/SharedPreferences;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lru9;->b:Li7f;

    iput-object p1, p0, Lru9;->a:Landroid/content/SharedPreferences;

    return-void
.end method

.method public static c(Landroid/content/Context;)Lru9;
    .registers 5

    sget-object v0, Lru9;->m:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lru9;->n:Lru9;

    if-nez v1, :cond_15

    new-instance v1, Lru9;

    const-string v2, "general_prefs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-direct {v1, p0}, Lru9;-><init>(Landroid/content/SharedPreferences;)V

    sput-object v1, Lru9;->n:Lru9;

    :cond_15
    monitor-exit v0

    return-object v1

    :goto_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_19

    throw p0

    :catchall_19
    move-exception p0

    goto :goto_17
.end method


# virtual methods
.method public final a(Ln1;)V
    .registers 3

    iget-object v0, p0, Lru9;->b:Li7f;

    invoke-virtual {v0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p1, p1, Ln1;->b:Ljava/lang/Object;

    check-cast p1, Lnu9;

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    return-void
.end method

.method public final b()Lnv6;
    .registers 2

    new-instance v0, Lnv6;

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-direct {v0, p0}, Lnv6;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public final d(Ln1;)V
    .registers 3

    iget-object v0, p0, Lru9;->b:Li7f;

    invoke-virtual {v0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object p1, p1, Ln1;->b:Ljava/lang/Object;

    check-cast p1, Lnu9;

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    return-void
.end method
