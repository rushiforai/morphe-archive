.class public final Ll/jfd0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/dw40;",
        "T:",
        "Ll/dum<",
        "TD;>;>",
        "Ll/qct<",
        "TD;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0018\u0000*\u0008\u0008\u0000\u0010\u0002*\u00020\u0001*\u000e\u0008\u0001\u0010\u0004*\u0008\u0012\u0004\u0012\u00028\u00000\u00032\u0008\u0012\u0004\u0012\u00028\u00000\u0005B\u001f\u0012\u0006\u0010\u0006\u001a\u00028\u0001\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\u000e\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fR\u0014\u0010\u0008\u001a\u00020\u00078\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0011R\u0014\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Ll/jfd0;",
        "Ll/dw40;",
        "D",
        "Ll/dum;",
        "T",
        "Ll/qct;",
        "info",
        "Ll/ljd0;",
        "roomPresenter",
        "Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;",
        "roomView",
        "<init>",
        "(Ll/dum;Ll/ljd0;Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V",
        "",
        "t",
        "()V",
        "i",
        "Ll/ljd0;",
        "j",
        "Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final i:Ll/ljd0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final j:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ll/ljd0;Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V
    .locals 0
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/ljd0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/ljd0;",
            "Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/jfd0;->i:Ll/ljd0;

    .line 14
    .line 15
    iput-object p3, p0, Ll/jfd0;->j:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public t()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "friends"

    .line 15
    .line 16
    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Ll/jfd0;->i:Ll/ljd0;

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    new-instance v0, Ll/eao;

    .line 32
    .line 33
    iget-object v2, p0, Ll/xzs;->e:Ll/dum;

    .line 34
    .line 35
    iget-object v3, p0, Ll/jfd0;->j:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 36
    .line 37
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->y:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 38
    .line 39
    invoke-direct {v0, v2, v3}, Ll/eao;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ll/i6t;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    new-instance v0, Ll/b2g0;

    .line 50
    .line 51
    iget-object v2, p0, Ll/xzs;->e:Ll/dum;

    .line 52
    .line 53
    iget-object v3, p0, Ll/jfd0;->j:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->x:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

    .line 56
    .line 57
    invoke-direct {v0, v2, v3}, Ll/b2g0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Ll/i6t;

    .line 65
    .line 66
    :goto_0
    iget-object v0, p0, Ll/jfd0;->i:Ll/ljd0;

    .line 67
    .line 68
    new-instance v1, Ll/kil;

    .line 69
    .line 70
    iget-object v2, p0, Ll/xzs;->e:Ll/dum;

    .line 71
    .line 72
    iget-object v3, p0, Ll/jfd0;->j:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 73
    .line 74
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->u:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;

    .line 75
    .line 76
    invoke-direct {v1, v2, v3}, Ll/kil;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/jfd0;->i:Ll/ljd0;

    .line 83
    .line 84
    new-instance v1, Ll/gil;

    .line 85
    .line 86
    iget-object v2, p0, Ll/xzs;->e:Ll/dum;

    .line 87
    .line 88
    iget-object v3, p0, Ll/jfd0;->j:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 89
    .line 90
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

    .line 91
    .line 92
    invoke-direct {v1, v2, v3}, Ll/gil;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 96
    .line 97
    .line 98
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Ll/vwt;->b7()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iget-object v1, p0, Ll/jfd0;->i:Ll/ljd0;

    .line 107
    .line 108
    if-eqz v0, :cond_1

    .line 109
    .line 110
    new-instance v0, Ll/rll;

    .line 111
    .line 112
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 113
    .line 114
    invoke-direct {v0, p0}, Ll/rll;-><init>(Ll/dum;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Ll/i6t;

    .line 122
    .line 123
    return-void

    .line 124
    :cond_1
    new-instance v0, Ll/lll;

    .line 125
    .line 126
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 127
    .line 128
    invoke-direct {v0, p0}, Ll/lll;-><init>(Ll/dum;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    check-cast p0, Ll/i6t;

    .line 136
    .line 137
    :cond_2
    return-void
.end method
