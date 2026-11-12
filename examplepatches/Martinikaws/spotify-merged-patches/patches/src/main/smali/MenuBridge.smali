.class public final Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuBridge;
.super Ljava/lang/Object;

# Hooks T1 and T2 pass each context menu's frozen item list here, with the menu's CollectionTrack or
# CollectionArtist, just before the menu model (Lp/o8m;, was Lp/krj;) is built from it. They get back a copy with
# one Spotify menu item (Lp/j6m;) per {id, title} that ExtensionMenus gives, with Encore's trash icon,
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
    sget-object v3, Lp/q8x;->c:Lp/q8x;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v2
    :next_item
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :appended
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Ljava/lang/String;
    invoke-static {v1, p1, p2, v3}, Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuBridge;->item([Ljava/lang/String;Ljava/lang/Object;ILp/ugx;)Lp/j6m;
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
# Spotify 9.1.94.1929 names (9.1.80.2221's in brackets): the item is Lp/j6m; [jpj], its action Lp/i6m; [ipj]
# built from new Lp/y5m;(1) [zoj], category Lp/h6m;->a DEFAULT [int 1], the analytics pair Lp/g6m; [hpj] and
# MenuAction. Lp/j6m; takes exactly one title (the String, with titleRes null) and one icon, Lp/q8x;->c
# [b1u.c], Encore's trash icon. The analytics pair can't be null.
# It is always new Lp/g6m;(Lp/sn81;->d1, Lp/sn81;->e1), the pair Lp/koe1;->c gives songdna_about. It
# logs a tap as a constant ui_navigate hit to spotify:internal:songdna:about, with no entity of ours.
# Copying another item's hpj would log whatever that item logs: in the artist menu, the first item's
# is a follow or unfollow of that artist.
# 13 locals keep p0 to p2 at v13 to v15, where non-range invokes can reach them; p3 is v16.
.method public static item([Ljava/lang/String;Ljava/lang/Object;ILp/ugx;)Lp/j6m;
    .locals 13
    new-instance v1, Lp/g6m;
    sget-object v3, Lp/sn81;->d1:Lp/sn81;
    sget-object v4, Lp/sn81;->e1:Lp/sn81;
    invoke-direct {v1, v3, v4}, Lp/g6m;-><init>(Lp/me30;Lp/me30;)V

    const/4 v6, 0x0
    aget-object v4, p0, v6
    const/4 v6, 0x1
    aget-object v8, p0, v6

    # A tap hands ExtensionMenus the id it gave, still without the prefix added below.
    new-instance v11, Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuAction;
    invoke-direct {v11, v4, p1, p2}, Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuAction;-><init>(Ljava/lang/String;Ljava/lang/Object;I)V
    const/4 v9, 0x1
    new-instance v10, Lp/y5m;
    invoke-direct {v10, v9}, Lp/y5m;-><init>(I)V
    sget-object v9, Lp/h6m;->a:Lp/h6m;
    new-instance v12, Lp/i6m;
    invoke-direct {v12, v10, v9, v1, v11}, Lp/i6m;-><init>(Lp/ijm1;Lp/h6m;Lp/g6m;Lp/me30;)V

    # Menu item ids must be unique, since Compose keys on them.
    const-string v3, "spicetify_"
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4

    move-object/from16 v5, p3

    # v3 item, v4 id, v5 icon, v6 alternative icon, v7 titleRes, v8 title, v9 accessibility
    # resource, v10 enabled, v11 decoration, v12 action.
    const/4 v6, 0x0
    const/4 v7, 0x0
    const/4 v9, 0x0
    const/4 v10, 0x1
    const/4 v11, 0x0
    new-instance v3, Lp/j6m;
    invoke-direct/range {v3 .. v12}, Lp/j6m;-><init>(Ljava/lang/String;Lp/ugx;Lp/f6m;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;ZLp/pm71;Lp/i6m;)V
    return-object v3
.end method
