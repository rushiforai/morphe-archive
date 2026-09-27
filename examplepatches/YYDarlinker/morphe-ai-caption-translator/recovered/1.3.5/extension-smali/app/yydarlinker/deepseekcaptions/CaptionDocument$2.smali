.class Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;
.super Ljava/lang/Object;
.source "CaptionDocument.java"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parseXml([B)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cueNodes:Ljava/util/List;

.field final synthetic val$cues:Ljava/util/List;

.field final synthetic val$document:Lorg/w3c/dom/Document;

.field final synthetic val$texts:Ljava/util/List;


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Lorg/w3c/dom/Document;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 177
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;->val$texts:Ljava/util/List;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;->val$cues:Ljava/util/List;

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;->val$cueNodes:Ljava/util/List;

    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;->val$document:Lorg/w3c/dom/Document;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public contentType()Ljava/lang/String;
    .registers 1

    .line 180
    const-string p0, "application/xml; charset=utf-8"

    return-object p0
.end method

.method public cues()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;",
            ">;"
        }
    .end annotation

    .line 179
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;->val$cues:Ljava/util/List;

    return-object p0
.end method

.method public render(Ljava/util/List;)[B
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 184
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;->val$texts:Ljava/util/List;

    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->-$$Nest$smrequireSameSize(Ljava/util/List;Ljava/util/List;)V

    const/4 v0, 0x0

    .line 185
    :goto_6
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;->val$cueNodes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_22

    .line 186
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;->val$cueNodes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Node;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/w3c/dom/Node;->setTextContent(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 189
    :cond_22
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object p1

    .line 190
    invoke-virtual {p1}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object p1

    .line 191
    const-string v0, "encoding"

    const-string v1, "UTF-8"

    invoke-virtual {p1, v0, v1}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    const-string v0, "omit-xml-declaration"

    const-string v1, "no"

    invoke-virtual {p1, v0, v1}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 194
    new-instance v1, Ljavax/xml/transform/dom/DOMSource;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;->val$document:Lorg/w3c/dom/Document;

    invoke-direct {v1, p0}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    new-instance p0, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {p0, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {p1, v1, p0}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 195
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method public texts()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 178
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;->val$texts:Ljava/util/List;

    return-object p0
.end method
