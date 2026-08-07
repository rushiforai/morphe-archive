.class public Ll/ckt;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ckt;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ckt;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Z
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
    iget-object v1, p0, Ll/ckt;->b:Ljava/lang/String;

    .line 2
    .line 3
    sget v3, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->b:I

    .line 4
    .line 5
    iget-object v0, p0, Ll/ckt;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "subSource="

    .line 16
    .line 17
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ll/ckt;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :goto_0
    move-object v6, v0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    goto :goto_0

    .line 33
    :goto_1
    invoke-virtual {p0}, Ll/ckt;->a()Z

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    const-string v0, "suggested"

    .line 38
    .line 39
    const-string v2, "swipe-in-room"

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    const/4 v5, 0x0

    .line 43
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->l5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/String;Z)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
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
    iget-object v2, p0, Ll/ckt;->b:Ljava/lang/String;

    .line 11
    .line 12
    sget v4, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->b:I

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/ubu;->r()Lcom/p1/mobile/putong/data/Pagination;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    iget-object p1, p0, Ll/ckt;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    new-instance p1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v0, "subSource="

    .line 29
    .line 30
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/ckt;->a:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    :goto_0
    move-object v6, p1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    const/4 p1, 0x0

    .line 45
    goto :goto_0

    .line 46
    :goto_1
    invoke-virtual {p0}, Ll/ckt;->a()Z

    .line 47
    .line 48
    .line 49
    move-result v7

    .line 50
    const-string v1, "suggested"

    .line 51
    .line 52
    const-string v3, "swipe-in-room"

    .line 53
    .line 54
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->y5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/p1/mobile/putong/data/Pagination;Ljava/lang/String;Z)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_2
    :goto_2
    new-instance p0, Ll/ek20;

    .line 60
    .line 61
    invoke-direct {p0}, Ll/ek20;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method
