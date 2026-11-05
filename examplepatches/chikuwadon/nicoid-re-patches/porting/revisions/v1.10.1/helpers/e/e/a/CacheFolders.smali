.class public final Le/e/a/CacheFolders;
.super Ljava/lang/Object;
.source "CacheFolders.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CacheFolders$Entry;,
        Le/e/a/CacheFolders$Picker;
    }
.end annotation


# static fields
.field private static final KEY:Ljava/lang/String; = "cache_tree_uri"

.field private static final MAIN:Landroid/os/Handler;

.field private static final PREFIX:Ljava/lang/String; = "/@nicoid-cache/"

.field private static final SUFFIX:Ljava/lang/String; = "/nicoid/nicoid_cache"

.field private static final VIDEO_ID:Ljava/util/regex/Pattern;

.field private static final comments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static volatile context:Landroid/content/Context;

.field private static final indexes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/DirectoryIndex<",
            "Landroid/net/Uri;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 18
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/CacheFolders;->MAIN:Landroid/os/Handler;

    .line 43
    new-instance v0, Le/e/a/CacheFolders$1;

    const/16 v1, 0x8

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Le/e/a/CacheFolders$1;-><init>(IFZ)V

    sput-object v0, Le/e/a/CacheFolders;->indexes:Ljava/util/Map;

    .line 60
    const-string v0, "^((?:sm|so|nm|ss)[0-9]+)(?:[._].*)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/CacheFolders;->VIDEO_ID:Ljava/util/regex/Pattern;

    .line 65
    new-instance v0, Le/e/a/CacheFolders$2;

    const/4 v1, 0x4

    invoke-direct {v0, v1, v2, v3}, Le/e/a/CacheFolders$2;-><init>(IFZ)V

    sput-object v0, Le/e/a/CacheFolders;->comments:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/content/Intent;)Z
    .registers 1

    .line 121
    invoke-static {p0}, Le/e/a/CacheFolders;->replaceHost(Landroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 30
    invoke-static {p0}, Le/e/a/CacheFolders;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2(Landroid/content/Intent;)Z
    .registers 1

    .line 130
    invoke-static {p0}, Le/e/a/CacheFolders;->pageRequest(Landroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$3(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;
    .registers 3

    .line 108
    invoke-static {p0, p1, p2}, Le/e/a/CacheFolders;->service(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4(Le/e/a/CacheFolders$Entry;)Le/e/a/DirectoryIndex$Item;
    .registers 1

    .line 50
    invoke-static {p0}, Le/e/a/CacheFolders;->item(Le/e/a/CacheFolders$Entry;)Le/e/a/DirectoryIndex$Item;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$5(Landroid/net/Uri;Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    invoke-static {p0, p1}, Le/e/a/CacheFolders;->rawStat(Landroid/net/Uri;Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;

    move-result-object p0

    return-object p0
.end method

.method private static activity(Landroid/content/Context;)Landroid/app/Activity;
    .registers 2

    .line 104
    nop

    :goto_1
    instance-of v0, p0, Landroid/content/ContextWrapper;

    if-nez v0, :cond_6

    :goto_5
    goto :goto_17

    :cond_6
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_d

    check-cast p0, Landroid/app/Activity;

    return-object p0

    :cond_d
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-ne v0, p0, :cond_20

    goto :goto_5

    :goto_17
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_1e

    check-cast p0, Landroid/app/Activity;

    goto :goto_1f

    :cond_1e
    const/4 p0, 0x0

    :goto_1f
    return-object p0

    :cond_20
    move-object p0, v0

    goto :goto_1
.end method

.method static cacheChildren(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/List<",
            "Le/e/a/CacheFolders$Entry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Le/e/a/CacheFolders;->index(Landroid/net/Uri;)Le/e/a/DirectoryIndex;

    move-result-object p1

    invoke-virtual {p1}, Le/e/a/DirectoryIndex;->all()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_11
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_18

    return-object p0

    :cond_18
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/DirectoryIndex$Item;

    invoke-static {v0}, Le/e/a/CacheFolders;->entry(Le/e/a/DirectoryIndex$Item;)Le/e/a/CacheFolders$Entry;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11
.end method

.method static changed(Ljava/io/File;)V
    .registers 2

    .line 53
    invoke-static {p0}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    :try_start_7
    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheFolders;->index(Landroid/net/Uri;)Le/e/a/DirectoryIndex;

    move-result-object v0

    invoke-static {p0}, Le/e/a/CacheFolders;->relative(Ljava/io/File;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Le/e/a/DirectoryIndex;->changed(Ljava/lang/String;)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_16} :catch_17

    goto :goto_18

    :catch_17
    move-exception p0

    :goto_18
    return-void
.end method

.method static children(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/List<",
            "Le/e/a/CacheFolders$Entry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    const-string v0, "Cache folder unavailable"

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/provider/DocumentsContract;->buildChildDocumentsUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 73
    const-string p0, "_size"

    const-string v2, "last_modified"

    const-string v4, "document_id"

    const-string v5, "_display_name"

    const-string v6, "mime_type"

    filled-new-array {v4, v5, v6, p0, v2}, [Ljava/lang/String;

    move-result-object v4

    .line 74
    const/4 p0, 0x0

    :try_start_1e
    sget-object v2, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_2b
    .catchall {:try_start_1e .. :try_end_2b} :catchall_77

    .line 75
    if-eqz v2, :cond_6b

    .line 76
    :goto_2d
    :try_start_2d
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3
    :try_end_31
    .catchall {:try_start_2d .. :try_end_31} :catchall_69

    if-nez v3, :cond_39

    .line 77
    if-eqz v2, :cond_38

    :try_start_35
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_38
    .catchall {:try_start_35 .. :try_end_38} :catchall_77

    :cond_38
    return-object v1

    .line 76
    :cond_39
    :try_start_39
    new-instance v3, Le/e/a/CacheFolders$Entry;

    invoke-direct {v3}, Le/e/a/CacheFolders$Entry;-><init>()V

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v4}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    iput-object v4, v3, Le/e/a/CacheFolders$Entry;->uri:Landroid/net/Uri;

    const/4 v4, 0x1

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    const/4 v4, 0x2

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    const/4 v4, 0x3

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    iput-wide v4, v3, Le/e/a/CacheFolders$Entry;->size:J

    const/4 v4, 0x4

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    iput-wide v4, v3, Le/e/a/CacheFolders$Entry;->time:J

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2d

    .line 77
    :catchall_69
    move-exception p0

    goto :goto_71

    .line 75
    :cond_6b
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_71
    .catchall {:try_start_39 .. :try_end_71} :catchall_69

    .line 77
    :goto_71
    if-eqz v2, :cond_76

    :try_start_73
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_76
    throw p0
    :try_end_77
    .catchall {:try_start_73 .. :try_end_77} :catchall_77

    :catchall_77
    move-exception p1

    if-eqz p0, :cond_80

    if-eq p0, p1, :cond_81

    :try_start_7c
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_81

    :cond_80
    move-object p0, p1

    :cond_81
    :goto_81
    throw p0
    :try_end_82
    .catch Ljava/lang/RuntimeException; {:try_start_7c .. :try_end_82} :catch_82

    :catch_82
    move-exception p0

    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method static choose(Landroid/app/Activity;Landroid/content/Intent;)V
    .registers 4

    .line 133
    sget-object v0, Le/e/a/CacheFolders;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/CacheFolders$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Le/e/a/CacheFolders$$ExternalSyntheticLambda4;-><init>(Landroid/app/Activity;Landroid/content/Intent;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 148
    return-void
.end method

.method static cleanupVideoFolder(Ljava/io/File;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 56
    invoke-static {p0}, Le/e/a/CacheFolders;->relative(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CacheFolders;->index(Landroid/net/Uri;)Le/e/a/DirectoryIndex;

    move-result-object v1

    invoke-virtual {v1, v0}, Le/e/a/DirectoryIndex;->directory(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    if-nez v2, :cond_1c

    return-void

    .line 57
    :cond_1c
    invoke-static {v2, p0}, Le/e/a/CacheFolders;->children(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_24
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_3a

    .line 58
    sget-object p0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, v2}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    move-result p0

    if-eqz p0, :cond_39

    invoke-virtual {v1, v0}, Le/e/a/DirectoryIndex;->removeDirectory(Ljava/lang/String;)V

    .line 59
    :cond_39
    return-void

    .line 57
    :cond_3a
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/CacheFolders$Entry;

    const-string v4, ".nomedia"

    iget-object v3, v3, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_24

    return-void
.end method

.method public static comments(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5

    .line 66
    if-eqz p2, :cond_18

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const v1, 0x1e8480

    if-ge v0, v1, :cond_18

    sget-object v0, Le/e/a/CacheFolders;->comments:Ljava/util/Map;

    monitor-enter v0

    :try_start_e
    sget-object v1, Le/e/a/CacheFolders;->comments:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    goto :goto_18

    :catchall_15
    move-exception p0

    monitor-exit v0
    :try_end_17
    .catchall {:try_start_e .. :try_end_17} :catchall_15

    throw p0

    :cond_18
    :goto_18
    invoke-static {p0, p1}, Le/e/a/CacheFolders;->saveComments(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static copy(Landroid/app/Activity;Ljava/io/File;)V
    .registers 11

    .line 181
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/nicoid/nicoid_cache"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v4, 0x18

    invoke-static {v1, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v2, v4, v4, v4, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v5, Landroid/widget/ProgressBar;

    invoke-direct {v5, v1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x28

    invoke-static {v1, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {v1, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v6, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v6, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u30b3\u30d4\u30fc\u4e2d"

    invoke-static {v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v6, v6, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v4, v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    .line 182
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v5}, Landroid/widget/ProgressBar;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    const v4, 0x7f03005e

    const/4 v6, 0x1

    invoke-virtual {v3, v4, v2, v6}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v3, v2, Landroid/util/TypedValue;->resourceId:I

    if-nez v3, :cond_93

    iget v2, v2, Landroid/util/TypedValue;->data:I

    goto :goto_9d

    :cond_93
    invoke-virtual {v5}, Landroid/widget/ProgressBar;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v2, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    :goto_9d
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    .line 183
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Le/e/a/CacheFolders$$ExternalSyntheticLambda0;

    invoke-direct {v3, p1, v0, p0, v1}, Le/e/a/CacheFolders$$ExternalSyntheticLambda0;-><init>(Ljava/io/File;Ljava/lang/String;Landroid/app/Activity;Landroid/app/AlertDialog;)V

    .line 185
    nop

    .line 183
    const-string p0, "nicoid-cache-copy"

    invoke-direct {v2, v3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 185
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 186
    return-void
.end method

.method private static copyOrder(Ljava/lang/String;)I
    .registers 2

    .line 179
    const-string v0, ".json"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p0, 0x2

    goto :goto_15

    :cond_a
    const-string v0, ".mp4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    goto :goto_15

    :cond_14
    const/4 p0, 0x0

    :goto_15
    return p0
.end method

.method static document(Ljava/io/File;Z)Landroid/net/Uri;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheFolders;->index(Landroid/net/Uri;)Le/e/a/DirectoryIndex;

    move-result-object v0

    invoke-static {p0}, Le/e/a/CacheFolders;->relative(Ljava/io/File;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Le/e/a/DirectoryIndex;->document(Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;

    return-object p0
.end method

.method private static entry(Le/e/a/DirectoryIndex$Item;)Le/e/a/CacheFolders$Entry;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le/e/a/DirectoryIndex$Item<",
            "Landroid/net/Uri;",
            ">;)",
            "Le/e/a/CacheFolders$Entry;"
        }
    .end annotation

    .line 64
    new-instance v0, Le/e/a/CacheFolders$Entry;

    invoke-direct {v0}, Le/e/a/CacheFolders$Entry;-><init>()V

    iget-object v1, p0, Le/e/a/DirectoryIndex$Item;->ref:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    iput-object v1, v0, Le/e/a/CacheFolders$Entry;->uri:Landroid/net/Uri;

    iget-object v1, p0, Le/e/a/DirectoryIndex$Item;->name:Ljava/lang/String;

    invoke-static {v1}, Le/e/a/DirectoryIndex;->logical(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    iget-boolean v1, p0, Le/e/a/DirectoryIndex$Item;->directory:Z

    if-eqz v1, :cond_1a

    const-string v1, "vnd.android.document/directory"

    goto :goto_20

    :cond_1a
    iget-object v1, v0, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    invoke-static {v1}, Le/e/a/CacheFolders;->mime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_20
    iput-object v1, v0, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    iget-wide v1, p0, Le/e/a/DirectoryIndex$Item;->size:J

    iput-wide v1, v0, Le/e/a/CacheFolders$Entry;->size:J

    iget-wide v1, p0, Le/e/a/DirectoryIndex$Item;->time:J

    iput-wide v1, v0, Le/e/a/CacheFolders$Entry;->time:J

    return-object v0
.end method

.method static exportComments(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 67
    sget-object v0, Le/e/a/CacheFolders;->comments:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    sget-object v1, Le/e/a/CacheFolders;->comments:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_13

    if-nez v1, :cond_f

    return-void

    :cond_f
    invoke-static {p0, p1, v1}, Le/e/a/CacheComments;->save(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_13
    move-exception p0

    :try_start_14
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_14 .. :try_end_15} :catchall_13

    throw p0
.end method

.method static forget(Ljava/io/File;)V
    .registers 2

    .line 51
    :try_start_0
    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheFolders;->index(Landroid/net/Uri;)Le/e/a/DirectoryIndex;

    move-result-object v0

    invoke-static {p0}, Le/e/a/CacheFolders;->relative(Ljava/io/File;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Le/e/a/DirectoryIndex;->forget(Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_f} :catch_10

    goto :goto_11

    :catch_10
    move-exception p0

    :goto_11
    return-void
.end method

.method private static index(Landroid/net/Uri;)Le/e/a/DirectoryIndex;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Le/e/a/DirectoryIndex<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .line 44
    sget-object v0, Le/e/a/CacheFolders;->indexes:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    sget-object v1, Le/e/a/CacheFolders;->indexes:Ljava/util/Map;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/DirectoryIndex;

    if-nez v1, :cond_2d

    invoke-static {p0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    new-instance v2, Le/e/a/DirectoryIndex;

    new-instance v3, Le/e/a/CacheFolders$3;

    invoke-direct {v3, p0}, Le/e/a/CacheFolders$3;-><init>(Landroid/net/Uri;)V

    invoke-direct {v2, v1, v3}, Le/e/a/DirectoryIndex;-><init>(Ljava/lang/Object;Le/e/a/DirectoryIndex$Provider;)V

    .line 49
    sget-object v1, Le/e/a/CacheFolders;->indexes:Ljava/util/Map;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v2

    :cond_2d
    monitor-exit v0

    return-object v1

    .line 44
    :catchall_2f
    move-exception p0

    monitor-exit v0
    :try_end_31
    .catchall {:try_start_3 .. :try_end_31} :catchall_2f

    throw p0
.end method

.method static init(Landroid/content/Context;)V
    .registers 1

    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    sget-object p0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-static {p0}, Le/e/a/CrashDiagnostics;->install(Landroid/content/Context;)V

    return-void
.end method

.method static invalidateSummary(Landroid/content/Context;)V
    .registers 3

    .line 171
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Le/e/a/CacheFolders;->privateRoot(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "nicoid/cachelist.json"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    return-void
.end method

.method private static item(Le/e/a/CacheFolders$Entry;)Le/e/a/DirectoryIndex$Item;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le/e/a/CacheFolders$Entry;",
            ")",
            "Le/e/a/DirectoryIndex$Item<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .line 50
    new-instance v8, Le/e/a/DirectoryIndex$Item;

    iget-object v1, p0, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/CacheFolders$Entry;->uri:Landroid/net/Uri;

    const-string v0, "vnd.android.document/directory"

    iget-object v3, p0, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    iget-wide v4, p0, Le/e/a/CacheFolders$Entry;->size:J

    iget-wide v6, p0, Le/e/a/CacheFolders$Entry;->time:J

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Le/e/a/DirectoryIndex$Item;-><init>(Ljava/lang/String;Ljava/lang/Object;ZJJ)V

    return-object v8
.end method

.method private static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 31
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_18
    if-lt v3, v1, :cond_1f

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1f
    aget-byte v4, p0, v3

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v6, "%02x"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v7, v2

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_37} :catch_3a

    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    :catch_3a
    move-exception p0

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method static synthetic lambda$0(Landroid/content/Context;)V
    .registers 3

    .line 22
    const-string v0, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u3092\u958b\u59cb\u3057\u307e\u3057\u305f"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 97
    const/4 p1, 0x0

    invoke-static {p0, p1}, Le/e/a/CacheFolders;->location(Landroid/app/Activity;Landroid/content/Intent;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    .line 125
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_9

    invoke-static {p0, p1}, Le/e/a/CacheFolders;->offerCopy(Landroid/app/Activity;Ljava/lang/String;)V

    :cond_9
    return-void
.end method

.method static synthetic lambda$3(Landroid/app/Activity;Landroid/content/Intent;)V
    .registers 8

    .line 134
    const-string v0, "cache-folder-picker"

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_62

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_f

    goto :goto_62

    .line 135
    :cond_f
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    .line 136
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    const/4 v4, 0x1

    const-string v5, "\u8a2d\u5b9a\u3067\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    if-lt v2, v3, :cond_2e

    invoke-virtual {v1}, Landroid/app/FragmentManager;->isStateSaved()Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 137
    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v4}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 140
    :cond_2e
    :try_start_2e
    invoke-virtual {v1, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    .line 141
    instance-of v3, v2, Le/e/a/CacheFolders$Picker;

    if-eqz v3, :cond_3a

    move-object v3, v2

    check-cast v3, Le/e/a/CacheFolders$Picker;

    goto :goto_3f

    :cond_3a
    new-instance v3, Le/e/a/CacheFolders$Picker;

    invoke-direct {v3}, Le/e/a/CacheFolders$Picker;-><init>()V

    :goto_3f
    iput-object p1, v3, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    .line 142
    if-nez v2, :cond_4e

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, v3, v0}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    .line 143
    :cond_4e
    invoke-virtual {v1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    invoke-virtual {v3}, Le/e/a/CacheFolders$Picker;->pick()V
    :try_end_54
    .catch Ljava/lang/IllegalStateException; {:try_start_2e .. :try_end_54} :catch_55

    .line 144
    goto :goto_61

    :catch_55
    move-exception p1

    .line 145
    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v4}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 147
    :goto_61
    return-void

    .line 134
    :cond_62
    :goto_62
    return-void
.end method

.method static synthetic lambda$4(Landroid/app/Activity;Ljava/io/File;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 176
    invoke-static {p0, p1}, Le/e/a/CacheFolders;->copy(Landroid/app/Activity;Ljava/io/File;)V

    return-void
.end method

.method static synthetic lambda$5(Ljava/io/File;Ljava/lang/String;Landroid/app/Activity;Landroid/app/AlertDialog;)V
    .registers 16

    .line 183
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_d5

    new-instance v1, Le/e/a/CacheFolders$$ExternalSyntheticLambda5;

    invoke-direct {v1}, Le/e/a/CacheFolders$$ExternalSyntheticLambda5;-><init>()V

    invoke-static {p0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    array-length v1, p0

    const/4 v2, 0x0

    :goto_11
    const/4 v3, 0x1

    if-lt v2, v1, :cond_23

    .line 185
    new-instance p0, Le/e/a/CacheFile;

    invoke-direct {p0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object p0

    invoke-static {p1, p0}, Le/e/a/CacheComments;->clean(Ljava/lang/String;[Ljava/io/File;)V

    const/4 v0, 0x1

    goto/16 :goto_e5

    .line 183
    :cond_23
    aget-object v4, p0, v2

    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_d1

    invoke-static {v4}, Le/e/a/CacheComments;->copyable(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_33

    goto/16 :goto_d1

    :cond_33
    new-instance v5, Le/e/a/CacheFile;

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, p1, v6}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_44

    goto/16 :goto_d1

    :cond_44
    new-instance v6, Le/e/a/CacheFile;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, ".copy-"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, p1, v7}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_68} :catch_dd

    .line 184
    const/4 v7, 0x0

    :try_start_69
    invoke-static {v4}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v8

    if-eqz v8, :cond_75

    new-instance v8, Le/e/a/CacheInputStream;

    invoke-direct {v8, v4}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    goto :goto_7a

    :cond_75
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_7a
    .catchall {:try_start_69 .. :try_end_7a} :catchall_bf

    :goto_7a
    :try_start_7a
    new-instance v4, Le/e/a/CacheOutputStream;

    invoke-direct {v4, v6}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V
    :try_end_7f
    .catchall {:try_start_7a .. :try_end_7f} :catchall_ae

    const/high16 v9, 0x10000

    :try_start_81
    new-array v9, v9, [B

    :goto_83
    invoke-virtual {v8, v9}, Ljava/io/InputStream;->read([B)I

    move-result v10
    :try_end_87
    .catchall {:try_start_81 .. :try_end_87} :catchall_a8

    const/4 v11, -0x1

    if-ne v10, v11, :cond_a4

    :try_start_8a
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_8d
    .catchall {:try_start_8a .. :try_end_8d} :catchall_a2

    :try_start_8d
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_90
    .catchall {:try_start_8d .. :try_end_90} :catchall_b8

    :try_start_90
    invoke-virtual {v6, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_97

    goto :goto_d1

    :cond_97
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot finalize cache copy"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :cond_a1
    :goto_a1
    throw p0
    :try_end_a2
    .catch Ljava/lang/Exception; {:try_start_90 .. :try_end_a2} :catch_dd

    :catchall_a2
    move-exception p0

    goto :goto_b0

    :cond_a4
    :try_start_a4
    invoke-virtual {v4, v9, v0, v10}, Ljava/io/OutputStream;->write([BII)V
    :try_end_a7
    .catchall {:try_start_a4 .. :try_end_a7} :catchall_a8

    goto :goto_83

    :catchall_a8
    move-exception p0

    move-object v7, p0

    :try_start_aa
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    throw v7
    :try_end_ae
    .catchall {:try_start_aa .. :try_end_ae} :catchall_ae

    :catchall_ae
    move-exception p0

    const/4 v3, 0x0

    :goto_b0
    if-eqz v7, :cond_ba

    if-eq v7, p0, :cond_bb

    :try_start_b4
    invoke-virtual {v7, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_bb

    :catchall_b8
    move-exception p0

    goto :goto_c1

    :cond_ba
    move-object v7, p0

    :cond_bb
    :goto_bb
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    throw v7
    :try_end_bf
    .catchall {:try_start_b4 .. :try_end_bf} :catchall_b8

    :catchall_bf
    move-exception p0

    const/4 v3, 0x0

    :goto_c1
    if-eqz v7, :cond_c9

    if-eq v7, p0, :cond_c8

    :try_start_c5
    invoke-virtual {v7, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_c8
    move-object p0, v7

    :cond_c9
    throw p0
    :try_end_ca
    .catchall {:try_start_c5 .. :try_end_ca} :catchall_ca

    :catchall_ca
    move-exception p0

    if-nez v3, :cond_a1

    :try_start_cd
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    goto :goto_a1

    .line 183
    :cond_d1
    :goto_d1
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_11

    :cond_d5
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot list old cache"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_dd
    .catch Ljava/lang/Exception; {:try_start_cd .. :try_end_dd} :catch_dd

    .line 185
    :catch_dd
    move-exception p0

    const-string p1, "nicoid-cache"

    const-string v1, "Cache copy failed"

    invoke-static {p1, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_e5
    sget-object p0, Le/e/a/CacheFolders;->MAIN:Landroid/os/Handler;

    new-instance p1, Le/e/a/CacheFolders$$ExternalSyntheticLambda6;

    invoke-direct {p1, p2, p3, v0}, Le/e/a/CacheFolders$$ExternalSyntheticLambda6;-><init>(Landroid/app/Activity;Landroid/app/AlertDialog;Z)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$6(Ljava/io/File;Ljava/io/File;)I
    .registers 2

    .line 183
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CacheFolders;->copyOrder(Ljava/lang/String;)I

    move-result p0

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CacheFolders;->copyOrder(Ljava/lang/String;)I

    move-result p1

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$7(Landroid/app/Activity;Landroid/app/AlertDialog;Z)V
    .registers 4

    .line 185
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_31

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    if-eqz p2, :cond_1e

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.sauzask.nicoid.NicoidCacheManagerActivity"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1e

    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    :cond_1e
    if-eqz p2, :cond_23

    const-string p1, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u30b3\u30d4\u30fc\u304c\u5b8c\u4e86\u3057\u307e\u3057\u305f"

    goto :goto_25

    :cond_23
    const-string p1, "\u30b3\u30d4\u30fc\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u5143\u306e\u30d5\u30a1\u30a4\u30eb\u306f\u4fdd\u6301\u3055\u308c\u3066\u3044\u307e\u3059"

    :goto_25
    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_31
    return-void
.end method

.method static location(Landroid/app/Activity;Landroid/content/Intent;)V
    .registers 2

    .line 115
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    invoke-static {p0, p1}, Le/e/a/CacheFolders;->choose(Landroid/app/Activity;Landroid/content/Intent;)V

    return-void
.end method

.method static mime(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 69
    const-string v0, ".m3u8"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string p0, "application/vnd.apple.mpegurl"

    goto :goto_23

    :cond_b
    const-string v0, ".json"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string p0, "application/json"

    goto :goto_23

    :cond_16
    const-string v0, ".mp4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_21

    const-string p0, "video/mp4"

    goto :goto_23

    :cond_21
    const-string p0, "application/octet-stream"

    :goto_23
    return-object p0
.end method

.method static offerCopy(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 8

    .line 173
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    new-instance p1, Ljava/io/File;

    invoke-static {p0}, Le/e/a/CacheFolders;->privateRoot(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "nicoid/nicoid_cache"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_31

    :cond_12
    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "/@nicoid-cache/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Le/e/a/CacheFolders;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "/nicoid/nicoid_cache"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    move-object p1, v0

    :goto_31
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5a

    array-length v2, v0

    const/4 v3, 0x0

    :goto_3a
    if-lt v3, v2, :cond_3d

    goto :goto_5a

    :cond_3d
    aget-object v4, v0, v3

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_57

    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_57

    invoke-static {v4}, Le/e/a/CacheComments;->copyable(Ljava/io/File;)Z

    move-result v4

    if-eqz v4, :cond_57

    const/4 v1, 0x1

    goto :goto_5a

    :cond_57
    add-int/lit8 v3, v3, 0x1

    goto :goto_3a

    :cond_5a
    :goto_5a
    if-nez v1, :cond_5d

    return-void

    .line 174
    :cond_5d
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u65e2\u5b58\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u30b3\u30d4\u30fc"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 175
    const-string v1, "\u4ee5\u524d\u306e\u4fdd\u5b58\u5148\u304b\u3089\u30b3\u30d4\u30fc\u3057\u307e\u3059\u3002\u5143\u306e\u30d5\u30a1\u30a4\u30eb\u306f\u524a\u9664\u3057\u307e\u305b\u3093"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 176
    const-string v1, "\u30b3\u30d4\u30fc"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/CacheFolders$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, p1}, Le/e/a/CacheFolders$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;Ljava/io/File;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 177
    const-string p1, "\u5f8c\u3067"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 174
    nop

    .line 177
    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    .line 178
    return-void
.end method

.method static open(Ljava/io/File;ZZ)Landroid/os/ParcelFileDescriptor;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 87
    :try_start_0
    invoke-static {p0}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_37

    .line 88
    if-eqz p1, :cond_23

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_23

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_23

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_1b

    goto :goto_23

    :cond_1b
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot create cache directory"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 89
    :cond_23
    :goto_23
    if-eqz p1, :cond_30

    if-eqz p2, :cond_2a

    const/high16 p1, 0x2000000

    goto :goto_2c

    :cond_2a
    const/high16 p1, 0x4000000

    :goto_2c
    const/high16 p2, 0x28000000

    or-int/2addr p1, p2

    goto :goto_32

    :cond_30
    const/high16 p1, 0x10000000

    :goto_32
    invoke-static {p0, p1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    return-object p0

    .line 91
    :cond_37
    invoke-static {p0, p1}, Le/e/a/CacheFolders;->document(Ljava/io/File;Z)Landroid/net/Uri;

    move-result-object v0

    if-eqz p1, :cond_40

    invoke-static {p0}, Le/e/a/CacheFolders;->changed(Ljava/io/File;)V

    :cond_40
    if-eqz v0, :cond_63

    sget-object p0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    if-eqz p1, :cond_52

    if-eqz p2, :cond_4f

    const-string p1, "wa"

    goto :goto_54

    :cond_4f
    const-string p1, "wt"

    goto :goto_54

    :cond_52
    const-string p1, "r"

    :goto_54
    invoke-virtual {p0, v0, p1}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    if-eqz p0, :cond_5b

    return-object p0

    :cond_5b
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot open cached file"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_62
    throw p0

    :cond_63
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Missing cached file"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_6a} :catch_6d
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_6a} :catch_6b

    goto :goto_62

    .line 92
    :catch_6b
    move-exception p0

    goto :goto_6e

    :catch_6d
    move-exception p0

    :goto_6e
    new-instance p1, Ljava/io/FileNotFoundException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/io/FileNotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw p1
.end method

.method public static page(Landroid/app/Activity;)Z
    .registers 5

    .line 123
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    invoke-static {}, Le/e/a/CacheFolders;->ready()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_28

    .line 124
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "nicoid_cache_copy_from"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 125
    if-eqz v0, :cond_27

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    sget-object v2, Le/e/a/CacheFolders;->MAIN:Landroid/os/Handler;

    new-instance v3, Le/e/a/CacheFolders$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0, v0}, Le/e/a/CacheFolders$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 126
    :cond_27
    return v1

    .line 128
    :cond_28
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v2, "com.sauzask.nicoid.NicoidCacheManagerActivity"

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v2, "nicoid_cache_replace_picker_host"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/CacheFolders;->choose(Landroid/app/Activity;Landroid/content/Intent;)V

    const/4 p0, 0x0

    return p0
.end method

.method private static pageRequest(Landroid/content/Intent;)Z
    .registers 2

    .line 130
    if-nez p0, :cond_4

    const/4 p0, 0x0

    goto :goto_8

    :cond_4
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object p0

    :goto_8
    if-eqz p0, :cond_18

    invoke-virtual {p0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.sauzask.nicoid.NicoidCacheManagerActivity"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method private static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5

    .line 99
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

    invoke-static {v1, p1}, Le/e/a/CacheFolders;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-eqz v1, :cond_1d

    return-object v1

    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method static physicalName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 62
    invoke-static {p0}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2c

    const-string v0, ".mp4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2c

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, ".complete"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_2c
    return-object p0
.end method

.method static prefs()Landroid/content/SharedPreferences;
    .registers 1

    .line 19
    sget-object v0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method static privatePath(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 21
    if-eqz p0, :cond_45

    sget-object v0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    if-eqz v0, :cond_45

    const-string v0, "/@nicoid-cache/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_45

    const/16 v1, 0x2f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    if-ltz v0, :cond_45

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "/nicoid/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_45

    const-string v1, "/nicoid/nicoid_cache"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_45

    new-instance p0, Ljava/lang/StringBuilder;

    sget-object v1, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/CacheFolders;->privateRoot(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_45
    return-object p0
.end method

.method public static privateRoot(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    .line 23
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_e

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    :cond_e
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static rawStat(Landroid/net/Uri;Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;
    .registers 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")",
            "Le/e/a/DirectoryIndex$Item<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    const/4 v1, 0x0

    :try_start_1
    sget-object v0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v0, 0x3

    new-array v4, v0, [Ljava/lang/String;

    const-string v0, "mime_type"

    const/4 v8, 0x0

    aput-object v0, v4, v8

    const-string v0, "_size"

    const/4 v9, 0x1

    aput-object v0, v4, v9

    const-string v0, "last_modified"

    const/4 v10, 0x2

    aput-object v0, v4, v10

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object/from16 v3, p0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_22
    .catchall {:try_start_1 .. :try_end_22} :catchall_5b

    .line 81
    if-eqz v2, :cond_55

    :try_start_24
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_2b

    goto :goto_55

    :cond_2b
    new-instance v0, Le/e/a/DirectoryIndex$Item;

    const-string v3, "vnd.android.document/directory"

    invoke-interface {v2, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v15

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v17

    move-object v11, v0

    move-object/from16 v12, p1

    move-object/from16 v13, p0

    invoke-direct/range {v11 .. v18}, Le/e/a/DirectoryIndex$Item;-><init>(Ljava/lang/String;Ljava/lang/Object;ZJJ)V
    :try_end_47
    .catchall {:try_start_24 .. :try_end_47} :catchall_4d

    .line 82
    if-eqz v2, :cond_4c

    :try_start_49
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_4c
    return-object v0

    :catchall_4d
    move-exception v0

    move-object v1, v0

    if-eqz v2, :cond_54

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_54
    throw v1

    :cond_55
    :goto_55
    if-eqz v2, :cond_5a

    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_5a
    .catchall {:try_start_49 .. :try_end_5a} :catchall_5b

    .line 81
    :cond_5a
    return-object v1

    .line 82
    :catchall_5b
    move-exception v0

    if-eqz v1, :cond_64

    if-eq v1, v0, :cond_65

    :try_start_60
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_65

    :cond_64
    move-object v1, v0

    :cond_65
    :goto_65
    throw v1
    :try_end_66
    .catch Ljava/lang/RuntimeException; {:try_start_60 .. :try_end_66} :catch_66

    :catch_66
    move-exception v0

    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static ready()Z
    .registers 4

    .line 105
    const/4 v0, 0x0

    :try_start_1
    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "cache_tree_uri"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_14

    return v0

    :cond_14
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2, v1}, Le/e/a/CacheFolders;->children(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_23} :catch_25

    const/4 v0, 0x1

    return v0

    :catch_25
    move-exception v1

    return v0
.end method

.method static relative(Ljava/io/File;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 39
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/@nicoid-cache/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const-string v1, "/nicoid/nicoid_cache"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    if-ltz v0, :cond_47

    .line 40
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_28

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 41
    :cond_28
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3f

    const-string v0, ".."

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3f

    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3f

    return-object p0

    :cond_3f
    new-instance p0, Ljava/io/FileNotFoundException;

    const-string v0, "Invalid cache path"

    invoke-direct {p0, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 39
    :cond_47
    new-instance p0, Ljava/io/FileNotFoundException;

    const-string v0, "Not a video cache path"

    invoke-direct {p0, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static remember(Ljava/io/File;Landroid/net/Uri;)V
    .registers 3

    .line 52
    :try_start_0
    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheFolders;->index(Landroid/net/Uri;)Le/e/a/DirectoryIndex;

    move-result-object v0

    invoke-static {p0}, Le/e/a/CacheFolders;->relative(Ljava/io/File;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Le/e/a/DirectoryIndex;->remember(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_f} :catch_10

    goto :goto_11

    :catch_10
    move-exception p0

    :goto_11
    return-void
.end method

.method private static replaceHost(Landroid/content/Intent;)Z
    .registers 3

    .line 121
    const/4 v0, 0x0

    if-eqz p0, :cond_d

    const-string v1, "nicoid_cache_replace_picker_host"

    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_d

    const/4 p0, 0x1

    return p0

    :cond_d
    return v0
.end method

.method public static root(Landroid/content/Context;)Ljava/lang/String;
    .registers 5

    .line 25
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "cache_tree_uri"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_18

    const-string p0, "/@nicoid-cache/unselected"

    return-object p0

    .line 27
    :cond_18
    invoke-static {p0}, Le/e/a/CacheFolders;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "cache_tree_"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 28
    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_48

    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_48
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "/@nicoid-cache/"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static saveComments(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 2

    .line 68
    invoke-static {p0, p1}, Le/e/a/CacheComments;->video(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static service(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;
    .registers 5

    .line 109
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    .line 110
    if-eqz v0, :cond_3a

    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-static {}, Le/e/a/CacheFolders;->ready()Z

    move-result v0

    if-nez v0, :cond_3a

    .line 111
    invoke-static {p0}, Le/e/a/CacheFolders;->activity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object p2

    if-eqz p2, :cond_2a

    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-static {p2, p0}, Le/e/a/CacheFolders;->location(Landroid/app/Activity;Landroid/content/Intent;)V

    goto :goto_38

    :cond_2a
    const-string p1, "\u8a2d\u5b9a\u3067\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_38
    const/4 p0, 0x0

    return-object p0

    .line 113
    :cond_3a
    if-eqz p2, :cond_47

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1a

    if-lt p2, v0, :cond_47

    invoke-virtual {p0, p1}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object p0

    goto :goto_4b

    :cond_47
    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object p0

    :goto_4b
    return-object p0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 5

    .line 95
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    const-string v0, "cache_dir"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 96
    instance-of v2, v1, Landroid/preference/ListPreference;

    if-eqz v2, :cond_36

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-static {v2, v1}, Le/e/a/CacheFolders;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_36

    new-instance v3, Landroid/preference/Preference;

    invoke-direct {v3, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {v1}, Landroid/preference/Preference;->getOrder()I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setOrder(I)V

    invoke-virtual {v2, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    move-object v1, v3

    .line 97
    :cond_36
    if-eqz v1, :cond_43

    new-instance v0, Le/e/a/CacheFolders$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Le/e/a/CacheFolders$$ExternalSyntheticLambda2;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-static {p0}, Le/e/a/CacheFolders;->summary(Landroid/preference/PreferenceActivity;)V

    .line 98
    :cond_43
    return-void
.end method

.method public static startActivity(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 3

    .line 118
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    invoke-static {p1}, Le/e/a/CacheFolders;->pageRequest(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-static {}, Le/e/a/CacheFolders;->ready()Z

    move-result v0

    if-nez v0, :cond_2d

    invoke-static {p0}, Le/e/a/CacheFolders;->activity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1e

    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-static {v0, p0}, Le/e/a/CacheFolders;->choose(Landroid/app/Activity;Landroid/content/Intent;)V

    goto :goto_2c

    :cond_1e
    const-string p1, "\u8a2d\u5b9a\u3067\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_2c
    return-void

    .line 119
    :cond_2d
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 120
    return-void
.end method

.method public static startForegroundService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 3

    .line 107
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/CacheFolders;->service(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;

    move-result-object p0

    return-object p0
.end method

.method public static startService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 3

    .line 106
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/CacheFolders;->service(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;

    move-result-object p0

    return-object p0
.end method

.method public static started(Landroid/content/Context;)V
    .registers 4

    .line 22
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    invoke-static {p0}, Le/e/a/CacheProgress;->start(Landroid/content/Context;)V

    sget-object v0, Le/e/a/CacheFolders;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/CacheFolders$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0}, Le/e/a/CacheFolders$$ExternalSyntheticLambda7;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 84
    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheFolders;->index(Landroid/net/Uri;)Le/e/a/DirectoryIndex;

    move-result-object v0

    invoke-static {p0}, Le/e/a/CacheFolders;->relative(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Le/e/a/DirectoryIndex;->stat(Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;

    move-result-object v0

    if-eqz v0, :cond_17

    invoke-static {v0}, Le/e/a/CacheFolders;->entry(Le/e/a/DirectoryIndex$Item;)Le/e/a/CacheFolders$Entry;

    move-result-object p0

    return-object p0

    :cond_17
    invoke-static {p0}, Le/e/a/CachePack;->entry(Ljava/io/File;)Le/e/a/CachePackIndex$Entry;

    move-result-object v0

    if-nez v0, :cond_1f

    const/4 p0, 0x0

    return-object p0

    :cond_1f
    new-instance v1, Le/e/a/CacheFolders$Entry;

    invoke-direct {v1}, Le/e/a/CacheFolders$Entry;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    iget-object p0, v1, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    invoke-static {p0}, Le/e/a/CacheFolders;->mime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    iget-wide v2, v0, Le/e/a/CachePackIndex$Entry;->size:J

    iput-wide v2, v1, Le/e/a/CacheFolders$Entry;->size:J

    iget-wide v2, v0, Le/e/a/CachePackIndex$Entry;->time:J

    iput-wide v2, v1, Le/e/a/CacheFolders$Entry;->time:J

    return-object v1
.end method

.method public static summary(Landroid/preference/PreferenceActivity;)V
    .registers 4

    .line 101
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    const-string v0, "cache_dir"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p0

    if-nez p0, :cond_c

    return-void

    :cond_c
    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "cache_tree_uri"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 102
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_25

    const-string v0, "\u672a\u6307\u5b9a\uff08\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044\uff09"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2d

    :cond_25
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    :goto_2d
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u4fdd\u5b58\u5148: "

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 103
    return-void
.end method

.method static tree(Ljava/io/File;)Landroid/net/Uri;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 35
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/@nicoid-cache/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x2f

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gez v1, :cond_1b

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_1f

    :cond_1b
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 36
    :goto_1f
    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "cache_tree_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, ""

    invoke-interface {v0, p0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_43

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_43
    new-instance p0, Ljava/io/FileNotFoundException;

    const-string v0, "Cache folder not selected"

    invoke-direct {p0, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static videoId(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 61
    sget-object v0, Le/e/a/CacheFolders;->VIDEO_ID:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_13

    :cond_12
    const/4 p0, 0x0

    :goto_13
    return-object p0
.end method

.method static virtual(Ljava/io/File;)Z
    .registers 2

    .line 33
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/@nicoid-cache/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static workerReady(Landroid/content/Context;)Z
    .registers 1

    .line 116
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    invoke-static {}, Le/e/a/CacheFolders;->ready()Z

    move-result p0

    return p0
.end method
