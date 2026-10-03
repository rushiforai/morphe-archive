.class public final Lapp/spicetify/extension/spotify/settings/nativebridge/SettingsBridge;
.super Ljava/lang/Object;

.method public static append(Ljava/util/List;Lp/jto;)V
    .locals 13
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v0
    const-string v3, "spicetify_settings"
    :scan
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :construct
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    instance-of v2, v1, Lp/z521;
    if-eqz v2, :scan
    check-cast v1, Lp/z521;
    invoke-interface {v1}, Lp/z521;->getId()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :scan
    return-void

    :construct
    iget-byte v1, p1, Lp/jto;->a:B
    const/16 v2, 0x18
    if-ne v1, v2, :invalid
    iget-object v0, p1, Lp/jto;->c:Ljava/lang/Object;
    instance-of v1, v0, Lp/bec0;
    if-eqz v1, :invalid
    check-cast v0, Lp/bec0;
    iget-byte v1, v0, Lp/bec0;->a:B
    const/4 v2, 0x7
    if-ne v1, v2, :invalid
    iget-object v10, v0, Lp/bec0;->b:Ljava/lang/Object;
    check-cast v10, Landroid/app/Activity;
    iget-object v0, v0, Lp/bec0;->d:Ljava/lang/Object;
    check-cast v0, Lp/nz80;
    invoke-interface {v0}, Lp/nz80;->get()Ljava/lang/Object;
    move-result-object v11
    instance-of v0, v11, Lp/ti0;
    if-eqz v0, :invalid
    check-cast v11, Lp/ti0;
    iget-byte v0, v11, Lp/ti0;->a:B
    const/16 v1, 0x18
    if-ne v0, v1, :invalid
    iget-object v0, v11, Lp/ti0;->d:Ljava/lang/Object;
    check-cast v0, Lp/oqk0;
    iget-object v8, v11, Lp/ti0;->e:Ljava/lang/Object;
    check-cast v8, Lp/bec0;
    new-instance v12, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;
    invoke-direct {v12, v10, v0}, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;-><init>(Landroid/app/Activity;Lp/oqk0;)V
    new-instance v9, Lp/ti0;
    invoke-direct {v9, v12, v8}, Lp/ti0;-><init>(Lp/oqk0;Lp/bec0;)V
    new-instance v11, Lapp/spicetify/extension/spotify/settings/nativebridge/RendererProvider;
    invoke-direct {v11, v9}, Lapp/spicetify/extension/spotify/settings/nativebridge/RendererProvider;-><init>(Lp/ti0;)V

    new-instance v0, Lp/j7d0;
    const/4 v1, -0x1
    new-instance v2, Lp/yye1;
    const-string v3, "spicetify:settings"
    invoke-direct {v2, v3}, Lp/yye1;-><init>(Ljava/lang/String;)V
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    move-result-object v3
    sget-object v4, Lp/llv;->c:Lp/llv;
    const-string v5, "Spicetify"
    const-string v6, "Preferences for installed patches"
    invoke-direct/range {v0 .. v6}, Lp/j7d0;-><init>(ILp/yye1;Ljava/util/List;Lp/asv;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v1, Lapp/spicetify/extension/spotify/settings/nativebridge/ModelFactory;
    invoke-direct {v1, v0}, Lapp/spicetify/extension/spotify/settings/nativebridge/ModelFactory;-><init>(Lp/j7d0;)V
    new-instance v12, Lp/izm;
    invoke-direct {v12, v1}, Lp/izm;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lp/kzm;
    const/4 v1, 0x0
    const-string v2, "Spicetify"
    const/4 v3, 0x0
    const/4 v4, 0x0
    const/4 v5, 0x0
    invoke-direct/range {v0 .. v5}, Lp/kzm;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Lp/viv0;I)V
    move-object v2, v0
    new-instance v0, Lp/lzm;
    const-string v1, "spicetify_settings"
    sget-object v3, Lp/qlj0;->J0:Lp/qlj0;
    move-object v4, v11
    move-object v5, v12
    invoke-direct/range {v0 .. v5}, Lp/lzm;-><init>(Ljava/lang/String;Lp/kzm;Lp/ene;Lp/xqu0;Lp/jzm;)V
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    return-void

    :invalid
    new-instance v0, Ljava/lang/IllegalStateException;
    const-string v1, "Unsupported Spotify settings renderer"
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
    throw v0
.end method
