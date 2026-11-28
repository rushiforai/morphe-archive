.class public final Le/e/a/Mp3Save213;
.super Ljava/lang/Object;
.source "Mp3Save213.java"


# static fields
.field private static final MAGIC:I = 0x3e8

.field private static final MENU:I = 0x46d4

.field private static final PLAYER_TAG:Ljava/lang/String; = "nicoid-save-mp3-213"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addList(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 10

    .line 124
    :try_start_0
    sget-object v0, Le/e/a/ListActions;->ACTIONS:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_1

    .line 126
    const-string v1, "e"

    invoke-static {p0, v1}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 127
    const-string v2, "d"

    invoke-static {v1, v2}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    .line 128
    const-string v3, "b"

    invoke-static {v1, v3}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 129
    const-string v3, "c"

    invoke-static {p0, v3}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    .line 130
    instance-of v3, v1, Ljava/util/List;

    if-eqz v3, :cond_1

    if-ltz p0, :cond_1

    move-object v3, v1

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge p0, v3, :cond_1

    .line 131
    check-cast v1, Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 132
    invoke-static {p0}, Le/e/a/DownloadActions116;->videoId(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 133
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 134
    const-string v3, "title"

    invoke-static {p0, v3}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 135
    const-string v3, "a"

    invoke-static {p1, v3}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/Menu;

    if-eqz p1, :cond_1

    const/16 v3, 0x46d4

    .line 136
    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    if-nez v4, :cond_1

    const/16 v4, 0x46d2

    .line 137
    invoke-interface {p1, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    if-nez v4, :cond_0

    const/4 v4, 0x5

    goto :goto_0

    .line 138
    :cond_0
    invoke-interface {v4}, Landroid/view/MenuItem;->getOrder()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    .line 140
    :goto_0
    const-string v5, "MP3\u3067\u4fdd\u5b58"

    const-string v6, "Save as MP3"

    const-string v7, "\u5132\u5b58\u70baMP3"

    invoke-static {v2, v5, v6, v7}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    .line 139
    invoke-interface {p1, v6, v3, v4, v5}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    .line 141
    new-instance v3, Le/e/a/Mp3Save213$5;

    invoke-direct {v3, v2, v1, p0}, Le/e/a/Mp3Save213$5;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    new-instance p0, Le/e/a/Mp3Save213$6;

    invoke-direct {p0, v3}, Le/e/a/Mp3Save213$6;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 143
    new-instance p0, Le/e/a/ListActions$Action;

    invoke-direct {p0, p1, v3}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-void

    :catch_0
    move-exception p0

    .line 144
    const-string p1, "nicoid-mp3"

    const-string v0, "Cannot install MP3 list action"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method static bitrate(Le/e/a/DownloadJobs115$Job;)I
    .registers 1

    .line 44
    iget p0, p0, Le/e/a/DownloadJobs115$Job;->height:I

    neg-int p0, p0

    add-int/lit16 p0, p0, -0x3e8

    return p0
.end method

.method public static choose(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    if-eqz p0, :cond_0

    .line 47
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0xc0

    const/16 v1, 0x100

    const/16 v2, 0x80

    .line 48
    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    .line 49
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 50
    const-string v2, "Save as MP3"

    const-string v3, "\u5132\u5b58\u70baMP3"

    const-string v4, "MP3\u3067\u4fdd\u5b58"

    invoke-static {p0, v4, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 51
    const-string v2, "192 kbps"

    const-string v3, "256 kbps"

    const-string v4, "128 kbps"

    filled-new-array {v4, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/Mp3Save213$8;

    invoke-direct {v3, v0, p0, p1, p2}, Le/e/a/Mp3Save213$8;-><init>([ILandroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    .line 57
    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 49
    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    :cond_0
    return-void
.end method

.method public static decorateRow(Landroid/view/View;Ljava/lang/Object;I)V
    .registers 4

    .line 151
    :try_start_0
    instance-of v0, p1, Le/e/a/DownloadUi115$Manager;

    if-eqz v0, :cond_0

    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 152
    check-cast p1, Le/e/a/DownloadUi115$Manager;

    if-ltz p2, :cond_0

    .line 153
    iget-object v0, p1, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    .line 154
    iget-object p1, p1, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/DownloadUi115$Row;

    .line 155
    iget-object p1, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    invoke-static {p1}, Le/e/a/Mp3Save213;->isMp3(Le/e/a/DownloadJobs115$Job;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 156
    check-cast p0, Landroid/view/ViewGroup;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    .line 157
    instance-of p1, p0, Landroid/widget/TextView;

    if-eqz p1, :cond_0

    .line 158
    move-object p1, p0

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    .line 159
    const-string p2, "MP4"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    check-cast p0, Landroid/widget/TextView;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "MP3"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p0

    .line 161
    const-string p1, "nicoid-mp3"

    const-string p2, "Cannot update MP3 row"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method static export(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;Ljava/io/File;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 266
    const-string v0, "\u4fdd\u5b58\u4e2d"

    iput-object v0, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    .line 267
    iget-object v0, p1, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 268
    iget-object v1, p1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    iget-object v2, p1, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-static {v1, v2}, Le/e/a/Mp4Playlist115;->filename(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\.mp4$"

    const-string v3, ".mp3"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 272
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 273
    invoke-static {v0}, Le/e/a/DownloadJobs115;->document(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v0

    const-string v4, "audio/mpeg"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, ".part"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 272
    invoke-static {v3, v0, v4, v5}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    if-eqz v0, :cond_b

    .line 275
    :try_start_1
    new-instance v3, Ljava/io/BufferedInputStream;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 276
    :try_start_2
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "wt"

    invoke-virtual {v4, v0, v5}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v4, :cond_5

    const/high16 v5, 0x10000

    .line 278
    :try_start_3
    new-array v5, v5, [B

    .line 279
    :goto_0
    invoke-virtual {v3, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 v7, -0x1

    if-ne v6, v7, :cond_3

    if-eqz v4, :cond_0

    .line 284
    :try_start_4
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_0
    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 285
    :try_start_6
    iget-boolean v2, p1, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    if-nez v2, :cond_2

    iget-boolean v2, p1, Le/e/a/DownloadJobs115$Job;->paused:Z

    if-nez v2, :cond_2

    .line 286
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {v2, v0, v1}, Landroid/provider/DocumentsContract;->renameDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    if-eqz v2, :cond_1

    .line 289
    :try_start_7
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    .line 290
    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, p1, Le/e/a/DownloadJobs115$Job;->bytes:J

    .line 291
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p1, Le/e/a/DownloadJobs115$Job;->savedAt:J

    .line 292
    const-string p2, "\u4fdd\u5b58\u6e08\u307f"

    iput-object p2, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    return-void

    .line 287
    :cond_1
    :try_start_8
    new-instance p1, Ljava/io/IOException;

    const-string p2, "MP3\u4fdd\u5b58\u3092\u78ba\u5b9a\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 285
    :cond_2
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 280
    :cond_3
    :try_start_9
    iget-boolean v7, p1, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    if-nez v7, :cond_4

    iget-boolean v7, p1, Le/e/a/DownloadJobs115$Job;->paused:Z

    if-nez v7, :cond_4

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v7

    if-nez v7, :cond_4

    const/4 v7, 0x0

    .line 282
    invoke-virtual {v4, v5, v7, v6}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 281
    :cond_4
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    throw p1

    .line 277
    :cond_5
    new-instance p1, Ljava/io/IOException;

    const-string p2, "MP3\u4fdd\u5b58\u5148\u3092\u958b\u3051\u307e\u305b\u3093"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    :catchall_0
    move-exception p1

    move-object v2, p1

    if-eqz v4, :cond_6

    .line 284
    :try_start_a
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    :cond_6
    throw v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    :catchall_1
    move-exception p1

    if-eqz v2, :cond_7

    if-eq v2, p1, :cond_8

    :try_start_b
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_7
    move-object v2, p1

    :cond_8
    :goto_1
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    :catchall_2
    move-exception p1

    if-eqz v2, :cond_a

    if-eq v2, p1, :cond_9

    :try_start_c
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_9
    move-object p1, v2

    :cond_a
    throw p1

    .line 274
    :cond_b
    new-instance p1, Ljava/io/IOException;

    const-string p2, "MP3\u4fdd\u5b58\u5148\u3092\u4f5c\u6210\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    :catchall_3
    move-exception p1

    move-object v2, v0

    goto :goto_2

    :catchall_4
    move-exception p1

    :goto_2
    if-eqz v2, :cond_c

    .line 296
    :try_start_d
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, v2}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_0

    goto :goto_3

    :catch_0
    move-exception p0

    .line 297
    const-string p2, "nicoid-mp3"

    const-string v0, "Cannot remove partial MP3 document"

    invoke-static {p2, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 298
    :cond_c
    :goto_3
    throw p1
.end method

.method static installPlayer(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)Z
    .registers 10

    const/4 v0, 0x1

    if-eqz p0, :cond_5

    .line 86
    const-string v1, "nicoid-save-mp3-213"

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_5

    .line 87
    const-string v2, "nicoid-save-mp4-116"

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    return v3

    .line 90
    :cond_0
    :try_start_0
    const-string v4, "x1"

    invoke-static {p0, v4}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, p2, :cond_1

    return v0

    .line 91
    :cond_1
    const-string p2, "MP3\u3067\u4fdd\u5b58"

    const-string v4, "Save as MP3"

    const-string v5, "\u5132\u5b58\u70baMP3"

    invoke-static {p1, p2, v4, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/16 v4, 0x10

    invoke-static {p1, p2, v4}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p2

    .line 92
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 93
    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v1, 0x30

    .line 94
    invoke-static {p1, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 95
    invoke-static {p1, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/16 v5, 0x8

    invoke-static {p1, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p1, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p1, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {p2, v1, v6, v4, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 96
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 97
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 98
    new-instance p0, Le/e/a/Mp3Save213$0;

    invoke-direct {p0, v1, p1}, Le/e/a/Mp3Save213$0;-><init>(Ljava/lang/ref/WeakReference;Landroid/app/Activity;)V

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of p0, p0, Landroid/view/ViewGroup;

    const/4 p1, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    goto :goto_0

    :cond_2
    move-object p0, p1

    .line 109
    :goto_0
    instance-of v1, p0, Landroid/widget/ListView;

    if-eqz v1, :cond_3

    .line 110
    check-cast p0, Landroid/widget/ListView;

    invoke-virtual {p0, p2, p1, v3}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    goto :goto_1

    .line 111
    :cond_3
    instance-of p1, p0, Landroid/widget/LinearLayout;

    if-eqz p1, :cond_4

    .line 112
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    add-int/2addr p1, v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return v0

    :cond_4
    return v3

    :catch_0
    move-exception p0

    .line 115
    const-string p1, "nicoid-mp3"

    const-string p2, "Cannot install MP3 row"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    return v0
.end method

.method static isMp3(Le/e/a/DownloadJobs115$Job;)Z
    .registers 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 41
    :cond_0
    iget p0, p0, Le/e/a/DownloadJobs115$Job;->height:I

    neg-int p0, p0

    add-int/lit16 p0, p0, -0x3e8

    const/16 v1, 0x80

    if-eq p0, v1, :cond_1

    const/16 v1, 0xc0

    if-eq p0, v1, :cond_1

    const/16 v1, 0x100

    if-eq p0, v1, :cond_1

    return v0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$0([ILandroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 7

    if-ltz p5, :cond_1

    .line 52
    array-length p4, p0

    if-ge p5, p4, :cond_1

    .line 53
    aget p0, p0, p5

    rsub-int p0, p0, -0x3e8

    .line 54
    invoke-static {p1}, Le/e/a/DownloadUi115;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p4

    const-string p5, "mp4_tree_uri"

    const-string v0, ""

    invoke-interface {p4, p5, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-eqz p4, :cond_0

    .line 55
    invoke-static {p1, p2, p3, p0}, Le/e/a/DownloadUi115;->folder(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    .line 56
    :cond_0
    invoke-static {p1, p2, p3, p0}, Le/e/a/DownloadUi115;->enqueue(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I)V

    :cond_1
    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/ref/WeakReference;Landroid/app/Activity;Landroid/view/View;)V
    .registers 5

    .line 68
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1, p2}, Le/e/a/Mp3Save213;->installPlayer(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 70
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    return-void

    .line 71
    :cond_1
    new-instance v1, Le/e/a/Mp3Save213$1;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/Mp3Save213$1;-><init>(Ljava/lang/ref/WeakReference;Landroid/app/Activity;Landroid/view/View;)V

    .line 81
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/ref/WeakReference;Landroid/app/Activity;Landroid/view/View;)V
    .registers 4

    .line 99
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 102
    :try_start_0
    const-string p2, "b0"

    invoke-static {p0, p2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 103
    const-string v0, "(?:sm|so|nm|ss)?[0-9]+"

    invoke-virtual {p2, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 104
    const-string v0, "c0"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 105
    const-string v0, "null"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move-object p0, p2

    :cond_1
    invoke-static {p1, p2, p0}, Le/e/a/Mp3Save213;->choose(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-void

    :catch_0
    move-exception p0

    .line 106
    const-string p1, "nicoid-mp3"

    const-string p2, "Player MP3 action"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method static synthetic lambda$3(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 2

    .line 120
    invoke-static {p0, p1}, Le/e/a/Mp3Save213;->addList(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$4(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    .line 141
    invoke-static {p0, p1, p2}, Le/e/a/Mp3Save213;->choose(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$5(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 2

    .line 142
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$6(Landroid/app/Service;Le/e/a/DownloadJobs115$Job;Le/e/a/Mp4Transfer115;Ljava/lang/Object;)V
    .registers 4

    .line 215
    invoke-static {p0, p1, p2, p3}, Le/e/a/Mp3Save213;->run(Landroid/app/Service;Le/e/a/DownloadJobs115$Job;Le/e/a/Mp4Transfer115;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$7(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V
    .registers 3

    .line 254
    sget-object v0, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    if-ne v0, p0, :cond_0

    const/4 p0, 0x0

    .line 255
    sput-object p0, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    .line 256
    sput-object p0, Le/e/a/DownloadWorker115;->transfer:Le/e/a/Mp4Transfer115;

    .line 257
    sput-object p0, Le/e/a/DownloadWorker115;->worker:Ljava/lang/Thread;

    .line 258
    sget-boolean p0, Le/e/a/DownloadWorker115;->destroyed:Z

    if-nez p0, :cond_0

    sget-object p0, Le/e/a/DownloadWorker115;->service:Landroid/app/Service;

    if-ne p0, p1, :cond_0

    .line 259
    invoke-static {p1}, Le/e/a/DownloadWorker115;->finish(Landroid/app/Service;)V

    :cond_0
    return-void
.end method

.method public static openIfMp3(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;Z)Z
    .registers 8

    .line 166
    invoke-static {p1}, Le/e/a/Mp3Save213;->isMp3(Le/e/a/DownloadJobs115$Job;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 v0, 0x1

    if-eqz p0, :cond_3

    .line 167
    iget-object v1, p1, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p1, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 169
    :try_start_0
    iget-object v1, p1, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    const-string v2, "audio/mpeg"

    if-eqz p2, :cond_1

    .line 171
    :try_start_1
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.SEND"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 172
    const-string v3, "android.intent.extra.STREAM"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v2

    goto :goto_0

    .line 173
    :cond_1
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 174
    :goto_0
    invoke-virtual {v2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 175
    iget-object p1, p1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    invoke-static {p1, v1}, Landroid/content/ClipData;->newRawUri(Ljava/lang/CharSequence;Landroid/net/Uri;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    if-eqz p2, :cond_2

    .line 177
    const-string p1, "MP3\u3092\u5171\u6709"

    goto :goto_1

    :cond_2
    const-string/jumbo p1, "\u97f3\u58f0\u30a2\u30d7\u30ea\u3067\u958b\u304f"

    .line 176
    :goto_1
    invoke-static {v2, p1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 179
    :catch_0
    const-string p1, "MP3\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_3
    :goto_2
    return v0
.end method

.method static run(Landroid/app/Service;Le/e/a/DownloadJobs115$Job;Le/e/a/Mp4Transfer115;Ljava/lang/Object;)V
    .registers 8

    const/4 v0, 0x0

    .line 230
    :try_start_0
    const-string v1, "power"

    invoke-virtual {p0, v1}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    if-eqz v1, :cond_0

    .line 231
    const-string v2, "nicoid:mp3-save"

    const/4 v3, 0x1

    invoke-virtual {v1, v3, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    const-wide/32 v1, 0x1499700

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 234
    :cond_0
    invoke-virtual {p2, p3}, Le/e/a/Mp4Transfer115;->run(Ljava/lang/Object;)Ljava/io/File;

    move-result-object p3

    .line 235
    invoke-virtual {p2}, Le/e/a/Mp4Transfer115;->check()V

    .line 236
    const-string v1, "MP3\u5909\u63db\u4e2d"

    iput-object v1, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    .line 237
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MP3 "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Le/e/a/Mp3Save213;->bitrate(Le/e/a/DownloadJobs115$Job;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "kbps"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Le/e/a/DownloadJobs115$Job;->quality:Ljava/lang/String;

    .line 238
    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    .line 239
    new-instance v1, Ljava/io/File;

    iget-object v2, p2, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    const-string v3, "complete.mp3"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 240
    invoke-static {p1}, Le/e/a/Mp3Save213;->bitrate(Le/e/a/DownloadJobs115$Job;)I

    move-result v2

    invoke-static {p2, p3, v1, v2}, Le/e/a/Mp3Transcode213;->convert(Le/e/a/Mp4Transfer115;Ljava/io/File;Ljava/io/File;I)V

    .line 241
    invoke-virtual {p2}, Le/e/a/Mp4Transfer115;->check()V

    .line 242
    invoke-static {p0, p1, v1}, Le/e/a/Mp3Save213;->export(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 250
    invoke-virtual {p2}, Le/e/a/Mp4Transfer115;->clean()V

    if-eqz v0, :cond_1

    .line 251
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 252
    :cond_1
    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    .line 253
    sget-object p2, Le/e/a/DownloadWorker115;->MAIN:Landroid/os/Handler;

    new-instance p3, Le/e/a/Mp3Save213$7;

    invoke-direct {p3, p1, p0}, Le/e/a/Mp3Save213$7;-><init>(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V

    :goto_0
    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catch_0
    move-exception p3

    .line 244
    :try_start_1
    iget-boolean v1, p1, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    if-eqz v1, :cond_2

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    goto :goto_1

    :cond_2
    iget-boolean v1, p1, Le/e/a/DownloadJobs115$Job;->paused:Z

    if-eqz v1, :cond_3

    const-string v1, "\u4e00\u6642\u505c\u6b62"

    goto :goto_1

    :cond_3
    const-string v1, "\u30a8\u30e9\u30fc"

    :goto_1
    iput-object v1, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    .line 245
    iget-boolean v1, p1, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    if-eqz v1, :cond_4

    const-string v1, ""

    goto :goto_2

    :cond_4
    iget-boolean v1, p1, Le/e/a/DownloadJobs115$Job;->paused:Z

    if-eqz v1, :cond_5

    const-string v1, "\u518d\u958b\u6642\u306f\u53d6\u5f97\u3092\u3084\u308a\u76f4\u3057\u307e\u3059"

    goto :goto_2

    .line 246
    :cond_5
    instance-of v1, p3, Ljava/io/IOException;

    if-eqz v1, :cond_6

    invoke-virtual {p3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 247
    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MP3\u4fdd\u5b58\u306b\u5931\u6557\u3057\u307e\u3057\u305f ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 245
    :goto_2
    iput-object v1, p1, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    .line 248
    const-string v1, "nicoid-mp3"

    const-string v2, "MP3 save failed"

    invoke-static {v1, v2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 250
    invoke-virtual {p2}, Le/e/a/Mp4Transfer115;->clean()V

    if-eqz v0, :cond_7

    .line 251
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p2

    if-eqz p2, :cond_7

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 252
    :cond_7
    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    .line 253
    sget-object p2, Le/e/a/DownloadWorker115;->MAIN:Landroid/os/Handler;

    new-instance p3, Le/e/a/Mp3Save213$7;

    invoke-direct {p3, p1, p0}, Le/e/a/Mp3Save213$7;-><init>(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V

    goto :goto_0

    :catchall_0
    move-exception p3

    .line 250
    invoke-virtual {p2}, Le/e/a/Mp4Transfer115;->clean()V

    if-eqz v0, :cond_8

    .line 251
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p2

    if-eqz p2, :cond_8

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 252
    :cond_8
    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    .line 253
    sget-object p2, Le/e/a/DownloadWorker115;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/Mp3Save213$7;

    invoke-direct {v0, p1, p0}, Le/e/a/Mp3Save213$7;-><init>(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 262
    throw p3
.end method

.method public static scheduleList(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 120
    sget-object v0, Le/e/a/DownloadUi115;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/Mp3Save213$3;

    invoke-direct {v1, p0, p1}, Le/e/a/Mp3Save213$3;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static schedulePlayer(Ljava/lang/Object;)V
    .registers 4

    .line 63
    :try_start_0
    const-string v0, "x1"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 64
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 66
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 67
    new-instance p0, Le/e/a/Mp3Save213$2;

    invoke-direct {p0, v2, v1, v0}, Le/e/a/Mp3Save213$2;-><init>(Ljava/lang/ref/WeakReference;Landroid/app/Activity;Landroid/view/View;)V

    invoke-virtual {v0, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p0

    .line 83
    const-string v0, "nicoid-mp3"

    const-string v1, "Player menu setup"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static start(Ljava/lang/Object;Landroid/content/Intent;)Z
    .registers 8

    .line 186
    instance-of v0, p0, Landroid/app/Service;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    .line 187
    check-cast p0, Landroid/app/Service;

    invoke-static {p0}, Le/e/a/DownloadJobs115;->init(Landroid/content/Context;)V

    .line 188
    const-string v0, "nicoid_mp4_job115"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/DownloadJobs115;->find(Ljava/lang/String;)Le/e/a/DownloadJobs115$Job;

    move-result-object p1

    .line 189
    invoke-static {p1}, Le/e/a/Mp3Save213;->isMp3(Le/e/a/DownloadJobs115$Job;)Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    .line 191
    :cond_0
    iget-boolean v0, p1, Le/e/a/DownloadJobs115$Job;->paused:Z

    const/4 v2, 0x1

    if-nez v0, :cond_1

    iget-boolean v0, p1, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    if-nez v0, :cond_1

    const-string v0, "\u30ad\u30e5\u30fc\u5f85\u3061"

    iget-object v3, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 196
    :try_start_0
    sput-object p0, Le/e/a/DownloadWorker115;->service:Landroid/app/Service;

    .line 197
    sput-boolean v1, Le/e/a/DownloadWorker115;->destroyed:Z

    .line 198
    sput-object p1, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    .line 199
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iput-wide v3, p1, Le/e/a/DownloadJobs115$Job;->started:J

    .line 200
    const-string/jumbo v3, "\u97f3\u58f0\u60c5\u5831\u3092\u53d6\u5f97\u4e2d"

    iput-object v3, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    .line 201
    invoke-static {}, Le/e/a/CacheProgress;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 203
    :try_start_1
    const-string v3, "i"

    invoke-static {p0, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 204
    const-string v4, "l"

    invoke-static {p0, v4}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Runnable;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 206
    :catch_0
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "t"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    iget-object v4, p1, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 207
    const-string v3, "e.e.a.d0"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    aput-object v5, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 208
    const-string v3, "r"

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v1, v3, v4}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 209
    const-string v3, "n"

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v4

    const-string v5, "user_session="

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v1, v3, v4}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 210
    const-string v3, "I"

    const-string v4, "e.e.a.v0"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "b"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v1, v3, v4}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 211
    new-instance v3, Le/e/a/Mp4Transfer115;

    invoke-direct {v3, p0, p1}, Le/e/a/Mp4Transfer115;-><init>(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)V

    .line 212
    sput-object v3, Le/e/a/DownloadWorker115;->transfer:Le/e/a/Mp4Transfer115;

    .line 213
    invoke-static {p0, p1}, Le/e/a/DownloadWorker115;->publish(Landroid/app/Service;Le/e/a/DownloadJobs115$Job;)V

    .line 214
    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    .line 215
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Le/e/a/Mp3Save213$4;

    invoke-direct {v5, p0, p1, v3, v1}, Le/e/a/Mp3Save213$4;-><init>(Landroid/app/Service;Le/e/a/DownloadJobs115$Job;Le/e/a/Mp4Transfer115;Ljava/lang/Object;)V

    .line 216
    const-string v1, "nicoid-mp3-save"

    .line 215
    invoke-direct {v4, v5, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    sput-object v4, Le/e/a/DownloadWorker115;->worker:Ljava/lang/Thread;

    .line 217
    sget-object v1, Le/e/a/DownloadWorker115;->worker:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 219
    :catch_1
    const-string v1, "\u30a8\u30e9\u30fc"

    iput-object v1, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    const-string v1, "MP3\u4fdd\u5b58\u306e\u6e96\u5099\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    iput-object v1, p1, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    .line 220
    sput-object v0, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    .line 221
    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    .line 222
    invoke-static {p0}, Le/e/a/DownloadWorker115;->finish(Landroid/app/Service;)V

    :goto_0
    return v2

    .line 192
    :cond_1
    invoke-static {p0}, Le/e/a/DownloadWorker115;->finish(Landroid/app/Service;)V

    return v2

    :cond_2
    return v1
.end method
