.class public Ll/u8f0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u8f0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 5
    .line 6
    iput-object p2, p0, Ll/u8f0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/ubu;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u8f0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showFollow:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/RuntimeException;

    .line 8
    .line 9
    const-string v0, "This entrance should not request followData"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, p0, Ll/u8f0;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "subSource="

    .line 32
    .line 33
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/u8f0;->b:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    :goto_0
    move-object v6, p0

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    const/4 p0, 0x0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    const/4 v7, 0x0

    .line 50
    const-string v0, "following-suggested"

    .line 51
    .line 52
    const-string v2, "swipe-side-bar"

    .line 53
    .line 54
    const/16 v3, 0x64

    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    const/4 v5, 0x0

    .line 58
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->l5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/String;Z)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public b()Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/ubu;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u8f0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showHourlySuggested:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/RuntimeException;

    .line 8
    .line 9
    const-string v0, "This entrance should not request hourRankings"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

    .line 20
    .line 21
    sget v3, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->b:I

    .line 22
    .line 23
    iget-object v0, p0, Ll/u8f0;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v2, "subSource="

    .line 34
    .line 35
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/u8f0;->b:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    :goto_0
    move-object v6, p0

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    const/4 p0, 0x0

    .line 50
    goto :goto_0

    .line 51
    :goto_1
    const/4 v7, 0x0

    .line 52
    const-string v0, "hour-ranking-suggested"

    .line 53
    .line 54
    const-string v2, "swipe-side-bar"

    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    const/4 v5, 0x0

    .line 58
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->l5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/String;Z)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public c(Ll/ubu;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ubu;",
            ")",
            "Lrx/c<",
            "Ll/ubu;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/ubu;->t()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    iget-object v0, p0, Ll/u8f0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 11
    .line 12
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

    .line 13
    .line 14
    sget v4, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->b:I

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/ubu;->r()Lcom/p1/mobile/putong/data/Pagination;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    iget-object p1, p0, Ll/u8f0;->b:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    new-instance p1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v0, "subSource="

    .line 31
    .line 32
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/u8f0;->b:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    :goto_0
    move-object v6, p1

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    const/4 p1, 0x0

    .line 47
    goto :goto_0

    .line 48
    :goto_1
    invoke-virtual {p0}, Ll/u8f0;->e()Z

    .line 49
    .line 50
    .line 51
    move-result v7

    .line 52
    const-string v1, "suggested"

    .line 53
    .line 54
    const-string v3, "swipe-side-bar"

    .line 55
    .line 56
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->y5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/p1/mobile/putong/data/Pagination;Ljava/lang/String;Z)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_2
    :goto_2
    new-instance p0, Ll/ek20;

    .line 62
    .line 63
    invoke-direct {p0}, Ll/ek20;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public d()Lrx/c;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/ubu;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u8f0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 2
    .line 3
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

    .line 4
    .line 5
    sget v4, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->b:I

    .line 6
    .line 7
    iget-object v0, p0, Ll/u8f0;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "subSource="

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/u8f0;->b:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :goto_0
    move-object v7, v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    const/4 v0, 0x0

    .line 34
    goto :goto_0

    .line 35
    :goto_1
    invoke-virtual {p0}, Ll/u8f0;->e()Z

    .line 36
    .line 37
    .line 38
    move-result v8

    .line 39
    const-string v1, "suggested"

    .line 40
    .line 41
    const-string v3, "swipe-side-bar"

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    const/4 v6, 0x0

    .line 45
    invoke-static/range {v1 .. v8}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->l5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/String;Z)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public final e()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/p6s;->G0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public f(Ljava/util/List;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Ll/j7u;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/u8f0;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->I6(Ljava/util/List;Z)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
