.class public final La4g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public b:J


# direct methods
.method public constructor <init>(JLjava/util/List;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, La4g;->b:J

    iput-object p3, p0, La4g;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-wide v0, p0, La4g;->b:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_9

    return-void

    :cond_9
    invoke-static {v0, v1}, LJ/N;->MkPeAFAg(J)V

    iput-wide v2, p0, La4g;->b:J

    return-void
.end method

.method public final b(I)Lw3g;
    .registers 4

    iget-object p0, p0, La4g;->a:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p0

    new-instance v0, Lz3g;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1}, Lz3g;-><init>(BI)V

    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lw3g;

    return-object p0
.end method

.method public final c(Lw3g;)Ljava/lang/String;
    .registers 4

    iget-object v0, p0, La4g;->a:Ljava/util/List;

    invoke-static {v0, p1}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result p1

    iget-wide v0, p0, La4g;->b:J

    invoke-static {v0, v1, p1}, LJ/N;->M8Y4ibSv(JI)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method
