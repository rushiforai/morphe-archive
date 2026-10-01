.class public final Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;
.super Ljava/lang/Object;
.implements Lp/tyh0;

.field private final activity:Landroid/app/Activity;
.field private final delegate:Lp/tyh0;

.method public constructor <init>(Landroid/app/Activity;Lp/tyh0;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->activity:Landroid/app/Activity;
    iput-object p2, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tyh0;
    return-void
.end method

.method public b(Ljava/lang/String;Lp/mb40;Landroid/os/Bundle;)V
    .locals 1
    const-string v0, "spicetify:settings"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :delegate
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lapp/spicetify/extension/spotify/settings/SpicetifySettingsActivity;->open(Landroid/app/Activity;)V
    return-void
    :delegate
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tyh0;
    invoke-interface {v0, p1, p2, p3}, Lp/tyh0;->b(Ljava/lang/String;Lp/mb40;Landroid/os/Bundle;)V
    return-void
.end method

.method public a(Lp/ii81;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tyh0;
    invoke-interface {v0, p1}, Lp/tyh0;->a(Lp/ii81;)V
    return-void
.end method

.method public c()V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tyh0;
    invoke-interface {v0}, Lp/tyh0;->c()V
    return-void
.end method

.method public d(Lp/sk70;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tyh0;
    invoke-interface {v0, p1}, Lp/tyh0;->d(Lp/sk70;)V
    return-void
.end method

.method public e()V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tyh0;
    invoke-interface {v0}, Lp/tyh0;->e()V
    return-void
.end method

.method public f(Lp/avh0;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tyh0;
    invoke-interface {v0, p1}, Lp/tyh0;->f(Lp/avh0;)V
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tyh0;
    invoke-interface {v0, p1}, Lp/tyh0;->g(Ljava/lang/String;)V
    return-void
.end method

.method public h(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tyh0;
    invoke-interface {v0, p1, p2}, Lp/tyh0;->h(Ljava/lang/String;Landroid/os/Bundle;)V
    return-void
.end method

.method public i(Lp/avh0;Landroid/os/Bundle;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tyh0;
    invoke-interface {v0, p1, p2}, Lp/tyh0;->i(Lp/avh0;Landroid/os/Bundle;)V
    return-void
.end method

.method public j(Landroid/app/Activity;)Z
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/tyh0;
    invoke-interface {v0, p1}, Lp/tyh0;->j(Landroid/app/Activity;)Z
    move-result v0
    return v0
.end method
