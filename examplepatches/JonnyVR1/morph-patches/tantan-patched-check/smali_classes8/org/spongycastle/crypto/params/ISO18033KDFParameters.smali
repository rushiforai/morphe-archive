.class public Lorg/spongycastle/crypto/params/ISO18033KDFParameters;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/DerivationParameters;


# instance fields
.field seed:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/params/ISO18033KDFParameters;->seed:[B

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getSeed()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/ISO18033KDFParameters;->seed:[B

    .line 2
    .line 3
    return-object p0
.end method
