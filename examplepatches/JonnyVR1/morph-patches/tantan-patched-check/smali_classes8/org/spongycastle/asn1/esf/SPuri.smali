.class public Lorg/spongycastle/asn1/esf/SPuri;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private uri:Lorg/spongycastle/asn1/DERIA5String;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/DERIA5String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/asn1/esf/SPuri;->uri:Lorg/spongycastle/asn1/DERIA5String;

    .line 5
    .line 6
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/SPuri;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/esf/SPuri;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/esf/SPuri;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    instance-of v0, p0, Lorg/spongycastle/asn1/DERIA5String;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Lorg/spongycastle/asn1/esf/SPuri;

    .line 13
    .line 14
    invoke-static {p0}, Lorg/spongycastle/asn1/DERIA5String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERIA5String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/esf/SPuri;-><init>(Lorg/spongycastle/asn1/DERIA5String;)V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method


# virtual methods
.method public getUri()Lorg/spongycastle/asn1/DERIA5String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/esf/SPuri;->uri:Lorg/spongycastle/asn1/DERIA5String;

    .line 2
    .line 3
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/esf/SPuri;->uri:Lorg/spongycastle/asn1/DERIA5String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Primitive;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
