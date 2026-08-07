.class public Ll/t1d0$b;
.super Ll/t1d0;
.source "SourceFile"

# interfaces
.implements Ll/l4c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/t1d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final i:Ll/ske0$a;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method public constructor <init>(JLcom/google/android/exoplayer2/k;Ljava/util/List;Ll/ske0$a;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 10
    .param p6    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/google/android/exoplayer2/k;",
            "Ljava/util/List<",
            "Ll/fs2;",
            ">;",
            "Ll/ske0$a;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v9, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-wide v1, p1

    .line 4
    move-object v3, p3

    .line 5
    move-object v4, p4

    .line 6
    move-object v5, p5

    .line 7
    move-object/from16 v6, p6

    .line 8
    .line 9
    move-object/from16 v7, p7

    .line 10
    .line 11
    move-object/from16 v8, p8

    .line 12
    .line 13
    invoke-direct/range {v0 .. v9}, Ll/t1d0;-><init>(JLcom/google/android/exoplayer2/k;Ljava/util/List;Ll/ske0;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ll/t1d0$a;)V

    .line 14
    .line 15
    .line 16
    iput-object p5, p0, Ll/t1d0$b;->i:Ll/ske0$a;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b()Ll/l4c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public c(J)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t1d0$b;->i:Ll/ske0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ske0$a;->j(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public d(JJ)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t1d0$b;->i:Ll/ske0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ske0$a;->h(JJ)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public e(JJ)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t1d0$b;->i:Ll/ske0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ske0$a;->d(JJ)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public f(JJ)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t1d0$b;->i:Ll/ske0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ske0$a;->f(JJ)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public g(JJ)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t1d0$b;->i:Ll/ske0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ske0$a;->i(JJ)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public h(J)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t1d0$b;->i:Ll/ske0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ske0$a;->g(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public i()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/t1d0$b;->i:Ll/ske0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ske0$a;->e()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public j(J)Ll/mkc0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t1d0$b;->i:Ll/ske0$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1, p2}, Ll/ske0$a;->k(Ll/t1d0;J)Ll/mkc0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t1d0$b;->i:Ll/ske0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ske0$a;->l()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l(JJ)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t1d0$b;->i:Ll/ske0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ske0$a;->c(JJ)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public m()Ll/mkc0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
