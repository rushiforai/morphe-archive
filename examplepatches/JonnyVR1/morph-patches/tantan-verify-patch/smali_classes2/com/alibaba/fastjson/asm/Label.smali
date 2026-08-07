.class public Lcom/alibaba/fastjson/asm/Label;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field inputStackTop:I

.field next:Lcom/alibaba/fastjson/asm/Label;

.field outputStackMax:I

.field position:I

.field private referenceCount:I

.field private srcAndRefPositions:[I

.field status:I

.field successor:Lcom/alibaba/fastjson/asm/Label;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private addReference(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/asm/Label;->srcAndRefPositions:[I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-array v0, v1, [I

    .line 7
    .line 8
    iput-object v0, p0, Lcom/alibaba/fastjson/asm/Label;->srcAndRefPositions:[I

    .line 9
    .line 10
    :cond_0
    iget v0, p0, Lcom/alibaba/fastjson/asm/Label;->referenceCount:I

    .line 11
    .line 12
    iget-object v2, p0, Lcom/alibaba/fastjson/asm/Label;->srcAndRefPositions:[I

    .line 13
    .line 14
    array-length v3, v2

    .line 15
    if-lt v0, v3, :cond_1

    .line 16
    .line 17
    array-length v0, v2

    .line 18
    add-int/2addr v0, v1

    .line 19
    new-array v0, v0, [I

    .line 20
    .line 21
    array-length v1, v2

    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-static {v2, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/alibaba/fastjson/asm/Label;->srcAndRefPositions:[I

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/alibaba/fastjson/asm/Label;->srcAndRefPositions:[I

    .line 29
    .line 30
    iget v1, p0, Lcom/alibaba/fastjson/asm/Label;->referenceCount:I

    .line 31
    .line 32
    add-int/lit8 v2, v1, 0x1

    .line 33
    .line 34
    iput v2, p0, Lcom/alibaba/fastjson/asm/Label;->referenceCount:I

    .line 35
    .line 36
    aput p1, v0, v1

    .line 37
    .line 38
    add-int/lit8 v1, v1, 0x2

    .line 39
    .line 40
    iput v1, p0, Lcom/alibaba/fastjson/asm/Label;->referenceCount:I

    .line 41
    .line 42
    aput p2, v0, v2

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public put(Lcom/alibaba/fastjson/asm/MethodWriter;Lcom/alibaba/fastjson/asm/ByteVector;I)V
    .locals 0

    .line 1
    iget p1, p0, Lcom/alibaba/fastjson/asm/Label;->status:I

    .line 2
    .line 3
    and-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget p1, p2, Lcom/alibaba/fastjson/asm/ByteVector;->length:I

    .line 8
    .line 9
    invoke-direct {p0, p3, p1}, Lcom/alibaba/fastjson/asm/Label;->addReference(II)V

    .line 10
    .line 11
    .line 12
    const/4 p0, -0x1

    .line 13
    invoke-virtual {p2, p0}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget p0, p0, Lcom/alibaba/fastjson/asm/Label;->position:I

    .line 18
    .line 19
    sub-int/2addr p0, p3

    .line 20
    invoke-virtual {p2, p0}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public resolve(Lcom/alibaba/fastjson/asm/MethodWriter;I[B)V
    .locals 4

    .line 1
    iget p1, p0, Lcom/alibaba/fastjson/asm/Label;->status:I

    .line 2
    .line 3
    or-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    iput p1, p0, Lcom/alibaba/fastjson/asm/Label;->status:I

    .line 6
    .line 7
    iput p2, p0, Lcom/alibaba/fastjson/asm/Label;->position:I

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    :goto_0
    iget v0, p0, Lcom/alibaba/fastjson/asm/Label;->referenceCount:I

    .line 11
    .line 12
    if-ge p1, v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/alibaba/fastjson/asm/Label;->srcAndRefPositions:[I

    .line 15
    .line 16
    add-int/lit8 v1, p1, 0x1

    .line 17
    .line 18
    aget v2, v0, p1

    .line 19
    .line 20
    add-int/lit8 p1, p1, 0x2

    .line 21
    .line 22
    aget v0, v0, v1

    .line 23
    .line 24
    sub-int v1, p2, v2

    .line 25
    .line 26
    add-int/lit8 v2, v0, 0x1

    .line 27
    .line 28
    ushr-int/lit8 v3, v1, 0x8

    .line 29
    .line 30
    int-to-byte v3, v3

    .line 31
    aput-byte v3, p3, v0

    .line 32
    .line 33
    int-to-byte v0, v1

    .line 34
    aput-byte v0, p3, v2

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method
