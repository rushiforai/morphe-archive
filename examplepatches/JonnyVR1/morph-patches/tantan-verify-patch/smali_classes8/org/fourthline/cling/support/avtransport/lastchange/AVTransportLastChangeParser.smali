.class public Lorg/fourthline/cling/support/avtransport/lastchange/AVTransportLastChangeParser;
.super Lorg/fourthline/cling/support/lastchange/LastChangeParser;
.source "SourceFile"


# static fields
.field public static final NAMESPACE_URI:Ljava/lang/String; = "urn:schemas-upnp-org:metadata-1-0/AVT/"

.field public static final SCHEMA_RESOURCE:Ljava/lang/String; = "org/fourthline/cling/support/avtransport/metadata-1.01-avt.xsd"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/fourthline/cling/support/lastchange/LastChangeParser;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getEventedVariables()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lorg/fourthline/cling/support/lastchange/EventedValue;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lorg/fourthline/cling/support/avtransport/lastchange/AVTransportVariable;->ALL:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "urn:schemas-upnp-org:metadata-1-0/AVT/"

    .line 2
    .line 3
    return-object p0
.end method

.method public getSchemaSources()[Ljavax/xml/transform/Source;
    .locals 2

    .line 1
    sget-boolean p0, Lorg/fourthline/cling/model/ModelUtil;->ANDROID_RUNTIME:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljavax/xml/transform/stream/StreamSource;

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "org/fourthline/cling/support/avtransport/metadata-1.01-avt.xsd"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {p0, v0}, Ljavax/xml/transform/stream/StreamSource;-><init>(Ljava/io/InputStream;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    new-array v0, v0, [Ljavax/xml/transform/Source;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    aput-object p0, v0, v1

    .line 29
    .line 30
    return-object v0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method
