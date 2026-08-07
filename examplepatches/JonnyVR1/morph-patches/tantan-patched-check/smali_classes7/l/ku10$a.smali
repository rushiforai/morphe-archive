.class public final Ll/ku10$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ku10;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Lokio/ByteString;

.field public b:Ll/e7y;

.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ku10$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ll/ku10$a;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/ku10;->f:Ll/e7y;

    .line 5
    .line 6
    iput-object v0, p0, Ll/ku10$a;->b:Ll/e7y;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/ku10$a;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p1}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/ku10$a;->a:Lokio/ByteString;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/ku10$b;->b(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$b;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/ku10$a;->d(Ll/ku10$b;)Ll/ku10$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ll/ku10$a;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/ku10$b;->c(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ll/ku10$b;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/ku10$a;->d(Ll/ku10$b;)Ll/ku10$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c(Ll/e0l;Ll/z1d0;)Ll/ku10$a;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/ku10$b;->a(Ll/e0l;Ll/z1d0;)Ll/ku10$b;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/ku10$a;->d(Ll/ku10$b;)Ll/ku10$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Ll/ku10$b;)Ll/ku10$a;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/ku10$a;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const-string p0, "part == null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public e()Ll/ku10;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ku10$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/ku10;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ku10$a;->a:Lokio/ByteString;

    .line 12
    .line 13
    iget-object v2, p0, Ll/ku10$a;->b:Ll/e7y;

    .line 14
    .line 15
    iget-object p0, p0, Ll/ku10$a;->c:Ljava/util/List;

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, p0}, Ll/ku10;-><init>(Lokio/ByteString;Ll/e7y;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    const-string p0, "Multipart body must have at least one part."

    .line 22
    .line 23
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public f(Ll/e7y;)Ll/ku10$a;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p1}, Ll/e7y;->e()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const-string v2, "multipart"

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iput-object p1, p0, Ll/ku10$a;->b:Ll/e7y;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const-string p0, "multipart != "

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_1
    const-string p0, "type == null"

    .line 26
    .line 27
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method
