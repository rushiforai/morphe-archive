.class public Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/DerivationParameters;


# instance fields
.field private algorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private extraInfo:[B

.field private keySize:I

.field private z:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;I[B)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;I[B[B)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;I[B[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->algorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 5
    .line 6
    iput p2, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->keySize:I

    .line 7
    .line 8
    iput-object p3, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->z:[B

    .line 9
    .line 10
    iput-object p4, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->extraInfo:[B

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->algorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExtraInfo()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->extraInfo:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getKeySize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->keySize:I

    .line 2
    .line 3
    return p0
.end method

.method public getZ()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->z:[B

    .line 2
    .line 3
    return-object p0
.end method
