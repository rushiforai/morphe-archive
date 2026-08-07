.class Lorg/seamless/xhtml/Root$2;
.super Lorg/seamless/xml/DOMElement$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/seamless/xhtml/Root;->getBody()Lorg/seamless/xhtml/Body;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/seamless/xml/DOMElement<",
        "Lorg/seamless/xhtml/XHTMLElement;",
        "Lorg/seamless/xhtml/XHTMLElement;",
        ">.Builder<",
        "Lorg/seamless/xhtml/Body;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/seamless/xhtml/Root;


# direct methods
.method public constructor <init>(Lorg/seamless/xhtml/Root;Lorg/seamless/xml/DOMElement;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/xhtml/Root$2;->this$0:Lorg/seamless/xhtml/Root;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lorg/seamless/xml/DOMElement$Builder;-><init>(Lorg/seamless/xml/DOMElement;Lorg/seamless/xml/DOMElement;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public build(Lorg/w3c/dom/Element;)Lorg/seamless/xhtml/Body;
    .locals 1

    .line 1
    new-instance v0, Lorg/seamless/xhtml/Body;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/seamless/xhtml/Root$2;->this$0:Lorg/seamless/xhtml/Root;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/seamless/xml/DOMElement;->getXpath()Ljavax/xml/xpath/XPath;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0, p1}, Lorg/seamless/xhtml/Body;-><init>(Ljavax/xml/xpath/XPath;Lorg/w3c/dom/Element;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public bridge synthetic build(Lorg/w3c/dom/Element;)Lorg/seamless/xml/DOMElement;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lorg/seamless/xhtml/Root$2;->build(Lorg/w3c/dom/Element;)Lorg/seamless/xhtml/Body;

    move-result-object p0

    return-object p0
.end method
