.class public Lorg/spongycastle/crypto/params/DSAKeyParameters;
.super Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
.source "SourceFile"


# instance fields
.field private params:Lorg/spongycastle/crypto/params/DSAParameters;


# direct methods
.method public constructor <init>(ZLorg/spongycastle/crypto/params/DSAParameters;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;-><init>(Z)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lorg/spongycastle/crypto/params/DSAKeyParameters;->params:Lorg/spongycastle/crypto/params/DSAParameters;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getParameters()Lorg/spongycastle/crypto/params/DSAParameters;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/DSAKeyParameters;->params:Lorg/spongycastle/crypto/params/DSAParameters;

    .line 2
    .line 3
    return-object p0
.end method
