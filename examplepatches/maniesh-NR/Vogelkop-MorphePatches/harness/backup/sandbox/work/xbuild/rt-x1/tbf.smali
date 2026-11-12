.class public final Ltbf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:Lypm;

.field public c:I

.field public d:Lqwi;

.field public e:Ljava/util/List;

.field public f:Ljava/util/List;


# virtual methods
.method public final a()Lqwi;
    .registers 4

    iget-object v0, p0, Ltbf;->d:Lqwi;

    iget-object v0, v0, Lqwi;->a:Lnwi;

    sget-object v1, Lnwi;->b:Lnwi;

    if-ne v0, v1, :cond_36

    iget-object v0, p0, Ltbf;->b:Lypm;

    iget-object v1, v0, Lypm;->g:Lzg;

    if-nez v1, :cond_24

    new-instance v1, Lorg/chromium/url/GURL;

    iget-object v0, v0, Lypm;->e:Ljava/lang/String;

    invoke-direct {v1, v0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    new-instance v0, Lorg/chromium/url/GURL;

    iget-object v2, p0, Ltbf;->b:Lypm;

    iget-object v2, v2, Lypm;->a:Ljava/lang/String;

    invoke-direct {v0, v2}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lorg/chromium/url/GURL;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_36

    :cond_24
    new-instance p0, Lqwi;

    new-instance v0, Lhwi;

    new-instance v1, Liwi;

    invoke-direct {v1}, Liwi;-><init>()V

    sget-object v2, Lnwi;->c:Lnwi;

    invoke-direct {v0, v1, v2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, v2, v0}, Lqwi;-><init>(Lnwi;Lhwi;)V

    return-object p0

    :cond_36
    iget-object p0, p0, Ltbf;->d:Lqwi;

    return-object p0
.end method

.method public final b(J)Z
    .registers 5

    iget-wide v0, p0, Ltbf;->a:J

    and-long/2addr v0, p1

    const-wide/16 p0, 0x0

    cmp-long p0, v0, p0

    if-eqz p0, :cond_b

    const/4 p0, 0x1

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method
