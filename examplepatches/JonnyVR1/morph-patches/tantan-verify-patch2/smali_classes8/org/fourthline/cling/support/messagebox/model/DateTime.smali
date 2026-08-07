.class public Lorg/fourthline/cling/support/messagebox/model/DateTime;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/support/messagebox/model/ElementAppender;


# instance fields
.field private final date:Ljava/lang/String;

.field private final time:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-static {}, Lorg/fourthline/cling/support/messagebox/model/DateTime;->getCurrentDate()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lorg/fourthline/cling/support/messagebox/model/DateTime;->getCurrentTime()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0, v0, v1}, Lorg/fourthline/cling/support/messagebox/model/DateTime;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lorg/fourthline/cling/support/messagebox/model/DateTime;->date:Ljava/lang/String;

    .line 15
    iput-object p2, p0, Lorg/fourthline/cling/support/messagebox/model/DateTime;->time:Ljava/lang/String;

    return-void
.end method

.method public static getCurrentDate()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "yyyy-MM-dd"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/util/Date;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method public static getCurrentTime()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "HH:mm:ss"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/util/Date;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method


# virtual methods
.method public appendMessageElements(Lorg/fourthline/cling/support/messagebox/parser/MessageElement;)V
    .locals 2

    .line 1
    const-string v0, "Date"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/DateTime;->getDate()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lorg/seamless/xml/DOMElement;->setContent(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 14
    .line 15
    .line 16
    const-string v0, "Time"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/DateTime;->getTime()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Lorg/seamless/xml/DOMElement;->setContent(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public getDate()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/DateTime;->date:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTime()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/DateTime;->time:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
