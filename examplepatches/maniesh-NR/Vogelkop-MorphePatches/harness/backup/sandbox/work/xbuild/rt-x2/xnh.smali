.class public final Lxnh;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:La36;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, La36;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lxnh;->k:La36;

    return-void
.end method

.method public static t(Landroid/content/Context;)Lxnh;
    .registers 3

    sget-object v0, Lio7;->h:Lio7;

    sget-object v1, Lxnh;->k:La36;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Lxnh;

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 1

    new-instance p0, Lwnh;

    invoke-direct {p0}, Lwnh;-><init>()V

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Lwnh;

    invoke-direct {p0, p1}, Lwnh;-><init>(Lizd;)V

    return-object p0
.end method

.method public final m(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lwnh;

    invoke-virtual {p0, p1}, Lxnh;->u(Lwnh;)V

    return-void
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_a
    new-instance p1, Lwnh;

    invoke-direct {p1, p0}, Lwnh;-><init>(Lizd;)V
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_13

    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object p1

    :catchall_13
    move-exception p1

    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p1
.end method

.method public final r(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lwnh;

    invoke-virtual {p0, p1}, Lxnh;->u(Lwnh;)V

    return-void
.end method

.method public final u(Lwnh;)V
    .registers 7

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lno7;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v1

    if-eqz v1, :cond_1f

    const/high16 v1, 0x4000000

    invoke-virtual {p1, v1}, Lwnh;->b(I)Z

    move-result v1

    const-string v2, "ad_blocking"

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    :cond_1f
    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    const/4 v2, 0x0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "dcc.rs.mock.disable"

    invoke-interface {p0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    const/16 v2, 0x1000

    invoke-virtual {p1, v2}, Lwnh;->a(I)Z

    move-result v4

    if-eq p0, v4, :cond_4a

    invoke-virtual {v1}, Lru9;->b()Lnv6;

    move-result-object p0

    invoke-virtual {p1, v2}, Lwnh;->a(I)Z

    move-result v1

    iget-object v4, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v3, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_4a
    const/high16 p0, 0x100000

    invoke-virtual {p1, p0}, Lwnh;->a(I)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    const-string v1, "enable_trending_searches"

    invoke-virtual {v0, p0, v1}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    const/high16 p0, 0x200000

    invoke-virtual {p1, p0}, Lwnh;->a(I)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    const-string v1, "enable_recent_searches"

    invoke-virtual {v0, p0, v1}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    const-string p0, "tracker_blocker"

    invoke-virtual {p1, v2}, Lwnh;->b(I)Z

    move-result v1

    invoke-virtual {v0, v1, p0}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    const/16 p0, 0x4000

    invoke-virtual {p1, p0}, Lwnh;->b(I)Z

    move-result p0

    const-string v1, "live_scores_enabled"

    invoke-virtual {v0, p0, v1}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    const/16 p0, 0x10

    invoke-virtual {p1, p0}, Lwnh;->b(I)Z

    move-result p0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->getCookiesInt()I

    move-result p1

    iput-boolean p0, v0, Lcom/opera/android/settings/SettingsManager;->i:Z

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->getCookiesInt()I

    move-result p0

    if-eq p1, p0, :cond_8f

    const-string p0, "accept_cookies"

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->Q(Ljava/lang/String;)V

    :cond_8f
    return-void
.end method
