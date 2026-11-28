.class public interface abstract Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/CompressionInterceptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "DecompressionAlgorithm"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008f\u0018\u00002\u00020\u0001J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH&R\u0012\u0010\u0002\u001a\u00020\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\n\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;",
        "",
        "encoding",
        "",
        "getEncoding",
        "()Ljava/lang/String;",
        "decompress",
        "Lnicoid/network238/okio/Source;",
        "compressedSource",
        "Lnicoid/network238/okio/BufferedSource;",
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


# virtual methods
.method public abstract decompress(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okio/Source;
.end method

.method public abstract getEncoding()Ljava/lang/String;
.end method
