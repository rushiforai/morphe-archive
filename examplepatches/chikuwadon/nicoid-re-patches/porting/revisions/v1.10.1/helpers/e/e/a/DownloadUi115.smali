.class public final Le/e/a/DownloadUi115;
.super Ljava/lang/Object;
.source "DownloadUi115.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/DownloadUi115$FolderPicker;,
        Le/e/a/DownloadUi115$Manager;,
        Le/e/a/DownloadUi115$Row;
    }
.end annotation


# static fields
.field static final MAIN:Landroid/os/Handler;

.field static final MENU:I = 0x46d3

.field static final TREE:Ljava/lang/String; = "mp4_tree_uri"


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 4
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/DownloadUi115;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static caches(Landroid/content/Context;)Ljava/util/List;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Le/e/a/DownloadUi115$Row;",
            ">;"
        }
    .end annotation

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_5
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v1, Le/e/a/CacheFile;

    invoke-direct {v1, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_de

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_2d
    if-lt v4, v2, :cond_31

    goto/16 :goto_de

    :cond_31
    aget-object v5, v1, v4

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, ".json"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_40

    :goto_3f
    goto :goto_a2

    :cond_40
    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_4b

    goto :goto_3f

    :cond_4b
    invoke-static {p0, v6}, Le/e/a/CachedPlayback;->completedBytes(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v11, v7, v9

    if-gtz v11, :cond_56

    goto :goto_3f

    :cond_56
    new-instance v9, Le/e/a/DownloadUi115$Row;

    invoke-direct {v9}, Le/e/a/DownloadUi115$Row;-><init>()V

    iput-object v6, v9, Le/e/a/DownloadUi115$Row;->id:Ljava/lang/String;

    iput-object v6, v9, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    const/4 v10, 0x1

    iput-boolean v10, v9, Le/e/a/DownloadUi115$Row;->cache:Z

    const-string v10, "\u4fdd\u5b58\u6e08\u307f"

    iput-object v10, v9, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    iput-wide v7, v9, Le/e/a/DownloadUi115$Row;->bytes:J

    const/16 v7, 0x64

    iput v7, v9, Le/e/a/DownloadUi115$Row;->percent:I
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_6c} :catch_d6

    const/4 v7, 0x0

    :try_start_6d
    new-instance v8, Le/e/a/CacheInputStream;

    invoke-direct {v8, v5}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_72
    .catchall {:try_start_6d .. :try_end_72} :catchall_cc

    :try_start_72
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_77
    .catchall {:try_start_72 .. :try_end_77} :catchall_be

    const/16 v10, 0x1000

    :try_start_79
    new-array v10, v10, [B

    :goto_7b
    invoke-virtual {v8, v10}, Ljava/io/InputStream;->read([B)I

    move-result v11

    const/4 v12, -0x1

    if-ne v11, v12, :cond_a5

    new-instance v10, Lorg/json/JSONObject;

    const-string v11, "UTF-8"

    invoke-virtual {v5, v11}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v10, v6}, Le/e/a/CacheTitles117;->title(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    iget-object v10, v9, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    invoke-static {v6, v10}, Le/e/a/CacheTitles117;->remember(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_98
    .catchall {:try_start_79 .. :try_end_98} :catchall_b8

    :try_start_98
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_9b
    .catchall {:try_start_98 .. :try_end_9b} :catchall_be

    :try_start_9b
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_9e
    .catchall {:try_start_9b .. :try_end_9e} :catchall_cc

    :try_start_9e
    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_a1
    .catch Ljava/lang/Exception; {:try_start_9e .. :try_end_a1} :catch_d6

    goto :goto_3f

    :goto_a2
    add-int/lit8 v4, v4, 0x1

    goto :goto_2d

    :cond_a5
    :try_start_a5
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v12

    add-int/2addr v12, v11

    const/high16 v13, 0x200000

    if-gt v12, v13, :cond_b2

    invoke-virtual {v5, v10, v3, v11}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_7b

    :cond_b2
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
    :try_end_b8
    .catchall {:try_start_a5 .. :try_end_b8} :catchall_b8

    :catchall_b8
    move-exception p0

    move-object v7, p0

    :try_start_ba
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v7
    :try_end_be
    .catchall {:try_start_ba .. :try_end_be} :catchall_be

    :catchall_be
    move-exception p0

    if-eqz v7, :cond_c7

    if-eq v7, p0, :cond_c8

    :try_start_c3
    invoke-virtual {v7, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_c8

    :cond_c7
    move-object v7, p0

    :cond_c8
    :goto_c8
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    throw v7
    :try_end_cc
    .catchall {:try_start_c3 .. :try_end_cc} :catchall_cc

    :catchall_cc
    move-exception p0

    if-eqz v7, :cond_d5

    if-eq v7, p0, :cond_d4

    :try_start_d1
    invoke-virtual {v7, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_d4
    move-object p0, v7

    :cond_d5
    throw p0
    :try_end_d6
    .catch Ljava/lang/Exception; {:try_start_d1 .. :try_end_d6} :catch_d6

    :catch_d6
    move-exception p0

    const-string v1, "nicoid-download"

    const-string v2, "Cannot list cached downloads"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_de
    :goto_de
    return-object v0
.end method

.method static choose(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    .line 8
    const-string v0, "480p\u4ee5\u4e0b"

    const-string v1, "360p\u4ee5\u4e0b"

    const-string v2, "\u6700\u9ad8\u753b\u8cea"

    const-string v3, "1080p\u4ee5\u4e0b"

    const-string v4, "720p\u4ee5\u4e0b"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x5

    new-array v1, v1, [I

    const/4 v2, 0x1

    const/16 v3, 0x438

    aput v3, v1, v2

    const/4 v2, 0x2

    const/16 v3, 0x2d0

    aput v3, v1, v2

    const/4 v2, 0x3

    const/16 v3, 0x1e0

    aput v3, v1, v2

    const/4 v2, 0x4

    const/16 v3, 0x168

    aput v3, v1, v2

    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "MP4\u3067\u4fdd\u5b58"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Le/e/a/DownloadUi115$$ExternalSyntheticLambda19;

    invoke-direct {v3, p0, p1, p2, v1}, Le/e/a/DownloadUi115$$ExternalSyntheticLambda19;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[I)V

    invoke-virtual {v2, v0, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static enqueue(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 5

    .line 10
    invoke-static {p0, p1, p2, p3}, Le/e/a/DownloadJobs115;->enqueue(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Le/e/a/DownloadJobs115$Job;

    move-result-object p1

    invoke-static {p1}, Le/e/a/DownloadWorker115;->running(Le/e/a/DownloadJobs115$Job;)Z

    move-result p2

    if-nez p2, :cond_21

    invoke-static {p1}, Le/e/a/DownloadUi115;->queued(Le/e/a/DownloadJobs115$Job;)Z

    move-result p2

    if-nez p2, :cond_21

    invoke-static {p0}, Le/e/a/DownloadUi115;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    const-string p3, "mp4_tree_uri"

    const-string v0, ""

    invoke-interface {p2, p3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    invoke-static {p0, p1}, Le/e/a/DownloadJobs115;->submit(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)V

    :cond_21
    const-string p1, "\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u30ad\u30e5\u30fc\u306b\u8ffd\u52a0\u3057\u307e\u3057\u305f"

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static folder(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 8

    .line 14
    const-string v0, "mp4-folder115"

    :try_start_2
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    check-cast v2, Le/e/a/DownloadUi115$FolderPicker;

    if-nez v2, :cond_21

    new-instance v2, Le/e/a/DownloadUi115$FolderPicker;

    invoke-direct {v2}, Le/e/a/DownloadUi115$FolderPicker;-><init>()V

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    invoke-virtual {v1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_21
    invoke-virtual {v2, p1, p2, p3}, Le/e/a/DownloadUi115$FolderPicker;->pick(Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_24} :catch_25

    goto :goto_30

    :catch_25
    move-exception p1

    const-string p1, "\u4fdd\u5b58\u5148\u3092\u9078\u629e\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_30
    return-void
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 3

    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-static {p0, p1}, Le/e/a/DownloadUi115;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    :cond_f
    return-void
.end method

.method static synthetic lambda$1(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 2

    .line 7
    invoke-static {p0}, Le/e/a/DownloadUi115;->show(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[ILandroid/content/DialogInterface;I)V
    .registers 8

    .line 8
    invoke-static {p0}, Le/e/a/DownloadUi115;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p4

    const-string v0, "mp4_tree_uri"

    const-string v1, ""

    invoke-interface {p4, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-eqz p4, :cond_18

    aget p3, p3, p5

    invoke-static {p0, p1, p2, p3}, Le/e/a/DownloadUi115;->folder(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_1d

    :cond_18
    aget p3, p3, p5

    invoke-static {p0, p1, p2, p3}, Le/e/a/DownloadUi115;->enqueue(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I)V

    :goto_1d
    return-void
.end method

.method static synthetic lambda$3(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 3

    .line 13
    const/4 p1, 0x0

    const/4 v0, 0x0

    invoke-static {p0, p1, p1, v0}, Le/e/a/DownloadUi115;->folder(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$4(Le/e/a/DownloadUi115$Manager;I)V
    .registers 3

    .line 32
    iput p1, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->tabs:Le/e/a/Ui110$Tabs;

    invoke-virtual {v0, p1}, Le/e/a/Ui110$Tabs;->select(I)V

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    const/4 v0, 0x1

    if-ne p1, v0, :cond_10

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->reload()V

    :cond_10
    return-void
.end method

.method static synthetic lambda$6(Le/e/a/DownloadUi115$Manager;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6

    .line 41
    iget-object p1, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/DownloadUi115$Row;

    invoke-virtual {p0, p1}, Le/e/a/DownloadUi115$Manager;->actions(Le/e/a/DownloadUi115$Row;)V

    return-void
.end method

.method static synthetic lambda$7(Le/e/a/DownloadUi115$Manager;Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 6

    .line 42
    iget-object p1, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/DownloadUi115$Row;

    invoke-virtual {p0, p1}, Le/e/a/DownloadUi115$Manager;->removeHistory(Le/e/a/DownloadUi115$Row;)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$8(Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 2

    .line 44
    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$9(Le/e/a/DownloadUi115$Manager;Landroid/content/DialogInterface;)V
    .registers 2

    .line 45
    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/DownloadUi115$Manager;->closed:Z

    sget-object p1, Le/e/a/DownloadUi115;->MAIN:Landroid/os/Handler;

    iget-object p0, p0, Le/e/a/DownloadUi115$Manager;->tick:Ljava/lang/Runnable;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method static liveCache()Le/e/a/DownloadUi115$Row;
    .registers 7

    .line 18
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "v"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_81

    sget-object v2, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    if-eqz v2, :cond_18

    goto :goto_81

    :cond_18
    new-instance v2, Le/e/a/DownloadUi115$Row;

    invoke-direct {v2}, Le/e/a/DownloadUi115$Row;-><init>()V

    const/4 v3, 0x1

    iput-boolean v3, v2, Le/e/a/DownloadUi115$Row;->cache:Z

    const-string v3, "t"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Le/e/a/DownloadUi115$Row;->id:Ljava/lang/String;

    iget-object v3, v2, Le/e/a/DownloadUi115$Row;->id:Ljava/lang/String;

    const-string v4, "(?:sm|so|nm|ss)?[0-9]+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3b

    return-object v0

    :cond_3b
    iget-object v3, v2, Le/e/a/DownloadUi115$Row;->id:Ljava/lang/String;

    invoke-static {v3}, Le/e/a/CacheTitles117;->known(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    const-string v3, "\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u4e2d"

    iput-object v3, v2, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    const-string v3, "s"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v3

    iput-wide v3, v2, Le/e/a/DownloadUi115$Row;->bytes:J

    const-string v3, "r"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v3

    iput-wide v3, v2, Le/e/a/DownloadUi115$Row;->total:J

    iget-wide v3, v2, Le/e/a/DownloadUi115$Row;->total:J

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-lez v1, :cond_7d

    iget-wide v3, v2, Le/e/a/DownloadUi115$Row;->bytes:J

    long-to-double v3, v3

    const-wide/high16 v5, 0x4059000000000000L    # 100.0

    mul-double v3, v3, v5

    iget-wide v5, v2, Le/e/a/DownloadUi115$Row;->total:J

    long-to-double v5, v5

    div-double/2addr v3, v5

    const-wide v5, 0x4058c00000000000L    # 99.0

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v3

    double-to-int v1, v3

    goto :goto_7e

    :cond_7d
    const/4 v1, -0x1

    :goto_7e
    iput v1, v2, Le/e/a/DownloadUi115$Row;->percent:I
    :try_end_80
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_80} :catch_82

    return-object v2

    :cond_81
    :goto_81
    return-object v0

    :catch_82
    move-exception v1

    return-object v0
.end method

.method public static menu(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 7

    .line 7
    const/16 v0, 0x46d3

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-nez v1, :cond_2a

    const/16 v1, 0x46c8

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-nez v1, :cond_12

    const/4 v1, 0x2

    goto :goto_18

    :cond_12
    invoke-interface {v1}, Landroid/view/MenuItem;->getOrder()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    :goto_18
    const-string v2, "Downloads"

    const-string v3, "\u4e0b\u8f09"

    const-string v4, "\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9"

    invoke-static {p0, v4, v2, v3}, Le/e/a/DownloadUi115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {p1, v3, v0, v1, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    :cond_2a
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    new-instance v1, Le/e/a/DownloadUi115$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0}, Le/e/a/DownloadUi115$$ExternalSyntheticLambda11;-><init>(Landroid/app/Activity;)V

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    invoke-static {p0, p1}, Le/e/a/MenuOptions119;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    return-void
.end method

.method static open(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;Z)V
    .registers 10

    .line 60
    const-string v0, "video/mp4"

    const/4 v1, 0x1

    if-eqz p2, :cond_1d

    :try_start_5
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.SEND"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v2, "android.intent.extra.STREAM"

    iget-object v3, p1, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v0

    goto :goto_2e

    :cond_1d
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v3, p1, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    :goto_2e
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object v2, p1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    iget-object p1, p1, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/content/ClipData;->newRawUri(Ljava/lang/CharSequence;Landroid/net/Uri;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/high16 v3, 0x10000

    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_53
    :goto_53
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_88

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_82

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Intent;

    if-eqz p2, :cond_6b

    const-string p2, "MP4\u3092\u5171\u6709"

    goto :goto_6d

    :cond_6b
    const-string p2, "\u5916\u90e8\u30a2\u30d7\u30ea\u3067\u958b\u304f"

    :goto_6d
    invoke-static {v2, p2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p2

    const-string v2, "android.intent.extra.INITIAL_INTENTS"

    new-array v0, v0, [Landroid/content/Intent;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/os/Parcelable;

    invoke-virtual {p2, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p0, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_c5

    :cond_82
    new-instance p1, Landroid/content/ActivityNotFoundException;

    invoke-direct {p1}, Landroid/content/ActivityNotFoundException;-><init>()V

    throw p1

    :cond_88
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    iget-object v4, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v4, :cond_53

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a1

    goto :goto_53

    :cond_a1
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    new-instance v5, Landroid/content/ComponentName;

    iget-object v6, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v3, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v5, v6, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_ba
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_ba} :catch_bb

    goto :goto_53

    :catch_bb
    move-exception p1

    const-string p1, "\u5bfe\u5fdc\u3059\u308b\u5916\u90e8\u30a2\u30d7\u30ea\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_c5
    return-void
.end method

.method static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5

    .line 12
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_9

    const/4 p0, 0x0

    return-object p0

    :cond_9
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    if-ne v1, p1, :cond_10

    return-object p0

    :cond_10
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1d

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1, p1}, Le/e/a/DownloadUi115;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-eqz v1, :cond_1d

    return-object v1

    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 9
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static queued(Le/e/a/DownloadJobs115$Job;)Z
    .registers 5

    .line 11
    :try_start_0
    const-string v0, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "u"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_42

    new-instance v1, Ljava/util/ArrayList;

    check-cast v0, Ljava/util/List;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_20
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_27

    goto :goto_42

    :cond_27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/content/Intent;

    if-eqz v2, :cond_20

    iget-object v2, p0, Le/e/a/DownloadJobs115$Job;->token:Ljava/lang/String;

    check-cast v1, Landroid/content/Intent;

    const-string v3, "nicoid_mp4_job115"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3d} :catch_41

    if-eqz v1, :cond_20

    const/4 p0, 0x1

    return p0

    :catch_41
    move-exception p0

    :cond_42
    :goto_42
    const/4 p0, 0x0

    return p0
.end method

.method static queuedCaches()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Le/e/a/DownloadUi115$Row;",
            ">;"
        }
    .end annotation

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_5
    const-string v1, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "u"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Ljava/util/List;

    if-eqz v2, :cond_7f

    new-instance v2, Ljava/util/ArrayList;

    check-cast v1, Ljava/util/List;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_25
    :goto_25
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2c

    goto :goto_7f

    :cond_2c
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Landroid/content/Intent;

    if-eqz v3, :cond_25

    move-object v3, v2

    check-cast v3, Landroid/content/Intent;

    const-string v4, "nicoid_mp4_job115"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_25

    check-cast v2, Landroid/content/Intent;

    new-instance v3, Le/e/a/DownloadUi115$Row;

    invoke-direct {v3}, Le/e/a/DownloadUi115$Row;-><init>()V

    const/4 v4, 0x1

    iput-boolean v4, v3, Le/e/a/DownloadUi115$Row;->cache:Z

    const-string v4, "id"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Le/e/a/DownloadUi115$Row;->id:Ljava/lang/String;

    const-string v4, "title"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    iget-object v2, v3, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    if-eqz v2, :cond_6e

    iget-object v2, v3, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_66

    goto :goto_6e

    :cond_66
    iget-object v2, v3, Le/e/a/DownloadUi115$Row;->id:Ljava/lang/String;

    iget-object v4, v3, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    invoke-static {v2, v4}, Le/e/a/CacheTitles117;->remember(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_76

    :cond_6e
    :goto_6e
    iget-object v2, v3, Le/e/a/DownloadUi115$Row;->id:Ljava/lang/String;

    invoke-static {v2}, Le/e/a/CacheTitles117;->known(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    :goto_76
    const-string v2, "\u30ad\u30e5\u30fc\u5f85\u3061"

    iput-object v2, v3, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_7d} :catch_7e

    goto :goto_25

    :catch_7e
    move-exception v1

    :cond_7f
    :goto_7f
    return-object v0
.end method

.method public static scheduleMenu(Ljava/lang/Object;Landroid/view/Menu;)V
    .registers 4

    .line 6
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_18

    if-nez p1, :cond_7

    goto :goto_18

    :cond_7
    check-cast p0, Landroid/app/Activity;

    const/16 v0, 0x46d3

    invoke-interface {p1, v0}, Landroid/view/Menu;->removeItem(I)V

    sget-object v0, Le/e/a/DownloadUi115;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/DownloadUi115$$ExternalSyntheticLambda18;

    invoke-direct {v1, p0, p1}, Le/e/a/DownloadUi115$$ExternalSyntheticLambda18;-><init>(Landroid/app/Activity;Landroid/view/Menu;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_18
    :goto_18
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 5

    .line 13
    const-string v0, "cache_dir"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-nez v0, :cond_a

    const/4 v0, 0x0

    goto :goto_12

    :cond_a
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-static {v1, v0}, Le/e/a/DownloadUi115;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v0

    :goto_12
    if-nez v0, :cond_15

    return-void

    :cond_15
    const-string v1, "mp4_tree_uri"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-nez v2, :cond_33

    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v3, "MP4\u306e\u4fdd\u5b58\u5148\u30d5\u30a9\u30eb\u30c0"

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const v3, 0x7fffffff

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setOrder(I)V

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    :cond_33
    invoke-static {p0}, Le/e/a/DownloadUi115;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v3, ""

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :try_start_3d
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4d

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_4b} :catch_4c

    goto :goto_4f

    :catch_4c
    move-exception v0

    :cond_4d
    const-string v0, "\u672a\u6307\u5b9a\uff08\u521d\u56de\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u6642\u306b\u9078\u629e\uff09"

    :goto_4f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\n\u4fdd\u5b58\u3057\u305fMP4\u306f\u672c\u30a2\u30d7\u30ea\u3067\u306f\u518d\u751f\u3067\u304d\u307e\u305b\u3093\u3002\u5916\u90e8\u306e\u52d5\u753b\u518d\u751f\u30a2\u30d7\u30ea\u3092\u3054\u5229\u7528\u304f\u3060\u3055\u3044\u3002"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/DownloadUi115$$ExternalSyntheticLambda10;

    invoke-direct {v0, p0}, Le/e/a/DownloadUi115$$ExternalSyntheticLambda10;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    return-void
.end method

.method public static show(Landroid/app/Activity;)V
    .registers 16

    .line 21
    invoke-static {p0}, Le/e/a/DownloadJobs115;->init(Landroid/content/Context;)V

    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    .line 22
    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v7

    const/16 v1, 0xc

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v8, 0x0

    invoke-virtual {v7, v2, v8, v3, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 23
    const-string v2, "\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9"

    const/16 v3, 0x14

    invoke-static {v0, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setAccessibilityHeading(Z)V

    .line 24
    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v2, v5, v3, v6, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 25
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v9, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    new-instance v2, Landroid/widget/ListView;

    invoke-direct {v2, v0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    invoke-static {v0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 27
    const-string v3, "\u8a72\u5f53\u3059\u308b\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u306f\u3042\u308a\u307e\u305b\u3093"

    const/16 v4, 0xe

    invoke-static {v0, v3, v4}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 28
    const/16 v4, 0x18

    invoke-static {v0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v3, v8, v6, v8, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 29
    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v9, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v2, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v10, 0x30

    invoke-direct {v6, v9, v5, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v4, v3, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 31
    new-instance v11, Le/e/a/DownloadUi115$Manager;

    invoke-direct {v11, p0, v0, v2}, Le/e/a/DownloadUi115$Manager;-><init>(Landroid/app/Activity;Landroid/content/Context;Landroid/widget/ListView;)V

    .line 32
    new-instance v3, Le/e/a/Ui110$Swipe;

    new-instance v6, Le/e/a/DownloadUi115$$ExternalSyntheticLambda12;

    invoke-direct {v6, v11}, Le/e/a/DownloadUi115$$ExternalSyntheticLambda12;-><init>(Le/e/a/DownloadUi115$Manager;)V

    const/4 v12, 0x3

    invoke-direct {v3, v0, v12, v6}, Le/e/a/Ui110$Swipe;-><init>(Landroid/content/Context;ILjava/util/function/IntConsumer;)V

    .line 33
    new-instance v6, Le/e/a/Ui110$Tabs;

    const-string v12, "\u4fdd\u5b58\u6e08\u307f"

    const-string v13, "\u30a8\u30e9\u30fc"

    const-string v14, "\u9032\u884c\u4e2d"

    filled-new-array {v14, v12, v13}, [Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v13, Le/e/a/DownloadUi115$$ExternalSyntheticLambda13;

    invoke-direct {v13, v3}, Le/e/a/DownloadUi115$$ExternalSyntheticLambda13;-><init>(Le/e/a/Ui110$Swipe;)V

    invoke-direct {v6, v0, v12, v13}, Le/e/a/Ui110$Tabs;-><init>(Landroid/content/Context;[Ljava/lang/String;Ljava/util/function/IntConsumer;)V

    iput-object v6, v11, Le/e/a/DownloadUi115$Manager;->tabs:Le/e/a/Ui110$Tabs;

    .line 34
    iget-object v6, v11, Le/e/a/DownloadUi115$Manager;->tabs:Le/e/a/Ui110$Tabs;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v12, v9, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v6, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v9, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v6}, Le/e/a/Ui110$Swipe;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v4, v9, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v4, 0x800015

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 38
    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v6, 0x8

    invoke-static {v0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/16 v12, 0x10

    invoke-static {v0, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v3, v4, v6, v1, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 39
    const-string v1, "\u9589\u3058\u308b"

    invoke-static {v0, v1}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v12

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v0, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v1, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v12, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v9, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    invoke-virtual {v2, v11}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance v1, Le/e/a/DownloadUi115$$ExternalSyntheticLambda14;

    invoke-direct {v1, v11}, Le/e/a/DownloadUi115$$ExternalSyntheticLambda14;-><init>(Le/e/a/DownloadUi115$Manager;)V

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 42
    new-instance v1, Le/e/a/DownloadUi115$$ExternalSyntheticLambda15;

    invoke-direct {v1, v11}, Le/e/a/DownloadUi115$$ExternalSyntheticLambda15;-><init>(Le/e/a/DownloadUi115$Manager;)V

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 43
    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, v0

    move-object v2, v7

    invoke-virtual/range {v1 .. v6}, Landroid/app/AlertDialog;->setView(Landroid/view/View;IIII)V

    iput-object v0, v11, Le/e/a/DownloadUi115$Manager;->dialog:Landroid/app/AlertDialog;

    .line 44
    new-instance v1, Le/e/a/DownloadUi115$$ExternalSyntheticLambda16;

    invoke-direct {v1, v0}, Le/e/a/DownloadUi115$$ExternalSyntheticLambda16;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {v12, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    new-instance v1, Le/e/a/DownloadUi115$$ExternalSyntheticLambda17;

    invoke-direct {v1, v11}, Le/e/a/DownloadUi115$$ExternalSyntheticLambda17;-><init>(Le/e/a/DownloadUi115$Manager;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 46
    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    invoke-static {v12, v8}, Le/e/a/UiDialogs;->actionButton(Landroid/widget/Button;Z)V

    .line 47
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_166

    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p0, p0

    const v1, 0x3f666666    # 0.9f

    mul-float p0, p0, v1

    float-to-int p0, p0

    .line 50
    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v9, p0}, Landroid/view/Window;->setLayout(II)V

    .line 53
    :cond_166
    iget-object p0, v11, Le/e/a/DownloadUi115$Manager;->tick:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    invoke-virtual {v11}, Le/e/a/DownloadUi115$Manager;->reload()V

    .line 54
    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 5
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
