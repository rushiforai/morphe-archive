.class public final Lnicoid/network238/okhttp3/internal/http2/Settings;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/Settings$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0015\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u000b\u0018\u0000 \u001c2\u00020\u0001:\u0001\u001cB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0006\u0010\r\u001a\u00020\u000eJ\u0019\u0010\u0004\u001a\u00020\u00002\u0006\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0010\u001a\u00020\u0005H\u0086\u0002J\u000e\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u000f\u001a\u00020\u0005J\u0011\u0010\u0013\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u0005H\u0086\u0002J\u0006\u0010\u0014\u001a\u00020\u0005J\u000e\u0010\u0015\u001a\u00020\u00122\u0006\u0010\u0016\u001a\u00020\u0012J\u0006\u0010\u0017\u001a\u00020\u0005J\u000e\u0010\u0018\u001a\u00020\u00052\u0006\u0010\u0016\u001a\u00020\u0005J\u000e\u0010\u0019\u001a\u00020\u00052\u0006\u0010\u0016\u001a\u00020\u0005J\u000e\u0010\u001a\u001a\u00020\u000e2\u0006\u0010\u001b\u001a\u00020\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0008\u001a\u00020\u00058F\u00a2\u0006\u0006\u001a\u0004\u0008\t\u0010\nR\u0011\u0010\u000b\u001a\u00020\u00058F\u00a2\u0006\u0006\u001a\u0004\u0008\u000c\u0010\n\u00a8\u0006\u001d"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Settings;",
        "",
        "<init>",
        "()V",
        "set",
        "",
        "values",
        "",
        "headerTableSize",
        "getHeaderTableSize",
        "()I",
        "initialWindowSize",
        "getInitialWindowSize",
        "clear",
        "",
        "id",
        "value",
        "isSet",
        "",
        "get",
        "size",
        "getEnablePush",
        "defaultValue",
        "getMaxConcurrentStreams",
        "getMaxFrameSize",
        "getMaxHeaderListSize",
        "merge",
        "other",
        "Companion",
        "okhttp"
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
.field public static final COUNT:I = 0xa

.field public static final Companion:Lnicoid/network238/okhttp3/internal/http2/Settings$Companion;

.field public static final DEFAULT_INITIAL_WINDOW_SIZE:I = 0xffff

.field public static final ENABLE_PUSH:I = 0x2

.field public static final HEADER_TABLE_SIZE:I = 0x1

.field public static final INITIAL_WINDOW_SIZE:I = 0x4

.field public static final MAX_CONCURRENT_STREAMS:I = 0x3

.field public static final MAX_FRAME_SIZE:I = 0x5

.field public static final MAX_HEADER_LIST_SIZE:I = 0x6


# instance fields
.field private set:I

.field private final values:[I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Settings$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Settings$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Settings;->Companion:Lnicoid/network238/okhttp3/internal/http2/Settings$Companion;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/16 v0, 0xa

    new-array v0, v0, [I

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->values:[I

    return-void
.end method


# virtual methods
.method public final clear()V
    .registers 8

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->set:I

    .line 44
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->values:[I

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/kotlin/collections/ArraysKt;->fill$default([IIIIILjava/lang/Object;)V

    return-void
.end method

.method public final get(I)I
    .registers 3

    .line 68
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->values:[I

    aget p1, v0, p1

    return p1
.end method

.method public final getEnablePush(Z)Z
    .registers 3

    .line 76
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->set:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_1

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->values:[I

    const/4 v0, 0x2

    aget p1, p1, v0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x0

    :cond_1
    return p1
.end method

.method public final getHeaderTableSize()I
    .registers 3

    .line 33
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->set:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->values:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public final getInitialWindowSize()I
    .registers 3

    .line 39
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->set:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->values:[I

    const/4 v1, 0x4

    aget v0, v0, v1

    return v0

    :cond_0
    const v0, 0xffff

    return v0
.end method

.method public final getMaxConcurrentStreams()I
    .registers 3

    .line 81
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->set:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->values:[I

    const/4 v1, 0x3

    aget v0, v0, v1

    return v0

    :cond_0
    const v0, 0x7fffffff

    return v0
.end method

.method public final getMaxFrameSize(I)I
    .registers 3

    .line 86
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->set:I

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_0

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->values:[I

    const/4 v0, 0x5

    aget p1, p1, v0

    :cond_0
    return p1
.end method

.method public final getMaxHeaderListSize(I)I
    .registers 3

    .line 91
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->set:I

    and-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_0

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->values:[I

    const/4 v0, 0x6

    aget p1, p1, v0

    :cond_0
    return p1
.end method

.method public final isSet(I)Z
    .registers 4

    const/4 v0, 0x1

    shl-int p1, v0, p1

    .line 64
    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->set:I

    and-int/2addr v1, p1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final merge(Lnicoid/network238/okhttp3/internal/http2/Settings;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xa

    if-ge v0, v1, :cond_1

    .line 100
    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/internal/http2/Settings;->isSet(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 101
    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/internal/http2/Settings;->get(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Settings;->set(II)Lnicoid/network238/okhttp3/internal/http2/Settings;

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final set(II)Lnicoid/network238/okhttp3/internal/http2/Settings;
    .registers 6

    if-ltz p1, :cond_0

    .line 51
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->values:[I

    array-length v1, v0

    if-ge p1, v1, :cond_0

    const/4 v1, 0x1

    shl-int/2addr v1, p1

    .line 56
    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->set:I

    or-int/2addr v2, v1

    iput v2, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->set:I

    .line 57
    aput p2, v0, p1

    :cond_0
    return-object p0
.end method

.method public final size()I
    .registers 2

    .line 71
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Settings;->set:I

    invoke-static {v0}, Ljava/lang/Integer;->bitCount(I)I

    move-result v0

    return v0
.end method
