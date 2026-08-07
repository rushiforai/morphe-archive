.class public Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private crls:Lorg/spongycastle/asn1/ASN1EncodableVector;

.field private revCerts:Lorg/spongycastle/asn1/ASN1EncodableVector;

.field private status:Lorg/spongycastle/asn1/ASN1EncodableVector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->status:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 10
    .line 11
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 12
    .line 13
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->revCerts:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 17
    .line 18
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 19
    .line 20
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->crls:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public add(Lorg/spongycastle/asn1/cmp/PKIStatusInfo;)Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;
    .locals 1

    .line 33
    iget-object v0, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->status:Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    return-object p0
.end method

.method public add(Lorg/spongycastle/asn1/cmp/PKIStatusInfo;Lorg/spongycastle/asn1/crmf/CertId;)Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->status:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->revCerts:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 8
    .line 9
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->status:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->revCerts:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 23
    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const-string p0, "status and revCerts sequence must be in common order"

    .line 27
    .line 28
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public addCrl(Lorg/spongycastle/asn1/x509/CertificateList;)Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->crls:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public build()Lorg/spongycastle/asn1/cmp/RevRepContent;
    .locals 5

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    .line 7
    .line 8
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->status:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 9
    .line 10
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->revCerts:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 17
    .line 18
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 26
    .line 27
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    .line 28
    .line 29
    iget-object v4, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->revCerts:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 30
    .line 31
    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 32
    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    invoke-direct {v1, v2, v4, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->crls:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 42
    .line 43
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 50
    .line 51
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    .line 52
    .line 53
    iget-object p0, p0, Lorg/spongycastle/asn1/cmp/RevRepContentBuilder;->crls:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 54
    .line 55
    invoke-direct {v3, p0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 56
    .line 57
    .line 58
    invoke-direct {v1, v2, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 65
    .line 66
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p0}, Lorg/spongycastle/asn1/cmp/RevRepContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/RevRepContent;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method
