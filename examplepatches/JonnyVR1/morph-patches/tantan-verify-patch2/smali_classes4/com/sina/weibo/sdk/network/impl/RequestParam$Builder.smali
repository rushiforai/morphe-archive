.class public final Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sina/weibo/sdk/network/impl/RequestParam;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field appContext:Landroid/content/Context;

.field private byteArrays:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field defaultHost:Z

.field extraBundle:Landroid/os/Bundle;

.field private files:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/sina/weibo/sdk/network/IRequestParam$ValuePart<",
            "Ljava/io/File;",
            ">;>;"
        }
    .end annotation
.end field

.field gZip:Z

.field getBundle:Landroid/os/Bundle;

.field headerBundle:Landroid/os/Bundle;

.field interceptList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/sina/weibo/sdk/network/IRequestIntercept;",
            ">;"
        }
    .end annotation
.end field

.field needIntercept:Z

.field postBundle:Landroid/os/Bundle;

.field private requestTimeout:I

.field private responseTimeout:I

.field shortUrl:Ljava/lang/String;

.field type:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Bundle;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->getBundle:Landroid/os/Bundle;

    .line 10
    .line 11
    new-instance v0, Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->postBundle:Landroid/os/Bundle;

    .line 17
    .line 18
    new-instance v0, Landroid/os/Bundle;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->extraBundle:Landroid/os/Bundle;

    .line 24
    .line 25
    sget-object v0, Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;->POST:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->type:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 28
    .line 29
    new-instance v0, Landroid/os/Bundle;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->headerBundle:Landroid/os/Bundle;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->defaultHost:Z

    .line 38
    .line 39
    new-instance v1, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->interceptList:Ljava/util/ArrayList;

    .line 45
    .line 46
    new-instance v1, Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->files:Ljava/util/Map;

    .line 52
    .line 53
    new-instance v1, Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->byteArrays:Ljava/util/Map;

    .line 59
    .line 60
    iput-boolean v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->needIntercept:Z

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    iput-boolean v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->gZip:Z

    .line 64
    .line 65
    const/16 v0, 0x3a98

    .line 66
    .line 67
    iput v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->requestTimeout:I

    .line 68
    .line 69
    iput v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->responseTimeout:I

    .line 70
    .line 71
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->appContext:Landroid/content/Context;

    .line 72
    .line 73
    return-void
.end method

.method public static synthetic access$000(Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->files:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->byteArrays:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->requestTimeout:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->responseTimeout:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public addBodyParam(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;
    .locals 1

    .line 1
    new-instance v0, Lcom/sina/weibo/sdk/network/IRequestParam$ValuePart;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/sina/weibo/sdk/network/IRequestParam$ValuePart;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, v0, Lcom/sina/weibo/sdk/network/IRequestParam$ValuePart;->value:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p3, v0, Lcom/sina/weibo/sdk/network/IRequestParam$ValuePart;->mimeType:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p2, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->files:Ljava/util/Map;

    .line 11
    .line 12
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public addBodyParam(Ljava/lang/String;[B)Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->byteArrays:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public addBodyParam([B)V
    .locals 1

    .line 16
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->postBundle:Landroid/os/Bundle;

    const-string v0, "body_byte_array"

    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    return-void
.end method

.method public addExtParam(Landroid/os/Bundle;)V
    .locals 0

    .line 9
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->extraBundle:Landroid/os/Bundle;

    invoke-virtual {p0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    return-void
.end method

.method public addExtParam(Ljava/lang/String;I)V
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->extraBundle:Landroid/os/Bundle;

    invoke-virtual {p0, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public addExtParam(Ljava/lang/String;J)V
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->extraBundle:Landroid/os/Bundle;

    invoke-virtual {p0, p1, p2, p3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public addExtParam(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->extraBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addGetParam(Landroid/os/Bundle;)V
    .locals 0

    .line 9
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->getBundle:Landroid/os/Bundle;

    invoke-virtual {p0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    return-void
.end method

.method public addGetParam(Ljava/lang/String;I)V
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->getBundle:Landroid/os/Bundle;

    invoke-virtual {p0, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public addGetParam(Ljava/lang/String;J)V
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->getBundle:Landroid/os/Bundle;

    invoke-virtual {p0, p1, p2, p3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public addGetParam(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->getBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->headerBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addIntercept(Lcom/sina/weibo/sdk/network/IRequestIntercept;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->interceptList:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addPostParam(Landroid/os/Bundle;)V
    .locals 0

    .line 9
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->postBundle:Landroid/os/Bundle;

    invoke-virtual {p0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    return-void
.end method

.method public addPostParam(Ljava/lang/String;I)V
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->postBundle:Landroid/os/Bundle;

    invoke-virtual {p0, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public addPostParam(Ljava/lang/String;J)V
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->postBundle:Landroid/os/Bundle;

    invoke-virtual {p0, p1, p2, p3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public addPostParam(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->postBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public build()Lcom/sina/weibo/sdk/network/impl/RequestParam;
    .locals 1

    .line 1
    new-instance v0, Lcom/sina/weibo/sdk/network/impl/RequestParam;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/sina/weibo/sdk/network/impl/RequestParam;-><init>(Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public defaultHostEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->defaultHost:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNeedIntercept(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->needIntercept:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRequestTimeout(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->requestTimeout:I

    .line 2
    .line 3
    return-void
.end method

.method public setRequestType(Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->type:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 2
    .line 3
    return-void
.end method

.method public setResponseTimeout(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->responseTimeout:I

    .line 2
    .line 3
    return-void
.end method

.method public setShortUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->shortUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setgZip(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->gZip:Z

    .line 2
    .line 3
    return-void
.end method
