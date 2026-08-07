.class public Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsSRPIdentityManager;


# static fields
.field private static final PREFIX_PASSWORD:[B

.field private static final PREFIX_SALT:[B


# instance fields
.field protected group:Lorg/spongycastle/crypto/params/SRP6GroupParameters;

.field protected mac:Lorg/spongycastle/crypto/Mac;

.field protected verifierGenerator:Lorg/spongycastle/crypto/agreement/srp/SRP6VerifierGenerator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "password"

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->PREFIX_PASSWORD:[B

    .line 8
    .line 9
    const-string v0, "salt"

    .line 10
    .line 11
    invoke-static {v0}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->PREFIX_SALT:[B

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/params/SRP6GroupParameters;Lorg/spongycastle/crypto/agreement/srp/SRP6VerifierGenerator;Lorg/spongycastle/crypto/Mac;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->group:Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->verifierGenerator:Lorg/spongycastle/crypto/agreement/srp/SRP6VerifierGenerator;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->mac:Lorg/spongycastle/crypto/Mac;

    .line 9
    .line 10
    return-void
.end method

.method public static getRFC5054Default(Lorg/spongycastle/crypto/params/SRP6GroupParameters;[B)Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/agreement/srp/SRP6VerifierGenerator;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/crypto/agreement/srp/SRP6VerifierGenerator;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-static {v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, p0, v2}, Lorg/spongycastle/crypto/agreement/srp/SRP6VerifierGenerator;->init(Lorg/spongycastle/crypto/params/SRP6GroupParameters;Lorg/spongycastle/crypto/Digest;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Lorg/spongycastle/crypto/macs/HMac;

    .line 15
    .line 16
    invoke-static {v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v2, v1}, Lorg/spongycastle/crypto/macs/HMac;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 24
    .line 25
    invoke-direct {v1, p1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, v1}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 29
    .line 30
    .line 31
    new-instance p1, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;

    .line 32
    .line 33
    invoke-direct {p1, p0, v0, v2}, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;-><init>(Lorg/spongycastle/crypto/params/SRP6GroupParameters;Lorg/spongycastle/crypto/agreement/srp/SRP6VerifierGenerator;Lorg/spongycastle/crypto/Mac;)V

    .line 34
    .line 35
    .line 36
    return-object p1
.end method


# virtual methods
.method public getLoginParameters([B)Lorg/spongycastle/crypto/tls/TlsSRPLoginParameters;
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->mac:Lorg/spongycastle/crypto/Mac;

    .line 2
    .line 3
    sget-object v1, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->PREFIX_SALT:[B

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-interface {v0, v1, v3, v2}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->mac:Lorg/spongycastle/crypto/Mac;

    .line 11
    .line 12
    array-length v1, p1

    .line 13
    invoke-interface {v0, p1, v3, v1}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->mac:Lorg/spongycastle/crypto/Mac;

    .line 17
    .line 18
    invoke-interface {v0}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    new-array v0, v0, [B

    .line 23
    .line 24
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->mac:Lorg/spongycastle/crypto/Mac;

    .line 25
    .line 26
    invoke-interface {v1, v0, v3}, Lorg/spongycastle/crypto/Mac;->doFinal([BI)I

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->mac:Lorg/spongycastle/crypto/Mac;

    .line 30
    .line 31
    sget-object v2, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->PREFIX_PASSWORD:[B

    .line 32
    .line 33
    array-length v4, v2

    .line 34
    invoke-interface {v1, v2, v3, v4}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->mac:Lorg/spongycastle/crypto/Mac;

    .line 38
    .line 39
    array-length v2, p1

    .line 40
    invoke-interface {v1, p1, v3, v2}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->mac:Lorg/spongycastle/crypto/Mac;

    .line 44
    .line 45
    invoke-interface {v1}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    new-array v1, v1, [B

    .line 50
    .line 51
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->mac:Lorg/spongycastle/crypto/Mac;

    .line 52
    .line 53
    invoke-interface {v2, v1, v3}, Lorg/spongycastle/crypto/Mac;->doFinal([BI)I

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->verifierGenerator:Lorg/spongycastle/crypto/agreement/srp/SRP6VerifierGenerator;

    .line 57
    .line 58
    invoke-virtual {v2, v0, p1, v1}, Lorg/spongycastle/crypto/agreement/srp/SRP6VerifierGenerator;->generateVerifier([B[B[B)Ljava/math/BigInteger;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsSRPLoginParameters;

    .line 63
    .line 64
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SimulatedTlsSRPIdentityManager;->group:Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    .line 65
    .line 66
    invoke-direct {v1, p0, p1, v0}, Lorg/spongycastle/crypto/tls/TlsSRPLoginParameters;-><init>(Lorg/spongycastle/crypto/params/SRP6GroupParameters;Ljava/math/BigInteger;[B)V

    .line 67
    .line 68
    .line 69
    return-object v1
.end method
