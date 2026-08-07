.class Lorg/spongycastle/crypto/digests/SkeinEngine$Configuration;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/digests/SkeinEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Configuration"
.end annotation


# instance fields
.field private bytes:[B


# direct methods
.method public constructor <init>(J)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x20

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$Configuration;->bytes:[B

    .line 9
    .line 10
    const/16 p0, 0x53

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    aput-byte p0, v0, v1

    .line 14
    .line 15
    const/16 p0, 0x48

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    aput-byte p0, v0, v2

    .line 19
    .line 20
    const/4 p0, 0x2

    .line 21
    const/16 v3, 0x41

    .line 22
    .line 23
    aput-byte v3, v0, p0

    .line 24
    .line 25
    const/4 p0, 0x3

    .line 26
    const/16 v3, 0x33

    .line 27
    .line 28
    aput-byte v3, v0, p0

    .line 29
    .line 30
    const/4 p0, 0x4

    .line 31
    aput-byte v2, v0, p0

    .line 32
    .line 33
    const/4 p0, 0x5

    .line 34
    aput-byte v1, v0, p0

    .line 35
    .line 36
    const/16 p0, 0x8

    .line 37
    .line 38
    invoke-static {p1, p2, v0, p0}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->wordToBytes(J[BI)V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public getBytes()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/SkeinEngine$Configuration;->bytes:[B

    .line 2
    .line 3
    return-object p0
.end method
