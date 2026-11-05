.class Le/e/a/DirectoryIndex$1;
.super Ljava/util/LinkedHashMap;
.source "DirectoryIndex.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DirectoryIndex;
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
        "TT;>.Bucket;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/DirectoryIndex;


# direct methods
.method constructor <init>(Le/e/a/DirectoryIndex;IFZ)V
    .registers 5

    .line 10
    iput-object p1, p0, Le/e/a/DirectoryIndex$1;->this$0:Le/e/a/DirectoryIndex;

    invoke-direct {p0, p2, p3, p4}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

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
            "TT;>.Bucket;>;)Z"
        }
    .end annotation

    .line 10
    invoke-virtual {p0}, Le/e/a/DirectoryIndex$1;->size()I

    move-result p1

    const/16 v0, 0x80

    if-le p1, v0, :cond_a

    const/4 p1, 0x1

    return p1

    :cond_a
    const/4 p1, 0x0

    return p1
.end method
