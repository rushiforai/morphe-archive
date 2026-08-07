.class public final Ll/p4g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6c;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/g6c;

.field public b:J

.field public c:Landroid/net/Uri;

.field public d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/g6c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/g6c;

    .line 9
    .line 10
    iput-object p1, p0, Ll/p4g0;->a:Ll/g6c;

    .line 11
    .line 12
    sget-object p1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 13
    .line 14
    iput-object p1, p0, Ll/p4g0;->c:Landroid/net/Uri;

    .line 15
    .line 16
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 17
    .line 18
    iput-object p1, p0, Ll/p4g0;->d:Ljava/util/Map;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p4g0;->a:Ll/g6c;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/g6c;->a()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p4g0;->a:Ll/g6c;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/g6c;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()Landroid/net/Uri;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p4g0;->a:Ll/g6c;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/g6c;->d()Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e(Ll/pgj0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/p4g0;->a:Ll/g6c;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/g6c;->e(Ll/pgj0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/p4g0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public n(Lcom/google/android/exoplayer2/upstream/a;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/google/android/exoplayer2/upstream/a;->a:Landroid/net/Uri;

    .line 2
    .line 3
    iput-object v0, p0, Ll/p4g0;->c:Landroid/net/Uri;

    .line 4
    .line 5
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 6
    .line 7
    iput-object v0, p0, Ll/p4g0;->d:Ljava/util/Map;

    .line 8
    .line 9
    iget-object v0, p0, Ll/p4g0;->a:Ll/g6c;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ll/g6c;->n(Lcom/google/android/exoplayer2/upstream/a;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-virtual {p0}, Ll/p4g0;->d()Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Landroid/net/Uri;

    .line 24
    .line 25
    iput-object p1, p0, Ll/p4g0;->c:Landroid/net/Uri;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/p4g0;->a()Ljava/util/Map;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/p4g0;->d:Ljava/util/Map;

    .line 32
    .line 33
    return-wide v0
.end method

.method public q()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p4g0;->c:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p4g0;->d:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public read([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/p4g0;->a:Ll/g6c;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2, p3}, Ll/e6c;->read([BII)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p2, -0x1

    .line 8
    if-eq p1, p2, :cond_0

    .line 9
    .line 10
    iget-wide p2, p0, Ll/p4g0;->b:J

    .line 11
    .line 12
    int-to-long v0, p1

    .line 13
    add-long/2addr p2, v0

    .line 14
    iput-wide p2, p0, Ll/p4g0;->b:J

    .line 15
    .line 16
    :cond_0
    return p1
.end method

.method public s()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/p4g0;->b:J

    .line 4
    .line 5
    return-void
.end method
