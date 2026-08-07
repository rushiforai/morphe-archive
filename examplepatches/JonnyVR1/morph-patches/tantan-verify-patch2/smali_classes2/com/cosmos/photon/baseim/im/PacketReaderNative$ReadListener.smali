.class public interface abstract Lcom/cosmos/photon/baseim/im/PacketReaderNative$ReadListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/baseim/im/PacketReaderNative;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ReadListener"
.end annotation


# virtual methods
.method public abstract onReadError(I)V
.end method

.method public abstract onReadPacket(Ljava/lang/String;)V
.end method
