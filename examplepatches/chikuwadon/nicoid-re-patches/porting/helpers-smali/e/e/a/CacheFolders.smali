.class public final Le/e/a/CacheFolders;
.super Ljava/lang/Object;
.source "CacheFolders.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CacheFolders$Index;,
        Le/e/a/CacheFolders$Entry;,
        Le/e/a/CacheFolders$Picker;
    }
.end annotation


# static fields
.field private static final KEY:Ljava/lang/String; = "cache_tree_uri"

.field private static final MAIN:Landroid/os/Handler;

.field private static final PREFIX:Ljava/lang/String; = "/@nicoid-cache/"

.field private static final SUFFIX:Ljava/lang/String; = "/nicoid/nicoid_cache"

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
            "Le/e/a/CacheFolders$Index;",
            ">;"
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

    .line 70
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

.method static synthetic access$100(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .line 15
    invoke-static {p0}, Le/e/a/CacheFolders;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;
    .registers 4
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Landroid/content/Intent;
    .param p2, "x2"    # Z

    .line 15
    invoke-static {p0, p1, p2}, Le/e/a/CacheFolders;->service(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method

.method private static activity(Landroid/content/Context;)Landroid/app/Activity;
    .registers 2
    .param p0, "c"    # Landroid/content/Context;

    .line 109
    nop

    :goto_1
    instance-of v0, p0, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_19

    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_d

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    :cond_d
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .local v0, "next":Landroid/content/Context;
    if-ne v0, p0, :cond_17

    goto :goto_19

    :cond_17
    move-object p0, v0

    .end local v0    # "next":Landroid/content/Context;
    goto :goto_1

    :cond_19
    :goto_19
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_21

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    goto :goto_22

    :cond_21
    const/4 v0, 0x0

    :goto_22
    return-object v0
.end method

.method static cacheChildren(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;
    .registers 13
    .param p0, "parent"    # Landroid/net/Uri;
    .param p1, "tree"    # Landroid/net/Uri;
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

    .line 65
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .local v0, "result":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Le/e/a/CacheFolders$Entry;>;"
    invoke-static {p0, p1}, Le/e/a/CacheFolders;->children(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;

    move-result-object v1

    .line 66
    .local v1, "all":Ljava/util/List;, "Ljava/util/List<Le/e/a/CacheFolders$Entry;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_d
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const-string v4, "vnd.android.document/directory"

    if-eqz v3, :cond_31

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/CacheFolders$Entry;

    .local v3, "e":Le/e/a/CacheFolders$Entry;
    iget-object v5, v3, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_d

    iget-object v4, v3, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    invoke-static {v4}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_d

    iget-object v4, v3, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    invoke-virtual {v0, v4, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 67
    .end local v3    # "e":Le/e/a/CacheFolders$Entry;
    :cond_31
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_35
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/CacheFolders$Entry;

    .restart local v3    # "e":Le/e/a/CacheFolders$Entry;
    iget-object v5, v3, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_35

    iget-object v5, v3, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    const-string v6, "(?:sm|so|nm|ss)[0-9]+"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_35

    iget-object v5, v3, Le/e/a/CacheFolders$Entry;->uri:Landroid/net/Uri;

    invoke-static {v5, p1}, Le/e/a/CacheFolders;->children(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_5d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_35

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/CacheFolders$Entry;

    .local v6, "child":Le/e/a/CacheFolders$Entry;
    iget-object v7, v6, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    const-string v8, ".nomedia"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_74

    goto :goto_5d

    :cond_74
    iget-object v7, v6, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    const-string v8, ".complete"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a2

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, v6, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    iget-object v9, v6, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x9

    const/4 v10, 0x0

    invoke-virtual {v8, v10, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".mp4"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    :cond_a2
    iget-object v7, v6, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    invoke-virtual {v0, v7, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5d

    .line 68
    .end local v3    # "e":Le/e/a/CacheFolders$Entry;
    .end local v6    # "child":Le/e/a/CacheFolders$Entry;
    :cond_a8
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v2
.end method

.method static children(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;
    .registers 11
    .param p0, "parent"    # Landroid/net/Uri;
    .param p1, "tree"    # Landroid/net/Uri;
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

    .line 77
    const-string v1, "Cache folder unavailable"

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v2, v0

    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Le/e/a/CacheFolders$Entry;>;"
    invoke-static {p0}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/provider/DocumentsContract;->buildChildDocumentsUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 78
    .local v4, "uri":Landroid/net/Uri;
    const-string v0, "_size"

    const-string v3, "last_modified"

    const-string v5, "document_id"

    const-string v6, "_display_name"

    const-string v7, "mime_type"

    filled-new-array {v5, v6, v7, v0, v3}, [Ljava/lang/String;

    move-result-object v5

    .line 79
    .local v5, "columns":[Ljava/lang/String;
    :try_start_1e
    sget-object v0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_2b
    .catch Ljava/lang/RuntimeException; {:try_start_1e .. :try_end_2b} :catch_7e

    move-object v3, v0

    .line 80
    .local v3, "cursor":Landroid/database/Cursor;
    if-eqz v3, :cond_6d

    .line 81
    :goto_2e
    :try_start_2e
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_64

    new-instance v0, Le/e/a/CacheFolders$Entry;

    invoke-direct {v0}, Le/e/a/CacheFolders$Entry;-><init>()V

    .local v0, "e":Le/e/a/CacheFolders$Entry;
    const/4 v6, 0x0

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {p1, v6}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    iput-object v6, v0, Le/e/a/CacheFolders$Entry;->uri:Landroid/net/Uri;

    const/4 v6, 0x1

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    const/4 v6, 0x2

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    const/4 v6, 0x3

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    iput-wide v6, v0, Le/e/a/CacheFolders$Entry;->size:J

    const/4 v6, 0x4

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    iput-wide v6, v0, Le/e/a/CacheFolders$Entry;->time:J

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_63
    .catchall {:try_start_2e .. :try_end_63} :catchall_6a

    goto :goto_2e

    .line 82
    .end local v0    # "e":Le/e/a/CacheFolders$Entry;
    :cond_64
    if-eqz v3, :cond_69

    :try_start_66
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_69
    .catch Ljava/lang/RuntimeException; {:try_start_66 .. :try_end_69} :catch_7e

    .end local v3    # "cursor":Landroid/database/Cursor;
    :cond_69
    return-object v2

    .line 79
    .restart local v3    # "cursor":Landroid/database/Cursor;
    :catchall_6a
    move-exception v0

    move-object v6, v0

    goto :goto_73

    .line 80
    :cond_6d
    :try_start_6d
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v2    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Le/e/a/CacheFolders$Entry;>;"
    .end local v3    # "cursor":Landroid/database/Cursor;
    .end local v4    # "uri":Landroid/net/Uri;
    .end local v5    # "columns":[Ljava/lang/String;
    .end local p0    # "parent":Landroid/net/Uri;
    .end local p1    # "tree":Landroid/net/Uri;
    throw v0
    :try_end_73
    .catchall {:try_start_6d .. :try_end_73} :catchall_6a

    .line 79
    .restart local v2    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Le/e/a/CacheFolders$Entry;>;"
    .restart local v3    # "cursor":Landroid/database/Cursor;
    .restart local v4    # "uri":Landroid/net/Uri;
    .restart local v5    # "columns":[Ljava/lang/String;
    .restart local p0    # "parent":Landroid/net/Uri;
    .restart local p1    # "tree":Landroid/net/Uri;
    :goto_73
    if-eqz v3, :cond_7d

    :try_start_75
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_78
    .catchall {:try_start_75 .. :try_end_78} :catchall_79

    goto :goto_7d

    :catchall_79
    move-exception v0

    :try_start_7a
    invoke-virtual {v6, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Le/e/a/CacheFolders$Entry;>;"
    .end local v4    # "uri":Landroid/net/Uri;
    .end local v5    # "columns":[Ljava/lang/String;
    .end local p0    # "parent":Landroid/net/Uri;
    .end local p1    # "tree":Landroid/net/Uri;
    :cond_7d
    :goto_7d
    throw v6
    :try_end_7e
    .catch Ljava/lang/RuntimeException; {:try_start_7a .. :try_end_7e} :catch_7e

    .line 82
    .end local v3    # "cursor":Landroid/database/Cursor;
    .restart local v2    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Le/e/a/CacheFolders$Entry;>;"
    .restart local v4    # "uri":Landroid/net/Uri;
    .restart local v5    # "columns":[Ljava/lang/String;
    .restart local p0    # "parent":Landroid/net/Uri;
    .restart local p1    # "tree":Landroid/net/Uri;
    :catch_7e
    move-exception v0

    .local v0, "e":Ljava/lang/RuntimeException;
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3, v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method static choose(Landroid/app/Activity;Landroid/content/Intent;)V
    .registers 6
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "pending"    # Landroid/content/Intent;

    .line 121
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "cache-folder-picker"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    .line 122
    .local v0, "existing":Landroid/app/Fragment;
    instance-of v2, v0, Le/e/a/CacheFolders$Picker;

    if-eqz v2, :cond_19

    move-object v2, v0

    check-cast v2, Le/e/a/CacheFolders$Picker;

    goto :goto_1e

    :cond_19
    new-instance v2, Le/e/a/CacheFolders$Picker;

    invoke-direct {v2}, Le/e/a/CacheFolders$Picker;-><init>()V

    .local v2, "p":Le/e/a/CacheFolders$Picker;
    :goto_1e
    iput-object p1, v2, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    .line 123
    if-nez v0, :cond_31

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3, v2, v1}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 124
    :cond_31
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    invoke-virtual {v2}, Le/e/a/CacheFolders$Picker;->pick()V

    .line 125
    return-void
.end method

.method public static comments(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p0, "folder"    # Ljava/lang/String;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "json"    # Ljava/lang/String;

    .line 71
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
    move-exception v1

    monitor-exit v0
    :try_end_17
    .catchall {:try_start_e .. :try_end_17} :catchall_15

    throw v1

    :cond_18
    :goto_18
    invoke-static {p0, p1}, Le/e/a/CacheFolders;->saveComments(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static copy(Landroid/app/Activity;Ljava/io/File;)V
    .registers 9
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "old"    # Ljava/io/File;

    .line 158
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/nicoid/nicoid_cache"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, "destination":Ljava/lang/String;
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-direct {v1, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .local v1, "progress":Landroid/app/ProgressDialog;
    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u30b3\u30d4\u30fc\u4e2d"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 159
    const v2, 0x102000d

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    .local v2, "bar":Landroid/widget/ProgressBar;
    if-eqz v2, :cond_63

    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .local v3, "color":Landroid/util/TypedValue;
    invoke-virtual {v2}, Landroid/widget/ProgressBar;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    const v5, 0x7f03005e

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v3, v6}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v4, v3, Landroid/util/TypedValue;->resourceId:I

    if-nez v4, :cond_52

    iget v4, v3, Landroid/util/TypedValue;->data:I

    goto :goto_5c

    :cond_52
    invoke-virtual {v2}, Landroid/widget/ProgressBar;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget v5, v3, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    .local v4, "tint":I
    :goto_5c
    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    .line 160
    .end local v3    # "color":Landroid/util/TypedValue;
    .end local v4    # "tint":I
    :cond_63
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Le/e/a/CacheFolders$4;

    invoke-direct {v4, p1, v0, p0, v1}, Le/e/a/CacheFolders$4;-><init>(Ljava/io/File;Ljava/lang/String;Landroid/app/Activity;Landroid/app/ProgressDialog;)V

    const-string v5, "nicoid-cache-copy"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 162
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 163
    return-void
.end method

.method private static copyOrder(Ljava/lang/String;)I
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .line 156
    const-string v0, ".json"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x2

    goto :goto_15

    :cond_a
    const-string v0, ".mp4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method static declared-synchronized document(Ljava/io/File;Z)Landroid/net/Uri;
    .registers 18
    .param p0, "f"    # Ljava/io/File;
    .param p1, "create"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v1, Le/e/a/CacheFolders;

    monitor-enter v1

    .line 47
    :try_start_3
    invoke-static/range {p0 .. p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .local v0, "tree":Landroid/net/Uri;
    invoke-static {v0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .local v2, "parent":Landroid/net/Uri;
    invoke-static/range {p0 .. p0}, Le/e/a/CacheFolders;->relative(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    .line 48
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_116

    if-eqz v4, :cond_1b

    monitor-exit v1

    return-object v2

    .line 49
    :cond_1b
    :try_start_1b
    sget-object v4, Le/e/a/CacheFolders;->indexes:Ljava/util/Map;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/CacheFolders$Index;

    .local v4, "index":Le/e/a/CacheFolders$Index;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    .line 50
    .local v5, "now":J
    const/4 v7, 0x0

    if-eqz v4, :cond_38

    iget-wide v8, v4, Le/e/a/CacheFolders$Index;->refreshed:J

    sub-long v8, v5, v8

    const-wide/16 v10, 0x7d0

    cmp-long v12, v8, v10

    if-lez v12, :cond_67

    :cond_38
    new-instance v8, Le/e/a/CacheFolders$Index;

    invoke-direct {v8, v7}, Le/e/a/CacheFolders$Index;-><init>(Le/e/a/CacheFolders$1;)V

    move-object v4, v8

    invoke-static {v2, v0}, Le/e/a/CacheFolders;->cacheChildren(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_46
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5c

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Le/e/a/CacheFolders$Entry;

    .local v9, "e":Le/e/a/CacheFolders$Entry;
    iget-object v10, v4, Le/e/a/CacheFolders$Index;->files:Ljava/util/Map;

    iget-object v11, v9, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    iget-object v12, v9, Le/e/a/CacheFolders$Entry;->uri:Landroid/net/Uri;

    invoke-interface {v10, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_46

    .end local v9    # "e":Le/e/a/CacheFolders$Entry;
    :cond_5c
    iput-wide v5, v4, Le/e/a/CacheFolders$Index;->refreshed:J

    sget-object v8, Le/e/a/CacheFolders;->indexes:Ljava/util/Map;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    :cond_67
    iget-object v8, v4, Le/e/a/CacheFolders$Index;->files:Ljava/util/Map;

    invoke-interface {v8, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/net/Uri;
    :try_end_6f
    .catchall {:try_start_1b .. :try_end_6f} :catchall_116

    .local v8, "found":Landroid/net/Uri;
    if-eqz v8, :cond_73

    monitor-exit v1

    return-object v8

    .line 52
    :cond_73
    if-nez p1, :cond_77

    monitor-exit v1

    return-object v7

    .line 53
    :cond_77
    :try_start_77
    invoke-static {v3}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .local v7, "id":Ljava/lang/String;
    invoke-static {v3}, Le/e/a/CacheFolders;->physicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 54
    .local v9, "physical":Ljava/lang/String;
    if-eqz v7, :cond_f7

    const/4 v10, 0x0

    .local v10, "directory":Landroid/net/Uri;
    invoke-static {v2, v0}, Le/e/a/CacheFolders;->children(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_8a
    :goto_8a
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_ac

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Le/e/a/CacheFolders$Entry;

    .local v12, "e":Le/e/a/CacheFolders$Entry;
    iget-object v13, v12, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8a

    const-string v13, "vnd.android.document/directory"

    iget-object v14, v12, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8a

    iget-object v13, v12, Le/e/a/CacheFolders$Entry;->uri:Landroid/net/Uri;

    move-object v10, v13

    .end local v10    # "directory":Landroid/net/Uri;
    .local v13, "directory":Landroid/net/Uri;
    goto :goto_8a

    .line 55
    .end local v12    # "e":Le/e/a/CacheFolders$Entry;
    .end local v13    # "directory":Landroid/net/Uri;
    .restart local v10    # "directory":Landroid/net/Uri;
    :cond_ac
    if-nez v10, :cond_bb

    sget-object v11, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    const-string v12, "vnd.android.document/directory"

    invoke-static {v11, v2, v12, v7}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    move-object v10, v11

    .line 56
    :cond_bb
    if-eqz v10, :cond_ef

    move-object v2, v10

    .line 57
    const/4 v11, 0x0

    .local v11, "hidden":Z
    invoke-static {v2, v0}, Le/e/a/CacheFolders;->children(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_c7
    :goto_c7
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_df

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Le/e/a/CacheFolders$Entry;

    .local v13, "e":Le/e/a/CacheFolders$Entry;
    iget-object v14, v13, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    const-string v15, ".nomedia"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_c7

    const/4 v11, 0x1

    goto :goto_c7

    .line 58
    .end local v13    # "e":Le/e/a/CacheFolders$Entry;
    :cond_df
    if-nez v11, :cond_f7

    sget-object v12, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    const-string v13, "application/octet-stream"

    const-string v14, ".nomedia"

    invoke-static {v12, v2, v13, v14}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    goto :goto_f7

    .line 56
    .end local v11    # "hidden":Z
    :cond_ef
    new-instance v11, Ljava/io/IOException;

    const-string v12, "Cannot create video cache folder"

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 60
    .end local v10    # "directory":Landroid/net/Uri;
    :cond_f7
    :goto_f7
    sget-object v10, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    invoke-static {v9}, Le/e/a/CacheFolders;->mime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v2, v11, v9}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    .line 61
    .local v10, "made":Landroid/net/Uri;
    if-eqz v10, :cond_10e

    iget-object v11, v4, Le/e/a/CacheFolders$Index;->files:Ljava/util/Map;

    invoke-interface {v11, v3, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10c
    .catchall {:try_start_77 .. :try_end_10c} :catchall_116

    monitor-exit v1

    return-object v10

    :cond_10e
    :try_start_10e
    new-instance v11, Ljava/io/IOException;

    const-string v12, "Cannot create cache file"

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 46
    .end local v0    # "tree":Landroid/net/Uri;
    .end local v2    # "parent":Landroid/net/Uri;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "index":Le/e/a/CacheFolders$Index;
    .end local v5    # "now":J
    .end local v7    # "id":Ljava/lang/String;
    .end local v8    # "found":Landroid/net/Uri;
    .end local v9    # "physical":Ljava/lang/String;
    .end local v10    # "made":Landroid/net/Uri;
    .end local p0    # "f":Ljava/io/File;
    .end local p1    # "create":Z
    :catchall_116
    move-exception v0

    monitor-exit v1
    :try_end_118
    .catchall {:try_start_10e .. :try_end_118} :catchall_116

    throw v0
.end method

.method static exportComments(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p0, "folder"    # Ljava/lang/String;
    .param p1, "id"    # Ljava/lang/String;

    .line 72
    sget-object v0, Le/e/a/CacheFolders;->comments:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    sget-object v1, Le/e/a/CacheFolders;->comments:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .local v1, "json":Ljava/lang/String;
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_4c

    if-nez v1, :cond_f

    return-void

    :cond_f
    :try_start_f
    new-instance v0, Le/e/a/CacheOutputStream;

    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".comments.json"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v2}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_2c} :catch_43

    .local v0, "out":Ljava/io/OutputStream;
    :try_start_2c
    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_35
    .catchall {:try_start_2c .. :try_end_35} :catchall_39

    :try_start_35
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_38} :catch_43

    goto :goto_4b

    :catchall_39
    move-exception v2

    :try_start_3a
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_3d
    .catchall {:try_start_3a .. :try_end_3d} :catchall_3e

    goto :goto_42

    :catchall_3e
    move-exception v3

    :try_start_3f
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "json":Ljava/lang/String;
    .end local p0    # "folder":Ljava/lang/String;
    .end local p1    # "id":Ljava/lang/String;
    :goto_42
    throw v2
    :try_end_43
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_43} :catch_43

    .end local v0    # "out":Ljava/io/OutputStream;
    .restart local v1    # "json":Ljava/lang/String;
    .restart local p0    # "folder":Ljava/lang/String;
    .restart local p1    # "id":Ljava/lang/String;
    :catch_43
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    const-string v2, "nicoid-cache"

    const-string v3, "Cannot save cached comments"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v0    # "e":Ljava/io/IOException;
    :goto_4b
    return-void

    .end local v1    # "json":Ljava/lang/String;
    :catchall_4c
    move-exception v1

    :try_start_4d
    monitor-exit v0
    :try_end_4e
    .catchall {:try_start_4d .. :try_end_4e} :catchall_4c

    throw v1
.end method

.method static declared-synchronized forget(Ljava/io/File;)V
    .registers 5
    .param p0, "f"    # Ljava/io/File;

    const-class v0, Le/e/a/CacheFolders;

    monitor-enter v0

    .line 44
    :try_start_3
    sget-object v1, Le/e/a/CacheFolders;->indexes:Ljava/util/Map;

    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CacheFolders$Index;

    .local v1, "i":Le/e/a/CacheFolders$Index;
    if-eqz v1, :cond_23

    iget-object v2, v1, Le/e/a/CacheFolders$Index;->files:Ljava/util/Map;

    invoke-static {p0}, Le/e/a/CacheFolders;->relative(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_1e} :catch_22
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1f

    goto :goto_23

    .line 44
    .end local v1    # "i":Le/e/a/CacheFolders$Index;
    .end local p0    # "f":Ljava/io/File;
    :catchall_1f
    move-exception p0

    :try_start_20
    monitor-exit v0
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1f

    throw p0

    .line 44
    .restart local p0    # "f":Ljava/io/File;
    :catch_22
    move-exception v1

    :cond_23
    :goto_23
    monitor-exit v0

    return-void
.end method

.method static init(Landroid/content/Context;)V
    .registers 2
    .param p0, "c"    # Landroid/content/Context;

    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    return-void
.end method

.method private static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "tree"    # Ljava/lang/String;

    .line 30
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    .local v0, "bytes":[B
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .local v1, "s":Ljava/lang/StringBuilder;
    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_18
    if-ge v4, v2, :cond_35

    aget-byte v5, v0, v4

    .local v5, "b":B
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v7, "%02x"

    and-int/lit16 v8, v5, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v8, v9, v3

    invoke-static {v6, v7, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .end local v5    # "b":B
    add-int/lit8 v4, v4, 0x1

    goto :goto_18

    :cond_35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_39} :catch_3a

    return-object v2

    .end local v0    # "bytes":[B
    .end local v1    # "s":Ljava/lang/StringBuilder;
    :catch_3a
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static synthetic lambda$copy$3(Ljava/io/File;Ljava/io/File;)I
    .registers 4
    .param p0, "x"    # Ljava/io/File;
    .param p1, "y"    # Ljava/io/File;

    .line 160
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheFolders;->copyOrder(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CacheFolders;->copyOrder(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Integer;->compare(II)I

    move-result v0

    return v0
.end method

.method static synthetic lambda$copy$4(Landroid/app/Activity;Landroid/app/ProgressDialog;Z)V
    .registers 5
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "progress"    # Landroid/app/ProgressDialog;
    .param p2, "success"    # Z

    .line 162
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-virtual {p1}, Landroid/app/ProgressDialog;->dismiss()V

    if-eqz p2, :cond_e

    const-string v0, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u30b3\u30d4\u30fc\u304c\u5b8c\u4e86\u3057\u307e\u3057\u305f"

    goto :goto_10

    :cond_e
    const-string v0, "\u30b3\u30d4\u30fc\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u5143\u306e\u30d5\u30a1\u30a4\u30eb\u306f\u4fdd\u6301\u3055\u308c\u3066\u3044\u307e\u3059"

    :goto_10
    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_1c
    return-void
.end method

.method static synthetic lambda$copy$5(Ljava/io/File;Ljava/lang/String;Landroid/app/Activity;Landroid/app/ProgressDialog;)V
    .registers 20
    .param p0, "old"    # Ljava/io/File;
    .param p1, "destination"    # Ljava/lang/String;
    .param p2, "a"    # Landroid/app/Activity;
    .param p3, "progress"    # Landroid/app/ProgressDialog;

    .line 160
    move-object/from16 v1, p1

    const/4 v2, 0x0

    .local v2, "ok":Z
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    move-object v3, v0

    .local v3, "files":[Ljava/io/File;
    if-eqz v3, :cond_ba

    new-instance v0, Le/e/a/CacheFolders$0;

    invoke-direct {v0}, Le/e/a/CacheFolders$0;-><init>()V

    invoke-static {v3, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    array-length v0, v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_15
    if-ge v5, v0, :cond_b8

    aget-object v6, v3, v5

    .local v6, "f":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->isFile()Z

    move-result v7

    if-nez v7, :cond_20

    goto :goto_8d

    :cond_20
    new-instance v7, Le/e/a/CacheFile;

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v1, v8}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .local v7, "dest":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_30

    goto :goto_8d

    :cond_30
    new-instance v8, Le/e/a/CacheFile;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ".copy-"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v1, v9}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_54} :catch_c2

    .line 161
    .local v8, "temp":Ljava/io/File;
    const/4 v9, 0x0

    .local v9, "complete":Z
    :try_start_55
    invoke-static {v6}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v10

    if-eqz v10, :cond_61

    new-instance v10, Le/e/a/CacheInputStream;

    invoke-direct {v10, v6}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    goto :goto_66

    :cond_61
    new-instance v10, Ljava/io/FileInputStream;

    invoke-direct {v10, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_66
    .catchall {:try_start_55 .. :try_end_66} :catchall_b1

    .local v10, "in":Ljava/io/InputStream;
    :goto_66
    :try_start_66
    new-instance v11, Le/e/a/CacheOutputStream;

    invoke-direct {v11, v8}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V
    :try_end_6b
    .catchall {:try_start_66 .. :try_end_6b} :catchall_a6

    .local v11, "out":Ljava/io/OutputStream;
    const/high16 v12, 0x10000

    :try_start_6d
    new-array v12, v12, [B

    .local v12, "b":[B
    :goto_6f
    invoke-virtual {v10, v12}, Ljava/io/InputStream;->read([B)I

    move-result v13

    move v14, v13

    .local v14, "n":I
    const/4 v15, -0x1

    if-eq v13, v15, :cond_7b

    invoke-virtual {v11, v12, v4, v14}, Ljava/io/OutputStream;->write([BII)V
    :try_end_7a
    .catchall {:try_start_6d .. :try_end_7a} :catchall_9b

    goto :goto_6f

    :cond_7b
    const/4 v9, 0x1

    .end local v12    # "b":[B
    .end local v14    # "n":I
    :try_start_7c
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_7f
    .catchall {:try_start_7c .. :try_end_7f} :catchall_a6

    .end local v11    # "out":Ljava/io/OutputStream;
    :try_start_7f
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V
    :try_end_82
    .catchall {:try_start_7f .. :try_end_82} :catchall_b1

    .end local v10    # "in":Ljava/io/InputStream;
    if-nez v9, :cond_87

    :try_start_84
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    :cond_87
    invoke-virtual {v8, v7}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v10

    if-eqz v10, :cond_90

    .line 160
    .end local v6    # "f":Ljava/io/File;
    .end local v7    # "dest":Ljava/io/File;
    .end local v8    # "temp":Ljava/io/File;
    .end local v9    # "complete":Z
    :goto_8d
    add-int/lit8 v5, v5, 0x1

    goto :goto_15

    .line 161
    .restart local v6    # "f":Ljava/io/File;
    .restart local v7    # "dest":Ljava/io/File;
    .restart local v8    # "temp":Ljava/io/File;
    .restart local v9    # "complete":Z
    :cond_90
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    new-instance v0, Ljava/io/IOException;

    const-string v4, "Cannot finalize cache copy"

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_9a
    .catch Ljava/lang/Exception; {:try_start_84 .. :try_end_9a} :catch_c2

    goto :goto_b7

    .restart local v10    # "in":Ljava/io/InputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    :catchall_9b
    move-exception v0

    move-object v4, v0

    :try_start_9d
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_a0
    .catchall {:try_start_9d .. :try_end_a0} :catchall_a1

    goto :goto_a5

    :catchall_a1
    move-exception v0

    :try_start_a2
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "ok":Z
    .end local v3    # "files":[Ljava/io/File;
    .end local v6    # "f":Ljava/io/File;
    .end local v7    # "dest":Ljava/io/File;
    .end local v8    # "temp":Ljava/io/File;
    .end local v9    # "complete":Z
    .end local v10    # "in":Ljava/io/InputStream;
    .end local p0    # "old":Ljava/io/File;
    .end local p1    # "destination":Ljava/lang/String;
    .end local p2    # "a":Landroid/app/Activity;
    .end local p3    # "progress":Landroid/app/ProgressDialog;
    :goto_a5
    throw v4
    :try_end_a6
    .catchall {:try_start_a2 .. :try_end_a6} :catchall_a6

    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v2    # "ok":Z
    .restart local v3    # "files":[Ljava/io/File;
    .restart local v6    # "f":Ljava/io/File;
    .restart local v7    # "dest":Ljava/io/File;
    .restart local v8    # "temp":Ljava/io/File;
    .restart local v9    # "complete":Z
    .restart local v10    # "in":Ljava/io/InputStream;
    .restart local p0    # "old":Ljava/io/File;
    .restart local p1    # "destination":Ljava/lang/String;
    .restart local p2    # "a":Landroid/app/Activity;
    .restart local p3    # "progress":Landroid/app/ProgressDialog;
    :catchall_a6
    move-exception v0

    move-object v4, v0

    :try_start_a8
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V
    :try_end_ab
    .catchall {:try_start_a8 .. :try_end_ab} :catchall_ac

    goto :goto_b0

    :catchall_ac
    move-exception v0

    :try_start_ad
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "ok":Z
    .end local v3    # "files":[Ljava/io/File;
    .end local v6    # "f":Ljava/io/File;
    .end local v7    # "dest":Ljava/io/File;
    .end local v8    # "temp":Ljava/io/File;
    .end local v9    # "complete":Z
    .end local p0    # "old":Ljava/io/File;
    .end local p1    # "destination":Ljava/lang/String;
    .end local p2    # "a":Landroid/app/Activity;
    .end local p3    # "progress":Landroid/app/ProgressDialog;
    :goto_b0
    throw v4
    :try_end_b1
    .catchall {:try_start_ad .. :try_end_b1} :catchall_b1

    .end local v10    # "in":Ljava/io/InputStream;
    .restart local v2    # "ok":Z
    .restart local v3    # "files":[Ljava/io/File;
    .restart local v6    # "f":Ljava/io/File;
    .restart local v7    # "dest":Ljava/io/File;
    .restart local v8    # "temp":Ljava/io/File;
    .restart local v9    # "complete":Z
    .restart local p0    # "old":Ljava/io/File;
    .restart local p1    # "destination":Ljava/lang/String;
    .restart local p2    # "a":Landroid/app/Activity;
    .restart local p3    # "progress":Landroid/app/ProgressDialog;
    :catchall_b1
    move-exception v0

    if-nez v9, :cond_b7

    :try_start_b4
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    .end local v2    # "ok":Z
    .end local p0    # "old":Ljava/io/File;
    .end local p1    # "destination":Ljava/lang/String;
    .end local p2    # "a":Landroid/app/Activity;
    .end local p3    # "progress":Landroid/app/ProgressDialog;
    :cond_b7
    :goto_b7
    throw v0

    .line 162
    .end local v6    # "f":Ljava/io/File;
    .end local v7    # "dest":Ljava/io/File;
    .end local v8    # "temp":Ljava/io/File;
    .end local v9    # "complete":Z
    .restart local v2    # "ok":Z
    .restart local p0    # "old":Ljava/io/File;
    .restart local p1    # "destination":Ljava/lang/String;
    .restart local p2    # "a":Landroid/app/Activity;
    .restart local p3    # "progress":Landroid/app/ProgressDialog;
    :cond_b8
    const/4 v2, 0x1

    .end local v3    # "files":[Ljava/io/File;
    goto :goto_ca

    .line 160
    .restart local v3    # "files":[Ljava/io/File;
    :cond_ba
    new-instance v0, Ljava/io/IOException;

    const-string v4, "Cannot list old cache"

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v2    # "ok":Z
    .end local p0    # "old":Ljava/io/File;
    .end local p1    # "destination":Ljava/lang/String;
    .end local p2    # "a":Landroid/app/Activity;
    .end local p3    # "progress":Landroid/app/ProgressDialog;
    throw v0
    :try_end_c2
    .catch Ljava/lang/Exception; {:try_start_b4 .. :try_end_c2} :catch_c2

    .line 162
    .end local v3    # "files":[Ljava/io/File;
    .restart local v2    # "ok":Z
    .restart local p0    # "old":Ljava/io/File;
    .restart local p1    # "destination":Ljava/lang/String;
    .restart local p2    # "a":Landroid/app/Activity;
    .restart local p3    # "progress":Landroid/app/ProgressDialog;
    :catch_c2
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "nicoid-cache"

    const-string v4, "Cache copy failed"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v0    # "e":Ljava/lang/Exception;
    :goto_ca
    move v0, v2

    .local v0, "success":Z
    sget-object v3, Le/e/a/CacheFolders;->MAIN:Landroid/os/Handler;

    new-instance v4, Le/e/a/CacheFolders$3;

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-direct {v4, v5, v6, v0}, Le/e/a/CacheFolders$3;-><init>(Landroid/app/Activity;Landroid/app/ProgressDialog;Z)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$offerCopy$2(Landroid/app/Activity;Ljava/io/File;Landroid/content/DialogInterface;I)V
    .registers 4
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "old"    # Ljava/io/File;
    .param p2, "d"    # Landroid/content/DialogInterface;
    .param p3, "w"    # I

    .line 153
    invoke-static {p0, p1}, Le/e/a/CacheFolders;->copy(Landroid/app/Activity;Ljava/io/File;)V

    return-void
.end method

.method static synthetic lambda$settings$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 3
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "p"    # Landroid/preference/Preference;

    .line 102
    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/CacheFolders;->choose(Landroid/app/Activity;Landroid/content/Intent;)V

    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$started$0(Landroid/content/Context;)V
    .registers 3
    .param p0, "c"    # Landroid/content/Context;

    .line 22
    const-string v0, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u3092\u958b\u59cb\u3057\u307e\u3057\u305f"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static mime(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "n"    # Ljava/lang/String;

    .line 74
    const-string v0, ".m3u8"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "application/vnd.apple.mpegurl"

    goto :goto_23

    :cond_b
    const-string v0, ".json"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string v0, "application/json"

    goto :goto_23

    :cond_16
    const-string v0, ".mp4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21

    const-string v0, "video/mp4"

    goto :goto_23

    :cond_21
    const-string v0, "application/octet-stream"

    :goto_23
    return-object v0
.end method

.method static offerCopy(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 7
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "previous"    # Ljava/lang/String;

    .line 150
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_13

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    const-string v3, "nicoid/nicoid_cache"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_35

    :cond_13
    new-instance v0, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/@nicoid-cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Le/e/a/CacheFolders;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/nicoid/nicoid_cache"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    .line 151
    .local v0, "old":Ljava/io/File;
    :goto_35
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "\u65e2\u5b58\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u30b3\u30d4\u30fc"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 152
    const-string v3, "\u4ee5\u524d\u306e\u4fdd\u5b58\u5148\u304b\u3089\u30b3\u30d4\u30fc\u3057\u307e\u3059\u3002\u5143\u306e\u30d5\u30a1\u30a4\u30eb\u306f\u524a\u9664\u3057\u307e\u305b\u3093"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 153
    const-string v3, "\u30b3\u30d4\u30fc"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le/e/a/CacheFolders$5;

    invoke-direct {v4, p0, v0}, Le/e/a/CacheFolders$5;-><init>(Landroid/app/Activity;Ljava/io/File;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 154
    const-string v3, "\u5f8c\u3067"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    invoke-static {v1}, Le/e/a/PlaybackSession;->styleDialog(Landroid/app/AlertDialog;)V

    .line 155
    return-void
.end method

.method static open(Ljava/io/File;ZZ)Landroid/os/ParcelFileDescriptor;
    .registers 7
    .param p0, "f"    # Ljava/io/File;
    .param p1, "write"    # Z
    .param p2, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 92
    :try_start_0
    invoke-static {p0}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_43

    .line 93
    if-eqz p1, :cond_2f

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/nicoid/nicoid_cache/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "cache_tree_uri"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_27

    goto :goto_2f

    :cond_27
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Select a cache folder in settings"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "f":Ljava/io/File;
    .end local p1    # "write":Z
    .end local p2    # "append":Z
    throw v0

    .line 94
    .restart local p0    # "f":Ljava/io/File;
    .restart local p1    # "write":Z
    .restart local p2    # "append":Z
    :cond_2f
    :goto_2f
    if-eqz p1, :cond_3c

    if-eqz p2, :cond_36

    const/high16 v0, 0x2000000

    goto :goto_38

    :cond_36
    const/high16 v0, 0x4000000

    :goto_38
    const/high16 v1, 0x28000000

    or-int/2addr v0, v1

    goto :goto_3e

    :cond_3c
    const/high16 v0, 0x10000000

    :goto_3e
    invoke-static {p0, v0}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    return-object v0

    .line 96
    :cond_43
    invoke-static {p0, p1}, Le/e/a/CacheFolders;->document(Ljava/io/File;Z)Landroid/net/Uri;

    move-result-object v0

    .local v0, "uri":Landroid/net/Uri;
    if-eqz v0, :cond_6a

    sget-object v1, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    if-eqz p1, :cond_59

    if-eqz p2, :cond_56

    const-string v2, "wa"

    goto :goto_5b

    :cond_56
    const-string v2, "wt"

    goto :goto_5b

    :cond_59
    const-string v2, "r"

    :goto_5b
    invoke-virtual {v1, v0, v2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    .local v1, "fd":Landroid/os/ParcelFileDescriptor;
    if-eqz v1, :cond_62

    return-object v1

    :cond_62
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Cannot open cached file"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "f":Ljava/io/File;
    .end local p1    # "write":Z
    .end local p2    # "append":Z
    throw v2

    .end local v1    # "fd":Landroid/os/ParcelFileDescriptor;
    .restart local p0    # "f":Ljava/io/File;
    .restart local p1    # "write":Z
    .restart local p2    # "append":Z
    :cond_6a
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Missing cached file"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "f":Ljava/io/File;
    .end local p1    # "write":Z
    .end local p2    # "append":Z
    throw v1
    :try_end_72
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_72} :catch_74
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_72} :catch_72

    .line 97
    .end local v0    # "uri":Landroid/net/Uri;
    .restart local p0    # "f":Ljava/io/File;
    .restart local p1    # "write":Z
    .restart local p2    # "append":Z
    :catch_72
    move-exception v0

    goto :goto_75

    :catch_74
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    :goto_75
    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .local v1, "failure":Ljava/io/FileNotFoundException;
    invoke-virtual {v1, v0}, Ljava/io/FileNotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1
.end method

.method private static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5
    .param p0, "group"    # Landroid/preference/PreferenceGroup;
    .param p1, "p"    # Landroid/preference/Preference;

    .line 104
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-ge v0, v1, :cond_1f

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    .local v1, "child":Landroid/preference/Preference;
    if-ne v1, p1, :cond_e

    return-object p0

    :cond_e
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1c

    move-object v2, v1

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/CacheFolders;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    .local v2, "found":Landroid/preference/PreferenceGroup;
    if-eqz v2, :cond_1c

    return-object v2

    .end local v1    # "child":Landroid/preference/Preference;
    .end local v2    # "found":Landroid/preference/PreferenceGroup;
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0    # "i":I
    :cond_1f
    const/4 v0, 0x0

    return-object v0
.end method

.method static physicalName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;

    .line 64
    invoke-static {p0}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2d

    const-string v0, ".mp4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".complete"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2e

    :cond_2d
    move-object v0, p0

    :goto_2e
    return-object v0
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
    .registers 5
    .param p0, "path"    # Ljava/lang/String;

    .line 21
    if-eqz p0, :cond_46

    sget-object v0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    if-eqz v0, :cond_46

    const-string v0, "/@nicoid-cache/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_46

    const/16 v1, 0x2f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .local v0, "start":I
    if-ltz v0, :cond_46

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .local v1, "relative":Ljava/lang/String;
    const-string v2, "/nicoid/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_46

    const-string v2, "/nicoid/nicoid_cache"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_46

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-static {v3}, Le/e/a/CacheFolders;->privateRoot(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .end local v0    # "start":I
    .end local v1    # "relative":Ljava/lang/String;
    :cond_46
    return-object p0
.end method

.method public static privateRoot(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p0, "c"    # Landroid/content/Context;

    .line 23
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .local v0, "base":Ljava/io/File;
    if-nez v0, :cond_f

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    goto :goto_10

    :cond_f
    move-object v1, v0

    :goto_10
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static ready()Z
    .registers 4

    .line 110
    const/4 v0, 0x0

    :try_start_1
    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "cache_tree_uri"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, "s":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_14

    return v0

    :cond_14
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .local v2, "tree":Landroid/net/Uri;
    invoke-static {v2}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .local v3, "root":Landroid/net/Uri;
    invoke-static {v3, v2}, Le/e/a/CacheFolders;->children(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_23} :catch_25

    const/4 v0, 0x1

    return v0

    .end local v1    # "s":Ljava/lang/String;
    .end local v2    # "tree":Landroid/net/Uri;
    .end local v3    # "root":Landroid/net/Uri;
    :catch_25
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    return v0
.end method

.method static relative(Ljava/io/File;)Ljava/lang/String;
    .registers 6
    .param p0, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 38
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .local v0, "path":Ljava/lang/String;
    const-string v1, "/@nicoid-cache/"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, "/nicoid/nicoid_cache"

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .local v1, "start":I
    if-ltz v1, :cond_47

    .line 39
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .local v2, "name":Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_28

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 40
    :cond_28
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3f

    const-string v3, ".."

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3f

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3f

    return-object v2

    :cond_3f
    new-instance v3, Ljava/io/FileNotFoundException;

    const-string v4, "Invalid cache path"

    invoke-direct {v3, v4}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 38
    .end local v2    # "name":Ljava/lang/String;
    :cond_47
    new-instance v2, Ljava/io/FileNotFoundException;

    const-string v3, "Not a video cache path"

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method static declared-synchronized remember(Ljava/io/File;Landroid/net/Uri;)V
    .registers 6
    .param p0, "f"    # Ljava/io/File;
    .param p1, "uri"    # Landroid/net/Uri;

    const-class v0, Le/e/a/CacheFolders;

    monitor-enter v0

    .line 45
    :try_start_3
    sget-object v1, Le/e/a/CacheFolders;->indexes:Ljava/util/Map;

    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CacheFolders$Index;

    .local v1, "i":Le/e/a/CacheFolders$Index;
    if-eqz v1, :cond_23

    iget-object v2, v1, Le/e/a/CacheFolders$Index;->files:Ljava/util/Map;

    invoke-static {p0}, Le/e/a/CacheFolders;->relative(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_1e} :catch_22
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1f

    goto :goto_23

    .line 45
    .end local v1    # "i":Le/e/a/CacheFolders$Index;
    .end local p0    # "f":Ljava/io/File;
    .end local p1    # "uri":Landroid/net/Uri;
    :catchall_1f
    move-exception p0

    :try_start_20
    monitor-exit v0
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1f

    throw p0

    .line 45
    .restart local p0    # "f":Ljava/io/File;
    .restart local p1    # "uri":Landroid/net/Uri;
    :catch_22
    move-exception v1

    :cond_23
    :goto_23
    monitor-exit v0

    return-void
.end method

.method public static root(Landroid/content/Context;)Ljava/lang/String;
    .registers 6
    .param p0, "c"    # Landroid/content/Context;

    .line 25
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "cache_tree_uri"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "tree":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_27

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .local v1, "old":Ljava/io/File;
    if-nez v1, :cond_21

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    goto :goto_22

    :cond_21
    move-object v2, v1

    :goto_22
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 27
    .end local v1    # "old":Ljava/io/File;
    :cond_27
    invoke-static {v0}, Le/e/a/CacheFolders;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, "key":Ljava/lang/String;
    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cache_tree_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/@nicoid-cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static saveComments(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p0, "folder"    # Ljava/lang/String;
    .param p1, "id"    # Ljava/lang/String;

    .line 73
    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".json"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/CacheFile;->exists()Z

    move-result v0

    if-nez v0, :cond_5d

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".mp4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/CacheFile;->exists()Z

    move-result v0

    if-nez v0, :cond_5d

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".ncache"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/CacheFile;->exists()Z

    move-result v0

    if-eqz v0, :cond_5b

    goto :goto_5d

    :cond_5b
    const/4 v0, 0x0

    goto :goto_5e

    :cond_5d
    :goto_5d
    const/4 v0, 0x1

    :goto_5e
    return v0
.end method

.method private static service(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;
    .registers 7
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "foreground"    # Z

    .line 114
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    .line 115
    .local v0, "target":Landroid/content/ComponentName;
    if-eqz v0, :cond_3a

    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3a

    invoke-static {}, Le/e/a/CacheFolders;->ready()Z

    move-result v1

    if-nez v1, :cond_3a

    .line 116
    invoke-static {p0}, Le/e/a/CacheFolders;->activity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    .local v1, "a":Landroid/app/Activity;
    if-eqz v1, :cond_2a

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-static {v1, v2}, Le/e/a/CacheFolders;->choose(Landroid/app/Activity;Landroid/content/Intent;)V

    goto :goto_38

    :cond_2a
    const-string v2, "\u8a2d\u5b9a\u3067\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    :goto_38
    const/4 v2, 0x0

    return-object v2

    .line 118
    .end local v1    # "a":Landroid/app/Activity;
    :cond_3a
    if-eqz p2, :cond_47

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_47

    invoke-virtual {p0, p1}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v1

    goto :goto_4b

    :cond_47
    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v1

    :goto_4b
    return-object v1
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 5
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 100
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    const-string v0, "cache_dir"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 101
    .local v1, "old":Landroid/preference/Preference;
    instance-of v2, v1, Landroid/preference/ListPreference;

    if-eqz v2, :cond_36

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-static {v2, v1}, Le/e/a/CacheFolders;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    .local v2, "parent":Landroid/preference/PreferenceGroup;
    if-eqz v2, :cond_36

    new-instance v3, Landroid/preference/Preference;

    invoke-direct {v3, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .local v3, "p":Landroid/preference/Preference;
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

    .line 102
    .end local v2    # "parent":Landroid/preference/PreferenceGroup;
    .end local v3    # "p":Landroid/preference/Preference;
    :cond_36
    if-eqz v1, :cond_43

    new-instance v0, Le/e/a/CacheFolders$6;

    invoke-direct {v0, p0}, Le/e/a/CacheFolders$6;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-static {p0}, Le/e/a/CacheFolders;->summary(Landroid/preference/PreferenceActivity;)V

    .line 103
    :cond_43
    return-void
.end method

.method public static startForegroundService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 3
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;

    .line 112
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/CacheFolders;->service(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method

.method public static startService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    .registers 3
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;

    .line 111
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/CacheFolders;->service(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method

.method public static started(Landroid/content/Context;)V
    .registers 4
    .param p0, "c"    # Landroid/content/Context;

    .line 22
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    sget-object v0, Le/e/a/CacheFolders;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/CacheFolders$7;

    invoke-direct {v1, p0}, Le/e/a/CacheFolders$7;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;
    .registers 10
    .param p0, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/CacheFolders;->document(Ljava/io/File;Z)Landroid/net/Uri;

    move-result-object v2

    .local v2, "u":Landroid/net/Uri;
    const/4 v7, 0x0

    if-nez v2, :cond_2b

    invoke-static {p0}, Le/e/a/CachePack;->entry(Ljava/io/File;)Le/e/a/CachePackIndex$Entry;

    move-result-object v0

    .local v0, "packed":Le/e/a/CachePackIndex$Entry;
    if-nez v0, :cond_f

    return-object v7

    :cond_f
    new-instance v1, Le/e/a/CacheFolders$Entry;

    invoke-direct {v1}, Le/e/a/CacheFolders$Entry;-><init>()V

    .local v1, "e":Le/e/a/CacheFolders$Entry;
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    iget-object v3, v1, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    invoke-static {v3}, Le/e/a/CacheFolders;->mime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    iget-wide v3, v0, Le/e/a/CachePackIndex$Entry;->size:J

    iput-wide v3, v1, Le/e/a/CacheFolders$Entry;->size:J

    iget-wide v3, v0, Le/e/a/CachePackIndex$Entry;->time:J

    iput-wide v3, v1, Le/e/a/CacheFolders$Entry;->time:J

    return-object v1

    .end local v0    # "packed":Le/e/a/CachePackIndex$Entry;
    .end local v1    # "e":Le/e/a/CacheFolders$Entry;
    :cond_2b
    new-instance v1, Le/e/a/CacheFolders$Entry;

    invoke-direct {v1}, Le/e/a/CacheFolders$Entry;-><init>()V

    move-object v8, v1

    .local v8, "e":Le/e/a/CacheFolders$Entry;
    iput-object v2, v8, Le/e/a/CacheFolders$Entry;->uri:Landroid/net/Uri;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    .line 86
    :try_start_39
    sget-object v1, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v3, "mime_type"

    const-string v4, "_size"

    const-string v5, "last_modified"

    filled-new-array {v3, v4, v5}, [Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_50
    .catch Ljava/lang/RuntimeException; {:try_start_39 .. :try_end_50} :catch_89

    .line 87
    .local v1, "c":Landroid/database/Cursor;
    if-eqz v1, :cond_73

    :try_start_52
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-nez v3, :cond_59

    goto :goto_73

    :cond_59
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v8, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    const/4 v0, 0x1

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    iput-wide v3, v8, Le/e/a/CacheFolders$Entry;->size:J

    const/4 v0, 0x2

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    iput-wide v3, v8, Le/e/a/CacheFolders$Entry;->time:J
    :try_end_6d
    .catchall {:try_start_52 .. :try_end_6d} :catchall_7c

    .line 88
    if-eqz v1, :cond_72

    :try_start_6f
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_72
    .catch Ljava/lang/RuntimeException; {:try_start_6f .. :try_end_72} :catch_89

    .line 87
    :cond_72
    return-object v8

    :cond_73
    :goto_73
    :try_start_73
    invoke-static {p0}, Le/e/a/CacheFolders;->forget(Ljava/io/File;)V
    :try_end_76
    .catchall {:try_start_73 .. :try_end_76} :catchall_7c

    .line 88
    if-eqz v1, :cond_7b

    :try_start_78
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_7b
    .catch Ljava/lang/RuntimeException; {:try_start_78 .. :try_end_7b} :catch_89

    .line 87
    :cond_7b
    return-object v7

    .line 86
    :catchall_7c
    move-exception v0

    move-object v3, v0

    if-eqz v1, :cond_88

    :try_start_80
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_83
    .catchall {:try_start_80 .. :try_end_83} :catchall_84

    goto :goto_88

    :catchall_84
    move-exception v0

    :try_start_85
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "u":Landroid/net/Uri;
    .end local v8    # "e":Le/e/a/CacheFolders$Entry;
    .end local p0    # "f":Ljava/io/File;
    :cond_88
    :goto_88
    throw v3
    :try_end_89
    .catch Ljava/lang/RuntimeException; {:try_start_85 .. :try_end_89} :catch_89

    .line 88
    .end local v1    # "c":Landroid/database/Cursor;
    .restart local v2    # "u":Landroid/net/Uri;
    .restart local v8    # "e":Le/e/a/CacheFolders$Entry;
    .restart local p0    # "f":Ljava/io/File;
    :catch_89
    move-exception v0

    .local v0, "x":Ljava/lang/RuntimeException;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static summary(Landroid/preference/PreferenceActivity;)V
    .registers 6
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 106
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    const-string v0, "cache_dir"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .local v0, "p":Landroid/preference/Preference;
    if-nez v0, :cond_c

    return-void

    :cond_c
    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "cache_tree_uri"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 107
    .local v1, "tree":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_25

    const-string v2, "\u672a\u9078\u629e\uff08\u63a8\u5968: Movies/nicoid\uff09"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2d

    :cond_25
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .local v2, "label":Ljava/lang/String;
    :goto_2d
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u4fdd\u5b58\u5148: "

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 108
    return-void
.end method

.method static tree(Ljava/io/File;)Landroid/net/Uri;
    .registers 7
    .param p0, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 34
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .local v0, "path":Ljava/lang/String;
    const-string v1, "/@nicoid-cache/"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x2f

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .local v2, "end":I
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gez v2, :cond_1b

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1f

    :cond_1b
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 35
    .local v1, "key":Ljava/lang/String;
    :goto_1f
    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cache_tree_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .local v3, "tree":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_47

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    return-object v4

    :cond_47
    new-instance v4, Ljava/io/FileNotFoundException;

    const-string v5, "Cache folder not selected"

    invoke-direct {v4, v5}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method static videoId(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .line 63
    const-string v0, "^((?:sm|so|nm|ss)[0-9]+)(?:[._].*)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_16

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_17

    :cond_16
    const/4 v1, 0x0

    :goto_17
    return-object v1
.end method

.method static virtual(Ljava/io/File;)Z
    .registers 3
    .param p0, "f"    # Ljava/io/File;

    .line 32
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/@nicoid-cache/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
