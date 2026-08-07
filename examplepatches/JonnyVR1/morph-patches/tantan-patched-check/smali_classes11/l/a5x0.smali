.class public final Ll/a5x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ll/d6x0;


# direct methods
.method public constructor <init>(Ll/d6x0;ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput p2, p0, Ll/a5x0;->a:I

    .line 2
    .line 3
    iput-object p3, p0, Ll/a5x0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/a5x0;->c:Ljava/lang/Object;

    .line 6
    .line 7
    iput-object p5, p0, Ll/a5x0;->d:Ljava/lang/Object;

    .line 8
    .line 9
    iput-object p6, p0, Ll/a5x0;->e:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p1, p0, Ll/a5x0;->f:Ll/d6x0;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/a5x0;->f:Ll/d6x0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/atx0;->A()Ll/ajx0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/mzx0;->m()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Ll/a5x0;->f:Ll/d6x0;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x6

    .line 18
    const-string v0, "Persisted config not initialized. Not logging error/warn"

    .line 19
    .line 20
    invoke-virtual {v2, p0, v0}, Ll/d6x0;->s(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {v2}, Ll/d6x0;->o(Ll/d6x0;)C

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    iget-object v1, p0, Ll/a5x0;->f:Ll/d6x0;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/yyx0;->a()Ll/ajr0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ll/ajr0;->S()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-object v2, p0, Ll/a5x0;->f:Ll/d6x0;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    const/16 v1, 0x43

    .line 45
    .line 46
    invoke-static {v2, v1}, Ll/d6x0;->u(Ll/d6x0;C)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/16 v1, 0x63

    .line 51
    .line 52
    invoke-static {v2, v1}, Ll/d6x0;->u(Ll/d6x0;C)V

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_0
    iget-object v1, p0, Ll/a5x0;->f:Ll/d6x0;

    .line 56
    .line 57
    invoke-static {v1}, Ll/d6x0;->x(Ll/d6x0;)J

    .line 58
    .line 59
    .line 60
    move-result-wide v1

    .line 61
    const-wide/16 v3, 0x0

    .line 62
    .line 63
    cmp-long v1, v1, v3

    .line 64
    .line 65
    if-gez v1, :cond_3

    .line 66
    .line 67
    iget-object v1, p0, Ll/a5x0;->f:Ll/d6x0;

    .line 68
    .line 69
    const-wide/32 v2, 0x19e10

    .line 70
    .line 71
    .line 72
    invoke-static {v1, v2, v3}, Ll/d6x0;->v(Ll/d6x0;J)V

    .line 73
    .line 74
    .line 75
    :cond_3
    const-string v1, "01VDIWEA?"

    .line 76
    .line 77
    iget v2, p0, Ll/a5x0;->a:I

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    iget-object v2, p0, Ll/a5x0;->f:Ll/d6x0;

    .line 84
    .line 85
    invoke-static {v2}, Ll/d6x0;->o(Ll/d6x0;)C

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    iget-object v3, p0, Ll/a5x0;->f:Ll/d6x0;

    .line 90
    .line 91
    invoke-static {v3}, Ll/d6x0;->x(Ll/d6x0;)J

    .line 92
    .line 93
    .line 94
    move-result-wide v3

    .line 95
    iget-object v5, p0, Ll/a5x0;->b:Ljava/lang/String;

    .line 96
    .line 97
    iget-object v6, p0, Ll/a5x0;->c:Ljava/lang/Object;

    .line 98
    .line 99
    iget-object v7, p0, Ll/a5x0;->d:Ljava/lang/Object;

    .line 100
    .line 101
    iget-object v8, p0, Ll/a5x0;->e:Ljava/lang/Object;

    .line 102
    .line 103
    const/4 v9, 0x1

    .line 104
    invoke-static {v9, v5, v6, v7, v8}, Ll/d6x0;->r(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    new-instance v6, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v7, "2"

    .line 111
    .line 112
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v1, ":"

    .line 125
    .line 126
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    const/16 v3, 0x400

    .line 141
    .line 142
    if-le v2, v3, :cond_4

    .line 143
    .line 144
    iget-object p0, p0, Ll/a5x0;->b:Ljava/lang/String;

    .line 145
    .line 146
    const/4 v1, 0x0

    .line 147
    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    :cond_4
    iget-object p0, v0, Ll/ajx0;->f:Ll/ymx0;

    .line 152
    .line 153
    if-eqz p0, :cond_5

    .line 154
    .line 155
    const-wide/16 v2, 0x1

    .line 156
    .line 157
    invoke-virtual {p0, v1, v2, v3}, Ll/ymx0;->b(Ljava/lang/String;J)V

    .line 158
    .line 159
    .line 160
    :cond_5
    return-void
.end method
