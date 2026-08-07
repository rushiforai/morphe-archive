.class public abstract Ll/o45;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/Loader$e;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:J

.field public final b:Lcom/google/android/exoplayer2/upstream/a;

.field public final c:I

.field public final d:Lcom/google/android/exoplayer2/k;

.field public final e:I

.field public final f:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final g:J

.field public final h:J

.field public final i:Ll/p4g0;


# direct methods
.method public constructor <init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;ILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V
    .locals 1
    .param p6    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

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
    iput-object v0, p0, Ll/o45;->i:Ll/p4g0;

    .line 10
    .line 11
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/google/android/exoplayer2/upstream/a;

    .line 16
    .line 17
    iput-object p1, p0, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 18
    .line 19
    iput p3, p0, Ll/o45;->c:I

    .line 20
    .line 21
    iput-object p4, p0, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 22
    .line 23
    iput p5, p0, Ll/o45;->e:I

    .line 24
    .line 25
    iput-object p6, p0, Ll/o45;->f:Ljava/lang/Object;

    .line 26
    .line 27
    iput-wide p7, p0, Ll/o45;->g:J

    .line 28
    .line 29
    iput-wide p9, p0, Ll/o45;->h:J

    .line 30
    .line 31
    invoke-static {}, Ll/mtv;->a()J

    .line 32
    .line 33
    .line 34
    move-result-wide p1

    .line 35
    iput-wide p1, p0, Ll/o45;->a:J

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public final b()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/o45;->i:Ll/p4g0;

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

.method public final d()J
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/o45;->h:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/o45;->g:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    return-wide v0
.end method

.method public final e()Ljava/util/Map;
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
    iget-object p0, p0, Ll/o45;->i:Ll/p4g0;

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

.method public final f()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o45;->i:Ll/p4g0;

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
