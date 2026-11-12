# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2026 ShortEnigma0
# Part of expertraw-morphe-patches standalone patcher. See LICENSE in the repository root.
.class public final Lcom/samsung/android/app/galaxyraw/mod/SafeCR;
.super Ljava/lang/Object;
.source "SafeCR.java"

# MOD: ContentResolver wrappers; a SecurityException from a provider we lost access to
# (signature permissions after re-signing) is logged and turned into an empty result.

.method public static applyBatch(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p2}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    move-result-object v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-object v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "SafeCR.applyBatch denied: "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "GrawMod"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    new-array v0, v0, [Landroid/content/ContentProviderResult;
    return-object v0
.end method

.method public static call(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p4}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    move-result-object v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-object v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "SafeCR.call denied: "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "GrawMod"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    return-object v0
.end method

.method public static delete(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/os/Bundle;)I
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Landroid/os/Bundle;)I
    move-result v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "SafeCR.delete denied: "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "GrawMod"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    return v0
.end method

.method public static delete(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    move-result v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "SafeCR.delete denied: "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "GrawMod"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    return v0
.end method

.method public static insert(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 4
    :try_start
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    move-result-object v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-object v0
    :catch_sec
    const-string v1, "GrawMod"
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v2, "SafeCR.insert denied: "
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    # secmedia (Samsung private MediaProvider): hand back a synthetic row id so saving continues;
    # the real file is written to DCIM and indexed by MediaScanner.
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;
    move-result-object v0
    const-string v1, "secmedia"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :ret_null
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v0
    const-wide/32 v2, 0x3b9aca00
    rem-long/2addr v0, v2
    invoke-static {p1, v0, v1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;
    move-result-object v0
    return-object v0
    :ret_null
    const/4 v0, 0x0
    return-object v0
.end method

.method public static query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;Landroid/os/CancellationSignal;)Landroid/database/Cursor;
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p4}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;Landroid/os/CancellationSignal;)Landroid/database/Cursor;
    move-result-object v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-object v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "SafeCR.query denied: "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "GrawMod"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    invoke-static {p1}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->isSecMedia(Landroid/net/Uri;)Z
    move-result v0
    if-eqz v0, :mod_null
    invoke-static/range {p0 .. p3}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;
    move-result-object v0
    return-object v0
    :mod_null
    const/4 v0, 0x0
    return-object v0
.end method

.method public static query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    move-result-object v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-object v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "SafeCR.query denied: "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "GrawMod"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    invoke-static {p1}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->isSecMedia(Landroid/net/Uri;)Z
    move-result v0
    if-eqz v0, :mod_null
    invoke-static/range {p0 .. p5}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    move-result-object v0
    return-object v0
    :mod_null
    const/4 v0, 0x0
    return-object v0
.end method

.method public static registerContentObserver(Landroid/content/ContentResolver;Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "SafeCR.registerContentObserver denied: "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "GrawMod"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    # MOD: secmedia notifications are unavailable; listen to MediaStore so the latest-photo thumbnail refreshes
    invoke-static {p1}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->isSecMedia(Landroid/net/Uri;)Z
    move-result v0
    if-eqz v0, :mod_done
    const-string v0, "content://media/external"
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v0
    const/4 v1, 0x1
    invoke-virtual {p0, v0, v1, p3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :mod_done
    return-void
.end method

.method public static update(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/content/ContentValues;Landroid/os/Bundle;)I
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Landroid/os/Bundle;)I
    move-result v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "SafeCR.update denied: "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "GrawMod"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    return v0
.end method

.method public static update(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    move-result v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "SafeCR.update denied: "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "GrawMod"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    return v0
.end method
