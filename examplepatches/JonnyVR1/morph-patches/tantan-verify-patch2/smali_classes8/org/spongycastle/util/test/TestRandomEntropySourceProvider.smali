.class public Lorg/spongycastle/util/test/TestRandomEntropySourceProvider;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/prng/EntropySourceProvider;


# instance fields
.field private final _predictionResistant:Z

.field private final _sr:Ljava/security/SecureRandom;


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/security/SecureRandom;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/util/test/TestRandomEntropySourceProvider;->_sr:Ljava/security/SecureRandom;

    .line 10
    .line 11
    iput-boolean p1, p0, Lorg/spongycastle/util/test/TestRandomEntropySourceProvider;->_predictionResistant:Z

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic access$000(Lorg/spongycastle/util/test/TestRandomEntropySourceProvider;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/spongycastle/util/test/TestRandomEntropySourceProvider;->_predictionResistant:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(Lorg/spongycastle/util/test/TestRandomEntropySourceProvider;)Ljava/security/SecureRandom;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/util/test/TestRandomEntropySourceProvider;->_sr:Ljava/security/SecureRandom;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public get(I)Lorg/spongycastle/crypto/prng/EntropySource;
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/util/test/TestRandomEntropySourceProvider$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/spongycastle/util/test/TestRandomEntropySourceProvider$1;-><init>(Lorg/spongycastle/util/test/TestRandomEntropySourceProvider;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
