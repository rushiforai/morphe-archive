.class public Lorg/fourthline/cling/support/messagebox/parser/MessageDOM;
.super Lorg/seamless/xml/DOM;
.source "SourceFile"


# static fields
.field public static final NAMESPACE_URI:Ljava/lang/String; = "urn:samsung-com:messagebox-1-0"


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Document;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/seamless/xml/DOM;-><init>(Lorg/w3c/dom/Document;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public copy()Lorg/fourthline/cling/support/messagebox/parser/MessageDOM;
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/messagebox/parser/MessageDOM;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/seamless/xml/DOM;->getW3CDocument()Lorg/w3c/dom/Document;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-interface {p0, v1}, Lorg/w3c/dom/Node;->cloneNode(Z)Lorg/w3c/dom/Node;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lorg/w3c/dom/Document;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lorg/fourthline/cling/support/messagebox/parser/MessageDOM;-><init>(Lorg/w3c/dom/Document;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public bridge synthetic copy()Lorg/seamless/xml/DOM;
    .locals 0

    .line 18
    invoke-virtual {p0}, Lorg/fourthline/cling/support/messagebox/parser/MessageDOM;->copy()Lorg/fourthline/cling/support/messagebox/parser/MessageDOM;

    move-result-object p0

    return-object p0
.end method

.method public createRoot(Ljavax/xml/xpath/XPath;Ljava/lang/String;)Lorg/fourthline/cling/support/messagebox/parser/MessageElement;
    .locals 0

    .line 1
    invoke-super {p0, p2}, Lorg/seamless/xml/DOM;->createRoot(Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/messagebox/parser/MessageDOM;->getRoot(Ljavax/xml/xpath/XPath;)Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public getRoot(Ljavax/xml/xpath/XPath;)Lorg/fourthline/cling/support/messagebox/parser/MessageElement;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/seamless/xml/DOM;->getW3CDocument()Lorg/w3c/dom/Document;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, p1, p0}, Lorg/fourthline/cling/support/messagebox/parser/MessageElement;-><init>(Ljavax/xml/xpath/XPath;Lorg/w3c/dom/Element;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public bridge synthetic getRoot(Ljavax/xml/xpath/XPath;)Lorg/seamless/xml/DOMElement;
    .locals 0

    .line 15
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/messagebox/parser/MessageDOM;->getRoot(Ljavax/xml/xpath/XPath;)Lorg/fourthline/cling/support/messagebox/parser/MessageElement;

    move-result-object p0

    return-object p0
.end method

.method public getRootElementNamespace()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "urn:samsung-com:messagebox-1-0"

    .line 2
    .line 3
    return-object p0
.end method
