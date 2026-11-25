package patches.flitsmeister

/** Library lifecycles reconstructed from the genuine 14.17 bodies, publisher
 * 15.0 ordered accessor delegates, native bindings and window-cache semantics.
 * Preserve download dispatch/START_STICKY, media controls, overlay actions,
 * notification behavior, synchronized cleanup and all eight exception entries.
 */

internal const val downloadServiceOnStartCommandRegisterCount15 = 11

internal val downloadServiceOnStartCommand15 = """
    iput p3, p0, Landroidx/media3/exoplayer/offline/DownloadService;->lastStartId:I
    const/4 p2, 0x0
    iput-boolean p2, p0, Landroidx/media3/exoplayer/offline/DownloadService;->taskRemoved:Z
    const-string p3, "androidx.media3.exoplayer.downloadService.action.RESTART"
    const/4 v0, 0x1
    if-eqz p1, :cond_2
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v1
    const-string v2, "content_id"
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    iget-boolean v3, p0, Landroidx/media3/exoplayer/offline/DownloadService;->startedInForeground:Z
    const-string v4, "foreground"
    invoke-virtual {p1, v4, p2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v4
    if-nez v4, :cond_1
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :cond_0
    goto :goto_0
    :cond_0
    move v4, p2
    goto :goto_1
    :cond_1
    :goto_0
    move v4, v0
    :goto_1
    or-int/2addr v3, v4
    iput-boolean v3, p0, Landroidx/media3/exoplayer/offline/DownloadService;->startedInForeground:Z
    goto :goto_2
    :cond_2
    const/4 v1, 0x0
    move-object v2, v1
    :goto_2
    const-string v3, "androidx.media3.exoplayer.downloadService.action.INIT"
    if-nez v1, :cond_3
    move-object v1, v3
    :cond_3
    iget-object v4, p0, Landroidx/media3/exoplayer/offline/DownloadService;->downloadManagerHelper:Landroidx/media3/exoplayer/offline/DownloadService${'$'}DownloadManagerHelper;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-static {v4}, Landroidx/media3/exoplayer/offline/DownloadService${'$'}DownloadManagerHelper;->access${'$'}100(Landroidx/media3/exoplayer/offline/DownloadService${'$'}DownloadManagerHelper;)Landroidx/media3/exoplayer/offline/DownloadManager;
    move-result-object v4
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I
    move-result v5
    const/4 v6, -0x1
    sparse-switch v5, :sswitch_data_0
    goto/16 :goto_3
    :sswitch_0
    const-string p3, "androidx.media3.exoplayer.downloadService.action.PAUSE_DOWNLOADS"
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-nez p3, :cond_4
    goto/16 :goto_3
    :cond_4
    const/16 v6, 0x8
    goto/16 :goto_3
    :sswitch_1
    const-string p3, "androidx.media3.exoplayer.downloadService.action.SET_REQUIREMENTS"
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-nez p3, :cond_5
    goto :goto_3
    :cond_5
    const/4 v6, 0x7
    goto :goto_3
    :sswitch_2
    const-string p3, "androidx.media3.exoplayer.downloadService.action.ADD_DOWNLOAD"
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-nez p3, :cond_6
    goto :goto_3
    :cond_6
    const/4 v6, 0x6
    goto :goto_3
    :sswitch_3
    const-string p3, "androidx.media3.exoplayer.downloadService.action.REMOVE_ALL_DOWNLOADS"
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-nez p3, :cond_7
    goto :goto_3
    :cond_7
    const/4 v6, 0x5
    goto :goto_3
    :sswitch_4
    const-string p3, "androidx.media3.exoplayer.downloadService.action.RESUME_DOWNLOADS"
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-nez p3, :cond_8
    goto :goto_3
    :cond_8
    const/4 v6, 0x4
    goto :goto_3
    :sswitch_5
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-nez p3, :cond_9
    goto :goto_3
    :cond_9
    const/4 v6, 0x3
    goto :goto_3
    :sswitch_6
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-nez p3, :cond_a
    goto :goto_3
    :cond_a
    const/4 v6, 0x2
    goto :goto_3
    :sswitch_7
    const-string p3, "androidx.media3.exoplayer.downloadService.action.REMOVE_DOWNLOAD"
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-nez p3, :cond_b
    goto :goto_3
    :cond_b
    move v6, v0
    goto :goto_3
    :sswitch_8
    const-string p3, "androidx.media3.exoplayer.downloadService.action.SET_STOP_REASON"
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-nez p3, :cond_c
    goto :goto_3
    :cond_c
    move v6, p2
    :goto_3
    const-string p3, "stop_reason"
    const-string v3, "DownloadService"
    packed-switch v6, :pswitch_data_0
    const-string p1, "Ignored unrecognized action: "
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-static {v3, p1}, Landroidx/media3/common/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    goto :goto_4
    :pswitch_0
    invoke-virtual {v4}, Landroidx/media3/exoplayer/offline/DownloadManager;->pauseDownloads()V
    goto :goto_4
    :pswitch_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    const-string p3, "requirements"
    invoke-virtual {p1, p3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;
    move-result-object p1
    check-cast p1, Landroidx/media3/exoplayer/scheduler/Requirements;
    if-nez p1, :cond_d
    const-string p1, "Ignored SET_REQUIREMENTS: Missing requirements extra"
    invoke-static {v3, p1}, Landroidx/media3/common/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    goto :goto_4
    :cond_d
    invoke-virtual {v4, p1}, Landroidx/media3/exoplayer/offline/DownloadManager;->setRequirements(Landroidx/media3/exoplayer/scheduler/Requirements;)V
    goto :goto_4
    :pswitch_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    const-string v1, "download_request"
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;
    move-result-object v1
    check-cast v1, Landroidx/media3/exoplayer/offline/DownloadRequest;
    if-nez v1, :cond_e
    const-string p1, "Ignored ADD_DOWNLOAD: Missing download_request extra"
    invoke-static {v3, p1}, Landroidx/media3/common/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    goto :goto_4
    :cond_e
    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result p1
    invoke-virtual {v4, v1, p1}, Landroidx/media3/exoplayer/offline/DownloadManager;->addDownload(Landroidx/media3/exoplayer/offline/DownloadRequest;I)V
    goto :goto_4
    :pswitch_3
    invoke-virtual {v4}, Landroidx/media3/exoplayer/offline/DownloadManager;->removeAllDownloads()V
    goto :goto_4
    :pswitch_4
    invoke-virtual {v4}, Landroidx/media3/exoplayer/offline/DownloadManager;->resumeDownloads()V
    goto :goto_4
    :pswitch_5
    if-nez v2, :cond_f
    const-string p1, "Ignored REMOVE_DOWNLOAD: Missing content_id extra"
    invoke-static {v3, p1}, Landroidx/media3/common/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    goto :goto_4
    :cond_f
    invoke-virtual {v4, v2}, Landroidx/media3/exoplayer/offline/DownloadManager;->removeDownload(Ljava/lang/String;)V
    goto :goto_4
    :pswitch_6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {p1, p3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :cond_10
    const-string p1, "Ignored SET_STOP_REASON: Missing stop_reason extra"
    invoke-static {v3, p1}, Landroidx/media3/common/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    goto :goto_4
    :cond_10
    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result p1
    invoke-virtual {v4, v2, p1}, Landroidx/media3/exoplayer/offline/DownloadManager;->setStopReason(Ljava/lang/String;I)V
    :goto_4
    :pswitch_7
    iget-boolean p1, p0, Landroidx/media3/exoplayer/offline/DownloadService;->startedInForeground:Z
    if-eqz p1, :cond_11
    iget-object p1, p0, Landroidx/media3/exoplayer/offline/DownloadService;->foregroundNotificationUpdater:Landroidx/media3/exoplayer/offline/DownloadService${'$'}ForegroundNotificationUpdater;
    if-eqz p1, :cond_11
    invoke-virtual {p1}, Landroidx/media3/exoplayer/offline/DownloadService${'$'}ForegroundNotificationUpdater;->showNotificationIfNotAlready()V
    :cond_11
    iput-boolean p2, p0, Landroidx/media3/exoplayer/offline/DownloadService;->isStopped:Z
    invoke-virtual {v4}, Landroidx/media3/exoplayer/offline/DownloadManager;->isIdle()Z
    move-result p1
    if-eqz p1, :cond_12
    invoke-direct {p0}, Landroidx/media3/exoplayer/offline/DownloadService;->onIdle()V
    :cond_12
    return v0
    nop
    :sswitch_data_0
    .sparse-switch
    -0x7b47cdc8 -> :sswitch_8
    -0x47112489 -> :sswitch_7
    -0x274df87d -> :sswitch_6
    -0xe367804 -> :sswitch_5
    0x1f2a425 -> :sswitch_4
    0x1bab7dfe -> :sswitch_3
    0x3175ed72 -> :sswitch_2
    0x3267e259 -> :sswitch_1
    0x6815b736 -> :sswitch_0
    .end sparse-switch
    :pswitch_data_0
    .packed-switch 0x0
    :pswitch_6
    :pswitch_5
    :pswitch_7
    :pswitch_7
    :pswitch_4
    :pswitch_3
    :pswitch_2
    :pswitch_1
    :pswitch_0
    .end packed-switch
""".trimIndent()

