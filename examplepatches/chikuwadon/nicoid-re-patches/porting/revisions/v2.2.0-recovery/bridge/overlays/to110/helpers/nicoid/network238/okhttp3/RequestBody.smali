.class public abstract Lnicoid/network238/okhttp3/RequestBody;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/RequestBody$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008&\u0018\u0000 \u00112\u00020\u0001:\u0001\u0011B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\n\u0010\u0004\u001a\u0004\u0018\u00010\u0005H&J\u0008\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH&J\u0008\u0010\u000c\u001a\u00020\rH\u0016J\u0008\u0010\u000e\u001a\u00020\rH\u0016J\u0006\u0010\u000f\u001a\u00020\u0010\u00a8\u0006\u0012"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/RequestBody;",
        "",
        "<init>",
        "()V",
        "contentType",
        "Lnicoid/network238/okhttp3/MediaType;",
        "contentLength",
        "",
        "writeTo",
        "",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "isDuplex",
        "",
        "isOneShot",
        "sha256",
        "Lnicoid/network238/okio/ByteString;",
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
.field public static final Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

.field public static final EMPTY:Lnicoid/network238/okhttp3/RequestBody;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lnicoid/network238/okhttp3/RequestBody$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/RequestBody$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    .line 116
    sget-object v2, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    const/4 v3, 0x1

    invoke-static {v0, v2, v1, v3, v1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;ILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/RequestBody;->EMPTY:Lnicoid/network238/okhttp3/RequestBody;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final create(Ljava/io/File;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Ljava/io/File;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Ljava/io/FileDescriptor;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Ljava/io/FileDescriptor;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okhttp3/MediaType;Ljava/io/File;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okhttp3/MediaType;Ljava/io/File;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okhttp3/MediaType;Ljava/lang/String;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okhttp3/MediaType;Ljava/lang/String;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okhttp3/MediaType;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okhttp3/MediaType;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okhttp3/MediaType;[B)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okhttp3/MediaType;[B)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okhttp3/MediaType;[BI)Lnicoid/network238/okhttp3/RequestBody;
    .registers 4

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okhttp3/MediaType;[BI)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okhttp3/MediaType;[BII)Lnicoid/network238/okhttp3/RequestBody;
    .registers 5

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okhttp3/MediaType;[BII)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 4

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create([B)Lnicoid/network238/okhttp3/RequestBody;
    .registers 2

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create([B)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create([BLnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create([BLnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create([BLnicoid/network238/okhttp3/MediaType;I)Lnicoid/network238/okhttp3/RequestBody;
    .registers 4

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create([BLnicoid/network238/okhttp3/MediaType;I)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create([BLnicoid/network238/okhttp3/MediaType;II)Lnicoid/network238/okhttp3/RequestBody;
    .registers 5

    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create([BLnicoid/network238/okhttp3/MediaType;II)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public contentLength()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public abstract contentType()Lnicoid/network238/okhttp3/MediaType;
.end method

.method public isDuplex()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public isOneShot()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public final sha256()Lnicoid/network238/okio/ByteString;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 106
    sget-object v0, Lnicoid/network238/okio/HashingSink;->Companion:Lnicoid/network238/okio/HashingSink$Companion;

    invoke-static {}, Lnicoid/network238/okio/Okio;->blackhole()Lnicoid/network238/okio/Sink;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/HashingSink$Companion;->sha256(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/HashingSink;

    move-result-object v0

    .line 107
    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    .line 108
    :try_start_0
    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/RequestBody;->writeTo(Lnicoid/network238/okio/BufferedSink;)V

    .line 109
    sget-object v2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 110
    invoke-virtual {v0}, Lnicoid/network238/okio/HashingSink;->hash()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0

    :catchall_0
    move-exception v0

    .line 107
    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v2

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public abstract writeTo(Lnicoid/network238/okio/BufferedSink;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
