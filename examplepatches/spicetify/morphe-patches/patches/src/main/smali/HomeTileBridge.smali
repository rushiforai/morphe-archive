.class public final Lapp/spicetify/extension/spotify/home/nativebridge/HomeTileBridge;
.super Ljava/lang/Object;

# The Home pins hook hands over each shortcut type section's id and Spotify's capped rows (Lp/goz0;)
# at Lp/joz0;-><init> index 1, before the model stores them. HomePins.plan decides the rows; this
# only builds Spotify's tile for a pin Spotify didn't send.

# p0 is the section id and p1 the rows. The answer is HomePins.plan's list, where each String[]
# {uri, title, image} becomes new Lp/goz0;(new Lp/nnz0;(uri, 0, title, image, false, uri)). nnz0 is
# (a link, f hide source, b title, c image, e badge, d entity), as Lp/jne1;->u 279 builds it. f 0 leaves
# out "Remove from this section", and e false the badge. Null, or anything failing, keeps p1.
.method public static apply(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 9
    :try_start
    invoke-static {p0, p1}, Lapp/spicetify/extension/spotify/home/HomePins;->plan(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/List;
    move-result-object v7
    if-eqz v7, :unchanged
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v7

    :next_row
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z
    move-result v0
    if-eqz v0, :planned
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v0
    instance-of v1, v0, [Ljava/lang/String;
    if-eqz v1, :add_row
    check-cast v0, [Ljava/lang/String;
    const/4 v2, 0x0
    aget-object v1, v0, v2
    const/4 v2, 0x1
    aget-object v3, v0, v2
    const/4 v2, 0x2
    aget-object v4, v0, v2

    # v0 tile, v1 a, v2 f, v3 b, v4 c, v5 e, v6 d.
    const/4 v2, 0x0
    const/4 v5, 0x0
    move-object v6, v1
    new-instance v0, Lp/nnz0;
    invoke-direct/range {v0 .. v6}, Lp/nnz0;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    new-instance v1, Lp/goz0;
    invoke-direct {v1, v0}, Lp/goz0;-><init>(Lp/nnz0;)V
    move-object v0, v1

    :add_row
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :next_row

    :planned
    return-object v8
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :failed

    :unchanged
    return-object p1

    :failed
    move-exception v0
    const-string v1, "Spicetify"
    const-string v2, "Couldn't add the pinned shortcuts to Home"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-object p1
.end method
