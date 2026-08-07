.class public interface abstract Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "FrameCallback"
.end annotation


# virtual methods
.method public abstract onReadClose(ILjava/lang/String;)V
.end method

.method public abstract onReadMessage(Lcom/tencent/cloud/ai/network/okio/ByteString;)V
.end method

.method public abstract onReadMessage(Ljava/lang/String;)V
.end method

.method public abstract onReadPing(Lcom/tencent/cloud/ai/network/okio/ByteString;)V
.end method

.method public abstract onReadPong(Lcom/tencent/cloud/ai/network/okio/ByteString;)V
.end method
