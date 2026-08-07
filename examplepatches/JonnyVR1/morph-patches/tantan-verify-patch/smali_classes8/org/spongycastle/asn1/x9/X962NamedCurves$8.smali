.class final Lorg/spongycastle/asn1/x9/X962NamedCurves$8;
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
    .locals 9

    .line 1
    new-instance v3, Ljava/math/BigInteger;

    .line 2
    .line 3
    const-string p0, "0400000000000000000001E60FC8821CC74DAEAFC1"

    .line 4
    .line 5
    const/16 v0, 0x10

    .line 6
    .line 7
    invoke-direct {v3, p0, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v1, 0x2

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
    new-instance v5, Ljava/math/BigInteger;

    .line 19
    .line 20
    const-string p0, "072546B5435234A422E0789675F432C89435DE5242"

    .line 21
    .line 22
    invoke-direct {v5, p0, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    new-instance v6, Ljava/math/BigInteger;

    .line 26
    .line 27
    const-string p0, "00C9517D06D5240D3CFF38C74B20B6CD4D6F9DD4D9"

    .line 28
    .line 29
    invoke-direct {v6, p0, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    move-object v0, v1

    .line 33
    const/16 v1, 0xa3

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    move-object v7, v3

    .line 37
    const/4 v3, 0x2

    .line 38
    move-object v8, v4

    .line 39
    const/16 v4, 0x8

    .line 40
    .line 41
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IIIILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Lorg/spongycastle/asn1/x9/X9ECParameters;

    .line 45
    .line 46
    new-instance v2, Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 47
    .line 48
    const-string v1, "0307AF69989546103D79329FCC3D74880F33BBE803CB"

    .line 49
    .line 50
    invoke-static {v1}, Lorg/spongycastle/util/encoders/Hex;->decode(Ljava/lang/String;)[B

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-direct {v2, v0, v1}, Lorg/spongycastle/asn1/x9/X9ECPoint;-><init>(Lorg/spongycastle/math/ec/ECCurve;[B)V

    .line 55
    .line 56
    .line 57
    const-string v1, "D2C0FB15760860DEF1EEF4D696E6768756151754"

    .line 58
    .line 59
    invoke-static {v1}, Lorg/spongycastle/util/encoders/Hex;->decode(Ljava/lang/String;)[B

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    move-object v1, v0

    .line 64
    move-object v3, v7

    .line 65
    move-object v4, v8

    .line 66
    move-object v0, p0

    .line 67
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/asn1/x9/X9ECParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/asn1/x9/X9ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    .line 68
    .line 69
    .line 70
    return-object v0
.end method
