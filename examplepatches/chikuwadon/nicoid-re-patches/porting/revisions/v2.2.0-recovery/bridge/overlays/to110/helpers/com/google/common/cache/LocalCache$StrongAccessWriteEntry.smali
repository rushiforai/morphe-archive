.class final Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;
.super Lcom/google/common/cache/LocalCache$StrongEntry;
.source "LocalCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "StrongAccessWriteEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/cache/LocalCache$StrongEntry<",
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
.method constructor <init>(Ljava/lang/Object;ILcom/google/common/cache/ReferenceEntry;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "key",
            "hash",
            "next"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1106
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/cache/LocalCache$StrongEntry;-><init>(Ljava/lang/Object;ILcom/google/common/cache/ReferenceEntry;)V

    const-wide p1, 0x7fffffffffffffffL

    .line 1111
    iput-wide p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->accessTime:J

    .line 1124
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/ReferenceEntry;

    move-result-object p3

    iput-object p3, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextAccess:Lcom/google/common/cache/ReferenceEntry;

    .line 1137
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/ReferenceEntry;

    move-result-object p3

    iput-object p3, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousAccess:Lcom/google/common/cache/ReferenceEntry;

    .line 1151
    iput-wide p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->writeTime:J

    .line 1164
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/ReferenceEntry;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextWrite:Lcom/google/common/cache/ReferenceEntry;

    .line 1177
    invoke-static {}, Lcom/google/common/cache/LocalCache;->nullEntry()Lcom/google/common/cache/ReferenceEntry;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousWrite:Lcom/google/common/cache/ReferenceEntry;

    return-void
.end method


# virtual methods
.method public getAccessTime()J
    .registers 3

    .line 1115
    iget-wide v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->accessTime:J

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

    .line 1128
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextAccess:Lcom/google/common/cache/ReferenceEntry;

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

    .line 1168
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextWrite:Lcom/google/common/cache/ReferenceEntry;

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

    .line 1141
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousAccess:Lcom/google/common/cache/ReferenceEntry;

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

    .line 1181
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousWrite:Lcom/google/common/cache/ReferenceEntry;

    return-object p0
.end method

.method public getWriteTime()J
    .registers 3

    .line 1155
    iget-wide v0, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->writeTime:J

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

    .line 1120
    iput-wide p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->accessTime:J

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

    .line 1133
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextAccess:Lcom/google/common/cache/ReferenceEntry;

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

    .line 1173
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->nextWrite:Lcom/google/common/cache/ReferenceEntry;

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

    .line 1146
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousAccess:Lcom/google/common/cache/ReferenceEntry;

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

    .line 1186
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->previousWrite:Lcom/google/common/cache/ReferenceEntry;

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

    .line 1160
    iput-wide p1, p0, Lcom/google/common/cache/LocalCache$StrongAccessWriteEntry;->writeTime:J

    return-void
.end method
