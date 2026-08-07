.class Lorg/spongycastle/crypto/tls/TlsServerContextImpl;
.super Lorg/spongycastle/crypto/tls/AbstractTlsContext;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsServerContext;


# direct methods
.method public constructor <init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/tls/SecurityParameters;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/tls/AbstractTlsContext;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/tls/SecurityParameters;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public isServer()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
