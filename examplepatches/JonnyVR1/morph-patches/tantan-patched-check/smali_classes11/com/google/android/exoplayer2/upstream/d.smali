.class public final Lcom/google/android/exoplayer2/upstream/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/Loader$e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/upstream/d$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer2/upstream/Loader$e;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:J

.field public final b:Lcom/google/android/exoplayer2/upstream/a;

.field public final c:I

.field public final d:Ll/p4g0;

.field public final e:Lcom/google/android/exoplayer2/upstream/d$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public volatile f:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/g6c;Landroid/net/Uri;ILcom/google/android/exoplayer2/upstream/d$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/g6c;",
            "Landroid/net/Uri;",
            "I",
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "+TT;>;)V"
        }
    .end annotation

    .line 24
    new-instance v0, Lcom/google/android/exoplayer2/upstream/a$b;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/upstream/a$b;-><init>()V

    .line 25
    invoke-virtual {v0, p2}, Lcom/google/android/exoplayer2/upstream/a$b;->i(Landroid/net/Uri;)Lcom/google/android/exoplayer2/upstream/a$b;

    move-result-object p2

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/google/android/exoplayer2/upstream/a$b;->b(I)Lcom/google/android/exoplayer2/upstream/a$b;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/android/exoplayer2/upstream/a$b;->a()Lcom/google/android/exoplayer2/upstream/a;

    move-result-object p2

    .line 26
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/upstream/d;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;ILcom/google/android/exoplayer2/upstream/d$a;)V

    return-void
.end method

.method public constructor <init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;ILcom/google/android/exoplayer2/upstream/d$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/g6c;",
            "Lcom/google/android/exoplayer2/upstream/a;",
            "I",
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "+TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/p4g0;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/p4g0;-><init>(Ll/g6c;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/d;->d:Ll/p4g0;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 12
    .line 13
    iput p3, p0, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 14
    .line 15
    iput-object p4, p0, Lcom/google/android/exoplayer2/upstream/d;->e:Lcom/google/android/exoplayer2/upstream/d$a;

    .line 16
    .line 17
    invoke-static {}, Ll/mtv;->a()J

    .line 18
    .line 19
    .line 20
    move-result-wide p1

    .line 21
    iput-wide p1, p0, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/upstream/d;->d:Ll/p4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/p4g0;->s()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/j6c;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/google/android/exoplayer2/upstream/d;->d:Ll/p4g0;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Ll/j6c;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;)V

    .line 13
    .line 14
    .line 15
    :try_start_0
    invoke-virtual {v0}, Ll/j6c;->m()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/google/android/exoplayer2/upstream/d;->d:Ll/p4g0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/p4g0;->d()Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Landroid/net/Uri;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/google/android/exoplayer2/upstream/d;->e:Lcom/google/android/exoplayer2/upstream/d$a;

    .line 31
    .line 32
    invoke-interface {v2, v1, v0}, Lcom/google/android/exoplayer2/upstream/d$a;->a(Landroid/net/Uri;Ljava/io/InputStream;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, p0, Lcom/google/android/exoplayer2/upstream/d;->f:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    invoke-static {v0}, Ll/bmk0;->n(Ljava/io/Closeable;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    invoke-static {v0}, Ll/bmk0;->n(Ljava/io/Closeable;)V

    .line 44
    .line 45
    .line 46
    throw p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/upstream/d;->d:Ll/p4g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p4g0;->j()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d()Ljava/util/Map;
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
    iget-object p0, p0, Lcom/google/android/exoplayer2/upstream/d;->d:Ll/p4g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p4g0;->r()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final e()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/upstream/d;->f:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/upstream/d;->d:Ll/p4g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p4g0;->q()Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
