.class public Lorg/spongycastle/asn1/cmp/PKIStatus;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# static fields
.field public static final GRANTED:I = 0x0

.field public static final GRANTED_WITH_MODS:I = 0x1

.field public static final KEY_UPDATE_WARNING:I = 0x6

.field public static final REJECTION:I = 0x2

.field public static final REVOCATION_NOTIFICATION:I = 0x5

.field public static final REVOCATION_WARNING:I = 0x4

.field public static final WAITING:I = 0x3

.field public static final granted:Lorg/spongycastle/asn1/cmp/PKIStatus;

.field public static final grantedWithMods:Lorg/spongycastle/asn1/cmp/PKIStatus;

.field public static final keyUpdateWaiting:Lorg/spongycastle/asn1/cmp/PKIStatus;

.field public static final rejection:Lorg/spongycastle/asn1/cmp/PKIStatus;

.field public static final revocationNotification:Lorg/spongycastle/asn1/cmp/PKIStatus;

.field public static final revocationWarning:Lorg/spongycastle/asn1/cmp/PKIStatus;

.field public static final waiting:Lorg/spongycastle/asn1/cmp/PKIStatus;


# instance fields
.field private value:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cmp/PKIStatus;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lorg/spongycastle/asn1/cmp/PKIStatus;->granted:Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 8
    .line 9
    new-instance v0, Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cmp/PKIStatus;-><init>(I)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lorg/spongycastle/asn1/cmp/PKIStatus;->grantedWithMods:Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 16
    .line 17
    new-instance v0, Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cmp/PKIStatus;-><init>(I)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lorg/spongycastle/asn1/cmp/PKIStatus;->rejection:Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 24
    .line 25
    new-instance v0, Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 26
    .line 27
    const/4 v1, 0x3

    .line 28
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cmp/PKIStatus;-><init>(I)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lorg/spongycastle/asn1/cmp/PKIStatus;->waiting:Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 32
    .line 33
    new-instance v0, Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 34
    .line 35
    const/4 v1, 0x4

    .line 36
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cmp/PKIStatus;-><init>(I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lorg/spongycastle/asn1/cmp/PKIStatus;->revocationWarning:Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 40
    .line 41
    new-instance v0, Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 42
    .line 43
    const/4 v1, 0x5

    .line 44
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cmp/PKIStatus;-><init>(I)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lorg/spongycastle/asn1/cmp/PKIStatus;->revocationNotification:Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 48
    .line 49
    new-instance v0, Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 50
    .line 51
    const/4 v1, 0x6

    .line 52
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cmp/PKIStatus;-><init>(I)V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lorg/spongycastle/asn1/cmp/PKIStatus;->keyUpdateWaiting:Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 56
    .line 57
    return-void
.end method

.method private constructor <init>(I)V
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
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/cmp/PKIStatus;-><init>(Lorg/spongycastle/asn1/ASN1Integer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Integer;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 12
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIStatus;->value:Lorg/spongycastle/asn1/ASN1Integer;

    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/PKIStatus;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/cmp/PKIStatus;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cmp/PKIStatus;-><init>(Lorg/spongycastle/asn1/ASN1Integer;)V

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
.method public getValue()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cmp/PKIStatus;->value:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cmp/PKIStatus;->value:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    return-object p0
.end method
