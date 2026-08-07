.class public Lorg/spongycastle/crypto/params/IESParameters;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/CipherParameters;


# instance fields
.field private derivation:[B

.field private encoding:[B

.field private macKeySize:I


# direct methods
.method public constructor <init>([B[BI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/params/IESParameters;->derivation:[B

    .line 5
    .line 6
    iput-object p2, p0, Lorg/spongycastle/crypto/params/IESParameters;->encoding:[B

    .line 7
    .line 8
    iput p3, p0, Lorg/spongycastle/crypto/params/IESParameters;->macKeySize:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getDerivationV()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/IESParameters;->derivation:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getEncodingV()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/IESParameters;->encoding:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getMacKeySize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/IESParameters;->macKeySize:I

    .line 2
    .line 3
    return p0
.end method
