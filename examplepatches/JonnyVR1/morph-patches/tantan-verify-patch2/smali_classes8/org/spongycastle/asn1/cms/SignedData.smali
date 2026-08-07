.class public Lorg/spongycastle/asn1/cms/SignedData;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# static fields
.field private static final VERSION_1:Lorg/spongycastle/asn1/ASN1Integer;

.field private static final VERSION_3:Lorg/spongycastle/asn1/ASN1Integer;

.field private static final VERSION_4:Lorg/spongycastle/asn1/ASN1Integer;

.field private static final VERSION_5:Lorg/spongycastle/asn1/ASN1Integer;


# instance fields
.field private certificates:Lorg/spongycastle/asn1/ASN1Set;

.field private certsBer:Z

.field private contentInfo:Lorg/spongycastle/asn1/cms/ContentInfo;

.field private crls:Lorg/spongycastle/asn1/ASN1Set;

.field private crlsBer:Z

.field private digestAlgorithms:Lorg/spongycastle/asn1/ASN1Set;

.field private signerInfos:Lorg/spongycastle/asn1/ASN1Set;

.field private version:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    const-wide/16 v1, 0x1

    .line 4
    .line 5
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_1:Lorg/spongycastle/asn1/ASN1Integer;

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 11
    .line 12
    const-wide/16 v1, 0x3

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_3:Lorg/spongycastle/asn1/ASN1Integer;

    .line 18
    .line 19
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 20
    .line 21
    const-wide/16 v1, 0x4

    .line 22
    .line 23
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_4:Lorg/spongycastle/asn1/ASN1Integer;

    .line 27
    .line 28
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 29
    .line 30
    const-wide/16 v1, 0x5

    .line 31
    .line 32
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_5:Lorg/spongycastle/asn1/ASN1Integer;

    .line 36
    .line 37
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lorg/spongycastle/asn1/ASN1Set;

    .line 23
    .line 24
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->digestAlgorithms:Lorg/spongycastle/asn1/ASN1Set;

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Lorg/spongycastle/asn1/cms/ContentInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/ContentInfo;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->contentInfo:Lorg/spongycastle/asn1/cms/ContentInfo;

    .line 35
    .line 36
    :goto_0
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lorg/spongycastle/asn1/ASN1Primitive;

    .line 47
    .line 48
    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 49
    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 53
    .line 54
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const/4 v2, 0x0

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    const/4 v3, 0x1

    .line 62
    if-ne v1, v3, :cond_0

    .line 63
    .line 64
    instance-of v1, v0, Lorg/spongycastle/asn1/BERTaggedObject;

    .line 65
    .line 66
    iput-boolean v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->crlsBer:Z

    .line 67
    .line 68
    invoke-static {v0, v2}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Set;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->crls:Lorg/spongycastle/asn1/ASN1Set;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    const-string p0, "unknown tag value "

    .line 76
    .line 77
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    invoke-static {p0, p1}, Ll/pvb;->a(Ljava/lang/String;I)V

    .line 82
    .line 83
    .line 84
    const/4 p0, 0x0

    .line 85
    throw p0

    .line 86
    :cond_1
    instance-of v1, v0, Lorg/spongycastle/asn1/BERTaggedObject;

    .line 87
    .line 88
    iput-boolean v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->certsBer:Z

    .line 89
    .line 90
    invoke-static {v0, v2}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Set;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->certificates:Lorg/spongycastle/asn1/ASN1Set;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    check-cast v0, Lorg/spongycastle/asn1/ASN1Set;

    .line 98
    .line 99
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->signerInfos:Lorg/spongycastle/asn1/ASN1Set;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/cms/ContentInfo;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;)V
    .locals 1

    .line 103
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 104
    invoke-virtual {p2}, Lorg/spongycastle/asn1/cms/ContentInfo;->getContentType()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    invoke-direct {p0, v0, p3, p4, p5}, Lorg/spongycastle/asn1/cms/SignedData;->calculateVersion(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 105
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/SignedData;->digestAlgorithms:Lorg/spongycastle/asn1/ASN1Set;

    .line 106
    iput-object p2, p0, Lorg/spongycastle/asn1/cms/SignedData;->contentInfo:Lorg/spongycastle/asn1/cms/ContentInfo;

    .line 107
    iput-object p3, p0, Lorg/spongycastle/asn1/cms/SignedData;->certificates:Lorg/spongycastle/asn1/ASN1Set;

    .line 108
    iput-object p4, p0, Lorg/spongycastle/asn1/cms/SignedData;->crls:Lorg/spongycastle/asn1/ASN1Set;

    .line 109
    iput-object p5, p0, Lorg/spongycastle/asn1/cms/SignedData;->signerInfos:Lorg/spongycastle/asn1/ASN1Set;

    .line 110
    instance-of p1, p4, Lorg/spongycastle/asn1/BERSet;

    iput-boolean p1, p0, Lorg/spongycastle/asn1/cms/SignedData;->crlsBer:Z

    .line 111
    instance-of p1, p3, Lorg/spongycastle/asn1/BERSet;

    iput-boolean p1, p0, Lorg/spongycastle/asn1/cms/SignedData;->certsBer:Z

    return-void
.end method

.method private calculateVersion(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;)Lorg/spongycastle/asn1/ASN1Integer;
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p2, :cond_3

    .line 4
    .line 5
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    move v2, v1

    .line 10
    move v3, v2

    .line 11
    move v4, v3

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    if-eqz v5, :cond_4

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    instance-of v6, v5, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 23
    .line 24
    if-eqz v6, :cond_0

    .line 25
    .line 26
    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    if-ne v6, v0, :cond_1

    .line 35
    .line 36
    move v3, v0

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    const/4 v7, 0x2

    .line 43
    if-ne v6, v7, :cond_2

    .line 44
    .line 45
    move v4, v0

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    const/4 v6, 0x3

    .line 52
    if-ne v5, v6, :cond_0

    .line 53
    .line 54
    move v2, v0

    .line 55
    goto :goto_0

    .line 56
    :cond_3
    move v2, v1

    .line 57
    move v3, v2

    .line 58
    move v4, v3

    .line 59
    :cond_4
    if-eqz v2, :cond_5

    .line 60
    .line 61
    new-instance p0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 62
    .line 63
    const-wide/16 p1, 0x5

    .line 64
    .line 65
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 66
    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_5
    if-eqz p3, :cond_7

    .line 70
    .line 71
    invoke-virtual {p3}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    :cond_6
    :goto_1
    invoke-interface {p2}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 76
    .line 77
    .line 78
    move-result p3

    .line 79
    if-eqz p3, :cond_7

    .line 80
    .line 81
    invoke-interface {p2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    instance-of p3, p3, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 86
    .line 87
    if-eqz p3, :cond_6

    .line 88
    .line 89
    move v1, v0

    .line 90
    goto :goto_1

    .line 91
    :cond_7
    if-eqz v1, :cond_8

    .line 92
    .line 93
    sget-object p0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_5:Lorg/spongycastle/asn1/ASN1Integer;

    .line 94
    .line 95
    return-object p0

    .line 96
    :cond_8
    if-eqz v4, :cond_9

    .line 97
    .line 98
    sget-object p0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_4:Lorg/spongycastle/asn1/ASN1Integer;

    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_9
    if-eqz v3, :cond_a

    .line 102
    .line 103
    sget-object p0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_3:Lorg/spongycastle/asn1/ASN1Integer;

    .line 104
    .line 105
    return-object p0

    .line 106
    :cond_a
    invoke-direct {p0, p4}, Lorg/spongycastle/asn1/cms/SignedData;->checkForVersion3(Lorg/spongycastle/asn1/ASN1Set;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-eqz p0, :cond_b

    .line 111
    .line 112
    sget-object p0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_3:Lorg/spongycastle/asn1/ASN1Integer;

    .line 113
    .line 114
    return-object p0

    .line 115
    :cond_b
    sget-object p0, Lorg/spongycastle/asn1/cms/CMSObjectIdentifiers;->data:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-nez p0, :cond_c

    .line 122
    .line 123
    sget-object p0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_3:Lorg/spongycastle/asn1/ASN1Integer;

    .line 124
    .line 125
    return-object p0

    .line 126
    :cond_c
    sget-object p0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_1:Lorg/spongycastle/asn1/ASN1Integer;

    .line 127
    .line 128
    return-object p0
.end method

.method private checkForVersion3(Lorg/spongycastle/asn1/ASN1Set;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Lorg/spongycastle/asn1/cms/SignerInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/SignerInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Lorg/spongycastle/asn1/cms/SignerInfo;->getVersion()Lorg/spongycastle/asn1/ASN1Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ljava/math/BigInteger;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/4 v0, 0x3

    .line 32
    if-ne p1, v0, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_1
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/SignedData;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/cms/SignedData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/cms/SignedData;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/cms/SignedData;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/SignedData;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

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


# virtual methods
.method public getCRLs()Lorg/spongycastle/asn1/ASN1Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/SignedData;->crls:Lorg/spongycastle/asn1/ASN1Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCertificates()Lorg/spongycastle/asn1/ASN1Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/SignedData;->certificates:Lorg/spongycastle/asn1/ASN1Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDigestAlgorithms()Lorg/spongycastle/asn1/ASN1Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/SignedData;->digestAlgorithms:Lorg/spongycastle/asn1/ASN1Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEncapContentInfo()Lorg/spongycastle/asn1/cms/ContentInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/SignedData;->contentInfo:Lorg/spongycastle/asn1/cms/ContentInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSignerInfos()Lorg/spongycastle/asn1/ASN1Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/SignedData;->signerInfos:Lorg/spongycastle/asn1/ASN1Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersion()Lorg/spongycastle/asn1/ASN1Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/SignedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

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
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->digestAlgorithms:Lorg/spongycastle/asn1/ASN1Set;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->contentInfo:Lorg/spongycastle/asn1/cms/ContentInfo;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->certificates:Lorg/spongycastle/asn1/ASN1Set;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-boolean v3, p0, Lorg/spongycastle/asn1/cms/SignedData;->certsBer:Z

    .line 27
    .line 28
    if-eqz v3, :cond_0

    .line 29
    .line 30
    new-instance v3, Lorg/spongycastle/asn1/BERTaggedObject;

    .line 31
    .line 32
    invoke-direct {v3, v2, v2, v1}, Lorg/spongycastle/asn1/BERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 40
    .line 41
    iget-object v3, p0, Lorg/spongycastle/asn1/cms/SignedData;->certificates:Lorg/spongycastle/asn1/ASN1Set;

    .line 42
    .line 43
    invoke-direct {v1, v2, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->crls:Lorg/spongycastle/asn1/ASN1Set;

    .line 50
    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    iget-boolean v3, p0, Lorg/spongycastle/asn1/cms/SignedData;->crlsBer:Z

    .line 54
    .line 55
    const/4 v4, 0x1

    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    new-instance v3, Lorg/spongycastle/asn1/BERTaggedObject;

    .line 59
    .line 60
    invoke-direct {v3, v2, v4, v1}, Lorg/spongycastle/asn1/BERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 68
    .line 69
    iget-object v3, p0, Lorg/spongycastle/asn1/cms/SignedData;->crls:Lorg/spongycastle/asn1/ASN1Set;

    .line 70
    .line 71
    invoke-direct {v1, v2, v4, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    :goto_1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/SignedData;->signerInfos:Lorg/spongycastle/asn1/ASN1Set;

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 80
    .line 81
    .line 82
    new-instance p0, Lorg/spongycastle/asn1/BERSequence;

    .line 83
    .line 84
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/BERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 85
    .line 86
    .line 87
    return-object p0
.end method
