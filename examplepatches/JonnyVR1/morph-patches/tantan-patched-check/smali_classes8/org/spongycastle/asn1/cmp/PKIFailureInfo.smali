.class public Lorg/spongycastle/asn1/cmp/PKIFailureInfo;
.super Lorg/spongycastle/asn1/DERBitString;
.source "SourceFile"


# static fields
.field public static final ADD_INFO_NOT_AVAILABLE:I = 0x400000

.field public static final BAD_ALG:I = 0x80

.field public static final BAD_CERT_ID:I = 0x8

.field public static final BAD_DATA_FORMAT:I = 0x4

.field public static final BAD_MESSAGE_CHECK:I = 0x40

.field public static final BAD_POP:I = 0x4000

.field public static final BAD_REQUEST:I = 0x20

.field public static final BAD_TIME:I = 0x10

.field public static final INCORRECT_DATA:I = 0x1

.field public static final MISSING_TIME_STAMP:I = 0x8000

.field public static final SYSTEM_FAILURE:I = 0x40000000

.field public static final TIME_NOT_AVAILABLE:I = 0x200

.field public static final UNACCEPTED_EXTENSION:I = 0x800000

.field public static final UNACCEPTED_POLICY:I = 0x100

.field public static final WRONG_AUTHORITY:I = 0x2

.field public static final addInfoNotAvailable:I = 0x400000

.field public static final badAlg:I = 0x80

.field public static final badCertId:I = 0x8

.field public static final badCertTemplate:I = 0x100000

.field public static final badDataFormat:I = 0x4

.field public static final badMessageCheck:I = 0x40

.field public static final badPOP:I = 0x4000

.field public static final badRecipientNonce:I = 0x400

.field public static final badRequest:I = 0x20

.field public static final badSenderNonce:I = 0x200000

.field public static final badTime:I = 0x10

.field public static final certConfirmed:I = 0x1000

.field public static final certRevoked:I = 0x2000

.field public static final duplicateCertReq:I = 0x20000000

.field public static final incorrectData:I = 0x1

.field public static final missingTimeStamp:I = 0x8000

.field public static final notAuthorized:I = 0x10000

.field public static final signerNotTrusted:I = 0x80000

.field public static final systemFailure:I = 0x40000000

.field public static final systemUnavail:I = -0x80000000

.field public static final timeNotAvailable:I = 0x200

.field public static final transactionIdInUse:I = 0x40000

.field public static final unacceptedExtension:I = 0x800000

.field public static final unacceptedPolicy:I = 0x100

.field public static final unsupportedVersion:I = 0x20000

.field public static final wrongAuthority:I = 0x2

.field public static final wrongIntegrity:I = 0x800


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1BitString;->getBytes(I)[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1BitString;->getPadBits(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/asn1/DERBitString;-><init>([BI)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/DERBitString;)V
    .locals 1

    .line 13
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1BitString;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1BitString;->getPadBits()I

    move-result p1

    invoke-direct {p0, v0, p1}, Lorg/spongycastle/asn1/DERBitString;-><init>([BI)V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "PKIFailureInfo: 0x"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1BitString;->intValue()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
