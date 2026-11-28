.class public final Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$queryServiceMetadata$dnsResolverCallback$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/net/DnsResolver$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->queryServiceMetadata(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/net/DnsResolver$Callback<",
        "[B>;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001J\u0018\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\u0008\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "nicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$queryServiceMetadata$dnsResolverCallback$1",
        "Landroid/net/DnsResolver$Callback;",
        "",
        "onAnswer",
        "",
        "answer",
        "rcode",
        "",
        "onError",
        "e",
        "Landroid/net/DnsResolver$DnsException;",
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
.field final synthetic $callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$queryServiceMetadata$dnsResolverCallback$1;->$callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onAnswer(Ljava/lang/Object;I)V
    .registers 3

    .line 208
    check-cast p1, [B

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$queryServiceMetadata$dnsResolverCallback$1;->onAnswer([BI)V

    return-void
.end method

.method public onAnswer([BI)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 215
    :try_start_0
    new-instance p2, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;

    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->write([B)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    invoke-direct {p2, p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;-><init>(Lnicoid/network238/okio/BufferedSource;)V

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->read()Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    iget-object p2, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$queryServiceMetadata$dnsResolverCallback$1;->$callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

    invoke-interface {p2, p1}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;->onResponse(Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V

    return-void

    :catch_0
    move-exception p1

    .line 217
    iget-object p2, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$queryServiceMetadata$dnsResolverCallback$1;->$callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

    invoke-interface {p2, p1}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;->onFailure(Ljava/io/IOException;)V

    return-void
.end method

.method public onError(Landroid/net/DnsResolver$DnsException;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 224
    iget-object v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$queryServiceMetadata$dnsResolverCallback$1;->$callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "HTTPS query failed with code "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p1, Landroid/net/DnsResolver$DnsException;->code:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {v0, v1}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;->onFailure(Ljava/io/IOException;)V

    return-void
.end method
