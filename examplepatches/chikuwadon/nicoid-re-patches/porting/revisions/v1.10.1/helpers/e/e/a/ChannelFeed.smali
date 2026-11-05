.class final Le/e/a/ChannelFeed;
.super Ljava/lang/Object;
.source "ChannelFeed.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ChannelFeed$Video;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static channelId(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 5
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    :cond_5
    const-string v1, "https?://ch\\.nicovideo\\.jp/(ch[0-9]+)(?:[/?#]|$)"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_1a

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    :cond_1a
    return-object v0
.end method

.method private static counts(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 17
    const-string v0, "(?i)<br\\s*/?>"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "<[^>]+>"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "&nbsp;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "&#160;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "(?:\u518d\u751f(?:\u6570)?|Views?)\\s*[:\uff1a]\\s*([0-9,]+)"

    invoke-static {p0, v0}, Le/e/a/ChannelFeed;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "(?:\u30b3\u30e1\u30f3\u30c8|\u30b3\u30e1|Comments?)\\s*[:\uff1a]\\s*([0-9,]+)"

    invoke-static {p0, v1}, Le/e/a/ChannelFeed;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "(?:\u30de\u30a4\u30ea\u30b9\u30c8|\u30de\u30a4\u30ea\u30b9|Mylists?)\\s*[:\uff1a]\\s*([0-9,]+)"

    invoke-static {p0, v2}, Le/e/a/ChannelFeed;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_63

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_63

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3f

    goto :goto_63

    :cond_3f
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u518d\u751f\u6570:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " \u30b3\u30e1\u30f3\u30c8:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u30de\u30a4\u30ea\u30b9\u30c8:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_63
    :goto_63
    const-string p0, ""

    return-object p0
.end method

.method private static date(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 16
    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "EEE, dd MMM yyyy HH:mm:ss z"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    if-nez v0, :cond_10

    return-object p0

    :cond_10
    new-instance v1, Ljava/lang/StringBuilder;

    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy\u5e74MM\u6708dd\u65e5 HH\u6642mm\u5206"

    sget-object v4, Ljava/util/Locale;->JAPAN:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v2, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, " \u6295\u7a3f"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_30} :catch_31

    return-object p0

    :catch_31
    move-exception v0

    return-object p0
.end method

.method static decode(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 8
    const-string v0, "&amp;"

    const-string v1, "&"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "&#x2F;"

    const-string v1, "/"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "&#47;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "&quot;"

    const-string v1, "\""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "&#39;"

    const-string v1, "\'"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 20
    new-instance p0, Lorg/xml/sax/InputSource;

    new-instance p1, Ljava/io/StringReader;

    const-string v0, ""

    invoke-direct {p1, v0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    return-object p0
.end method

.method static match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 9
    const/16 v0, 0x22

    invoke-static {p1, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    if-eqz p1, :cond_1e

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ChannelFeed;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_20

    :cond_1e
    const-string p0, ""

    :goto_20
    return-object p0
.end method

.method static parse(Ljava/lang/String;)Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Le/e/a/ChannelFeed$Video;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 19
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/high16 v1, 0x200000

    if-gt v0, v1, :cond_da

    const-string v0, "<!\\s*(?:DOCTYPE|ENTITY)"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_da

    .line 20
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setExpandEntityReferences(Z)V

    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    new-instance v2, Le/e/a/ChannelFeed$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Le/e/a/ChannelFeed$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {v0, v2}, Ljavax/xml/parsers/DocumentBuilder;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 21
    new-instance v2, Lorg/xml/sax/InputSource;

    new-instance v3, Ljava/io/StringReader;

    invoke-direct {v3, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v0, v2}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object p0

    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "rss"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d2

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    const-string v3, "item"

    invoke-interface {p0, v3}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object p0

    .line 23
    nop

    :goto_60
    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-lt v1, v3, :cond_67

    .line 24
    return-object v0

    .line 23
    :cond_67
    invoke-interface {p0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    new-instance v4, Le/e/a/ChannelFeed$Video;

    invoke-direct {v4}, Le/e/a/ChannelFeed$Video;-><init>()V

    const-string v5, "link"

    invoke-static {v3, v5}, Le/e/a/ChannelFeed;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "http://"

    const-string v7, "https://"

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/ChannelFeed$Video;->url:Ljava/lang/String;

    iget-object v5, v4, Le/e/a/ChannelFeed$Video;->url:Ljava/lang/String;

    const-string v6, "https://www\\.nicovideo\\.jp/watch/(?:sm|so|nm)?[0-9]+"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_8d

    :goto_8c
    goto :goto_cf

    :cond_8d
    iget-object v5, v4, Le/e/a/ChannelFeed$Video;->url:Ljava/lang/String;

    invoke-static {v5}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    iget-object v5, v4, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_9e

    goto :goto_8c

    :cond_9e
    const-string v5, "title"

    invoke-static {v3, v5}, Le/e/a/ChannelFeed;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/ChannelFeed$Video;->title:Ljava/lang/String;

    const-string v5, "pubDate"

    invoke-static {v3, v5}, Le/e/a/ChannelFeed;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le/e/a/ChannelFeed;->date(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/ChannelFeed$Video;->date:Ljava/lang/String;

    const-string v5, "description"

    invoke-static {v3, v5}, Le/e/a/ChannelFeed;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Le/e/a/ChannelFeed;->thumbnail(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v4, Le/e/a/ChannelFeed$Video;->image:Ljava/lang/String;

    const-string v3, "class=[\"\']nico-info-length[\"\'][^>]*>([^<]+)"

    invoke-static {v5, v3}, Le/e/a/ChannelFeed;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v4, Le/e/a/ChannelFeed$Video;->length:Ljava/lang/String;

    invoke-static {v5}, Le/e/a/ChannelFeed;->counts(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v4, Le/e/a/ChannelFeed$Video;->counts:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_cf
    add-int/lit8 v1, v1, 0x1

    goto :goto_60

    .line 21
    :cond_d2
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Not a channel feed"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 19
    :cond_da
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Unsupported XML declaration"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 7
    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-nez v1, :cond_10

    const-string v0, "*"

    invoke-interface {p0, v0, p1}, Lorg/w3c/dom/Element;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    :cond_10
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result p0

    if-nez p0, :cond_19

    const-string p0, ""

    goto :goto_26

    :cond_19
    const/4 p0, 0x0

    invoke-interface {v0, p0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object p0

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :goto_26
    return-object p0
.end method

.method private static thumbnail(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    .line 11
    const-string v0, "*"

    invoke-interface {p0, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object p0

    const/4 v0, 0x0

    :goto_7
    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    const-string v2, "https:"

    const-string v3, "//"

    const-string v4, "https://"

    const-string v5, "http://"

    if-lt v0, v1, :cond_3f

    .line 12
    const-string p0, "<(?:img|source)\\b[^>]*?\\b(?:src|data-src|data-original)\\s*=\\s*[\"\']([^\"\']+)"

    invoke-static {p1, p0}, Le/e/a/ChannelFeed;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_27

    const-string p0, "\\b(?:src|data-src|data-original)\\s*=\\s*[\"\']([^\"\']+)"

    invoke-static {p1, p0}, Le/e/a/ChannelFeed;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 14
    :cond_27
    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3a

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_3a
    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 11
    :cond_3f
    invoke-interface {p0, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-interface {v1}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_4f

    invoke-interface {v1}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v6

    :cond_4f
    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "thumbnail"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_97

    const-string v6, "url"

    invoke-interface {v1, v6}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_6f

    const-string v6, "href"

    invoke-interface {v1, v6}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :cond_6f
    invoke-virtual {v6, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_82

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :cond_82
    invoke-virtual {v6, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8e

    invoke-virtual {v6, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_97

    :cond_8e
    invoke-static {v6}, Le/e/a/ChannelFeed;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_97
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_7
.end method
