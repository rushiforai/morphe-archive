.class public Lorg/spongycastle/pqc/crypto/gmss/GMSSPublicKeyParameters;
.super Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyParameters;
.source "SourceFile"


# instance fields
.field private gmssPublicKey:[B


# direct methods
.method public constructor <init>([BLorg/spongycastle/pqc/crypto/gmss/GMSSParameters;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, p2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyParameters;-><init>(ZLorg/spongycastle/pqc/crypto/gmss/GMSSParameters;)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSPublicKeyParameters;->gmssPublicKey:[B

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getPublicKey()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSPublicKeyParameters;->gmssPublicKey:[B

    .line 2
    .line 3
    return-object p0
.end method
