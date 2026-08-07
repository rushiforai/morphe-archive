.class public Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private freeText:Lorg/spongycastle/asn1/cmp/PKIFreeText;

.field private generalInfo:Lorg/spongycastle/asn1/ASN1Sequence;

.field private messageTime:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

.field private protectionAlg:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field private pvno:Lorg/spongycastle/asn1/ASN1Integer;

.field private recipKID:Lorg/spongycastle/asn1/ASN1OctetString;

.field private recipNonce:Lorg/spongycastle/asn1/ASN1OctetString;

.field private recipient:Lorg/spongycastle/asn1/x509/GeneralName;

.field private sender:Lorg/spongycastle/asn1/x509/GeneralName;

.field private senderKID:Lorg/spongycastle/asn1/ASN1OctetString;

.field private senderNonce:Lorg/spongycastle/asn1/ASN1OctetString;

.field private transactionID:Lorg/spongycastle/asn1/ASN1OctetString;


# direct methods
.method public constructor <init>(ILorg/spongycastle/asn1/x509/GeneralName;Lorg/spongycastle/asn1/x509/GeneralName;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0, p2, p3}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;-><init>(Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/x509/GeneralName;Lorg/spongycastle/asn1/x509/GeneralName;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/x509/GeneralName;Lorg/spongycastle/asn1/x509/GeneralName;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->pvno:Lorg/spongycastle/asn1/ASN1Integer;

    .line 13
    iput-object p2, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->sender:Lorg/spongycastle/asn1/x509/GeneralName;

    .line 14
    iput-object p3, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->recipient:Lorg/spongycastle/asn1/x509/GeneralName;

    return-void
.end method

.method private addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V
    .locals 1

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    new-instance p0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-direct {p0, v0, p2, p3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private static makeGeneralInfoSeq(Lorg/spongycastle/asn1/cmp/InfoTypeAndValue;)Lorg/spongycastle/asn1/ASN1Sequence;
    .locals 1

    .line 28
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    return-object v0
.end method

.method private static makeGeneralInfoSeq([Lorg/spongycastle/asn1/cmp/InfoTypeAndValue;)Lorg/spongycastle/asn1/ASN1Sequence;
    .locals 3

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 4
    .line 5
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    array-length v2, p0

    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    aget-object v2, p0, v1

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 15
    .line 16
    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 21
    .line 22
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 23
    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method


# virtual methods
.method public build()Lorg/spongycastle/asn1/cmp/PKIHeader;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->pvno:Lorg/spongycastle/asn1/ASN1Integer;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->sender:Lorg/spongycastle/asn1/x509/GeneralName;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->recipient:Lorg/spongycastle/asn1/x509/GeneralName;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->messageTime:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 23
    .line 24
    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 25
    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->protectionAlg:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 29
    .line 30
    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 31
    .line 32
    .line 33
    const/4 v1, 0x2

    .line 34
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->senderKID:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 35
    .line 36
    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 37
    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->recipKID:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 41
    .line 42
    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 43
    .line 44
    .line 45
    const/4 v1, 0x4

    .line 46
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->transactionID:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 47
    .line 48
    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 49
    .line 50
    .line 51
    const/4 v1, 0x5

    .line 52
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->senderNonce:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 53
    .line 54
    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 55
    .line 56
    .line 57
    const/4 v1, 0x6

    .line 58
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->recipNonce:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 59
    .line 60
    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 61
    .line 62
    .line 63
    const/4 v1, 0x7

    .line 64
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->freeText:Lorg/spongycastle/asn1/cmp/PKIFreeText;

    .line 65
    .line 66
    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 67
    .line 68
    .line 69
    const/16 v1, 0x8

    .line 70
    .line 71
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->generalInfo:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 72
    .line 73
    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 74
    .line 75
    .line 76
    const/4 v1, 0x0

    .line 77
    iput-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->messageTime:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 78
    .line 79
    iput-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->protectionAlg:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 80
    .line 81
    iput-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->senderKID:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 82
    .line 83
    iput-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->recipKID:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 84
    .line 85
    iput-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->transactionID:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 86
    .line 87
    iput-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->senderNonce:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 88
    .line 89
    iput-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->recipNonce:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 90
    .line 91
    iput-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->freeText:Lorg/spongycastle/asn1/cmp/PKIFreeText;

    .line 92
    .line 93
    iput-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->generalInfo:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 94
    .line 95
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 96
    .line 97
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 98
    .line 99
    .line 100
    invoke-static {p0}, Lorg/spongycastle/asn1/cmp/PKIHeader;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/PKIHeader;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0
.end method

.method public setFreeText(Lorg/spongycastle/asn1/cmp/PKIFreeText;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->freeText:Lorg/spongycastle/asn1/cmp/PKIFreeText;

    .line 2
    .line 3
    return-object p0
.end method

.method public setGeneralInfo(Lorg/spongycastle/asn1/ASN1Sequence;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 0

    .line 11
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->generalInfo:Lorg/spongycastle/asn1/ASN1Sequence;

    return-object p0
.end method

.method public setGeneralInfo(Lorg/spongycastle/asn1/cmp/InfoTypeAndValue;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->makeGeneralInfoSeq(Lorg/spongycastle/asn1/cmp/InfoTypeAndValue;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->setGeneralInfo(Lorg/spongycastle/asn1/ASN1Sequence;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setGeneralInfo([Lorg/spongycastle/asn1/cmp/InfoTypeAndValue;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 0

    .line 10
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->makeGeneralInfoSeq([Lorg/spongycastle/asn1/cmp/InfoTypeAndValue;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->setGeneralInfo(Lorg/spongycastle/asn1/ASN1Sequence;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;

    move-result-object p0

    return-object p0
.end method

.method public setMessageTime(Lorg/spongycastle/asn1/ASN1GeneralizedTime;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->messageTime:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 2
    .line 3
    return-object p0
.end method

.method public setProtectionAlg(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->protectionAlg:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public setRecipKID(Lorg/spongycastle/asn1/DEROctetString;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 0

    .line 16
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->recipKID:Lorg/spongycastle/asn1/ASN1OctetString;

    return-object p0
.end method

.method public setRecipKID([B)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 8
    .line 9
    .line 10
    move-object p1, v0

    .line 11
    :goto_0
    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->setRecipKID(Lorg/spongycastle/asn1/DEROctetString;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public setRecipNonce(Lorg/spongycastle/asn1/ASN1OctetString;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 0

    .line 16
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->recipNonce:Lorg/spongycastle/asn1/ASN1OctetString;

    return-object p0
.end method

.method public setRecipNonce([B)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 8
    .line 9
    .line 10
    move-object p1, v0

    .line 11
    :goto_0
    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->setRecipNonce(Lorg/spongycastle/asn1/ASN1OctetString;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public setSenderKID(Lorg/spongycastle/asn1/ASN1OctetString;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 0

    .line 16
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->senderKID:Lorg/spongycastle/asn1/ASN1OctetString;

    return-object p0
.end method

.method public setSenderKID([B)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 8
    .line 9
    .line 10
    move-object p1, v0

    .line 11
    :goto_0
    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->setSenderKID(Lorg/spongycastle/asn1/ASN1OctetString;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public setSenderNonce(Lorg/spongycastle/asn1/ASN1OctetString;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 0

    .line 16
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->senderNonce:Lorg/spongycastle/asn1/ASN1OctetString;

    return-object p0
.end method

.method public setSenderNonce([B)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 8
    .line 9
    .line 10
    move-object p1, v0

    .line 11
    :goto_0
    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->setSenderNonce(Lorg/spongycastle/asn1/ASN1OctetString;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public setTransactionID(Lorg/spongycastle/asn1/ASN1OctetString;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 0

    .line 16
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->transactionID:Lorg/spongycastle/asn1/ASN1OctetString;

    return-object p0
.end method

.method public setTransactionID([B)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 8
    .line 9
    .line 10
    move-object p1, v0

    .line 11
    :goto_0
    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;->setTransactionID(Lorg/spongycastle/asn1/ASN1OctetString;)Lorg/spongycastle/asn1/cmp/PKIHeaderBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
