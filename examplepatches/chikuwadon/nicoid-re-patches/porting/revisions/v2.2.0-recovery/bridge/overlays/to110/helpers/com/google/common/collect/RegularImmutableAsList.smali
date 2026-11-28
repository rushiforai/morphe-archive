.class Lcom/google/common/collect/RegularImmutableAsList;
.super Lcom/google/common/collect/ImmutableAsList;
.source "RegularImmutableAsList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableAsList<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private final delegate:Lcom/google/common/collect/ImmutableCollection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableCollection<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final delegateList:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "+TE;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableCollection;Lcom/google/common/collect/ImmutableList;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "delegate",
            "delegateList"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableCollection<",
            "TE;>;",
            "Lcom/google/common/collect/ImmutableList<",
            "+TE;>;)V"
        }
    .end annotation

    .line 36
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableAsList;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableAsList;->delegate:Lcom/google/common/collect/ImmutableCollection;

    .line 38
    iput-object p2, p0, Lcom/google/common/collect/RegularImmutableAsList;->delegateList:Lcom/google/common/collect/ImmutableList;

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/ImmutableCollection;[Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "delegate",
            "array"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableCollection<",
            "TE;>;[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 42
    invoke-static {p2}, Lcom/google/common/collect/RegularImmutableAsList;->asImmutableList([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/RegularImmutableAsList;-><init>(Lcom/google/common/collect/ImmutableCollection;Lcom/google/common/collect/ImmutableList;)V

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/ImmutableCollection;[Ljava/lang/Object;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "delegate",
            "array",
            "size"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableCollection<",
            "TE;>;[",
            "Ljava/lang/Object;",
            "I)V"
        }
    .end annotation

    .line 46
    invoke-static {p2, p3}, Lcom/google/common/collect/RegularImmutableAsList;->asImmutableList([Ljava/lang/Object;I)Lcom/google/common/collect/ImmutableList;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/RegularImmutableAsList;-><init>(Lcom/google/common/collect/ImmutableCollection;Lcom/google/common/collect/ImmutableList;)V

    return-void
.end method


# virtual methods
.method copyIntoArray([Ljava/lang/Object;I)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dst",
            "offset"
        }
    .end annotation

    .line 67
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableAsList;->delegateList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ImmutableList;->copyIntoArray([Ljava/lang/Object;I)I

    move-result p0

    return p0
.end method

.method delegateCollection()Lcom/google/common/collect/ImmutableCollection;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableCollection<",
            "TE;>;"
        }
    .end annotation

    .line 51
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableAsList;->delegate:Lcom/google/common/collect/ImmutableCollection;

    return-object p0
.end method

.method final delegateList()Lcom/google/common/collect/ImmutableList;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList<",
            "+TE;>;"
        }
    .end annotation

    .line 55
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableAsList;->delegateList:Lcom/google/common/collect/ImmutableList;

    return-object p0
.end method

.method public final get(I)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 87
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableAsList;->delegateList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method internalArray()[Ljava/lang/Object;
    .registers 1

    .line 72
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableAsList;->delegateList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->internalArray()[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method internalArrayEnd()I
    .registers 1

    .line 82
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableAsList;->delegateList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->internalArrayEnd()I

    move-result p0

    return p0
.end method

.method internalArrayStart()I
    .registers 1

    .line 77
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableAsList;->delegateList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->internalArrayStart()I

    move-result p0

    return p0
.end method

.method public final listIterator(I)Lcom/google/common/collect/UnmodifiableListIterator;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/collect/UnmodifiableListIterator<",
            "TE;>;"
        }
    .end annotation

    .line 61
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableAsList;->delegateList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableList;->listIterator(I)Lcom/google/common/collect/UnmodifiableListIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic listIterator(I)Ljava/util/ListIterator;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "index"
        }
    .end annotation

    .line 30
    invoke-virtual {p0, p1}, Lcom/google/common/collect/RegularImmutableAsList;->listIterator(I)Lcom/google/common/collect/UnmodifiableListIterator;

    move-result-object p0

    return-object p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 1

    .line 96
    invoke-super {p0}, Lcom/google/common/collect/ImmutableAsList;->writeReplace()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
