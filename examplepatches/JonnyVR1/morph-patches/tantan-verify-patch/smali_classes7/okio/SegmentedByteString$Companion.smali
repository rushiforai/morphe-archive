.class public final Lokio/SegmentedByteString$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokio/SegmentedByteString;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lokio/SegmentedByteString$Companion;",
        "",
        "()V",
        "of",
        "Lokio/ByteString;",
        "buffer",
        "Lokio/Buffer;",
        "byteCount",
        "",
        "jvm"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xb
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lokio/SegmentedByteString$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final of(Lokio/Buffer;I)Lokio/ByteString;
    .locals 7
    .param p1    # Lokio/Buffer;
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
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    int-to-long v4, p2

    .line 11
    invoke-static/range {v0 .. v5}, Lokio/-Util;->checkOffsetAndCount(JJJ)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    move v1, v0

    .line 18
    move v2, v1

    .line 19
    :goto_0
    const/4 v3, 0x0

    .line 20
    if-ge v1, p2, :cond_2

    .line 21
    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget v4, p0, Lokio/Segment;->limit:I

    .line 28
    .line 29
    iget v5, p0, Lokio/Segment;->pos:I

    .line 30
    .line 31
    if-eq v4, v5, :cond_1

    .line 32
    .line 33
    sub-int/2addr v4, v5

    .line 34
    add-int/2addr v1, v4

    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    iget-object p0, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const-string p0, "s.limit == s.pos"

    .line 41
    .line 42
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-object v3

    .line 46
    :cond_2
    new-array p0, v2, [[B

    .line 47
    .line 48
    mul-int/lit8 v1, v2, 0x2

    .line 49
    .line 50
    new-array v1, v1, [I

    .line 51
    .line 52
    iget-object p1, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 53
    .line 54
    move v4, v0

    .line 55
    :goto_1
    if-ge v0, p2, :cond_4

    .line 56
    .line 57
    if-nez p1, :cond_3

    .line 58
    .line 59
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 60
    .line 61
    .line 62
    :cond_3
    iget-object v5, p1, Lokio/Segment;->data:[B

    .line 63
    .line 64
    aput-object v5, p0, v4

    .line 65
    .line 66
    iget v5, p1, Lokio/Segment;->limit:I

    .line 67
    .line 68
    iget v6, p1, Lokio/Segment;->pos:I

    .line 69
    .line 70
    sub-int/2addr v5, v6

    .line 71
    add-int/2addr v0, v5

    .line 72
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    aput v5, v1, v4

    .line 77
    .line 78
    add-int v5, v4, v2

    .line 79
    .line 80
    iget v6, p1, Lokio/Segment;->pos:I

    .line 81
    .line 82
    aput v6, v1, v5

    .line 83
    .line 84
    const/4 v5, 0x1

    .line 85
    iput-boolean v5, p1, Lokio/Segment;->shared:Z

    .line 86
    .line 87
    add-int/2addr v4, v5

    .line 88
    iget-object p1, p1, Lokio/Segment;->next:Lokio/Segment;

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_4
    new-instance p1, Lokio/SegmentedByteString;

    .line 92
    .line 93
    invoke-direct {p1, p0, v1, v3}, Lokio/SegmentedByteString;-><init>([[B[ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 94
    .line 95
    .line 96
    return-object p1
.end method
