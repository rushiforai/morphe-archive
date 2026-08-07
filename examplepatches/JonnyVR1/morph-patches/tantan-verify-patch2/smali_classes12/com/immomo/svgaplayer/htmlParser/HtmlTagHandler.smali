.class public final Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/Html$TagHandler;
.implements Landroid/text/Html$ImageGetter;
.implements Lorg/xml/sax/ContentHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000p\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0019\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 ?2\u00020\u00012\u00020\u00022\u00020\u0003:\u0001?B\r\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u000eH\u0002J \u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u00082\u0006\u0010\u001c\u001a\u00020\u0008H\u0016J\u0008\u0010\u001d\u001a\u00020\u0018H\u0016J \u0010\u001e\u001a\u00020\u00182\u0006\u0010\u001f\u001a\u00020\u000e2\u0006\u0010 \u001a\u00020\u000e2\u0006\u0010!\u001a\u00020\u000eH\u0016J \u0010\"\u001a\u00020\u00182\u0006\u0010#\u001a\u00020\u000e2\u0006\u0010$\u001a\u00020\u000b2\u0006\u0010%\u001a\u00020\u0010H\u0002J\u0010\u0010&\u001a\u00020\u00182\u0006\u0010\'\u001a\u00020\u000eH\u0016J\u0012\u0010(\u001a\u0004\u0018\u00010)2\u0006\u0010*\u001a\u00020\u000eH\u0016J(\u0010+\u001a\u00020\u00182\u0006\u0010,\u001a\u00020\u00152\u0006\u0010#\u001a\u00020\u000e2\u0006\u0010$\u001a\u00020\u000b2\u0006\u0010%\u001a\u00020\u0010H\u0016J \u0010-\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u00082\u0006\u0010\u001c\u001a\u00020\u0008H\u0016J\u0018\u0010.\u001a\u00020\u00182\u0006\u0010/\u001a\u00020\u000e2\u0006\u00100\u001a\u00020\u000eH\u0016J\u0016\u00101\u001a\u00020\u00182\u0006\u0010\u0016\u001a\u00020\u000e2\u0006\u00102\u001a\u00020\u0013J\u0010\u00103\u001a\u00020\u00182\u0006\u00104\u001a\u000205H\u0016J\u0010\u00106\u001a\u00020\u00182\u0006\u00107\u001a\u00020\u000eH\u0016J\u0008\u00108\u001a\u00020\u0018H\u0016J(\u00109\u001a\u00020\u00182\u0006\u0010\u001f\u001a\u00020\u000e2\u0006\u0010 \u001a\u00020\u000e2\u0006\u0010!\u001a\u00020\u000e2\u0006\u0010:\u001a\u00020;H\u0016J \u0010<\u001a\u00020\u00182\u0006\u0010#\u001a\u00020\u000e2\u0006\u0010$\u001a\u00020\u000b2\u0006\u0010%\u001a\u00020\u0010H\u0002J\u0018\u0010=\u001a\u00020\u00182\u0006\u0010\'\u001a\u00020\u000e2\u0006\u0010\u001f\u001a\u00020\u000eH\u0016J\u0010\u0010>\u001a\u0004\u0018\u00010\u00132\u0006\u0010\u0016\u001a\u00020\u000eR\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u0004\u0018\u00010\u00038\u0002@\u0002X\u0083\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082.\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082.\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u00130\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006@"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;",
        "Landroid/text/Html$TagHandler;",
        "Landroid/text/Html$ImageGetter;",
        "Lorg/xml/sax/ContentHandler;",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "count",
        "",
        "originalContentHandler",
        "originalEditableText",
        "Landroid/text/Editable;",
        "originalTags",
        "",
        "",
        "originalXmlReader",
        "Lorg/xml/sax/XMLReader;",
        "tagHandlerMap",
        "",
        "Lcom/immomo/svgaplayer/htmlParser/HtmlTag;",
        "canHandleTag",
        "",
        "tagName",
        "characters",
        "",
        "ch",
        "",
        "start",
        "length",
        "endDocument",
        "endElement",
        "uri",
        "localName",
        "qName",
        "endHandleTag",
        "tag",
        "output",
        "xmlReader",
        "endPrefixMapping",
        "prefix",
        "getDrawable",
        "Landroid/graphics/drawable/Drawable;",
        "source",
        "handleTag",
        "opening",
        "ignorableWhitespace",
        "processingInstruction",
        "target",
        "data",
        "registerTag",
        "tagHandler",
        "setDocumentLocator",
        "locator",
        "Lorg/xml/sax/Locator;",
        "skippedEntity",
        "name",
        "startDocument",
        "startElement",
        "atts",
        "Lorg/xml/sax/Attributes;",
        "startHandleTag",
        "startPrefixMapping",
        "unregisterTag",
        "Companion",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# static fields
