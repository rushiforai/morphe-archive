.class final Lnicoid/network238/okhttp3/Cache$Entry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Entry"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/Cache$Entry$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0086\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0002\u0018\u0000 .2\u00020\u0001:\u0001.B\u0011\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B\u0011\u0008\u0016\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0008J\u0012\u0010\u001a\u001a\u00020\u001b2\n\u0010\u001c\u001a\u00060\u001dR\u00020\u001eJ\u0016\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020!0 2\u0006\u0010\"\u001a\u00020#H\u0002J\u001e\u0010$\u001a\u00020\u001b2\u0006\u0010%\u001a\u00020&2\u000c\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020!0 H\u0002J\u0016\u0010(\u001a\u00020)2\u0006\u0010*\u001a\u00020+2\u0006\u0010\u0006\u001a\u00020\u0007J\u0012\u0010\u0006\u001a\u00020\u00072\n\u0010,\u001a\u00060-R\u00020\u001eR\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0016X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0018X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006/"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Cache$Entry;",
        "",
        "rawSource",
        "Lnicoid/network238/okio/Source;",
        "<init>",
        "(Lnicoid/network238/okio/Source;)V",
        "response",
        "Lnicoid/network238/okhttp3/Response;",
        "(Lnicoid/network238/okhttp3/Response;)V",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "varyHeaders",
        "Lnicoid/network238/okhttp3/Headers;",
        "requestMethod",
        "",
        "protocol",
        "Lnicoid/network238/okhttp3/Protocol;",
        "code",
        "",
        "message",
        "responseHeaders",
        "handshake",
        "Lnicoid/network238/okhttp3/Handshake;",
        "sentRequestMillis",
        "",
        "receivedResponseMillis",
        "writeTo",
        "",
        "editor",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;",
        "readCertificateList",
        "",
        "Ljava/security/cert/Certificate;",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "writeCertList",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "certificates",
        "matches",
        "",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "snapshot",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;",
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
.field public static final Companion:Lnicoid/network238/okhttp3/Cache$Entry$Companion;

.field private static final RECEIVED_MILLIS:Ljava/lang/String;

.field private static final SENT_MILLIS:Ljava/lang/String;


# instance fields
.field private final code:I

.field private final handshake:Lnicoid/network238/okhttp3/Handshake;

.field private final message:Ljava/lang/String;

.field private final protocol:Lnicoid/network238/okhttp3/Protocol;

.field private final receivedResponseMillis:J

.field private final requestMethod:Ljava/lang/String;

.field private final responseHeaders:Lnicoid/network238/okhttp3/Headers;

.field private final sentRequestMillis:J

.field private final url:Lnicoid/network238/okhttp3/HttpUrl;

