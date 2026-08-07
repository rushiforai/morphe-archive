.class public final Lokio/Segment;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokio/Segment$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u000b\u0008\u0000\u0018\u0000 \u00192\u00020\u0001:\u0001\u0019B\u0007\u0008\u0016\u00a2\u0006\u0002\u0010\u0002B/\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0002\u0010\u000bJ\u0006\u0010\u000e\u001a\u00020\u000fJ\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0000J\u000e\u0010\u0011\u001a\u00020\u00002\u0006\u0010\u0012\u001a\u00020\u0000J\u0006\u0010\u0013\u001a\u00020\u0000J\u000e\u0010\u0014\u001a\u00020\u00002\u0006\u0010\u0015\u001a\u00020\u0006J\u0006\u0010\u0016\u001a\u00020\u0000J\u0016\u0010\u0017\u001a\u00020\u000f2\u0006\u0010\u0018\u001a\u00020\u00002\u0006\u0010\u0015\u001a\u00020\u0006R\u0010\u0010\u0003\u001a\u00020\u00048\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0007\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000c\u001a\u0004\u0018\u00010\u00008\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\n\u001a\u00020\t8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0005\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\r\u001a\u0004\u0018\u00010\u00008\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0008\u001a\u00020\t8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Lokio/Segment;",
        "",
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
        "compact",
        "",
        "pop",
        "push",
        "segment",
        "sharedCopy",
        "split",
        "byteCount",
        "unsharedCopy",
        "writeTo",
        "sink",
        "Companion",
        "jvm"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xb
    }
.end annotation


# static fields
.field public static final Companion:Lokio/Segment$Companion;

.field public static final SHARE_MINIMUM:I = 0x400

.field public static final SIZE:I = 0x2000


