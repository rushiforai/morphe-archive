.class final Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;
.super Lcom/google/common/cache/LocalCache$WeakEntry;
.source "LocalCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "WeakAccessWriteEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/cache/LocalCache$WeakEntry<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field volatile accessTime:J

.field nextAccess:Lcom/google/common/cache/ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field nextWrite:Lcom/google/common/cache/ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field previousAccess:Lcom/google/common/cache/ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field previousWrite:Lcom/google/common/cache/ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field volatile writeTime:J


# direct methods
.method constructor <init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;ILcom/google/common/cache/ReferenceEntry;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "queue",
            "key",
            "hash",
            "next"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/ReferenceQueue<",
            "TK;>;TK;I",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1394
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/common/cache/LocalCache$WeakEntry;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;ILcom/google/common/cache/ReferenceEntry;)V

    const-wide p1, 0x7fffffffffffffffL

    .line 1399
    iput-wide p1, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->accessTime:J

    .line 1412
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/ReferenceEntry;

    move-result-object p3

    iput-object p3, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->nextAccess:Lcom/google/common/cache/ReferenceEntry;

    .line 1425
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/ReferenceEntry;

    move-result-object p3

    iput-object p3, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->previousAccess:Lcom/google/common/cache/ReferenceEntry;

    .line 1439
    iput-wide p1, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->writeTime:J

    .line 1452
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/ReferenceEntry;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->nextWrite:Lcom/google/common/cache/ReferenceEntry;

    .line 1465
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/ReferenceEntry;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->previousWrite:Lcom/google/common/cache/ReferenceEntry;

    return-void
.end method


# virtual methods
.method public getAccessTime()J
    .registers 3

    .line 1403
    iget-wide v0, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->accessTime:J

    return-wide v0
.end method

.method public getNextInAccessQueue()Lcom/google/common/cache/ReferenceEntry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1416
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->nextAccess:Lcom/google/common/cache/ReferenceEntry;

    return-object p0
.end method

.method public getNextInWriteQueue()Lcom/google/common/cache/ReferenceEntry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1456
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->nextWrite:Lcom/google/common/cache/ReferenceEntry;

    return-object p0
.end method

.method public getPreviousInAccessQueue()Lcom/google/common/cache/ReferenceEntry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1429
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->previousAccess:Lcom/google/common/cache/ReferenceEntry;

    return-object p0
.end method

.method public getPreviousInWriteQueue()Lcom/google/common/cache/ReferenceEntry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1469
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->previousWrite:Lcom/google/common/cache/ReferenceEntry;

    return-object p0
.end method

.method public getWriteTime()J
    .registers 3

    .line 1443
    iget-wide v0, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->writeTime:J

    return-wide v0
.end method

.method public setAccessTime(J)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "time"
        }
    .end annotation

    .line 1408
    iput-wide p1, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->accessTime:J

    return-void
.end method

.method public setNextInAccessQueue(Lcom/google/common/cache/ReferenceEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "next"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1421
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->nextAccess:Lcom/google/common/cache/ReferenceEntry;

    return-void
.end method

.method public setNextInWriteQueue(Lcom/google/common/cache/ReferenceEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "next"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1461
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->nextWrite:Lcom/google/common/cache/ReferenceEntry;

    return-void
.end method

.method public setPreviousInAccessQueue(Lcom/google/common/cache/ReferenceEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "previous"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1434
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->previousAccess:Lcom/google/common/cache/ReferenceEntry;

    return-void
.end method

.method public setPreviousInWriteQueue(Lcom/google/common/cache/ReferenceEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "previous"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1474
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->previousWrite:Lcom/google/common/cache/ReferenceEntry;

    return-void
.end method

.method public setWriteTime(J)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "time"
        }
    .end annotation

    .line 1448
    iput-wide p1, p0, Lcom/google/common/cache/LocalCache$WeakAccessWriteEntry;->writeTime:J

    return-void
.end method
