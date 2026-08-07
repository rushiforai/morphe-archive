.class public Ll/oq0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/jq0;

.field public final b:I

.field public c:Ljava/lang/String;

.field public d:Ll/fb5;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/jq0;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ll/jq0;

    iput-object p1, p0, Ll/oq0;->a:Ll/jq0;

    const/4 p1, 0x0

    .line 46
    iput p1, p0, Ll/oq0;->b:I

    return-void
.end method

.method public constructor <init>(Ll/pq0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/pq0;->e()Ll/jq0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/jq0;

    .line 13
    .line 14
    iput-object v0, p0, Ll/oq0;->a:Ll/jq0;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/pq0;->d()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Ll/oq0;->b:I

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/pq0;->f()Ll/fb5;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/oq0;->d:Ll/fb5;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/pq0;->c()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/oq0;->e:Ljava/util/List;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/pq0;->b()Ll/f33;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ll/pq0;->g()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Ll/oq0;->c:Ljava/lang/String;

    .line 42
    .line 43
    return-void
.end method

.method public static b(Ll/jq0;)Ll/oq0;
    .locals 1

    .line 1
    new-instance v0, Ll/oq0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/oq0;-><init>(Ll/jq0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static f(Ll/jq0;)Ll/pq0;
    .locals 1

    .line 1
    new-instance v0, Ll/pq0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pq0;-><init>(Ll/jq0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public declared-synchronized a()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/oq0;->d:Ll/fb5;

    .line 3
    .line 4
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/oq0;->d:Ll/fb5;

    .line 9
    .line 10
    iget-object v1, p0, Ll/oq0;->e:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {v1}, Ll/fb5;->u(Ljava/lang/Iterable;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/oq0;->e:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw v0
.end method

.method public c()Ll/f33;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d()Ll/jq0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oq0;->a:Ll/jq0;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oq0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
