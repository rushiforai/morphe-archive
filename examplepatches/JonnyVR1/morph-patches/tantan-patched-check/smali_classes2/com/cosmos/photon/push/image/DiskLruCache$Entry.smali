.class final Lcom/cosmos/photon/push/image/DiskLruCache$Entry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/image/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Entry"
.end annotation


# instance fields
.field private currentEditor:Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

.field private final key:Ljava/lang/String;

.field private final lengths:[J

.field private readable:Z

.field private sequenceNumber:J

.field final synthetic this$0:Lcom/cosmos/photon/push/image/DiskLruCache;


# direct methods
.method private constructor <init>(Lcom/cosmos/photon/push/image/DiskLruCache;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->key:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$1800(Lcom/cosmos/photon/push/image/DiskLruCache;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    new-array p1, p1, [J

    .line 13
    .line 14
    iput-object p1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->lengths:[J

    .line 15
    .line 16
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/image/DiskLruCache;Ljava/lang/String;Lcom/cosmos/photon/push/image/DiskLruCache$1;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;-><init>(Lcom/cosmos/photon/push/image/DiskLruCache;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic access$1000(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)[J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->lengths:[J

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1100(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->key:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1200(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->sequenceNumber:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$1202(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->sequenceNumber:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$600(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->readable:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$602(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->readable:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$700(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)Lcom/cosmos/photon/push/image/DiskLruCache$Editor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->currentEditor:Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$702(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;Lcom/cosmos/photon/push/image/DiskLruCache$Editor;)Lcom/cosmos/photon/push/image/DiskLruCache$Editor;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->currentEditor:Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$800(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;[Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->setLengths([Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private invalidLengths([Ljava/lang/String;)Ljava/io/IOException;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/io/IOException;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "unexpected journal line: "

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p0
.end method

.method private setLengths([Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    iget-object v1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 3
    .line 4
    invoke-static {v1}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$1800(Lcom/cosmos/photon/push/image/DiskLruCache;)I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    :try_start_0
    array-length v1, p1

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->lengths:[J

    .line 15
    .line 16
    aget-object v2, p1, v0

    .line 17
    .line 18
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    aput-wide v2, v1, v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void

    .line 28
    :catch_0
    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->invalidLengths([Ljava/lang/String;)Ljava/io/IOException;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    throw p0

    .line 33
    :cond_1
    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->invalidLengths([Ljava/lang/String;)Ljava/io/IOException;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    throw p0
.end method


# virtual methods
.method public getCleanFile(I)Ljava/io/File;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$1900(Lcom/cosmos/photon/push/image/DiskLruCache;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->key:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, "."

    .line 20
    .line 21
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public getDirtyFile(I)Ljava/io/File;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$1900(Lcom/cosmos/photon/push/image/DiskLruCache;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->key:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, "."

    .line 20
    .line 21
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, ".tmp"

    .line 28
    .line 29
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public getLengths()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->lengths:[J

    .line 7
    .line 8
    array-length v1, p0

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_0

    .line 11
    .line 12
    aget-wide v3, p0, v2

    .line 13
    .line 14
    const/16 v5, 0x20

    .line 15
    .line 16
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
