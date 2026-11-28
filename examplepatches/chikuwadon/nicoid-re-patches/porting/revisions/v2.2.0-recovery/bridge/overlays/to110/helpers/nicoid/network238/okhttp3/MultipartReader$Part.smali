.class public final Lnicoid/network238/okhttp3/MultipartReader$Part;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/MultipartReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Part"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\t\u0010\n\u001a\u00020\u000bH\u0096\u0001R\u0013\u0010\u0002\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0008R\u0013\u0010\u0004\u001a\u00020\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\t\u00a8\u0006\u000c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/MultipartReader$Part;",
        "Ljava/io/Closeable;",
        "headers",
        "Lnicoid/network238/okhttp3/Headers;",
        "body",
        "Lnicoid/network238/okio/BufferedSource;",
        "<init>",
        "(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okio/BufferedSource;)V",
        "()Lnicoid/network238/okhttp3/Headers;",
        "()Lnicoid/network238/okio/BufferedSource;",
        "close",
        "",
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


# instance fields
.field private final body:Lnicoid/network238/okio/BufferedSource;

.field private final headers:Lnicoid/network238/okhttp3/Headers;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okio/BufferedSource;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartReader$Part;->headers:Lnicoid/network238/okhttp3/Headers;

    .line 218
    iput-object p2, p0, Lnicoid/network238/okhttp3/MultipartReader$Part;->body:Lnicoid/network238/okio/BufferedSource;

    return-void
.end method


# virtual methods
.method public final body()Lnicoid/network238/okio/BufferedSource;
    .registers 2

    .line 218
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader$Part;->body:Lnicoid/network238/okio/BufferedSource;

    return-object v0
.end method

.method public close()V
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader$Part;->body:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->close()V

    return-void
.end method

.method public final headers()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 217
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader$Part;->headers:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method
