.class public final Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuBridge;
.super Ljava/lang/Object;

# Hooks T1 and T2 pass each context menu's frozen item list here, with the menu's CollectionTrack or
# CollectionArtist, just before the menu model (Lp/bjn;) is built from it. They get back a copy with
# one Spotify menu item (Lp/ygn;) per {id, title} that ExtensionMenus gives, with Encore's trash icon,
# or the original list when there is nothing to add or anything fails. Hook M1's PlaylistMenuProvider
# builds its item with item too.

.method public static track(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
    .locals 1
    const/4 v0, 0x0
    invoke-static {p0, p1, v0}, Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuBridge;->append(Ljava/util/List;Ljava/lang/Object;I)Ljava/util/List;
    move-result-object v0
    return-object v0
.end method

.method public static artist(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
    .locals 1
    const/4 v0, 0x1
    invoke-static {p0, p1, v0}, Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuBridge;->append(Ljava/util/List;Ljava/lang/Object;I)Ljava/util/List;
    move-result-object v0
    return-object v0
.end method

# p2 is MenuAction's menu: 0 for the track menu, 1 for the artist menu.
.method private static append(Ljava/util/List;Ljava/lang/Object;I)Ljava/util/List;
    .locals 4
    :try_start
    if-nez p2, :artist_items
    invoke-static {p1}, Lapp/spicetify/extension/spotify/extensions/ExtensionMenus;->trackItems(Ljava/lang/Object;)Ljava/util/List;
    move-result-object v2
    goto :have_items
    :artist_items
    invoke-static {p1}, Lapp/spicetify/extension/spotify/extensions/ExtensionMenus;->artistItems(Ljava/lang/Object;)Ljava/util/List;
    move-result-object v2
    :have_items
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :unchanged

    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    sget-object v3, Lp/c5z;->c:Lp/c5z;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v2
    :next_item
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :appended
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Ljava/lang/String;
    invoke-static {v1, p1, p2, v3}, Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuBridge;->item([Ljava/lang/String;Ljava/lang/Object;ILp/ldz;)Lp/ygn;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :next_item

    :appended
    return-object v0
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :failed

    :unchanged
    return-object p0

    :failed
    move-exception v0
    const-string v1, "Spicetify"
    const-string v2, "Couldn't add the Spicetify menu items"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-object p0
.end method

# The Spotify menu item for p0, {id, title}, with the icon p3, whose tap MenuAction hands to
# ExtensionMenus with p1 as the menu's target, for MenuAction's menu p2. Callers catch what it throws.
# Lp/ygn; takes exactly one title (the String, with titleRes null) and one icon. Its action is new
# Lp/xgn;(new Lp/ngn;(1), null, vgn, MenuAction, 0x12), built through the synthetic constructor like
# Spotify's own items (Lp/umj1;->c): mask 0x12 gives the default wgn and the empty map, and vgn, which
# only feeds analytics, can't be null.
# vgn is always new Lp/vgn;(Lp/pgd1;->Z, Lp/pgd1;->I0), the pair that Lp/umj1;->c gives songdna_about.
# It logs a tap as a constant ui_navigate hit to spotify:internal:songdna:about, with no entity of ours.
# Copying another item's vgn would log whatever that item logs: in the artist menu, the first item's
# is a follow or unfollow of that artist.
# 13 locals keep p0 to p2 at v13 to v15, where non-range invokes can reach them; p3 is v16.
.method public static item([Ljava/lang/String;Ljava/lang/Object;ILp/ldz;)Lp/ygn;
    .locals 13

    # v9 id, v8 title. The id is what a tap hands ExtensionMenus, still without the prefix added below.
    const/4 v0, 0x0
    aget-object v9, p0, v0
    const/4 v0, 0x1
    aget-object v8, p0, v0

    # v0 the action, built from v0 to v5: this, category, wgn, analytics, function, default mask.
    new-instance v0, Lp/xgn;
    new-instance v1, Lp/ngn;
    const/4 v2, 0x1
    invoke-direct {v1, v2}, Lp/ngn;-><init>(I)V
    const/4 v2, 0x0
    new-instance v3, Lp/vgn;
    sget-object v6, Lp/pgd1;->Z:Lp/pgd1;
    sget-object v7, Lp/pgd1;->I0:Lp/pgd1;
    invoke-direct {v3, v6, v7}, Lp/vgn;-><init>(Lp/en50;Lp/en50;)V
    new-instance v4, Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuAction;
    invoke-direct {v4, v9, p1, p2}, Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuAction;-><init>(Ljava/lang/String;Ljava/lang/Object;I)V
    const/16 v5, 0x12
    invoke-direct/range {v0 .. v5}, Lp/xgn;-><init>(Lp/bzs1;Lp/wgn;Lp/vgn;Lp/sn50;I)V
    move-object v12, v0

    # Menu item ids must be unique, since Compose keys on them.
    const-string v3, "spicetify_"
    invoke-virtual {v3, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4

    move-object/from16 v5, p3

    # v3 item, v4 id, v5 icon, v6 alternative icon, v7 titleRes, v8 title, v9 accessibility
    # resource, v10 enabled, v11 decoration, v12 action.
    const/4 v6, 0x0
    const/4 v7, 0x0
    const/4 v9, 0x0
    const/4 v10, 0x1
    const/4 v11, 0x0
    new-instance v3, Lp/ygn;
    invoke-direct/range {v3 .. v12}, Lp/ygn;-><init>(Ljava/lang/String;Lp/ldz;Lp/ugn;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;ZLp/qcc1;Lp/xgn;)V
    return-object v3
.end method
