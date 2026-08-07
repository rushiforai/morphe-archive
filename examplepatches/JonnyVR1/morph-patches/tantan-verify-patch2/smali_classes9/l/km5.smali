.class public Ll/km5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/p5m;


# instance fields
.field public final a:Ll/agd0;

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/agd0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/km5;->b:Lrx/subjects/a;

    .line 9
    .line 10
    iput-object p1, p0, Ll/km5;->a:Ll/agd0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Z)Ll/pf60;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/km5;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    new-instance p0, Ll/pf60;

    .line 10
    .line 11
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-direct {p0, p1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object p0, p0, Ll/km5;->a:Ll/agd0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/agd0;->p()Ll/o5m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/o5m;->f()Ll/isv;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/isv;->n()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v3, 0x0

    .line 32
    const/4 v4, 0x1

    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    if-le v1, v4, :cond_1

    .line 36
    .line 37
    add-int/lit8 p1, v1, -0x1

    .line 38
    .line 39
    if-lt v0, p1, :cond_1

    .line 40
    .line 41
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/wrv;->L()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    move v0, v3

    .line 50
    :cond_1
    sub-int/2addr v1, v4

    .line 51
    if-ge v0, v1, :cond_2

    .line 52
    .line 53
    move v3, v4

    .line 54
    :cond_2
    if-eqz v3, :cond_8

    .line 55
    .line 56
    add-int/2addr v0, v4

    .line 57
    invoke-virtual {p0, v0}, Ll/isv;->h(I)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    goto :goto_0

    .line 62
    :cond_3
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/wrv;->L()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_6

    .line 69
    .line 70
    if-le v1, v4, :cond_6

    .line 71
    .line 72
    if-ltz v0, :cond_4

    .line 73
    .line 74
    move v3, v4

    .line 75
    :cond_4
    sub-int/2addr v0, v4

    .line 76
    if-eqz v3, :cond_8

    .line 77
    .line 78
    if-gez v0, :cond_5

    .line 79
    .line 80
    add-int/lit8 v0, v1, -0x1

    .line 81
    .line 82
    :cond_5
    invoke-virtual {p0, v0}, Ll/isv;->h(I)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    goto :goto_0

    .line 87
    :cond_6
    if-lez v0, :cond_7

    .line 88
    .line 89
    move v3, v4

    .line 90
    :cond_7
    if-eqz v3, :cond_8

    .line 91
    .line 92
    sub-int/2addr v0, v4

    .line 93
    invoke-virtual {p0, v0}, Ll/isv;->h(I)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    :cond_8
    :goto_0
    new-instance p0, Ll/pf60;

    .line 98
    .line 99
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-direct {p0, p1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    return-object p0
.end method

.method public b(Z)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/km5;->g(Z)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Z)Ll/pf60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            "Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/km5;->g(Z)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/pf60;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-direct {p1, p0, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public d()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/km5;->e()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Ll/km5;->a:Ll/agd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/agd0;->p()Ll/o5m;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/o5m;->f()Ll/isv;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, v0}, Ll/isv;->m(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public e()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/km5;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/km5;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g(Z)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/km5;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-gez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    const/4 v2, 0x1

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    move p1, v2

    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 p1, -0x1

    .line 15
    :goto_0
    add-int/2addr v0, p1

    .line 16
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/wrv;->L()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_3

    .line 23
    .line 24
    iget-object p1, p0, Ll/km5;->a:Ll/agd0;

    .line 25
    .line 26
    if-gez v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/agd0;->p()Ll/o5m;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Ll/o5m;->f()Ll/isv;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/isv;->n()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    add-int/lit8 v0, p1, -0x1

    .line 41
    .line 42
    if-gez v0, :cond_4

    .line 43
    .line 44
    return-object v1

    .line 45
    :cond_2
    invoke-virtual {p1}, Ll/agd0;->p()Ll/o5m;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {p1}, Ll/o5m;->f()Ll/isv;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Ll/isv;->n()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-lt v0, p1, :cond_4

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    goto :goto_1

    .line 61
    :cond_3
    if-ltz v0, :cond_5

    .line 62
    .line 63
    iget-object p1, p0, Ll/km5;->a:Ll/agd0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/agd0;->p()Ll/o5m;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-interface {p1}, Ll/o5m;->f()Ll/isv;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Ll/isv;->n()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-lt v0, p1, :cond_4

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_4
    :goto_1
    iget-object p0, p0, Ll/km5;->a:Ll/agd0;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/agd0;->p()Ll/o5m;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0}, Ll/o5m;->f()Ll/isv;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0, v0}, Ll/isv;->h(I)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0

    .line 95
    :cond_5
    :goto_2
    return-object v1
.end method
