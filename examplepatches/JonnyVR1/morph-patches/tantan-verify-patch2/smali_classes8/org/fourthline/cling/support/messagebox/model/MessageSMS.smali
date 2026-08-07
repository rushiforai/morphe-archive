.class public Lorg/fourthline/cling/support/messagebox/model/MessageSMS;
.super Lorg/fourthline/cling/support/messagebox/model/Message;
.source "SourceFile"


# instance fields
.field private final body:Ljava/lang/String;

.field private final receiveTime:Lorg/fourthline/cling/support/messagebox/model/DateTime;

.field private final receiver:Lorg/fourthline/cling/support/messagebox/model/NumberName;

.field private final sender:Lorg/fourthline/cling/support/messagebox/model/NumberName;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/messagebox/model/DateTime;Lorg/fourthline/cling/support/messagebox/model/NumberName;Lorg/fourthline/cling/support/messagebox/model/NumberName;Ljava/lang/String;)V
    .locals 6

    .line 15
    sget-object v1, Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;->MAXIMUM:Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;-><init>(Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;Lorg/fourthline/cling/support/messagebox/model/DateTime;Lorg/fourthline/cling/support/messagebox/model/NumberName;Lorg/fourthline/cling/support/messagebox/model/NumberName;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;Lorg/fourthline/cling/support/messagebox/model/DateTime;Lorg/fourthline/cling/support/messagebox/model/NumberName;Lorg/fourthline/cling/support/messagebox/model/NumberName;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/messagebox/model/Message$Category;->SMS:Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lorg/fourthline/cling/support/messagebox/model/Message;-><init>(Lorg/fourthline/cling/support/messagebox/model/Message$Category;Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;)V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->receiveTime:Lorg/fourthline/cling/support/messagebox/model/DateTime;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->receiver:Lorg/fourthline/cling/support/messagebox/model/NumberName;

    .line 9
    .line 10
    iput-object p4, p0, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->sender:Lorg/fourthline/cling/support/messagebox/model/NumberName;

    .line 11
    .line 12
    iput-object p5, p0, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->body:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/messagebox/model/NumberName;Lorg/fourthline/cling/support/messagebox/model/NumberName;Ljava/lang/String;)V
    .locals 1

    .line 16
    new-instance v0, Lorg/fourthline/cling/support/messagebox/model/DateTime;

    invoke-direct {v0}, Lorg/fourthline/cling/support/messagebox/model/DateTime;-><init>()V

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;-><init>(Lorg/fourthline/cling/support/messagebox/model/DateTime;Lorg/fourthline/cling/support/messagebox/model/NumberName;Lorg/fourthline/cling/support/messagebox/model/NumberName;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public appendMessageElements(Lorg/fourthline/cling/support/messagebox/parser/MessageElement;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->getReceiveTime()Lorg/fourthline/cling/support/messagebox/model/DateTime;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "ReceiveTime"

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lorg/fourthline/cling/support/messagebox/model/DateTime;->appendMessageElements(Lorg/fourthline/cling/support/messagebox/parser/MessageElement;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->getReceiver()Lorg/fourthline/cling/support/messagebox/model/NumberName;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "Receiver"

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lorg/fourthline/cling/support/messagebox/model/NumberName;->appendMessageElements(Lorg/fourthline/cling/support/messagebox/parser/MessageElement;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->getSender()Lorg/fourthline/cling/support/messagebox/model/NumberName;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "Sender"

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lorg/fourthline/cling/support/messagebox/model/NumberName;->appendMessageElements(Lorg/fourthline/cling/support/messagebox/parser/MessageElement;)V

    .line 44
    .line 45
    .line 46
    const-string v0, "Body"

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 53
    .line 54
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->getBody()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1, p0}, Lorg/seamless/xml/DOMElement;->setContent(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public getBody()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->body:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReceiveTime()Lorg/fourthline/cling/support/messagebox/model/DateTime;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->receiveTime:Lorg/fourthline/cling/support/messagebox/model/DateTime;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReceiver()Lorg/fourthline/cling/support/messagebox/model/NumberName;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->receiver:Lorg/fourthline/cling/support/messagebox/model/NumberName;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSender()Lorg/fourthline/cling/support/messagebox/model/NumberName;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/MessageSMS;->sender:Lorg/fourthline/cling/support/messagebox/model/NumberName;

    .line 2
    .line 3
    return-object p0
.end method
