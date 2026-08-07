.class public Ll/hne0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hne0$a;
    }
.end annotation


# instance fields
.field public final a:Ll/uoe0;


# direct methods
.method public constructor <init>(Ll/hne0$a;)V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/hne0$a;->o(Ll/hne0$a;)Ll/uoe0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Ll/hne0$a;->o(Ll/hne0$a;)Ll/uoe0;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/hne0;->a:Ll/uoe0;

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {p1}, Ll/hne0$a;->k(Ll/hne0$a;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1}, Ll/hne0$a;->l(Ll/hne0$a;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {p1}, Ll/hne0$a;->q(Ll/hne0$a;)Ll/y20;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {p1}, Ll/hne0$a;->i(Ll/hne0$a;)Ll/y20;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-static {p1}, Ll/hne0$a;->e(Ll/hne0$a;)Ll/y20;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-static {p1}, Ll/hne0$a;->m(Ll/hne0$a;)Z

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    invoke-static {p1}, Ll/hne0$a;->n(Ll/hne0$a;)I

    .line 42
    .line 43
    .line 44
    move-result v6

    .line 45
    iget-object v7, p1, Ll/hne0$a;->a:Ljava/lang/String;

    .line 46
    .line 47
    const/4 v8, 0x0

    .line 48
    iget-object v9, p1, Ll/hne0$a;->m:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 49
    .line 50
    invoke-static/range {v0 .. v9}, Ll/uoe0;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILjava/lang/String;Ll/cqj;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/uoe0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Ll/hne0;->a:Ll/uoe0;

    .line 55
    .line 56
    invoke-static {p1}, Ll/hne0$a;->s(Ll/hne0$a;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iput-object p0, v0, Ll/uoe0;->u:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p1}, Ll/hne0$a;->r(Ll/hne0$a;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iput-object p0, v0, Ll/uoe0;->t:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p1}, Ll/hne0$a;->p(Ll/hne0$a;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iput-object p0, v0, Ll/uoe0;->A:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p1}, Ll/hne0$a;->h(Ll/hne0$a;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    iput-boolean p0, v0, Ll/uoe0;->C:Z

    .line 79
    .line 80
    invoke-static {p1}, Ll/hne0$a;->g(Ll/hne0$a;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    iput-boolean p0, v0, Ll/uoe0;->D:Z

    .line 85
    .line 86
    iget-object p0, p1, Ll/hne0$a;->p:Ljava/lang/String;

    .line 87
    .line 88
    iput-object p0, v0, Ll/uoe0;->k:Ljava/lang/String;

    .line 89
    .line 90
    iget-object p0, p1, Ll/hne0$a;->r:Ljava/lang/String;

    .line 91
    .line 92
    iput-object p0, v0, Ll/uoe0;->j:Ljava/lang/String;

    .line 93
    .line 94
    iget-object p0, p1, Ll/hne0$a;->v:Ljava/lang/String;

    .line 95
    .line 96
    iput-object p0, v0, Ll/uoe0;->M:Ljava/lang/String;

    .line 97
    .line 98
    iget-object p0, p1, Ll/hne0$a;->q:Ljava/lang/String;

    .line 99
    .line 100
    iput-object p0, v0, Ll/uoe0;->l:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {p1}, Ll/hne0$a;->f(Ll/hne0$a;)Ll/coj;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    if-eqz p0, :cond_1

    .line 107
    .line 108
    invoke-static {p1}, Ll/hne0$a;->j(Ll/hne0$a;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    if-eqz p0, :cond_1

    .line 113
    .line 114
    new-instance p0, Ll/cqj$a;

    .line 115
    .line 116
    invoke-direct {p0}, Ll/cqj$a;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-static {p1}, Ll/hne0$a;->f(Ll/hne0$a;)Ll/coj;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-static {p1}, Ll/hne0$a;->j(Ll/hne0$a;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {p0, v1, v2}, Ll/cqj$a;->e(Ll/coj;Ljava/lang/String;)Ll/cqj$a;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0}, Ll/cqj$a;->d()Ll/cqj;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    iput-object p0, v0, Ll/uoe0;->m:Ll/cqj;

    .line 136
    .line 137
    :cond_1
    iget-object p0, p1, Ll/hne0$a;->u:Ljava/lang/String;

    .line 138
    .line 139
    iput-object p0, v0, Ll/uoe0;->L:Ljava/lang/String;

    .line 140
    .line 141
    return-void
.end method
