.class public Lorg/spongycastle/asn1/ocsp/ResponseData;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# static fields
.field private static final V1:Lorg/spongycastle/asn1/ASN1Integer;


# instance fields
.field private producedAt:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

.field private responderID:Lorg/spongycastle/asn1/ocsp/ResponderID;

.field private responseExtensions:Lorg/spongycastle/asn1/x509/Extensions;

.field private responses:Lorg/spongycastle/asn1/ASN1Sequence;

.field private version:Lorg/spongycastle/asn1/ASN1Integer;

.field private versionPresent:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/asn1/ocsp/ResponseData;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/ocsp/ResponderID;Lorg/spongycastle/asn1/ASN1GeneralizedTime;Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/x509/Extensions;)V
    .locals 0

    .line 106
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 107
    iput-object p1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 108
    iput-object p2, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responderID:Lorg/spongycastle/asn1/ocsp/ResponderID;

    .line 109
    iput-object p3, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->producedAt:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 110
    iput-object p4, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responses:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 111
    iput-object p5, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responseExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    instance-of v1, v1, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 19
    .line 20
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iput-boolean v2, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->versionPresent:Z

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 33
    .line 34
    invoke-static {v0, v2}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 39
    .line 40
    move v0, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    sget-object v1, Lorg/spongycastle/asn1/ocsp/ResponseData;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    .line 43
    .line 44
    iput-object v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    sget-object v1, Lorg/spongycastle/asn1/ocsp/ResponseData;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    .line 48
    .line 49
    iput-object v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 50
    .line 51
    :goto_0
    add-int/lit8 v1, v0, 0x1

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-static {v3}, Lorg/spongycastle/asn1/ocsp/ResponderID;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/ResponderID;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iput-object v3, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responderID:Lorg/spongycastle/asn1/ocsp/ResponderID;

    .line 62
    .line 63
    add-int/lit8 v3, v0, 0x2

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iput-object v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->producedAt:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 74
    .line 75
    add-int/lit8 v0, v0, 0x3

    .line 76
    .line 77
    invoke-virtual {p1, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 82
    .line 83
    iput-object v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responses:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 84
    .line 85
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-le v1, v0, :cond_2

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 96
    .line 97
    invoke-static {p1, v2}, Lorg/spongycastle/asn1/x509/Extensions;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/Extensions;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responseExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 102
    .line 103
    :cond_2
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ocsp/ResponderID;Lorg/spongycastle/asn1/ASN1GeneralizedTime;Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/x509/Extensions;)V
    .locals 6

    .line 105
    sget-object v1, Lorg/spongycastle/asn1/ocsp/ResponseData;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/asn1/ocsp/ResponseData;-><init>(Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/ocsp/ResponderID;Lorg/spongycastle/asn1/ASN1GeneralizedTime;Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/x509/Extensions;)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ocsp/ResponderID;Lorg/spongycastle/asn1/ASN1GeneralizedTime;Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/x509/X509Extensions;)V
    .locals 6

    .line 104
    sget-object v1, Lorg/spongycastle/asn1/ocsp/ResponseData;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-static {p2}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    move-result-object v3

    invoke-static {p4}, Lorg/spongycastle/asn1/x509/Extensions;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v5

    move-object v0, p0

    move-object v2, p1

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/asn1/ocsp/ResponseData;-><init>(Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/ocsp/ResponderID;Lorg/spongycastle/asn1/ASN1GeneralizedTime;Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/x509/Extensions;)V

    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/ResponseData;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/ocsp/ResponseData;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/ocsp/ResponseData;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/ocsp/ResponseData;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ocsp/ResponseData;
    .locals 0

    .line 22
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object p0

    invoke-static {p0}, Lorg/spongycastle/asn1/ocsp/ResponseData;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/ResponseData;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getProducedAt()Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->producedAt:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResponderID()Lorg/spongycastle/asn1/ocsp/ResponderID;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responderID:Lorg/spongycastle/asn1/ocsp/ResponderID;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResponseExtensions()Lorg/spongycastle/asn1/x509/Extensions;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responseExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResponses()Lorg/spongycastle/asn1/ASN1Sequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responses:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersion()Lorg/spongycastle/asn1/ASN1Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 5

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->versionPresent:Z

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 12
    .line 13
    sget-object v3, Lorg/spongycastle/asn1/ocsp/ResponseData;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    .line 14
    .line 15
    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    :cond_0
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    iget-object v4, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 25
    .line 26
    invoke-direct {v1, v2, v3, v4}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responderID:Lorg/spongycastle/asn1/ocsp/ResponderID;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->producedAt:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responses:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responseExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 52
    .line 53
    iget-object p0, p0, Lorg/spongycastle/asn1/ocsp/ResponseData;->responseExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 54
    .line 55
    invoke-direct {v1, v2, v2, p0}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 62
    .line 63
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 64
    .line 65
    .line 66
    return-object p0
.end method
