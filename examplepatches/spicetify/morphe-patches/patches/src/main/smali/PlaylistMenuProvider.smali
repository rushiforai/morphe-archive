.class public final Lapp/spicetify/extension/spotify/extensions/nativebridge/PlaylistMenuProvider;
.super Ljava/lang/Object;
.implements Lp/hhn;

# One more item provider for the list platform's context menu (Lp/mve0;), which serves playlists and
# Liked Songs. The menu asks each provider for its item with a, as a Flow, or with b when the remote
# flag use_suspend_item_provider is on. Either way this gives the item ExtensionMenus.playlistItem
# describes, built by MenuBridge.item with Encore's shuffle icon, or null, which the menu skips.

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

# Hook M1: a copy of the menu's item providers with one of these at the end, or the original list
# if that fails.
.method public static providers(Ljava/util/List;)Ljava/util/List;
    .locals 3
    :try_start
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    new-instance v1, Lapp/spicetify/extension/spotify/extensions/nativebridge/PlaylistMenuProvider;
    invoke-direct {v1}, Lapp/spicetify/extension/spotify/extensions/nativebridge/PlaylistMenuProvider;-><init>()V
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    return-object v0
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :failed

    :failed
    move-exception v0
    const-string v1, "Spicetify"
    const-string v2, "Couldn't add Shuffle+ to the playlist menu"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-object p0
.end method

# new Lp/mft;(item, 27) is flowOf(item): its collect emits the item, or null, once. The existing
# providers answer "no item" with new Lp/mft;(null, 27). The second argument is the data pool, unused.
.method public final a(Lp/t4l0;Lp/y6s;)Lp/wj40;
    .locals 3
    invoke-static {p1}, Lapp/spicetify/extension/spotify/extensions/nativebridge/PlaylistMenuProvider;->item(Lp/t4l0;)Lp/ygn;
    move-result-object v0
    new-instance v1, Lp/mft;
    const/16 v2, 0x1b
    invoke-direct {v1, v0, v2}, Lp/mft;-><init>(Ljava/lang/Object;B)V
    return-object v1
.end method

# The suspend form: returns the item, or null, at once, never Lp/ubo;->a (COROUTINE_SUSPENDED).
.method public final b(Lp/t4l0;Lp/k7s;Lp/dnn;)Ljava/lang/Object;
    .locals 1
    invoke-static {p1}, Lapp/spicetify/extension/spotify/extensions/nativebridge/PlaylistMenuProvider;->item(Lp/t4l0;)Lp/ygn;
    move-result-object v0
    return-object v0
.end method

# The item for the list whose uri is t4l0.a, which is Lp/cle0;->a, the uri the menu was opened for.
# Null when there is none or anything throws.
.method private static item(Lp/t4l0;)Lp/ygn;
    .locals 4
    :try_start
    iget-object v0, p0, Lp/t4l0;->a:Ljava/lang/String;
    invoke-static {v0}, Lapp/spicetify/extension/spotify/extensions/ExtensionMenus;->playlistItem(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :none
    const/4 v2, 0x2
    sget-object v3, Lp/gbz;->c:Lp/gbz;
    invoke-static {v1, v0, v2, v3}, Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuBridge;->item([Ljava/lang/String;Ljava/lang/Object;ILp/ldz;)Lp/ygn;
    move-result-object v0
    return-object v0
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :failed

    :none
    const/4 v0, 0x0
    return-object v0

    :failed
    move-exception v0
    const-string v1, "Spicetify"
    const-string v2, "Couldn't build the Shuffle+ playlist menu item"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    const/4 v0, 0x0
    return-object v0
.end method
