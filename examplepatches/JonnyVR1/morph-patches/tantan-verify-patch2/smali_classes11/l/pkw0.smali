.class public final Ll/pkw0;
.super Ll/ikw0;
.source "SourceFile"


# instance fields
.field public a:Ll/fpw0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fpw0<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/fpw0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fpw0<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/okw0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ljava/net/HttpURLConnection;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 11
    sget-object v0, Ll/kkw0;->a:Ll/kkw0;

    sget-object v1, Ll/lkw0;->a:Ll/lkw0;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Ll/pkw0;-><init>(Ll/fpw0;Ll/fpw0;Ll/okw0;)V

    return-void
.end method

.method public constructor <init>(Ll/fpw0;Ll/fpw0;Ll/okw0;)V
    .locals 0
    .param p3    # Ll/okw0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fpw0<",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/fpw0<",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/okw0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/ikw0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pkw0;->a:Ll/fpw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/pkw0;->b:Ll/fpw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/pkw0;->c:Ll/okw0;

    .line 9
    .line 10
    return-void
.end method

.method public static B(Ljava/net/HttpURLConnection;)V
    .locals 0
    .param p0    # Ljava/net/HttpURLConnection;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/jkw0;->a()V

    .line 2
    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static synthetic m()Ljava/lang/Integer;
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    return-object v0
.end method

.method public static synthetic n()Ljava/lang/Integer;
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    return-object v0
.end method

.method public static synthetic q(I)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic t(I)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkw0;->d:Ljava/net/HttpURLConnection;

    .line 2
    .line 3
    invoke-static {p0}, Ll/pkw0;->B(Ljava/net/HttpURLConnection;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u()Ljava/net/HttpURLConnection;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pkw0;->a:Ll/fpw0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/fpw0;->zza()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/pkw0;->b:Ll/fpw0;

    .line 14
    .line 15
    invoke-interface {v1}, Ll/fpw0;->zza()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v0, v1}, Ll/jkw0;->b(II)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/pkw0;->c:Ll/okw0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    invoke-interface {v0}, Ll/okw0;->zza()Ljava/net/URLConnection;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/net/HttpURLConnection;

    .line 38
    .line 39
    iput-object v0, p0, Ll/pkw0;->d:Ljava/net/HttpURLConnection;

    .line 40
    .line 41
    return-object v0
.end method

.method public v(Ll/okw0;II)Ljava/net/HttpURLConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mkw0;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/mkw0;-><init>(I)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/pkw0;->a:Ll/fpw0;

    .line 7
    .line 8
    new-instance p2, Ll/nkw0;

    .line 9
    .line 10
    invoke-direct {p2, p3}, Ll/nkw0;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/pkw0;->b:Ll/fpw0;

    .line 14
    .line 15
    iput-object p1, p0, Ll/pkw0;->c:Ll/okw0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/pkw0;->u()Ljava/net/HttpURLConnection;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
