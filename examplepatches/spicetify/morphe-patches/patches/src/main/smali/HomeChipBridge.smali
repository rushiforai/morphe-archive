.class public final Lapp/spicetify/extension/spotify/extensions/nativebridge/HomeChipBridge;
.super Ljava/lang/Object;

# Hooks A and B for Play a random song's pill in Home's filter row.
# A hands over the chips (Lp/ztx;) that the server's feeds became, right after Lp/xqw;->a rewrote
# them, and B offers each chip tap before its Lp/q8w; reaches Home's loop. HomeChips decides both;
# this only builds Spotify's chip.

# Hook A: the chips with the pill where HomeChips.chips puts it, or the same list if that fails.
# ztx is (a key, b title, c facet, d sub-chips, e highlight scheme, f highlight color, g animation).
# The pill's id is its key and its facet. Home iterates d, so it can't be null. e to g may be, as
# Lp/ocd1;->u leaves them for a plain feed.
.method public static chips(Ljava/util/List;)Ljava/util/List;
    .locals 8
    :try_start
    sget-object v1, Lapp/spicetify/extension/spotify/extensions/HomeChips;->PILL_ID:Ljava/lang/String;
    sget-object v2, Lapp/spicetify/extension/spotify/extensions/HomeChips;->PILL_TITLE:Ljava/lang/String;
    move-object v3, v1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    move-result-object v4
    const/4 v5, 0x0
    const/4 v6, 0x0
    const/4 v7, 0x0
    new-instance v0, Lp/ztx;
    invoke-direct/range {v0 .. v7}, Lp/ztx;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lp/ytx;Ljava/lang/String;Lp/xtx;)V
    invoke-static {p0, v0}, Lapp/spicetify/extension/spotify/extensions/HomeChips;->chips(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
    move-result-object v0
    return-object v0
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :failed

    :failed
    move-exception v0
    const-string v1, "Spicetify"
    const-string v2, "Couldn't add the Random pill to Home"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-object p0
.end method

# Hook B: true when HomeChips answered the tap on chip p0, so Home drops it and neither the
# selection nor the feed changes. False, so Home handles the tap, for any other chip or if that fails.
.method public static onTap(Ljava/lang/String;)Z
    .locals 3
    :try_start
    invoke-static {p0}, Lapp/spicetify/extension/spotify/extensions/HomeChips;->onTap(Ljava/lang/String;)Z
    move-result v0
    return v0
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :failed

    :failed
    move-exception v0
    const-string v1, "Spicetify"
    const-string v2, "Couldn't answer a tap on a Home chip"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    const/4 v0, 0x0
    return v0
.end method
