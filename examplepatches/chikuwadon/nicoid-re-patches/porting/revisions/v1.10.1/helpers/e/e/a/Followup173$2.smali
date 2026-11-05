.class Le/e/a/Followup173$2;
.super Ljava/lang/Object;
.source "Followup173.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Followup173;->writeLog(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$app:Landroid/content/Context;

.field private final synthetic val$content:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 87
    iput-object p1, p0, Le/e/a/Followup173$2;->val$app:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/Followup173$2;->val$content:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .line 88
    const-string v0, "is_pending"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "nicoid-re_log_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyyMMddHHmmss"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".txt"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 90
    const/4 v2, 0x0

    :try_start_2a
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2c} :catch_11c

    const/16 v4, 0x1d

    const-string v5, "UTF-8"

    if-lt v3, v4, :cond_a9

    :try_start_32
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "_display_name"

    invoke-virtual {v3, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "mime_type"

    const-string v6, "text/plain"

    invoke-virtual {v3, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "relative_path"

    const-string v6, "Download/"

    invoke-virtual {v3, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v4, p0, Le/e/a/Followup173$2;->val$app:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v6, "content://media/external/downloads"

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v4, v6, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v4
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_62} :catch_11c

    if-eqz v4, :cond_a1

    :try_start_64
    iget-object v6, p0, Le/e/a/Followup173$2;->val$app:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v6
    :try_end_6e
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_6e} :catch_9e

    if-eqz v6, :cond_96

    :try_start_70
    iget-object v7, p0, Le/e/a/Followup173$2;->val$content:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/io/OutputStream;->write([B)V
    :try_end_79
    .catchall {:try_start_70 .. :try_end_79} :catchall_91

    :try_start_79
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    invoke-virtual {v3}, Landroid/content/ContentValues;->clear()V

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v0, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v0, p0, Le/e/a/Followup173$2;->val$app:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, v4, v3, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 91
    goto :goto_f1

    .line 90
    :catchall_91
    move-exception v0

    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    :goto_95
    throw v0

    :cond_96
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot open download"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_95

    .line 93
    :catch_9e
    move-exception v0

    goto/16 :goto_11e

    .line 90
    :cond_a1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot create download"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_a8
    .catch Ljava/lang/Exception; {:try_start_79 .. :try_end_a8} :catch_9e

    goto :goto_95

    .line 91
    :cond_a9
    :try_start_a9
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_c4

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-eqz v3, :cond_bc

    goto :goto_c4

    :cond_bc
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot create Download folder"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_c3
    throw v0

    :cond_c4
    :goto_c4
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    move-result v0

    if-eqz v0, :cond_114

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_d4
    .catch Ljava/lang/Exception; {:try_start_a9 .. :try_end_d4} :catch_11c

    :try_start_d4
    iget-object v4, p0, Le/e/a/Followup173$2;->val$content:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_dd
    .catchall {:try_start_d4 .. :try_end_dd} :catchall_10f

    :try_start_dd
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    iget-object v0, p0, Le/e/a/Followup173$2;->val$app:Landroid/content/Context;

    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v4, v5, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_f0
    .catch Ljava/lang/Exception; {:try_start_dd .. :try_end_f0} :catch_11c

    move-object v4, v2

    .line 92
    :goto_f1
    :try_start_f1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Download\u306b\u4fdd\u5b58\u3057\u307e\u3057\u305f"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ": "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_10e
    .catch Ljava/lang/Exception; {:try_start_f1 .. :try_end_10e} :catch_9e

    .line 93
    goto :goto_131

    .line 91
    :catchall_10f
    move-exception v1

    :try_start_110
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    throw v1

    :cond_114
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Log already exists"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_11b
    .catch Ljava/lang/Exception; {:try_start_110 .. :try_end_11b} :catch_11c

    goto :goto_c3

    .line 93
    :catch_11c
    move-exception v0

    move-object v4, v2

    :goto_11e
    if-eqz v4, :cond_12b

    :try_start_120
    iget-object v0, p0, Le/e/a/Followup173$2;->val$app:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, v4, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_129
    .catch Ljava/lang/Exception; {:try_start_120 .. :try_end_129} :catch_12a

    goto :goto_12b

    :catch_12a
    move-exception v0

    :cond_12b
    :goto_12b
    const-string v0, "\u30ed\u30b0\u3092\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 94
    :goto_131
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Le/e/a/Followup173$2$1;

    iget-object v3, p0, Le/e/a/Followup173$2;->val$app:Landroid/content/Context;

    invoke-direct {v2, p0, v3, v0}, Le/e/a/Followup173$2$1;-><init>(Le/e/a/Followup173$2;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 95
    return-void
.end method
