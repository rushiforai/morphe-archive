.class final Lcom/google/common/collect/ImmutableEnumSet;
.super Lcom/google/common/collect/ImmutableSet;
.source "ImmutableEnumSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/ImmutableEnumSet$EnumSerializedForm;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Enum<",
        "TE;>;>",
        "Lcom/google/common/collect/ImmutableSet<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private final transient delegate:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet<",
            "TE;>;"
        }
    .end annotation
.end field

.field private transient hashCode:I
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/EnumSet;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "delegate"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet<",
            "TE;>;)V"
        }
    .end annotation

    .line 62
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableSet;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/EnumSet;Lcom/google/common/collect/ImmutableEnumSet$1;)V
    .registers 3

    .line 40
    invoke-direct {p0, p1}, Lcom/google/common/collect/ImmutableEnumSet;-><init>(Ljava/util/EnumSet;)V

    return-void
.end method

.method static asImmutable(Ljava/util/EnumSet;)Lcom/google/common/collect/ImmutableSet;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "set"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum<",
            "TE;>;>(",
            "Ljava/util/EnumSet<",
            "TE;>;)",
            "Lcom/google/common/collect/ImmutableSet<",
            "TE;>;"
        }
    .end annotation

    .line 42
    invoke-virtual {p0}, Ljava/util/EnumSet;->size()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 48
    new-instance v0, Lcom/google/common/collect/ImmutableEnumSet;

    invoke-direct {v0, p0}, Lcom/google/common/collect/ImmutableEnumSet;-><init>(Ljava/util/EnumSet;)V

    return-object v0

    .line 46
    :cond_0
    invoke-static {p0}, Lcom/google/common/collect/Iterables;->getOnlyElement(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Enum;

    invoke-static {p0}, Lcom/google/common/collect/ImmutableSet;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    return-object p0

    .line 44
    :cond_1
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->of()Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    return-object p0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InvalidObjectException;
        }
    .end annotation

    .line 139
    new-instance p0, Ljava/io/InvalidObjectException;

    const-string p1, "Use SerializedForm"

    invoke-direct {p0, p1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 83
    iget-object p0, p0, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    invoke-virtual {p0, p1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "collection"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 88
    instance-of v0, p1, Lcom/google/common/collect/ImmutableEnumSet;

    if-eqz v0, :cond_0

    .line 89
    check-cast p1, Lcom/google/common/collect/ImmutableEnumSet;

    iget-object p1, p1, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    .line 91
    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    invoke-virtual {p0, p1}, Ljava/util/EnumSet;->containsAll(Ljava/util/Collection;)Z

    move-result p0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 104
    :cond_0
    instance-of v0, p1, Lcom/google/common/collect/ImmutableEnumSet;

    if-eqz v0, :cond_1

    .line 105
    check-cast p1, Lcom/google/common/collect/ImmutableEnumSet;

    iget-object p1, p1, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    .line 107
    :cond_1
    iget-object p0, p0, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    invoke-virtual {p0, p1}, Ljava/util/EnumSet;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .registers 2

    .line 119
    iget v0, p0, Lcom/google/common/collect/ImmutableEnumSet;->hashCode:I

    if-nez v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    invoke-virtual {v0}, Ljava/util/EnumSet;->hashCode()I

    move-result v0

    iput v0, p0, Lcom/google/common/collect/ImmutableEnumSet;->hashCode:I

    :cond_0
    return v0
.end method

.method public isEmpty()Z
    .registers 1

    .line 96
    iget-object p0, p0, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    invoke-virtual {p0}, Ljava/util/EnumSet;->isEmpty()Z

    move-result p0

    return p0
.end method

.method isHashCodeFast()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method isPartialView()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public iterator()Lcom/google/common/collect/UnmodifiableIterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "TE;>;"
        }
    .end annotation

    .line 73
    iget-object p0, p0, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    invoke-virtual {p0}, Ljava/util/EnumSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Iterators;->unmodifiableIterator(Ljava/util/Iterator;)Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 38
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableEnumSet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 78
    iget-object p0, p0, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    invoke-virtual {p0}, Ljava/util/EnumSet;->size()I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 128
    iget-object p0, p0, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    invoke-virtual {p0}, Ljava/util/EnumSet;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 2

    .line 134
    new-instance v0, Lcom/google/common/collect/ImmutableEnumSet$EnumSerializedForm;

    iget-object p0, p0, Lcom/google/common/collect/ImmutableEnumSet;->delegate:Ljava/util/EnumSet;

    invoke-direct {v0, p0}, Lcom/google/common/collect/ImmutableEnumSet$EnumSerializedForm;-><init>(Ljava/util/EnumSet;)V

    return-object v0
.end method
