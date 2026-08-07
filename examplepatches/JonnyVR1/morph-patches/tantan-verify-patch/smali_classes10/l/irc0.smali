.class public Ll/irc0;
.super Ll/tnc0;
.source "SourceFile"

# interfaces
.implements Ll/nrc0;


# instance fields
.field public d:Ll/umc0;

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/bzm;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/tnc0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/irc0;->e:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public e()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/irc0;->d:Ll/umc0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/umc0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/umc0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/irc0;->d:Ll/umc0;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/irc0;->e:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/irc0;->e:Ljava/util/List;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/smc0;->n()Ll/x250;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/irc0;->e:Ljava/util/List;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/smc0;->b()Ll/a10;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/irc0;->e:Ljava/util/List;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/smc0;->j()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/irc0;->e:Ljava/util/List;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/smc0;->l()Ll/hzq;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/irc0;->e:Ljava/util/List;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 64
    .line 65
    invoke-virtual {v1}, Ll/smc0;->k()Ll/t0q;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Ll/irc0;->d:Ll/umc0;

    .line 73
    .line 74
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 75
    .line 76
    iget-object v4, p0, Ll/irc0;->e:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/lit8 v5, v0, -0x1

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->f()Ll/yc60;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    move-object v7, p0

    .line 89
    invoke-virtual/range {v2 .. v7}, Ll/umc0;->d(Ll/smc0;Ljava/util/List;ILl/yc60;Ll/qy3;)Ll/umc0;

    .line 90
    .line 91
    .line 92
    iget-object p0, v7, Ll/irc0;->d:Ll/umc0;

    .line 93
    .line 94
    invoke-virtual {v7}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->f()Ll/yc60;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p0, v0}, Ll/umc0;->a(Ll/yc60;)Ll/ur4;

    .line 99
    .line 100
    .line 101
    iget-object p0, v7, Ll/irc0;->d:Ll/umc0;

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/umc0;->c()Ll/yc60;

    .line 104
    .line 105
    .line 106
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
    invoke-super {p0}, Ll/tnc0;->execute()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public recycle()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/irc0;->d:Ll/umc0;

    .line 8
    .line 9
    const/4 v5, 0x0

    .line 10
    const/4 v6, 0x0

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x0

    .line 14
    invoke-virtual/range {v1 .. v6}, Ll/umc0;->d(Ll/smc0;Ljava/util/List;ILl/yc60;Ll/qy3;)Ll/umc0;

    .line 15
    .line 16
    .line 17
    return-void
.end method
