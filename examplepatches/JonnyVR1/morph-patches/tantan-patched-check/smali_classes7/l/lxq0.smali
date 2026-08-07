.class public Ll/lxq0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:J

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:J

.field private k:J

.field private l:J

.field private m:I

.field private n:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lxq0;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public B(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lxq0;->n:I

    .line 2
    .line 3
    return-void
.end method

.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lxq0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/lxq0;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lxq0;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public d(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/lxq0;->e:J

    .line 2
    .line 3
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lxq0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public f()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/lxq0;->j:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public g(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lxq0;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public h(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/lxq0;->j:J

    .line 2
    .line 3
    return-void
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lxq0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public j()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/lxq0;->k:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public k(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lxq0;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public l(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/lxq0;->k:J

    .line 2
    .line 3
    return-void
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lxq0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public n()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/lxq0;->l:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public o(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lxq0;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public p(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/lxq0;->l:J

    .line 2
    .line 3
    return-void
.end method

.method public q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lxq0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public r(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lxq0;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public s()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lxq0;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public t(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lxq0;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "PowerStatsModel{offUpCount="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/lxq0;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", offDownCount="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ll/lxq0;->b:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", offPingCount="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/lxq0;->c:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", offPongCount="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Ll/lxq0;->d:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", offDuration="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-wide v1, p0, Ll/lxq0;->e:J

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", onUpCount="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Ll/lxq0;->f:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", onDownCount="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Ll/lxq0;->g:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", onPingCount="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Ll/lxq0;->h:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", onPongCount="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Ll/lxq0;->i:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", onDuration="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-wide v1, p0, Ll/lxq0;->j:J

    .line 99
    .line 100
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", startTime="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-wide v1, p0, Ll/lxq0;->k:J

    .line 109
    .line 110
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", endTime="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-wide v1, p0, Ll/lxq0;->l:J

    .line 119
    .line 120
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ", xmsfVc="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v1, p0, Ll/lxq0;->m:I

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, ", androidVc="

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget p0, p0, Ll/lxq0;->n:I

    .line 139
    .line 140
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const/16 p0, 0x7d

    .line 144
    .line 145
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    return-object p0
.end method

.method public u()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lxq0;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public v(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lxq0;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public w()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lxq0;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public x(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lxq0;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public y()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lxq0;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public z(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lxq0;->m:I

    .line 2
    .line 3
    return-void
.end method
