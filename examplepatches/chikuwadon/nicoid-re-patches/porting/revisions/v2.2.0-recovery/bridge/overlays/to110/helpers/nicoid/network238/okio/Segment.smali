.class public final Lnicoid/network238/okio/Segment;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/Segment$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u000c\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008\u0000\u0018\u0000 \u001a2\u00020\u0001:\u0001\u001aB\t\u0008\u0016\u00a2\u0006\u0004\u0008\u0002\u0010\u0003B1\u0008\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0002\u0010\u000cJ\u0006\u0010\u000f\u001a\u00020\u0000J\u0006\u0010\u0010\u001a\u00020\u0000J\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0000J\u000e\u0010\u0012\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020\u0000J\u000e\u0010\u0014\u001a\u00020\u00002\u0006\u0010\u0015\u001a\u00020\u0007J\u0006\u0010\u0016\u001a\u00020\u0017J\u0016\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0019\u001a\u00020\u00002\u0006\u0010\u0015\u001a\u00020\u0007R\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0006\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0008\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\t\u001a\u00020\n8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000b\u001a\u00020\n8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\r\u001a\u0004\u0018\u00010\u00008\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\u0004\u0018\u00010\u00008\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001b"
    }
    d2 = {
        "Lnicoid/network238/okio/Segment;",
        "",
        "<init>",
        "()V",
        "data",
        "",
        "pos",
        "",
        "limit",
        "shared",
        "",
        "owner",
        "([BIIZZ)V",
        "next",
        "prev",
        "sharedCopy",
        "unsharedCopy",
        "pop",
        "push",
        "segment",
        "split",
        "byteCount",
        "compact",
        "",
        "writeTo",
        "sink",
        "Companion",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/okio/Segment$Companion;

.field public static final SHARE_MINIMUM:I = 0x400

.field public static final SIZE:I = 0x2000


# instance fields
.field public final data:[B

.field public limit:I

.field public next:Lnicoid/network238/okio/Segment;

.field public owner:Z

.field public pos:I

.field public prev:Lnicoid/network238/okio/Segment;

.field public shared:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okio/Segment$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okio/Segment$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okio/Segment;->Companion:Lnicoid/network238/okio/Segment$Companion;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lnicoid/network238/okio/Segment;->data:[B

    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/Segment;->owner:Z

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnicoid/network238/okio/Segment;->shared:Z

    return-void
.end method

.method public constructor <init>([BIIZZ)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lnicoid/network238/okio/Segment;->data:[B

    .line 69
    iput p2, p0, Lnicoid/network238/okio/Segment;->pos:I

    .line 70
    iput p3, p0, Lnicoid/network238/okio/Segment;->limit:I

    .line 71
    iput-boolean p4, p0, Lnicoid/network238/okio/Segment;->shared:Z

    .line 72
    iput-boolean p5, p0, Lnicoid/network238/okio/Segment;->owner:Z

    return-void
.end method


# virtual methods
.method public final compact()V
    .registers 4

    .line 147
    iget-object v0, p0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    if-eq v0, p0, :cond_3

    .line 148
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v0, v0, Lnicoid/network238/okio/Segment;->owner:Z

    if-nez v0, :cond_0

    goto :goto_1

    .line 149
    :cond_0
    iget v0, p0, Lnicoid/network238/okio/Segment;->limit:I

    iget v1, p0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v1

    .line 150
    iget-object v1, p0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v1, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v1, v1, 0x2000

    iget-object v2, p0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v2, v2, Lnicoid/network238/okio/Segment;->shared:Z

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v2, v2, Lnicoid/network238/okio/Segment;->pos:I

    :goto_0
    add-int/2addr v1, v2

    if-le v0, v1, :cond_2

    :goto_1
    return-void

    .line 152
    :cond_2
    iget-object v1, p0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, v0}, Lnicoid/network238/okio/Segment;->writeTo(Lnicoid/network238/okio/Segment;I)V

    .line 153
    invoke-virtual {p0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    .line 154
    invoke-static {p0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    return-void

    .line 147
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cannot compact"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final pop()Lnicoid/network238/okio/Segment;
    .registers 5

    .line 93
    iget-object v0, p0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    const/4 v1, 0x0

    if-ne v0, p0, :cond_0

    move-object v0, v1

    .line 94
    :cond_0
    iget-object v2, p0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, p0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    iput-object v3, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 95
    iget-object v2, p0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, p0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    iput-object v3, v2, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 96
    iput-object v1, p0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 97
    iput-object v1, p0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    return-object v0
.end method

.method public final push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 105
    iput-object p0, p1, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 106
    iget-object v0, p0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    iput-object v0, p1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 107
    iget-object v0, p0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, v0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 108
    iput-object p1, p0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    return-object p1
.end method

.method public final sharedCopy()Lnicoid/network238/okio/Segment;
    .registers 8

    .line 81
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/Segment;->shared:Z

    .line 82
    new-instance v1, Lnicoid/network238/okio/Segment;

    iget-object v2, p0, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, p0, Lnicoid/network238/okio/Segment;->pos:I

    iget v4, p0, Lnicoid/network238/okio/Segment;->limit:I

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lnicoid/network238/okio/Segment;-><init>([BIIZZ)V

    return-object v1
.end method

.method public final split(I)Lnicoid/network238/okio/Segment;
    .registers 10

    if-lez p1, :cond_1

    .line 121
    iget v0, p0, Lnicoid/network238/okio/Segment;->limit:I

    iget v1, p0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v1

    if-gt p1, v0, :cond_1

    const/16 v0, 0x400

    if-lt p1, v0, :cond_0

    .line 130
    invoke-virtual {p0}, Lnicoid/network238/okio/Segment;->sharedCopy()Lnicoid/network238/okio/Segment;

    move-result-object v0

    goto :goto_0

    .line 132
    :cond_0
    invoke-static {}, Lnicoid/network238/okio/SegmentPool;->take()Lnicoid/network238/okio/Segment;

    move-result-object v0

    .line 133
    iget-object v1, p0, Lnicoid/network238/okio/Segment;->data:[B

    iget-object v2, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v4, p0, Lnicoid/network238/okio/Segment;->pos:I

    add-int v5, v4, p1

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v7}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto$default([B[BIIIILjava/lang/Object;)[B

    .line 136
    :goto_0
    iget v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr v1, p1

    iput v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    .line 137
    iget v1, p0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr v1, p1

    iput v1, p0, Lnicoid/network238/okio/Segment;->pos:I

    .line 138
    iget-object p1, p0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    return-object v0

    .line 121
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "byteCount out of range"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final unsharedCopy()Lnicoid/network238/okio/Segment;
    .registers 7

    .line 86
    new-instance v0, Lnicoid/network238/okio/Segment;

    iget-object v1, p0, Lnicoid/network238/okio/Segment;->data:[B

    array-length v2, v1

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    iget v2, p0, Lnicoid/network238/okio/Segment;->pos:I

    iget v3, p0, Lnicoid/network238/okio/Segment;->limit:I

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okio/Segment;-><init>([BIIZZ)V

    return-object v0
.end method

.method public final writeTo(Lnicoid/network238/okio/Segment;I)V
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 159
    iget-boolean v0, p1, Lnicoid/network238/okio/Segment;->owner:Z

    if-eqz v0, :cond_3

    .line 160
    iget v5, p1, Lnicoid/network238/okio/Segment;->limit:I

    add-int v0, v5, p2

    const/16 v1, 0x2000

    if-le v0, v1, :cond_2

    .line 162
    iget-boolean v2, p1, Lnicoid/network238/okio/Segment;->shared:Z

    if-nez v2, :cond_1

    .line 163
    iget v4, p1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v4

    if-gt v0, v1, :cond_0

    .line 164
    iget-object v1, p1, Lnicoid/network238/okio/Segment;->data:[B

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v3, 0x0

    move-object v2, v1

    invoke-static/range {v1 .. v7}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto$default([B[BIIIILjava/lang/Object;)[B

    .line 165
    iget v0, p1, Lnicoid/network238/okio/Segment;->limit:I

    iget v1, p1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int v5, v0, v1

    iput v5, p1, Lnicoid/network238/okio/Segment;->limit:I

    .line 166
    const/4 v0, 0x0

    iput v0, p1, Lnicoid/network238/okio/Segment;->pos:I

    goto :goto_0

    .line 163
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    .line 162
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    .line 169
    :cond_2
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okio/Segment;->data:[B

    .line 170
    iget-object v1, p1, Lnicoid/network238/okio/Segment;->data:[B

    .line 172
    iget v2, p0, Lnicoid/network238/okio/Segment;->pos:I

    add-int v3, v2, p2

    .line 169
    invoke-static {v0, v1, v5, v2, v3}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 175
    iget v0, p1, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v0, p2

    iput v0, p1, Lnicoid/network238/okio/Segment;->limit:I

    .line 176
    iget p1, p0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr p1, p2

    iput p1, p0, Lnicoid/network238/okio/Segment;->pos:I

    return-void

    .line 159
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "only owner can write"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
