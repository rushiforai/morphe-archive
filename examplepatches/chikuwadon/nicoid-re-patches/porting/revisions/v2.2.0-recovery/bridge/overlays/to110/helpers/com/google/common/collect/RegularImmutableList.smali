.class final Lcom/google/common/collect/RegularImmutableList;
.super Lcom/google/common/collect/ImmutableList;
.source "RegularImmutableList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableList<",
        "TE;>;"
    }
.end annotation


# static fields
.field static final EMPTY:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field static final EMPTY_ITR:Lcom/google/common/collect/UnmodifiableListIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/UnmodifiableListIterator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final transient array:[Ljava/lang/Object;

.field private final transient size:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 37
    new-instance v0, Lcom/google/common/collect/RegularImmutableList;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    invoke-direct {v0, v2, v1}, Lcom/google/common/collect/RegularImmutableList;-><init>([Ljava/lang/Object;I)V

    sput-object v0, Lcom/google/common/collect/RegularImmutableList;->EMPTY:Lcom/google/common/collect/ImmutableList;

    .line 38
    new-instance v2, Lcom/google/common/collect/ImmutableList$Itr;

    invoke-direct {v2, v0, v1}, Lcom/google/common/collect/ImmutableList$Itr;-><init>(Lcom/google/common/collect/ImmutableList;I)V

    sput-object v2, Lcom/google/common/collect/RegularImmutableList;->EMPTY_ITR:Lcom/google/common/collect/UnmodifiableListIterator;

    return-void
.end method

.method constructor <init>([Ljava/lang/Object;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "array",
            "size"
        }
    .end annotation

    .line 44
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableList;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    .line 46
    iput p2, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    return-void
.end method


# virtual methods
.method copyIntoArray([Ljava/lang/Object;I)I
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dst",
            "dstOff"
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    const/4 v1, 0x0

    iget v2, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 77
    iget p0, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    add-int/2addr p2, p0

    return p2
.end method

.method public get(I)Ljava/lang/Object;
    .registers 3
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

    .line 84
    iget v0, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkElementIndex(II)I

    .line 86
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    aget-object p0, p0, p1

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method internalArray()[Ljava/lang/Object;
    .registers 1

    .line 61
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableList;->array:[Ljava/lang/Object;

    return-object p0
.end method

.method internalArrayEnd()I
    .registers 1

    .line 71
    iget p0, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    return p0
.end method

.method internalArrayStart()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method isPartialView()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public size()I
    .registers 1

    .line 51
    iget p0, p0, Lcom/google/common/collect/RegularImmutableList;->size:I

    return p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 1

    .line 97
    invoke-super {p0}, Lcom/google/common/collect/ImmutableList;->writeReplace()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
