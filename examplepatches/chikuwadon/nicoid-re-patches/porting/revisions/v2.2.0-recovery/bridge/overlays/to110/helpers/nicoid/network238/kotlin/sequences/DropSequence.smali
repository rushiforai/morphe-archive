.class public final Lnicoid/network238/kotlin/sequences/DropSequence;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/sequences/Sequence;
.implements Lnicoid/network238/kotlin/sequences/DropTakeSequence;


# instance fields
.field private final count:I

.field private final sequence:Lnicoid/network238/kotlin/sequences/Sequence;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/sequences/Sequence;I)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 496
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 497
    iput-object p1, p0, Lnicoid/network238/kotlin/sequences/DropSequence;->sequence:Lnicoid/network238/kotlin/sequences/Sequence;

    .line 498
    iput p2, p0, Lnicoid/network238/kotlin/sequences/DropSequence;->count:I

    if-ltz p2, :cond_0

    return-void

    .line 501
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "count must be non-negative, but was "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 p2, 0x2e

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public static final synthetic access$getCount$p(Lnicoid/network238/kotlin/sequences/DropSequence;)I
    .registers 1

    .line 496
    iget p0, p0, Lnicoid/network238/kotlin/sequences/DropSequence;->count:I

    return p0
.end method

.method public static final synthetic access$getSequence$p(Lnicoid/network238/kotlin/sequences/DropSequence;)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 1

    .line 496
    iget-object p0, p0, Lnicoid/network238/kotlin/sequences/DropSequence;->sequence:Lnicoid/network238/kotlin/sequences/Sequence;

    return-object p0
.end method


# virtual methods
.method public drop(I)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 4

    .line 504
    iget v0, p0, Lnicoid/network238/kotlin/sequences/DropSequence;->count:I

    add-int/2addr v0, p1

    if-gez v0, :cond_0

    new-instance v0, Lnicoid/network238/kotlin/sequences/DropSequence;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/kotlin/sequences/DropSequence;-><init>(Lnicoid/network238/kotlin/sequences/Sequence;I)V

    return-object v0

    :cond_0
    new-instance p1, Lnicoid/network238/kotlin/sequences/DropSequence;

    iget-object v1, p0, Lnicoid/network238/kotlin/sequences/DropSequence;->sequence:Lnicoid/network238/kotlin/sequences/Sequence;

    invoke-direct {p1, v1, v0}, Lnicoid/network238/kotlin/sequences/DropSequence;-><init>(Lnicoid/network238/kotlin/sequences/Sequence;I)V

    return-object p1
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2

    .line 507
    new-instance v0, Lnicoid/network238/kotlin/sequences/DropSequence$iterator$1;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/sequences/DropSequence$iterator$1;-><init>(Lnicoid/network238/kotlin/sequences/DropSequence;)V

    return-object v0
.end method
