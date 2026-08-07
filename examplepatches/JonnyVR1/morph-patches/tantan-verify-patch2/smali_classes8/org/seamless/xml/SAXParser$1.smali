.class Lorg/seamless/xml/SAXParser$1;
.super Ljava/util/HashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/seamless/xml/SAXParser;->createSchema([Ljavax/xml/transform/Source;)Ljavax/xml/validation/Schema;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/net/URI;",
        "Ljava/net/URL;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/seamless/xml/SAXParser;


# direct methods
.method public constructor <init>(Lorg/seamless/xml/SAXParser;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lorg/seamless/xml/SAXParser$1;->this$0:Lorg/seamless/xml/SAXParser;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lorg/seamless/xml/SAXParser;->XML_SCHEMA_NAMESPACE:Ljava/net/URI;

    .line 7
    .line 8
    sget-object v0, Lorg/seamless/xml/SAXParser;->XML_SCHEMA_RESOURCE:Ljava/net/URL;

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    return-void
.end method
