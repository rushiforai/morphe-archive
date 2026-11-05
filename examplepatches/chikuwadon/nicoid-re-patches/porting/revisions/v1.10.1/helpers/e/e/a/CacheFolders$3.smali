.class Le/e/a/CacheFolders$3;
.super Ljava/lang/Object;
.source "CacheFolders.java"

# interfaces
.implements Le/e/a/DirectoryIndex$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CacheFolders;->index(Landroid/net/Uri;)Le/e/a/DirectoryIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Le/e/a/DirectoryIndex$Provider<",
        "Landroid/net/Uri;",
        ">;"
    }
.end annotation


# instance fields
.field private final synthetic val$tree:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/net/Uri;)V
    .registers 2

    .line 44
    iput-object p1, p0, Le/e/a/CacheFolders$3;->val$tree:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public children(Landroid/net/Uri;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/List<",
            "Le/e/a/DirectoryIndex$Item<",
            "Landroid/net/Uri;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Le/e/a/CacheFolders$3;->val$tree:Landroid/net/Uri;

    invoke-static {p1, v1}, Le/e/a/CacheFolders;->children(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_16

    return-object v0

    :cond_16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CacheFolders$Entry;

    # invokes: Le/e/a/CacheFolders;->item(Le/e/a/CacheFolders$Entry;)Le/e/a/DirectoryIndex$Item;
    invoke-static {v1}, Le/e/a/CacheFolders;->access$4(Le/e/a/CacheFolders$Entry;)Le/e/a/DirectoryIndex$Item;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f
.end method

.method public bridge synthetic children(Ljava/lang/Object;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Landroid/net/Uri;

    invoke-virtual {p0, p1}, Le/e/a/CacheFolders$3;->children(Landroid/net/Uri;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public create(Landroid/net/Uri;Ljava/lang/String;Z)Landroid/net/Uri;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    :try_start_0
    sget-object v0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    if-eqz p3, :cond_b

    const-string p3, "vnd.android.document/directory"

    goto :goto_f

    :cond_b
    invoke-static {p2}, Le/e/a/CacheFolders;->mime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    :goto_f
    invoke-static {v0, p1, p3, p2}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1
    :try_end_13
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_13} :catch_14

    return-object p1

    :catch_14
    move-exception p1

    new-instance p2, Ljava/io/IOException;

    const-string p3, "Cannot create cache document"

    invoke-direct {p2, p3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public bridge synthetic create(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Landroid/net/Uri;

    invoke-virtual {p0, p1, p2, p3}, Le/e/a/CacheFolders$3;->create(Landroid/net/Uri;Ljava/lang/String;Z)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public now()J
    .registers 3

    .line 48
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method public stat(Landroid/net/Uri;Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;
    .registers 3
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

    .line 47
    # invokes: Le/e/a/CacheFolders;->rawStat(Landroid/net/Uri;Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;
    invoke-static {p1, p2}, Le/e/a/CacheFolders;->access$5(Landroid/net/Uri;Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic stat(Ljava/lang/Object;Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Landroid/net/Uri;

    invoke-virtual {p0, p1, p2}, Le/e/a/CacheFolders$3;->stat(Landroid/net/Uri;Ljava/lang/String;)Le/e/a/DirectoryIndex$Item;

    move-result-object p1

    return-object p1
.end method
