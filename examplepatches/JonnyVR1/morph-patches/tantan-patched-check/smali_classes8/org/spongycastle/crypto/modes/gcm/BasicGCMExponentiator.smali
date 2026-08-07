.class public Lorg/spongycastle/crypto/modes/gcm/BasicGCMExponentiator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;


# instance fields
.field private x:[I


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


# virtual methods
.method public exponentiateX(J[B)V
    .locals 5

    .line 1
    invoke-static {}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->oneAsInts()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    cmp-long v3, p1, v1

    .line 8
    .line 9
    if-lez v3, :cond_2

    .line 10
    .line 11
    iget-object p0, p0, Lorg/spongycastle/crypto/modes/gcm/BasicGCMExponentiator;->x:[I

    .line 12
    .line 13
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_0
    const-wide/16 v3, 0x1

    .line 18
    .line 19
    and-long/2addr v3, p1

    .line 20
    cmp-long v3, v3, v1

    .line 21
    .line 22
    if-eqz v3, :cond_1

    .line 23
    .line 24
    invoke-static {v0, p0}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->multiply([I[I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-static {p0, p0}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->multiply([I[I)V

    .line 28
    .line 29
    .line 30
    const/4 v3, 0x1

    .line 31
    ushr-long/2addr p1, v3

    .line 32
    cmp-long v3, p1, v1

    .line 33
    .line 34
    if-gtz v3, :cond_0

    .line 35
    .line 36
    :cond_2
    invoke-static {v0, p3}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->asBytes([I[B)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public init([B)V
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->asInts([B)[I

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/gcm/BasicGCMExponentiator;->x:[I

    .line 6
    .line 7
    return-void
.end method
