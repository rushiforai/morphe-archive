.class public final Lapp/spicetify/extension/spotify/settings/nativebridge/SettingsBridge;
.super Ljava/lang/Object;

# Returns the rows of Settings' root page with the Spicetify row added just before the last one (Log out).
# The page is built as an array by Lp/ec2;->create and the hook passes its settings root and that array.
.method public static append(Lp/xir;[Lp/eaa1;)[Lp/eaa1;
    .locals 14
    const-string v3, "spicetify_settings"
    array-length v0, p1
    const/4 v1, 0x0
    :scan
    if-ge v1, v0, :construct
    aget-object v2, p1, v1
    add-int/lit8 v1, v1, 0x1
    if-eqz v2, :scan
    invoke-interface {v2}, Lp/eaa1;->getId()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :scan
    return-object p1

    :construct
    iget-object v0, p0, Lp/xir;->a:Ljava/lang/Object;
    instance-of v1, v0, Lp/lff0;
    if-eqz v1, :invalid
    check-cast v0, Lp/lff0;
    iget-byte v1, v0, Lp/lff0;->a:B
    const/16 v2, 0x19
    if-ne v1, v2, :invalid
    iget-object v10, v0, Lp/lff0;->b:Ljava/lang/Object;
    check-cast v10, Landroid/app/Activity;
    iget-object v0, v0, Lp/lff0;->d:Ljava/lang/Object;
    check-cast v0, Lp/akd0;
    invoke-interface {v0}, Lp/akd0;->get()Ljava/lang/Object;
    move-result-object v11
    instance-of v0, v11, Lp/ajp;
    if-eqz v0, :invalid
    check-cast v11, Lp/ajp;
    iget-byte v0, v11, Lp/ajp;->a:B
    const/16 v1, 0x1a
    if-ne v0, v1, :invalid
    iget-object v0, v11, Lp/ajp;->c:Ljava/lang/Object;
    check-cast v0, Lp/zkq0;
    iget-object v8, v11, Lp/ajp;->d:Ljava/lang/Object;
    check-cast v8, Lp/lff0;
    new-instance v12, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;
    invoke-direct {v12, v10, v0}, Lapp/spicetify/extension/spotify/settings/nativebridge/Navigator;-><init>(Landroid/app/Activity;Lp/zkq0;)V
    new-instance v9, Lp/ajp;
    invoke-direct {v9, v12, v8}, Lp/ajp;-><init>(Lp/zkq0;Lp/lff0;)V
    new-instance v11, Lapp/spicetify/extension/spotify/settings/nativebridge/RendererProvider;
    invoke-direct {v11, v9}, Lapp/spicetify/extension/spotify/settings/nativebridge/RendererProvider;-><init>(Lp/ajp;)V

    new-instance v0, Lp/g9i0;
    const/4 v1, -0x1
    new-instance v2, Lp/djo1;
    const-string v3, "spicetify:settings"
    invoke-direct {v2, v3}, Lp/djo1;-><init>(Ljava/lang/String;)V
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    move-result-object v3
    sget-object v4, Lp/k6z;->c:Lp/k6z;
    const-string v5, "Spicetify"
    const-string v6, "Preferences for installed patches"
    invoke-direct/range {v0 .. v6}, Lp/g9i0;-><init>(ILp/djo1;Ljava/util/List;Lp/ldz;Ljava/lang/String;Ljava/lang/String;)V
    new-instance v1, Lapp/spicetify/extension/spotify/settings/nativebridge/ModelFactory;
    invoke-direct {v1, v0}, Lapp/spicetify/extension/spotify/settings/nativebridge/ModelFactory;-><init>(Lp/g9i0;)V
    new-instance v12, Lp/xxp;
    invoke-direct {v12, v1}, Lp/xxp;-><init>(Lp/en50;)V

    new-instance v0, Lp/zxp;
    const/4 v1, 0x0
    const-string v2, "Spicetify"
    const/4 v3, 0x0
    const/4 v4, 0x0
    const/4 v5, 0x0
    invoke-direct/range {v0 .. v5}, Lp/zxp;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Lp/tf11;I)V
    move-object v2, v0
    new-instance v0, Lp/ayp;
    const-string v1, "spicetify_settings"
    sget-object v3, Lp/y5u1;->K0:Lp/y5u1;
    move-object v4, v11
    move-object v5, v12
    invoke-direct/range {v0 .. v5}, Lp/ayp;-><init>(Ljava/lang/String;Lp/zxp;Lp/vkg;Lp/zq11;Lp/yxp;)V

    array-length v1, p1
    if-eqz v1, :invalid
    add-int/lit8 v2, v1, 0x1
    new-array v2, v2, [Lp/eaa1;
    add-int/lit8 v3, v1, -0x1
    const/4 v4, 0x0
    invoke-static {p1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    aput-object v0, v2, v3
    aget-object v4, p1, v3
    aput-object v4, v2, v1
    return-object v2

    :invalid
    new-instance v0, Ljava/lang/IllegalStateException;
    const-string v1, "Unsupported Spotify settings renderer"
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
    throw v0
.end method
