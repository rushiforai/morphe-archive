.class final Lcom/google/common/io/Resources$UrlByteSource;
.super Lcom/google/common/io/ByteSource;
.source "Resources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/Resources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UrlByteSource"
.end annotation


# instance fields
.field private final url:Ljava/net/URL;


# direct methods
.method private constructor <init>(Ljava/net/URL;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "url"
        }
    .end annotation

    .line 63
    invoke-direct {p0}, Lcom/google/common/io/ByteSource;-><init>()V

    .line 64
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/net/URL;

    iput-object p1, p0, Lcom/google/common/io/Resources$UrlByteSource;->url:Ljava/net/URL;

    return-void
.end method

.method synthetic constructor <init>(Ljava/net/URL;Lcom/google/common/io/Resources$1;)V
    .registers 3

    .line 59
    invoke-direct {p0, p1}, Lcom/google/common/io/Resources$UrlByteSource;-><init>(Ljava/net/URL;)V

    return-void
.end method


# virtual methods
.method public openStream()Ljava/io/InputStream;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    iget-object p0, p0, Lcom/google/common/io/Resources$UrlByteSource;->url:Ljava/net/URL;

    invoke-virtual {p0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Resources.asByteSource("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/common/io/Resources$UrlByteSource;->url:Ljava/net/URL;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
