.class Lorg/fourthline/cling/support/messagebox/parser/MessageDOMParser$1;
.super Lorg/seamless/xml/NamespaceContextMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/messagebox/parser/MessageDOMParser;->createDefaultNamespaceContext([Ljava/lang/String;)Lorg/seamless/xml/NamespaceContextMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/messagebox/parser/MessageDOMParser;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/messagebox/parser/MessageDOMParser;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/messagebox/parser/MessageDOMParser$1;->this$0:Lorg/fourthline/cling/support/messagebox/parser/MessageDOMParser;

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
    const-string p0, "urn:samsung-com:messagebox-1-0"

    .line 2
    .line 3
    return-object p0
.end method
