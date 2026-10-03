.class public final Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;
.super Ljava/lang/Object;
.implements Lp/oqk0;

.field private final activity:Landroid/app/Activity;
.field private final delegate:Lp/oqk0;

.method public constructor <init>(Landroid/app/Activity;Lp/oqk0;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->activity:Landroid/app/Activity;
    iput-object p2, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/oqk0;
    return-void
.end method

.method public a(Ljava/lang/String;Lp/xd60;Landroid/os/Bundle;)V
    .locals 1
    const-string v0, "spicetify:settings"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :delegate
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lapp/spicetify/extension/spotify/settings/SpicetifySettingsActivity;->open(Landroid/app/Activity;)V
    return-void
    :delegate
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/oqk0;
    invoke-interface {v0, p1, p2, p3}, Lp/oqk0;->a(Ljava/lang/String;Lp/xd60;Landroid/os/Bundle;)V
    return-void
.end method

.method public b(Lp/znc1;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/oqk0;
    invoke-interface {v0, p1}, Lp/oqk0;->b(Lp/znc1;)V
    return-void
.end method

.method public c()V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/oqk0;
    invoke-interface {v0}, Lp/oqk0;->c()V
    return-void
.end method

.method public d(Lp/pw90;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/oqk0;
    invoke-interface {v0, p1}, Lp/oqk0;->d(Lp/pw90;)V
    return-void
.end method

.method public e()V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/oqk0;
    invoke-interface {v0}, Lp/oqk0;->e()V
    return-void
.end method

.method public f(Lp/dnk0;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/oqk0;
    invoke-interface {v0, p1}, Lp/oqk0;->f(Lp/dnk0;)V
    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/oqk0;
    invoke-interface {v0, p1}, Lp/oqk0;->h(Ljava/lang/String;)V
    return-void
.end method

.method public g(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/oqk0;
    invoke-interface {v0, p1, p2}, Lp/oqk0;->g(Landroid/os/Bundle;Ljava/lang/String;)V
    return-void
.end method

.method public i(Lp/dnk0;Landroid/os/Bundle;)V
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/oqk0;
    invoke-interface {v0, p1, p2}, Lp/oqk0;->i(Lp/dnk0;Landroid/os/Bundle;)V
    return-void
.end method

.method public j(Landroid/app/Activity;)Z
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;->delegate:Lp/oqk0;
    invoke-interface {v0, p1}, Lp/oqk0;->j(Landroid/app/Activity;)Z
    move-result v0
    return v0
.end method