.field private final varyHeaders:Lnicoid/network238/okhttp3/Headers;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lnicoid/network238/okhttp3/Cache$Entry$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/Cache$Entry$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/Cache$Entry;->Companion:Lnicoid/network238/okhttp3/Cache$Entry$Companion;

    .line 707
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/platform/Platform;->getPrefix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "-Sent-Millis"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/Cache$Entry;->SENT_MILLIS:Ljava/lang/String;

    .line 710
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->getPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-Received-Millis"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/Cache$Entry;->RECEIVED_MILLIS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/Response;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 584
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 585
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->url:Lnicoid/network238/okhttp3/HttpUrl;

    .line 586
    sget-object v0, Lnicoid/network238/okhttp3/Cache;->Companion:Lnicoid/network238/okhttp3/Cache$Companion;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Cache$Companion;->varyHeaders(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->varyHeaders:Lnicoid/network238/okhttp3/Headers;

    .line 587
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->requestMethod:Ljava/lang/String;

    .line 588
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->protocol()Lnicoid/network238/okhttp3/Protocol;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->protocol:Lnicoid/network238/okhttp3/Protocol;

    .line 589
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    iput v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->code:I

    .line 590
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->message:Ljava/lang/String;

    .line 591
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->responseHeaders:Lnicoid/network238/okhttp3/Headers;

    .line 592
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->handshake()Lnicoid/network238/okhttp3/Handshake;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->handshake:Lnicoid/network238/okhttp3/Handshake;

    .line 593
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->sentRequestAtMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->sentRequestMillis:J

    .line 594
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->receivedResponseAtMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->receivedResponseMillis:J

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Source;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Cache corruption for "

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 528
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 530
    :try_start_0
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    .line 531
    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v2

    .line 534
    sget-object v3, Lnicoid/network238/okhttp3/HttpUrl;->Companion:Lnicoid/network238/okhttp3/HttpUrl$Companion;

    invoke-virtual {v3, v2}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v3

    if-eqz v3, :cond_7

    iput-object v3, p0, Lnicoid/network238/okhttp3/Cache$Entry;->url:Lnicoid/network238/okhttp3/HttpUrl;

    .line 537
    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->requestMethod:Ljava/lang/String;

    .line 538
    new-instance v0, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    .line 539
    sget-object v2, Lnicoid/network238/okhttp3/Cache;->Companion:Lnicoid/network238/okhttp3/Cache$Companion;

    invoke-virtual {v2, v1}, Lnicoid/network238/okhttp3/Cache$Companion;->readInt$okhttp(Lnicoid/network238/okio/BufferedSource;)I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_0

    .line 541
    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 543
    :cond_0
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->varyHeaders:Lnicoid/network238/okhttp3/Headers;

    .line 545
    sget-object v0, Lnicoid/network238/okhttp3/internal/http/StatusLine;->Companion:Lnicoid/network238/okhttp3/internal/http/StatusLine$Companion;

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/internal/http/StatusLine$Companion;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/http/StatusLine;

    move-result-object v0

    .line 546
    iget-object v2, v0, Lnicoid/network238/okhttp3/internal/http/StatusLine;->protocol:Lnicoid/network238/okhttp3/Protocol;

    iput-object v2, p0, Lnicoid/network238/okhttp3/Cache$Entry;->protocol:Lnicoid/network238/okhttp3/Protocol;

    .line 547
    iget v2, v0, Lnicoid/network238/okhttp3/internal/http/StatusLine;->code:I

    iput v2, p0, Lnicoid/network238/okhttp3/Cache$Entry;->code:I

    .line 548
    iget-object v0, v0, Lnicoid/network238/okhttp3/internal/http/StatusLine;->message:Ljava/lang/String;

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->message:Ljava/lang/String;

    .line 549
    new-instance v0, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    .line 550
    sget-object v2, Lnicoid/network238/okhttp3/Cache;->Companion:Lnicoid/network238/okhttp3/Cache$Companion;

    invoke-virtual {v2, v1}, Lnicoid/network238/okhttp3/Cache$Companion;->readInt$okhttp(Lnicoid/network238/okio/BufferedSource;)I

    move-result v2

    :goto_1
    if-ge v3, v2, :cond_1

    .line 552
    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 554
    :cond_1
    sget-object v2, Lnicoid/network238/okhttp3/Cache$Entry;->SENT_MILLIS:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 555
    sget-object v4, Lnicoid/network238/okhttp3/Cache$Entry;->RECEIVED_MILLIS:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lnicoid/network238/okhttp3/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 556
    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/Headers$Builder;->removeAll(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    .line 557
    invoke-virtual {v0, v4}, Lnicoid/network238/okhttp3/Headers$Builder;->removeAll(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    const-wide/16 v6, 0x0

    if-eqz v3, :cond_2

    .line 558
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    goto :goto_2

    :cond_2
    move-wide v2, v6

    :goto_2
    iput-wide v2, p0, Lnicoid/network238/okhttp3/Cache$Entry;->sentRequestMillis:J

    if-eqz v5, :cond_3

    .line 559
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    :cond_3
    iput-wide v6, p0, Lnicoid/network238/okhttp3/Cache$Entry;->receivedResponseMillis:J

    .line 560
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->responseHeaders:Lnicoid/network238/okhttp3/Headers;

    .line 562
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->url:Lnicoid/network238/okhttp3/HttpUrl;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_6

    .line 563
    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v0

    .line 564
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-gtz v3, :cond_5

    .line 567
    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v0

    .line 568
    sget-object v3, Lnicoid/network238/okhttp3/CipherSuite;->Companion:Lnicoid/network238/okhttp3/CipherSuite$Companion;

    invoke-virtual {v3, v0}, Lnicoid/network238/okhttp3/CipherSuite$Companion;->forJavaName(Ljava/lang/String;)Lnicoid/network238/okhttp3/CipherSuite;

    move-result-object v0

    .line 569
    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/Cache$Entry;->readCertificateList(Lnicoid/network238/okio/BufferedSource;)Ljava/util/List;

    move-result-object v3

    .line 570
    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/Cache$Entry;->readCertificateList(Lnicoid/network238/okio/BufferedSource;)Ljava/util/List;

    move-result-object v4

    .line 572
    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->exhausted()Z

    move-result v5

    if-nez v5, :cond_4

    .line 573
    sget-object v5, Lnicoid/network238/okhttp3/TlsVersion;->Companion:Lnicoid/network238/okhttp3/TlsVersion$Companion;

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Lnicoid/network238/okhttp3/TlsVersion$Companion;->forJavaName(Ljava/lang/String;)Lnicoid/network238/okhttp3/TlsVersion;

    move-result-object v1

    goto :goto_3

    .line 575
    :cond_4
    sget-object v1, Lnicoid/network238/okhttp3/TlsVersion;->SSL_3_0:Lnicoid/network238/okhttp3/TlsVersion;

    :goto_3
    nop

    .line 577
    sget-object v5, Lnicoid/network238/okhttp3/Handshake;->Companion:Lnicoid/network238/okhttp3/Handshake$Companion;

    invoke-virtual {v5, v1, v0, v3, v4}, Lnicoid/network238/okhttp3/Handshake$Companion;->get(Lnicoid/network238/okhttp3/TlsVersion;Lnicoid/network238/okhttp3/CipherSuite;Ljava/util/List;Ljava/util/List;)Lnicoid/network238/okhttp3/Handshake;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->handshake:Lnicoid/network238/okhttp3/Handshake;

    goto :goto_4

    .line 565
    :cond_5
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "expected \"\" but was \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v2, 0x22

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_6
    nop

    .line 579
    iput-object v2, p0, Lnicoid/network238/okhttp3/Cache$Entry;->handshake:Lnicoid/network238/okhttp3/Handshake;

    .line 581
    :goto_4
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 529
    invoke-static {p1, v2}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-void

    .line 534
    :cond_7
    :try_start_1
    new-instance v1, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 535
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    const-string v2, "cache corruption"

    const/4 v3, 0x5

    invoke-virtual {v0, v2, v3, v1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->log(Ljava/lang/String;ILjava/lang/Throwable;)V

    .line 534
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    .line 529
    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v1

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private final readCertificateList(Lnicoid/network238/okio/BufferedSource;)Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/BufferedSource;",
            ")",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 643
    sget-object v0, Lnicoid/network238/okhttp3/Cache;->Companion:Lnicoid/network238/okhttp3/Cache$Companion;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Cache$Companion;->readInt$okhttp(Lnicoid/network238/okio/BufferedSource;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 644
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 647
    :cond_0
    :try_start_0
    const-string v1, "X.509"

    invoke-static {v1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    .line 648
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_2

    .line 650
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v4

    .line 651
    new-instance v5, Lnicoid/network238/okio/Buffer;

    invoke-direct {v5}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 652
    sget-object v6, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v6, v4}, Lnicoid/network238/okio/ByteString$Companion;->decodeBase64(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 653
    invoke-virtual {v5, v4}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    .line 654
    invoke-virtual {v5}, Lnicoid/network238/okio/Buffer;->inputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 652
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Corrupt certificate in cache entry"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-object v2

    :catch_0
    move-exception p1

    .line 658
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final writeCertList(Lnicoid/network238/okio/BufferedSink;Ljava/util/List;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/BufferedSink;",
            "Ljava/util/List<",
            "+",
            "Ljava/security/cert/Certificate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 668
    :try_start_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lnicoid/network238/okio/BufferedSink;->writeDecimalLong(J)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    const/16 v1, 0xa

    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 669
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/Certificate;

    .line 670
    invoke-virtual {v0}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v3

    .line 671
    sget-object v2, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okio/ByteString$Companion;->of$default(Lnicoid/network238/okio/ByteString$Companion;[BIIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v0, v4, v2, v3}, Lnicoid/network238/okio/ByteString;->base64$default(Lnicoid/network238/okio/ByteString;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 672
    invoke-interface {p1, v0}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 675
    new-instance p2, Ljava/io/IOException;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
.end method


# virtual methods
.method public final matches(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)Z
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 683
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->url:Lnicoid/network238/okhttp3/HttpUrl;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 684
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->requestMethod:Ljava/lang/String;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 685
    sget-object v0, Lnicoid/network238/okhttp3/Cache;->Companion:Lnicoid/network238/okhttp3/Cache$Companion;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Cache$Entry;->varyHeaders:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v0, p2, v1, p1}, Lnicoid/network238/okhttp3/Cache$Companion;->varyMatches(Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/Request;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final response(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;)Lnicoid/network238/okhttp3/Response;
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 688
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->responseHeaders:Lnicoid/network238/okhttp3/Headers;

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 689
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cache$Entry;->responseHeaders:Lnicoid/network238/okhttp3/Headers;

    const-string v2, "Content-Length"

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 690
    new-instance v2, Lnicoid/network238/okhttp3/Request;

    iget-object v3, p0, Lnicoid/network238/okhttp3/Cache$Entry;->url:Lnicoid/network238/okhttp3/HttpUrl;

    iget-object v4, p0, Lnicoid/network238/okhttp3/Cache$Entry;->varyHeaders:Lnicoid/network238/okhttp3/Headers;

    iget-object v5, p0, Lnicoid/network238/okhttp3/Cache$Entry;->requestMethod:Ljava/lang/String;

    const/16 v7, 0x8

    const/4 v8, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v2 .. v8}, Lnicoid/network238/okhttp3/Request;-><init>(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 692
    new-instance v3, Lnicoid/network238/okhttp3/Response$Builder;

    invoke-direct {v3}, Lnicoid/network238/okhttp3/Response$Builder;-><init>()V

    .line 693
    invoke-virtual {v3, v2}, Lnicoid/network238/okhttp3/Response$Builder;->request(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 694
    iget-object v3, p0, Lnicoid/network238/okhttp3/Cache$Entry;->protocol:Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->protocol(Lnicoid/network238/okhttp3/Protocol;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 695
    iget v3, p0, Lnicoid/network238/okhttp3/Cache$Entry;->code:I

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->code(I)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 696
    iget-object v3, p0, Lnicoid/network238/okhttp3/Cache$Entry;->message:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->message(Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 697
    iget-object v3, p0, Lnicoid/network238/okhttp3/Cache$Entry;->responseHeaders:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 698
    new-instance v3, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;

    invoke-direct {v3, p1, v0, v1}, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;-><init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->body(Lnicoid/network238/okhttp3/ResponseBody;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 699
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->handshake:Lnicoid/network238/okhttp3/Handshake;

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Response$Builder;->handshake(Lnicoid/network238/okhttp3/Handshake;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 700
    iget-wide v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->sentRequestMillis:J

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okhttp3/Response$Builder;->sentRequestAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 701
    iget-wide v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->receivedResponseMillis:J

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okhttp3/Response$Builder;->receivedResponseAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 702
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object p1

    return-object p1
.end method

.method public final writeTo(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 599
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->newSink(I)Lnicoid/network238/okio/Sink;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    .line 600
    :try_start_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cache$Entry;->url:Lnicoid/network238/okhttp3/HttpUrl;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    const/16 v2, 0xa

    invoke-interface {v1, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 601
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cache$Entry;->requestMethod:Ljava/lang/String;

    invoke-interface {p1, v1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    invoke-interface {v1, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 602
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cache$Entry;->varyHeaders:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    int-to-long v3, v1

    invoke-interface {p1, v3, v4}, Lnicoid/network238/okio/BufferedSink;->writeDecimalLong(J)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    invoke-interface {v1, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 603
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cache$Entry;->varyHeaders:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v3, v0

    :goto_0
    const-string v4, ": "

    if-ge v3, v1, :cond_0

    .line 605
    :try_start_1
    iget-object v5, p0, Lnicoid/network238/okhttp3/Cache$Entry;->varyHeaders:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v5, v3}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v5}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v5

    .line 606
    invoke-interface {v5, v4}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v4

    .line 607
    iget-object v5, p0, Lnicoid/network238/okhttp3/Cache$Entry;->varyHeaders:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v5, v3}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v4

    .line 608
    invoke-interface {v4, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 611
    :cond_0
    new-instance v1, Lnicoid/network238/okhttp3/internal/http/StatusLine;

    iget-object v3, p0, Lnicoid/network238/okhttp3/Cache$Entry;->protocol:Lnicoid/network238/okhttp3/Protocol;

    iget v5, p0, Lnicoid/network238/okhttp3/Cache$Entry;->code:I

    iget-object v6, p0, Lnicoid/network238/okhttp3/Cache$Entry;->message:Ljava/lang/String;

    invoke-direct {v1, v3, v5, v6}, Lnicoid/network238/okhttp3/internal/http/StatusLine;-><init>(Lnicoid/network238/okhttp3/Protocol;ILjava/lang/String;)V

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http/StatusLine;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    invoke-interface {v1, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 612
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cache$Entry;->responseHeaders:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x2

    int-to-long v5, v1

    invoke-interface {p1, v5, v6}, Lnicoid/network238/okio/BufferedSink;->writeDecimalLong(J)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    invoke-interface {v1, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 613
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cache$Entry;->responseHeaders:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    :goto_1
    if-ge v0, v1, :cond_1

    .line 615
    iget-object v3, p0, Lnicoid/network238/okhttp3/Cache$Entry;->responseHeaders:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v3, v0}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v3

    .line 616
    invoke-interface {v3, v4}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v3

    .line 617
    iget-object v5, p0, Lnicoid/network238/okhttp3/Cache$Entry;->responseHeaders:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v5, v0}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v3

    .line 618
    invoke-interface {v3, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 621
    :cond_1
    sget-object v0, Lnicoid/network238/okhttp3/Cache$Entry;->SENT_MILLIS:Ljava/lang/String;

    invoke-interface {p1, v0}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    .line 622
    invoke-interface {v0, v4}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    .line 623
    iget-wide v5, p0, Lnicoid/network238/okhttp3/Cache$Entry;->sentRequestMillis:J

    invoke-interface {v0, v5, v6}, Lnicoid/network238/okio/BufferedSink;->writeDecimalLong(J)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    .line 624
    invoke-interface {v0, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 626
    sget-object v0, Lnicoid/network238/okhttp3/Cache$Entry;->RECEIVED_MILLIS:Ljava/lang/String;

    invoke-interface {p1, v0}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    .line 627
    invoke-interface {v0, v4}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    .line 628
    iget-wide v3, p0, Lnicoid/network238/okhttp3/Cache$Entry;->receivedResponseMillis:J

    invoke-interface {v0, v3, v4}, Lnicoid/network238/okio/BufferedSink;->writeDecimalLong(J)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    .line 629
    invoke-interface {v0, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 631
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->url:Lnicoid/network238/okhttp3/HttpUrl;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->handshake:Lnicoid/network238/okhttp3/Handshake;

    if-eqz v0, :cond_2

    .line 632
    invoke-interface {p1, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 633
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->handshake:Lnicoid/network238/okhttp3/Handshake;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Handshake;->cipherSuite()Lnicoid/network238/okhttp3/CipherSuite;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CipherSuite;->javaName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    invoke-interface {v0, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 634
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->handshake:Lnicoid/network238/okhttp3/Handshake;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/Cache$Entry;->writeCertList(Lnicoid/network238/okio/BufferedSink;Ljava/util/List;)V

    .line 635
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->handshake:Lnicoid/network238/okhttp3/Handshake;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Handshake;->localCertificates()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/Cache$Entry;->writeCertList(Lnicoid/network238/okio/BufferedSink;Ljava/util/List;)V

    .line 636
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$Entry;->handshake:Lnicoid/network238/okhttp3/Handshake;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Handshake;->tlsVersion()Lnicoid/network238/okhttp3/TlsVersion;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/TlsVersion;->javaName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    invoke-interface {v0, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 638
    :cond_2
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 599
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v1

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1
.end method
