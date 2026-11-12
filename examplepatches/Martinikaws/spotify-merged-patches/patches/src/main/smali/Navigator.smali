.class public final Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;
.super Ljava/lang/Object;
.implements Lp/tbn0;

# Spotify 9.1.94.1929: Lp/tbn0; is the navigator (was Lp/tyh0;). Its (String, X, Bundle) method, which the
# settings renderer calls with the page URI, is now `a` (was `b`). Every other method delegates unchanged.
.field private final activity:Landroid/app/Activity;
.field private final delegate:Lp/tbn0;

.method public constructor <init>(Landroid/app/Activity;Lp/tbn0;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->activity:Landroid/app/Activity;
    iput-object p2, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tbn0;
    return-void
.end method

.method public a(Ljava/lang/String;Lp/kf80;Landroid/os/Bundle;)V
    .locals 1
    const-string v0, "spicetify:settings"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :delegate
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lapp/spicetify/extension/spotify/settings/SpicetifySettingsScreen;->open(Landroid/app/Activity;)V
    return-void
    :delegate
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tbn0;
    invoke-interface {v0, p1, p2, p3}, Lp/tbn0;->a(Ljava/lang/String;Lp/kf80;Landroid/os/Bundle;)V
    return-void
.end method

.method public b(Lp/eyg1;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tbn0;
    invoke-interface {v0, p1}, Lp/tbn0;->b(Lp/eyg1;)V
    return-void
.end method

.method public c()V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tbn0;
    invoke-interface {v0}, Lp/tbn0;->c()V
    return-void
.end method

.method public d(Lp/z3c0;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tbn0;
    invoke-interface {v0, p1}, Lp/tbn0;->d(Lp/z3c0;)V
    return-void
.end method

.method public e()V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tbn0;
    invoke-interface {v0}, Lp/tbn0;->e()V
    return-void
.end method

.method public f(Lp/j8n0;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tbn0;
    invoke-interface {v0, p1}, Lp/tbn0;->f(Lp/j8n0;)V
    return-void
.end method

.method public g(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tbn0;
    invoke-interface {v0, p1, p2}, Lp/tbn0;->g(Landroid/os/Bundle;Ljava/lang/String;)V
    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tbn0;
    invoke-interface {v0, p1}, Lp/tbn0;->h(Ljava/lang/String;)V
    return-void
.end method

.method public i(Lp/j8n0;Landroid/os/Bundle;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tbn0;
    invoke-interface {v0, p1, p2}, Lp/tbn0;->i(Lp/j8n0;Landroid/os/Bundle;)V
    return-void
.end method

.method public j(Landroid/app/Activity;)Z
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tbn0;
    invoke-interface {v0, p1}, Lp/tbn0;->j(Landroid/app/Activity;)Z
    move-result v0
    return v0
.end method
