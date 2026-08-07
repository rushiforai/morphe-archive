.class public Lorg/java_websocket/framing/TextFrame;
.super Lorg/java_websocket/framing/DataFrame;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, Lorg/java_websocket/framing/Framedata$Opcode;->TEXT:Lorg/java_websocket/framing/Framedata$Opcode;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lorg/java_websocket/framing/DataFrame;-><init>(Lorg/java_websocket/framing/Framedata$Opcode;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public isValid()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/java_websocket/exceptions/InvalidDataException;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lorg/java_websocket/framing/DataFrame;->isValid()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lorg/java_websocket/framing/FramedataImpl1;->getPayloadData()Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0}, Lorg/java_websocket/util/Charsetfunctions;->isValidUTF8(Ljava/nio/ByteBuffer;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance p0, Lorg/java_websocket/exceptions/InvalidDataException;

    .line 16
    .line 17
    const/16 v0, 0x3ef

    .line 18
    .line 19
    const-string v1, "Received text is no valid utf8 string!"

    .line 20
    .line 21
    invoke-direct {p0, v0, v1}, Lorg/java_websocket/exceptions/InvalidDataException;-><init>(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p0
.end method
