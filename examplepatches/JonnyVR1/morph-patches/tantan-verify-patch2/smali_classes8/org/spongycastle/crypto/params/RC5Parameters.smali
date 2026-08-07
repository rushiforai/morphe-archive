.class public Lorg/spongycastle/crypto/params/RC5Parameters;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/CipherParameters;


# instance fields
.field private key:[B

.field private rounds:I


# direct methods
.method public constructor <init>([BI)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    const/16 v1, 0xff

    .line 6
    .line 7
    if-gt v0, v1, :cond_0

    .line 8
    .line 9
    array-length v0, p1

    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    iput-object v0, p0, Lorg/spongycastle/crypto/params/RC5Parameters;->key:[B

    .line 13
    .line 14
    iput p2, p0, Lorg/spongycastle/crypto/params/RC5Parameters;->rounds:I

    .line 15
    .line 16
    array-length p0, p1

    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-static {p1, p2, v0, p2, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p0, "RC5 key length can be no greater than 255"

    .line 23
    .line 24
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    throw p0
.end method


# virtual methods
.method public getKey()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/RC5Parameters;->key:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getRounds()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/RC5Parameters;->rounds:I

    .line 2
    .line 3
    return p0
.end method
