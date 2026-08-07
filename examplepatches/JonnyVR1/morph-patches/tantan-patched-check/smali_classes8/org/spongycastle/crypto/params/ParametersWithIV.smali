.class public Lorg/spongycastle/crypto/params/ParametersWithIV;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/CipherParameters;


# instance fields
.field private iv:[B

.field private parameters:Lorg/spongycastle/crypto/CipherParameters;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/CipherParameters;[B)V
    .locals 2

    const/4 v0, 0x0

    .line 15
    array-length v1, p2

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[BII)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/CipherParameters;[BII)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-array v0, p4, [B

    .line 5
    .line 6
    iput-object v0, p0, Lorg/spongycastle/crypto/params/ParametersWithIV;->iv:[B

    .line 7
    .line 8
    iput-object p1, p0, Lorg/spongycastle/crypto/params/ParametersWithIV;->parameters:Lorg/spongycastle/crypto/CipherParameters;

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-static {p2, p3, v0, p0, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getIV()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/ParametersWithIV;->iv:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getParameters()Lorg/spongycastle/crypto/CipherParameters;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/ParametersWithIV;->parameters:Lorg/spongycastle/crypto/CipherParameters;

    .line 2
    .line 3
    return-object p0
.end method
