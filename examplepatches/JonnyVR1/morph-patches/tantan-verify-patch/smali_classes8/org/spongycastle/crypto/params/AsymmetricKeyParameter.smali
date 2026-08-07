.class public Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/CipherParameters;


# instance fields
.field privateKey:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;->privateKey:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public isPrivate()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;->privateKey:Z

    .line 2
    .line 3
    return p0
.end method
