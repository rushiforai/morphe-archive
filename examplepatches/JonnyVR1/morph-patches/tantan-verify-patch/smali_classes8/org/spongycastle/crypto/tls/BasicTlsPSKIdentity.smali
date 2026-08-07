.class public Lorg/spongycastle/crypto/tls/BasicTlsPSKIdentity;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsPSKIdentity;


# instance fields
.field protected identity:[B

.field protected psk:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toUTF8ByteArray(Ljava/lang/String;)[B

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/crypto/tls/BasicTlsPSKIdentity;->identity:[B

    .line 19
    invoke-static {p2}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/crypto/tls/BasicTlsPSKIdentity;->psk:[B

    return-void
.end method

.method public constructor <init>([B[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/BasicTlsPSKIdentity;->identity:[B

    .line 9
    .line 10
    invoke-static {p2}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/BasicTlsPSKIdentity;->psk:[B

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getPSK()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/BasicTlsPSKIdentity;->psk:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getPSKIdentity()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/BasicTlsPSKIdentity;->identity:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public notifyIdentityHint([B)V
    .locals 0

    return-void
.end method

.method public skipIdentityHint()V
    .locals 0

    return-void
.end method
