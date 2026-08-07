.class Lorg/seamless/xhtml/XHTMLParser$1;
.super Lorg/seamless/xml/DOMParser$NodeVisitor;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/seamless/xhtml/XHTMLParser;->checkDuplicateIdentifiers(Lorg/seamless/xhtml/XHTML;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/seamless/xhtml/XHTMLParser;

.field final synthetic val$identifiers:Ljava/util/Set;


# direct methods
.method public constructor <init>(Lorg/seamless/xhtml/XHTMLParser;SLjava/util/Set;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/xhtml/XHTMLParser$1;->this$0:Lorg/seamless/xhtml/XHTMLParser;

    .line 2
    .line 3
    iput-object p3, p0, Lorg/seamless/xhtml/XHTMLParser$1;->val$identifiers:Ljava/util/Set;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lorg/seamless/xml/DOMParser$NodeVisitor;-><init>(S)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public visit(Lorg/w3c/dom/Node;)V
    .locals 1

    .line 1
    check-cast p1, Lorg/w3c/dom/Element;

    .line 2
    .line 3
    sget-object v0, Lorg/seamless/xhtml/XHTML$ATTR;->id:Lorg/seamless/xhtml/XHTML$ATTR;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, ""

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lorg/seamless/xhtml/XHTMLParser$1;->val$identifiers:Ljava/util/Set;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lorg/seamless/xhtml/XHTMLParser$1;->val$identifiers:Ljava/util/Set;

    .line 30
    .line 31
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p0, "Duplicate identifier, override/change value: "

    .line 36
    .line 37
    invoke-static {p0, p1}, Ll/xtq0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method
