.class Lcom/immomo/momomediaext/MMLiveSource$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/drl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/MMLiveSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveSource;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource$f;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()I
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "getError: mOutErrorCode="

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveSource$f;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 13
    .line 14
    invoke-static {v2}, Lcom/immomo/momomediaext/MMLiveSource;->o(Lcom/immomo/momomediaext/MMLiveSource;)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ";mErrorCode="

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveSource$f;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 27
    .line 28
    invoke-static {v2}, Lcom/immomo/momomediaext/MMLiveSource;->g(Lcom/immomo/momomediaext/MMLiveSource;)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "pip->PIPLINE2"

    .line 40
    .line 41
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$f;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->o(Lcom/immomo/momomediaext/MMLiveSource;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource$f;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 51
    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveSource;->g(Lcom/immomo/momomediaext/MMLiveSource;)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0

    .line 59
    :cond_0
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveSource;->o(Lcom/immomo/momomediaext/MMLiveSource;)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0
.end method

.method public b()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$f;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->j(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource$f;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveSource;->m(Lcom/immomo/momomediaext/MMLiveSource;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveSource;->j(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/NetUtil;->a()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p0, v0}, Lcom/immomo/momomediaext/MMLiveSource;->n(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "0.0.0.0"

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$f;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->j(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource$f;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveSource;->k(Lcom/immomo/momomediaext/MMLiveSource;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveSource;->j(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/NetUtil;->d()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const-string v0, "wifi"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string v0, "other"

    .line 30
    .line 31
    :goto_0
    invoke-static {p0, v0}, Lcom/immomo/momomediaext/MMLiveSource;->l(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public getPushType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "1"

    .line 2
    .line 3
    return-object p0
.end method
