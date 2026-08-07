.class public Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;
.super Lorg/fourthline/cling/support/messagebox/model/Message;
.source "SourceFile"


# instance fields
.field private final body:Ljava/lang/String;

.field private final endTime:Lorg/fourthline/cling/support/messagebox/model/DateTime;

.field private final location:Ljava/lang/String;

.field private final owner:Lorg/fourthline/cling/support/messagebox/model/NumberName;

.field private final startTime:Lorg/fourthline/cling/support/messagebox/model/DateTime;

.field private final subject:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/messagebox/model/DateTime;Lorg/fourthline/cling/support/messagebox/model/NumberName;Ljava/lang/String;Lorg/fourthline/cling/support/messagebox/model/DateTime;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 19
    sget-object v1, Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;->MAXIMUM:Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;-><init>(Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;Lorg/fourthline/cling/support/messagebox/model/DateTime;Lorg/fourthline/cling/support/messagebox/model/NumberName;Ljava/lang/String;Lorg/fourthline/cling/support/messagebox/model/DateTime;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;Lorg/fourthline/cling/support/messagebox/model/DateTime;Lorg/fourthline/cling/support/messagebox/model/NumberName;Ljava/lang/String;Lorg/fourthline/cling/support/messagebox/model/DateTime;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/messagebox/model/Message$Category;->SCHEDULE_REMINDER:Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lorg/fourthline/cling/support/messagebox/model/Message;-><init>(Lorg/fourthline/cling/support/messagebox/model/Message$Category;Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;)V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->startTime:Lorg/fourthline/cling/support/messagebox/model/DateTime;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->owner:Lorg/fourthline/cling/support/messagebox/model/NumberName;

    .line 9
    .line 10
    iput-object p4, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->subject:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->endTime:Lorg/fourthline/cling/support/messagebox/model/DateTime;

    .line 13
    .line 14
    iput-object p6, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->location:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p7, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->body:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public appendMessageElements(Lorg/fourthline/cling/support/messagebox/parser/MessageElement;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->getStartTime()Lorg/fourthline/cling/support/messagebox/model/DateTime;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "StartTime"

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
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->getOwner()Lorg/fourthline/cling/support/messagebox/model/NumberName;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "Owner"

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
    const-string v0, "Subject"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 38
    .line 39
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->getSubject()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lorg/seamless/xml/DOMElement;->setContent(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->getEndTime()Lorg/fourthline/cling/support/messagebox/model/DateTime;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "EndTime"

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lorg/fourthline/cling/support/messagebox/model/DateTime;->appendMessageElements(Lorg/fourthline/cling/support/messagebox/parser/MessageElement;)V

    .line 59
    .line 60
    .line 61
    const-string v0, "Location"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 68
    .line 69
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->getLocation()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lorg/seamless/xml/DOMElement;->setContent(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 74
    .line 75
    .line 76
    const-string v0, "Body"

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 83
    .line 84
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->getBody()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p1, p0}, Lorg/seamless/xml/DOMElement;->setContent(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public getBody()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->body:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEndTime()Lorg/fourthline/cling/support/messagebox/model/DateTime;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->endTime:Lorg/fourthline/cling/support/messagebox/model/DateTime;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->location:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOwner()Lorg/fourthline/cling/support/messagebox/model/NumberName;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->owner:Lorg/fourthline/cling/support/messagebox/model/NumberName;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStartTime()Lorg/fourthline/cling/support/messagebox/model/DateTime;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->startTime:Lorg/fourthline/cling/support/messagebox/model/DateTime;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubject()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/MessageScheduleReminder;->subject:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
