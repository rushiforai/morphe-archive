.class public final Lcom/google/common/collect/ImmutableSortedSet$Builder;
.super Lcom/google/common/collect/ImmutableSet$Builder;
.source "ImmutableSortedSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ImmutableSortedSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableSet$Builder<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "-TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Comparator;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "comparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;)V"
        }
    .end annotation

    .line 449
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableSet$Builder;-><init>()V

    .line 450
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Comparator;

    iput-object p1, p0, Lcom/google/common/collect/ImmutableSortedSet$Builder;->comparator:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>(Ljava/util/Comparator;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "comparator",
            "expectedKeys"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;I)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 454
    invoke-direct {p0, p2, v0}, Lcom/google/common/collect/ImmutableSet$Builder;-><init>(IZ)V

    .line 455
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Comparator;

    iput-object p1, p0, Lcom/google/common/collect/ImmutableSortedSet$Builder;->comparator:Ljava/util/Comparator;

    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "element"
        }
    .end annotation

    .line 435
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSortedSet$Builder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableCollection$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "element"
        }
    .end annotation

    .line 435
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSortedSet$Builder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic add([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableCollection$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "elements"
        }
    .end annotation

    .line 435
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->add([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSortedSet$Builder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "element"
        }
    .end annotation

    .line 435
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSortedSet$Builder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic add([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "elements"
        }
    .end annotation

    .line 435
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->add([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSortedSet$Builder;

    move-result-object p0

    return-object p0
.end method

.method public add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSortedSet$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Lcom/google/common/collect/ImmutableSortedSet$Builder<",
            "TE;>;"
        }
    .end annotation

    .line 470
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    return-object p0
.end method

.method public varargs add([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSortedSet$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "elements"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;)",
            "Lcom/google/common/collect/ImmutableSortedSet$Builder<",
            "TE;>;"
        }
    .end annotation

    .line 485
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableSet$Builder;->add([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    return-object p0
.end method

.method public bridge synthetic addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableCollection$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "elements"
        }
    .end annotation

    .line 435
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSortedSet$Builder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic addAll(Ljava/util/Iterator;)Lcom/google/common/collect/ImmutableCollection$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "elements"
        }
    .end annotation

    .line 435
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->addAll(Ljava/util/Iterator;)Lcom/google/common/collect/ImmutableSortedSet$Builder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSet$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "elements"
        }
    .end annotation

    .line 435
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSortedSet$Builder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic addAll(Ljava/util/Iterator;)Lcom/google/common/collect/ImmutableSet$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "elements"
        }
    .end annotation

    .line 435
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->addAll(Ljava/util/Iterator;)Lcom/google/common/collect/ImmutableSortedSet$Builder;

    move-result-object p0

    return-object p0
.end method

.method public addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSortedSet$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "elements"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+TE;>;)",
            "Lcom/google/common/collect/ImmutableSortedSet$Builder<",
            "TE;>;"
        }
    .end annotation

    .line 500
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableSet$Builder;->addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSet$Builder;

    return-object p0
.end method

.method public addAll(Ljava/util/Iterator;)Lcom/google/common/collect/ImmutableSortedSet$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "elements"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "+TE;>;)",
            "Lcom/google/common/collect/ImmutableSortedSet$Builder<",
            "TE;>;"
        }
    .end annotation

    .line 515
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableSet$Builder;->addAll(Ljava/util/Iterator;)Lcom/google/common/collect/ImmutableSet$Builder;

    return-object p0
.end method

.method public bridge synthetic build()Lcom/google/common/collect/ImmutableCollection;
    .registers 1

    .line 435
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->build()Lcom/google/common/collect/ImmutableSortedSet;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic build()Lcom/google/common/collect/ImmutableSet;
    .registers 1

    .line 435
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->build()Lcom/google/common/collect/ImmutableSortedSet;

    move-result-object p0

    return-object p0
.end method

.method public build()Lcom/google/common/collect/ImmutableSortedSet;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSortedSet<",
            "TE;>;"
        }
    .end annotation

    .line 533
    iget-object v0, p0, Lcom/google/common/collect/ImmutableSortedSet$Builder;->contents:[Ljava/lang/Object;

    .line 534
    iget-object v1, p0, Lcom/google/common/collect/ImmutableSortedSet$Builder;->comparator:Ljava/util/Comparator;

    iget v2, p0, Lcom/google/common/collect/ImmutableSortedSet$Builder;->size:I

    invoke-static {v1, v2, v0}, Lcom/google/common/collect/ImmutableSortedSet;->construct(Ljava/util/Comparator;I[Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSortedSet;

    move-result-object v0

    .line 535
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedSet;->size()I

    move-result v1

    iput v1, p0, Lcom/google/common/collect/ImmutableSortedSet$Builder;->size:I

    const/4 v1, 0x1

    .line 536
    iput-boolean v1, p0, Lcom/google/common/collect/ImmutableSortedSet$Builder;->forceCopy:Z

    return-object v0
.end method

.method bridge synthetic combine(Lcom/google/common/collect/ImmutableSet$Builder;)Lcom/google/common/collect/ImmutableSet$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "builder"
        }
    .end annotation

    .line 435
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSortedSet$Builder;->combine(Lcom/google/common/collect/ImmutableSet$Builder;)Lcom/google/common/collect/ImmutableSortedSet$Builder;

    move-result-object p0

    return-object p0
.end method

.method combine(Lcom/google/common/collect/ImmutableSet$Builder;)Lcom/google/common/collect/ImmutableSortedSet$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "builder"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableSet$Builder<",
            "TE;>;)",
            "Lcom/google/common/collect/ImmutableSortedSet$Builder<",
            "TE;>;"
        }
    .end annotation

    .line 522
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableSet$Builder;->combine(Lcom/google/common/collect/ImmutableSet$Builder;)Lcom/google/common/collect/ImmutableSet$Builder;

    return-object p0
.end method
