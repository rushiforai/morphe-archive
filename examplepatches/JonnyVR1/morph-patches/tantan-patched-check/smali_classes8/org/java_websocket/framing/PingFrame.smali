.class public Lorg/java_websocket/framing/PingFrame;
.super Lorg/java_websocket/framing/ControlFrame;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, Lorg/java_websocket/framing/Framedata$Opcode;->PING:Lorg/java_websocket/framing/Framedata$Opcode;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lorg/java_websocket/framing/ControlFrame;-><init>(Lorg/java_websocket/framing/Framedata$Opcode;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
