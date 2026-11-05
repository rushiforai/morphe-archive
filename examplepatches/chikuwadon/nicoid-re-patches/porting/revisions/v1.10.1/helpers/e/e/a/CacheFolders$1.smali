.class Le/e/a/CacheFolders$1;
.super Ljava/util/LinkedHashMap;
.source "CacheFolders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CacheFolders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap<",
        "Ljava/lang/String;",
        "Le/e/a/DirectoryIndex<",
        "Landroid/net/Uri;",
        ">;>;"
    }
.end annotation


# direct methods
.method constructor <init>(IFZ)V
    .registers 4

    .line 43
    invoke-direct {p0, p1, p2, p3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    return-void
.end method


# virtual methods
.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Le/e/a/DirectoryIndex<",
            "Landroid/net/Uri;",
            ">;>;)Z"
        }
    .end annotation

    .line 43
    invoke-virtual {p0}, Le/e/a/CacheFolders$1;->size()I

    move-result p1

    const/16 v0, 0x8

    if-le p1, v0, :cond_a

    const/4 p1, 0x1

    return p1

    :cond_a
    const/4 p1, 0x0

    return p1
.end method
