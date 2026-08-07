.class Lorg/seamless/xhtml/XHTMLParser$2;
.super Lorg/seamless/xml/NamespaceContextMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/seamless/xhtml/XHTMLParser;->createDefaultNamespaceContext([Ljava/lang/String;)Lorg/seamless/xml/NamespaceContextMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/seamless/xhtml/XHTMLParser;


# direct methods
.method public constructor <init>(Lorg/seamless/xhtml/XHTMLParser;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/xhtml/XHTMLParser$2;->this$0:Lorg/seamless/xhtml/XHTMLParser;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/seamless/xml/NamespaceContextMap;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getDefaultNamespaceURI()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "http://www.w3.org/1999/xhtml"

    .line 2
    .line 3
    return-object p0
.end method
