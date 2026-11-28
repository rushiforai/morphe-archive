.class public final Lnicoid/network238/okhttp3/ConnectionSpec$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/ConnectionSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0011\u0008\u0010\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B\u0011\u0008\u0016\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0008J\u0006\u0010\u001a\u001a\u00020\u0000J\u001f\u0010\u000c\u001a\u00020\u00002\u0012\u0010\u000c\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u001b0\r\"\u00020\u001b\u00a2\u0006\u0002\u0010\u001cJ\u001f\u0010\u000c\u001a\u00020\u00002\u0012\u0010\u000c\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000e0\r\"\u00020\u000e\u00a2\u0006\u0002\u0010\u001dJ\u0006\u0010\u001e\u001a\u00020\u0000J\u001f\u0010\u0014\u001a\u00020\u00002\u0012\u0010\u0014\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u001f0\r\"\u00020\u001f\u00a2\u0006\u0002\u0010 J\u001f\u0010\u0014\u001a\u00020\u00002\u0012\u0010\u0014\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000e0\r\"\u00020\u000e\u00a2\u0006\u0002\u0010\u001dJ\u0010\u0010\u0017\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u0003H\u0007J\u0006\u0010!\u001a\u00020\u0007R\u001a\u0010\u0002\u001a\u00020\u0003X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u0005R$\u0010\u000c\u001a\n\u0012\u0004\u0012\u00020\u000e\u0018\u00010\rX\u0080\u000e\u00a2\u0006\u0010\n\u0002\u0010\u0013\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012R$\u0010\u0014\u001a\n\u0012\u0004\u0012\u00020\u000e\u0018\u00010\rX\u0080\u000e\u00a2\u0006\u0010\n\u0002\u0010\u0013\u001a\u0004\u0008\u0015\u0010\u0010\"\u0004\u0008\u0016\u0010\u0012R\u001a\u0010\u0017\u001a\u00020\u0003X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0018\u0010\n\"\u0004\u0008\u0019\u0010\u0005\u00a8\u0006\""
    }
    d2 = {
        "Lnicoid/network238/okhttp3/ConnectionSpec$Builder;",
        "",
        "tls",
        "",
        "<init>",
        "(Z)V",
        "connectionSpec",
        "Lnicoid/network238/okhttp3/ConnectionSpec;",
        "(Lnicoid/network238/okhttp3/ConnectionSpec;)V",
        "getTls$okhttp",
        "()Z",
        "setTls$okhttp",
        "cipherSuites",
        "",
        "",
        "getCipherSuites$okhttp",
        "()[Ljava/lang/String;",
        "setCipherSuites$okhttp",
        "([Ljava/lang/String;)V",
        "[Ljava/lang/String;",
        "tlsVersions",
        "getTlsVersions$okhttp",
        "setTlsVersions$okhttp",
        "supportsTlsExtensions",
        "getSupportsTlsExtensions$okhttp",
        "setSupportsTlsExtensions$okhttp",
        "allEnabledCipherSuites",
        "Lnicoid/network238/okhttp3/CipherSuite;",
        "([Lnicoid/network238/okhttp3/CipherSuite;)Lnicoid/network238/okhttp3/ConnectionSpec$Builder;",
        "([Ljava/lang/String;)Lnicoid/network238/okhttp3/ConnectionSpec$Builder;",
        "allEnabledTlsVersions",
        "Lnicoid/network238/okhttp3/TlsVersion;",
        "([Lnicoid/network238/okhttp3/TlsVersion;)Lnicoid/network238/okhttp3/ConnectionSpec$Builder;",
        "build",
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
.field private cipherSuites:[Ljava/lang/String;

.field private supportsTlsExtensions:Z

.field private tls:Z

.field private tlsVersions:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/ConnectionSpec;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 232
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/ConnectionSpec;->isTls()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    .line 233
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/ConnectionSpec;->getCipherSuitesAsString$okhttp()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    .line 234
    # getter for: Lnicoid/network238/okhttp3/ConnectionSpec;->tlsVersionsAsString:[Ljava/lang/String;
    invoke-static {p1}, Lnicoid/network238/okhttp3/ConnectionSpec;->access$getTlsVersionsAsString$p(Lnicoid/network238/okhttp3/ConnectionSpec;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    .line 235
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/ConnectionSpec;->supportsTlsExtensions()Z

    move-result p1

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->supportsTlsExtensions:Z

    return-void
.end method

.method public constructor <init>(Z)V
    .registers 2

    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 228
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    return-void
.end method


# virtual methods
.method public final allEnabledCipherSuites()Lnicoid/network238/okhttp3/ConnectionSpec$Builder;
    .registers 3

    .line 240
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_0

    .line 241
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    return-object p0

    .line 240
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "no cipher suites for cleartext connections"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final allEnabledTlsVersions()Lnicoid/network238/okhttp3/ConnectionSpec$Builder;
    .registers 3

    .line 262
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_0

    .line 263
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    return-object p0

    .line 262
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "no TLS versions for cleartext connections"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final build()Lnicoid/network238/okhttp3/ConnectionSpec;
    .registers 6

    .line 295
    new-instance v0, Lnicoid/network238/okhttp3/ConnectionSpec;

    .line 296
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    .line 297
    iget-boolean v2, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->supportsTlsExtensions:Z

    .line 298
    iget-object v3, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    .line 299
    iget-object v4, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    .line 295
    invoke-direct {v0, v1, v2, v3, v4}, Lnicoid/network238/okhttp3/ConnectionSpec;-><init>(ZZ[Ljava/lang/String;[Ljava/lang/String;)V

    return-object v0
.end method

.method public final varargs cipherSuites([Ljava/lang/String;)Lnicoid/network238/okhttp3/ConnectionSpec$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 253
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_2

    .line 254
    array-length v0, p1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 257
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    return-object p0

    .line 254
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "At least one cipher suite is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 253
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "no cipher suites for cleartext connections"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final varargs cipherSuites([Lnicoid/network238/okhttp3/CipherSuite;)Lnicoid/network238/okhttp3/ConnectionSpec$Builder;
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 246
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_1

    .line 388
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 389
    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, p1, v3

    .line 247
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/CipherSuite;->javaName()Ljava/lang/String;

    move-result-object v4

    .line 390
    invoke-interface {v0, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 393
    new-array p1, v2, [Ljava/lang/String;

    invoke-interface {v0, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    .line 247
    check-cast p1, [Ljava/lang/String;

    .line 248
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->cipherSuites([Ljava/lang/String;)Lnicoid/network238/okhttp3/ConnectionSpec$Builder;

    move-result-object p1

    return-object p1

    .line 246
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "no cipher suites for cleartext connections"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final getCipherSuites$okhttp()[Ljava/lang/String;
    .registers 2

    .line 223
    iget-object v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    return-object v0
.end method

.method public final getSupportsTlsExtensions$okhttp()Z
    .registers 2

    .line 225
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->supportsTlsExtensions:Z

    return v0
.end method

.method public final getTls$okhttp()Z
    .registers 2

    .line 222
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    return v0
.end method

.method public final getTlsVersions$okhttp()[Ljava/lang/String;
    .registers 2

    .line 224
    iget-object v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    return-object v0
.end method

.method public final setCipherSuites$okhttp([Ljava/lang/String;)V
    .registers 2

    .line 223
    iput-object p1, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    return-void
.end method

.method public final setSupportsTlsExtensions$okhttp(Z)V
    .registers 2

    .line 225
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->supportsTlsExtensions:Z

    return-void
.end method

.method public final setTls$okhttp(Z)V
    .registers 2

    .line 222
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    return-void
.end method

.method public final setTlsVersions$okhttp([Ljava/lang/String;)V
    .registers 2

    .line 224
    iput-object p1, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    return-void
.end method

.method public final supportsTlsExtensions(Z)Lnicoid/network238/okhttp3/ConnectionSpec$Builder;
    .registers 3

    .line 290
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_0

    .line 291
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->supportsTlsExtensions:Z

    return-object p0

    .line 290
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "no TLS extensions for cleartext connections"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final varargs tlsVersions([Ljava/lang/String;)Lnicoid/network238/okhttp3/ConnectionSpec$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 276
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_2

    .line 277
    array-length v0, p1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 280
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    return-object p0

    .line 277
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "At least one TLS version is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 276
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "no TLS versions for cleartext connections"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final varargs tlsVersions([Lnicoid/network238/okhttp3/TlsVersion;)Lnicoid/network238/okhttp3/ConnectionSpec$Builder;
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 268
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_1

    .line 394
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 395
    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, p1, v3

    .line 270
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/TlsVersion;->javaName()Ljava/lang/String;

    move-result-object v4

    .line 396
    invoke-interface {v0, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 399
    new-array p1, v2, [Ljava/lang/String;

    invoke-interface {v0, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    .line 270
    check-cast p1, [Ljava/lang/String;

    .line 271
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/ConnectionSpec$Builder;->tlsVersions([Ljava/lang/String;)Lnicoid/network238/okhttp3/ConnectionSpec$Builder;

    move-result-object p1

    return-object p1

    .line 268
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "no TLS versions for cleartext connections"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
