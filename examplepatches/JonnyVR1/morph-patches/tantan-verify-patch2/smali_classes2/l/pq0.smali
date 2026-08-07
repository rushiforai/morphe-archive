.class public Ll/pq0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/jq0;

.field public b:Ll/fb5;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:I

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/jq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pq0;->a:Ll/jq0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/oq0;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ll/oq0;

    .line 3
    .line 4
    invoke-direct {v1, p0}, Ll/oq0;-><init>(Ll/pq0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    iget-object v2, p0, Ll/pq0;->b:Ll/fb5;

    .line 8
    .line 9
    invoke-static {v2}, Ll/fb5;->v(Ll/fb5;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/pq0;->b:Ll/fb5;

    .line 13
    .line 14
    iget-object v2, p0, Ll/pq0;->c:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v2}, Ll/fb5;->u(Ljava/lang/Iterable;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/pq0;->c:Ljava/util/List;

    .line 20
    .line 21
    return-object v1

    .line 22
    :catchall_0
    move-exception v1

    .line 23
    iget-object v2, p0, Ll/pq0;->b:Ll/fb5;

    .line 24
    .line 25
    invoke-static {v2}, Ll/fb5;->v(Ll/fb5;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/pq0;->b:Ll/fb5;

    .line 29
    .line 30
    iget-object v2, p0, Ll/pq0;->c:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {v2}, Ll/fb5;->u(Ljava/lang/Iterable;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/pq0;->c:Ljava/util/List;

    .line 36
    .line 37
    throw v1
.end method

.method public b()Ll/f33;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public c()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pq0;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/fb5;->n(Ljava/util/Collection;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/pq0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Ll/jq0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pq0;->a:Ll/jq0;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ll/fb5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pq0;->b:Ll/fb5;

    .line 2
    .line 3
    invoke-static {p0}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pq0;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/f33;)Ll/pq0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public i(Ljava/util/List;)Ll/pq0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;>;)",
            "Ll/pq0;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/fb5;->n(Ljava/util/Collection;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/pq0;->c:Ljava/util/List;

    .line 6
    .line 7
    return-object p0
.end method

.method public j(I)Ll/pq0;
    .locals 0

    .line 1
    iput p1, p0, Ll/pq0;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ll/fb5;)Ll/pq0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Ll/pq0;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/pq0;->b:Ll/fb5;

    .line 6
    .line 7
    return-object p0
.end method

.method public l(Ljava/lang/String;)Ll/pq0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pq0;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
