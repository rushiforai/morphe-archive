.class public final Lnicoid/network238/okhttp3/internal/ech/EchRejectedException;
.super Ljavax/net/ssl/SSLException;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0007\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ech/EchRejectedException;",
        "Ljavax/net/ssl/SSLException;",
        "publicName",
        "",
        "nextEchConfigList",
        "Lnicoid/network238/okio/ByteString;",
        "<init>",
        "(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)V",
        "getPublicName",
        "()Ljava/lang/String;",
        "getNextEchConfigList",
        "()Lnicoid/network238/okio/ByteString;",
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
.field private final nextEchConfigList:Lnicoid/network238/okio/ByteString;

.field private final publicName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    const-string v0, "Encrypted Client Hello (ECH) rejected"

    invoke-direct {p0, v0}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    .line 32
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ech/EchRejectedException;->publicName:Ljava/lang/String;

    .line 33
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ech/EchRejectedException;->nextEchConfigList:Lnicoid/network238/okio/ByteString;

    return-void
.end method


# virtual methods
.method public final getNextEchConfigList()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 33
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ech/EchRejectedException;->nextEchConfigList:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method

.method public final getPublicName()Ljava/lang/String;
    .registers 2

    .line 32
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ech/EchRejectedException;->publicName:Ljava/lang/String;

    return-object v0
.end method
