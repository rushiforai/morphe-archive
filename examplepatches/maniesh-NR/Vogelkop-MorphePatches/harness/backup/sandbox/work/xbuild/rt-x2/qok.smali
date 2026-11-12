.class public final Lqok;
.super Lhq8;
.source "SourceFile"


# instance fields
.field public final e:Look;

.field public final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Look;)V
    .registers 3

    invoke-direct {p0}, Lhq8;-><init>()V

    iput-object p1, p0, Lqok;->e:Look;

    sget-object v0, Lf8a;->d:Lf8a;

    iget-object p1, p1, Look;->b:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lqok;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lqok;->f:Ljava/lang/String;

    return-object p0
.end method

.method public final e()J
    .registers 3

    iget-object p0, p0, Lqok;->e:Look;

    invoke-virtual {p0}, Look;->hashCode()I

    move-result p0

    int-to-long v0, p0

    return-wide v0
.end method

.method public final f()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lqok;->e:Look;

    iget-object p0, p0, Look;->i:Ljava/lang/String;

    return-object p0
.end method

.method public final g()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lqok;->e:Look;

    iget-object p0, p0, Look;->g:Ljava/lang/String;

    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lqok;->e:Look;

    iget-object p0, p0, Look;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final i(Lp6l;)Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lqok;->e:Look;

    iget-object p0, p0, Look;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final q(Ljava/lang/String;)V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method
