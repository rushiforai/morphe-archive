.class public Ll/tnc0;
.super Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d()Ll/yc60;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public e()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v2, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/smc0;->n()Ll/x250;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/smc0;->b()Ll/a10;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/smc0;->j()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/smc0;->l()Ll/hzq;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/smc0;->k()Ll/t0q;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/umc0;

    .line 52
    .line 53
    invoke-direct {v0}, Ll/umc0;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 57
    .line 58
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    add-int/lit8 v3, v3, -0x1

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->f()Ll/yc60;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    move-object v5, p0

    .line 69
    invoke-virtual/range {v0 .. v5}, Ll/umc0;->d(Ll/smc0;Ljava/util/List;ILl/yc60;Ll/qy3;)Ll/umc0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->f()Ll/yc60;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {p0, v0}, Ll/ur4;->a(Ll/yc60;)Ll/ur4;

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public execute()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->execute()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