.field public static final Companion:Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler$Companion;

.field private static final FONT_TAG:Ljava/lang/String; = "font"

.field private static final H5_TAG:Ljava/lang/String; = "html"

.field private static final LOG_TAG:Ljava/lang/String; = "HtmlTagHandler"


# instance fields
.field private count:I

.field private volatile originalContentHandler:Lorg/xml/sax/ContentHandler;

.field private originalEditableText:Landroid/text/Editable;

.field private originalTags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private originalXmlReader:Lorg/xml/sax/XMLReader;

.field private final tagHandlerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/immomo/svgaplayer/htmlParser/HtmlTag;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->Companion:Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler$Companion;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lkotlin/text/Regex;

    .line 8
    .line 9
    const-string v1, "\\|"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v1, "br|p|ul|li|div|span|strong|b|em|cite|dnf|i|big|small|font|blockquote|tt|a|u|del|s|strike|sup|sub|h1|h2|h3|h4|h5|h6|img"

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v0, v1, v2}, Lkotlin/text/Regex;->split(Ljava/lang/CharSequence;I)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/util/Collection;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    new-array v2, v2, [Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    check-cast v0, [Ljava/lang/String;

    .line 35
    .line 36
    array-length v1, v0

    .line 37
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, [Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalTags:Ljava/util/List;

    .line 48
    .line 49
    new-instance v0, Landroid/util/ArrayMap;

    .line 50
    .line 51
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->tagHandlerMap:Ljava/util/Map;

    .line 55
    .line 56
    new-instance p0, Lcom/immomo/svgaplayer/htmlParser/FontTag;

    .line 57
    .line 58
    invoke-direct {p0, p1}, Lcom/immomo/svgaplayer/htmlParser/FontTag;-><init>(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    const-string p1, "font"

    .line 62
    .line 63
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    const-string p0, "null cannot be cast to non-null type kotlin.Array<T>"

    .line 68
    .line 69
    invoke-static {p0}, Lb;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    throw v1

    .line 73
    :cond_1
    const-string p0, "null cannot be cast to non-null type java.util.Collection<T>"

    .line 74
    .line 75
    invoke-static {p0}, Lb;->a(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw v1
.end method

.method private final canHandleTag(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->tagHandlerMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->tagHandlerMap:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    return v1
.end method

.method private final endHandleTag(Ljava/lang/String;Landroid/text/Editable;Lorg/xml/sax/XMLReader;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x1

    .line 5
    invoke-static {p1, p1, p2}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->count:I

    .line 12
    .line 13
    add-int/lit8 p1, p1, -0x1

    .line 14
    .line 15
    iput p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->count:I

    .line 16
    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalXmlReader:Lorg/xml/sax/XMLReader;

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    const-string p2, "originalXmlReader"

    .line 24
    .line 25
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p2, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 29
    .line 30
    invoke-interface {p1, p2}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 31
    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method private final startHandleTag(Ljava/lang/String;Landroid/text/Editable;Lorg/xml/sax/XMLReader;)V
    .locals 2

    .line 1
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    const-string v0, "html"

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {p1, v0, v1}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-interface {p3}, Lorg/xml/sax/XMLReader;->getContentHandler()Lorg/xml/sax/ContentHandler;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 22
    .line 23
    iput-object p3, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalXmlReader:Lorg/xml/sax/XMLReader;

    .line 24
    .line 25
    invoke-interface {p3, p0}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalEditableText:Landroid/text/Editable;

    .line 29
    .line 30
    :cond_0
    iget p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->count:I

    .line 31
    .line 32
    add-int/2addr p1, v1

    .line 33
    iput p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->count:I

    .line 34
    .line 35
    :cond_1
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 0
    .param p1    # [C
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1, p2, p3}, Lorg/xml/sax/ContentHandler;->characters([CII)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public endDocument()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lorg/xml/sax/ContentHandler;->endDocument()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    const-string v0, "html"

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {p2, v0, v1}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "originalEditableText"

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalEditableText:Landroid/text/Editable;

    .line 22
    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p3, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalXmlReader:Lorg/xml/sax/XMLReader;

    .line 29
    .line 30
    if-nez p3, :cond_1

    .line 31
    .line 32
    const-string v0, "originalXmlReader"

    .line 33
    .line 34
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, v0, p2, p1, p3}, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->handleTag(ZLjava/lang/String;Landroid/text/Editable;Lorg/xml/sax/XMLReader;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    invoke-direct {p0, p2}, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->canHandleTag(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_5

    .line 47
    .line 48
    iget-object p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->tagHandlerMap:Ljava/util/Map;

    .line 49
    .line 50
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;

    .line 55
    .line 56
    if-nez p1, :cond_3

    .line 57
    .line 58
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalEditableText:Landroid/text/Editable;

    .line 62
    .line 63
    if-nez p0, :cond_4

    .line 64
    .line 65
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_4
    invoke-virtual {p1, p0}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;->endHandleTag(Landroid/text/Editable;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_5
    iget-object v0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalTags:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_7

    .line 79
    .line 80
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 81
    .line 82
    if-nez p0, :cond_6

    .line 83
    .line 84
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 85
    .line 86
    .line 87
    :cond_6
    invoke-interface {p0, p1, p2, p3}, Lorg/xml/sax/ContentHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_7
    return-void
.end method

.method public endPrefixMapping(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lorg/xml/sax/ContentHandler;->endPrefixMapping(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0
.end method

.method public handleTag(ZLjava/lang/String;Landroid/text/Editable;Lorg/xml/sax/XMLReader;)V
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/text/Editable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lorg/xml/sax/XMLReader;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, p2, p3, p4}, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->startHandleTag(Ljava/lang/String;Landroid/text/Editable;Lorg/xml/sax/XMLReader;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-direct {p0, p2, p3, p4}, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->endHandleTag(Ljava/lang/String;Landroid/text/Editable;Lorg/xml/sax/XMLReader;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public ignorableWhitespace([CII)V
    .locals 0
    .param p1    # [C
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1, p2, p3}, Lorg/xml/sax/ContentHandler;->ignorableWhitespace([CII)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public processingInstruction(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Lorg/xml/sax/ContentHandler;->processingInstruction(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final registerTag(Ljava/lang/String;Lcom/immomo/svgaplayer/htmlParser/HtmlTag;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/immomo/svgaplayer/htmlParser/HtmlTag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->tagHandlerMap:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setDocumentLocator(Lorg/xml/sax/Locator;)V
    .locals 0
    .param p1    # Lorg/xml/sax/Locator;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lorg/xml/sax/ContentHandler;->setDocumentLocator(Lorg/xml/sax/Locator;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public skippedEntity(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lorg/xml/sax/ContentHandler;->skippedEntity(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public startDocument()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lorg/xml/sax/ContentHandler;->startDocument()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lorg/xml/sax/Attributes;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    const-string v0, "html"

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {p2, v0, v1}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const-string v2, "originalEditableText"

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    iget-object p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalEditableText:Landroid/text/Editable;

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p3, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalXmlReader:Lorg/xml/sax/XMLReader;

    .line 32
    .line 33
    if-nez p3, :cond_1

    .line 34
    .line 35
    const-string p4, "originalXmlReader"

    .line 36
    .line 37
    invoke-static {p4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p0, v1, p2, p1, p3}, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->handleTag(ZLjava/lang/String;Landroid/text/Editable;Lorg/xml/sax/XMLReader;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    invoke-direct {p0, p2}, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->canHandleTag(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_5

    .line 49
    .line 50
    iget-object p1, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->tagHandlerMap:Ljava/util/Map;

    .line 51
    .line 52
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;

    .line 57
    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 61
    .line 62
    .line 63
    :cond_3
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalEditableText:Landroid/text/Editable;

    .line 64
    .line 65
    if-nez p0, :cond_4

    .line 66
    .line 67
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_4
    invoke-virtual {p1, p0, p4}, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;->startHandleTag(Landroid/text/Editable;Lorg/xml/sax/Attributes;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_5
    iget-object v0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalTags:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_7

    .line 81
    .line 82
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 83
    .line 84
    if-nez p0, :cond_6

    .line 85
    .line 86
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 87
    .line 88
    .line 89
    :cond_6
    invoke-interface {p0, p1, p2, p3, p4}, Lorg/xml/sax/ContentHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    const-string p1, "\u65e0\u6cd5\u89e3\u6790\u8be5\u6807\u7b7e\uff1a<"

    .line 96
    .line 97
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const/16 p1, 0x3e

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const-string p1, "HtmlTagHandler"

    .line 113
    .line 114
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public startPrefixMapping(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->originalContentHandler:Lorg/xml/sax/ContentHandler;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Lorg/xml/sax/ContentHandler;->startPrefixMapping(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final unregisterTag(Ljava/lang/String;)Lcom/immomo/svgaplayer/htmlParser/HtmlTag;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTagHandler;->tagHandlerMap:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/immomo/svgaplayer/htmlParser/HtmlTag;

    .line 11
    .line 12
    return-object p0
.end method
