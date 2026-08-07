.class public abstract Lorg/fourthline/cling/support/messagebox/model/Message;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/support/messagebox/model/ElementAppender;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;,
        Lorg/fourthline/cling/support/messagebox/model/Message$Category;
    }
.end annotation


# instance fields
.field private final category:Lorg/fourthline/cling/support/messagebox/model/Message$Category;

.field private displayType:Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;

.field private final id:I

.field protected final randomGenerator:Ljava/util/Random;


# direct methods
.method public constructor <init>(ILorg/fourthline/cling/support/messagebox/model/Message$Category;Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/Random;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/fourthline/cling/support/messagebox/model/Message;->randomGenerator:Ljava/util/Random;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const p1, 0x7fffffff

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/util/Random;->nextInt(I)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    :cond_0
    iput p1, p0, Lorg/fourthline/cling/support/messagebox/model/Message;->id:I

    .line 21
    .line 22
    iput-object p2, p0, Lorg/fourthline/cling/support/messagebox/model/Message;->category:Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 23
    .line 24
    iput-object p3, p0, Lorg/fourthline/cling/support/messagebox/model/Message;->displayType:Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;

    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/messagebox/model/Message$Category;Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;)V
    .locals 1

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, v0, p1, p2}, Lorg/fourthline/cling/support/messagebox/model/Message;-><init>(ILorg/fourthline/cling/support/messagebox/model/Message$Category;Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lorg/fourthline/cling/support/messagebox/model/Message;

    .line 20
    .line 21
    iget p0, p0, Lorg/fourthline/cling/support/messagebox/model/Message;->id:I

    .line 22
    .line 23
    iget p1, p1, Lorg/fourthline/cling/support/messagebox/model/Message;->id:I

    .line 24
    .line 25
    if-eq p0, p1, :cond_2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_2
    return v0

    .line 29
    :cond_3
    :goto_0
    return v1
.end method

.method public getCategory()Lorg/fourthline/cling/support/messagebox/model/Message$Category;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/Message;->category:Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDisplayType()Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/messagebox/model/Message;->displayType:Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getId()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/support/messagebox/model/Message;->id:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/support/messagebox/model/Message;->id:I

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Lorg/fourthline/cling/support/messagebox/parser/MessageDOMParser;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/fourthline/cling/support/messagebox/parser/MessageDOMParser;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1}, Lorg/seamless/xml/DOMParser;->createDocument()Lorg/seamless/xml/DOM;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    check-cast v2, Lorg/fourthline/cling/support/messagebox/parser/MessageDOM;

    .line 13
    .line 14
    invoke-virtual {v1}, Lorg/fourthline/cling/support/messagebox/parser/MessageDOMParser;->createXPath()Ljavax/xml/xpath/XPath;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    const-string v4, "Message"

    .line 19
    .line 20
    invoke-virtual {v2, v3, v4}, Lorg/fourthline/cling/support/messagebox/parser/MessageDOM;->createRoot(Ljavax/xml/xpath/XPath;Ljava/lang/String;)Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const-string v4, "Category"

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    check-cast v4, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 31
    .line 32
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/Message;->getCategory()Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    iget-object v5, v5, Lorg/fourthline/cling/support/messagebox/model/Message$Category;->text:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v4, v5}, Lorg/seamless/xml/DOMElement;->setContent(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 39
    .line 40
    .line 41
    const-string v4, "DisplayType"

    .line 42
    .line 43
    invoke-virtual {v3, v4}, Lorg/seamless/xml/DOMElement;->createChild(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 48
    .line 49
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/model/Message;->getDisplayType()Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    iget-object v5, v5, Lorg/fourthline/cling/support/messagebox/model/Message$DisplayType;->text:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v4, v5}, Lorg/seamless/xml/DOMElement;->setContent(Ljava/lang/String;)Lorg/seamless/xml/DOMElement;

    .line 56
    .line 57
    .line 58
    invoke-interface {p0, v3}, Lorg/fourthline/cling/support/messagebox/model/ElementAppender;->appendMessageElements(Lorg/fourthline/cling/support/messagebox/parser/MessageElement;)V

    .line 59
    .line 60
    .line 61
    const/4 p0, 0x0

    .line 62
    invoke-virtual {v1, v2, p0, p0}, Lorg/seamless/xml/DOMParser;->print(Lorg/seamless/xml/DOM;IZ)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v1, "<Message xmlns=\"urn:samsung-com:messagebox-1-0\">"

    .line 67
    .line 68
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string v1, "</Message>"

    .line 73
    .line 74
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0
    :try_end_0
    .catch Lorg/seamless/xml/ParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    return-object p0

    .line 79
    :catch_0
    move-exception p0

    .line 80
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    const/4 p0, 0x0

    .line 84
    return-object p0
.end method
