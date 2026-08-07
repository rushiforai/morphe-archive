.class public final Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Value"
.end annotation


# instance fields
.field private final files:[Ljava/io/File;

.field private final key:Ljava/lang/String;

.field private final lengths:[J

.field private final sequenceNumber:J

.field final synthetic this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;


# direct methods
.method private constructor <init>(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;Ljava/lang/String;J[Ljava/io/File;[J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->key:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->sequenceNumber:J

    .line 9
    .line 10
    iput-object p5, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->files:[Ljava/io/File;

    .line 11
    .line 12
    iput-object p6, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->lengths:[J

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;Ljava/lang/String;J[Ljava/io/File;[JLcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$1;)V
    .locals 0

    .line 15
    invoke-direct/range {p0 .. p6}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;-><init>(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;Ljava/lang/String;J[Ljava/io/File;[J)V

    return-void
.end method


# virtual methods
.method public edit()Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->key:Ljava/lang/String;

    .line 4
    .line 5
    iget-wide v2, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->sequenceNumber:J

    .line 6
    .line 7
    invoke-static {v0, v1, v2, v3}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->access$1600(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;Ljava/lang/String;J)Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getFile(I)Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->files:[Ljava/io/File;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public getLength(I)J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->lengths:[J

    .line 2
    .line 3
    aget-wide v0, p0, p1

    .line 4
    .line 5
    return-wide v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/io/FileInputStream;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->files:[Ljava/io/File;

    .line 4
    .line 5
    aget-object p0, p0, p1

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->access$1700(Ljava/io/InputStream;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
