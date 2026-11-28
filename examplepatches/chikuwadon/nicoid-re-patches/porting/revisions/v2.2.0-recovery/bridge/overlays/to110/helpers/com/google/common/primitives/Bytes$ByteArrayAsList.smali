.class final Lcom/google/common/primitives/Bytes$ByteArrayAsList;
.super Ljava/util/AbstractList;
.source "Bytes.java"

# interfaces
.implements Ljava/util/RandomAccess;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/primitives/Bytes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ByteArrayAsList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList<",
        "Ljava/lang/Byte;",
        ">;",
        "Ljava/util/RandomAccess;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field final array:[B

.field final end:I

.field final start:I


# direct methods
.method constructor <init>([B)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "array"
        }
    .end annotation

    const/4 v0, 0x0

    .line 265
    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lcom/google/common/primitives/Bytes$ByteArrayAsList;-><init>([BII)V

    return-void
.end method

.method constructor <init>([BII)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "array",
            "start",
            "end"
        }
    .end annotation

    .line 268
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 269
    iput-object p1, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    .line 270
    iput p2, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    .line 271
    iput p3, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->end:I

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .line 293
    instance-of v0, p1, Ljava/lang/Byte;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    check-cast p1, Ljava/lang/Byte;

    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result p1

    iget v1, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    iget p0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->end:I

    # invokes: Lcom/google/common/primitives/Bytes;->indexOf([BBII)I
    invoke-static {v0, p1, v1, p0}, Lcom/google/common/primitives/Bytes;->access$000([BBII)I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 344
    :cond_0
    instance-of v1, p1, Lcom/google/common/primitives/Bytes$ByteArrayAsList;

    if-eqz v1, :cond_4

    .line 345
    check-cast p1, Lcom/google/common/primitives/Bytes$ByteArrayAsList;

    .line 346
    invoke-virtual {p0}, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->size()I

    move-result v1

    .line 347
    invoke-virtual {p1}, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->size()I

    move-result v2

    const/4 v3, 0x0

    if-eq v2, v1, :cond_1

    return v3

    :cond_1
    move v2, v3

    :goto_0
    if-ge v2, v1, :cond_3

    .line 351
    iget-object v4, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    iget v5, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    add-int/2addr v5, v2

    aget-byte v4, v4, v5

    iget-object v5, p1, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    iget v6, p1, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    add-int/2addr v6, v2

    aget-byte v5, v5, v6

    if-eq v4, v5, :cond_2

    return v3

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return v0

    .line 357
    :cond_4
    invoke-super {p0, p1}, Ljava/util/AbstractList;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public get(I)Ljava/lang/Byte;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 286
    invoke-virtual {p0}, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->size()I

    move-result v0

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkElementIndex(II)I

    .line 287
    iget-object v0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    iget p0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    add-int/2addr p0, p1

    aget-byte p0, v0, p0

    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "index"
        }
    .end annotation

    .line 258
    invoke-virtual {p0, p1}, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->get(I)Ljava/lang/Byte;

    move-result-object p0

    return-object p0
.end method

.method public hashCode()I
    .registers 4

    .line 363
    iget v0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    const/4 v1, 0x1

    :goto_0
    iget v2, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->end:I

    if-ge v0, v2, :cond_0

    mul-int/lit8 v1, v1, 0x1f

    .line 364
    iget-object v2, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    aget-byte v2, v2, v0

    invoke-static {v2}, Ljava/lang/Byte;->hashCode(B)I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .line 299
    instance-of v0, p1, Ljava/lang/Byte;

    if-eqz v0, :cond_0

    .line 300
    iget-object v0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    check-cast p1, Ljava/lang/Byte;

    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result p1

    iget v1, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    iget v2, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->end:I

    # invokes: Lcom/google/common/primitives/Bytes;->indexOf([BBII)I
    invoke-static {v0, p1, v1, v2}, Lcom/google/common/primitives/Bytes;->access$000([BBII)I

    move-result p1

    if-ltz p1, :cond_0

    .line 302
    iget p0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    sub-int/2addr p1, p0

    return p1

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .line 311
    instance-of v0, p1, Ljava/lang/Byte;

    if-eqz v0, :cond_0

    .line 312
    iget-object v0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    check-cast p1, Ljava/lang/Byte;

    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result p1

    iget v1, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    iget v2, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->end:I

    # invokes: Lcom/google/common/primitives/Bytes;->lastIndexOf([BBII)I
    invoke-static {v0, p1, v1, v2}, Lcom/google/common/primitives/Bytes;->access$100([BBII)I

    move-result p1

    if-ltz p1, :cond_0

    .line 314
    iget p0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    sub-int/2addr p1, p0

    return p1

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public set(ILjava/lang/Byte;)Ljava/lang/Byte;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "index",
            "element"
        }
    .end annotation

    .line 322
    invoke-virtual {p0}, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->size()I

    move-result v0

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkElementIndex(II)I

    .line 323
    iget-object v0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    iget p0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    add-int v1, p0, p1

    aget-byte v1, v0, v1

    add-int/2addr p0, p1

    .line 325
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Byte;

    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result p1

    aput-byte p1, v0, p0

    .line 326
    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "index",
            "element"
        }
    .end annotation

    .line 258
    check-cast p2, Ljava/lang/Byte;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->set(ILjava/lang/Byte;)Ljava/lang/Byte;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 2

    .line 276
    iget v0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->end:I

    iget p0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    sub-int/2addr v0, p0

    return v0
.end method

.method public subList(II)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fromIndex",
            "toIndex"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation

    .line 331
    invoke-virtual {p0}, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->size()I

    move-result v0

    .line 332
    invoke-static {p1, p2, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    if-ne p1, p2, :cond_0

    .line 334
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    .line 336
    :cond_0
    new-instance v0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;

    iget-object v1, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    iget p0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    add-int/2addr p1, p0

    add-int/2addr p0, p2

    invoke-direct {v0, v1, p1, p0}, Lcom/google/common/primitives/Bytes$ByteArrayAsList;-><init>([BII)V

    return-object v0
.end method

.method toByteArray()[B
    .registers 3

    .line 380
    iget-object v0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    iget v1, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    iget p0, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->end:I

    invoke-static {v0, v1, p0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 371
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x5

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v1, 0x5b

    .line 372
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    iget v2, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    aget-byte v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 373
    iget v1, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->start:I

    :goto_0
    add-int/lit8 v1, v1, 0x1

    iget v2, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->end:I

    if-ge v1, v2, :cond_0

    .line 374
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/google/common/primitives/Bytes$ByteArrayAsList;->array:[B

    aget-byte v2, v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const/16 p0, 0x5d

    .line 376
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
