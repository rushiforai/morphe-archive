.class public final Lnicoid/network238/okhttp3/Gzip;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0016R\u0014\u0010\u0004\u001a\u00020\u00058VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u000c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Gzip;",
        "Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;",
        "<init>",
        "()V",
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


# static fields
.field public static final INSTANCE:Lnicoid/network238/okhttp3/Gzip;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/Gzip;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Gzip;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/Gzip;->INSTANCE:Lnicoid/network238/okhttp3/Gzip;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decompress(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okio/Source;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    new-instance v0, Lnicoid/network238/okio/GzipSource;

    invoke-direct {v0, p1}, Lnicoid/network238/okio/GzipSource;-><init>(Lnicoid/network238/okio/Source;)V

    return-object v0
.end method

.method public getEncoding()Ljava/lang/String;
    .registers 2

    .line 24
    const-string v0, "gzip"

    return-object v0
.end method
