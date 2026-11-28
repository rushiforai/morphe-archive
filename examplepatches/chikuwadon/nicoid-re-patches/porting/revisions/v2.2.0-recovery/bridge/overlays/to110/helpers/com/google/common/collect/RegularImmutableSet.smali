.class final Lcom/google/common/collect/RegularImmutableSet;
.super Lcom/google/common/collect/ImmutableSet;
.source "RegularImmutableSet.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableSet<",
        "TE;>;"
    }
.end annotation


# static fields
.field static final EMPTY:Lcom/google/common/collect/RegularImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/RegularImmutableSet<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final EMPTY_ARRAY:[Ljava/lang/Object;


# instance fields
.field final transient elements:[Ljava/lang/Object;

.field private final transient hashCode:I

.field private final transient mask:I

.field private final transient size:I

.field final transient table:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    const/4 v0, 0x0

    .line 36
    new-array v2, v0, [Ljava/lang/Object;

    sput-object v2, Lcom/google/common/collect/RegularImmutableSet;->EMPTY_ARRAY:[Ljava/lang/Object;

    .line 37
    new-instance v1, Lcom/google/common/collect/RegularImmutableSet;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object v4, v2

    invoke-direct/range {v1 .. v6}, Lcom/google/common/collect/RegularImmutableSet;-><init>([Ljava/lang/Object;I[Ljava/lang/Object;II)V

    sput-object v1, Lcom/google/common/collect/RegularImmutableSet;->EMPTY:Lcom/google/common/collect/RegularImmutableSet;

    return-void
.end method

.method constructor <init>([Ljava/lang/Object;I[Ljava/lang/Object;II)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "elements",
            "hashCode",
            "table",
            "mask",
            "size"
        }
    .end annotation

    .line 50
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableSet;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableSet;->elements:[Ljava/lang/Object;

    .line 52
    iput p2, p0, Lcom/google/common/collect/RegularImmutableSet;->hashCode:I

    .line 53
    iput-object p3, p0, Lcom/google/common/collect/RegularImmutableSet;->table:[Ljava/lang/Object;

    .line 54
    iput p4, p0, Lcom/google/common/collect/RegularImmutableSet;->mask:I

    .line 55
    iput p5, p0, Lcom/google/common/collect/RegularImmutableSet;->size:I

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSet;->table:[Ljava/lang/Object;

    const/4 v1, 0x0

    if-eqz p1, :cond_2

    .line 61
    array-length v2, v0

    if-eqz v2, :cond_2

    .line 64
    invoke-static {p1}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v2

    .line 65
    :goto_0
    iget v3, p0, Lcom/google/common/collect/RegularImmutableSet;->mask:I

    and-int/2addr v2, v3

    .line 66
    aget-object v3, v0, v2

    if-nez v3, :cond_0

    return v1

    .line 69
    :cond_0
    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method copyIntoArray([Ljava/lang/Object;I)I
    .registers 6
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

    .line 105
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSet;->elements:[Ljava/lang/Object;

    const/4 v1, 0x0

    iget v2, p0, Lcom/google/common/collect/RegularImmutableSet;->size:I

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 106
    iget p0, p0, Lcom/google/common/collect/RegularImmutableSet;->size:I

    add-int/2addr p2, p0

    return p2
.end method

.method createAsList()Lcom/google/common/collect/ImmutableList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList<",
            "TE;>;"
        }
    .end annotation

    .line 111
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSet;->elements:[Ljava/lang/Object;

    iget p0, p0, Lcom/google/common/collect/RegularImmutableSet;->size:I

    invoke-static {v0, p0}, Lcom/google/common/collect/ImmutableList;->asImmutableList([Ljava/lang/Object;I)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method public hashCode()I
    .registers 1

    .line 121
    iget p0, p0, Lcom/google/common/collect/RegularImmutableSet;->hashCode:I

    return p0
.end method

.method internalArray()[Ljava/lang/Object;
    .registers 1

    .line 90
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSet;->elements:[Ljava/lang/Object;

    return-object p0
.end method

.method internalArrayEnd()I
    .registers 1

    .line 100
    iget p0, p0, Lcom/google/common/collect/RegularImmutableSet;->size:I

    return p0
.end method

.method internalArrayStart()I
    .registers 1

    const/4 p0, 0x0

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

    .line 85
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSet;->asList()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 33
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 77
    iget p0, p0, Lcom/google/common/collect/RegularImmutableSet;->size:I

    return p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 1

    .line 135
    invoke-super {p0}, Lcom/google/common/collect/ImmutableSet;->writeReplace()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
