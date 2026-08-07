.class public abstract Lorg/seamless/xml/DOM;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CDATA_BEGIN:Ljava/lang/String; = "<![CDATA["

.field public static final CDATA_END:Ljava/lang/String; = "]]>"

.field public static final XML_SCHEMA_NAMESPACE:Ljava/net/URI;


# instance fields
.field private dom:Lorg/w3c/dom/Document;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "http://www.w3.org/2001/xml.xsd"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/seamless/xml/DOM;->XML_SCHEMA_NAMESPACE:Ljava/net/URI;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lorg/w3c/dom/Document;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/seamless/xml/DOM;->dom:Lorg/w3c/dom/Document;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public abstract copy()Lorg/seamless/xml/DOM;
.end method

.method public createRoot(Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/seamless/xml/DOM;->getW3CDocument()Lorg/w3c/dom/Document;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lorg/seamless/xml/DOM;->getRootElementNamespace()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1, p1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Lorg/seamless/xml/DOM;->getW3CDocument()Lorg/w3c/dom/Document;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0, p1}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 18
    .line 19
    .line 20
    return-object p1
.end method

.method public abstract getRoot(Ljavax/xml/xpath/XPath;)Lorg/seamless/xml/DOMElement;
.end method

.method public abstract getRootElementNamespace()Ljava/lang/String;
.end method

.method public getW3CDocument()Lorg/w3c/dom/Document;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/xml/DOM;->dom:Lorg/w3c/dom/Document;

    .line 2
    .line 3
    return-object p0
.end method
