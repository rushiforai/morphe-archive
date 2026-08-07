.class public Lorg/seamless/xhtml/Link;
.super Lorg/seamless/xhtml/XHTMLElement;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ljavax/xml/xpath/XPath;Lorg/w3c/dom/Element;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/seamless/xhtml/XHTMLElement;-><init>(Ljavax/xml/xpath/XPath;Lorg/w3c/dom/Element;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getHref()Lorg/seamless/xhtml/Href;
    .locals 1

    .line 1
    sget-object v0, Lorg/seamless/xhtml/XHTML$ATTR;->href:Lorg/seamless/xhtml/XHTML$ATTR;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/seamless/xhtml/XHTMLElement;->getAttribute(Lorg/seamless/xhtml/XHTML$ATTR;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lorg/seamless/xhtml/Href;->fromString(Ljava/lang/String;)Lorg/seamless/xhtml/Href;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getRel()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lorg/seamless/xhtml/XHTML$ATTR;->rel:Lorg/seamless/xhtml/XHTML$ATTR;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/seamless/xhtml/XHTMLElement;->getAttribute(Lorg/seamless/xhtml/XHTML$ATTR;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRev()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lorg/seamless/xhtml/XHTML$ATTR;->rev:Lorg/seamless/xhtml/XHTML$ATTR;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/seamless/xhtml/XHTMLElement;->getAttribute(Lorg/seamless/xhtml/XHTML$ATTR;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
