.class public Lorg/fourthline/cling/model/message/IncomingDatagramMessage;
.super Lorg/fourthline/cling/model/message/UpnpMessage;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<O:",
        "Lorg/fourthline/cling/model/message/UpnpOperation;",
        ">",
        "Lorg/fourthline/cling/model/message/UpnpMessage<",
        "TO;>;"
    }
.end annotation


# instance fields
.field private localAddress:Ljava/net/InetAddress;

.field private sourceAddress:Ljava/net/InetAddress;

.field private sourcePort:I


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/message/IncomingDatagramMessage;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/fourthline/cling/model/message/IncomingDatagramMessage<",
            "TO;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lorg/fourthline/cling/model/message/UpnpMessage;-><init>(Lorg/fourthline/cling/model/message/UpnpMessage;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->getSourceAddress()Ljava/net/InetAddress;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->sourceAddress:Ljava/net/InetAddress;

    .line 9
    .line 10
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->getSourcePort()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->sourcePort:I

    .line 15
    .line 16
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->getLocalAddress()Ljava/net/InetAddress;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->localAddress:Ljava/net/InetAddress;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/message/UpnpOperation;Ljava/net/InetAddress;ILjava/net/InetAddress;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TO;",
            "Ljava/net/InetAddress;",
            "I",
            "Ljava/net/InetAddress;",
            ")V"
        }
    .end annotation

    .line 23
    invoke-direct {p0, p1}, Lorg/fourthline/cling/model/message/UpnpMessage;-><init>(Lorg/fourthline/cling/model/message/UpnpOperation;)V

    .line 24
    iput-object p2, p0, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->sourceAddress:Ljava/net/InetAddress;

    .line 25
    iput p3, p0, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->sourcePort:I

    .line 26
    iput-object p4, p0, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->localAddress:Ljava/net/InetAddress;

    return-void
.end method


# virtual methods
.method public getLocalAddress()Ljava/net/InetAddress;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->localAddress:Ljava/net/InetAddress;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSourceAddress()Ljava/net/InetAddress;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->sourceAddress:Ljava/net/InetAddress;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSourcePort()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->sourcePort:I

    .line 2
    .line 3
    return p0
.end method