internal const val playerNotificationReceiverOnReceiveRegisterCount15 = 5

internal val playerNotificationReceiverOnReceive15 = """
    iget-object p1, p0, Landroidx/media3/ui/PlayerNotificationManager${'$'}NotificationBroadcastReceiver;->this${'$'}0:Landroidx/media3/ui/PlayerNotificationManager;
    invoke-static {p1}, Landroidx/media3/ui/PlayerNotificationManager;->access${'$'}500(Landroidx/media3/ui/PlayerNotificationManager;)Landroidx/media3/common/Player;
    move-result-object p1
    if-eqz p1, :cond_a
    iget-object v0, p0, Landroidx/media3/ui/PlayerNotificationManager${'$'}NotificationBroadcastReceiver;->this${'$'}0:Landroidx/media3/ui/PlayerNotificationManager;
    invoke-static {v0}, Landroidx/media3/ui/PlayerNotificationManager;->access${'$'}600(Landroidx/media3/ui/PlayerNotificationManager;)Z
    move-result v0
    if-eqz v0, :cond_a
    iget-object v0, p0, Landroidx/media3/ui/PlayerNotificationManager${'$'}NotificationBroadcastReceiver;->this${'$'}0:Landroidx/media3/ui/PlayerNotificationManager;
    invoke-static {v0}, Landroidx/media3/ui/PlayerNotificationManager;->access${'$'}700(Landroidx/media3/ui/PlayerNotificationManager;)I
    move-result v0
    const-string v1, "INSTANCE_ID"
    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v0
    iget-object v1, p0, Landroidx/media3/ui/PlayerNotificationManager${'$'}NotificationBroadcastReceiver;->this${'$'}0:Landroidx/media3/ui/PlayerNotificationManager;
    invoke-static {v1}, Landroidx/media3/ui/PlayerNotificationManager;->access${'$'}700(Landroidx/media3/ui/PlayerNotificationManager;)I
    move-result v1
    if-eq v0, v1, :cond_0
    goto/16 :goto_0
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v0
    const-string v1, "androidx.media3.ui.notification.play"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_1
    invoke-static {p1}, Landroidx/media3/common/util/Util;->handlePlayButtonAction(Landroidx/media3/common/Player;)Z
    return-void
    :cond_1
    const-string v1, "androidx.media3.ui.notification.pause"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_2
    invoke-static {p1}, Landroidx/media3/common/util/Util;->handlePauseButtonAction(Landroidx/media3/common/Player;)Z
    return-void
    :cond_2
    const-string v1, "androidx.media3.ui.notification.prev"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_3
    const/4 p0, 0x7
    invoke-interface {p1, p0}, Landroidx/media3/common/Player;->isCommandAvailable(I)Z
    move-result p0
    if-eqz p0, :cond_a
    invoke-interface {p1}, Landroidx/media3/common/Player;->seekToPrevious()V
    return-void
    :cond_3
    const-string v1, "androidx.media3.ui.notification.rewind"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_4
    const/16 p0, 0xb
    invoke-interface {p1, p0}, Landroidx/media3/common/Player;->isCommandAvailable(I)Z
    move-result p0
    if-eqz p0, :cond_a
    invoke-interface {p1}, Landroidx/media3/common/Player;->seekBack()V
    return-void
    :cond_4
    const-string v1, "androidx.media3.ui.notification.ffwd"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_5
    const/16 p0, 0xc
    invoke-interface {p1, p0}, Landroidx/media3/common/Player;->isCommandAvailable(I)Z
    move-result p0
    if-eqz p0, :cond_a
    invoke-interface {p1}, Landroidx/media3/common/Player;->seekForward()V
    return-void
    :cond_5
    const-string v1, "androidx.media3.ui.notification.next"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_6
    const/16 p0, 0x9
    invoke-interface {p1, p0}, Landroidx/media3/common/Player;->isCommandAvailable(I)Z
    move-result p0
    if-eqz p0, :cond_a
    invoke-interface {p1}, Landroidx/media3/common/Player;->seekToNext()V
    return-void
    :cond_6
    const-string v1, "androidx.media3.ui.notification.stop"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_8
    const/4 p0, 0x3
    invoke-interface {p1, p0}, Landroidx/media3/common/Player;->isCommandAvailable(I)Z
    move-result p0
    if-eqz p0, :cond_7
    invoke-interface {p1}, Landroidx/media3/common/Player;->stop()V
    :cond_7
    const/16 p0, 0x14
    invoke-interface {p1, p0}, Landroidx/media3/common/Player;->isCommandAvailable(I)Z
    move-result p0
    if-eqz p0, :cond_a
    invoke-interface {p1}, Landroidx/media3/common/Player;->clearMediaItems()V
    return-void
    :cond_8
    const-string v1, "androidx.media3.ui.notification.dismiss"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_9
    iget-object p0, p0, Landroidx/media3/ui/PlayerNotificationManager${'$'}NotificationBroadcastReceiver;->this${'$'}0:Landroidx/media3/ui/PlayerNotificationManager;
    const/4 p1, 0x1
    invoke-static {p0, p1}, Landroidx/media3/ui/PlayerNotificationManager;->access${'$'}800(Landroidx/media3/ui/PlayerNotificationManager;Z)V
    return-void
    :cond_9
    if-eqz v0, :cond_a
    iget-object v1, p0, Landroidx/media3/ui/PlayerNotificationManager${'$'}NotificationBroadcastReceiver;->this${'$'}0:Landroidx/media3/ui/PlayerNotificationManager;
    invoke-static {v1}, Landroidx/media3/ui/PlayerNotificationManager;->access${'$'}900(Landroidx/media3/ui/PlayerNotificationManager;)Landroidx/media3/ui/PlayerNotificationManager${'$'}CustomActionReceiver;
    move-result-object v1
    if-eqz v1, :cond_a
    iget-object v1, p0, Landroidx/media3/ui/PlayerNotificationManager${'$'}NotificationBroadcastReceiver;->this${'$'}0:Landroidx/media3/ui/PlayerNotificationManager;
    invoke-static {v1}, Landroidx/media3/ui/PlayerNotificationManager;->access${'$'}1000(Landroidx/media3/ui/PlayerNotificationManager;)Ljava/util/Map;
    move-result-object v1
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_a
    iget-object p0, p0, Landroidx/media3/ui/PlayerNotificationManager${'$'}NotificationBroadcastReceiver;->this${'$'}0:Landroidx/media3/ui/PlayerNotificationManager;
    invoke-static {p0}, Landroidx/media3/ui/PlayerNotificationManager;->access${'$'}900(Landroidx/media3/ui/PlayerNotificationManager;)Landroidx/media3/ui/PlayerNotificationManager${'$'}CustomActionReceiver;
    move-result-object p0
    invoke-interface {p0, p1, v0, p2}, Landroidx/media3/ui/PlayerNotificationManager${'$'}CustomActionReceiver;->onCustomAction(Landroidx/media3/common/Player;Ljava/lang/String;Landroid/content/Intent;)V
    :cond_a
    :goto_0
    return-void
""".trimIndent()