# instance fields
.field public final data:[B
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public limit:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public next:Lokio/Segment;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public owner:Z
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public pos:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public prev:Lokio/Segment;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public shared:Z
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lokio/Segment$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lokio/Segment$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lokio/Segment;->Companion:Lokio/Segment$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lokio/Segment;->data:[B

    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lokio/Segment;->owner:Z

    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lokio/Segment;->shared:Z

    return-void
.end method

.method public constructor <init>([BIIZZ)V
    .locals 0
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lokio/Segment;->data:[B

    .line 8
    .line 9
    iput p2, p0, Lokio/Segment;->pos:I

    .line 10
    .line 11
    iput p3, p0, Lokio/Segment;->limit:I

    .line 12
    .line 13
    iput-boolean p4, p0, Lokio/Segment;->shared:Z

    .line 14
    .line 15
    iput-boolean p5, p0, Lokio/Segment;->owner:Z

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final compact()V
    .locals 3

    .line 1
    iget-object v0, p0, Lokio/Segment;->prev:Lokio/Segment;

    .line 2
    .line 3
    if-eq v0, p0, :cond_8

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-boolean v0, v0, Lokio/Segment;->owner:Z

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    iget v0, p0, Lokio/Segment;->limit:I

    .line 16
    .line 17
    iget v1, p0, Lokio/Segment;->pos:I

    .line 18
    .line 19
    sub-int/2addr v0, v1

    .line 20
    iget-object v1, p0, Lokio/Segment;->prev:Lokio/Segment;

    .line 21
    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget v1, v1, Lokio/Segment;->limit:I

    .line 28
    .line 29
    rsub-int v1, v1, 0x2000

    .line 30
    .line 31
    iget-object v2, p0, Lokio/Segment;->prev:Lokio/Segment;

    .line 32
    .line 33
    if-nez v2, :cond_3

    .line 34
    .line 35
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 36
    .line 37
    .line 38
    :cond_3
    iget-boolean v2, v2, Lokio/Segment;->shared:Z

    .line 39
    .line 40
    if-eqz v2, :cond_4

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    goto :goto_0

    .line 44
    :cond_4
    iget-object v2, p0, Lokio/Segment;->prev:Lokio/Segment;

    .line 45
    .line 46
    if-nez v2, :cond_5

    .line 47
    .line 48
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 49
    .line 50
    .line 51
    :cond_5
    iget v2, v2, Lokio/Segment;->pos:I

    .line 52
    .line 53
    :goto_0
    add-int/2addr v1, v2

    .line 54
    if-le v0, v1, :cond_6

    .line 55
    .line 56
    :goto_1
    return-void

    .line 57
    :cond_6
    iget-object v1, p0, Lokio/Segment;->prev:Lokio/Segment;

    .line 58
    .line 59
    if-nez v1, :cond_7

    .line 60
    .line 61
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 62
    .line 63
    .line 64
    :cond_7
    invoke-virtual {p0, v1, v0}, Lokio/Segment;->writeTo(Lokio/Segment;I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 68
    .line 69
    .line 70
    invoke-static {p0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_8
    const-string p0, "cannot compact"

    .line 75
    .line 76
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final pop()Lokio/Segment;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq v0, p0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move-object v0, v1

    .line 8
    :goto_0
    iget-object v2, p0, Lokio/Segment;->prev:Lokio/Segment;

    .line 9
    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object v3, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 16
    .line 17
    iput-object v3, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 18
    .line 19
    iget-object v2, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 20
    .line 21
    if-nez v2, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 24
    .line 25
    .line 26
    :cond_2
    iget-object v3, p0, Lokio/Segment;->prev:Lokio/Segment;

    .line 27
    .line 28
    iput-object v3, v2, Lokio/Segment;->prev:Lokio/Segment;

    .line 29
    .line 30
    iput-object v1, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 31
    .line 32
    iput-object v1, p0, Lokio/Segment;->prev:Lokio/Segment;

    .line 33
    .line 34
    return-object v0
.end method

.method public final push(Lokio/Segment;)Lokio/Segment;
    .locals 1
    .param p1    # Lokio/Segment;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p0, p1, Lokio/Segment;->prev:Lokio/Segment;

    .line 5
    .line 6
    iget-object v0, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 7
    .line 8
    iput-object v0, p1, Lokio/Segment;->next:Lokio/Segment;

    .line 9
    .line 10
    iget-object v0, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iput-object p1, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 18
    .line 19
    iput-object p1, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 20
    .line 21
    return-object p1
.end method

.method public final sharedCopy()Lokio/Segment;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lokio/Segment;->shared:Z

    .line 3
    .line 4
    new-instance v1, Lokio/Segment;

    .line 5
    .line 6
    iget-object v2, p0, Lokio/Segment;->data:[B

    .line 7
    .line 8
    iget v3, p0, Lokio/Segment;->pos:I

    .line 9
    .line 10
    iget v4, p0, Lokio/Segment;->limit:I

    .line 11
    .line 12
    const/4 v5, 0x1

    .line 13
    const/4 v6, 0x0

    .line 14
    invoke-direct/range {v1 .. v6}, Lokio/Segment;-><init>([BIIZZ)V

    .line 15
    .line 16
    .line 17
    return-object v1
.end method

.method public final split(I)Lokio/Segment;
    .locals 5
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-lez p1, :cond_2

    .line 2
    .line 3
    iget v0, p0, Lokio/Segment;->limit:I

    .line 4
    .line 5
    iget v1, p0, Lokio/Segment;->pos:I

    .line 6
    .line 7
    sub-int/2addr v0, v1

    .line 8
    if-gt p1, v0, :cond_2

    .line 9
    .line 10
    const/16 v0, 0x400

    .line 11
    .line 12
    if-lt p1, v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lokio/Segment;->sharedCopy()Lokio/Segment;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {}, Lokio/SegmentPool;->take()Lokio/Segment;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lokio/Segment;->data:[B

    .line 24
    .line 25
    iget v2, p0, Lokio/Segment;->pos:I

    .line 26
    .line 27
    iget-object v3, v0, Lokio/Segment;->data:[B

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    invoke-static {v1, v2, v3, v4, p1}, Lokio/-Platform;->arraycopy([BI[BII)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget v1, v0, Lokio/Segment;->pos:I

    .line 34
    .line 35
    add-int/2addr v1, p1

    .line 36
    iput v1, v0, Lokio/Segment;->limit:I

    .line 37
    .line 38
    iget v1, p0, Lokio/Segment;->pos:I

    .line 39
    .line 40
    add-int/2addr v1, p1

    .line 41
    iput v1, p0, Lokio/Segment;->pos:I

    .line 42
    .line 43
    iget-object p0, p0, Lokio/Segment;->prev:Lokio/Segment;

    .line 44
    .line 45
    if-nez p0, :cond_1

    .line 46
    .line 47
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 48
    .line 49
    .line 50
    :cond_1
    invoke-virtual {p0, v0}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    .line 51
    .line 52
    .line 53
    return-object v0

    .line 54
    :cond_2
    const-string p0, "byteCount out of range"

    .line 55
    .line 56
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    return-object p0
.end method

.method public final unsharedCopy()Lokio/Segment;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lokio/Segment;

    .line 2
    .line 3
    iget-object v1, p0, Lokio/Segment;->data:[B

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget v2, p0, Lokio/Segment;->pos:I

    .line 11
    .line 12
    iget v3, p0, Lokio/Segment;->limit:I

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    const/4 v5, 0x1

    .line 16
    invoke-direct/range {v0 .. v5}, Lokio/Segment;-><init>([BIIZZ)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public final writeTo(Lokio/Segment;I)V
    .locals 4
    .param p1    # Lokio/Segment;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p1, Lokio/Segment;->owner:Z

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget v0, p1, Lokio/Segment;->limit:I

    .line 9
    .line 10
    add-int v1, v0, p2

    .line 11
    .line 12
    const/16 v2, 0x2000

    .line 13
    .line 14
    if-le v1, v2, :cond_2

    .line 15
    .line 16
    iget-boolean v1, p1, Lokio/Segment;->shared:Z

    .line 17
    .line 18
    if-nez v1, :cond_1

    .line 19
    .line 20
    add-int v1, v0, p2

    .line 21
    .line 22
    iget v3, p1, Lokio/Segment;->pos:I

    .line 23
    .line 24
    sub-int/2addr v1, v3

    .line 25
    if-gt v1, v2, :cond_0

    .line 26
    .line 27
    iget-object v1, p1, Lokio/Segment;->data:[B

    .line 28
    .line 29
    sub-int/2addr v0, v3

    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-static {v1, v3, v1, v2, v0}, Lokio/-Platform;->arraycopy([BI[BII)V

    .line 32
    .line 33
    .line 34
    iget v0, p1, Lokio/Segment;->limit:I

    .line 35
    .line 36
    iget v1, p1, Lokio/Segment;->pos:I

    .line 37
    .line 38
    sub-int/2addr v0, v1

    .line 39
    iput v0, p1, Lokio/Segment;->limit:I

    .line 40
    .line 41
    iput v2, p1, Lokio/Segment;->pos:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    :goto_0
    iget-object v0, p0, Lokio/Segment;->data:[B

    .line 53
    .line 54
    iget v1, p0, Lokio/Segment;->pos:I

    .line 55
    .line 56
    iget-object v2, p1, Lokio/Segment;->data:[B

    .line 57
    .line 58
    iget v3, p1, Lokio/Segment;->limit:I

    .line 59
    .line 60
    invoke-static {v0, v1, v2, v3, p2}, Lokio/-Platform;->arraycopy([BI[BII)V

    .line 61
    .line 62
    .line 63
    iget v0, p1, Lokio/Segment;->limit:I

    .line 64
    .line 65
    add-int/2addr v0, p2

    .line 66
    iput v0, p1, Lokio/Segment;->limit:I

    .line 67
    .line 68
    iget p1, p0, Lokio/Segment;->pos:I

    .line 69
    .line 70
    add-int/2addr p1, p2

    .line 71
    iput p1, p0, Lokio/Segment;->pos:I

    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    const-string p0, "only owner can write"

    .line 75
    .line 76
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
