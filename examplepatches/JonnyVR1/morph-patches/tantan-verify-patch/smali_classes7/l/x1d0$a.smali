.class public Ll/x1d0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/x1d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ll/rnl;

.field public b:Ljava/lang/String;

.field public c:Ll/e0l$a;

.field public d:Ll/z1d0;

.field public e:Ljava/util/Map;
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


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    iput-object v0, p0, Ll/x1d0$a;->e:Ljava/util/Map;

    .line 49
    const-string v0, "GET"

    iput-object v0, p0, Ll/x1d0$a;->b:Ljava/lang/String;

    .line 50
    new-instance v0, Ll/e0l$a;

    invoke-direct {v0}, Ll/e0l$a;-><init>()V

    iput-object v0, p0, Ll/x1d0$a;->c:Ll/e0l$a;

    return-void
.end method

.method public constructor <init>(Ll/x1d0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 5
    .line 6
    iput-object v0, p0, Ll/x1d0$a;->e:Ljava/util/Map;

    .line 7
    .line 8
    iget-object v1, p1, Ll/x1d0;->a:Ll/rnl;

    .line 9
    .line 10
    iput-object v1, p0, Ll/x1d0$a;->a:Ll/rnl;

    .line 11
    .line 12
    iget-object v1, p1, Ll/x1d0;->b:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, p0, Ll/x1d0$a;->b:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p1, Ll/x1d0;->d:Ll/z1d0;

    .line 17
    .line 18
    iput-object v1, p0, Ll/x1d0$a;->d:Ll/z1d0;

    .line 19
    .line 20
    iget-object v1, p1, Ll/x1d0;->e:Ljava/util/Map;

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
    iget-object v1, p1, Ll/x1d0;->e:Ljava/util/Map;

    .line 32
    .line 33
    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    iput-object v0, p0, Ll/x1d0$a;->e:Ljava/util/Map;

    .line 37
    .line 38
    iget-object p1, p1, Ll/x1d0;->c:Ll/e0l;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/e0l;->h()Ll/e0l$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Ll/x1d0$a;->c:Ll/e0l$a;

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x1d0$a;->c:Ll/e0l$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/e0l$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/e0l$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b()Ll/x1d0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x1d0$a;->a:Ll/rnl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/x1d0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/x1d0;-><init>(Ll/x1d0$a;)V

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

.method public c(Ll/yx3;)Ll/x1d0$a;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/yx3;->toString()Ljava/lang/String;

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
    invoke-virtual {p0, v1}, Ll/x1d0$a;->n(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p0, v1, p1}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public d()Ll/x1d0$a;
    .locals 1

    .line 1
    sget-object v0, Ll/zlk0;->e:Ll/z1d0;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/x1d0$a;->e(Ll/z1d0;)Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e(Ll/z1d0;)Ll/x1d0$a;
    .locals 1

    .line 1
    const-string v0, "DELETE"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f()Ll/x1d0$a;
    .locals 2

    .line 1
    const-string v0, "GET"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public g()Ll/x1d0$a;
    .locals 2

    .line 1
    const-string v0, "HEAD"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x1d0$a;->c:Ll/e0l$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/e0l$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/e0l$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public i(Ll/e0l;)Ll/x1d0$a;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/e0l;->h()Ll/e0l$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/x1d0$a;->c:Ll/e0l$a;

    .line 6
    .line 7
    return-object p0
.end method

.method public j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;
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
    invoke-static {p1}, Ll/zml;->b(Ljava/lang/String;)Z

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
    invoke-static {p1}, Ll/zml;->e(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    const-string p0, " must have a request body."

    .line 37
    .line 38
    invoke-static {v1, p1, p0}, Ll/v1d0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-object v0

    .line 42
    :cond_3
    :goto_1
    iput-object p1, p0, Ll/x1d0$a;->b:Ljava/lang/String;

    .line 43
    .line 44
    iput-object p2, p0, Ll/x1d0$a;->d:Ll/z1d0;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_4
    const-string p0, "method.length() == 0"

    .line 48
    .line 49
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_5
    const-string p0, "method == null"

    .line 54
    .line 55
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-object v0
.end method

.method public k(Ll/z1d0;)Ll/x1d0$a;
    .locals 1

    .line 1
    const-string v0, "PATCH"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l(Ll/z1d0;)Ll/x1d0$a;
    .locals 1

    .line 1
    const-string v0, "POST"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m(Ll/z1d0;)Ll/x1d0$a;
    .locals 1

    .line 1
    const-string v0, "PUT"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Ljava/lang/String;)Ll/x1d0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x1d0$a;->c:Ll/e0l$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/e0l$a;->g(Ljava/lang/String;)Ll/e0l$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public o(Ljava/lang/Class;Ljava/lang/Object;)Ll/x1d0$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "-TT;>;TT;)",
            "Ll/x1d0$a;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Ll/x1d0$a;->e:Ljava/util/Map;

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
    iput-object v0, p0, Ll/x1d0$a;->e:Ljava/util/Map;

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Ll/x1d0$a;->e:Ljava/util/Map;

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

.method public p(Ljava/lang/Object;)Ll/x1d0$a;
    .locals 1

    .line 1
    const-class v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/x1d0$a;->o(Ljava/lang/Class;Ljava/lang/Object;)Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q(Ljava/lang/String;)Ll/x1d0$a;
    .locals 6

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    const/4 v5, 0x3

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    const-string v3, "ws:"

    .line 8
    .line 9
    move-object v0, p1

    .line 10
    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x3

    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "http:"

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v4, 0x0

    .line 29
    const/4 v5, 0x4

    .line 30
    const/4 v1, 0x1

    .line 31
    const/4 v2, 0x0

    .line 32
    const-string v3, "wss:"

    .line 33
    .line 34
    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    const/4 p1, 0x4

    .line 41
    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string v0, "https:"

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move-object p1, v0

    .line 53
    :goto_0
    invoke-static {p1}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0

    .line 62
    :cond_2
    const-string p0, "url == null"

    .line 63
    .line 64
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x0

    .line 68
    return-object p0
.end method

.method public r(Ljava/net/URL;)Ll/x1d0$a;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "url == null"

    .line 17
    .line 18
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public s(Ll/rnl;)Ll/x1d0$a;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/x1d0$a;->a:Ll/rnl;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "url == null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method
