.class public Ll/jx5$a;
.super Ll/gxl$g;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jx5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic c:Ll/jx5;


# direct methods
.method public constructor <init>(Ll/jx5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gxl$g;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c(IILl/gxl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Ll/jx5;->K(IILl/gxl;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 7
    .line 8
    invoke-static {p1}, Ll/jx5;->f(Ll/jx5;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object v0, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-static {v0}, Ll/jx5;->e(Ll/jx5;)Ll/smc0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "change state failed, because is force stop"

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-static {v0}, Ll/jx5;->g(Ll/jx5;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 45
    .line 46
    invoke-static {p0}, Ll/jx5;->e(Ll/jx5;)Ll/smc0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "change state failed, because is stop"

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    const/4 p1, 0x4

    .line 61
    if-ne p2, p1, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 64
    .line 65
    invoke-static {v0, p1}, Ll/jx5;->o(Ll/jx5;I)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 69
    .line 70
    invoke-static {p0}, Ll/jx5;->h(Ll/jx5;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    const/4 p1, 0x6

    .line 75
    if-ne p2, p1, :cond_3

    .line 76
    .line 77
    iget-object p1, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 78
    .line 79
    invoke-static {p1}, Ll/jx5;->n(Ll/jx5;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 83
    .line 84
    invoke-static {p0}, Ll/jx5;->p(Ll/jx5;)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    const/4 p1, 0x7

    .line 89
    if-ne p2, p1, :cond_4

    .line 90
    .line 91
    iget-object p0, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 92
    .line 93
    invoke-static {p0, p2}, Ll/jx5;->i(Ll/jx5;I)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    const/4 p1, 0x5

    .line 98
    if-ne p2, p1, :cond_5

    .line 99
    .line 100
    iget-object p1, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 101
    .line 102
    invoke-static {p1}, Ll/jx5;->q(Ll/jx5;)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 106
    .line 107
    invoke-static {p0}, Ll/jx5;->h(Ll/jx5;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_5
    const/16 p1, 0xc

    .line 112
    .line 113
    if-ne p2, p1, :cond_6

    .line 114
    .line 115
    iget-object p0, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 116
    .line 117
    invoke-static {p0, p2}, Ll/jx5;->i(Ll/jx5;I)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_6
    const/16 p1, 0xd

    .line 122
    .line 123
    if-ne p2, p1, :cond_7

    .line 124
    .line 125
    iget-object p1, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 126
    .line 127
    invoke-static {p1}, Ll/jx5;->e(Ll/jx5;)Ll/smc0;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p1}, Ll/smc0;->i()Ll/ixl;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    new-instance v0, Ljava/util/concurrent/TimeoutException;

    .line 136
    .line 137
    const-string v1, "keep alive time out"

    .line 138
    .line 139
    invoke-direct {v0, v1}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1, v0}, Ll/ixl;->a(Ljava/lang/Throwable;)V

    .line 143
    .line 144
    .line 145
    iget-object p0, p0, Ll/jx5$a;->c:Ll/jx5;

    .line 146
    .line 147
    invoke-static {p0, p2}, Ll/jx5;->i(Ll/jx5;I)V

    .line 148
    .line 149
    .line 150
    :cond_7
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p3}, Ll/gxl;->c()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string p1, ",currentState="

    .line 163
    .line 164
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    const-string p1, "[live]long_link_status"

    .line 175
    .line 176
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    return-void
.end method
