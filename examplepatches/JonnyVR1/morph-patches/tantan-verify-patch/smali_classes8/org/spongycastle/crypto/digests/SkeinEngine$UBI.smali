.class Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/digests/SkeinEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "UBI"
.end annotation


# instance fields
.field private currentBlock:[B

.field private currentOffset:I

.field private message:[J

.field final synthetic this$0:Lorg/spongycastle/crypto/digests/SkeinEngine;

.field private final tweak:Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/digests/SkeinEngine;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->this$0:Lorg/spongycastle/crypto/digests/SkeinEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;

    .line 7
    .line 8
    invoke-direct {p1}, Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->tweak:Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;

    .line 12
    .line 13
    new-array p1, p2, [B

    .line 14
    .line 15
    iput-object p1, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentBlock:[B

    .line 16
    .line 17
    array-length p1, p1

    .line 18
    div-int/lit8 p1, p1, 0x8

    .line 19
    .line 20
    new-array p1, p1, [J

    .line 21
    .line 22
    iput-object p1, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->message:[J

    .line 23
    .line 24
    return-void
.end method

.method private processBlock([J)V
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->this$0:Lorg/spongycastle/crypto/digests/SkeinEngine;

    .line 2
    .line 3
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/SkeinEngine;->threefish:Lorg/spongycastle/crypto/engines/ThreefishEngine;

    .line 4
    .line 5
    iget-object v0, v0, Lorg/spongycastle/crypto/digests/SkeinEngine;->chain:[J

    .line 6
    .line 7
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->tweak:Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;

    .line 8
    .line 9
    invoke-virtual {v2}, Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;->getWords()[J

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-virtual {v1, v3, v0, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->init(Z[J[J)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    move v1, v0

    .line 19
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->message:[J

    .line 20
    .line 21
    array-length v3, v2

    .line 22
    if-ge v1, v3, :cond_0

    .line 23
    .line 24
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentBlock:[B

    .line 25
    .line 26
    mul-int/lit8 v4, v1, 0x8

    .line 27
    .line 28
    invoke-static {v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->bytesToWord([BI)J

    .line 29
    .line 30
    .line 31
    move-result-wide v3

    .line 32
    aput-wide v3, v2, v1

    .line 33
    .line 34
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->this$0:Lorg/spongycastle/crypto/digests/SkeinEngine;

    .line 38
    .line 39
    iget-object v1, v1, Lorg/spongycastle/crypto/digests/SkeinEngine;->threefish:Lorg/spongycastle/crypto/engines/ThreefishEngine;

    .line 40
    .line 41
    invoke-virtual {v1, v2, p1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->processBlock([J[J)I

    .line 42
    .line 43
    .line 44
    :goto_1
    array-length v1, p1

    .line 45
    if-ge v0, v1, :cond_1

    .line 46
    .line 47
    aget-wide v1, p1, v0

    .line 48
    .line 49
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->message:[J

    .line 50
    .line 51
    aget-wide v4, v3, v0

    .line 52
    .line 53
    xor-long/2addr v1, v4

    .line 54
    aput-wide v1, p1, v0

    .line 55
    .line 56
    add-int/lit8 v0, v0, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    return-void
.end method


# virtual methods
.method public doFinal([J)V
    .locals 3

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentOffset:I

    .line 2
    .line 3
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentBlock:[B

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    if-ge v0, v2, :cond_0

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aput-byte v2, v1, v0

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->tweak:Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;->setFinal(Z)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->processBlock([J)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public reset(I)V
    .locals 1

    .line 33
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->tweak:Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;->reset()V

    .line 34
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->tweak:Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;

    invoke-virtual {v0, p1}, Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;->setType(I)V

    const/4 p1, 0x0

    .line 35
    iput p1, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentOffset:I

    return-void
.end method

.method public reset(Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentBlock:[B

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentBlock:[B

    .line 4
    .line 5
    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->clone([B[B)[B

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentBlock:[B

    .line 10
    .line 11
    iget v0, p1, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentOffset:I

    .line 12
    .line 13
    iput v0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentOffset:I

    .line 14
    .line 15
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->message:[J

    .line 16
    .line 17
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->message:[J

    .line 18
    .line 19
    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->clone([J[J)[J

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->message:[J

    .line 24
    .line 25
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->tweak:Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;

    .line 26
    .line 27
    iget-object p1, p1, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->tweak:Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;->reset(Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public update([BII[J)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-le p3, v1, :cond_1

    .line 4
    .line 5
    iget v2, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentOffset:I

    .line 6
    .line 7
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentBlock:[B

    .line 8
    .line 9
    array-length v3, v3

    .line 10
    if-ne v2, v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, p4}, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->processBlock([J)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->tweak:Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;

    .line 16
    .line 17
    invoke-virtual {v2, v0}, Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;->setFirst(Z)V

    .line 18
    .line 19
    .line 20
    iput v0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentOffset:I

    .line 21
    .line 22
    :cond_0
    sub-int v2, p3, v1

    .line 23
    .line 24
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentBlock:[B

    .line 25
    .line 26
    array-length v3, v3

    .line 27
    iget v4, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentOffset:I

    .line 28
    .line 29
    sub-int/2addr v3, v4

    .line 30
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    add-int v3, p2, v1

    .line 35
    .line 36
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentBlock:[B

    .line 37
    .line 38
    iget v5, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentOffset:I

    .line 39
    .line 40
    invoke-static {p1, v3, v4, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 41
    .line 42
    .line 43
    add-int/2addr v1, v2

    .line 44
    iget v3, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentOffset:I

    .line 45
    .line 46
    add-int/2addr v3, v2

    .line 47
    iput v3, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->currentOffset:I

    .line 48
    .line 49
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$UBI;->tweak:Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;

    .line 50
    .line 51
    invoke-virtual {v3, v2}, Lorg/spongycastle/crypto/digests/SkeinEngine$UbiTweak;->advancePosition(I)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return-void
.end method
