.class public Lcom/cosmos/photon/baseim/im/NativePacket;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/baseim/im/IPacket;


# instance fields
.field private nativePtr:J


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/cosmos/photon/baseim/im/NativePacket;->nativePtr:J

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(J)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-wide p1, p0, Lcom/cosmos/photon/baseim/im/NativePacket;->nativePtr:J

    return-void
.end method

.method private native nativeGetBody(J)[B
.end method

.method private native nativeGetHeader(J)[B
.end method


# virtual methods
.method public getBody()[B
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/NativePacket;->nativePtr:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/im/NativePacket;->nativeGetBody(J)[B

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method
