.class public final Lapp/spicetify/extension/spotify/extensions/nativebridge/PlaylistMenuProvider;
.super Ljava/lang/Object;
.implements Lp/n5m;

# One more item provider for the list platform's context menu (Lp/kfc0;, was Lp/sv70;), which serves
# playlists and Liked Songs. Spotify 9.1.94.1929's provider interface Lp/n5m; (was Lp/spj;) swapped its
# method names and added a parameter: b is the Flow form, a the suspend form. Either way this gives the item
# ExtensionMenus.playlistItem describes, built by MenuBridge.item with Encore's shuffle icon, or null, which
# the menu skips.

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

# new Lp/zl00;(item, 9) is flowOf(item) (was new Lp/yao;(item, 22)): its collect emits the item, or null,
# once. The existing providers (Lp/c93;, Lp/dca1;) answer "no item" with new Lp/zl00;(null, 9).
.method public final b(Lp/b9i0;Lp/hpq;)Lp/uc20;
    .locals 3
    invoke-static {p1}, Lapp/spicetify/extension/spotify/extensions/nativebridge/PlaylistMenuProvider;->item(Lp/b9i0;)Lp/j6m;
    move-result-object v0
    new-instance v1, Lp/zl00;
    const/16 v2, 0x9
    invoke-direct {v1, v0, v2}, Lp/zl00;-><init>(Ljava/lang/Object;B)V
    return-object v1
.end method

# The suspend form: returns the item, or null, at once, never COROUTINE_SUSPENDED.
.method public final a(Lp/b9i0;Lp/hpq;Lp/lcm;)Ljava/lang/Object;
    .locals 1
    invoke-static {p1}, Lapp/spicetify/extension/spotify/extensions/nativebridge/PlaylistMenuProvider;->item(Lp/b9i0;)Lp/j6m;
    move-result-object v0
    return-object v0
.end method

# The item for the list whose uri is b9i0.a (was w9d0.a), the uri the menu was opened for.
# Null when there is none or anything throws.
.method private static item(Lp/b9i0;)Lp/j6m;
    .locals 4
    :try_start
    iget-object v0, p0, Lp/b9i0;->a:Ljava/lang/String;
    invoke-static {v0}, Lapp/spicetify/extension/spotify/extensions/ExtensionMenus;->playlistItem(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :none
    const/4 v2, 0x2
    sget-object v3, Lp/tex;->c:Lp/tex;
    invoke-static {v1, v0, v2, v3}, Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuBridge;->item([Ljava/lang/String;Ljava/lang/Object;ILp/ugx;)Lp/j6m;
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
