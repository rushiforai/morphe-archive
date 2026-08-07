.class public Lorg/spongycastle/asn1/x509/IetfAttrSyntax;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# static fields
.field public static final VALUE_OCTETS:I = 0x1

.field public static final VALUE_OID:I = 0x2

.field public static final VALUE_UTF8:I = 0x3


# instance fields
.field policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

.field valueChoice:I

.field values:Ljava/util/Vector;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 6
    .line 7
    new-instance v1, Ljava/util/Vector;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    iput v1, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->valueChoice:I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    instance-of v2, v2, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 23
    .line 24
    const/4 v3, 0x2

    .line 25
    const/4 v4, 0x1

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 33
    .line 34
    invoke-static {v2, v1}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 39
    .line 40
    :goto_0
    move v1, v4

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-ne v2, v3, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-static {v1}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    :goto_1
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    instance-of v2, v2, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 64
    .line 65
    if-eqz v2, :cond_8

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 72
    .line 73
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    :goto_2
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_7

    .line 82
    .line 83
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Lorg/spongycastle/asn1/ASN1Primitive;

    .line 88
    .line 89
    instance-of v2, v1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 90
    .line 91
    if-eqz v2, :cond_2

    .line 92
    .line 93
    move v2, v3

    .line 94
    goto :goto_3

    .line 95
    :cond_2
    instance-of v2, v1, Lorg/spongycastle/asn1/DERUTF8String;

    .line 96
    .line 97
    if-eqz v2, :cond_3

    .line 98
    .line 99
    const/4 v2, 0x3

    .line 100
    goto :goto_3

    .line 101
    :cond_3
    instance-of v2, v1, Lorg/spongycastle/asn1/DEROctetString;

    .line 102
    .line 103
    if-eqz v2, :cond_6

    .line 104
    .line 105
    move v2, v4

    .line 106
    :goto_3
    iget v5, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->valueChoice:I

    .line 107
    .line 108
    if-gez v5, :cond_4

    .line 109
    .line 110
    iput v2, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->valueChoice:I

    .line 111
    .line 112
    :cond_4
    iget v5, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->valueChoice:I

    .line 113
    .line 114
    if-ne v2, v5, :cond_5

    .line 115
    .line 116
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    .line 117
    .line 118
    invoke-virtual {v2, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_5
    const-string p0, "Mix of value types in IetfAttrSyntax"

    .line 123
    .line 124
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    throw v0

    .line 128
    :cond_6
    const-string p0, "Bad value type encoding IetfAttrSyntax"

    .line 129
    .line 130
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    throw v0

    .line 134
    :cond_7
    return-void

    .line 135
    :cond_8
    const-string p0, "Non-IetfAttrSyntax encoding"

    .line 136
    .line 137
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    throw v0
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/IetfAttrSyntax;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

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
.method public getPolicyAuthority()Lorg/spongycastle/asn1/x509/GeneralNames;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValueType()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->valueChoice:I

    .line 2
    .line 3
    return p0
.end method

.method public getValues()[Ljava/lang/Object;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->getValueType()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ne v0, v1, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    new-array v1, v0, [Lorg/spongycastle/asn1/ASN1OctetString;

    .line 16
    .line 17
    :goto_0
    if-eq v2, v0, :cond_0

    .line 18
    .line 19
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    .line 20
    .line 21
    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 26
    .line 27
    aput-object v3, v1, v2

    .line 28
    .line 29
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-object v1

    .line 33
    :cond_1
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->getValueType()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    .line 38
    .line 39
    const/4 v3, 0x2

    .line 40
    if-ne v0, v3, :cond_3

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    new-array v1, v0, [Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 47
    .line 48
    :goto_1
    if-eq v2, v0, :cond_2

    .line 49
    .line 50
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    .line 51
    .line 52
    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 57
    .line 58
    aput-object v3, v1, v2

    .line 59
    .line 60
    add-int/lit8 v2, v2, 0x1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    return-object v1

    .line 64
    :cond_3
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    new-array v1, v0, [Lorg/spongycastle/asn1/DERUTF8String;

    .line 69
    .line 70
    :goto_2
    if-eq v2, v0, :cond_4

    .line 71
    .line 72
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    .line 73
    .line 74
    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Lorg/spongycastle/asn1/DERUTF8String;

    .line 79
    .line 80
    aput-object v3, v1, v2

    .line 81
    .line 82
    add-int/lit8 v2, v2, 0x1

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_4
    return-object v1
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 4

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 14
    .line 15
    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 22
    .line 23
    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :goto_0
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    invoke-interface {p0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lorg/spongycastle/asn1/ASN1Encodable;

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 49
    .line 50
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 54
    .line 55
    .line 56
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 57
    .line 58
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 59
    .line 60
    .line 61
    return-object p0
.end method
