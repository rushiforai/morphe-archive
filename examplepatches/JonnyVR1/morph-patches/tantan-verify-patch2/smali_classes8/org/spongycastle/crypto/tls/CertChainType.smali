.class public Lorg/spongycastle/crypto/tls/CertChainType;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final individual_certs:S = 0x0s

.field public static final pkipath:S = 0x1s


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static isValid(S)Z
    .locals 1

    if-ltz p0, :cond_0

    const/4 v0, 0x1

    if-gt p0, v0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
