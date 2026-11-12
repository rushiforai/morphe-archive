.class public final Lapp/spicetify/extension/spotify/settings/nativebridge/SettingsBridge;
.super Ljava/lang/Object;

# Spotify 9.1.94.1929. The settings root (Lp/wbs;->create, case 2) reuses its `this` register before the
# entries list exists, so the root factory is stashed by prepare() at the top of the method and consumed by
# append() once Lp/r06;->i0 has built the mutable entries list.
.field private static factory:Lp/jsp;

.method public static prepare(Lp/jsp;)V
    .locals 0
    sput-object p0, Lapp/spicetify/extension/spotify/settings/nativebridge/SettingsBridge;->factory:Lp/jsp;
    return-void
.end method

.method public static append(Ljava/util/List;)V
    .locals 13
    sget-object v7, Lapp/spicetify/extension/spotify/settings/nativebridge/SettingsBridge;->factory:Lp/jsp;
    const/4 v0, 0x0
    sput-object v0, Lapp/spicetify/extension/spotify/settings/nativebridge/SettingsBridge;->factory:Lp/jsp;
    if-eqz v7, :invalid

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v0
    const-string v3, "spicetify_settings"
    :scan
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :construct
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    instance-of v2, v1, Lp/mr51;
    if-eqz v2, :scan
    check-cast v1, Lp/mr51;
    invoke-interface {v1}, Lp/mr51;->getId()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :scan
    return-void

    :construct
    # jsp.f is the Lp/vod0; (case 0xa) built in Lp/y7q;->L0 from the activity and the renderer provider.
    iget-object v0, v7, Lp/jsp;->f:Ljava/lang/Object;
    instance-of v1, v0, Lp/vod0;
    if-eqz v1, :invalid
    check-cast v0, Lp/vod0;
    iget-byte v1, v0, Lp/vod0;->a:B
    const/16 v2, 0xa
    if-ne v1, v2, :invalid
    iget-object v10, v0, Lp/vod0;->b:Ljava/lang/Object;
    check-cast v10, Landroid/app/Activity;
    iget-object v0, v0, Lp/vod0;->d:Ljava/lang/Object;
    check-cast v0, Lp/l5b0;
    invoke-interface {v0}, Lp/l5b0;->get()Ljava/lang/Object;
    move-result-object v11
    instance-of v0, v11, Lp/fj0;
    if-eqz v0, :invalid
    check-cast v11, Lp/fj0;
    iget-byte v0, v11, Lp/fj0;->a:B
    const/16 v1, 0x1a
    if-ne v0, v1, :invalid
    iget-object v0, v11, Lp/fj0;->d:Ljava/lang/Object;
    check-cast v0, Lp/tbn0;
    iget-object v8, v11, Lp/fj0;->e:Ljava/lang/Object;
    check-cast v8, Lp/vod0;
    new-instance v12, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;
    invoke-direct {v12, v10, v0}, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;-><init>(Landroid/app/Activity;Lp/tbn0;)V
    new-instance v9, Lp/fj0;
    invoke-direct {v9, v12, v8}, Lp/fj0;-><init>(Lp/tbn0;Lp/vod0;)V
    new-instance v11, Lapp/spicetify/extension/spotify/settings/nativebridge/RendererProvider;
    invoke-direct {v11, v9}, Lapp/spicetify/extension/spotify/settings/nativebridge/RendererProvider;-><init>(Lp/fj0;)V

    new-instance v0, Lp/bjf0;
    const/4 v1, -0x1
    new-instance v2, Lp/vcj1;
    const-string v3, "spicetify:settings"
    invoke-direct {v2, v3}, Lp/vcj1;-><init>(Ljava/lang/String;)V
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    move-result-object v3
    sget-object v4, Lp/y9x;->c:Lp/y9x;
    const-string v5, "Spicetify"
    const-string v6, "Preferences for installed patches"
    invoke-direct/range {v0 .. v6}, Lp/bjf0;-><init>(ILp/vcj1;Ljava/util/List;Lp/ugx;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v1, Lapp/spicetify/extension/spotify/settings/nativebridge/ModelFactory;
    invoke-direct {v1, v0}, Lapp/spicetify/extension/spotify/settings/nativebridge/ModelFactory;-><init>(Lp/bjf0;)V
    new-instance v12, Lp/rfo;
    invoke-direct {v12, v1}, Lp/rfo;-><init>(Lp/me30;)V

    # Lp/tfo; lost the second String of 9.1.80's Lp/ftl;: (icon, title, subtitle res, Lp/ndy0;, defaults mask).
    new-instance v0, Lp/tfo;
    const/4 v1, 0x0
    const-string v2, "Spicetify"
    const/4 v3, 0x0
    const/4 v4, 0x0
    const/4 v5, 0x0
    invoke-direct/range {v0 .. v5}, Lp/tfo;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Lp/ndy0;I)V
    move-object v2, v0
    new-instance v0, Lp/ufo;
    const-string v1, "spicetify_settings"
    sget-object v3, Lp/dhk1;->N0:Lp/dhk1;
    move-object v4, v11
    move-object v5, v12
    invoke-direct/range {v0 .. v5}, Lp/ufo;-><init>(Ljava/lang/String;Lp/tfo;Lp/ttf;Lp/ssx0;Lp/sfo;)V
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    return-void

    :invalid
    new-instance v0, Ljava/lang/IllegalStateException;
    const-string v1, "Unsupported Spotify settings renderer"
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
    throw v0
.end method
