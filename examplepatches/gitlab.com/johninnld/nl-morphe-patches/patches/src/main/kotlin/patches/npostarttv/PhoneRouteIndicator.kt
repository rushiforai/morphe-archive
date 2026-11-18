package patches.npostarttv

// AndroidX MediaRouter 1.8.1 RemoteIndicatorLoader: inflate only on a cache miss.
// A cache hit returns null so the unchanged main-thread onPostExecute clones
// the cached ConstantState and installs the drawable in the Cast button.
internal val phoneRouteIndicatorCode = """
    check-cast p1, [Ljava/lang/Void;
    sget-object v0, Lnl/npo/player/library/m9/b;->w:Landroid/util/SparseArray;
    iget v1, p0, Lnl/npo/player/library/m9/a;->a:I
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/graphics/drawable/Drawable${'$'}ConstantState;
    if-nez v0, :indicator_cached
    iget-object v0, p0, Lnl/npo/player/library/m9/a;->b:Landroid/content/Context;
    invoke-static {v0, v1}, Lnl/npo/player/library/ly/a;->l(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    move-result-object v0
    return-object v0
    :indicator_cached
    const/4 v0, 0x0
    return-object v0
""".trimIndent()
