.class Lcom/cosmos/photon/baseim/im/PacketWriterNative;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/baseim/im/PacketWriterNative$WriteListener;
    }
.end annotation


# instance fields
.field private nativePtr:J


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativeCreate(I)J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativePtr:J

    .line 9
    .line 10
    return-void
.end method

.method private native nativeCreate(I)J
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeSetPacketSecurity(JLcom/cosmos/photon/baseim/im/ISecurity;)V
.end method

.method private native nativeSetPacketWrapper(JLcom/cosmos/photon/baseim/im/IPacketWrapper;)V
.end method

.method private native nativeSetWriteListener(JLcom/cosmos/photon/baseim/im/PacketWriterNative$WriteListener;)V
.end method

.method private native nativeStart(J)V
.end method

.method private native nativeStop(J)V
.end method

.method private native nativeWriteIMJPacket(JILjava/lang/String;)V
.end method

.method private native nativeWritePacket(J[B[B)V
.end method


# virtual methods
.method public setPacketWrapper(Lcom/cosmos/photon/baseim/im/IPacketWrapper;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativePtr:J

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
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativeSetPacketWrapper(JLcom/cosmos/photon/baseim/im/IPacketWrapper;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "already released"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setSecurity(Lcom/cosmos/photon/baseim/im/ISecurity;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativeSetPacketSecurity(JLcom/cosmos/photon/baseim/im/ISecurity;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setWriteListener(Lcom/cosmos/photon/baseim/im/PacketWriterNative$WriteListener;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativePtr:J

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
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativeSetWriteListener(JLcom/cosmos/photon/baseim/im/PacketWriterNative$WriteListener;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "already released"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public start()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativePtr:J

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
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativeStart(J)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "already released"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public stop()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativePtr:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativeStop(J)V

    .line 10
    .line 11
    .line 12
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativePtr:J

    .line 13
    .line 14
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativeRelease(J)V

    .line 15
    .line 16
    .line 17
    iput-wide v2, p0, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativePtr:J

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p0, "already released"

    .line 21
    .line 22
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public writePacket(ILjava/lang/String;)V
    .locals 4

    .line 28
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativePtr:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 29
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativeWriteIMJPacket(JILjava/lang/String;)V

    return-void

    .line 30
    :cond_0
    const-string p0, "already released"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return-void
.end method

.method public writePacket([B[B)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativePtr:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_2

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    new-array p1, v2, [B

    .line 13
    .line 14
    :cond_0
    if-nez p2, :cond_1

    .line 15
    .line 16
    new-array p2, v2, [B

    .line 17
    .line 18
    :cond_1
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/cosmos/photon/baseim/im/PacketWriterNative;->nativeWritePacket(J[B[B)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_2
    const-string p0, "already released"

    .line 23
    .line 24
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
