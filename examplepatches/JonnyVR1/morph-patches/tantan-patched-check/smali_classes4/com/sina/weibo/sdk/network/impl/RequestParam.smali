.class public Lcom/sina/weibo/sdk/network/impl/RequestParam;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/sina/weibo/sdk/network/IRequestParam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;
    }
.end annotation


# static fields
.field public static final KEY_PARAM_BODY_BYTE_ARRAY:Ljava/lang/String; = "body_byte_array"


# instance fields
.field private appContext:Landroid/content/Context;

.field private byteArrays:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field private defaultHost:Z

.field private extraBundle:Landroid/os/Bundle;

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

.field private gZip:Z

.field private getBundle:Landroid/os/Bundle;

.field private headerBundle:Landroid/os/Bundle;

.field private interceptList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/sina/weibo/sdk/network/IRequestIntercept;",
            ">;"
        }
    .end annotation
.end field

.field private interceptResult:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private needIntercept:Z

.field private postBundle:Landroid/os/Bundle;

.field private requestTimeout:I

.field private requestType:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

.field private responseTimeout:I

.field private shortUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;)V
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
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->getBundle:Landroid/os/Bundle;

    .line 10
    .line 11
    new-instance v0, Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->postBundle:Landroid/os/Bundle;

    .line 17
    .line 18
    new-instance v0, Landroid/os/Bundle;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->headerBundle:Landroid/os/Bundle;

    .line 24
    .line 25
    new-instance v0, Landroid/os/Bundle;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->extraBundle:Landroid/os/Bundle;

    .line 31
    .line 32
    new-instance v0, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->files:Ljava/util/Map;

    .line 38
    .line 39
    new-instance v0, Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->byteArrays:Ljava/util/Map;

    .line 45
    .line 46
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->interceptList:Ljava/util/ArrayList;

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    iput-boolean v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->gZip:Z

    .line 55
    .line 56
    const/16 v0, 0x3a98

    .line 57
    .line 58
    iput v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->requestTimeout:I

    .line 59
    .line 60
    iput v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->responseTimeout:I

    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    iput-boolean v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->needIntercept:Z

    .line 64
    .line 65
    iget-object v0, p1, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->shortUrl:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->shortUrl:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->getBundle:Landroid/os/Bundle;

    .line 70
    .line 71
    iget-object v1, p1, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->getBundle:Landroid/os/Bundle;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->postBundle:Landroid/os/Bundle;

    .line 77
    .line 78
    iget-object v1, p1, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->postBundle:Landroid/os/Bundle;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p1, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->type:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->requestType:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 86
    .line 87
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->headerBundle:Landroid/os/Bundle;

    .line 88
    .line 89
    iget-object v1, p1, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->headerBundle:Landroid/os/Bundle;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->extraBundle:Landroid/os/Bundle;

    .line 95
    .line 96
    iget-object v1, p1, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->extraBundle:Landroid/os/Bundle;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 99
    .line 100
    .line 101
    iget-boolean v0, p1, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->defaultHost:Z

    .line 102
    .line 103
    iput-boolean v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->defaultHost:Z

    .line 104
    .line 105
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->files:Ljava/util/Map;

    .line 106
    .line 107
    invoke-static {p1}, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->access$000(Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;)Ljava/util/Map;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->byteArrays:Ljava/util/Map;

    .line 115
    .line 116
    invoke-static {p1}, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->access$100(Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;)Ljava/util/Map;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 121
    .line 122
    .line 123
    iget-boolean v0, p1, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->needIntercept:Z

    .line 124
    .line 125
    iput-boolean v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->needIntercept:Z

    .line 126
    .line 127
    iget-object v0, p1, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->appContext:Landroid/content/Context;

    .line 128
    .line 129
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->appContext:Landroid/content/Context;

    .line 130
    .line 131
    new-instance v0, Ljava/util/HashMap;

    .line 132
    .line 133
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 134
    .line 135
    .line 136
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->interceptResult:Ljava/util/HashMap;

    .line 137
    .line 138
    iget-object v0, p1, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->interceptList:Ljava/util/ArrayList;

    .line 139
    .line 140
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->interceptList:Ljava/util/ArrayList;

    .line 141
    .line 142
    iget-boolean v0, p1, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->gZip:Z

    .line 143
    .line 144
    iput-boolean v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->gZip:Z

    .line 145
    .line 146
    invoke-static {p1}, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->access$200(Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    iput v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->requestTimeout:I

    .line 151
    .line 152
    invoke-static {p1}, Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;->access$300(Lcom/sina/weibo/sdk/network/impl/RequestParam$Builder;)I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    iput p1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->responseTimeout:I

    .line 157
    .line 158
    return-void
.end method


# virtual methods
.method public addInterceptResult(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->interceptResult:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public byteArrays()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->byteArrays:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public files()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/sina/weibo/sdk/network/IRequestParam$ValuePart<",
            "Ljava/io/File;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->files:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->appContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExtraBundle()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->extraBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGetBundle()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->getBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeader()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->headerBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIntercept()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/sina/weibo/sdk/network/IRequestIntercept;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->interceptList:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInterceptResult(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->interceptResult:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMethod()Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->requestType:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPostBundle()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->postBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestTimeout()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->requestTimeout:I

    .line 2
    .line 3
    return p0
.end method

.method public getResponseTimeout()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->responseTimeout:I

    .line 2
    .line 3
    return p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->shortUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public needGzip()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public needIntercept()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->needIntercept:Z

    .line 2
    .line 3
    return p0
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->shortUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public useDefaultHost()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestParam;->defaultHost:Z

    .line 2
    .line 3
    return p0
.end method