internal const val standOutWindowOnStartCommandRegisterCount15 = 10

internal val standOutWindowOnStartCommand15 = """
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I
    if-eqz p1, :cond_10
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object p2
    const-string p3, "id"
    const/4 v0, 0x0
    invoke-virtual {p1, p3, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result p3
    const/4 v1, -0x1
    if-eq p3, v1, :cond_f
    const-string v2, "SHOW"
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :cond_7
    const-string v2, "RESTORE"
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :cond_0
    goto :goto_2
    :cond_0
    const-string v1, "HIDE"
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_1
    invoke-virtual {p0, p3}, Lwei/mark/standout/StandOutWindow;->n(I)V
    goto/16 :goto_7
    :cond_1
    const-string v1, "CLOSE"
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_2
    invoke-virtual {p0, p3}, Lwei/mark/standout/StandOutWindow;->b(I)V
    goto/16 :goto_7
    :cond_2
    const-string v1, "CLOSE_ALL"
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_3
    invoke-virtual {p0}, Lwei/mark/standout/StandOutWindow;->c()V
    goto/16 :goto_7
    :cond_3
    const-string v1, "SEND_DATA"
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :cond_11
    sget-object p2, Lwei/mark/standout/StandOutWindow;->q:Lfi5;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object p0
    iget-object p2, p2, Lfi5;->a:Ljava/lang/Object;
    check-cast p2, Ljava/util/HashMap;
    invoke-virtual {p2, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroid/util/SparseArray;
    if-nez p0, :cond_4
    const/4 p0, 0x0
    goto :goto_0
    :cond_4
    invoke-virtual {p0, p3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lbuk;
    :goto_0
    if-eqz p0, :cond_5
    goto :goto_1
    :cond_5
    const/4 p0, -0x2
    if-eq p3, p0, :cond_6
    const-string p0, "StandOutWindow"
    const-string p2, "Sending data to non-existant window. If this is not intended, make sure toId is either an existing window\'s id or DISREGARD_ID."
    invoke-static {p0, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :cond_6
    :goto_1
    const-string p0, "wei.mark.standout.data"
    invoke-virtual {p1, p0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;
    const-string p0, "requestCode"
    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    const-string p0, "wei.mark.standout.fromCls"
    invoke-virtual {p1, p0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;
    move-result-object p0
    check-cast p0, Ljava/lang/Class;
    const-string p0, "fromId"
    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    goto/16 :goto_7
    :cond_7
    :goto_2
    const-string p1, "Exception while starting StandOutWindow service: "
    monitor-enter p0
    :try_start_0
    invoke-virtual {p0, p3}, Lwei/mark/standout/StandOutWindow;->m(I)Lbuk;
    move-result-object p2
    if-eqz p2, :cond_8
    goto :goto_3
    :cond_8
    new-instance p2, Lbuk;
    invoke-direct {p2, p0, p3}, Lbuk;-><init>(Lwei/mark/standout/StandOutWindow;I)V
    :goto_3
    invoke-virtual {p0}, Lwei/mark/standout/StandOutWindow;->q()V
    iget v2, p2, Lbuk;->b:I
    const/4 v3, 0x1
    if-ne v2, v3, :cond_9
    invoke-virtual {p0, p3}, Lwei/mark/standout/StandOutWindow;->e(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    monitor-exit p0
    goto/16 :goto_7
    :catchall_0
    move-exception p1
    goto/16 :goto_6
    :cond_9
    :try_start_1
    iput v3, p2, Lbuk;->b:I
    const/high16 v2, 0x10a0000
    invoke-static {p0, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;
    move-result-object v2
    invoke-virtual {p2}, Lbuk;->a()Lwei/mark/standout/StandOutWindow${'$'}StandOutLayoutParams;
    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    :try_start_2
    iget-object v5, p0, Lwei/mark/standout/StandOutWindow;->a:Landroid/view/WindowManager;
    invoke-interface {v5, p2, v4}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup${'$'}LayoutParams;)V
    if-eqz v2, :cond_a
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    invoke-virtual {v0, v2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    goto :goto_4
    :catch_0
    move-exception v0
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :cond_a
    :goto_4
    sget-object v0, Lwei/mark/standout/StandOutWindow;->q:Lfi5;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
    iget-object v0, v0, Lfi5;->a:Ljava/lang/Object;
    check-cast v0, Ljava/util/HashMap;
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Landroid/util/SparseArray;
    if-nez v4, :cond_b
    new-instance v4, Landroid/util/SparseArray;
    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V
    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :cond_b
    invoke-virtual {v4, p3, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    invoke-virtual {p0, p3}, Lwei/mark/standout/StandOutWindow;->l(I)Landroid/app/Notification;
    move-result-object p2
    if-eqz p2, :cond_d
    iget v0, p2, Landroid/app/Notification;->flags:I
    or-int/lit8 v0, v0, 0x20
    iput v0, p2, Landroid/app/Notification;->flags:I
    iget-boolean v0, p0, Lwei/mark/standout/StandOutWindow;->d:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    if-nez v0, :cond_c
    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    move-result v0
    add-int/2addr v0, v1
    invoke-virtual {p0, v0, p2}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V
    iput-boolean v3, p0, Lwei/mark/standout/StandOutWindow;->d:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    goto :goto_5
    :catchall_1
    move-exception p2
    :try_start_5
    const-string v0, "StandOutWindow"
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    goto :goto_5
    :cond_c
    iget-object p1, p0, Lwei/mark/standout/StandOutWindow;->b:Landroid/app/NotificationManager;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    move-result v0
    add-int/2addr v0, v1
    invoke-virtual {p1, v0, p2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    goto :goto_5
    :cond_d
    iget-boolean p1, p0, Lwei/mark/standout/StandOutWindow;->d:Z
    if-eqz p1, :cond_e
    :goto_5
    invoke-virtual {p0, p3}, Lwei/mark/standout/StandOutWindow;->e(I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    monitor-exit p0
    goto :goto_7
    :cond_e
    :try_start_6
    new-instance p1, Ljava/lang/RuntimeException;
    const-string p2, "Your StandOutWindow service mustprovide a persistent notification.The notification prevents Androidfrom killing your service in lowmemory situations."
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V
    throw p1
    :goto_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    throw p1
    :cond_f
    const-string p0, "ID cannot equals StandOutWindow.ONGOING_NOTIFICATION_ID"
    invoke-static {p0}, Lbk0;->b(Ljava/lang/String;)V
    return v0
    :cond_10
    const-string p0, "StandOutWindow"
    const-string p1, "Tried to onStartCommand() with a null intent."
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :cond_11
    :goto_7
    const/4 p0, 0x2
    return p0
""".trimIndent()
