.class public final Lapp/spicetify/extension/spotify/settings/nativebridge/SettingsBridge;
.super Ljava/lang/Object;

.method public static append(Ljava/util/List;Lp/dns;)V
    .locals 7
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v0
    const-string v3, "spicetify_settings"
    :scan
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :construct
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    instance-of v2, v1, Lp/sq61;
    if-eqz v2, :scan
    check-cast v1, Lp/sq61;
    invoke-interface {v1}, Lp/sq61;->getId()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :scan
    return-void

    :construct
    iget-byte v0, p1, Lp/dns;->a:B
    const/4 v1, 0x2
    if-ne v0, v1, :invalid
    iget-object v0, p1, Lp/dns;->b:Ljava/lang/Object;
    instance-of v1, v0, Lp/g2z;
    if-eqz v1, :invalid
    check-cast v0, Lp/g2z;
    iget-object v6, v0, Lp/g2z;->f:Ljava/lang/Object;
    instance-of v0, v6, Lp/o3e0;
    if-eqz v0, :invalid
    check-cast v6, Lp/o3e0;
    iget-byte v0, v6, Lp/o3e0;->a:B
    const/16 v1, 0xd
    if-ne v0, v1, :invalid
    iget-object v0, v6, Lp/o3e0;->b:Ljava/lang/Object;
    instance-of v1, v0, Landroid/app/Activity;
    if-eqz v1, :invalid

    new-instance v0, Lp/uqo;
    const/4 v1, 0x0
    const-string v2, "Spicetify"
    const/4 v3, 0x0
    const/4 v4, 0x0
    const/16 v5, 0x1d
    invoke-direct/range {v0 .. v5}, Lp/uqo;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Lp/ks21;I)V
    move-object v2, v0

    new-instance v4, Lp/bsn;
    const/4 v0, 0x3
    invoke-direct {v4, v6, v0}, Lp/bsn;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lapp/spicetify/extension/spotify/settings/nativebridge/ClickAction;
    iget-object v0, v6, Lp/o3e0;->b:Ljava/lang/Object;
    check-cast v0, Landroid/app/Activity;
    invoke-direct {v1, v0}, Lapp/spicetify/extension/spotify/settings/nativebridge/ClickAction;-><init>(Landroid/app/Activity;)V
    new-instance v5, Lp/sqo;
    invoke-direct {v5, v1}, Lp/sqo;-><init>(Lp/iu30;)V

    new-instance v0, Lp/vqo;
    const-string v1, "spicetify_settings"
    sget-object v3, Lp/pbo1;->N0:Lp/pbo1;
    invoke-direct/range {v0 .. v5}, Lp/vqo;-><init>(Ljava/lang/String;Lp/uqo;Lp/c0g;Lp/kly0;Lp/tqo;)V
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    return-void

    :invalid
    new-instance v0, Ljava/lang/IllegalStateException;
    const-string v1, "Unsupported Spotify settings renderer"
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
    throw v0
.end method
