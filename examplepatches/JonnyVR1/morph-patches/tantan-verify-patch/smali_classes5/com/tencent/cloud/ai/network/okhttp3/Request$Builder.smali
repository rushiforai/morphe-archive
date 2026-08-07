.class public Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field public body:Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

.field public headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

.field public method:Ljava/lang/String;

.field public tags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public url:Lcom/tencent/cloud/ai/network/okhttp3/p;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->tags:Ljava/util/Map;

    const-string v0, "GET"

    .line 49
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method:Ljava/lang/String;

    .line 50
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/o$a;-><init>()V

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->tags:Ljava/util/Map;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/Request;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->url:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/Request;->b:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/Request;->d:Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 17
    .line 18
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->body:Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 19
    .line 20
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/Request;->e:Ljava/util/Map;

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/Request;->e:Ljava/util/Map;

    .line 32
    .line 33
    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->tags:Ljava/util/Map;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/Request;->c:Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a()Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p2, p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public build()Lcom/tencent/cloud/ai/network/okhttp3/Request;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->url:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/Request;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;)V

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    const-string p0, "url == null"

    .line 12
    .line 13
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public cacheControl(Lcom/tencent/cloud/ai/network/okhttp3/d;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/d;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "Cache-Control"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p0, v1, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public delete()Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 1

    .line 8
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->d:Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->delete(Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    move-result-object p0

    return-object p0
.end method

.method public delete(Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 1

    .line 1
    const-string v0, "DELETE"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public get()Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 2

    .line 1
    const-string v0, "GET"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public head()Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 2

    .line 1
    const-string v0, "HEAD"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p2, p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 13
    .line 14
    .line 15
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public headers(Lcom/tencent/cloud/ai/network/okhttp3/o;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a()Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 6
    .line 7
    return-object p0
.end method

.method public method(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_4

    .line 9
    .line 10
    const-string v1, "method "

    .line 11
    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/d;->a(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p0, " must not have a request body."

    .line 22
    .line 23
    invoke-static {v1, p1, p0}, Ll/v1d0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_1
    :goto_0
    if-nez p2, :cond_3

    .line 28
    .line 29
    const-string v2, "POST"

    .line 30
    .line 31
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-nez v2, :cond_2

    .line 36
    .line 37
    const-string v2, "PUT"

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_2

    .line 44
    .line 45
    const-string v2, "PATCH"

    .line 46
    .line 47
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_2

    .line 52
    .line 53
    const-string v2, "PROPPATCH"

    .line 54
    .line 55
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_2

    .line 60
    .line 61
    const-string v2, "REPORT"

    .line 62
    .line 63
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-nez v2, :cond_2

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    const-string p0, " must have a request body."

    .line 71
    .line 72
    invoke-static {v1, p1, p0}, Ll/v1d0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    return-object v0

    .line 76
    :cond_3
    :goto_1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method:Ljava/lang/String;

    .line 77
    .line 78
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->body:Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_4
    const-string p0, "method.length() == 0"

    .line 82
    .line 83
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-object v0

    .line 87
    :cond_5
    const-string p0, "method == null"

    .line 88
    .line 89
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-object v0
.end method

.method public patch(Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 1

    .line 1
    const-string v0, "PATCH"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public post(Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 1

    .line 1
    const-string v0, "POST"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public put(Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 1

    .line 1
    const-string v0, "PUT"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public removeHeader(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public tag(Ljava/lang/Class;Ljava/lang/Object;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "-TT;>;TT;)",
            "Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->tags:Ljava/util/Map;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->tags:Ljava/util/Map;

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->tags:Ljava/util/Map;

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    const-string p0, "type == null"

    .line 35
    .line 36
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return-object p0
.end method

.method public tag(Ljava/lang/Object;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 1

    .line 41
    const-class v0, Ljava/lang/Object;

    invoke-virtual {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->tag(Ljava/lang/Class;Ljava/lang/Object;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    move-result-object p0

    return-object p0
.end method

.method public url(Lcom/tencent/cloud/ai/network/okhttp3/p;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 78
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->url:Lcom/tencent/cloud/ai/network/okhttp3/p;

    return-object p0

    .line 79
    :cond_0
    const-string p0, "url == null"

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public url(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    const/4 v5, 0x0

    .line 5
    const/4 v6, 0x3

    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    const-string v4, "ws:"

    .line 9
    .line 10
    move-object v1, p1

    .line 11
    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x3

    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v1, "http:"

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v5, 0x0

    .line 30
    const/4 v6, 0x4

    .line 31
    const/4 v2, 0x1

    .line 32
    const/4 v3, 0x0

    .line 33
    const-string v4, "wss:"

    .line 34
    .line 35
    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    const/4 p1, 0x4

    .line 42
    invoke-virtual {v1, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v1, "https:"

    .line 47
    .line 48
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    move-object p1, v1

    .line 54
    :goto_0
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/p$a;

    .line 55
    .line 56
    invoke-direct {v1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/p$a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->url(Lcom/tencent/cloud/ai/network/okhttp3/p;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :cond_2
    const-string p0, "url == null"

    .line 73
    .line 74
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-object v0
.end method

.method public url(Ljava/net/URL;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;
    .locals 2

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 80
    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p1

    .line 81
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/p$a;

    invoke-direct {v1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;-><init>()V

    invoke-virtual {v1, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/p$a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a()Lcom/tencent/cloud/ai/network/okhttp3/p;

    move-result-object p1

    .line 82
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->url(Lcom/tencent/cloud/ai/network/okhttp3/p;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    move-result-object p0

    return-object p0

    .line 83
    :cond_0
    const-string p0, "url == null"

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    return-object v0
.end method
