.class public Ll/ypd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lcom/google/gson/Gson;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/gson/GsonBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/gson/GsonBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/ypd;->a:Lcom/google/gson/Gson;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/x1d0$a;Ljava/io/File;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ypd;->c(Ljava/io/File;)Ll/ku10$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/ku10$a;->e()Ll/ku10;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Meta;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    return-object p0
.end method

.method public static c(Ljava/io/File;)Ll/ku10$a;
    .locals 2

    .line 1
    new-instance v0, Ll/ku10$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ku10$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/ku10;->j:Ll/e7y;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/ku10$a;->f(Ll/e7y;)Ll/ku10$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const-string v1, "multipart/form-data"

    .line 15
    .line 16
    invoke-static {v1}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/io/File;)Ll/z1d0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v1, "file"

    .line 25
    .line 26
    invoke-virtual {v0, v1, v1, p0}, Ll/ku10$a;->b(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ll/ku10$a;

    .line 27
    .line 28
    .line 29
    :cond_0
    return-object v0
.end method

.method public static d(Ljava/lang/String;Ljava/io/File;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Meta;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {}, Ll/msh0;->e()Ll/x4m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/msh0;->e()Ll/x4m;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ll/x4m;->getHeader()Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Ll/msh0;->e()Ll/x4m;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ll/x4m;->getHeader()Ljava/util/Map;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ljava/util/Map$Entry;

    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Ljava/lang/String;

    .line 60
    .line 61
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, v2, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    new-instance v0, Ll/wpd;

    .line 72
    .line 73
    invoke-direct {v0, p0, p1}, Ll/wpd;-><init>(Ll/x1d0$a;Ljava/io/File;)V

    .line 74
    .line 75
    .line 76
    new-instance p0, Ll/ti20;

    .line 77
    .line 78
    const/4 p1, 0x1

    .line 79
    invoke-direct {p0, v0, p1}, Ll/ti20;-><init>(Ll/pcj;Z)V

    .line 80
    .line 81
    .line 82
    new-instance p1, Ll/xpd;

    .line 83
    .line 84
    invoke-direct {p1}, Ll/xpd;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0
.end method
