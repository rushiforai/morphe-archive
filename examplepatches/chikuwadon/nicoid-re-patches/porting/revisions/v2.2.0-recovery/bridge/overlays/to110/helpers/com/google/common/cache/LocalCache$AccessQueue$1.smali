.class Lcom/google/common/cache/LocalCache$AccessQueue$1;
.super Lcom/google/common/cache/LocalCache$AbstractReferenceEntry;
.source "LocalCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache$AccessQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/cache/LocalCache$AbstractReferenceEntry<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field nextAccess:Lcom/google/common/cache/ReferenceEntry;
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

.field final synthetic this$0:Lcom/google/common/cache/LocalCache$AccessQueue;


# direct methods
.method constructor <init>(Lcom/google/common/cache/LocalCache$AccessQueue;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 3673
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$AccessQueue$1;->this$0:Lcom/google/common/cache/LocalCache$AccessQueue;

    invoke-direct {p0}, Lcom/google/common/cache/LocalCache$AbstractReferenceEntry;-><init>()V

    .line 3683
    iput-object p0, p0, Lcom/google/common/cache/LocalCache$AccessQueue$1;->nextAccess:Lcom/google/common/cache/ReferenceEntry;

    .line 3695
    iput-object p0, p0, Lcom/google/common/cache/LocalCache$AccessQueue$1;->previousAccess:Lcom/google/common/cache/ReferenceEntry;

    return-void
.end method


# virtual methods
.method public getAccessTime()J
    .registers 3

    const-wide v0, 0x7fffffffffffffffL

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

    .line 3687
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$AccessQueue$1;->nextAccess:Lcom/google/common/cache/ReferenceEntry;

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

    .line 3699
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$AccessQueue$1;->previousAccess:Lcom/google/common/cache/ReferenceEntry;

    return-object p0
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

    .line 3692
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$AccessQueue$1;->nextAccess:Lcom/google/common/cache/ReferenceEntry;

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

    .line 3704
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$AccessQueue$1;->previousAccess:Lcom/google/common/cache/ReferenceEntry;

    return-void
.end method
