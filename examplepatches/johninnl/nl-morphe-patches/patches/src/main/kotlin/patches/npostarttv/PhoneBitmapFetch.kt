package patches.npostarttv

// The phone's protected Cast FetchBitmapTask delegates artwork loading to the
// existing IFetchBitmapTask Binder proxy. Keep its real URI, reply and bitmap;
// the original onPostExecute still notifies listeners and clears the task.
internal val phoneBitmapFetchCode = """
    check-cast p1, [Landroid/net/Uri;
    array-length v0, p1
    const/4 v1, 0x1
    if-ne v0, v1, :bitmap_empty
    const/4 v0, 0x0
    aget-object v1, p1, v0
    if-eqz v1, :bitmap_empty
    iget-object v2, p0, Lnl/npo/player/library/ll/c;->a:Lnl/npo/player/library/ll/f;
    if-eqz v2, :bitmap_empty
    check-cast v2, Lnl/npo/player/library/im/a;
    const/4 v0, 0x0
    const/4 v3, 0x0
    :bitmap_try_start
    invoke-virtual {v2}, Lnl/npo/player/library/im/a;->R()Landroid/os/Parcel;
    move-result-object v3
    const/4 v4, 0x1
    invoke-virtual {v3, v4}, Landroid/os/Parcel;->writeInt(I)V
    const/4 v4, 0x0
    invoke-virtual {v1, v3, v4}, Landroid/net/Uri;->writeToParcel(Landroid/os/Parcel;I)V
    move-object v4, v3
    const/4 v3, 0x0
    const/4 v1, 0x1
    invoke-virtual {v2, v1, v4}, Lnl/npo/player/library/im/a;->S(ILandroid/os/Parcel;)Landroid/os/Parcel;
    move-result-object v0
    sget-object v1, Landroid/graphics/Bitmap;->CREATOR:Landroid/os/Parcelable${'$'}Creator;
    invoke-static {v0, v1}, Lnl/npo/player/library/im/b;->a(Landroid/os/Parcel;Landroid/os/Parcelable${'$'}Creator;)Landroid/os/Parcelable;
    move-result-object v1
    check-cast v1, Landroid/graphics/Bitmap;
    :bitmap_try_end
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    return-object v1
    :bitmap_remote
    move-exception v1
    if-eqz v0, :bitmap_remote_request
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :bitmap_remote_request
    if-eqz v3, :bitmap_remote_log
    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V
    :bitmap_remote_log
    sget-object v0, Lnl/npo/player/library/ll/c;->c:Lnl/npo/player/library/ol/b;
    const/4 v2, 0x2
    new-array v2, v2, [Ljava/lang/Object;
    const/4 v3, 0x0
    const-string v4, "doFetch"
    aput-object v4, v2, v3
    const/4 v3, 0x1
    const-class v4, Lnl/npo/player/library/ll/f;
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v4
    aput-object v4, v2, v3
    const-string v3, "Unable to call %s on %s."
    invoke-virtual {v0, v1, v3, v2}, Lnl/npo/player/library/ol/b;->a(Ljava/lang/Exception;Ljava/lang/String;[Ljava/lang/Object;)V
    :bitmap_empty
    const/4 v0, 0x0
    return-object v0
    :bitmap_failure
    move-exception v1
    if-eqz v0, :bitmap_failure_request
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :bitmap_failure_request
    if-eqz v3, :bitmap_rethrow
    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V
    :bitmap_rethrow
    throw v1
    .catch Landroid/os/RemoteException; {:bitmap_try_start .. :bitmap_try_end} :bitmap_remote
    .catchall {:bitmap_try_start .. :bitmap_try_end} :bitmap_failure
""".trimIndent()
