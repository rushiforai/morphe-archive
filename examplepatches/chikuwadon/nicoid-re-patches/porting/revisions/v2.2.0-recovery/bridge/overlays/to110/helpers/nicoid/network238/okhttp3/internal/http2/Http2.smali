.class public final Lnicoid/network238/okhttp3/internal/http2/Http2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0013\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\t\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J.\u0010 \u001a\u00020\u001c2\u0006\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020\u00072\u0006\u0010$\u001a\u00020\u00072\u0006\u0010%\u001a\u00020\u00072\u0006\u0010&\u001a\u00020\u0007J&\u0010\'\u001a\u00020\u001c2\u0006\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020\u00072\u0006\u0010$\u001a\u00020\u00072\u0006\u0010(\u001a\u00020)J\u0015\u0010*\u001a\u00020\u001c2\u0006\u0010%\u001a\u00020\u0007H\u0000\u00a2\u0006\u0002\u0008+J\u0016\u0010,\u001a\u00020\u001c2\u0006\u0010%\u001a\u00020\u00072\u0006\u0010&\u001a\u00020\u0007R\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001bX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u001dR\u0018\u0010\u001e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u001c0\u001bX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u001dR\u0016\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001bX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u001d\u00a8\u0006-"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2;",
        "",
        "<init>",
        "()V",
        "CONNECTION_PREFACE",
        "Lnicoid/network238/okio/ByteString;",
        "INITIAL_MAX_FRAME_SIZE",
        "",
        "TYPE_DATA",
        "TYPE_HEADERS",
        "TYPE_PRIORITY",
        "TYPE_RST_STREAM",
        "TYPE_SETTINGS",
        "TYPE_PUSH_PROMISE",
        "TYPE_PING",
        "TYPE_GOAWAY",
        "TYPE_WINDOW_UPDATE",
        "TYPE_CONTINUATION",
        "FLAG_NONE",
        "FLAG_ACK",
        "FLAG_END_STREAM",
        "FLAG_END_HEADERS",
        "FLAG_END_PUSH_PROMISE",
        "FLAG_PADDED",
        "FLAG_PRIORITY",
        "FLAG_COMPRESSED",
        "FRAME_NAMES",
        "",
        "",
        "[Ljava/lang/String;",
        "FLAGS",
        "BINARY",
        "frameLog",
        "inbound",
        "",
        "streamId",
        "length",
        "type",
        "flags",
        "frameLogWindowUpdate",
        "windowSizeIncrement",
        "",
        "formattedType",
        "formattedType$okhttp",
        "formatFlags",
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
.field private static final BINARY:[Ljava/lang/String;

.field public static final CONNECTION_PREFACE:Lnicoid/network238/okio/ByteString;

.field private static final FLAGS:[Ljava/lang/String;

.field public static final FLAG_ACK:I = 0x1

.field public static final FLAG_COMPRESSED:I = 0x20

.field public static final FLAG_END_HEADERS:I = 0x4

.field public static final FLAG_END_PUSH_PROMISE:I = 0x4

.field public static final FLAG_END_STREAM:I = 0x1

.field public static final FLAG_NONE:I = 0x0

.field public static final FLAG_PADDED:I = 0x8

.field public static final FLAG_PRIORITY:I = 0x20

.field private static final FRAME_NAMES:[Ljava/lang/String;

.field public static final INITIAL_MAX_FRAME_SIZE:I = 0x4000

.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Http2;

.field public static final TYPE_CONTINUATION:I = 0x9

.field public static final TYPE_DATA:I = 0x0

.field public static final TYPE_GOAWAY:I = 0x7

.field public static final TYPE_HEADERS:I = 0x1

.field public static final TYPE_PING:I = 0x6

.field public static final TYPE_PRIORITY:I = 0x2

.field public static final TYPE_PUSH_PROMISE:I = 0x5

.field public static final TYPE_RST_STREAM:I = 0x3

.field public static final TYPE_SETTINGS:I = 0x4

.field public static final TYPE_WINDOW_UPDATE:I = 0x8


# direct methods
.method static constructor <clinit>()V
    .registers 13

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Http2;

    .line 23
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const-string v1, "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n"

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->CONNECTION_PREFACE:Lnicoid/network238/okio/ByteString;

    .line 60
    const-string v9, "WINDOW_UPDATE"

    const-string v10, "CONTINUATION"

    const-string v1, "DATA"

    const-string v2, "HEADERS"

    const-string v3, "PRIORITY"

    const-string v4, "RST_STREAM"

    const-string v5, "SETTINGS"

    const-string v6, "PUSH_PROMISE"

    const-string v7, "PING"

    const-string v8, "GOAWAY"

    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    move-result-object v0

    .line 50
    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->FRAME_NAMES:[Ljava/lang/String;

    .line 67
    const/16 v0, 0x40

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->FLAGS:[Ljava/lang/String;

    .line 69
    const/16 v0, 0x100

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_0

    .line 70
    invoke-static {v3}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, "%8s"

    invoke-static {v5, v4}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const/4 v10, 0x4

    const/4 v11, 0x0

    const/16 v7, 0x20

    const/16 v8, 0x30

    const/4 v9, 0x0

    invoke-static/range {v6 .. v11}, Lnicoid/network238/kotlin/text/StringsKt;->replace$default(Ljava/lang/String;CCZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 69
    :cond_0
    sput-object v1, Lnicoid/network238/okhttp3/internal/http2/Http2;->BINARY:[Ljava/lang/String;

    .line 74
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->FLAGS:[Ljava/lang/String;

    const-string v1, ""

    aput-object v1, v0, v2

    .line 75
    const-string v1, "END_STREAM"

    const/4 v3, 0x1

    aput-object v1, v0, v3

    .line 77
    filled-new-array {v3}, [I

    move-result-object v1

    .line 79
    const-string v3, "PADDED"

    const/16 v4, 0x8

    aput-object v3, v0, v4

    .line 80
    aget v3, v1, v2

    or-int/lit8 v5, v3, 0x8

    .line 81
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v3, v0, v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "|PADDED"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v5

    .line 84
    const-string v3, "END_HEADERS"

    const/4 v5, 0x4

    aput-object v3, v0, v5

    .line 85
    const-string v3, "PRIORITY"

    const/16 v7, 0x20

    aput-object v3, v0, v7

    .line 86
    const-string v3, "END_HEADERS|PRIORITY"

    const/16 v8, 0x24

    aput-object v3, v0, v8

    .line 87
    filled-new-array {v5, v7, v8}, [I

    move-result-object v0

    move v3, v2

    .line 97
    :goto_1
    sget-object v5, Lnicoid/network238/okhttp3/internal/http2/Http2;->FLAGS:[Ljava/lang/String;

    const/4 v7, 0x3

    if-ge v3, v7, :cond_1

    .line 89
    aget v7, v0, v3

    .line 90
    aget v8, v1, v2

    or-int v9, v8, v7

    .line 91
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v11, v5, v8

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/16 v11, 0x7c

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    aget-object v12, v5, v7

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v5, v9

    or-int/2addr v9, v4

    .line 93
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v8, v5, v8

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v7, v5, v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v9

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    nop

    .line 97
    array-length v0, v5

    :goto_2
    if-ge v2, v0, :cond_3

    .line 98
    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/Http2;->FLAGS:[Ljava/lang/String;

    aget-object v3, v1, v2

    if-nez v3, :cond_2

    sget-object v3, Lnicoid/network238/okhttp3/internal/http2/Http2;->BINARY:[Ljava/lang/String;

    aget-object v3, v3, v2

    aput-object v3, v1, v2

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_3
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final formatFlags(II)Ljava/lang/String;
    .registers 10

    if-nez p2, :cond_0

    .line 170
    const-string p1, ""

    return-object p1

    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 177
    :pswitch_0
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->FLAGS:[Ljava/lang/String;

    array-length v1, v0

    if-ge p2, v1, :cond_2

    aget-object v0, v0, p2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_0

    .line 185
    :pswitch_1
    const/4 p1, 0x1

    if-ne p2, p1, :cond_1

    .line 173
    const-string p1, "ACK"

    return-object p1

    :cond_1
    sget-object p1, Lnicoid/network238/okhttp3/internal/http2/Http2;->BINARY:[Ljava/lang/String;

    aget-object p1, p1, p2

    return-object p1

    .line 175
    :pswitch_2
    sget-object p1, Lnicoid/network238/okhttp3/internal/http2/Http2;->BINARY:[Ljava/lang/String;

    aget-object p1, p1, p2

    return-object p1

    .line 177
    :cond_2
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->BINARY:[Ljava/lang/String;

    aget-object v0, v0, p2

    :goto_0
    move-object v1, v0

    const/4 v0, 0x5

    if-ne p1, v0, :cond_3

    and-int/lit8 v0, p2, 0x4

    if-eqz v0, :cond_3

    .line 181
    const/4 v5, 0x4

    const/4 v6, 0x0

    const-string v2, "HEADERS"

    const-string v3, "PUSH_PROMISE"

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/kotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_3
    if-nez p1, :cond_4

    and-int/lit8 p2, p2, 0x20

    if-eqz p2, :cond_4

    .line 185
    const/4 v5, 0x4

    const/4 v6, 0x0

    const-string v2, "PRIORITY"

    const-string v3, "COMPRESSED"

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/kotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_4
    return-object v1

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public final formattedType$okhttp(I)Ljava/lang/String;
    .registers 4

    .line 160
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->FRAME_NAMES:[Ljava/lang/String;

    array-length v1, v0

    if-ge p1, v1, :cond_0

    aget-object p1, v0, p1

    return-object p1

    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "0x%02x"

    invoke-static {v0, p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final frameLog(ZIIII)Ljava/lang/String;
    .registers 7

    .line 125
    invoke-virtual {p0, p4}, Lnicoid/network238/okhttp3/internal/http2/Http2;->formattedType$okhttp(I)Ljava/lang/String;

    move-result-object v0

    .line 126
    invoke-virtual {p0, p4, p5}, Lnicoid/network238/okhttp3/internal/http2/Http2;->formatFlags(II)Ljava/lang/String;

    move-result-object p4

    if-eqz p1, :cond_0

    .line 127
    const-string p1, "<<"

    goto :goto_0

    :cond_0
    const-string p1, ">>"

    .line 131
    :goto_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 132
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    .line 134
    filled-new-array {p1, p2, p3, v0, p4}, [Ljava/lang/Object;

    move-result-object p1

    .line 128
    const-string p2, "%s 0x%08x %5d %-13s %s"

    invoke-static {p2, p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final frameLogWindowUpdate(ZIIJ)Ljava/lang/String;
    .registers 7

    .line 148
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2;->formattedType$okhttp(I)Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_0

    .line 149
    const-string p1, "<<"

    goto :goto_0

    :cond_0
    const-string p1, ">>"

    .line 153
    :goto_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 154
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    .line 156
    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    filled-new-array {p1, p2, p3, v0, p4}, [Ljava/lang/Object;

    move-result-object p1

    .line 150
    const-string p2, "%s 0x%08x %5d %-13s %d"

    invoke-static {p2, p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
