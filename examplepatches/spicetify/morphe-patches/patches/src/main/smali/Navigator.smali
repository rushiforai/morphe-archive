.class public final Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;
.super Ljava/lang/Object;
.implements Lp/zkq0;

.field private final activity:Landroid/app/Activity;
.field private final delegate:Lp/zkq0;

.method public constructor <init>(Landroid/app/Activity;Lp/zkq0;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->activity:Landroid/app/Activity;
    iput-object p2, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/zkq0;
    return-void
.end method

.method public a(Ljava/lang/String;Lp/vta0;Landroid/os/Bundle;)V
    .locals 1
    const-string v0, "spicetify:settings"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :delegate
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lapp/spicetify/extension/spotify/settings/SpicetifySettingsScreen;->open(Landroid/app/Activity;)V
    return-void
    :delegate
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/zkq0;
    invoke-interface {v0, p1, p2, p3}, Lp/zkq0;->a(Ljava/lang/String;Lp/vta0;Landroid/os/Bundle;)V
    return-void
.end method

.method public b(Lp/j0m1;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/zkq0;
    invoke-interface {v0, p1}, Lp/zkq0;->b(Lp/j0m1;)V
    return-void
.end method

.method public c()V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/zkq0;
    invoke-interface {v0}, Lp/zkq0;->c()V
    return-void
.end method

.method public d(Lp/the0;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/zkq0;
    invoke-interface {v0, p1}, Lp/zkq0;->d(Lp/the0;)V
    return-void
.end method

.method public e()V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/zkq0;
    invoke-interface {v0}, Lp/zkq0;->e()V
    return-void
.end method

.method public f(Lp/mhq0;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/zkq0;
    invoke-interface {v0, p1}, Lp/zkq0;->f(Lp/mhq0;)V
    return-void
.end method

.method public g(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/zkq0;
    invoke-interface {v0, p1, p2}, Lp/zkq0;->g(Landroid/os/Bundle;Ljava/lang/String;)V
    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/zkq0;
    invoke-interface {v0, p1}, Lp/zkq0;->h(Ljava/lang/String;)V
    return-void
.end method

.method public i(Lp/mhq0;Landroid/os/Bundle;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/zkq0;
    invoke-interface {v0, p1, p2}, Lp/zkq0;->i(Lp/mhq0;Landroid/os/Bundle;)V
    return-void
.end method

.method public j(Landroid/app/Activity;)Z
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/zkq0;
    invoke-interface {v0, p1}, Lp/zkq0;->j(Landroid/app/Activity;)Z
    move-result v0
    return v0
.end method
