.class public final Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/image/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Snapshot"
.end annotation


# instance fields
.field private final ins:[Ljava/io/InputStream;

.field private final key:Ljava/lang/String;

.field private final lengths:[J

.field private final sequenceNumber:J

.field final synthetic this$0:Lcom/cosmos/photon/push/image/DiskLruCache;


# direct methods
.method private constructor <init>(Lcom/cosmos/photon/push/image/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;[J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->key:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->sequenceNumber:J

    .line 9
    .line 10
    iput-object p5, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->ins:[Ljava/io/InputStream;

    .line 11
    .line 12
    iput-object p6, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->lengths:[J

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/image/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;[JLcom/cosmos/photon/push/image/DiskLruCache$1;)V
    .locals 0

    .line 15
    invoke-direct/range {p0 .. p6}, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;-><init>(Lcom/cosmos/photon/push/image/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;[J)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->ins:[Ljava/io/InputStream;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-static {v2}, Lcom/cosmos/photon/push/image/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public edit()Lcom/cosmos/photon/push/image/DiskLruCache$Editor;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->key:Ljava/lang/String;

    .line 4
    .line 5
    iget-wide v2, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->sequenceNumber:J

    .line 6
    .line 7
    invoke-static {v0, v1, v2, v3}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$1600(Lcom/cosmos/photon/push/image/DiskLruCache;Ljava/lang/String;J)Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getInputStream(I)Ljava/io/InputStream;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->ins:[Ljava/io/InputStream;

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
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->lengths:[J

    .line 2
    .line 3
    aget-wide v0, p0, p1

    .line 4
    .line 5
    return-wide v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->getInputStream(I)Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$1700(Ljava/io/InputStream;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
