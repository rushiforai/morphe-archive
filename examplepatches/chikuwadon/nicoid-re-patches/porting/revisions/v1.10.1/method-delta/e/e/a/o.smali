.class public Le/e/a/o;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static a:[Ljava/lang/String;


# direct methods
.method public static a(Ljava/util/ArrayList;Landroid/content/Context;)J
    .registers 4

    invoke-static {p0, p1}, Le/e/a/CacheListing;->load(Ljava/util/ArrayList;Landroid/content/Context;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static synthetic a(Landroid/app/AlertDialog;Landroid/content/Context;)V
    .registers 3

    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    const-string p0, "\u79fb\u52d5\u304c\u5b8c\u4e86\u3057\u307e\u3057\u305f"

    const/4 v0, 0x1

    invoke-static {p1, p0, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static a(Landroid/content/Context;)V
    .registers 3

    :try_start_0
    invoke-static {p0}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_28

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_23} :catch_24

    goto :goto_28

    :catch_24
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_28
    :goto_28
    return-void
.end method

.method public static a(Landroid/content/Context;J)V
    .registers 20

    move-object/from16 v0, p0

    new-instance v1, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static/range {p0 .. p0}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/nicoid/nicoid_cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_23

    return-void

    :cond_23
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "cache_size"

    const-string v4, "2048"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_da

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "aa\u6b8b\u91cf\uff1a"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const-wide/32 v6, 0x100000

    mul-long v2, v2, v6

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_da

    array-length v8, v1

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-wide v11, v4

    :goto_59
    if-ge v10, v8, :cond_65

    aget-object v13, v1, v10

    invoke-virtual {v13}, Ljava/io/File;->length()J

    move-result-wide v13

    add-long/2addr v11, v13

    add-int/lit8 v10, v10, 0x1

    goto :goto_59

    :cond_65
    add-long v13, v11, p1

    cmp-long v8, v13, v2

    if-lez v8, :cond_bf

    new-instance v6, Le/e/a/g;

    invoke-direct {v6}, Le/e/a/g;-><init>()V

    invoke-static {v1, v6}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    array-length v6, v1

    const/4 v7, 0x0

    move-wide v13, v4

    move-wide/from16 v4, p1

    :goto_78
    if-ge v7, v6, :cond_aa

    aget-object v8, v1, v7

    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v10, ".json"

    invoke-virtual {v8, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_a7

    const-string v10, ".json$"

    const-string v15, ""

    invoke-virtual {v8, v10, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    add-long v15, v4, v13

    cmp-long v10, v2, v15

    if-lez v10, :cond_9c

    invoke-static {v8, v0}, Le/e/a/o;->a(Ljava/lang/String;Landroid/content/Context;)[J

    move-result-object v10

    aget-wide v13, v10, v9

    :cond_9c
    add-long v15, v4, v13

    cmp-long v10, v2, v15

    if-lez v10, :cond_a4

    move-wide v4, v15

    goto :goto_a7

    :cond_a4
    invoke-static {v8, v0}, Le/e/a/o;->b(Ljava/lang/String;Landroid/content/Context;)J

    :cond_a7
    :goto_a7
    add-int/lit8 v7, v7, 0x1

    goto :goto_78

    :cond_aa
    const-string v0, "\u6b8b\u91cf\uff1a"

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-wide/32 v6, 0x100000

    div-long/2addr v4, v6

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "MB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_bf
    const-string v0, "\u4f7f\u7528\uff1a"

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    div-long/2addr v11, v6

    invoke-virtual {v0, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "MB\u3000/ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    div-long/2addr v2, v6

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "MB\u3000"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_da
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)V
    .registers 10

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/nicoid"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " / "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, v4}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u30d5\u30a1\u30a4\u30eb\u79fb\u52d5\u4e2d"

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v2, "\u6e96\u5099\u4e2d"

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    invoke-static {v2}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    new-instance v6, Ljava/lang/Thread;

    new-instance v7, Le/e/a/e;

    move-object v0, v7

    move-object v3, p1

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Le/e/a/e;-><init>(Landroid/os/Handler;Landroid/app/AlertDialog;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    invoke-direct {v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public static synthetic a(Landroid/os/Handler;Landroid/app/AlertDialog;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .registers 6

    new-instance v0, Le/e/a/b;

    invoke-direct {v0, p1}, Le/e/a/b;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, p2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p2, p3, p1, p0}, Le/e/a/o;->a(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;Landroid/os/Handler;)V

    new-instance p2, Le/e/a/d;

    invoke-direct {p2, p1, p4}, Le/e/a/d;-><init>(Landroid/app/AlertDialog;Landroid/content/Context;)V

    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static a(Ljava/io/File;Ljava/io/File;)V
    .registers 7

    new-instance v0, Le/e/a/CacheInputStream;

    invoke-direct {v0, p0}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    :try_start_5
    new-instance v1, Le/e/a/CacheOutputStream;

    invoke-direct {v1, p1}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_2c

    const/16 v2, 0x400

    :try_start_c
    new-array v2, v2, [B

    :goto_e
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_19

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_18
    .catchall {:try_start_c .. :try_end_18} :catchall_27

    goto :goto_e

    :cond_19
    :try_start_19
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_2c

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/File;->setLastModified(J)Z

    return-void

    :catchall_27
    move-exception p0

    :try_start_28
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw p0
    :try_end_2c
    .catchall {:try_start_28 .. :try_end_2c} :catchall_2c

    :catchall_2c
    move-exception p0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    goto :goto_32

    :goto_31
    throw p0

    :goto_32
    goto :goto_31
.end method

.method public static a(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;Landroid/os/Handler;)V
    .registers 11

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    array-length v1, v0

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v1, :cond_51

    aget-object v3, v0, v2

    new-instance v4, Le/e/a/CacheFile;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_3b

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    move-result v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, ""

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-static {v3, p1, p2, p3, p4}, Le/e/a/o;->a(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;Landroid/os/Handler;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto :goto_4e

    :cond_3b
    :try_start_3b
    new-instance v5, Le/e/a/c;

    invoke-direct {v5, p3, v3}, Le/e/a/c;-><init>(Landroid/app/AlertDialog;Ljava/io/File;)V

    invoke-virtual {p4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-static {v3, v4}, Le/e/a/o;->a(Ljava/io/File;Ljava/io/File;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_49} :catch_4a

    goto :goto_4e

    :catch_4a
    move-exception v3

    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    :goto_4e
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_51
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .registers 12

    const-string v0, ".M"

    const-string v1, "SaveThumbnail / "

    :try_start_4
    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p2}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "/nicoid/nicoid_cache/"

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ".thm"

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v2, p2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    new-instance p2, Ljava/io/BufferedOutputStream;

    new-instance v3, Le/e/a/CacheOutputStream;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    invoke-direct {p2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    if-nez p0, :cond_42

    return-void

    :cond_42
    const-string v2, ".*so\\d.*"

    invoke-virtual {p1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_4d

    :goto_4b
    const/4 p1, 0x0

    goto :goto_57

    :cond_4d
    const-string v2, ".*(sm|nm|ss)\\d.*"

    invoke-virtual {p1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_56

    goto :goto_4b

    :cond_56
    const/4 p1, 0x1

    :goto_57
    const-string v2, "(smile\\?i=|/thumbnails/)([0-9]+)"

    const/16 v5, 0x20

    invoke-static {v2, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    const/4 v5, 0x0

    :goto_64
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v6

    if-eqz v6, :cond_74

    const/4 v5, 0x2

    invoke-virtual {v2, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    goto :goto_64

    :cond_74
    if-eqz p1, :cond_a1

    const p1, 0x1683d19

    if-lt v5, p1, :cond_a1

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_90

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_90
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u30b5\u30e0\u30cdM\u3042\u308a"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :goto_9d
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    goto :goto_af

    :cond_a1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u30b5\u30e0\u30cdM\u306a\u3057"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_9d

    :goto_af
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_bd
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_bd} :catch_18b

    const/4 p1, 0x0

    move-object v2, p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_c1
    if-nez v0, :cond_181

    const/4 v5, 0x5

    if-ge v1, v5, :cond_181

    :try_start_c6
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    check-cast v5, Ljava/net/HttpURLConnection;
    :try_end_d1
    .catch Ljava/net/SocketTimeoutException; {:try_start_c6 .. :try_end_d1} :catch_152
    .catch Ljava/lang/Exception; {:try_start_c6 .. :try_end_d1} :catch_137
    .catchall {:try_start_c6 .. :try_end_d1} :catchall_133

    :try_start_d1
    const-string v6, "GET"

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v6, "Accept-Language"

    const-string v7, "jp"

    invoke-virtual {v5, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v6, 0x7d0

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->connect()V

    new-instance v6, Ljava/io/BufferedInputStream;

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_f1
    .catch Ljava/net/SocketTimeoutException; {:try_start_d1 .. :try_end_f1} :catch_153
    .catch Ljava/lang/Exception; {:try_start_d1 .. :try_end_f1} :catch_131
    .catchall {:try_start_d1 .. :try_end_f1} :catchall_150

    :try_start_f1
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v7, 0xc8

    if-ne v2, v7, :cond_111

    const/16 v2, 0x1000

    new-array v0, v2, [B
    :try_end_fd
    .catchall {:try_start_f1 .. :try_end_fd} :catchall_11e

    :goto_fd
    :try_start_fd
    invoke-virtual {v6, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v2
    :try_end_101
    .catchall {:try_start_fd .. :try_end_101} :catchall_10e

    const/4 v7, -0x1

    if-eq v2, v7, :cond_10c

    :try_start_104
    invoke-virtual {p2, v0, v4, v2}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_107
    .catch Ljava/lang/Exception; {:try_start_104 .. :try_end_107} :catch_108
    .catchall {:try_start_104 .. :try_end_107} :catchall_10e

    goto :goto_fd

    :catch_108
    move-exception v0

    :try_start_109
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_10c
    .catchall {:try_start_109 .. :try_end_10c} :catchall_10e

    :cond_10c
    const/4 v0, 0x1

    goto :goto_111

    :catchall_10e
    move-exception v0

    const/4 v2, 0x1

    goto :goto_122

    :cond_111
    :goto_111
    :try_start_111
    invoke-virtual {v6}, Ljava/io/BufferedInputStream;->close()V
    :try_end_114
    .catch Ljava/net/SocketTimeoutException; {:try_start_111 .. :try_end_114} :catch_12f
    .catch Ljava/lang/Exception; {:try_start_111 .. :try_end_114} :catch_11a
    .catchall {:try_start_111 .. :try_end_114} :catchall_126

    :try_start_114
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_117
    .catchall {:try_start_114 .. :try_end_117} :catchall_176

    move-object v2, v6

    goto/16 :goto_16c

    :catch_11a
    move-exception v2

    move-object v8, v6

    move-object v6, v2

    goto :goto_12c

    :catchall_11e
    move-exception v2

    move-object v8, v2

    move v2, v0

    move-object v0, v8

    :goto_122
    :try_start_122
    invoke-virtual {v6}, Ljava/io/BufferedInputStream;->close()V

    throw v0
    :try_end_126
    .catch Ljava/net/SocketTimeoutException; {:try_start_122 .. :try_end_126} :catch_12e
    .catch Ljava/lang/Exception; {:try_start_122 .. :try_end_126} :catch_128
    .catchall {:try_start_122 .. :try_end_126} :catchall_126

    :catchall_126
    move-exception p0

    goto :goto_170

    :catch_128
    move-exception v0

    move-object v8, v6

    move-object v6, v0

    move v0, v2

    :goto_12c
    move-object v2, v8

    goto :goto_13a

    :catch_12e
    move v0, v2

    :catch_12f
    move-object v2, v6

    goto :goto_153

    :catch_131
    move-exception v6

    goto :goto_13a

    :catchall_133
    move-exception p0

    move-object v5, p1

    :goto_135
    move-object v6, v2

    goto :goto_170

    :catch_137
    move-exception v5

    move-object v6, v5

    move-object v5, p1

    :goto_13a
    :try_start_13a
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u5931\u6557 "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    if-eqz v5, :cond_16c

    goto :goto_165

    :catchall_150
    move-exception p0

    goto :goto_135

    :catch_152
    move-object v5, p1

    :catch_153
    :goto_153
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u30bf\u30a4\u30e0\u30a2\u30a6\u30c8 SaveThumbnail / "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_163
    .catchall {:try_start_13a .. :try_end_163} :catchall_150

    if-eqz v5, :cond_16c

    :goto_165
    :try_start_165
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_168
    .catchall {:try_start_165 .. :try_end_168} :catchall_169

    goto :goto_16c

    :catchall_169
    move-exception p0

    move-object v6, v2

    goto :goto_177

    :cond_16c
    :goto_16c
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_c1

    :goto_170
    if-eqz v5, :cond_175

    :try_start_172
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_175
    throw p0
    :try_end_176
    .catchall {:try_start_172 .. :try_end_176} :catchall_176

    :catchall_176
    move-exception p0

    :goto_177
    :try_start_177
    invoke-virtual {v6}, Ljava/io/BufferedInputStream;->close()V

    invoke-virtual {p2}, Ljava/io/BufferedOutputStream;->flush()V

    invoke-virtual {p2}, Ljava/io/BufferedOutputStream;->close()V

    throw p0

    :cond_181
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V

    invoke-virtual {p2}, Ljava/io/BufferedOutputStream;->flush()V

    invoke-virtual {p2}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_18a
    .catch Ljava/lang/Exception; {:try_start_177 .. :try_end_18a} :catch_18b

    goto :goto_18f

    :catch_18b
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_18f
    return-void
.end method

.method public static a(Ljava/lang/String;Landroid/content/Context;)[J
    .registers 12

    new-instance v0, Le/e/a/o$b;

    invoke-direct {v0, p0}, Le/e/a/o$b;-><init>(Ljava/lang/String;)V

    new-instance v1, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/nicoid/nicoid_cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    const-wide/16 v4, 0x0

    if-eqz v0, :cond_3f

    move-wide v6, v4

    const/4 v2, 0x0

    :goto_2a
    array-length v8, v0

    if-ge v2, v8, :cond_47

    aget-object v8, v0, v2

    invoke-virtual {v8}, Ljava/io/File;->isFile()Z

    move-result v8

    if-eqz v8, :cond_3c

    aget-object v8, v0, v2

    invoke-virtual {v8}, Ljava/io/File;->length()J

    move-result-wide v8

    add-long/2addr v6, v8

    :cond_3c
    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    :cond_3f
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "null"

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move-wide v6, v4

    :cond_47
    new-instance v0, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".mp4"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_6e

    goto :goto_70

    :cond_6e
    const-wide/16 v4, -0x1

    :goto_70
    const/4 p0, 0x2

    new-array p0, p0, [J

    aput-wide v6, p0, v1

    const/4 p1, 0x1

    aput-wide v4, p0, p1

    return-object p0
.end method

.method public static b(Ljava/lang/String;Landroid/content/Context;)J
    .registers 8

    new-instance v0, Le/e/a/o$a;

    invoke-direct {v0, p0}, Le/e/a/o$a;-><init>(Ljava/lang/String;)V

    new-instance v1, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/nicoid/nicoid_cache/"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object p1

    const-string v0, "\u524a\u9664\uff1a"

    const-wide/16 v1, 0x0

    if-eqz p1, :cond_5d

    const/4 v3, 0x0

    :goto_2a
    array-length v4, p1

    if-ge v3, v4, :cond_64

    :try_start_2d
    aget-object v4, p1, v3

    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_5a

    aget-object v4, p1, v3

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v4

    add-long/2addr v1, v4

    aget-object v4, p1, v3

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v5, p1, v3

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_55} :catch_56

    goto :goto_5a

    :catch_56
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    :cond_5a
    :goto_5a
    add-int/lit8 v3, v3, 0x1

    goto :goto_2a

    :cond_5d
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "null"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_64
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    return-wide v1
.end method

.method public static b(Landroid/content/Context;)V
    .registers 4

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    :goto_20
    if-ge v1, v0, :cond_2a

    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    :cond_2a
    return-void
.end method

.method public static c(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    invoke-static {p0}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static d(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_35

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Le/e/a/o;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/nicoid/history.json"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-static {}, Le/e/a/o;->a()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2b
    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 2
    :cond_35
    invoke-static {}, Le/e/a/o;->a()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
