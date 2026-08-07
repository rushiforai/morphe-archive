.class final Lorg/spongycastle/asn1/x9/X962NamedCurves$14;
.super Lorg/spongycastle/asn1/x9/X9ECParametersHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/asn1/x9/X962NamedCurves;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/x9/X9ECParametersHolder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public createParameters()Lorg/spongycastle/asn1/x9/X9ECParameters;
    .locals 7

    .line 1
    new-instance v3, Ljava/math/BigInteger;

    .line 2
    .line 3
    const-string p0, "155555555555555555555555610C0B196812BFB6288A3EA3"

    .line 4
    .line 5
    const/16 v0, 0x10

    .line 6
    .line 7
    invoke-direct {v3, p0, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v1, 0x6

    .line 11
    .line 12
    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    new-instance v1, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 17
    .line 18
    move-object v5, v3

    .line 19
    new-instance v3, Ljava/math/BigInteger;

    .line 20
    .line 21
    const-string p0, "6C01074756099122221056911C77D77E77A777E7E7E77FCB"

    .line 22
    .line 23
    invoke-direct {v3, p0, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    move-object v6, v4

    .line 27
    new-instance v4, Ljava/math/BigInteger;

    .line 28
    .line 29
    const-string p0, "71FE1AF926CF847989EFEF8DB459F66394D90F32AD3F15E8"

    .line 30
    .line 31
    invoke-direct {v4, p0, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    move-object v0, v1

    .line 35
    const/16 v1, 0xbf

    .line 36
    .line 37
    const/16 v2, 0x9

    .line 38
    .line 39
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Lorg/spongycastle/asn1/x9/X9ECParameters;

    .line 43
    .line 44
    new-instance v2, Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 45
    .line 46
    const-string v1, "03375D4CE24FDE434489DE8746E71786015009E66E38A926DD"

    .line 47
    .line 48
    invoke-static {v1}, Lorg/spongycastle/util/encoders/Hex;->decode(Ljava/lang/String;)[B

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-direct {v2, v0, v1}, Lorg/spongycastle/asn1/x9/X9ECPoint;-><init>(Lorg/spongycastle/math/ec/ECCurve;[B)V

    .line 53
    .line 54
    .line 55
    move-object v3, v5

    .line 56
    const/4 v5, 0x0

    .line 57
    move-object v1, v0

    .line 58
    move-object v4, v6

    .line 59
    move-object v0, p0

    .line 60
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/asn1/x9/X9ECParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/asn1/x9/X9ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    .line 61
    .line 62
    .line 63
    return-object v0
.end method
